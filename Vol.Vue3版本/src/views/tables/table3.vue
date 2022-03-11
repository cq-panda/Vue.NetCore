<template>
  <div class="example-tb">
    <el-alert title="功能说明" type="info" show-icon :closable="false">
      <p>1、日期(内容)格式化。</p>
      <p>2、单元格点击事件、双击事件。</p>
      <p>3、单元格背景颜色、文字换行等...</p>
      <p>
        4、具体使用见：框架文档->组件api->voltable。<a
          href="http://v2.volcore.xyz/document/api"
          target="_blank"
          >点击查看文档
        </a>
      </p>
    </el-alert>
    <div class="tb">
      <div class="btns" style="margin-bottom: 10px">
        <el-button type="success" size="small" @click="getSelect"
          ><i class="el-icon-check"></i>获取选中行</el-button
        >

        <el-button type="primary" size="small" @click="addRow"
          ><i class="el-icon-plus"></i>添加行</el-button
        >
        <el-button type="primary" size="small" @click="clear"
          ><i class="el-icon-delete"></i>清空数据</el-button
        >
      </div>
      <!-- @rowClick单击事件 -->
      <vol-table
        ref="table"
        :columns="columns"
        :max-height="500"
        :columnIndex="false"
        :ck="true"
        :text-inline="false"
        @row-dbclick="rowDbClick"
        :tableData="tableData"
        :paginationHide="true"
      ></vol-table>
    </div>
    <br />

    <VolBox
      :lazy="true"
      v-model="model"
      :title="title"
      :height="350"
      :width="700"
    >
      <div>当前点击的行数据<br>{{currentRow}}</div>
    </VolBox>
  </div>
</template>
<script>
/*********************此示例采用的vue2语法，也可以使用vue3语法***************************/
import VolTable from "@/components/basic/VolTable.vue";
import VolHeader from "@/components/basic/VolHeader.vue";

import VolBox from "@/components/basic/VolBox.vue";
import VolUpload from "@/components/basic/VolUpload.vue";
import { ref, getCurrentInstance } from "vue";
export default {
  components: {
    VolTable,
    VolBox,
    VolHeader,
    VolUpload,
  },
  setup() {},
  data() {
    return {
      currentRow:'',
      model: false,
      url: "/api/app_news/upload", //使用后台自带的上传文件方法，也可以自定义方法上传
      text: "",
      tableData: [
        //表数据
        {
          ExpertName: "天生注定(弹出框)",
          files:
            "https://files-1256993465.cos.ap-chengdu.myqcloud.com/测试现有文件可下载1.xlsx",
          UserName: "12345",
          UserTrueName: "7月23日，丰田汽车(中国)投资，将召回共计238540辆汽车",
          AuditStatus: 0,
          Enable: 1,
          CreateDate: "2018-09-18 17:45:54",
        },
        {
          ExpertName: "还没想好(弹出框)",
          files:
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x1.jpg,https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x2.jpg",
          UserName: "56789",
          UserTrueName: '沪漂夫妻买不起房 用4个集装箱改装成"花园豪宅"',
          AuditStatus: 1,
          Enable: 1,
          CreateDate: "2018-09-18 17:45:54",
        },
      ],
      columns: [
        //表配置
        {
          field: "ExpertName",
          title: "点击单元格事件",
          width: 100,
          formatter: (row, column) => {
            return `<a style="color: #1e8cff;cursor: pointer;">${
              row.ExpertName || ""
            }</a>`;
          },
          click: (row, column) => {
            this.currentRow=JSON.stringify(row);
            this.model=true;
          },
        },
        {
          field: "双击单元格",
          title: "双击单元格",
          formatter: (row, column) => {
            return `<a style="color:red;cursor: pointer;">双击单元格</a>`;
          },
        },
        {
          field: "files",
          title: "文件下载",
          type: "file", //img,excel,file可以选择
          width: 150,
        },
        {
          field: "UserName",
          title: "单元格颜色",
          width: 70,
          cellStyle: (row, rowIndex, columnIndex) => {
            if (row.UserName == "12345") {
              return { background: "#ecf5ff", color: "#409EFF" };
            } else {
              return { background: "#66b1ff", color: "#ffff" };
            }
          },
        },
        {
          field: "UserTrueName",
          title: "超出换行显示",
          width: 160,
        },
        {
          field: "AuditStatus",
          title: "下拉框",
          type: "int",
          bind: {
            key: "audit",
            data: [],
          },
          width: 100,
          onChange: (row, column) => {
            this.$message.success(row.AuditStatus + "");
          },
        },
        {
          field: "Enable",
          title: "Switch事件",
          type: "byte",
          bind: { key: "enable", data: [] }, //会自动从后台字典数据源加载
          width: 70,
          require: true,
          align: "left",
          edit: { type: "switch", keep: true }, //keep始终开启编辑状态
          onChange: (val, row, column) => {
            this.$message.info("switch点击事件：" + row.Enable);
          },
        },
        {
          field: "CreateDate",
          title: "日期格式化",
          type: "datetime",
          width: 100,
          formatter: (row, column) => {
            return (row.CreateDate || "").split(" ")[0].replace(/-/g, ".");
          },
        },
      ],
    };
  },
  methods: {
    rowDbClick({ row, column, event }) {
      //双击事件
      this.$message.warning("双击当前行事件并选中当前行");
      this.$refs.table.$refs.table.toggleRowSelection(row);
    },
    del() {
      let rows = this.$refs.table.getSelected();
      if (rows.length == 0) {
        return this.$message.error("请先选中行");
      }
      this.$refs.table.delRow();
    },
    clear() {
      this.tableData.splice(0);
    },
    addRow() {
      //添加行时设置默认值
      this.tableData.push({ Enable: 1, UserName: "这里是默认值" });
    },
    getSelect() {
      //获取选中的行
      let rows = this.$refs.table.getSelected();

      return this.$message.error("请先选中行:" + JSON.stringify(rows));
    },
  },
};
</script>
<style lang="less" scoped>
.example-tb {
  padding: 15px;
}
.tb {
  margin-top: 15px;
}
.v-header {
  background: white;
  padding: 10px;
}
</style>
