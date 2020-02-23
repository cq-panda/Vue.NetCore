<template>
  <div class="m-detail">
    <div class="m-title">
      <h2>订单详情</h2>
    </div>
    <div class="m-tabs">
      <Tabs>
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
            url="/api/App_Appointment/getPageData"
            @loadBefore="loadBefore"
            :defaultLoadPage="false"
            :pagination-hide="false"
          ></vol-table>
        </TabPane>
        <TabPane label="订单明细" icon="md-apps">
          <VolForm ref="myform" :loadKey="loadKey" :formFileds="formFileds" :formRules="formRules"></VolForm>
          <div class="m-btn">
            <Button type="info" @click="()=>{}">保存</Button>
          </div>
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
      row: {},
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
      columns: [
        {
          field: "Name",
          title: "姓名",
          type: "string",
          width: 100,
          sortable: true
        },
        { field: "Describe", title: "描述", type: "string", width: 180 },
        { field: "PhoneNo", title: "电话", type: "string", width: 130 },
        {
          field: "CreateID",
          title: "CreateID",
          type: "int",
          width: 80,
          hidden: true
        },
        { field: "Creator", title: "创建人", type: "string", width: 130 }
      ]
    };
  },
  methods: {
    rowChangeLoadData(row) {
      //选中行后触发扩展tabs的方法，可以在此处加载tabs里的数据
      // this.http.post("/xxx",{},'正在加载数据').then(x=>{
      // })
      if (this.$refs.table) {
        this.row = row; //保存当前触发的行数据，下面查询时用
        //触发table查询
        this.$refs.table.load(null, true);
      }
      console.log("选中行触发tabs方法：" + JSON.stringify(row));
    },
    loadBefore(param, callBack) {
      //单选时触发查询前方法
      //查询前设置查询条件及分页信息
      //根据当前字段查询
      param.wheres = [{ name: "Name", value: this.row.Name }];
      callBack(true);
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