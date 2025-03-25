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
          ><i class="el-icon-folder-opened"></i>{{ $ts('选择文件') }}</el-button
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
        <!-- <i v-show="!loadingStatus" class="el-icon-bottom"></i> -->
        <i class="el-icon-bottom"></i> {{ $ts('下载模板') }}
      </el-button>
      <el-button type="success" size="small" @click="upload" :loading="loadingStatus">
        <!-- <i v-show="!loadingStatus" class="el-icon-top"></i> -->
        <i class="el-icon-top"></i> {{ $ts('上传文件') }}
      </el-button>
    </div>
    <div class="alert">
      <el-alert
        :title="$ts('只能上传excel文件')"
        type="warning"
        :closable="false"
        show-icon
      ></el-alert>
      <div v-html="desc"></div>
    </div>

    <div v-if="file">
      <h3>{{ $ts('文件列表') }}</h3>
      <div class="file-info">
        <span>{{ $ts('文件名') }}：{{ file.name }}</span>
        <span>{{ $ts('大小') }}{{ (file.size / 1024).toFixed(2) }}KB</span>
      </div>
    </div>
    <div v-show="message" class="v-r-message">
      <h3 class="title">{{ $ts('上传结果') }}</h3>
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
    desc: {
      //导入excel弹出框的描述
      type: String,
      default: ''
    },
    url: {
      type: String,
      default: ''
    },
    template: {
      //下载模板配置
      type: Object,
      default: () => {
        return {
          // url: "", //模板下载路径，如果没有模板路径，则不显示下载模板功能
          url: '', //模板下载路径，如果没有模板路径，则不显示下载模板功能
          fileName: '未定义文件名' //下载模板的文件名
        }
      }
    },
    importExcelBefore: {
      type: Function,
      default: (file) => {
        return true
      }
    }
  },
  data() {
    return {
      maxSize: 1024 * 1024 * 100,
      model: true,
      file: null,
      loadingStatus: false,
      message: '',
      resultClass: ''
    }
  },
  methods: {
    clearMsg() {
      this.message = ''
    },
    reset() {
      this.file = null
      this.message = ''
      this.resultClass = ''
    },
    getFileType() {
      let fileName = this.file.name.split('.').pop().toLocaleLowerCase() || ''
      if (['numbers', 'csv', 'xls', 'xlsx'].indexOf(fileName) == -1) {
        this.$Message.error(this.$ts('只能选择excel文件'))
        return false
      }
      return true
    },
    beforeUpload(file) {
      this.file = file
      if (!this.getFileType()) {
        return false
      }
      return false
    },
    upload() {
      if (!this.url) {
        return this.$Message.error(this.$ts('没有配置好Url'))
      }

      if (!this.file) {
        return this.$Message.error(this.$ts(['请选择', '文件']))
      }
      var formData = new FormData()
      formData.append('fileInput', this.file)
      if (
        !this.importExcelBefore(formData, () => {
          this.uploadData(formData)
        })
      ) {
        return
      }
      this.uploadData(formData)
    },
    uploadData(formData) {
      this.loadingStatus = true
      this.http
        .post(this.url, formData, true, { headers: { 'Content-Type': 'multipart/form-data' } })
        .then(
          (x) => {
            // this.$refs.uploadFile.clearFiles();
            this.loadingStatus = false
            this.file = null
            if (x.status) {
              this.$emit('importExcelAfter', x)
            }

            this.message = this.$ts(x.message || '导入失败')
            this.resultClass = x.status ? 'v-r-success' : 'v-r-error'
          },
          (error) => {
            this.loadingStatus = false
          }
        )
    },
    getUrl(url) {
      if (url.startsWith('http')) {
        return url
      }
      return (this.http.ipAddress + url).replace('//', '/')
    },
    dowloadTemplate() {
      let url = this.getUrl(this.template.url)
      let xmlResquest = new XMLHttpRequest()
      xmlResquest.open('GET', url, true)
      xmlResquest.setRequestHeader('lang', localStorage.getItem(lang_storage_key))
      xmlResquest.setRequestHeader('serviceId', localStorage.getItem('serviceId'))
      xmlResquest.setRequestHeader('deptId', localStorage.getItem('deptId'))

      xmlResquest.setRequestHeader('Content-type', 'application/json')
      xmlResquest.setRequestHeader('Authorization', this.$store.getters.getToken())
      let fileName = this.template.fileName + '.xlsx'
      let elink = this.$refs.template
      xmlResquest.responseType = 'blob'
      this.loadingStatus = true
      xmlResquest.onload = (oEvent) => {
        this.loadingStatus = false
        if (xmlResquest.response.type == 'application/json') {
          return this.message.error('未找到下载文件')
        }
        let content = xmlResquest.response
        elink.download = fileName
        let blob = new Blob([content])
        elink.href = URL.createObjectURL(blob)
        elink.click()
      }
      xmlResquest.send()
    }
  }
}
</script>
<style lang="less" scoped>
.upload-container {
  min-height: 276px !important;
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
