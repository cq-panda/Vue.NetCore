<template>
  <div class="upload-container">
    <a :href="template.url" ref="template"></a>
    <div class="button-group">
      <el-upload
        style="float: left"
        ref="uploadFile"
        :max-size="maxSize"
        :on-change="clearMsg"
        :before-upload="beforeUpload"
        :action="url"
      >
        <el-button size="small"
          ><i class="el-icon-folder-opened"></i>选择文件</el-button
        >
      </el-upload>
      <el-button
        v-if="template.url"
        style="margin-left: 10px"
        type="primary"
        size="small"
        @click="dowloadTemplate"
        :loading="loadingStatus"
      >
     <i class="el-icon-bottom"></i>
        下载模板</el-button
      >
      <el-button
        type="success"
        size="small"
        @click="upload"
        :loading="loadingStatus"
      >
          <i class="el-icon-top"></i>
        上传文件</el-button
      >
    </div>
    <div class="alert">
      <el-alert title="上传说明" type="warning" :closable="false" show-icon
        >只能上传excel文件,文件大小不超过{{ maxSize }}M</el-alert
      >
    </div>

    <div v-if="file">
      <h3>文件列表</h3>
      <div class="file-info">
        <span>文件名：{{ file.name }}</span>
        <span>大小{{ (file.size / 1024).toFixed(2) }}KB</span>
      </div>
    </div>
    <div v-show="message" class="v-r-message">
      <h3 class="title">上传结果</h3>
      <div class="text" :class="resultClass" v-html="message"></div>
    </div>
    <slot></slot>
  </div>
</template>
<script>
//目前只支持单个Excel上传，其他功能开发中...
export default {
  components: {},
  props: {
    url: {
      type: String,
      default: ''
    },
    template: {
      //下载模板配置
      type: Object,
      default: () => {
        return {
          url: '', //模板下载路径，如果没有模板路径，则不显示下载模板功能
          fileName: '未定义文件名' //下载模板的文件名
        };
      }
    },
    importExcelBefore: {
      type: Function,
      default: (file) => {
        return true;
      }
    }
  },
  data() {
    return {
      maxSize: 100,
      model: true,
      file: null,
      loadingStatus: false,
      message: '',
      resultClass: ''
    };
  },
  methods: {
    clearMsg() {
      this.message = '';
    },
    reset() {
      this.file = null;
      this.message = '';
      this.resultClass = '';
    },
    getFileType() {
      let fileName =
        this.file.name
          .split('.')
          .pop()
          .toLocaleLowerCase() || '';
      if (['numbers', 'csv', 'xls', 'xlsx'].indexOf(fileName) == -1) {
        this.$Message.error('只能选择excel文件');
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
      let _url = this.url;
      if (!_url) {
        return this.$Message.error('没有配置好Url');
      }

      if (!this.file) {
        return this.$Message.error('请选择文件');
      }
      var formData = new FormData();
      formData.append('fileInput', this.file);
      if (!this.importExcelBefore(formData)) {
        return;
      }
      this.loadingStatus = true;
      this.http.post(_url, formData).then(
        (x) => {
          // this.$refs.uploadFile.clearFiles();
          this.loadingStatus = false;
          this.file = null;
          if (x.status) {
            this.$emit('importExcelAfter', x);
          }

          this.message = x.message;
          this.resultClass = x.status ? 'v-r-success' : 'v-r-error';
        },
        (error) => {
          this.loadingStatus = false;
        }
      );
    },
    dowloadTemplate() {
      let url = this.template.url;
      let xmlResquest = new XMLHttpRequest();
      xmlResquest.open('GET', url, true);
      xmlResquest.setRequestHeader('Content-type', 'application/json');
      xmlResquest.setRequestHeader(
        'Authorization',
        this.$store.getters.getToken()
      );
      let fileName = this.template.fileName + '.xlsx';
      let elink = this.$refs.template;
      xmlResquest.responseType = 'blob';
      let $_vue = this;
      this.loadingStatus = true;
      xmlResquest.onload = function(oEvent) {
        $_vue.loadingStatus = false;
        if (xmlResquest.response.type == 'application/json') {
          return $_vue.message.error('未找到下载文件');
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
  min-height: 270px !important;
  display: inline-block;
  width: 100%;
  padding: 10px;
  border: 1px dashed #989898;
  min-height: 250px;
  border-radius: 5px;
  .alert {
    margin-top: 12px;
  }
  .el-button-group > * {
    display: flex;
  }
  h3 {
    margin: 9px 0px;
  }
  .file-info > span {
    margin-right: 20px;
  }
  .v-r-message {
    margin-top: 10px;
    .title {
      margin-bottom: 2px;
    }
    > .text {
      font-size: 13px;
    }
    .v-r-success {
      color: #02b702;
    }
    .v-r-error {
      color: #dc0909;
    }
  }
}
</style>
