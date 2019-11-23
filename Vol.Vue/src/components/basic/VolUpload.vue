<template>
  <div class="upload-container">
    <div>
      <div class="input-btns" style="margin-bottom: 10px;">
        <input
          ref="input"
          type="file"
          style="display:none;"
          @change="handleChange"
          :multiple="multiple"
        />
        <div v-if="img" class="upload-img">
          <div v-for="(file,index) in files" :key="index" class="img-item">
            <div class="operation">
              <div class="action">
                <Icon type="md-eye" @click="viewBigImg(index)" class="view"></Icon>
                <Icon type="md-close" @click="removeFile(index)" class="remove"></Icon>
              </div>
              <div class="mask"></div>
            </div>
            <img :src="getImgSrc(file)" />
          </div>
          <div class="img-selector" :class="getSelector()">
            <div class="selector" @click="handleClick">
              <Icon type="ios-camera"></Icon>
            </div>
            <div class="s-btn">
              <Button
                :disabled="changed"
                v-if="!autoUpload"
                style="border-radius: 0px;"
                type="info"
                icon="md-arrow-round-up"
                @click="upload"
                :loading="loadingStatus"
              >上传文件</Button>
            </div>
          </div>
        </div>
        <Button v-else @click="handleClick" icon="ios-cloud-upload-outline">选择{{img?'图片':'文件'}}</Button>

        <Button
          v-if="!autoUpload&&!img"
          type="info"
          :disabled="changed"
          icon="md-arrow-round-up"
          @click="upload"
          :loading="loadingStatus"
        >上传文件</Button>
      </div>
      <slot></slot>
      <div v-if="desc">
        <Alert show-icon>{{getText()}}文件大小不超过{{maxSize}}M</Alert>
      </div>
      <slot name="content"></slot>
      <div v-if="!img">
        <ul class="upload-list" v-show="fileList">
          <li class="list-file" v-for="(file,index) in files" :key="index">
            <span @click="fileOnClick(index,file)">
              <Icon :type="format(file)"></Icon>
              {{ file.name }}
            </span>
            <span style="margin-left:15px;">大小{{(file.size / 1024).toFixed(2)}}KB</span>
            <span @click="removeFile(index)" class="file-remove">
              <Icon type="md-close"></Icon>
            </span>
          </li>
        </ul>
      </div>
      <slot name="tip"></slot>
    </div>
  </div>
