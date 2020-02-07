<template>
  <div class="m-detail">
    <div class="m-title">
      <h2>订单详情</h2>
    </div>
    <div class="m-tabs">
      <Tabs>
        <TabPane label="订单明细" icon="md-apps">
          <VolForm ref="myform" :loadKey="loadKey" :formFileds="formFileds" :formRules="formRules"></VolForm>
          <div class="m-btn">
            <Button type="info" @click="()=>{}">保存</Button>
          </div>
        </TabPane>
        <TabPane label="配置要求" icon="md-apps">
          <div style="margin-bottom:10px;text-align: right;">
            <Button type="info" ghost @click="clear">清空表</Button>
            <Button type="info" ghost @click="del">删除行</Button>
            <Button type="info" ghost @click="add">添加行</Button>
            <Button type="info" ghost @click="getRows">获取选中的行</Button>
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
        </TabPane>
        <TabPane label="回款计划" icon="md-apps">2</TabPane>
        <TabPane label="回款情况" icon="md-apps">2</TabPane>
      </Tabs>
    </div>
    <br />
    <br />
    <br />
  </div>
</template>
<script>
import VolForm from "@/components/basic/VolForm.vue";
import VolTable from "@/components/basic/VolTable.vue";
import VolBox from "@/components/basic/VolBox.vue";
export default {
  components: {
    VolForm,
    VolTable,
    VolBox
  },
  data() {
    return {
      loadKey: true, //如果有下拉框的表单，这里设置为true,自动绑定下拉框数据
      formFileds: {
        Variety: "",
        AgeRange: "",
        DateRange: [],
        City: "",
        AvgPrice: 8.88,
        Date: ""
      },
      formRules: [
        [
          {
            dataKey: "age", //后台下拉框对应的数据字典编号
            data: [], //loadKey设置为true,会根据dataKey从后台的下拉框数据源中自动加载数据
            title: "月龄",
            filter: true,
            required: true, //设置为必选项
            field: "AgeRange",
            type: "select"
          },
          {
            title: "品种",
            dataKey: "pz",
            //如果这里绑定了data数据，后台不会加载此数据源
            data: [
              { key: "1", value: "1" },
              { key: "2", value: "2" }
            ],
            required: false,
            field: "Variety",
            type: "select"
          },
          {
            dataKey: "city",
            title: "城市",
            required: true,
            data: [],
            field: "City",
            type: "select"
          }
        ],
        [
          {
            type: "decimal",
            title: "成交均价",
            required: true,
            field: "AvgPrice"
          },
          {
            title: "日期",
            required: true,
            field: "Date",
            placeholder: "你可以设置colSize属性决定标签的长度，可选值12/8/6/4",
            colSize: 8, //设置宽度为2/3
            type: "date"
          }
        ]
      ],
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
          filetest:
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/github/exceltest.xlsx", //也是设置为api服务器的文件，地址如：static/20191206/xx.xlsx
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
          filetest:
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/github/wordtest.docx", //也是设置为api服务器的文件，地址如：static/20191206/xx.xlsx
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
          filetest:
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/github/wordtest.docx,https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/github/exceltest.xlsx", //也是设置为api服务器的文件，地址如：static/20191206/xx.xlsx
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
          field: "filetest",
          title: "点击文件下载",
          width: 190,
          type: "file" //指定为file与excel即可下载文件
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
  },
  methods: {
    rowChangeLoadData(row) {//选中行后触发扩展tabs的方法，可以在此处加载tabs里的数据
    // this.http.post("/xxx",{},'正在加载数据').then(x=>{


    // })
      console.log("选中行触发tabs方法：" + JSON.stringify(row));

    },
    _linkView(row, column) {
      this.text =
        "点击单元格的弹出框，当前点击的行数据：" + JSON.stringify(row);
      this.viewModel = true;
      //  this.$message.error(JSON.stringify(row));
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
      this.$refs.table.addRow({});
      //  this.tableData.push({});
    },
    getRows() {
      let rows = this.$refs.table.getSelected();
      if (rows.length == 0) {
        return this.$message.error("请先选中行1");
      }
      this.text = "当前选中的行数据：" + JSON.stringify(rows);
      this.viewModel = true;
    }
  }
};
</script>

<style lang="less" scoped>
.m-detail {
  min-height: 400px;
  margin-top: 20px;
  .m-tabs {
    background: white;
    padding: 0 15px;
  }
  .m-title {
    padding: 0 15px;
    h2 {
      font-weight: 500;
    }
  }
  .m-btn {
    text-align: right;
    padding: 10px 0;
  }
}
</style>