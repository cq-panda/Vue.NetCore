import { h, resolveComponent } from 'vue';
let extension = {
    components: { //动态扩充组件或组件路径
        //表单header、content、footer对应位置扩充的组件
        //扩展组件引入方式
        gridHeader: '',
        gridBody: {
            render () {
                return [
                    h(resolveComponent('el-alert'), {
                        style: { 'margin-bottom': '12px' },
                        'show-icon': true, type: 'error',
                        closable: false, title: '界面下拉框、多选、checkbox等数据源都在此处维护，也是代码生成器中的数据源'
                    }, ''),
                ]
            }
        },
        gridFooter: '',
        //弹出框(修改、编辑、查看)header、content、footer对应位置扩充的组件
        modelHeader: '',
        modelBody: '',
        modelFooter: ''
    },
    buttons: [], //扩展的按钮
    methods: { //事件扩展
        onInit () {
            //点击单元格编辑与结束编辑(默认是点击单元格编辑，鼠标离开结束编辑)
            this.detailOptions.clickEdit = true;
            this.editFormOptions.forEach(x => {
                x.forEach(item => {
                    if (item.field == 'ParentId') {
                        item.min = 0;
                    }
                    if (item.field == "DbSql") {
                        item.placeholder = "如果从数据库加载数据源，请按此格式配置sql语句：select orderType as key,orderName as value from order  如果需要根据用户信息加载数据源，请配置好此sql,再修改后台DictionaryHandler.GetCustomDBSql方法";
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
        onInited () {
            this.boxOptions.height = document.body.clientHeight * 0.87
            this.height = this.height - 45;
        },
        addBefore (formData) {
            return this.saveBefore(formData);
        },
        updateBefore (formData) {
            return this.saveBefore(formData);
        },
        saveBefore (formData) {
            if (this.editFormFields.DbSql &&
                (this.editFormFields.DbSql.indexOf('value') == -1 ||
                    this.editFormFields.DbSql.indexOf('key') == -1)
            ) {
                this.$message.error("sql语句必须包括key/value字段,如:select orderType as key,orderName as value from order");
                return false;
            }
            return true;
        },
        searchBefore (param) {
            return true;
        },
        searchAfter (result) {
            return true;
        }
    }
};
export default extension;