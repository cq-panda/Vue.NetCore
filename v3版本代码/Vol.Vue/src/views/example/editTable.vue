<template>
  <div style="padding:100px;">
    <Button type="info" @click="beginEdit">开始编辑</Button>
    <Button type="success" @click="endEdit">结束编辑</Button>
    <vol-table
      ref="table"
      :paginationHide="true"
      :tableData="data"
      :columns="columns"
      :height="520"
    ></vol-table>
  </div>
</template>
<script>
import VolTable from "@/components/basic/VolTable.vue";
export default {
  components: {

    VolTable: VolTable
  },
  methods: {
    beginEdit() {
      this.$refs.table.beginEdit();
    },
    endEdit() {
      this.$refs.table.endEdit();
    }
  },
  data() {
    return {
              value:"1",
      columns: [
        {
          field: "columnName",
          title: "列名",
          width: 120,
          align: "left",
          editType: "text"
        },
        {
          field: "tableName",
          title: "表名",
          width: 150,
          align: "left"
        },
        {
          field: "columnType",
          title: "数据类型",
          width: 120,
          align: "left",
          edit: { type: "text", status: false, data: "", key: "" }
        },
        {
          field: "isColumnData",
          title: "数据列",
          width: 120,
          align: "left",
          editType: "select",
          edit: { type: "switch", status: true, data: [{key:"1",value:"是"},{key:"0",value:"否"}], key: "" }
        },
        {
          field: "createDate",
          title: "创建时间",
          width: 120,
          align: "left",
          edit: { type: "date", status: false}
        }
      ],
      data: [
        {
          columnName: "clo1",
          tableName: "还没想好",
          columnType: "string",
          isColumnData: 1,
          createDate: "2019-07-31"
        },
        {},
        {
          columnName: "clo2",
          tableName: "还没想好",
          columnType: "string",
          isColumnData: 1,
          createDate: "2019-07-31"
        }
      ]
    };
  }
};
</script>
