let columnType = [{ "key": 1, "value": "img" },
{ "key": 2, "value": "excel" },
{ "key": 3, "value": "file" }]

let dataType = [
    { "key": "text", "value": "text" },
    { "key": "textarea", "value": "textarea" },
    { "key": "switch", "value": "switch" },
    // { "key": "dropList", "value": "dropList" },
    { "key": "select", "value": "select" },
    { "key": "selectList", "value": "selectList" },
    { "key": "date", "value": "date" },
    { "key": "datetime", "value": "datetime" },
    { "key": "checkbox", "value": "checkbox" },
    { "key": "mail", "value": "mail" },
    { "key": "number", "value": "number" },
    { "key": "decimal", "value": "decimal" },
    { "key": "phone", "value": "phone" },
    { "key": "img", "value": "img" },
    { "key": "excel", "value": "excel" },
    { "key": "file", "value": "file" }];

let searchDataType = [
    { "key": "text", "value": "text" },
    { "key": "like", "value": "like" },
    { "key": "textarea", "value": "textarea" },
    { "key": "switch", "value": "switch" },
    { "key": "select", "value": "select" },
    { "key": "selectList", "value": "selectList" },
    { "key": "date", "value": "date" },
    { "key": "datetime", "value": "datetime" },
    { "key": "checkbox", "value": "checkbox" },
    { "key": "mail", "value": "mail" },
    { "key": "number", "value": "number" },
    { "key": "decimal", "value": "decimal" },
    { "key": "phone", "value": "phone" }];
