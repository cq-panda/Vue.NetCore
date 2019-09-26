let dataType = [
    { "key": "text", "value": "text" },
    { "key": "textarea", "value": "textarea" },
    { "key": "switch", "value": "switch" },
    // { "key": "drop", "value": "drop" },
    // { "key": "dropList", "value": "dropList" },
    { "key": "select", "value": "select" },
    { "key": "selectList", "value": "selectList" },
    { "key": "date", "value": "date" },
    { "key": "datetime", "value": "datetime" },
    { "key": "checkbox", "value": "checkbox" }];
let data = {
    form: {
        fields: {
            table_Id: '', parentId: 0, namespace: '',
            columnCNName: '', tableName: '', tableTrueName: '',
            folderName: '', detailCnName: '', detailName: '',
            expressField: '', sortName: '', richtitle: '',
            uploadField: '', uploadMaxCount: '', vuePath: ''
        },
        addOptions: [[{ "title": "父级ID", "field": "parentId", "displayType": "text", "required": true, columnType: 'int' }],
        [{
            "title": "项目命名空间", "field": "namespace", "placeholder": "项目命令空间(类库名)", "type": "drop", "required": true, data: { data: [] }
        }],
        [{ "title": "表中文名", "field": "columnCNName", "displayType": "text", "dataSource": [], "required": true }],
        [{ "title": "表名", "field": "tableName", "displayType": "title", "required": true }],
        [{ "title": "项目文件夹", "field": "folderName", "displayType": "text", "required": true }]]
        ,
        options: [
            [
                { "title": "ID", "field": "table_Id", "displayType": "text", "dataSource": [], readonly: true, disabled: true, columnType: 'int' },
                { "title": "父级ID", "field": "parentId", "displayType": "text", "required": true, columnType: 'int' },
                {
                    "title": "项目命名空间", "placeholder": "项目命令空间(类库名)", "field": "namespace", "type": "drop", "required": true,
                    data: { data: [] }
                }
            ],
            [
                { "title": "表中文名", "field": "columnCNName", "displayType": "text", "dataSource": [], "required": true },
                { "title": "表名", "field": "tableName", "displayType": "title", "required": true },
                { "title": "实际表名", "field": "tableTrueName", "displayType": "text" }
            ],
            [
                { "title": "项目文件夹", "field": "folderName", "displayType": "text", "required": true },
                { "title": "明细表中文名", "field": "detailCnName", "displayType": "text", "dataSource": [] },
                { "title": "明细表名", "field": "detailName", "displayType": "text", "dataSource": [] }
            ],
            [
                { "title": "连接字段", "field": "expressField", "displayType": "text", "dataSource": [] },
                { "title": "排序字段", "field": "sortName", "displayType": "text", "placeholder": "非自增主键需要输入排序字段", "dataSource": [] },
                { "title": "Vue视图绝对路径", "field": "vuePath", "displayType": "text", placeholder: 'Vue项目所在绝对路径,到views文件夹,如：E:/app/src/views' }
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
        { field: 'columnName', title: '列名', fixed: true,width: 120, align: 'left', edit: { type: "text" } },
        { field: 'isKey', title: '主键', width: 90, align: 'left', edit: { type: "switch" } },
        { field: 'searchRowNo', title: '查询行', width: 90, align: 'left', edit: { type: "text" } },
        { field: 'searchColNo', title: '查询列', width: 90, align: 'left', edit: { type: "text" } },
        { field: 'searchType', title: '查询类型', width: 150, align: 'left', edit: { type: "select"}, bind: { data: dataType } },
        { field: 'editRowNo', title: '编辑行', width: 90, align: 'numberbox', edit: { type: "text" } },
        { field: 'editColNo', title: '编辑列', width: 90, align: 'numberbox', edit: { type: "text" } },
        { field: 'editType', title: '编辑类型', width: 150, align: 'left', edit: { type: "select" }, bind: { data: dataType } },
        { field: 'dropNo', title: '数据源', width: 120, align: 'left',bind: { data: [] }, edit: { type: "select", data: [] } },
        { field: 'orderNo', title: '列显示排序', width: 120, align: 'left', edit: { type: "text" } },
        { field: 'maxlength', title: '列最大长度', width: 100, align: 'left', edit: { type: "text" } },
        { field: 'columnType', title: '数据类型', width: 120, align: 'left', edit: { type: "text" } },
        { field: 'isNull', title: '可为空', width: 120, align: 'left', edit: { type: "switch" } },
        { field: 'isReadDataset', title: '是否只读', width: 120, align: 'left', edit: { type: "switch" } },
        { field: 'isColumnData', title: '数据列', width: 120, align: 'left', edit: { type: "switch" } },
        { field: 'isDisplay', title: '是否显示', width: 120, align: 'left', edit: { type: "switch" } },
        { field: 'columnWidth', title: 'table列宽度', width: 120, align: 'left', edit: { type: "text" } },
        { field: 'colSize', title: 'colsize', width: 100, width: 120, align: 'left', edit: { type: "text" } },
        { field: 'import', title: '导入列', width: 100, align: 'left', edit: { type: "switch" } },
        { field: 'apiInPut', title: 'Api输入列', width: 100, align: 'left', edit: { type: "switch" } },
        { field: 'apiIsNull', title: 'Api输入列可为空', width: 130, align: 'left', edit: { type: "switch" } },
        { field: 'apiOutPut', title: 'Api输出列', width: 100, align: 'left', edit: { type: "switch" } },
        { field: 'isImage', title: '启用图片地址', width: 120, align: 'left', edit: { type: "switch" } },
        // { field: 'columnformat', title: '显示格式', width: 120, align: 'left', editor: 'text', editor: 'textarea' },
        // { field: 'script', title: '脚本', width: 120, align: 'left', editor: 'textarea' },
        { field: 'creator', title: '创建人', width: 120, align: 'left' },
        { field: 'createDate', title: '创建时间', width: 120, align: 'left' },
        { field: 'modifier', title: '修改人', width: 120, align: 'left' },
        { field: 'modifyDate', title: '修改时间', width: 120, align: 'left' }
    ]
}

export default data