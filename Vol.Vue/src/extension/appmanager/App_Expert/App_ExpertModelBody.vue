<template>
  <VolBox
    :model.sync="model"
    :lazy="true"
    title="选择数据"
    :height="450"
    :width="800"
    :padding="15"
  >
    <!-- 设置查询条件 -->
    <div style="padding-bottom: 10px">
      <span style="margin-right: 20px">请选择数据</span>
      <Input placeholder="名称" style="width: 300px" v-model="expertName" />
      <Button type="info" icon="ios-search" @click="search()">搜索</Button>
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
      :defaultLoadPage="defaultLoadPage"
      @loadBefore="loadTableBefore"
      @loadAfter="loadTableAfter"
    ></vol-table>
    <!-- 设置弹出框的操作按钮 -->
    <div slot="footer">
      <Button type="info" icon="ios-add" @click="addRow()"
        >添加选择的数据</Button
      >
      <Button type="success" icon="ios-remove" @click="model = false"
        >关闭</Button
      >
    </div>
  </VolBox>
</template>
<script>
export default {
  components: {
    VolBox: () => import("@/components/basic/VolBox.vue"),
    VolTable: () => import("@/components/basic/VolTable.vue"),
  },
  data() {
    return {
      model: false,
      defaultLoadPage:false,//第一次打开时不加载table数据，openDemo手动调用查询table数据
      expertName: "", //查询条件字段
      url: "api/App_Expert/getSelectorDemo",
      columns: [
        { field: "expertId", title: "主键id", width: 90, hidden: true },
        { field: "expertName", title: "名称", width: 120 },
        { field: "headImageUrl", type: "img", title: "头像", width: 120 },
        { field: "resume", title: "个人简介", width: 90 },
        {
          field: "enable",
          title: "是否启用",
          bind: { key: "enable", data: [] },
          width: 110,
        },
      ],
      pagination: {}, //分页配置，见voltable组件api
    };
  },
  methods: {
    openDemo(row) {
      this.model = true;
      //打开弹出框时，加载table数据
      this.$nextTick(() => {
        this.$refs.mytable.load();
      });
    },
    search() {
      //搜索
      this.$refs.mytable.load();
    },
    addRow() {
      var rows = this.$refs.mytable.getSelected();
      if (!rows || rows.length == 0) {
        return this.$Message.error("请选择行数据");
      }
      //回写数据到表单
      this.$emit("parentCall", ($parent) => {
        //将选择的数据合并到表单中(注意框架生成的代码都是大写，后台自己写的接口是小写的)
        var _row = {
          ExpertId: rows[0].expertId,
          ExpertName: rows[0].expertName,
          HeadImageUrl: rows[0].headImageUrl,
          Resume: rows[0].resume,
          Enable: rows[0].enable + "", //enable是数字类型，框架绑定下拉框的时候要转换成字符串
        };
        Object.assign($parent.editFormFields, _row);
      });
      //关闭当前窗口
      this.model = false;
    },
    //这里是从api查询后返回数据的方法
    loadTableAfter(row) {},
    loadTableBefore(params) {
      //查询前，设置查询条件
      if (this.expertName) {
        params.wheres = [{ name: "expertName", value: this.expertName }];
      }
      return true;
    },
  },
};
</script>
