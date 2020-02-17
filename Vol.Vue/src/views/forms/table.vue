<template>
  <div class="container" style="padding: 30px 100px;">
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

    <Divider>table组件从后台加载数据</Divider>
    <div style="margin-bottom:10px;">
      <Button type="info" ghost @click="load">刷新表数据</Button>
      <Button type="info" ghost @click="del">删除行</Button>
      <Button type="info" ghost @click="getRows">获取选中的行</Button>
    </div>
    <vol-table
      ref="table"
      :loadKey="true"
      :linkView="_linkView"
      :columns="columns"
      :pagination="pagination"
      :height="300"
      :url="url"
      :index="true"
      @loadBefore="loadTableBefore"
      @loadAfter="loadTableAfter"
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
    loadTableBefore(param, callBack) {
      //此处是从后台加数据前的处理，自己在此处自定义查询条件,查询数据格式自己定义或参考代码生成器查询页面请求的数据格式
      console.log("加载数据前" + param);
      callBack(true); //此处必须进行回调，返回处理结果，如果是false，则不会执行后台查询
    },
    loadTableAfter(data, callBack) {
      //此处是从后台加数据后，你可以在渲染表格前，预先处理返回的数据
      console.log("加载数据后" + data);
      callBack(true); //同上
    },
    load() {
      //此处可以自定义查询条件,如果不调用的框架的查询，格式需要自己定义，
      //如果查询的是框架getPageData方法,需要指定格式,如:
      // let where={wheres:[{"name":"UserTrueName","value":"教兽",displayType:"text"}]};
      let where = {};
      this.$refs.table.load(where);
    },
    del() {
      let rows = this.$refs.table.getSelected();
      if (rows.length == 0) {
        return this.$message.error("请先选中行");
      }
      this.$refs.table.delRow();
      //此处可以接着写删除后台的代码
    },
    getRows() {
      let rows = this.$refs.table.getSelected();
      if (rows.length == 0) {
        return this.$message.error("请先选中行1");
      }
      this.text = "当前选中的行数据：" + JSON.stringify(rows);
      this.viewModel = true;
      return rows;
    }
  },
  created() {
  },
  data() {
    return {
      text: "",
      viewModel: false, //点击单元格时弹出框
      url: "api/App_Expert/getPageData", //后从加载数据的url
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
          hidden: true, //是否显示
          align: "left",
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
          align: "left"
        },
        {
          field: "UserTrueName",
          title: "申请人",
          type: "string",
          width: 120,
          align: "left"
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
          align: "left"
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
          formatter: () => {
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
        },
        {
          field: "CreateDate",
          title: "申请时间",
          type: "datetime",
          width: 150,
          readonly: true,
          align: "left",
          sortable: true
        }
      ],
      pagination: {
        total: 0, //分页总数量
        size: 30, //分页大小,30,60,100.
        sortName: "CreateDate" //从后加载数据分页时的排序字段
      }
    };
  }
};
</script>