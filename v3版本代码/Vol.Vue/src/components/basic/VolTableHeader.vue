<template>
  <div class="view-header">
    <div class="desc-text">
      <Icon type="md-apps"/>
      <span>饿了么table数据</span>
    </div>
    <div class="search-line">
      <!-- <div>
        <label>姓名：</label>
        <Input placeholder="Enter name" style="width: auto"/>
      </div>
      <div>
        <label>地址：</label>
        <Input placeholder="Enter name" style="width: auto"/>
      </div> -->
    </div>
    <div class="btn-group">
      <Button type="info" icon="ios-search" @click="searchBoxShow=!searchBoxShow">查询</Button>
      <Button type="success" icon="md-add" @click="add">新建</Button>
      <Button type="warning" icon="ios-refresh">重置</Button>
      <Button type="primary" icon="md-close">删除</Button>
      <Button type="error" @click="refresh" icon="ios-refresh">刷新</Button>
    </div>
    <div class="search-box" v-show="searchBoxShow">
      <test-form></test-form>
    </div>
    <VolBoxForm ref="box" :formFileds="formFileds" :formOptions="formOptions"></VolBoxForm>
  </div>
</template>
<script>
import testForm from "@/views/forms/testForm.vue";
import VolBoxForm from "@/components/basic/VolBoxForm.vue";
export default {
  components: { testForm, VolBoxForm },
  data() {
    return {
      searchBoxShow: false,
      // formFileds: {
      //   BeginDate: "",
      //   Url: "",
      //   LogType: "",
      //   Success: "",
      //   //  interest: [],
      //   ElapsedTime: "",
      //   RequestParameter: "",
      //   BrowserType: "",
      //   EndDate: ""
      // },
      // formOptions: [
      //  [  {
      //     field: "BrowserType",
      //     title: "浏览器类型",
      //     type: "string",
      //     width: 140,
      //     align: "left"
      //   },
      //   {
      //     required: true,
      //     field: "Url",
      //     title: "请求地址",
      //     type: "string",
      //     "min-width": 150,
      //     align: "left"
      //   }],
      // [{
      //     required: true,
      //     field: "LogType",
      //     title: "日志类型",
      //     type: "string",
      //     width: 120,
      //     align: "left"
      //   },
      //   {
      //     field: "Success",
      //     title: "响应状态",
      //     type: "int",
      //     width: 90,
      //     align: "left"
      //   }],
      //   [{
      //     field: "ElapsedTime",
      //     title: "时长",
      //     type: "int",
      //     width: 90,
      //     align: "left"
      //   },
      //   {
      //     field: "RequestParameter",
      //     title: "请求参数",
      //     type: "string",
      //     width: 100,
      //     align: "left"
      //   }],
      //   [
      //  {
      //     required: true,
      //     field: "BeginDate",
      //     title: "开始时间",
      //     type: "datetime",
      //     width: 150,
      //     align: "left",
      //     sortable: true
      //   },
      //   {
      //     field: "EndDate",
      //     title: "结束时间",
      //     type: "datetime",
      //     width: 150,
      //     align: "left",
      //     sortable: true
      //   }]
      // ]
    };
  },
  methods: {
    add() {
      this.$refs.box.show();
    },
    refresh() {
      this.$emit("onBtnClick", { method: "refresh" });
      // this.$refs.table.load();
    }
  }
};
</script>
<style scoped>

</style>
