<template>
  <div class="upload-container">
    <a :href="template.url" ref="template"></a>
    <div class="button-group">
      <Upload ref="uploadFile" :max-size="maxSize" :before-upload="beforeUpload" :action="url">
        <Button icon="ios-cloud-upload-outline">选择文件</Button>
      </Upload>
      <Button
        v-if="template.url"
        type="info"
        icon="md-arrow-round-down"
        @click="dowloadTemplate"
        :loading="loadingStatus"
      >下载模板</Button>
      <Button type="error" icon="md-arrow-round-up" @click="upload" :loading="loadingStatus">上传文件</Button>
    </div>
    <div class="alert">
      <Alert show-icon>只能上传excel文件,文件大小不超过5M</Alert>
    </div>
    <Divider>文件列表</Divider>
    <div class="file-info" v-if="file!= null">
      <span>文件名：{{file.name}}</span>
      <span>大小{{(file.size / 1024).toFixed(2)}}KB</span>
    </div>
    <slot></slot>
  </div>
</template>
<script>
import { error } from "util";
//目前只支持单个Excel上传，其他功能开发中...
export default {
  components: {},
  props: {
    url: {
      type: String,
      default: ""
    },
    template: {
      //下载模板配置
      type: Object,
      default: () => {
        return {
          url: "", //模板下载路径，如果没有模板路径，则不显示下载模板功能
          fileName: "未定义文件名" //下载模板的文件名
        };
      }
    }
  },
  data() {
    return {
      maxSize: 102 * 5,
      model: true,
      file: null,
      loadingStatus: false
    };
  },
  methods: {
    getFileType() {
      let fileName =
        this.file.name
          .split(".")
          .pop()
          .toLocaleLowerCase() || "";
      if (["numbers", "csv", "xls", "xlsx"].indexOf(fileName) == -1) {
        this.$message.error("只能选择excel文件");
        return false;
      }
      return true;
    },
    beforeUpload(file) {
      this.file = file;
      if (!this.getFileType()) {
        return false;
      }
      return false;
    },
    upload() {
      if (!this.url) {
        return this.$message.error("没有配置好Url");
      }
      if (!this.file) {
        return this.$message.error("请选择文件");
      }
      var forms = new FormData();
      forms.append("fileInput", this.file);
      this.loadingStatus = true;
      this.http.post(this.url, forms).then(
        x => {
          // this.$refs.uploadFile.clearFiles();
          this.loadingStatus = false;
          this.file = null;
          this.$emit('importExcelAfter',x);
          this.$message.error(x.message);
          //刷新表格数据
        },
        error => {
          this.loadingStatus = false;
        }
      );
    },
    dowloadTemplate() {
      let url = this.template.url;
      let xmlResquest = new XMLHttpRequest();
      xmlResquest.open("GET", url, true);
      xmlResquest.setRequestHeader("Content-type", "application/json");
      xmlResquest.setRequestHeader(
        "Authorization",
        this.$store.getters.getToken()
      );
      let fileName = this.template.fileName + ".xlsx";
      let elink = this.$refs.template;
      xmlResquest.responseType = "blob";
      let $_vue = this;
      this.loadingStatus = true;
      xmlResquest.onload = function(oEvent) {
        $_vue.loadingStatus = false;
        if (xmlResquest.response.type == "application/json") {
          return $_vue.message.error("未找到下载文件");
        }
        let content = xmlResquest.response;
        elink.download = fileName;
        let blob = new Blob([content]);
        elink.href = URL.createObjectURL(blob);
        elink.click();
      };
      xmlResquest.send();
    }
  }
};
</script>
<style lang="less" scoped>
.upload-container {
  display: inline-block;
  width: 100%;
  padding: 10px;
  border: 1px dashed #2d8cf0;
  min-height: 250px;
  border-radius: 5px;
  .alert {
    margin-top: 43px;
  }
  .button-group > * {
    float: left;
    margin-right: 10px;
  }
  .file-info > span {
    margin-right: 20px;
  }
}
</style>