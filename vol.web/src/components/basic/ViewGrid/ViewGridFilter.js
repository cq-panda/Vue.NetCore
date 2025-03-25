let serviceFilter = {
  onInit() {
    //对应created
  },
  onInited() {
    //对应created，在onInit与onInited中间会初始化界面数据对象
  },
  mounted() { },
  searchBefore(param) {
    //查询ViewGird表数据前,param查询参数
    // console.log('表' + this.table.cnName + '触发loadTableBefore');
    return true
  },
  //2020.10.30增加查询后返回所有的查询信息
  searchAfter(param, result) {
    //查询ViewGird表数据后param查询参数,result回返查询的结果
    // console.log('表' + this.table.cnName + '触发loadTableAfter');
    return true
  },
  searchDetailBefore(param, callBack, table, item) {
    //查询从表表数据前,param查询参数
    //console.log(this.detailOptions.cnName + '触发loadDetailTableBefore');
    return true
  },
  searchDetailAfter(param, data) {
    //查询从表后param查询参数,result回返查询的结果
    // console.log(this.detailOptions.cnName + '触发loadDetailTableAfter');
    return true
  },
  delBefore(ids, rows) {
    //查询界面的表删除前 ids为删除的id数组,,rows删除的行
    return true
  },
  delBeforeAsync(ids, rows) {
    //查询界面的表删除前 ids为删除的id数组,,rows删除的行
    return true
  },
  getDelMessage(rows) { },
  delAfter(result) {
    //查询界面的表删除后
    return true
  },
  delDetailRow(rows,table) {
    //弹出框删除明细表的行数据(只是对table操作，并没有操作后台)
    return true
  },
  delRowBefore(rows, table, item, index){  //弹出框删除明细表的行数据(只是对table操作，并没有操作后台)
    return true
  },
  delRowAfter(rows, table, item, index){//弹出框明细表删除后方法(只是对table操作，并没有操作后台)
    return true
  },
  saveConfirm(callback,formData,isAdd) {//保存前确认操作，formData表数据，isAdd是否新建操作
    //保存前自定义确认操作
    callback && callback()
  },
  addBefore(formData) {
    //新建保存前formData为对象，包括明细表
    return true
  },
  async addBeforeAsync(formData) {
    //异步处理,功能同上(2020.12.06)
    return true
  },
  addAfter(result) {
    //新建保存后result返回的状态及表单对象
    return true
  },
  updateBefore(formData) {
    //编辑保存前formData为对象，包括明细表、删除行的Id
    return true
  },
  async updateBeforeAsync(formData) {
    //异步处理,功能同上(2020.12.06)
    return true
  },
  updateAfter(result) {
    //编辑保存后result返回的状态及表单对象
    return true
  },
  auditBefore(ids, rows) {
    //审核前
    return true
  },
  auditAfter(result, rows) {
    // 审核后
    return true
  },
  resetAddFormBefore() {
    //重置新建表单前的内容
    return true
  },
  resetAddFormAfter() {
    //重置新建表单后的内容
    return true
  },
  resetUpdateFormBefore() {
    //重置编辑表单前的内容
    return true
  },
  resetUpdateFormAfter() {
    //重置编辑表单后的内容
    return true
  },
  modelOpenBefore(row) {
    //点击编辑/新建按钮弹出框前，可以在此处写逻辑，如，从后台获取数据
    return true
  },
  modelOpenBeforeAsync(row) {
    //点击编辑/新建按钮弹出框前，可以在此处写逻辑，如，从后台获取数据
    return
  },
  modelOpenAfter(row, currentAction, isCopyClick) {
    //点击编辑/新建按钮弹出框后，可以在此处写逻辑，如，从后台获取数据
  },
  importAfter(data) {
    return true; 
    //导入excel后刷新table表格数据
  },
  importDetailAfter(rows) { return true;  },//明细表导入后方法
  //2020.10.31添加导入前的方法
  importBefore(formData,callback) {
    //导入excel导入前
    //往formData写一些其他参数提交到后台，
    // formData.append("val2", "xxx");
    //后台按下面方法获取请求的参数
    // Core.Utilities.HttpContext.Current.Request("val2");

    //如果需要异步执行，请执行callback();//下面的return true去掉

    return true
  },
  reloadDicSource() {
    //重新加载字典绑定的数据源
  },
  exportBefore(param) {
    //2020.06.25增加导出前处理
    return true
  },
  exportAfter(res, param) { },//导出后方法
  getFileName(isDetail) {//导出时自定义文件名
    return ''
  },
  onModelClose(iconClick) {//弹出框关闭事件
    //iconClick=true为点击左中上角X触发的关闭事件
    //如果返回 false不会关闭弹出框
    //return false;
    return true
  },
  selectable(row, index) {
    //表CheckBox 是否可以勾选
    return true
  },
  sortEnd(newIndex, oldIndex, rows) { },//主表拖动排序
  detailSortEnd(rows, newIndex, oldIndex) { },//明细表主表拖动排序
  boxAuditOptionOpenBefore(row) { },//审批弹出框打开前方法
  addDetailRow(table, item, index){},//二、三级表添加行返回默认行数据
  tableAddRowBefore(row, index) {
    //行内编辑获取默认编辑行前方法
    return true
  },
  getDefaultRow(row, index) {
    //行内编辑获取默认编辑行
    return {}
  },
  dicInited(dic) {
    //字典初始后方法
  },
  rowChange(rows) { },
  selectionChange(rows) { },
  rowClick({ row, column, event }) { },
  rowDbClick({ row, column, event }) { },
  beginEdit(row, column, index) {
    //主表表格编辑
    return true
  },
  endEditBefore(row, column, index) {
    return true
  },
  //表格并合
  spanMethod({ row, column, rowIndex, columnIndex }, rows) { },
  detailSpanMethod({ row, column, rowIndex, columnIndex }, rows) { },
  resetSearchFormAfter() { },//查询表单重置方法
  //表单分组切换事件
  tabClick(name) { },
  detailAddRowBefore(table,item) {//明细表添加行(包括一对多明细表添加行)
    //这里可以返回: return [{}]或者{}
  },
  //明细表复选框选择事件
  detailRowChange(row, table) { },//明细表checkbox复选框选中事件
  detailSelectable(row, index, item) { return true; },//明细表checkbox复选框是否可以选中
  continueAddAfter(formFields, formData, res) { }, //连续添加操作保存后事件
  detailRowClick({ row, column, event, item }) { }, //明细表行点击事件
  detailTabsClick(table){}, //一对明细表tabs点击事件
  copyDataBefore(rows) {
    return true
  }, //点击复制按钮
  auditModelOpenBefore(rows, isAnti, view) {
    //审批弹出框打开前方法
    return true
  },
  getAuditTable(rows, isAnti, view) {//获取实际审批的表
    return ''
  },
  flowLoadAfter(form, result) { },//审批弹出框加载流程信息
  printBefore(rows) { return true },//打印按钮点击前方法
  searchSubDetailBefore(rows, table, item){return true},//三级明细表加载前
  searchSubDetailAfter(rows, table, item){return true},//三级明细表加载后
  printModelClose(){}//打印弹出框关闭
}
export default serviceFilter
