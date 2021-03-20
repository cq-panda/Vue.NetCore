<template>
  <div class="container">
    <Alert type="success" show-icon>
      table从api加载数据
      <div slot="desc">
        根据组件api文档中voltable配置table显示与数据加载，更多功能参数配置见组件api->voltable
      </div>
    </Alert>
    <!-- 查询配置 -->
    <div style="padding: 0px 20px">
      <VolHeader
        icon="md-apps"
        text="从api加载数据"
        style="margin-bottom: 10px; border: 0px; margin-top: 15px"
      >
        <div slot="content"></div>
        <slot>
          <div style="text-align: right">
            <Input
              style="width: 200px; margin-right: 10px"
              v-model.number="searchFields.Name"
              placeholder="姓名"
            />
            <DatePicker
              style="width: 200px"
              type="datetime"
              placeholder="提交时间"
              v-model="searchFields.CreateDate1"
            ></DatePicker>
            -
            <DatePicker
              style="width: 200px"
              type="datetime"
              placeholder="提交时间"
              v-model="searchFields.CreateDate2"
            ></DatePicker>
            <Button type="info" ghost @click="load" style="margin-left: 20px"
              >查询</Button
            >
            <Button type="info" ghost @click="del">删除行</Button>
            <Button type="info" ghost @click="getRows">获取选中的行</Button>
          </div>
        </slot>
      </VolHeader>

      <!-- table数据 -->
      <!-- :max-height="450" -->
      <vol-table
        ref="table"
        :loadKey="true"
        :columns="columns"
        :pagination-hide="false"
        :height="200"
        :url="url"
        :index="true"
        :click-edit="true"
        @endEditBefore="endEditBefore"
        :beginEdit="beginEdit"
        @loadBefore="loadTableBefore"
        @loadAfter="loadTableAfter"
      ></vol-table>
    </div>
  </div>
</template>
<script>
import VolTable from "@/components/basic/VolTable.vue";
import VolHeader from "@/components/basic/VolHeader.vue";
export default {
  components: { VolTable, VolHeader },
  created() {},
  data() {
    return {
      //查询条件字段
      searchFields: {
        CreateDate1: "",
        CreateDate2: "",
        UserName: "",
      },
      url: "api/App_Transaction/getPageData", //后从加载数据的url
      columns: [
        {
          field: "Id",
          title: "主键ID",
          type: "int",
          width: 90,
          hidden: true,
          readonly: true,
          require: true,
        },
        {
          field: "Name",
          title: "姓名",
          type: "string",
          width: 90,
          require: true,
          edit: { type: "text" },
        },
        {
          field: "PhoneNo",
          title: "电话",
          type: "string",
          link: true,
          width: 100,
          require: true,
        },
        {
          field: "Quantity",
          title: "数量",
          type: "int",
          width: 80,
          require: true,
           edit: { type: "text" },
        },
        {
          field: "TransactionType",
          title: "是否买入",
          type: "int",
          bind: { key: "cq", data: [] },
          width: 80,
          edit: { type: "switch" },
        },
        {
          field: "CowType",
          title: "购买类型",
          type: "string",
          bind: { key: "nav", data: [] },
          width: 130,
          edit: { type: "select" },
        },
        {
          field: "Describe",
          title: "描述",
          type: "string",
          width: 120,
          require: true,
        },
        {
          field: "CreateDate",
          title: "提交时间",
          type: "datetime",
          width: 130,
        },
        { field: "操作", title: "操作", width: 120, render: this.getRender() },
      ],
    };
  },
  methods: {
    //点击查询时生成查询条件
    loadTableBefore(param, callBack) {
      //此处是从后台加数据前的处理，自己在此处自定义查询条件,查询数据格式自己定义或参考代码生成器查询页面请求的数据格式
      console.log("加载数据前" + param);
      //生成查询条件
      param.wheres = [
        //设置为like模糊查询
        { name: "Name", value: this.searchFields.Name, displayType: "like" },
        //设置日期查询>=、<=
        {
          name: "CreateDate",
          value: this.searchFields.CreateDate1,
          displayType: "thanorequal",
        },
        {
          name: "CreateDate",
          value: this.searchFields.CreateDate2,
          displayType: "lessorequal",
        },
      ];
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
      this.delClick();
      //   this.$refs.table.delRow();
      //此处可以接着写删除后台的代码
    },
    getRows() {
      let rows = this.$refs.table.getSelected();
      if (rows.length == 0) {
        return this.$message.error("请先选中行1");
      }
      let text = "当前选中的行数据：" + JSON.stringify(rows);

      this.$Message.info(text);
    },
    endEditBefore(row, column, index) {
      //可以自动结束编辑时，自动执行保存，下面getRender的保存按钮去掉
      // this.editSave();
      return true;
    },
    beginEdit(row, column, index){
      //编辑前将购买类型转换成数字，否则与字典的类型对应不上绑定不了默认值
      row.CowType= row.CowType*1;
      return true;
    }, 
    editSave(row) {
      //调用框架的默认保存方法
      this.http
        .post("/api/App_Transaction/update", { mainData: row }, true)
        .then((x) => {
          this.$Message.info("保存成功");
          console.log("保存结果：" + JSON.stringify(x));
        });
    },
    delClick(row) {
      //删除
      let tigger = false;
      this.$Modal.confirm({
        title: "删除警告!",
        content: "确认要删除选择的数据吗?",
        onOk: () => {
          if (tigger) return;
          tigger = true;
          let url = this.getUrl(this.const.DEL);
          this.http.post(url, [row.Id], "正在删除数据....").then((x) => {
            if (!x.status) return this.$error(x.message);
            this.$success(x.message);
            this.refresh();
          });
        }, //, onCancel: () => {}
      });
    },
    getRender() {
      return (h, { row, column, index }) => {
        return h("div", { style: {} }, [
          h(
            "a",
            {
              props: {},
              style: { "border-bottom": "1px solid" },
              on: {
                click: (e) => {
                  e.stopPropagation();
                  this.delClick(row);
                },
              },
            },
            "删除"
          ),
          h(
            "a",
            {
              props: {},
              style: { "margin-left": "9px", "border-bottom": "1px solid" },
              on: {
                click: (e) => {
                  e.stopPropagation();
                  //将当前行设置为编辑行
                  this.$refs.table.edit.rowIndex = index;
                },
              },
            },
            "编辑"
          ),
          h(
            "a",
            {
              props: {},
              style: { "margin-left": "9px", "border-bottom": "1px solid" },
              on: {
                click: (e) => {
                  e.stopPropagation();
                  //强制结束编辑
                  this.$refs.table.edit.rowIndex = -1;
                  //执行保存方法
                  this.editSave(row);
                },
              },
            },
            "保存"
          ),
        ]);
      };
    },
  },
};
</script>