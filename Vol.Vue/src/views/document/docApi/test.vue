<template>
  <div>
    <div class="vol-demo keep-edit">
      <VolHeader icon="md-podium" text="始终开启编辑">
        <div slot="content">配置columns属性edit.keep=true即可始终开启编辑状态..</div>
        <div style="text-align: right;">
          <Button type="info" size="small" ghost >还没好想好</Button>
        </div>
      </VolHeader>
      <vol-table ref="table3" :columns="columns" :index="true" :tableData="tableData"></vol-table>
    </div>
    <!-- 上传图片弹出框 -->
    <VolBox
      icon="ios-chatbubbles"
      :model.sync="model"
      title="选择图片"
      :height="220"
      :url="url"
      :width="520"
      :desc="true"
      :padding="15"
    >
      <VolUpload
        style="text-align: center; border: 1px dotted #FF9800;padding: 20px;"
        :autoUpload="false"
        :multiple="true"
        :url="url"
        :max-file="3"
        :img="true"
        :fileInfo="fileInfo"
        :upload-after="uploadAfter"
      >
        <div>选择图片</div>
      </VolUpload>
    </VolBox>
  </div>
</template>
<script>
import VolBox from "@/components/basic/VolBox.vue";
import VolTable from "@/components/basic/VolTable.vue";
import VolUpload from "@/components/basic/VolUpload.vue";
import VolHeader from "@/components/basic/VolHeader.vue";

export default {
  components: { VolTable, VolBox, VolHeader, VolUpload },
  data() {
    return {
      url: "/api/app_news/upload", //使用后台自带的上传文件方法，也可以自定义方法上传
      uploadRow: {},
      fileInfo: [],
      model: false,
      tableData: [
        {
          userName: "拉美西斯",
          imgs:
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x2.jpg",
          enable: 1,
          date: "2020-03-18 17:45:54"
        },
        {
          userName: "梁什么伟",
          imgs:
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x2.jpg",
          enable: 0,
          date: "2020-03-20 12:20:30"
        }
      ],
      columns: [
        {
          field: "userName",
          title: "用户名",
          require: true,
          edit: { type: "text", keep: true },
          width: 150
        },
        {
          field: "imgs",
          title: "图文介绍",
          type: "img",
          width: 200
        },
        {
          field: "upload",
          title: "上传头像",
          width: 160,
          formatter: () => {
            return "<div class='img-btn'>选择图片</div>";
          },
          click: (row, column, event) => {
            this.uploadRow = row; //记录当前上传图片的行
            //清空上传组件的默认图片
            this.fileInfo.splice(0);
            //如果当前的row行有图片，直接将图片添加上传组件中
            if (row.imgs) {
              let _imgs = row.imgs.split(",");
              for (let i = 0; i < _imgs.length; i++) {
                this.fileInfo.push({ path: _imgs[i], name: "11" });
              }
            }
            this.model = true;
          }
        },
        {
          field: "enable",
          title: "是否可用",
          require: true,
          width: 130,
          edit: { type: "switch", keep: true },
          bind: {
            //如果后面返回的数据为数据源的数据，请配置此bind属性，可以从后台字典数据源加载，也只以直接写上
            key: "audit",
            data: [
              { key: 0, value: "否" },
              { key: 1, value: "是" }
            ]
          },
          onChange: (row, column, data, value) => {
            this.$Message.info(value ? "是" : "否");
          }
        },
        {
          field: "date",
          title: "日期",
          edit: { type: "datetime", keep: true },
          width: 150
        },
        {
          field: "save",
          title: "操作",
          width: 150,
          formatter: () => {
            return "<div  class='oper-btn'>保存</div>";
          },
          click: (row, column, event) => {
            this.$Message.info("当前保存的行数据：" + JSON.stringify(row));
          }
        }
      ]
    };
  },
  created() {},
  methods: {
    //文件上传后
    uploadAfter(result, files) {
      if (!result.status) return true;
      let imgs = [];
      files.forEach(x => {
        imgs.push(result.data + x.name);
      });
      // //将图片填写表格中
      this.uploadRow.imgs = imgs.join(",");
      //强制刷新表格数据
      let _rows = this.tableData.splice(0);
      this.tableData.push(..._rows);
      this.model = false;
      return true;
    }
  }
};
</script>

<style lang="less" scoped>
.vol-demo {
  box-shadow: 0px 0px 10px #ccc9c9;
  padding: 23px;
}
</style>

<style scoped>
.keep-edit >>> .oper-btn,
.keep-edit >>> .img-btn {
  width: 75px;
  border-radius: 4px;
  padding: 2px 15px;
  background: #eee;
  color: #fff;
  background-color: #03a9f4;
  border-color: #19be6b;
  text-align: center;
  font-size: 12px;
  line-height: 24px;
  cursor: pointer;
}
.keep-edit >>> .oper-btn {
  background-color: #19be6b;
}
</style>

