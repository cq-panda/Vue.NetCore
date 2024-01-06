<template>
    <el-image-viewer hide-on-click-modal v-if="showImageViewer" :initial-index="initialIndex" :url-list="imageViewerList"
        @close="closeViewer"></el-image-viewer>
</template>
<script>
import { ref } from 'vue';
export default {
    setup() {
        const initialIndex = ref(0);
        const imageViewerList = ref([]);
        const showImageViewer = ref(false)

        const show = (imgs, index) => {
            initialIndex.value = index || 0;
            if (Array.isArray(imgs)) {
                imageViewerList.value = imgs;
            } else {
                imageViewerList.value = [imgs]
            }
            showImageViewer.value=true;
        }
        const closeViewer=()=>{
            showImageViewer.value=false;
        }
        return {
            initialIndex,
            imageViewerList,
            showImageViewer,
            closeViewer,
            show
        }
    }
}
</script>