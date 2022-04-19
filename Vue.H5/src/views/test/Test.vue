<template>
  <div>
    <van-uploader v-model="files"
                  :multiple="multiple"
                  :before-delete="beforeDelete"
                  :max-count="maxCount"
                  :max-size="maxSize*1024*1024"
                  @oversize="onOversize"
                  :before-read="beforeRead">
    </van-uploader>
    {{bf}}
    <br>
    {{af}}
  </div>
</template>
<script>
import { Uploader } from 'vant';

export default {
  components: {
    'van-uploader': Uploader
  },
  props: {
    fileList: {
      type: Array,
      default: () => {
        return []
        // return [{ url: "Upload/Tables/App_Expert/202012061051583421/1111s.jpg" }]
      }
    },
    multiple: { //是否多图上传
      type: Boolean,
      default: true
    },
    maxCount: { //文件数量
      type: Number,
      default: 10
    },
    maxSize: {//文件大小
      type: Number,
      default: 5
    },
    url: ""
  },
  data () {
    return {
      bf: "",
      af: "",
      inited: false,
      files: []
    };
  },
  created () {
    this.files.push(...   this.fileList.map(x => {
      return { url: this.getUrl(x.url) }
    }))
  },
  watch: {
    files (newVal) {
      if (!this.inited) {
        this.inited = true;
        return;
      }
      this.fileList.splice(0);
      this.fileList.push(... this.files.map(x => {
        return { url: x.url.replace(this.http.ipAddress, "") }
      }))
    }
  },
  methods: {
    onOversize () {
      this.$toast('文件大小不能超过：' + this.maxSize + "M");
    },
    getUrl (url) {
      if (url.substr(0, 4) == "http") return url;
      return this.http.ipAddress + url;
    },
    beforeRead (files) {
      if (!this.url) {
        return this.$toast('没有配置好url');
      }
      var _files = [];
      if (files instanceof Array) {
        _files = files;
      } else {
        _files = [files];
      }

      var forms = new FormData();
      let _count = 0;
      _files.forEach((file) => {
        this.bf = file.name + "压缩前大小:" + (file.size / 1024)
        var result = this.compress(file, (data) => {
          var _file = this.base64ToBlob(data);
          _count++;
          this.af = file.name + "压缩后大小:" + (_file.size / 1024)
          forms.append("fileInput", _file, file.name);
          if (_count == _files.length) {
            //"api/App_Expert/Upload"
            this.http.post(this.url, forms, true).then(x => {
              console.log(x);
              var _urls = _files.map(item => {
                return { url: this.http.ipAddress + x.data + "/" + item.name };
              })
              this.files.push(..._urls);
            })
          }
        });
      });

      // console.log(file)
    },
    beforeDelete (file, detail) {
      return new Promise((resolve, reject) => {
        return resolve();
      })
    },
    base64ToBlob (urlData, _compress) {
      if (typeof urlData != "string") return urlData;
      let arr = urlData.split(',');
      let mime = arr[0].match(/:(.*?);/)[1] || type;
      // 去掉url的头，并转化为byte
      let bytes = window.atob(arr[1]);
      // 处理异常,将ascii码小于0的转换为大于0
      let ab = new ArrayBuffer(bytes.length);
      // 生成视图（直接针对内存）：8位无符号整数，长度1个字节
      let ia = new Uint8Array(ab);
      for (let i = 0; i < bytes.length; i++) {
        ia[i] = bytes.charCodeAt(i);
      }
      return new Blob([ab], {
        type: mime
      });
    },
    compress (fileObj, callback) {
      //小于2M的不压缩
      if (fileObj.size < 1024 * 1024 * 2) {
        callback(fileObj);
        return;
      }
      var reader = new FileReader();
      var _this = this;
      reader.onload = function (e) { //要先确保图片完整获取到，这是个异步事件
        var image = new Image();
        image.src = e.target.result;
        image.onload = function () {
          var square = 0.6,  //定义画布的大小，也就是图片压缩之后的像素(待完)
            canvas = document.createElement('canvas'), //创建canvas元素
            context = canvas.getContext('2d'),
            imageWidth = Math.round(square * image.width),  //压缩图片的大小
            imageHeight = Math.round(square * image.height),
            data = '';

          canvas.width = imageWidth;
          canvas.height = imageHeight;
          context.clearRect(0, 0, imageWidth, imageHeight); //在给定矩形内清空一个矩形
          context.drawImage(this, 0, 0, imageWidth, imageHeight);
          var data = canvas.toDataURL('image/jpeg', 1);
          //压缩完成执行回调
          callback(data);
        };
      }
      reader.readAsDataURL(fileObj);
    }
  }
}
</script>
<style scoped>
.preview-cover {
  position: absolute;
  bottom: 0;
  box-sizing: border-box;
  width: 100%;
  padding: 4px;
  color: #fff;
  font-size: 12px;
  text-align: center;
  background: rgba(0, 0, 0, 0.3);
}
</style>