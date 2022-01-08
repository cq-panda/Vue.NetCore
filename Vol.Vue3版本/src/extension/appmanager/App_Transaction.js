import { h, resolveComponent } from 'vue';
let extension = {
  components: {//动态扩充组件或组件路径
    //表单header、content、footer对应位置扩充的组件
    gridHeader: '',//{ template: "<div>扩展组xx件</div>" },
    // gridBody: {
    //   template: '<Alert  type="success" show-icon>\
    //     查询默认/显示所有查询条件<template slot="desc"><p>1、 onInit(){ this.setFiexdSearchForm(true);  //设置固定显示所有查询条件}</p>\
    //     2、 设置默认查询值(下拉框、默认日期)、查询界面表高度等,具体见App_Transaction.js配置与说明</template>\
    //    </Alert>' },
    gridBody: {
      render() {
        return h(resolveComponent('ElAlert'), {
          style: { 'margin-bottom': '12px' },
          'show-icon': true,
          type: 'success',
          closable: false,
        }, [h('p', {},'1、默认界面上显示的列都可以导入，也可以在后台指定导入与导出的列，见后台开发文档->后台基础代码扩展实现导入方法说明'),
        h('p', {}, ' 2、设置默认查询值(下拉框、默认日期)、查询界面表高度等,App_Transaction.js配置与说明')]);
      }
    },
    gridFooter: '',
    //弹出框(修改、编辑、查看)header、content、footer对应位置扩充的组件
    modelHeader: '',
    modelBody: '',
    modelFooter: ''
  },
  tableAction:"App_Appointment",//指定菜单权限，其他任何页面引用时都会走对应权限
  text: "目前导入导出的字段为代码生成器中配置[是否显示与编辑列],可自行添加配置字段处理",
  buttons: [],//扩展的按钮
  methods: {//事件扩展

    //事件扩展
    onInit() {
      //设置查询条件
     // this.searchFormFields.Name = "林";
      //设置下拉框的字段(是否买入)的默认值(注意下拉框key如要是数字同样也要设置为字符类型数字,如果是自定sql数据源的key则需要设置成数字类型)
      this.searchFormFields.TransactionType = "1";
      //注意日期设置默认值的时候 ，如果查询类型选择的是datetime后面一定要写上,00:00:00
      //如果查询类型是date直接写年月日即可
      this.searchFormFields.CreateDate = ['2015-01-01 00:00:00', '2030-12-31 00:00:00']
      //设置页面上显示的按钮个数(不是必须的)
      this.maxBtnLength = 6;
      //设置显示所有查询条件
      this.setFiexdSearchForm(true);
    },
    onInited() {
      //设置查询界面表最大高度
      this.tableMaxHeight = 500;
      //移除快捷查询
      this.singleSearch = null;
   
    },
  }
};
export default extension;
