<template>
  <div>
    <div class="upload-container">
      <div class="upload-item">
        <VolUpload
          :url="url"
          :upload-before="uploadBefore"
          :upload-after="uploadAfter"
          :on-change="onChange"
        >
          <div>单文件自动上传</div>
        </VolUpload>
      </div>
      <div class="upload-item">
        <VolUpload
          :autoUpload="false"
          :multiple="true"
          :max-file="2"
          :excel="true"
          :url="url"
          :upload-before="uploadBefore"
          :upload-after="uploadAfter"
          :on-change="onChange"
        >
          <div>多文件手动上传,最多2个excel文件</div>
        </VolUpload>
      </div>
      <div class="upload-item">
        <a ref="downFile"></a>
        <VolUpload
          :multiple="true"
          :url="url"
          :upload-before="uploadBefore1"
          :upload-after="uploadAfter1"
          :on-change="onChange"
          :fileInfo="fileInfo"
        >
          <div>下载已经上传过的文件</div>
        </VolUpload>
      </div>
    </div>

    <div class="upload-container">
      <div class="upload-item">
        <VolUpload
          :url="url"
          :img="true"
          :multiple="true"
          :max-size="null"
          :upload-before="uploadBefore"
          :upload-after="uploadAfter"
          :on-change="onChange"
        >
          <div>多图片自动上传,图片最大1M</div>
        </VolUpload>
      </div>
    </div>
    <div class="upload-container">
      <div class="upload-item">
        <VolUpload
          :autoUpload="false"
          :url="url"
          :img="true"
          :upload-before="uploadBefore"
          :upload-after="uploadAfter"
          :on-change="onChange"
        >
          <div>单文件手动上传,只能上传图片</div>
        </VolUpload>
      </div>
    </div>
  </div>
</template>
<script>
import docParamTable from "./doc_ParamTable.vue";
import VolUpload from "@/components/basic/VolUpload.vue";
export default {
  components: { VolUpload, docParamTable },
  data() {
    return {
      url: "/api/App_Appointment/Upload",
      model: true,
      fileInfo: [
        {
          name: "exceltest.xlsx",
          path:
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/github/exceltest.xlsx"
        },
        {
          name: "wordtest.docx",
          path:
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/github/wordtest.docx"
        }
      ],
      loadingStatus: false
    };
  },
  methods: {
    removeFile(index) {
      this.fileInfo.splice(index, 1);
    },
    uploadBefore1(files) {
      this.fileInfo.splice(0);
      for (let index = 0; index < files.length; index++) {
        const element = files[index];
        this.fileInfo.push({ name: element.name });
      }
      return true;
    },
    uploadAfter1(result, files) {
      if (!result.status) return true;
      this.fileInfo.forEach(x => {
        x.path = result.data;
      });
    },
    getFileNames(files) {
      let arr = [];
      for (let index = 0; index < files.length; index++) {
        const element = files[index];
        arr.push(element.name);
      }
      return arr.join(",");
    },
    uploadBefore(files) {
      console.log("上传前的文件:" + this.getFileNames(files));
      return true;
    },
    uploadAfter(result, files) {
      console.log(
        "上传结果" +
          JSON.stringify(result) +
          "上传前的文件:" +
          this.getFileNames(files)
      );
      return true;
    },
    onChange(files) {
      console.log("选择的文件:" + +this.getFileNames(files));
      return true;
    }
  }
};
</script>
<style lang="less" scoped>
.upload-container {
  max-height: 160px;
  display: flex;
  .upload-item {
    flex: 1;
    padding: 20px;
  }
}
</style>
