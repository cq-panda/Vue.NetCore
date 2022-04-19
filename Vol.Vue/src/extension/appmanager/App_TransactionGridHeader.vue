<template>
  <VolBox
    :model.sync="model"
    title="弹出框标题"
    :height="325"
    :width="600"
    :padding="15"
  >
    <div style="display: flex">
      <Input
        style="padding-bottom: 10px; margin-right: 10px"
        v-model="value1"
        placeholder="参数1"
      />
      <Input v-model="value2" placeholder="参数2" />
    </div>
    <UploadExcel
      :url="url"
      :template="template"
      :importExcelBefore="importExcelBefore"
    ></UploadExcel>
  </VolBox>
</template>
<script>
export default {
  components: {
    VolBox: () => import("@/components/basic/VolBox.vue"),
    UploadExcel: () => import("@/components/basic/UploadExcel.vue"),
  },
  data() {
    return {
      url: "api/App_Transaction/import1", //导入的路径 
      template: { //下载模板的配置
        url: "api/App_Transaction/DownLoadTemplate",//下载模板的路径 
        fileName: "测试参数", //模板的文件名
      },
      model: false,
      value1: "", //参数1
      value2: "",//参数2
    };
  },
  methods: {
    openModel() {
      this.model = true;
    },
    importExcelBefore(formData) { //点击上传时，将其他参数提交到后台
      formData.append("val1", this.value1);
      formData.append("val2", this.value2);
      return true;
    },
  },
};
</script>