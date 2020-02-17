
import extendHeader from "./doc_viewGirdHeader.vue"

import extendModelBodyHeader from "./doc_viewGirdModelBody.vue"
let extension = {
    components: {//动态扩充组件或组件路径
        gridHeader: extendHeader,//自定义扩展查询界面header部份
        gridBody: "",//扩展同上
        gridFooter: "",//扩展同上
        modelHeader: '',//扩展同上
        modelBody: extendModelBodyHeader,//自定义扩展弹出框界面body部份
        modelFooter: ''//扩展同上
    },
    tableAction:'SellOrder',//设置获取指定表的权限按钮
    text: "此处为主从表扩展示例,doc_viewGird.vue与doc_viewGirdExtension.js可由代码生成,其他两个文件自己写的扩展", //查询界面文字描述
    buttons: { //扩展的按钮
        //查询界面的按钮
        view: [{
            name: "扩展弹出框",
            icon: 'md-create',
            value: 'Edit',
            class: '',
            type: 'success',
            index: 1,//显示的位置
            onClick: function () {
                this.$refs.gridHeader.model = true;
                // this.$message.error("扩展的明细Box按钮,可设置index值指定显示位置,可使用this.$refs拿到包括自定义扩展的所有组件");
            }
        }],
        //弹出框的按钮，配置同上
        box: [{
            name: "配置的button",
            icon: 'md-add',
            value: 'Add',
            class: '',
            type: 'error',
            onClick: function () {
                this.$message.error("配置出来的button");
            }
        }],
        //弹出框的明细table按钮，配置同上
        detail: [{
            name: "配置的明细按钮",
            icon: 'md-add',
            value: 'Add',
            class: '',
            type: 'error',
            onClick: function () {
                this.$message.error("配置的明细按钮button");
            }
        }]
    },
    methods: {//事件扩展
        onInit() {
            //动态设置查询界面table的高度,默认会进行计算高度到屏幕底部
            this.tableHeight = 270;
            //动态设置弹出框table的高度,默认会进行计算高度到弹出框底部
            this.detailOptions.height = 180;
            //本身已经自带所有按钮,也可以在这里自定义操作查询界面与编辑框页面的按钮
            //删除以前的按钮
            this.buttons.splice(3);
            //添加自己的按钮,其他导入、删除等按钮可参照config->buttons.js配置
            this.buttons.push(
                {
                    name: "扩展的新建按钮",
                    icon: 'md-add',
                    value: 'Add',
                    class: '',
                    type: 'error',
                    onClick: function () {
                        this.add();
                    }
                },
                {
                    name: "onInit扩展的按钮",
                    icon: 'md-create',
                    value: 'Edit',
                    type: 'success',
                    index: 1,//显示的位置
                    onClick: function () {
                        this.$message.error("通过onInit扩展出来的按钮");
                    }
                }
            )

        },
        onInited() {
            //弹出框按钮
            this.boxButtons.push(
                {
                    name: "点我试试",
                    icon: 'md-add',
                    value: 'Add',
                    class: '',
                    type: 'error',
                    onClick: function () {
                        this.$refs.modelBody.bodyModel = true;
                    }
                })
            //弹出框明细表的按钮
            this.detailOptions.buttons.push(
                {
                    name: "明细表扩展按钮",
                    icon: 'md-add',
                    value: 'Add',
                    class: '',
                    type: 'error',
                    onClick: function () {
                        this.$message.error("onInited出来的明细button");
                    }
                })
            //给单元格添加事件及格式数据、自定颜色
            this.columns.forEach(x => {
                //自定有数据源的颜色
                if (x.field == "OrderType") {
                    x.getColor = "#E91E63;"
                }
                if (x.field == 'Qty') {
                    //添加事件
                    x.click = (row, column, event) => {
                        this.$Message.error('这里是自己写的事件')
                    }
                    //格式化
                    x.formatter = (row) => {
                        return "<a>" + row.Qty + '(点我试试)' + "</a>";
                    }
                }

                if (x.field == 'Remark') {
                    //添加事件
                    x.click = (row, column, event) => {
                        this.$refs.gridHeader.model = true;
                    }
                    //格式化
                    x.formatter = (row) => {
                        return "<a>" + row.Remark + '(点击弹出框)' + "</a>";
                    }
                }
            })
        },
        //其他可以在此处定义的事件，全部事件可参照serviceFilter.js或SellOrder.js
        mounted() {
            console.log('mounted');
        },
        searchBefore(param) { //查询ViewGird表数据前,param查询参数
            console.log('表' + this.table.cnName + '触发loadTableBefore');
            return true;
        },
        searchAfter(param, result) { //查询ViewGird表数据后param查询参数,result回返查询的结果
            console.log('表' + this.table.cnName + '触发loadTableAfter');
            return true;
        },
        searchDetailBefore(param) {//查询从表表数据前,param查询参数
            console.log(this.detailOptions.cnName + '触发loadDetailTableBefore');
            return true;
        },
        searchDetailAfter(param, data) {//查询从表后param查询参数,result回返查询的结果
            console.log(this.detailOptions.cnName + '触发loadDetailTableAfter');
            return true;
        },
        delBefore(ids, rows) { //查询界面的表删除前 ids为删除的id数组,,rows删除的行
            return true;
        },
        delAfter(result) {//查询界面的表删除后
            return true;
        },
    }
};
export default extension;
