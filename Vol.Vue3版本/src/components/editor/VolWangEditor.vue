<template>
  <div class="hello" ref="volWangEditor"></div>
</template>

<script>
import E from "wangeditor";
export default {
  props: {
    url: {
      //上传图片的url
      type: String,
      default: "",
    },
    upload: {
      //上传方法
      type: Function,
      default: (file) => {},
    },
    uploadCount: {
      //最多可以上传(图片)的数量
      type: Number,
      default: 3,
    },
    modelValue: "",
    width: {
      type: String,
      default: "100%",
    },
    height: {
      type: String,
      default: 250,
    },
    minWidth: {
      type: Number,
      default: 650,
    },
    minHeight: {
      type: Number,
      default: 100,
    },
  },
  name: "wang-editor",
  data() {
    return {
      editor: null,
      change: false,
      outChange: false,
    };
  },
  watch: {
    modelValue(newVal) {
      if (!this.change) {
        this.outChange = true;
        this.editor.txt.html(newVal);
      }
      this.change = false;
    },
  },
  destroyed() {
    this.editor = null;
  },
  mounted() {
    this.editor = null;
    let editor = new E(this.$refs.volWangEditor);
    this.editor = editor;
    let $this = this;
    editor.config.height = this.height;
     editor.config.onchange = (html) => {
      if (this.outChange) {
        this.outChange = false;
        return;
      }
      this.change = true;
      this.outChange = false;
      this.$emit("update:modelValue", html);
    };
    // editor.config.uploadFileName = "fileInput";
    // //设置header
    // editor.config.uploadImgHeaders = {
    //   Accept: "application/json",
    //   Authorization: this.$store.getters.getToken(),
    // };
    //上传地址
    editor.config.uploadImgServer = this.http.ipAddress + this.url;
    // console.log(editor.config.uploadImgServer);
    editor.config.customUploadImg = function (resultFiles, insertImgFn) {
      let formData = new FormData();
      let nameArr = [];
      resultFiles.forEach(function (file) {
        formData.append("fileInput", file, file.name);
        nameArr.push(file.name);
      });
      if (!$this.url) {
        $this.$message.error("未配置url");
        return;
      }
      $this.http.post($this.url, formData, true).then((x) => {
        if (!x.status) {
          return $this.$message.error(x.message);
        }
        let imgs = nameArr
          .map((m) => {
            return $this.http.ipAddress + x.data + m;
          })
          .join(",");
        insertImgFn(imgs);
      });
    };
    editor.create();
    editor.txt.html(this.modelValue);
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1,
h2 {
  font-weight: normal;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
