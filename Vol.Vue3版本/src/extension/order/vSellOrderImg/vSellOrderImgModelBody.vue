<template>
  <VolBox
    v-model="model"
    title="选择图片"
    :height="228"
    :width="500"
    :padding="15"
  >
    <!-- 上传图片、excel或其他文件、文件数量、大小限制都可以，参照volupload组件api -->
    <VolUpload
      style="text-align: center; border: 1px dotted #ff9800; padding: 20px"
      :autoUpload="false"
      :multiple="true"
      :url="url"
      :max-file="2"
      :img="true"
      :fileInfo="fileInfo"
      :upload-after="uploadAfter"
    >
      <div>选择图片,只能上传3M以内的照片</div>
    </VolUpload>
  </VolBox>
</template>
<script>
import { h, resolveComponent, defineAsyncComponent } from "vue";
export default {
  components: {
    VolUpload: defineAsyncComponent(() =>
      import("@/components/basic/VolUpload.vue")
    ),
    VolBox: defineAsyncComponent(() => import("@/components/basic/VolBox.vue")),
  },
  data() {
    return {
      //设置保存图片的路径,此处选择的是框架自带每个表的上传的路径
      //也可以自定义设置上传文件的接口，如果需要上传到第三方请实现uploadBefore方法
      url: "api/Sys_Dictionary/upload",
      fileInfo: [], //初始化一个空对象，用来存储编辑上传图片时的原始图片
      model: false,
      row: {}, //当前操作的明细表行
    };
  },
  methods: {
    open(fileInfo, row) {
      this.row=row;
      this.fileInfo = fileInfo;
      this.model = true;
    },
    //上传完成，将图片写入明细表数据
    uploadAfter(result, files) {
      if (!result.status) return true;
      //生成图片保存后返回的路径
      let imgs = files.map((x) => {
        //2021.09.25修复示例上传路径逻辑错误的问题
        if (x.path) {
          return x.path;
        }
        return result.data + x.name;
      });
      // //获取vue父组件(查询界面)
      // this.$emit('parentCall',($parent)=>{
      // })
      //将图片通过逗号隔开，重新写入明细表的行数据中
      this.row.Remark = imgs.join(",");
      this.model = false;
      return true;
    },
  },
};
</script>
