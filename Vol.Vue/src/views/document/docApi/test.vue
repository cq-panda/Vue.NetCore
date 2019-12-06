<template>
  <div>
    <Alert
      show-icon
    >如果需要把文件上传到后台Api服务器，必须将保存文件的路径指向Upload文件夹,如:/Upload/xxx/xxx/，因为后台目前只开启了Upload静态文件目录</Alert>
    <!-- <img src="http://localhost:9991/Upload/Tables/App_Appointment/201911240828293464/h52.jpg"> -->
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
          :file-list="false"
        >
          <!-- :file-list="false" 
          设置不显示文件列表，自己设置显示的文件-->
          <div>下载已经上传过的文件</div>
          <div slot="content">
            <ul class="upload-list">
              <li class="list-file" v-for="(file,index) in fileInfo" :key="index">
                <span @click="fileClick(index,file)">
                  <Icon type="md-document"></Icon>
                  {{ file.name }}
                </span>
                <span @click="removeFile(index)" class="file-remove">
                  <Icon type="md-close"></Icon>
                </span>
              </li>
            </ul>
          </div>
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
import VolUpload from "@/components/basic/VolUpload.vue";
export default {
  components: { VolUpload },
  data() {
    return {
      url: "/api/App_Appointment/Upload",
      model: true,
      fileInfo: [
        {
          name: "aa.jpg",
          path:
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x1.jpg"
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
    fileClick(index, file) {
      if (
        !file.path &&
        file.name.indexOf("/") == -1 &&
        file.name.indexOf("\\") == -1
      ) {
        return this.$Message.error({ duration: 5, content: "请先上传此文件" });
      }
      //从api服务器下载
      if (!this.base.checkUrl(file.path)) {
        this.dowloadFile(
          this.http.ipAddress +
            "api/App_Appointment/DownLoadFile?path=" +
            file.path +
            file.name,
          file.name
        );
        return;
      }
      //从远程下载
      this.$refs.downFile.href = file.path || file.name;
      this.$refs.downFile.setAttribute("download", "download");
      this.$refs.downFile.click();
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
    },
    dowloadFile(url, fileName) {
      this.base.dowloadFile(url, fileName, {
        Authorization: this.$store.getters.getToken()
      });
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
