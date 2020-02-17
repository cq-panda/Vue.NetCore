

let serviceFilter = {
    onInit() { //对应created
        console.log('Create执行前')
    },
    onInited() { //对应created，在onInit与onInited中间会初始化界面数据对象
        console.log('Create执行后')
    },
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
    delDetailRow(rows){ //弹出框删除明细表的行数据(只是对table操作，并没有操作后台)
        return true;
    },
    addBefore(formData) { //新建保存前formData为对象，包括明细表
        return true;
    },
    addAfter(result) {//新建保存后result返回的状态及表单对象
        return true;
    },
    updateBefore(formData) { //编辑保存前formData为对象，包括明细表、删除行的Id
        return true;
    },
    updateAfter(result) {//编辑保存后result返回的状态及表单对象
        return true;
    },
    auditBefore(ids, rows) {//审核前
        return true;
    },
    auditAfter(result, rows) {// 审核后
        return true;
    },
    resetAddFormBefore(){ //重置新建表单前的内容
        return true;
    },
    resetAddFormAfter(){ //重置新建表单后的内容
        return true;
    },
    resetUpdateFormBefore(){ //重置编辑表单前的内容
        return true;
    },
    resetUpdateFormAfter(){ //重置编辑表单后的内容
        return true;
    },
    modelOpenBefore(row){ //点击编辑/新建按钮弹出框前，可以在此处写逻辑，如，从后台获取数据

    },
    modelOpenAfter(row){  //点击编辑/新建按钮弹出框后，可以在此处写逻辑，如，从后台获取数据

    },
    importAfter(data) { //导入excel后刷新table表格数据
        this.search();
    }

}
export default serviceFilter;