</template>
<script>
export default {
  components: {},
  props: {
    desc: {
      //是否显示默认介绍
      //是否多选
      type: Boolean,
      default: false
    },
    // fileInfo: { //自定显示的文件列表
    //   type: Object,
    //   default: []
    // },
    multiple: {
      //是否多选
      type: Boolean,
      default: false
    },
    maxFile: {
      //最多可选文件数量，必须multiple=true，才会生效
      type: Number,
      default: 5
    },
    maxSize: {
      //文件限制大小3M
      type: Number,
      default: 3
    },

    autoUpload: {
      //选择文件后是否自动上传
      type: Boolean,
      default: true
    },
    img: {
      //图片类型  img>excel>fileTypes三种文件类型优先级
      type: Boolean,
      default: false
    },
    excel: {
      //excel文件
      type: Boolean,
      default: false
    },
    fileTypes: {
      //指定上传文件的类型
      type: Array,
      default: () => {
        return [];
      }
    },
    url: {
      //上传的url
      type: String,
      default: ""
    },
    uploadBefore: {
      //返回false会中止执行
      //上传前
      type: Function,
      default: files => {
        return true;
      }
    },
    uploadAfter: {
      //返回false会中止执行
      //上传后
      type: Function,
      default: (result, files) => {
        return true;
      }
    },
    onChange: {
      //选择文件时  //返回false会中止执行
      type: Function,
      default: files => {
        return true;
      }
    },
    clear: {
      //上传完成后是否清空文件列表
      type: Boolean,
      default: false
    },
    fileList: {
      //是否显示选择的文件列表
      type: Boolean,
      default: true
    },
    fileClick: {
      //点击文件事件
      type: Function,
      default: (index, file) => {
        return true;
      }
    },
    removeBefore: {
      //移除文件事件
      type: Function,
      default: (index, file, files) => {
        return true;
      }
    }
  },
  data() {
    return {
      changed: false, //手动上传成功后禁止重复上传，必须重新选择
      model: true,
      files: [],
      bigImg: "",
      loadingStatus: false
    };
  },
  methods: {
    getPreview() {
      return this.files.map(x => {
        return x.getImgSrc();
      });
    },
    viewBigImg(index) {
      //查看大图预览模式待完
      window.open(this.getImgSrc(this.files[index]));
      // let $img_model = document.getElementById("upload-img-model");
      // if ($img_model) {
      //   $img_model.display = "block";
      // }
      //       <div v-show="model" class="big-model">
      //   <div class="m-img">
      //     <img :src="bigImg" />
      //   </div>
      //   <div class="mask"></div>
      // </div>
      // this.model = true;
      // this.bigImg = this.getImgSrc(this.files[index]);
    },
    getSelector() {
      if (this.autoUpload) {
        return "auto-selector";
      }

      return "submit-selector";
    },
    getImgSrc(file) {
      return window.URL.createObjectURL(file);
    },
    fileOnClick(index, file) {
      this.fileClick(index.file);
    },
    getText() {
      if (this.img) {
        return "只能上传图片,";
      } else if (this.excel) {
        return "只能上传excel文件,";
      }
    },
    handleClick() {
      this.$refs.input.click();
    },
    handleChange(e) {
      this.clearFiles();
      var result = this.checkFile(e.target.files);
      if (!result) {
        return;
      }
      this.changed = false;
      if (!this.onChange(e.target.files)) {
        return;
      }
      this.files.push(...e.target.files);
      this.$refs.input.value = null;

      if (this.autoUpload && result) {
        this.upload();
      }
    },
    removeFile(index) {
      //t移除文件
      if (!this.removeBefore(index, this.files[index], this.thfiles)) {
        return;
      }
      this.files.splice(index, 1);
    },
    clearFiles() {
      this.files.splice(0);
    },
    getFiles() {
      return this.files;
    },
    upload() {
      if (!this.checkFile()) return false;
      if (!this.url) {
        return this.$Message.error({ duration: 5, content: "没有配置好Url" });
      }
      if (!this.files || this.files.length == 0) {
        return this.$Message.error({ duration: 5, content: "请选择文件" });
      }
      if (!this.uploadBefore(this.files)) {
        return;
      }
      var forms = new FormData();
      this.files.forEach(function(file) {
        forms.append("fileInput", file, file.name);
      });
      // forms.append("fileInput", this.files);
      this.loadingStatus = true;
      this.http
        .post(this.url, forms, this.autoUpload ? "正在上传文件" : "")
        .then(
          x => {
            // this.$refs.uploadFile.clearFiles();
            this.loadingStatus = false;
            if (!this.uploadAfter(x, this.files)) {
              this.changed = false;
              return;
            } else {
              this.changed = true;
            }
            this.$Message.success({ duration: 5, content: x.message });
            this.changed = x.status;
            if (!x.status) {
              // this.files = null;
              return;
            }

            if (this.clear) {
              this.clearFiles();
            }
            //刷新表格数据
          },
          error => {
            this.loadingStatus = false;
          }
        );
    },
    format(file, checkFileType) {
      const format =
        file.name
          .split(".")
          .pop()
          .toLocaleLowerCase() || "";
      let type = "ios-document-outline";

      if (
        checkFileType &&
        !(checkFileType instanceof Array) &&
        checkFileType != "img" &&
        checkFileType != "excel"
      ) {
        if (checkFileType.indexOf(format) > -1) {
          return true;
        } else {
          return false;
        }
      }

      if (
        checkFileType == "img" ||
        ["gif", "jpg", "jpeg", "png", "bmp", "webp"].indexOf(format) > -1
      ) {
        if (checkFileType == "img") {
          if (
            ["gif", "jpg", "jpeg", "png", "bmp", "webp"].indexOf(format) > -1
          ) {
            return true;
          } else {
            return false;
          }
        }
        type = "ios-image";
      }
      if (
        ["mp4", "m3u8", "rmvb", "avi", "swf", "3gp", "mkv", "flv"].indexOf(
          format
        ) > -1
      ) {
        type = "ios-film";
      }
      if (["mp3", "wav", "wma", "ogg", "aac", "flac"].indexOf(format) > -1) {
        type = "ios-musical-notes";
      }
      if (["doc", "txt", "docx", "pages", "epub", "pdf"].indexOf(format) > -1) {
        type = "md-document";
      }
      if (
        checkFileType == "excel" ||
        ["numbers", "csv", "xls", "xlsx"].indexOf(format) > -1
      ) {
        if (checkFileType == "excel") {
          if (["numbers", "csv", "xls", "xlsx"].indexOf(format) > -1) {
            return true;
          } else {
            return false;
          }
        }
        type = "ios-podium";
      }
      if (["keynote", "ppt", "pptx"].indexOf(format) > -1) {
        type = "ios-videocam";
      }

      return type;
    },
    beforeUpload() {},
    checkFile(files) {
      if (!files) {
        files = this.files;
      }
      if (this.multiple && files.length > this.maxFile) {
        this.$Message.error({
          duration: 5,
          content:
            "最多只能选【" +
            this.maxFile +
            "】" +
            (this.img ? "张图片" : "个文件") +
            ""
        });
        return false;
      }
      let names = [];
      for (let index = 0; index < files.length; index++) {
        const file = files[index];
        if (names.indexOf(file.name) != -1) {
          file.name = "(" + index + ")" + file.name;
        }
        names.push(file.name);
        if (this.img && !this.format(file, "img")) {
          this.$Message.error({
            duration: 5,
            content: "选择的文件【" + file.name + "】只能是图片格式"
          });
          return false;
        }
        if (this.excel && !this.format(file, "excel")) {
          this.$Message.error({
            duration: 5,
            content: "选择的文件【" + file.name + "】只能是excel文件"
          });
          return false;
        }
        if (
          this.fileTypes &&
          this.fileTypes.length > 0 &&
          !this.format(file, this.fileTypes)
        ) {
          this.$Message.error({
            duration: 5,
            content:
              "选择的文件【" +
              file.name +
              "】只能是【" +
              this.fileTypes.join(",") +
              "】格式"
          });
          return false;
        }
        if (file.size > this.maxSize * 1024 * 1024) {
          this.$Message.error({
            duration: 5,
            content:
              "选择的文件【" + file.name + "】不能超过:" + this.maxSize + "M"
          });
          return false;
        }
      }
      return true;
    }
  }
};
</script>
<style lang="less" scoped>
.upload-list {
  list-style: none;
  .list-file {
    padding: 4px;
    color: #515a6e;
    border-radius: 4px;
    transition: background-color 0.2s ease-in-out;
    overflow: hidden;
    position: relative;

    font-size: 13px;
    .file-remove {
      display: none;
      margin-left: 50px;
      color: #0e9286;
    }
  }
  .list-file:hover {
    cursor: pointer;
    .file-remove {
      display: initial;
    }
    color: #2d8cf0;
  }
}
.upload-container {
  display: inline-block;
  width: 100%;
  padding: 10px;

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
.upload-img {
  display: inline-block;
  .img-item:hover .operation {
    display: block;
  }
  .img-item,
  .img-selector {
    position: relative;
    cursor: pointer;
    margin: 0 10px 10px 0;
    float: left;
    width: 100px;
    height: 100px;
    border: 1px solid #9e9e9e;
    overflow: hidden;
    border-radius: 5px;
    width: 100px;
    img {
      margin: 0;
      padding: 0;
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    .operation {
      display: none;
      position: absolute;
      top: 0;
      bottom: 0;
      left: 0;
      right: 0;
      .action {
        text-align: right;
        background: #357871;
        font-size: 17px;
        position: absolute;
        z-index: 90;
        width: 100%;
        bottom: 3px;
        bottom: 0;
        color: white;
        padding-right: 7px;
        padding-bottom: 3px;
        line-height: 23px;
        // i {
        //   border-radius: 50%;
        //   background: white;
        // }
      }
      .mask {
        opacity: 0.6;
        background: #9e9e9e;
        top: 0;
        width: 100%;
        height: 100%;
        position: absolute;
      }
    }
  }
  .img-selector {
    font-size: 50px;
    text-align: center;
    i {
      top: -4px;
      position: relative;
    }
  }
  .auto-selector {
    line-height: 100px;
    .selector {
      height: 64px;
    }
  }
  .submit-selector {
    position: relative;
    .s-btn {
      height: 31px;
      bottom: 26px;
      position: absolute;
    }
  }
}
.big-model {
  width: 100%;
  height: 100%;
  position: relative;
  .m-img {
  }
  .mask {
    position: absolute;
    opacity: 0.6;
    background: #eee;
    top: 0;
    width: 100%;
    height: 100%;
    position: absolute;
  }
}
</style>