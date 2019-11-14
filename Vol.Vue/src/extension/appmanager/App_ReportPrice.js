let extension = {
    components: {//动态扩充组件或组件路径
        //表单header、content、footer对应位置扩充的组件
        gridHeader: '',//{ template: "<div>扩展组xx件</div>" },
        gridBody: '',
        gridFooter: '',
        //弹出框(修改、编辑、查看)header、content、footer对应位置扩充的组件
        modelHeader: '',
        modelBody: '',
        modelFooter: { template: '<Alert type="error">在代码生成器中，设置colsize的值指定标签显示长度，如[测试]字段占的长度100%</Alert>' }
    },
    buttons: [],//扩展的按钮
    text: "在代码生成器中设置编辑/新建行列，然后再点保存/生成model/vue页面",
    methods: {//事件扩展
        onInit() {
            this.columns.forEach(x => {
                if (x.field == "AuditStatus") {
                    //自定义实现有数据源的td背景颜色
                    x.getColor = (row, column) => {
                        if (row["AuditStatus"] == "0") {
                            return "#9C27B0";
                        }
                    }
                }
            })
        }
    }
};
export default extension;