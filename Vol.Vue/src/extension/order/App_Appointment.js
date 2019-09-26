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
    buttons: [],//扩展的按钮
    text:"可在代码生成器中设置[是否只读]或如果没有编辑或新建权限，弹出框都是只读的",
    methods: {//事件扩展

    }
};
export default extension;