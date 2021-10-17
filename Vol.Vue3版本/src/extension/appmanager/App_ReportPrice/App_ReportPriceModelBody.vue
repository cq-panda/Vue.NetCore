<template>
  <div class="vol-tabs">
    <el-tabs type="border-card" style="min-height: 370px; box-shadow: none;border-bottom:0;border-top: 10px solid #eee">
      <el-tab-pane>
        <template #label>
          <span><i class="el-icon-date"></i> 从表1</span>
        </template>
        <!-- 显示操作按钮 -->
        <div  style="padding-bottom: 10px;">
          <label style="margin-right: 14px;font-size: 13px;">双击行可以编辑,或者可以根据菜单： table使用->table编辑(二)在行上配置操作,完整文档见:组件api->voltable</label>
          <el-button type="primary" size="mini"  ghost @click="del">删除行</el-button>
          <el-button type="primary" size="mini"  ghost @click="add">添加行</el-button>
          <el-button type="primary" size="mini"  ghost @click="getRows"
            >获取选中的行</el-button
          >
          <el-button
            type="primary"
            size="mini" 
            @click="$refs.table1.load();"
            >刷新</el-button
          >
        </div>
        <vol-table
          ref="table1"
          :clickEdit="true"
          :loadKey="true"
          :columns="tableColumns1"
          :pagination-hide="false"
          :height="270"
          :url="table1Url"
          :index="true"
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
         <div  style="padding-bottom: 10px;">
                <label style="margin-right: 14px;font-size: 13px;">双击行可以编辑</label>
            <el-button
              type="primary"
              size="mini" 
              ghost
              @click="$refs.table2.addRow({}); "
              >添加行</el-button
            >
            <el-button
              type="primary"
              size="mini" 
              ghost
              @click=" $refs.table2.load()"
              >刷新</el-button
            >
        </div>
        <vol-table
          ref="table2"
          :loadKey="true"
          :clickEdit="true"
          :columns="tableColumns2"
          :pagination-hide="false"
          :max-height="450"
          :url="table2Ur"
          :index="true"
          @loadBefore="loadTableBefore2"
          @loadAfter="loadTableAfter2"
        ></vol-table>
      </el-tab-pane>
      <el-tab-pane :lazy="false" label="角色管理">从表3</el-tab-pane>
      <el-tab-pane :lazy="false" label="定时任务补偿">从表4</el-tab-pane>
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
          width: 200,
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
          field: "describe",
          title: "描述",
          type: "text",
          edit: { type: "text" },
          width: 300,
        },
        {
          field: "createDate",
          title: "创建时间",
          type: "text",
          edit: { type: "datetime" },
          width: 150,
        },
      ],
    };
  },
  methods: {
    //第一次打开弹出框时，如果是新建功能，禁止从后台查询
    loadTableBefore(param, callBack) {
      //获取查询页面的整个(App_ReportPrice界面)vue对象

      //所有属性都在：组件api->viewgrid文档上找到
      //http://www.volcore.xyz/document/guide
      let _this =null;
      this.$emit('parentCall',($this)=>{
        _this=$this;
      })
      //如果是新建功能，禁止从后台查询
      if (_this.currentAction == "Add") {
        // this.$refs.table1.reset();
        return callBack(false);
      }
      //获取当前选中行的主键
      let id = _this.currentRow.Id;
      //添加从表的查询参数(条件)
      //将当前选中的行主键传到后台用于查询(后台在GetTable2Data(PageDataOptions loadData)会接收到此参数)
      param.wheres.push({ id: id });
      callBack(true);
    },
    //加载从表1数据数前
    loadTableBefore1(param, callBack) {
      this.loadTableBefore(param, callBack);
    },
    //加载从表2数据数前
    loadTableBefore2(param, callBack) {
      this.loadTableBefore(param, callBack);
    },
    //从后台加载从表1数据后
    loadTableAfter1(data, callBack) {
      return true;
    },
    //从后台加载从表2数据后
    loadTableAfter2(data, callBack) {
      return true;
    },
    remoteLoad() {},
    del() {
      let rows = this.$refs.table1.getSelected();
      if (rows.length == 0) {
        return this.$Message.error("请先选中行");
      }
      this.$refs.table1.delRow();
    },
    clear() {
      this.$refs.table1.reset();
    },
    add() {
      this.$refs.table1.addRow({});
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
