let extension = {
    components: {//动态扩充组件或组件路径
        //表单header、content、footer对应位置扩充的组件
        gridHeader: '',//{ template: "<div>扩展组xx件</div>" },
        gridBody: '',
        gridFooter: '',
        //弹出框(修改、编辑、查看)header、content、footer对应位置扩充的组件
        modelHeader: { template: '<Alert type="error"><input type="text">上传图片功能开发中。。。</Alert>' },
        modelBody: '',
        modelFooter: ''
    },
    text: "代码生成器中，如果字段是图片地址，勾选启用图片支持即可",
    buttons: [],//扩展的按钮
    methods: {//事件扩展
        modelOpenBefore(row) {
            this.boxButtons.forEach(x => {
                if (x.name == '保 存') {
                    x.hidden = this.currentAction == this.const.ADD
                }
                if (x.name == '重 置') x.disabled = true;
            })
        },
        modelOpenAfter(row) {
            if (this.$refs.modelBody) {
                return console.log('forminited');
            }
            console.log('form_undefined');
        }
    }
};
export default extension;