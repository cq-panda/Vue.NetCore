<template>

  <VolBox
    v-model="model"
    title="封面图片设置"
    :height="230"
    :width="520"
    :lazy="true"
    :padding="15"
  >
    <VolUpload
        style="text-align: center; border: 1px dotted #FF9800;padding: 20px;"
        :autoUpload="false"
        :multiple="true"
        :url="url"
        :max-file="3"
        :img="true"
        :fileInfo="fileInfo"
        :upload-after="uploadAfter"
      >
        <div>可选择1-3张图片设置为封面图</div>
      </VolUpload>
  </VolBox>
</template>
<script>
import VolBox from "@/components/basic/VolBox.vue";
import {defineComponent,defineAsyncComponent,ref} from "vue"
export default defineComponent({
  data() {
    return {
      url: "api/app_news/upload",
      fileInfo: [],
      model: false,
    };
  },
  components: {
    VolBox: VolBox,
    VolUpload:defineAsyncComponent( () => import("@/components/basic/VolUpload.vue"))
  },
  methods: {
    open(fileInfo) {
      this.model = true;
      this.fileInfo = fileInfo;
    },
    //封面图片上传完成后，将图片的路径更新到表中
    uploadAfter(result, files) {
      if (!result.status) {
        return true;
      }
      //上传完成后，保存每个图片所存储的文件路径
      let fileUrls = files.map((x) => {
        return result.data + x.name;
      });
      let data = { imageUrl: fileUrls.join(",") };
      //父组件vue对象(查询界面)
      let $parentVue;
      //获取父组件当前选中行的id用于后台更新
      this.$emit("parentCall", ($vue) => {
        $parentVue = $vue;
        data.Id = $vue.getSelectRows()[0].Id;
      });
      this.http
        .post("api/news/setCover", data, "正在设置图片封面")
        .then((x) => {
          //刷新查询界面table
          $parentVue.refresh();
          this.model = false;
        });
      return true;
    },
  }
});
</script>