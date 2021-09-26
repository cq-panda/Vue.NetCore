<template>
  <VolBox
    :model.sync="model"
    title="选择数据"
    :lazy="true"
    :height="500"
    :width="1100"
    :padding="10"
  >
    <!-- 设置查询条件 -->
    <div style="padding-bottom: 10px">
      <span style="margin-right: 20px">请选择数据</span>
      <el-input
        placeholder="商品名称"
        style="width: 200px"
        v-model="ProductName"
      />
      <el-button
        type="primary"
        style="margin-left: 10px"
        size="medium"
        icon="el-icon-zoom-out"
        @click="search"
        >搜索</el-button
      >
    </div>
    <!-- vol-table配置的这些属性见VolTable组件api文件 -->
    <vol-table
      ref="mytable"
      :loadKey="true"
      :columns="columns"
      :pagination="pagination"
      :pagination-hide="false"
      :max-height="380"
      :url="url"
      :index="true"
      :single="true"
      :defaultLoadPage="false"
      @loadBefore="loadTableBefore"
    ></vol-table>

    <div slot="footer">
      <Button type="info" icon="ios-add" @click="addRow">添加选择的数据</Button>
      <Button type="success" icon="ios-remove" @click="model = false"
        >关闭</Button
      >
    </div>
  </VolBox>
</template>
<script>
import VolBox from "@/components/basic/VolBox.vue";
import VolTable from "@/components/basic/VolTable.vue";
export default {
  components: {
    VolBox: VolBox,
    VolTable: VolTable,
  },
  data() {
    return {
      model: false,
      ProductName: "",
      //从后台接口加载数据,这里的接口用的框架自带的查询，也可以自定义接口，见App_ExpertModelBody.vue中调用的后台getSelectorDemo方法
      url: "api/sellorderlist/getPageData",
      columns: [
        {
          field: "ProductName",
          title: "商品名称",
          type: "string",
          bind: { key: "pn", data: [] },
          width: 150,
          sort: true,
        },
        { field: "MO", title: "批次", width: 100, sort: true },
        { field: "Qty", title: "数量", width: 90, sort: true },
        { field: "Weight", title: "重量", twidth: 90, sort: true },
        { field: "Remark", title: "备注", width: 120, sort: true },
        { field: "Creator", title: "创建人", width: 130, sort: true },
        {
          field: "CreateDate",
          title: "创建时间",
          type: "datetime",
          width: 145,
          sort: true,
        },
      ],
      pagination: {},
      row: {}, //明细表选择的行
    };
  },
  methods: {
    open(row) {
      this.row = row;
      this.model = true;
      //打开弹出框时，加载table数据
      this.$nextTick(() => {
        this.$refs.mytable.load();
      });
    },
    search() {
      this.$refs.mytable.load();
    },
    addRow() {
      var rows = this.$refs.mytable.getSelected();
      if (!rows || rows.length == 0) {
        return this.$Message.error("请选择行数据");
      }
      //给当前行设置值
      this.row.ProductName = rows[0].ProductName;
      this.row.MO = rows[0].MO;
      this.row.Qty = rows[0].Qty;
      this.row.Weight = rows[0].Weight;
      this.row.Remark = rows[0].Remark;
      
      this.model = false;
    },
    loadTableBefore(params) {
      //查询前，设置查询条件
      params.wheres = [
        { name: "ProductName", value: this.ProductName, displayType: "like" },
      ];
      return true;
    },
  },
};
</script>