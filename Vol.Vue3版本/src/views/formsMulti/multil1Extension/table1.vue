<template>
  <div class="container">
    <el-alert
      type="info"
      style="margin-bottom: 10px"
      show-icon
      title="显示多个table"
      ><div>
        1、上面table由代码生成器生成，可以在自己添加的页面把生成的引用进来使用
      </div>
      <div>2、见multi1.vue文件、multil1Extension</div>
    </el-alert>
    <div class="header">
      <div class="text">双击表编辑</div>
      <div class="btns">
        <el-button type="primary" size="mini" plain @click="clear"
          >清空表</el-button
        >
        <el-button type="primary" size="mini" plain @click="del"
          >删除行</el-button
        >
        <el-button type="primary" size="mini" plain @click="add"
          >添加行</el-button
        >
        <el-button type="primary" size="mini" plain @click="getRows"
          >获取选中的行</el-button
        >
      </div>
    </div>

    <vol-table
      ref="table"
      :columns="columns"
      :max-height="200"
      :index="true"
      :tableData="tableData"
      :paginationHide="true"
    ></vol-table>
    <br />
  </div>
</template>
<script>
import VolTable from "@/components/basic/VolTable.vue";

export default {
  components: { VolTable },
  methods: {
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
    add() {
      this.tableData.push({});
    },
    getRows() {
      let rows = this.$refs.table.getSelected();
      if (rows.length == 0) {
        return this.$Message.error("请先选中行1");
      }
      this.$Message.info("当前选中的行数据：" + JSON.stringify(rows));
    },
  },
  created() {},
  data() {
    return {
      text: "",
      tableData: [
        //表数据
        {
          ExpertId: 276,
          ExpertName: "起名太麻烦",
          HeadImageUrl:
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x1.jpg",
          UserName: "13888888882",
          UserTrueName: "月穿潭底水無痕 ",
          AuditStatus: 1,
          Enable: 1,
          ReallyName: "月穿潭底水無痕 ",
          CreateDate: "2018-09-18 17:45:54",
        },
        {
          ExpertId: 276,
          ExpertName: "取名难好难",
          HeadImageUrl:
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/tj01.jpg",
          UserName: "13888888883",
          UserTrueName: "乌拉圭 ",
          AuditStatus: 2,
          Enable: 0,
          ReallyName: "月穿潭底水無痕 ",
          CreateDate: "2018-09-18 17:45:54",
        },
      ],
      columns: [
        //表配置
        {
          field: "ExpertId", //数据库表字段,必须和数据库一样，并且大小写一样
          title: "主键ID", //表头显示的名称
          type: "int", //数据类型
          isKey: true, //是否为主键字段
          width: 80, //表格宽度
          hidden: true, //是否显示
          readonly: true, //是否只读(功能未启用)
          require: true, //是否必填(功能未启用)
          align: "left", //文字显示位置
        },
        {
          field: "ExpertName",
          title: "名称",

          width: 150,
          align: "left",
          edit: { type: "text" },
          sortable: true, //是否排序(目前第一个字段为排序字段，其他字段排序开发中)
        },
        {
          field: "HeadImageUrl",
          title: "头像",
          type: "img",
          width: 80,
          align: "left",
        },
        {
          field: "UserName",
          title: "申请人帐号",
          width: 120,
          hidden: true, //是否显示
          edit: { type: "text" },
          align: "left",
        },
        {
          field: "UserTrueName",
          title: "申请人",

          width: 120,
          align: "left",
          click: (row, column) => {
            //单元格点击事亻
            this.$message.error("此单元格没有设置为可以编辑");
          },
          formatter: (row) => {
            //对单元格的数据格式化处理
            return row.UserTrueName;
          },
        },
        {
          field: "AuditStatus",
          title: "审核状态",
          type: "int",
          bind: {
            //如果后面返回的数据为数据源的数据，请配置此bind属性，可以从后台字典数据源加载，也只以直接写上
            key: "audit",
            data: [
              { key: "0", value: "审核中" },
              { key: "1", value: "审核通过" },
              { key: "2", value: "审核未通过" },
            ],
          },
          width: 120,
          align: "left",
        },
        {
          field: "Enable",
          title: "是否启用",
          type: "byte",
          bind: { key: "enable", data: [] }, //此处值为data空数据，自行从后台字典数据源加载
          width: 80,
          require: true,
          align: "left",
          edit: { type: "switch" },
        },
        {
          field: "CreateDate",
          title: "创建时间",
          type: "datetime",
          width: 150,
          readonly: true,
          align: "left",
          edit: { type: "datetime" },
          sortable: true,
        },
        {
          field: "ReallyName",
          title: "真实姓名",

          width: 120,
          click: (row, column) => {
            //单元格点击事亻
            let msg =
              "此处可以自己自定格式显示内容,此单元格原始值是:【" +
              row.ReallyName +
              "】";
            this.$message.error(msg);
          },
          formatter: (row, column) => {
            //对单元格的数据格式化处理
            return "<a style='color:rgb(15, 132, 255);'>点我</a>";
          },
          align: "left",
        },
        {
          field: "Creator",
          title: "创建人",

          width: 130,
          hidden: true,
          align: "left",
        },
      ],
    };
  },
};
</script>
<style lang="less" scoped>
.container {
  background: white;
  margin-top: 12px;
  padding: 15px;
  border-top: 10px solid #eee;
}
.header {
  display: flex;
  margin-bottom: 10px;
  .text {
    line-height: 30px;
    border-bottom: 2px solid #607d8b;
    font-size: 16px;
    /* color: #FF9800; */
    font-weight: 500;
  }
  .btns {
    flex: 1;
    text-align: right;
  }
}
</style>