let data = {
    form: {
        fields: {
            table_Id: '', parentId: 0, namespace: '',
            columnCNName: '', tableName: '', tableTrueName: '',
            folderName: '', detailCnName: '', detailName: '',
            expressField: '', sortName: '', richtitle: '',
            uploadField: '', uploadMaxCount: '', enable: 0, vuePath: '',
            userPermissionDesc: '开启后当前用户只能操作自己(与下级角色)创建的数据,如:查询、删除、修改等操作'
        },
        addOptions: [[{ "title": "父级ID", min: 0, "field": "parentId", "required": true, type: 'number' }],
        [{
            "title": "项目命名空间", "field": "namespace", "placeholder": "项目命令空间(类库名)", "type": "select", "required": true, data: []
        }],
        [{ "title": "表中文名", "field": "columnCNName", "required": true }],
        [{ "title": "实际表名", "field": "tableName", "required": true }],
        [{ "title": "项目文件夹", placeholder: "生成文件所在类库中的文件夹名(文件夹可以不存在)", "field": "folderName", "required": true }]]
        ,
        options: [
            [
                { "title": "ID", "field": "table_Id", "dataSource": [], readonly: true, disabled: true, columnType: 'int' },
                { "title": "父级ID", "field": "parentId", min: 0, "required": true, type: 'number' },
                {
                    "title": "项目命名空间", "placeholder": "项目命令空间(类库名)", "field": "namespace", "type": "select", "required": true, data: []
                }
            ],
            [
                { "title": "表中文名", "field": "columnCNName", "dataSource": [], "required": true },
                { "title": "表别名", placeholder: "默认与实际表名相同", "field": "tableName", "required": true },
                { "title": "实际表名", "field": "tableTrueName" }
            ],
            [
                { "title": "项目文件夹", placeholder: "生成文件所在类库中的文件夹名(文件夹可以不存在)", "field": "folderName", "required": true },
                { "title": "明细表中文名", "field": "detailCnName" },
                { "title": "明细表名", "field": "detailName" }
            ],
            [
                { "title": "快捷编辑字段", "field": "expressField", placeholder: "字段可直接点击表格编辑或查看" },
                { "title": "排序字段", "field": "sortName", "placeholder": "非自增主键需要输入排序字段" },
                { "title": "还没想好", "field": "richtitle" }
            ],
            // [ //待完
            //     { "title": "开启用户权限数据", "field": "enable", bind: { data: [{ key: 1, value: '是', key: 0, value: '否' }] }, type: 'switch', colSize: 2 },
            //     { "title": "提示", "required": true, "field": "userPermissionDesc", colSize: 10, "placeholder": "非自增主键需要输入排序字段",readonly:true }
            // ],
            [
                { "title": "Vue视图绝对路径", "field": "vuePath", type: "textarea", placeholder: 'Vue项目所在绝对路径,到views文件夹,如：E:/app/src/views', colSize: 12 }
            ],
            // [
            //     { "title": "富文本编辑字段", "field": "richtitle", "displayType": "title" },
            //     { "title": "文件上传字段", "field": "uploadField", "displayType": "title" },
            //     { "title": "文件上传数量限制", "field": "uploadMaxCount", "displayType": "title", columnType: 'int' }
            // ],
            // [
            //     { "title": "Vue视图绝对路径", "field": "vuePath", "displayType": "title", colSize: 12, placeholder: 'Vue项目所在绝对路径,到views文件夹,如：E:/app/src/views' },
            // ]
        ]
    }, columns: [
        { field: 'columnId', title: 'ColumnId', width: 120, align: 'left', edit: { type: "text" }, hidden: true },
        { field: 'table_Id', title: 'Table_Id', width: 120, align: 'left', editor: 'text', hidden: true },
        { field: 'columnCnName', title: '列显示名称', fixed: true, width: 120, align: 'left', edit: { type: "text" } },
        { field: 'columnName', title: '列名', fixed: true, width: 120, align: 'left', edit: { type: "text" } },
        { field: 'isKey', title: '主键', width: 90, align: 'left', edit: { type: "switch" } },
        { field: 'isImage', title: 'table列显示类型', hidden: false, width: 130, align: 'left', edit: { type: "select" }, bind: { data: columnType } },
        { field: 'searchRowNo', title: '查询行', width: 90, align: 'left', edit: { type: "text" } },
        { field: 'searchColNo', title: '查询列', width: 90, align: 'left', edit: { type: "text" } },
        { field: 'searchType', title: '查询类型', width: 150, align: 'left', edit: { type: "select" }, bind: { data: searchDataType } },
        { field: 'editRowNo', title: '编辑行', width: 90, align: 'numberbox', edit: { type: "text" } },
        { field: 'editColNo', title: '编辑列', width: 90, align: 'numberbox', edit: { type: "text" } },
        { field: 'editType', title: '编辑类型', width: 150, align: 'left', edit: { type: "select" }, bind: { data: dataType } },
        { field: 'dropNo', title: '数据源', width: 120, align: 'left', bind: { data: [] }, edit: { type: "select", data: [] } },
        { field: 'orderNo', title: '列显示排序', width: 120, align: 'left', edit: { type: "text" } },
        { field: 'maxlength', title: '字段最大长度', width: 130, align: 'left', edit: { type: "text" } },
        { field: 'columnType', title: '数据类型', width: 120, align: 'left', edit: { type: "text" } },
        { field: 'isNull', title: '可为空', width: 120, align: 'left', edit: { type: "switch" } },
        { field: 'isReadDataset', title: '是否只读', width: 120, align: 'left', edit: { type: "switch" } },
        { field: 'isColumnData', title: '数据列', width: 120, align: 'left', edit: { type: "switch" } },
        { field: 'isDisplay', title: '是否显示', width: 120, align: 'left', edit: { type: "switch" } },
        { field: 'columnWidth', title: 'table列宽度', width: 120, align: 'left', edit: { type: "text" } },
        { field: 'colSize', title: '编辑列标签宽度colSize', width: 180, align: 'left', edit: { type: "text" } },
        // { field: 'import', title: '导入列', hidden: true, width: 100, align: 'left', edit: { type: "switch" } },
        // { field: 'apiInPut', title: 'Api输入列(待实现)', width: 100, align: 'left', edit: { type: "switch" } },
        // { field: 'apiIsNull', title: 'Api输入列可为空(待实现)', width: 130, align: 'left', edit: { type: "switch" } },
        // { field: 'apiOutPut', title: 'Api输出列(待实现)', width: 100, align: 'left', edit: { type: "switch" } },
        // { field: 'columnformat', title: '显示格式', width: 120, align: 'left', editor: 'text', editor: 'textarea' },
        // { field: 'script', title: '脚本', width: 120, align: 'left', editor: 'textarea' },
        // { field: 'creator', title: '创建人', width: 120, align: 'left' },
        { field: 'createDate', title: '创建时间', width: 120, align: 'left' },
        // { field: 'modifier', title: '修改人', width: 120, align: 'left' },
        // { field: 'modifyDate', title: '修改时间', width: 120, align: 'left' }
    ]
}

export default data