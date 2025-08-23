<template>
  <div class="example-tb">
    <el-alert
      title="table从后台api加载数据源"
      type="warning"
      show-icon
      :closable="false"
    >
      <p>
        1、只需要配置好列信息即可从后台加载(自动求和见代码中的备注说明或table组件api)。
      </p>
      <p>
        2、如果需要筛选条件，在loadTableBefore方法中按demo格式提交查询参数即可
      </p>
      <p>
        3、具体使用见：框架文档->组件api->voltable。<a
          href="http://v2.volcore.xyz/document/api"
          target="_blank"
          >点击查看文档
        </a>
      </p>
    </el-alert>
    <div class="tb">
      <div class="search-info">
        <vol-form
          :label-width="80"
          ref="myform"
          class="my-form"
          :formFields="searchFields"
          :formRules="formOptions"
        >
        </vol-form>
        <div class="btns">
          <el-button type="danger" size="small" @click="getSelectRows"
            >获取选中行</el-button
          >
          <el-button type="primary" size="small" @click="search"
            ><i class="el-icon-search"></i>搜索</el-button
          >
        </div>
      </div>
      <vol-table
        ref="table"
        :columns="columns"
        :pagination-hide="false"
        :max-height="400"
        :url="url"
        :index="true"
        @loadBefore="loadTableBefore"
        @loadAfter="loadTableAfter"
      ></vol-table>
    </div>
  </div>
</template>
<script>
import VolTable from "@/components/basic/VolTable.vue";
import VolForm from "@/components/basic/VolForm.vue";
export default {
  components: { VolTable, VolForm },
  created() {},
  data() {
    return {
      //查询条件字段
      searchFields: {
        TranNo: "",
        CreateDate: [],
        OrderType: null,
      },
      formOptions: [
        //表单配置见表单组件文档
        [
          {
            title: "运单号",
            field: "TranNo",
            placeholder: "模糊查询",
          },
          {
            title: "订单类型",
            field: "OrderType",
            dataKey: "ordertype",
            placeholder: "订单类型",
            data: [],
            type: "select",
          },
          {
            title: "创建时间",
            range: true,
            colSize: 6,
            field: "CreateDate",
            type: "date",
            onChange:(val)=>{
           
            }
          },
        ],
      ],
      viewModel: false, //点击单元格时弹出框
      url: "api/SellOrder/getPageData", //后从加载数据的url
      columns: [
        { field: "Order_Id", title: "Id", width: 90, hidden: true },
        {
          field: "TranNo",
          title: "运单号",
          type: "string",
          width: 130,
          sort: true,
        },
        {
          field: "OrderType",
          title: "订单类型",
          type: "int",
          bind: { key: "ordertype", data: [] },
          width: 90,
          sort: true,
        },
        {
          field: "Qty",
          title: "销售数量",
          type: "int",
          width: 90,
          sort: true,
          summary: true, //前端只设置summary: true 即可求后，后台见SellOrderService.cs中查询方法说明
        },
        {
          field: "AuditStatus",
          title: "审核状态",
          type: "int",
          bind: { key: "audit", data: [] },
          width: 90,
          sort: true,
        },
        {
          field: "AuditDate",
          title: "审核时间",
          type: "datetime",
          width: 120,
          sort: true,
          sort: true,
        },
        {
          field: "Remark",
          title: "备注",
          type: "string",
          width: 100,
          sort: true,
        },
        {
          field: "Creator",
          title: "创建人",
          type: "string",
          width: 100,
          sort: true,
        },
        {
          field: "CreateDate",
          title: "创建时间",
          type: "datetime",
          width: 90,
          sort: true,
        },
      ],
    };
  },
  methods: {
    //点击查询时生成查询条件
    loadTableBefore(param, callBack) {
      console.log("加载数据前" + param);
      //生成查询条件
      param.wheres = [
        //设置为like模糊查询
        {
          name: "TranNo",
          value: this.searchFields.TranNo,
          displayType: "like",
        },
        {
          name: "OrderType",
          value: this.searchFields.OrderType,
        },
        {
          name: "CreateDate",
          value: this.searchFields.CreateDate[0],
          displayType: "thanorequal", //>=
        },
        {
          name: "CreateDate",
          value: this.searchFields.CreateDate[1],
          displayType: "lessorequal", //<=
        },
      ];
      callBack(true); //此处必须进行回调，返回处理结果，如果是false，则不会执行后台查询
    },
    loadTableAfter(data, callBack) {
      //此处是从后台加数据后，你可以在渲染表格前，预先处理返回的数据
      console.log("加载数据后" + data);
      callBack(true); //同上
    },
    search() {
      this.$refs.table.load();
    },
    del() {
      let rows = this.$refs.table.getSelected();
      if (rows.length == 0) {
        return this.$message.error("请先选中行");
      }
      this.$refs.table.delRow();
      //此处可以接着写删除后台的代码
    },
    getSelectRows() {
      let rows = this.$refs.table.getSelected();
      if (rows.length == 0) {
        return this.$message.error("请先选中行1");
      }
      let text = "当前选中的行数据：" + JSON.stringify(rows);
      this.$Message.info(text);
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
.search-info {
  display: flex;
  .my-form {
    width: 840px !important;
    margin-bottom: -15px;
  }
  .btns {
    margin-left: 15px;
    position: relative;
    margin-top: 2px;
  }
}
</style>
