
/**
 * 创建图片对象
 * @param {File} file - 图片文件
 * @returns {Promise<HTMLImageElement>} - 图片对象
 */
function createImage(file) {
    return new Promise((resolve, reject) => {
        const img = new Image();
        img.onload = () => resolve(img);
        img.onerror = reject;
        img.src = URL.createObjectURL(file);
    });
}

/**
 * 检查图片是否包含透明度
 * @param {HTMLImageElement} img - 图片对象
 * @returns {Promise<boolean>} - 是否包含透明度
 */
function checkImageHasAlpha(img) {
    return new Promise((resolve) => {
        const canvas = document.createElement('canvas');
        canvas.width = img.width;
        canvas.height = img.height;
        const ctx = canvas.getContext('2d');

        ctx.drawImage(img, 0, 0);

        // 获取图像数据
        const imageData = ctx.getImageData(0, 0, canvas.width, canvas.height);
        const data = imageData.data;

        // 检查是否有像素的alpha通道值小于255（即透明）
        for (let i = 3; i < data.length; i += 4) {
            if (data[i] < 255) {
                resolve(true);
                return;
            }
        }

        resolve(false);
    });
}

/**
 * @param {string} mimeType - 目标MIME类型
 * @param {number} originalSize - 原始文件大小（字节）
 * @param {number} maxSize - 最大允许大小（字节）
 * @param {Function} onProgress - 进度回调函数
 * @returns {Promise<Blob>} - 压缩后的Blob对象
 */
function compressWithBinarySearch(canvas, mimeType, originalSize, maxSize, onProgress) {
    return new Promise((resolve) => {
        let minQuality = 0.1;
        let maxQuality = 1.0;
        let bestBlob = null;
        let bestSize = originalSize;

        // 最多尝试10次，平衡效率和精度
        const maxIterations = 10;
        let iterations = 0;

        function updateProgress(currentIteration) {
            if (onProgress) {
                const progress = Math.round((currentIteration / maxIterations) * 100);
                onProgress(progress);
            }
        }

        function compress(quality) {
            canvas.toBlob(
                (blob) => {
                    iterations++;
                    updateProgress(iterations);

                    if (!blob) {
                        // 如果转换失败，使用默认质量
                        canvas.toBlob(resolve, mimeType, 0.5);
                        return;
                    }

                    const blobSize = blob.size;

                    // 更新最佳结果
                    if (blobSize < bestSize) {
                        bestBlob = blob;
                        bestSize = blobSize;
                    }

                    // 检查是否符合条件或达到最大迭代次数
                    if (blobSize <= maxSize || iterations >= maxIterations || maxQuality - minQuality < 0.01) {
                        resolve(bestBlob);
                        return;
                    }

                    // 二分调整质量
                    if (blobSize > maxSize) {
                        // 压缩后仍太大，降低质量
                        maxQuality = quality;
                    } else {
                        // 压缩后符合要求，尝试提高质量以获得更好效果
                        minQuality = quality;
                    }

                    // 下一次尝试的质量
                    const nextQuality = (minQuality + maxQuality) / 2;
                    compress(nextQuality);
                },
                mimeType,
                quality
            );
        }

        // 开始压缩
        compress(0.8);
    });
}

/**
 * @param {File} file - 上传的图片文件
 * @param {Object} options - 压缩选项
 * @param {number} options.maxSize - 最大允许大小（字节），默认400KB
 * @param {number} options.initialQuality - 初始压缩质量（0-1），默认0.7
 * @param {Function} options.onProgress - 进度回调函数
 * @returns {Promise<File>} - 压缩后的图片文件
 */
export async function compressImage(file, options = {}) {
    const {
        maxSize = 300 * 1024,
        initialQuality = 0.7,
        onProgress
    } = options;

    // 如果文件已经小于等于最大尺寸，直接返回
    if (file.size <= maxSize) {
        return file;
    }

    // 创建图片对象
    const img = await createImage(file);

    // 创建canvas并绘制图片
    const canvas = document.createElement('canvas');
    const ctx = canvas.getContext('2d');

    // 设置canvas尺寸，保持原始宽高比
    canvas.width = img.width;
    canvas.height = img.height;
    ctx.drawImage(img, 0, 0, canvas.width, canvas.height);

    // 根据文件类型选择压缩策略
    const fileType = file.type;
    let compressedBlob;

    if (fileType === 'image/png') {
        // PNG处理：检查是否有透明度，决定压缩策略
        const hasAlpha = await checkImageHasAlpha(img);

        if (hasAlpha) {
            // 有透明度的PNG：使用PNG压缩，但可能效果有限
            compressedBlob = await compressWithBinarySearch(canvas, 'image/png', file.size, maxSize, onProgress);
        } else {
            // 无透明度的PNG：转换为JPEG压缩，效果更好
            compressedBlob = await compressWithBinarySearch(canvas, 'image/jpeg', file.size, maxSize, onProgress);
        }
    } else {
        // 其他格式（如JPEG、WebP等）直接压缩
        compressedBlob = await compressWithBinarySearch(canvas, fileType, file.size, maxSize, onProgress);
    }

    // 将Blob转换为File对象
    return new File([compressedBlob], file.name, {
        type: compressedBlob.type,
        lastModified: file.lastModified
    });
}

// 默认导出
export default compressImage;