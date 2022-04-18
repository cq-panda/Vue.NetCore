<template>
  <div class="container" style="padding: 10px 10px;">
    <vol-box :model.sync="viewModel" :height="450" :width="600" title="点击表的弹出框">
      <div
        style="display: block;word-break: break-all;word-wrap: break-word;"
        slot="content"
      >{{text}}</div>
      <!--  <div slot="footer">这里可以自己扩展box，也可不用写 -->
      <div slot="footer">
        <Button type="info" @click="viewModel=false">确认</Button>
      </div>
    </vol-box>
    <Alert type="success" show-icon>可编辑的table,如果需要编辑又需要从后台加载数据，请与table.vue两个组件方法配合使用</Alert>
    <Divider>可编辑的table(双击表格即可编辑)</Divider>
    <div style="margin-bottom:10px;">
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
  </div>
</template>
<script>
// vol-table属性说明:
//linkView：点击表格的链接执行的方法
//columns表头列：显示表格列,见下面columns配置及属性说明
//pagination分页配置:见下面pagination配置及属性说明
//height表高度
//url从后台加载的数据的url
//index="true",设置为行有一个自动编号,如果要执行删除操作，必须设置此属性
import VolTable from "@/components/basic/VolTable.vue";
import VolBox from "@/components/basic/VolBox.vue";
export default {
  components: { VolTable, VolBox },
  methods: {
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
  },
  created() {
    //从后台加下拉框的[是否启用的]数据源
    let keys = [];
    let columnBind = [];
    this.columns.forEach(x => {
      if (x.bind && x.bind.key && (!x.bind.data || x.bind.data.length == 0)) {
        keys.push(x.bind.key);
        if (!x.bind.data) x.bind.data = [];
        columnBind.push(x.bind);
      }
    });
    if (keys.length == 0) return;
    this.http.post("/api/Sys_Dictionary/GetVueDictionary", keys).then(dic => {
      dic.forEach(x => {
        columnBind.forEach(c => {
          if (c.key == x.dicNo) {
            c.data.push(...x.data);
          }
        });
      });
    });
  },
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
  }
};
</script>