
import AsyncLoading from "@/components/basic/AsyncLoading.vue";
import AppointmentGridFooter from "./App_Appointment/App_AppointmentGridFooter.vue";
let extension = {
  components: {//动态扩充组件或组件路径
    //表单header、content、footer对应位置扩充的组件
    gridHeader: '',//{ template: "<div>扩展组xx件</div>" },
    gridBody: {
      template: '<Alert  type="success" show-icon>\
        表单高度自定义设置<template slot="desc">\
         可在扩展js中的onInit方法设置this.tableHeight/tableMaxHeight属性，指定table高度(默认自适应)，如果设置 了tableMaxHeight属性，tableHeight则不会生效</template>\
       </Alert>' },
    // gridFooter: () => ({ component: import("./App_Appointment/App_AppointmentGridFooter.vue"), loading: AsyncLoading }),
    gridFooter: AppointmentGridFooter,
    //弹出框(修改、编辑、查看)header、content、footer对应位置扩充的组件
    modelHeader: '',
    modelBody: '',
    modelFooter: ''
  },
  buttons: [],//扩展的按钮
  text: "可在代码生成器中设置[是否只读]或如果没有编辑或新建权限，弹出框都是只读的",
  methods: {//事件扩展
    onInit() {
      this.single = true;//设置只能单选
      //设置表的最大高度
      this.tableMaxHeight = 300;
    },
    rowChange(row) {//选中行事件
      console.log('选中行：' + JSON.stringify(row));
      //选中行后，加载扩展组件里tabs的数据
      this.$refs.gridFooter.rowChangeLoadData(row);
    },
    searchBefore(param) {
      return true;
    }
  }
};
export default extension;