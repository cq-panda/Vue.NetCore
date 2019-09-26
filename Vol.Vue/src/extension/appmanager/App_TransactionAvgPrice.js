let extension = {
    components: {//动态扩充组件或组件路径
        //表单header、content、footer对应位置扩充的组件
        gridHeader:'',//{ template: "<div>扩展组xx件</div>" },
        gridBody: '',
        gridFooter: '',
        //弹出框(修改、编辑、查看)header、content、footer对应位置扩充的组件
        modelHeader: '',
        modelBody: '',
        modelFooter: ''
    },
    text:"下拉框的数据源不需要写代码，在代码生成器中配置。数据源在系统->下拉框绑定中设置",
    buttons: [],//扩展的按钮
    methods: {//事件扩展

    }
};
export default extension;