<template>
  <div>
    <VolBox
      icon="ios-chatbubbles"
      :model.sync="model"
      title="封面图片设置"
      :height="220"
      :width="520"
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
        <div>可自行设置上传的url或实现uploadBefore上传至第三方服务器存储</div>
      </VolUpload>
    </VolBox>
  </div>
</template>
<script>
export default {
  data() {
    return {
      url: "api/app_news/upload",
      fileInfo: [],
      model: false
    };
  },
  components: {
    VolBox: () => import("@/components/basic/VolBox.vue"),
    VolUpload: () => import("@/components/basic/VolUpload.vue")
  },
  methods: {
    //封面图片上传完成后，将图片的路径更新到表中
    uploadAfter(result, files) {
      if (!result.status) {
        return true;
      }
       //上传完成后，保存每个图片所存储的文件路径
      let fileUrls = files.map((x) => {
           //2021.09.25修复示例上传路径逻辑错误的问题
        if (x.path) {
          return x.path;
        }
        return result.data + x.name;
      });
      let data = { imageUrl: fileUrls.join(",") };
      //父组件vue对象
      let $parentVue;
      //获取父组件当前选中行的id用于后台更新
      this.$emit("parentCall", $vue => {
        $parentVue = $vue;
        data.Id = $vue.getSelectRows()[0].Id;
      });
      this.http.post("api/news/setCover", data, "正在设置图片封面").then(x => {
        //刷新查询界面table
        $parentVue.refresh();
        this.model = false;
      });
      return true;
    }
  }
};
</script>