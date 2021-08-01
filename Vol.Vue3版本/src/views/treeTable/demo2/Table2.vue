<template>
  <div style="padding: 12px 15px;">
    <VolHeader
      style="padding-bottom: 5px; border-bottom: 0;"
      icon="md-podium"
      text="点树形菜单自定义加载数据"
    >
      <!-- <div slot="content">当前选中的是:{{$store.getters.data().treeDemo2.text}}</div> -->
      <div style="text-align: right">
        <el-button type="primary" size="mini" @click="clear">清空表</el-button>
        <el-button type="primary" size="mini" @click="del">删除行</el-button>
        <el-button type="primary" size="mini" @click="add">添加行</el-button>
        <el-button type="primary" size="mini" @click="getRows"
          >获取选中的行</el-button
        >
      </div>
    </VolHeader>
  <el-alert
  style="margin-bottom: 5px;"
    title="自定义treetable页面"
    type="warning"
    description="具体见：TreeTable2.vue"
    show-icon>
  </el-alert>
    <vol-table
      ref="editTable"
      :columns="columns"
      :maxHeight="550"
      :loadKey="true"
      :index="true"
      :tableData="tableData"
      :pagination-hide="true"
    ></vol-table>
  </div>
</template>
  <script>
import VolTable from "@/components/basic/VolTable.vue";
import VolHeader from "@/components/basic/VolHeader.vue";
import options from "./tree_options";
export default {
  components: { VolTable, VolHeader },
  created() {
    //缓存当前table页面，点击左边树形菜单时，直接刷新此页面table数据
    this.$store.getters.data().tableDemo2 = this;
  },
  data() {
    return {
      tableData: [], //表数据，点击树菜单时赋值
      columns: [
        //表配置
        {
          field: "code", //数据库表字段,必须和数据库一样，并且大小写一样
          title: "编号", //表头显示的名称
          isKey: true, //是否为主键字段
          //  hidden: true //是否显示
        },
        {
          field: "address",
          title: "详细地址",
          type: "text",
          width: 150,
        },
        {
          field: "remark",
          title: "备注",
          type: "text",
          width: 150,
        },
        {
          field: "enable",
          title: "是否可用",
          bind: { key: "enable", data: [] }, //此处值为data空数据，自行从后台字典数据源加载
          width: 150,
          edit: { type: "switch", keep: true },
        },
        {
          field: "createDate",
          title: "创建日期",
          type: "datetime",
          width: 150,
        },
      ],
    };
  },
  methods: {
    refresh() {
      //点击左侧树形菜单时，刷新表数据
      let treeId = this.$store.getters.data().treeDemo2.treeId;
      if (treeId == undefined) {
        this.tableData = [];
      }

      let childrenIds = [];
      //options.tree的数据格式，可以从后台返回，在此处递归
      options.tree.forEach((x) => {
        if (x.parentId == treeId) {
          x.lv = 1;
          x.children = [];
          childrenIds.push(x.id);
          this.getTree(x.id, x, childrenIds);
        }
      });
      console.log(childrenIds);
      let rows = [];
      //options.tableData的数据格式，可以从后台返回，在此处遍历
      options.tableData.forEach((x) => {
        if (childrenIds.indexOf(x.id) != -1 || x.id == treeId) {
          rows.push(x);
        }
      });
      this.tableData = rows;
    },
    getTree(id, data, childrenIds) {
      options.tree.forEach((x) => {
        if (x.parentId == id) {
          x.lv = data.lv + 1;
          if (!data.children) data.children = [];
          data.children.push(x);
          this.getTree(x.id, x);
        }
      });
    },
    del() {
      let rows = this.$refs.editTable.getSelected();
      if (rows.length == 0) {
        return this.$Message.error("请先选中行");
      }
      this.$refs.editTable.delRow();
    },
    clear() {
      this.tableData.splice(0);
    },
    add() {
      this.tableData.push({});
    },
    getRows() {
      let rows = this.$refs.editTable.getSelected();
      if (rows.length == 0) {
        return this.$Message.error("请先选中行");
      }
      this.$Message.error(JSON.stringify(rows));
    },
    endEdit() {
      //手动结束编辑
      this.$refs.editTable.edit.rowIndex = -1;
    },
  },
};
</script>
