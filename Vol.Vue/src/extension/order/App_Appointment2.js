

let extension = {
  components: {//动态扩充组件或组件路径
    //表单header、content、footer对应位置扩充的组件
    gridHeader: '',//{ template: "<div>扩展组xx件</div>" },
    gridBody: {
      template: '<Alert  type="success" show-icon>\
        表单高度自定义设置/显示所有查询条件<template slot="desc"><p>1、onInited中重新定义表头数据,2021.01.08更新voltable.vue后才能使用</p>\
        2、具体见：App_Appointment2.js中配置(现在只支持到二级表头、不支持编辑与复杂操作)</template>\
       </Alert>' },
    // gridFooter: () => ({ component: import("./App_Appointment/App_AppointmentGridFooter.vue"), loading: AsyncLoading }),
    gridFooter: '',
    //弹出框(修改、编辑、查看)header、content、footer对应位置扩充的组件
    modelHeader: '',
    modelBody: '',
    modelFooter: ''
  },
  buttons: [],//扩展的按钮
  tableAction:"App_Appointment",
  text: "页面全部由代码生成器生成，只需要在onInited中重新配置表头数据",
  methods: {//事件扩展
    onInit() {
      //设置表的最大高度
      this.tableMaxHeight = 300;
    },
    onInited() {
      this.columns.splice(0);
      this.columns.push(...[
        {
          field: 'Name', title: '基础信息', type: 'string', align: 'center',
          children: [
            { field: 'Name', title: '用户姓名', type: 'string', link: true, width: 100, sortable: true },
            { field: 'PhoneNo', title: '电话', type: 'string', width: 130 },
            { field: 'Describe', title: '描述信息', type: 'string', width: 180 },
          ]
        },
        {
          field: 'Name', title: '创建人信息', type: 'string', align: 'center',
          children: [
            { field: 'Id', title: '主键ID', type: 'string', width: 90, hidden: true },
            { field: 'CreateDate', title: '创建时间', type: 'datetime', width: 120, sortable: true },
            { field: 'Creator', title: '创建人', type: 'string', width: 130, align: 'left' }]
        },
        {
          field: 'Name', title: '修改人信息', type: 'string', align: 'center',
          children: [
            { field: 'Modifier', title: '修 改 人', type: 'string', width: 130, align: 'left' },
            { field: 'ModifyDate', title: '修改时间', type: 'datetime', width: 150, sortable: true }]
        }
      ]
      )
    }
  }
};
export default extension;