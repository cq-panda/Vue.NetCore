<template>
  <div class="upload-container">
    <a :href="template.url" ref="template"></a>

    <!-- <div class="alert">
      <Alert show-icon>只能上传excel文件,文件大小不超过5M</Alert>
    </div>
    <Divider>文件列表</Divider>-->
    <div class="imgs">
      <div class="item" :width="imgWidth" v-for="(item,index) in imgs" :key="index">
        <!-- <div style="padding:5px;">图片上传功能开发中</div> -->
        <div class="remove">
          <Icon @click="remove(index)" type="md-close" />
        </div>
        <img :width="imgWidth" @click="viewImg(item.src)" v-if="item.src" :src="item.src" />
      </div>
      <div v-show="imgs.length==0" class="img-selector">
        <Upload ref="uploadFile" :max-size="maxSize" :before-upload="beforeUpload" :action="url">
          <div>
            <Icon type="ios-add" />
          </div>
        </Upload>
      </div>
    </div>
    <!-- <div class="file-info" v-if="file!= null">
      <span>文件名：{{file.name}}</span>
      <span>大小{{(file.size / 1024).toFixed(2)}}KB</span>
    </div>-->
    <slot></slot>
  </div>
</template>
<script>
import { error } from "util";
//目前只支持单个Excel上传，其他功能开发中...
export default {
  components: {},
  props: {
    src: {
      type: String,
      default: ""
    },
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
    },
    width: { //默认图片200宽度
      type: Number,
      default: 200
    }
  },
  data() {
    return {
      imgWidth: this.$props.width,
      imgs: [],
      maxSize: 102 * 5,
      model: true,
      file: null,
      loadingStatus: false
    };
  },
  methods: {
    viewImg(src) {
      window.open(src);
    },
    remove(index) {
      this.imgs.splice(index);
    },
    getFileType() {
      let fileName =
        this.file.name
          .split(".")
          .pop()
          .toLocaleLowerCase() || "";
      if (["jpg", "jpeg", "png"].indexOf(fileName) == -1) {
        this.$message.error("只能选择jpg/jpeg/png图片");
        return false;
      }
      this.imgs.push({ src: window.URL.createObjectURL(this.file) });
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
    },
    dowloadTemplate() {}
  },
  created() {
    if (this.src) {
      this.imgs.push({ src: this.src });
    }
  }
};
</script>
<style lang="less" scoped>
.upload-container {
  // display: inline-block;
  // width: 100%;
  // padding: 10px;
  // border: 1px dashed #2d8cf0;
  // min-height: 250px;
  // border-radius: 5px;
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
  .img-selector {
    // border: 1px dashed #2d8cf0;
    i {
      font-size: 60px;
    }
  }
  .imgs {
    width: 100%;
    display: inline-block;
    .item:hover {
      cursor: pointer;
      .remove {
        display: block;
      }
    }
    > .item {
      position: relative;
      text-align: center;
      float: left;
      // width: 90px;
      line-height: 80px;
      margin-right: 20px;
      // img {
      //   width: 100px;
      // }
      .remove {
        display: none;
        position: absolute;
        top: 0;
        width: 100%;
        line-height: 20px;
        background: #9e9e9e;
        text-align: right;
        padding: 5px 10px;
        opacity: 0.7;
        font-size: 22px;
        color: #f56234;
        i {
          cursor: pointer;
        }
      }
    }
    .img-selector {
      color: #9e9e9e;
      text-align: center;
      float: left;
      // width: 90px;
      // line-height: 80px;
    }
    .img-selector:hover {
      cursor: pointer;
    }
  }
}
</style>
<style scoped>
.img-selector >>> .ivu-upload-select {
  border: 1px dashed #2d8cf0;
}
</style>