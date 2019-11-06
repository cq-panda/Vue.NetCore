import test from "./App_Expert/App_ExpertModelBody.vue";
let extension = {
    components: {//动态扩充组件或组件路径
        //表单header、content、footer对应位置扩充的组件
        gridHeader: '',//{ template: "<div>扩展组xx件</div>" },
        gridBody: '',
        gridFooter: '',
        //弹出框(修改、编辑、查看)header、content、footer对应位置扩充的组件
        modelHeader: test,//此处可以根据实际情况同步引用也可以异步引用() => import("./App_Expert/App_ExpertModelBody.vue"),
        modelBody: '',
        modelFooter: ''
    },
    text: "代码生成器中，如果字段是图片地址，勾选启用图片支持即可",
    buttons: {
        box: //新建、编辑弹出框按钮
            [//ViewGrid查询界面按钮
                {
                    name: "数组替换",
                    icon: 'md-create',
                    value: 'Edit',
                    class: '',
                    type: 'success',
                    index: 1,//显示的位置
                    onClick: function () {
                        this.$refs.modelHeader.formFileds.test1 = "";
                        this.$refs.modelHeader.formFileds.test2 = "";
                        this.$refs.modelHeader.formRules=[
                            [
                              {
                                columnType: "string",
                                title: "test1",
                                required: true,
                                dataKey: "city",
                                field: "test1",
                                colSize: 12,
                                type: "datetime"
                              }
                            ],
                            [
                              {
                                   columnType: "string",
                                title: "test2",
                                dataKey: "city",
                                required:false ,
                                field:"test2",
                                colSize: 12,
                                type: "date"
                              }
                            ]
                          ]
                    }
                }],
    },//扩展的按钮
    methods: {//事件扩展
        onInit() {
            this.boxOptions.saveClose = false;
        },
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