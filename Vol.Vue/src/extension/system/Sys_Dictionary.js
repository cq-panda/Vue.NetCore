
import test from "./test.vue";
let extension = {
    components: {//动态扩充组件或组件路径
        //表单header、content、footer对应位置扩充的组件
        //扩展组件引入方式
        ///test
        //() => import("./test.vue"),
        //{ template: '<Alert type="success">A success prompt</Alert>'},//{ template: "<div>扩展组xx件</div>" },
        gridHeader: '',
        gridBody: test,
        gridFooter: '',
        //弹出框(修改、编辑、查看)header、content、footer对应位置扩充的组件
        modelHeader: '',
        modelBody: '',
        modelFooter: ''
    },
    buttons: [],//扩展的按钮
    methods: {//事件扩展
        onInit() {
            this.editFormOptions.forEach(x => {
                x.forEach(item => {
                    if (item.field == 'ParentId') {
                        item.min = 0;
                    }
                })
            })
            this.detailOptions.columns.forEach(x => {
                if (x.field == 'OrderNo') {
                    x.summary = true;
                }
            })
            //保存后不关闭编辑框
            this.boxOptions.saveClose = false;
        },
        onInited() {
            this.height = this.height - 36;
        },
        saveBefore(formData) {
            if (this.editFormFileds.DbSql
                && (this.editFormFileds.DbSql.indexOf('value') == -1
                    || this.editFormFileds.DbSql.indexOf('key') == -1)
            ) {
                this.$message.error("sql语句必须包括key/value字段,如:select orderType as key,orderName as value from order");
                return false;
            }
            return true;
        },
        searchBefore(param) {
            return true;
        },
        searchAfter(result) {
            return true;
        }
    }
};
export default extension;