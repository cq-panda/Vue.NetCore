// *Author：jxx
// *Contact：283591387@qq.com
// *代码由框架生成,任何更改都可能导致被代码生成器覆盖
export default function () {
    const table = {
        key: 'Id',
        footer: "Foots",
        cnName: '系统日志',
        name: 'Sys_Log',
        newTabEdit: false,
        url: "/Sys_Log/",
        sortName: "Id",
        fixedSearch: true
    };
    const tableName = table.name;
    const tableCNName = table.cnName;
    const newTabEdit = false;
    const key = table.key;
    const editFormFields = {};
    const editFormOptions = [];
    const searchFormFields = { "BeginDate": "", "Url": "", "LogType": [], "Success": [], "RequestParameter": "", "ResponseParameter": "", "UserIP": "" };
    const searchFormOptions = [[{ "title": "请求地址", "field": "Url", "type": "text" },
         { "title": "用户IP", "field": "UserIP", "type": "text" },
    { "title": "开始时间", "field": "BeginDate", "type": "datetime" },
    { "dataKey": "restatus", "data": [], "title": "响应状态", "field": "Success", "type": "selectList" },
    { "title": "请求参数", "field": "RequestParameter", "type": "like" },
    { "title": "响应参数", "field": "ResponseParameter", "type": "like" }],
    [{colSize:10, "dataKey": "log", "data": [], "title": "日志类型", "field": "LogType", "type": "checkbox" }]];
    const columns = [{ field: 'Id', title: 'Id', type: 'int', width: 90, hidden: true, require: true, align: 'left' },
    { field: 'BeginDate', title: '开始时间', type: 'datetime', width: 140, align: 'left' },
    { field: 'UserName', title: '用户名称', type: 'string', width: 90, align: 'left' },
    { field: 'Url', title: '请求地址', type: 'string', width: 110, align: 'left' },
    { field: 'LogType', title: '日志类型', type: 'string', bind: { key: 'log', data: [] }, width: 80, align: 'left' },
    { field: 'Success', title: '响应状态', type: 'int', bind: { key: 'restatus', data: [] }, width: 80, align: 'left' },
    { field: 'ElapsedTime', title: '时长', type: 'int', width: 60, align: 'left' },
    { field: 'RequestParameter', title: '请求参数', type: 'string', width: 70, align: 'left' },
    { field: 'ResponseParameter', title: '响应参数', type: 'string', width: 70, align: 'left' },
    { field: 'ExceptionInfo', title: '异常信息', type: 'string', width: 70, align: 'left' },
    { field: 'UserIP', title: '用户IP', type: 'string', width: 90, align: 'left' },
    { field: 'ServiceIP', title: '服务器IP', type: 'string', width: 90, hidden: true, align: 'left' },
    { field: 'BrowserType', title: '浏览器类型', type: 'string', width: 90, align: 'left' },
    { field: 'User_Id', title: '用户ID', type: 'int', width: 90, hidden: true, align: 'left' },
    { field: 'Role_Id', title: '角色ID', type: 'int', bind: { key: 'roles', data: [] }, width: 90, hidden: true, align: 'left' },
    { field: 'EndDate', title: '结束时间', type: 'datetime', width: 150, hidden: true, align: 'left' }];
    const detail = { columns: [] };
    const details = [];

    return {
        table,
        key,
        tableName,
        tableCNName,
        newTabEdit,
        editFormFields,
        editFormOptions,
        searchFormFields,
        searchFormOptions,
        columns,
        detail,
        details
    };
}