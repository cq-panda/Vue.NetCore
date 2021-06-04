

let extension = {
  components: {//动态扩充组件或组件路径
    //表单header、content、footer对应位置扩充的组件
    gridHeader: '',//{ template: "<div>扩展组xx件</div>" },
    gridBody: {
      template: '<Alert  type="success" show-icon>\
        表单高度自定义设置/显示所有查询条件<template slot="desc"><p>1、 onInit(){ this.setFiexdSearchForm(true);  //设置固定显示所有查询条件}</p>\
        2、 可在扩展js中的onInit方法设置this.tableHeight/tableMaxHeight属性，指定table高度(默认自适应)，如果设置 了tableMaxHeight属性，tableHeight则不会生效</template>\
       </Alert>' },
    // gridFooter: () => ({ component: import("./App_Appointment/App_AppointmentGridFooter.vue"), loading: AsyncLoading }),
    gridFooter: '',
    //弹出框(修改、编辑、查看)header、content、footer对应位置扩充的组件
    modelHeader: '',
    modelBody: '',
    modelFooter: ''
  },
  buttons: [],//扩展的按钮
  text: "可在代码生成器中设置[是否只读]或如果没有编辑或新建权限，弹出框都是只读的",
  methods: {//事件扩展
    onInit () {
      //设置显示所有查询条件
      this.setFiexdSearchForm(true);

      //设置表的最大高度
      this.tableMaxHeight = 300;
      //格式化单格颜色
      this.columns.forEach(x => {
        if (x.field == "PhoneNo") {
          x.cellStyle = (row, rowIndex, columnIndex) => {
            if (row.PhoneNo == "138888887698") {
              return { background: "#2196F3", color: "#ffff" }
            }
          }
        }
        if (x.field == "Creator") {
          x.cellStyle = (row, rowIndex, columnIndex) => {
            if (row.Creator == "超级管理员") {
              return { background: "#f3f3f3" }
            }
          }
        }
      })
    },
    onInited () {
      //移除快捷查询
      this.singleSearch = null;
    },
  }
};
export default extension;