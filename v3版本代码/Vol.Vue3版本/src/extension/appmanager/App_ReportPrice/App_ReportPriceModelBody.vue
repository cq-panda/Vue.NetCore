<template>
  <div class="vol-tabs" style="height:390px ;">
    <el-tabs
      type="border-card"
      style="
        min-height: 370px;
        box-shadow: none;
        border-bottom: 0;
        border-top: 1px solid #eee;
      "
    >
      <el-tab-pane>
        <template #label>
          <span><i class="el-icon-date"></i> 从表1</span>
        </template>
        <!-- 显示操作按钮 -->
        <div>
          <el-button
            type="primary"
            icon="Close"
            link
            @click="del"
            >删除行</el-button
          >
          <el-button
            type="success"
            icon="Plus"
            link
            @click="add"
            >添加行</el-button
          >
          <el-button
            type="warning"
            icon="Check"
            link
            @click="getRows"
            >获取选中的行</el-button
          >
          <el-button
            type="info"
            icon="Refresh"
            link
            @click="$refs.table1.load()"
            >刷新</el-button
          >
        </div>
        <el-alert
          title="双击行可以编辑,或者可以根据菜单： table使用->table编辑(二)在行上配置操作,完整文档见:组件api->voltable"
          type="warning"
          style="margin: 10px 0"
          show-icon
        >
        </el-alert>
        <!-- :defaultLoadPage="false"打开窗口禁用默认加载数据 -->
        <vol-table
          ref="table1"
          :clickEdit="true"
          :loadKey="true"
          :columns="tableColumns1"
          :pagination-hide="false"
          :height="205"
          :url="table1Url"
          :index="true"
          :defaultLoadPage="false"
          @loadBefore="loadTableBefore1"
          @loadAfter="loadTableAfter1"
        ></vol-table>
      </el-tab-pane>

      <!-- 从表2 -->
      <el-tab-pane :lazy="false" label="从表2">
        <template #label>
          <span><i class="el-icon-date"></i> 从表2</span>
        </template>
        <!-- 从表2配置 ,双击可以开启编辑-->
        <div style="padding-bottom: 10px">
          <el-button
            type="primary"
             link
            icon="Plus"
            @click="$refs.table2.addRow({})"
            >添加行</el-button
          >
          <el-button
            icon="Close"
            link
            type="success"
            ghost
            @click="$refs.table2.load()"
            >刷新</el-button
          >
        </div>
        <vol-table
          ref="table2"
          :loadKey="true"
          :clickEdit="true"
          :columns="tableColumns2"
          :pagination-hide="false"
          :height="275"
          :url="table2Ur"
          :defaultLoadPage="false"
          @loadBefore="loadTableBefore2"
          :index="true"
        ></vol-table>
      </el-tab-pane>
      <el-tab-pane :lazy="false" label="从表3">从表3</el-tab-pane>
    </el-tabs>
  </div>
</template>
<script>
//开发一对多从表需要参照voltable与viewgrid组件api
import VolTable from "@/components/basic/VolTable.vue";
export default {
  components: { VolTable },
  data() {
    return {
      //从表1
      table1Url: "api/App_ReportPrice/getTable1Data", //table1获取数据的接口
      //表配置的字段注意要与后台返回的查询字段大小写一致
      tableColumns1: [
        { field: "id", title: "主键ID", type: "int", width: 80, hidden: true },
        {
          field: "title",
          title: "标题",
          type: "string",
          width: 400,
          require: true,
          sortable: true,
          edit: { type: "text" }, //keep:true始终开启编辑，false双击才能编辑
        },
        { field: "imageUrl", title: "封面图片", type: "file", width: 170 },
        {
          field: "dailyRecommend",
          title: "内容推荐",
          type: "sbyte",
          bind: { key: "dr", data: [] },
          edit: { type: "switch" },
          width: 120,
          require: true,
          onChange: (column, row, tableData, value) => {
            this.$Message.info(value + "");
          },
        },
        {
          field: "enable",
          title: "是否启用",
          type: "int",
          width: 90,
          bind: { key: "enable", data: [] }, //自动绑定数据源
          //配置为select编辑类型,keep=true始终处于编辑状态(如果想要双击编辑，去掉keep属性，具体配置可见voltable组件api)
          edit: { type: "select" },
          onChange: (column, row, tableData) => {
            this.$Message.info(row.enable + "");
          },
        },
        {
          field: "createDate",
          title: "发布时间",
          type: "datetime",
          width: 150,
          readonly: true,
          sortable: true,
          edit: { type: "datetime" },
        },
      ],
      //从表2
      table2Ur: "api/App_ReportPrice/getTable2Data", //table1获取数据的接口
      //表配置的字段注意要与后台返回的查询字段大小写一致
      tableColumns2: [
        { field: "id", title: "主键ID", type: "int", width: 80, hidden: true },
        {
          field: "name",
          title: "姓名",
          edit: { type: "text" },
          type: "text",
          width: 120,
        },
        {
          field: "phoneNo",
          title: "电话",
          type: "text",
          edit: { type: "text" },
          width: 150,
        },

        {
          field: "createDate",
          title: "创建时间",
          type: "text",
          edit: { type: "datetime" },
          width: 150,
        },
        {
          field: "describe",
          title: "描述",
          type: "text",
          edit: { type: "text" },
          width: 500,
        },
      ],
    };
  },
  methods: {
    //如果要获取页面的参数请使用 this.$emit("parentCall",见下面的使用方法
    modelOpen() {
      let $parent;
      //获取生成页面viewgrid的对象
      this.$emit("parentCall", ($this) => {
        $parent = $this;
      });
      //当前如果是新建重置两个表格数据
      if ($parent.currentAction == "Add") {
        this.$refs.table1.reset();
        this.$refs.table2.reset();
      } else {
        //如果是编辑，添加两个表格的数据
        this.$refs.table1.load();
        this.$refs.table2.load();
      }
    },
    loadTableBefore1(param, callBack) {
      let $parent = null;
      //当前是子页面，获取查询viewgrid页面的对象()
      this.$emit("parentCall", ($this) => {
        $parent = $this;
      });
      //如果是新建功能，禁止刷新操作
      if ($parent.currentAction == "Add") {
        return callBack(false);
      }
      //获取当前编辑主键id值
      let id = $parent.currentRow.Id;
      //添加从表的查询参数(条件)
      //将当前选中的行主键传到后台用于查询(后台在GetTable2Data(PageDataOptions loadData)会接收到此参数)
      param.wheres.push({ name: "Id", value: id });
      callBack(true);
    },
    //从表2加载数据数前(操作与上面一样的,增加查询条件)
    loadTableBefore2(param, callBack) {
      callBack(true);
    },
    //从后台加载从表1数据后
    loadTableAfter1(data, callBack) {
      return true;
    },


    del() {
      let rows = this.$refs.table1.getSelected();
      if (rows.length == 0) {
        return this.$Message.error("请先选中行");
      }
      this.$refs.table1.delRow();
      //可以this.http.post调用后台实际执行查询
    },
    clear() {
      this.$refs.table1.reset();
    },
    add() {
    //  this.$refs.table1.addRow({});
    this.$refs.table1.rowData.unshift({title:"测试....."});
    },
    getRows() {
      //获取选中的行
      let rows = this.$refs.table1.getSelected();
      if (rows.length == 0) {
        return this.$Message.error("请先选中行");
      }
      this.$Message.error(JSON.stringify(rows));
    },
  },
};
</script>
<style lang="less" scoped>
.vol-tabs {
  background: white;
}
</style>
