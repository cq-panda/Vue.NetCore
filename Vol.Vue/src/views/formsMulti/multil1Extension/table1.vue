<template>
  <div class="container">
    <div class="header">
      <div class="text">双击表编辑</div>
      <div class="btns">
        <Button type="info" ghost @click="clear">清空表</Button>
        <Button type="info" ghost @click="del">删除行</Button>
        <Button type="info" ghost @click="add">添加行</Button>
        <Button type="info" ghost @click="getRows">获取选中的行</Button>
      </div>
    </div>
    <vol-table
      ref="table"
      :linkView="_linkView"
      :columns="columns"
      :height="400"
      :index="true"
      :tableData="tableData"
      :paginationHide="true"
    ></vol-table>
    <br/>
    <br/>  <br/>
    <br/>
  </div>
  
</template>
<script>
import VolTable from "@/components/basic/VolTable.vue";
import VolBox from "@/components/basic/VolBox.vue";
export default {
  components: { VolTable, VolBox },
  methods: {
    _linkView(row, column) {
      this.text =
        "点击单元格的弹出框，当前点击的行数据：" + JSON.stringify(row);
      this.viewModel = true;
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
    add() {
      this.tableData.push({});
    },
    getRows() {
      let rows = this.$refs.table.getSelected();
      if (rows.length == 0) {
        return this.$Message.error("请先选中行1");
      }
      this.$Message.info("当前选中的行数据：" + JSON.stringify(rows));
     // this.viewModel = true;
    }
  },
  created() {},
  data() {
    return {
      text: "",
      viewModel: false, //点击单元格时弹出框
      tableData: [
        //表数据
        {
          ExpertId: 276,
          ExpertName: "财神爷",
          HeadImageUrl:
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/u%3D3441742992%2C2765570575%26fm%3D26%26gp%3D0.jpg",
          UserName: "13888888881",
          UserTrueName: "起名太麻烦 ",
          AuditStatus: 0,
          Enable: 1,
          ReallyName: "艹船借贱",
          CreateDate: "2018-09-18 17:45:54"
        },
        {
          ExpertId: 276,
          ExpertName: "你瞅啥?",
          HeadImageUrl:
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x1.jpg",
          UserName: "13888888882",
          UserTrueName: "月穿潭底水無痕 ",
          AuditStatus: 1,
          Enable: 1,
          ReallyName: "月穿潭底水無痕 ",
          CreateDate: "2018-09-18 17:45:54"
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
          CreateDate: "2018-09-18 17:45:54"
        }
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
          align: "left" //文字显示位置
        },
        {
          field: "ExpertName",
          title: "名称",
          type: "string",
          width: 150,
          align: "left",
          edit: { type: "text" },
          sortable: true //是否排序(目前第一个字段为排序字段，其他字段排序开发中)
        },
        {
          field: "HeadImageUrl",
          title: "头像",
          type: "img",
          width: 160,
          align: "left"
        },
        {
          field: "UserName",
          title: "申请人帐号",
          type: "string",
          link: true, //设置link=true后此单元格可以点击获取当前行的数据进行其他操作
          width: 120,
          hidden: true, //是否显示
          edit: { type: "text" },
          align: "left"
        },
        {
          field: "UserTrueName",
          title: "申请人",
          type: "string",
          width: 120,
          align: "left",
          click: (row, column) => {
            //单元格点击事亻
            this.$message.error("此单元格没有设置为可以编辑");
          },
          formatter: row => {
            //对单元格的数据格式化处理
            return row.UserTrueName;
          }
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
              { key: "2", value: "审核未通过" }
            ]
          },
          width: 120,
          align: "left"
        },
        {
          field: "Enable",
          title: "是否启用",
          type: "byte",
          bind: { key: "enable", data: [] }, //此处值为data空数据，自行从后台字典数据源加载
          width: 80,
          require: true,
          align: "left",
          edit: { type: "switch" }
        },
        {
          field: "CreateDate",
          title: "创建时间",
          type: "datetime",
          width: 150,
          readonly: true,
          align: "left",
          edit: { type: "datetime" },
          sortable: true
        },
        {
          field: "ReallyName",
          title: "真实姓名",
          type: "string",
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
            return "<a>点我</a>";
          },
          align: "left"
        },
        {
          field: "Creator",
          title: "创建人",
          type: "string",
          width: 130,
          hidden: true,
          align: "left"
        }
      ]
    };
  }
};
</script>
<style lang="less" scoped>
.container {
  background: white;
  margin-top: 20px;
  padding: 15px;
  border: 1px solid #b7c5cc;
}
.header {
  display: flex;
  margin-bottom: 10px;
  .text {
     line-height: 30px;
    border-bottom: 2px solid #607D8B;
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