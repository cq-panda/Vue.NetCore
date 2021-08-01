<template>
  <div class="hello" :id="id"></div>
</template>

<script>
import E from "wangeditor";
let editor = null;
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
      id: "volwangeditor" + ~~(Math.random() * 100000),
    };
  },
  watch: {
    modelValue(newVal) {
      editor.txt.html(newVal);
    },
  },
  destroyed() {
    editor = null;
    $this = null;
  },
  mounted() {
    editor = new E("#" + this.id);
    let $this = this;
    editor.config.height = this.height;
    editor.config.onchange = (html) => {
      $this.$emit("update:modelValue", html);
    };
    // editor.config.uploadFileName = "fileInput";
    // //设置header
    // editor.config.uploadImgHeaders = {
    //   Accept: "application/json",
    //   Authorization: this.$store.getters.getToken(),
    // };
    //上传地址
    editor.config.uploadImgServer = this.http.ipAddress + this.url;
    console.log(editor.config.uploadImgServer);
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
