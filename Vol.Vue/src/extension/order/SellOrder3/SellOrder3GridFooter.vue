<template>
  <div style="background: white; margin-top: 15px">
    <el-tabs type="border-card" style="height: 350px">
      <el-tab-pane>
        <span slot="label"><i class="el-icon-date"></i> 订单明细</span>
        <vol-table
          ref="tableList"
          :loadKey="true"
          :columns="columns"
          :pagination-hide="false"
          :height="210"
          :defaultLoadPage="false"
          @loadBefore="loadBefore"
          :endEditAfter="endEditAfter"
          url="/api/SellOrder/getDetailPage"
          :row-index="true"
          :columnIndex="true"
          :index="true"
          :click-edit="true"
        ></vol-table>
      </el-tab-pane>
      <el-tab-pane :lazy="true" label="消息中心">消息中心</el-tab-pane>
      <el-tab-pane :lazy="true" label="角色管理">角色管理</el-tab-pane>
      <el-tab-pane :lazy="true" label="定时任务补偿">定时任务补偿</el-tab-pane>
    </el-tabs>
  </div>
</template>

<script>
import VolTable from "@/components/basic/VolTable.vue";
export default {
  components: {
    VolTable,
  },
  methods: {
    loadBefore(params, callback) {
      //设置查询 条件

      var _row;
      //获取主表选中的行
      this.$emit("parentCall", ($vue) => {
        var rows = $vue.getSelectRows();
        if (rows.length) {
          _row = rows[0];
        }
      });
      if (!_row){
        //取消选中，清空明细
        return this.$refs.tableList.rowData.length=0;
        //  return this.$Message.error("请选中主表行数据");
      }
      
    

      //设置查询条件，用主表id加载明细表数据(如果是自己定义的接口，这里条件自己处理)
      params.value = _row.Order_Id;
      //设置排序字段(如果是自己定义的接口，排序字段不一定填写)
      if (!params.sort) {
        params.sort = "CreateDate";
      }
      return callback(true);
    },
    endEditAfter(row) {
      //结束编辑时，可以直接调用后台的代码进行保存
      console.log(row);
      return true;
    },
    save(row) {
      //保存
      this.$Message.info("保存");
    },
    del(row) {
      this.$confirm(
        "确认要删除此行数据【" + row.ProductName + "】？？",
        "确认信息",
        {
          distinguishCancelAndClose: true,
          confirmButtonText: "确认删除",
          cancelButtonText: "取消",
        }
      )
        .then(() => {
          this.$message({
            type: "info",
            message: "提交删除请求",
          });
        })
        .catch((action) => {
          this.$message({
            type: "info",
            message: action === "cancel" ? "放弃删除" : "停留在当前页面",
          });
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
                  this.del(row);
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
                  this.$refs.tableList.edit.rowIndex=index;
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
                  this.$refs.tableList.edit.rowIndex=-1;
                  this.save();
                },
              },
            },
            "保存"
          ),
        ]);
      };
    },
  },
  data() {
    return {
      tableData: [],
      //从生成的代码sellorder2.vue里面把明细配置复制过来就能用
      columns: [
        {
          field: "OrderList_Id",
          title: "OrderList_Id",
          type: "string",
          width: 90,
          hidden: true,
          require: true,
        },
        {
          field: "Order_Id",
          title: "订单Id",
          type: "string",
          width: 90,
          hidden: true,
          readonly: true,
        },
        {
          field: "ProductName",
          title: "商品名称",
          type: "string",
          bind: { key: "pn", data: [] },
          width: 150,
          edit: { type: "select" },
          require: true,
        },
        {
          field: "MO",
          title: "批次",
          type: "string",
          width: 100,
          edit: { type: "" },
          require: true,
          sort: true,
        },
        {
          field: "Qty",
          title: "数量",
          type: "int",
          width: 90,
          edit: { type: "drop" },
          summary: true, //设置求和
          require: true
        },
        {
          field: "Weight",
          title: "重量",
          type: "decimal",
          summary: true, //设置求和
          width: 90,
          edit: { type: "" },
        },
        {
          field: "Creator",
          title: "创建人",
          type: "string",
          width: 100,
        },
        {
          field: "CreateDate",
          title: "创建时间",
          type: "datetime",
          width: 140,
          sort: true,
        },
        {
          title: "操作",
          fixed: "right",
          width: 80,
          render: this.getRender(),
        },
      ],
    };
  },
};
</script>
<style scoped>
h3 {
  font-weight: 500;
  padding-left: 10px;
  background: white;
  margin-top: 10px;
  padding-top: 6px;
  padding-bottom: 5px;
}
</style>