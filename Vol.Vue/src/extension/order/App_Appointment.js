let extension = {
    components: {//动态扩充组件或组件路径
        //表单header、content、footer对应位置扩充的组件
        gridHeader:'',//{ template: "<div>扩展组xx件</div>" },
        gridBody: { template: '<Alert  type="success" show-icon>\
        表单高度自定义设置<template slot="desc">\
         可在扩展js中的onInit方法设置this.tableHeight属性，指定table高度(默认自适应)</template>\
       </Alert>' },
        gridFooter: '',
        //弹出框(修改、编辑、查看)header、content、footer对应位置扩充的组件
        modelHeader: '',
        modelBody: '',
        modelFooter: ''
    },
    buttons: [],//扩展的按钮
    text:"可在代码生成器中设置[是否只读]或如果没有编辑或新建权限，弹出框都是只读的",
    methods: {//事件扩展
        onInit(){
            this.tableHeight=200;
        }
    }
};
export default extension;