const components = [
    {
        id: 1,
        name: "输入框",
        type: "text",
        value: "",
        icon: "el-icon-document",
    },
    {
        id: 2,
        name: "textarea",
        type: "textarea",
        value: "",
        icon: "el-icon-document-copy",
    },
    {
        id: 3,
        name: "日期",
        type: "date",
        icon: "el-icon-date",
        value: null,
    },
    {
        id: 4,
        name: "switch",
        type: "switch",
        icon: "el-icon-turn-off",
        value: 0,
    },
    { id: 5, name: "单选", type: "radio", icon: "el-icon-aim", value: 0, data: [{ label: "0", value: "请设置数据源1" }, { label: "1", value: "请设置数据源2" }], key: "" },
    {
        id: 6,
        name: "多选",
        values: [],
        type: "checkbox",
        key: "",
        data: [{ label: "请设置数据源", value: "请设置数据源" }],
        icon: "el-icon-circle-check",
    },
    {
        id: 7,
        name: "下拉框",
        value: null,
        key: "",
        data: [{ label: "请设置数据源", value: "请设置数据源" }],
        type: "select",
        icon: "el-icon-arrow-down",
    },
    {
        id: 8,
        name: "下拉框多选",
        type: "selectList",
        key: "",
        values: [],
        data: [{ label: "请设置数据源", value: "请设置数据源" }],
        icon: "el-icon-arrow-down",
    },
    {
        id: 81,
        name: "级联",
        type: "cascader",
        icon: "el-icon-share",
        values: [],
        key: "",
        data: [
            {
                value: "请配置数据源",
                label: "请配置数据源",
                children: [
                    {
                        value: "具体",
                        label: "菜单:下拉框绑定设置",
                    },
                    {
                        value: "color",
                        label: "可参照字典编号[tree_roles]",
                    }
                ],
            },
        ],
    },
    {
        id: 9,
        name: "图片上传",
        type: "img",
        url: "",
        maxSize: 3,
        fileInfo: [],
        multiple: false,
        autoUpload: false,
        maxFile: 5,
        icon: "el-icon-picture-outline",
    },
    {
        id: 10,
        name: "excel上传",
        url: "",
        maxSize: 3,
        multiple: false,
        autoUpload: false,
        maxFile: 5, //最多可上传5个文件 
        fileInfo: [],
        type: "excel",
        icon: "el-icon-upload",
    },
    {
        id: 11,
        name: "文件上传",
        type: "file",
        url: "",
        maxSize: 3,
        multiple: false,
        autoUpload: false,
        maxFile: 5,
        fileInfo: [],
        icon: "el-icon-folder-opened",
    },
    {
        id: 12,
        name: "分段信息",
        type: "line",
        icon: "el-icon-guide",
    },
    {
        id: 13,
        name: "编辑器",
        type: "editor",
        value: "",
        url: "",
        height: 200,
        icon: "el-icon-notebook-2",
    },
    {
        id: 13,
        name: "弹出框",
        type: "box",
        value: "",
        url: "",
        height: 250,
        icon: "el-icon-notebook-2",
    },
    {
        id: 13,
        name: "表格",
        type: "table",
        tabs: false,
        columns: [
            { title: "字段1", field: "field1", show: true, required: false, edit: false, dataType: null, dataSource: null, width: 120, orderNo: null },
            { title: "字段2", field: "field2", show: true, required: false, edit: false, dataType: null, dataSource: null, width: 120, orderNo: null },
            { title: "字段3", field: "field3", show: true, required: false, edit: false, dataType: null, dataSource: null, width: 120, orderNo: null },
            { title: "字段4", field: "field4", show: true, required: false, edit: false, dataType: null, dataSource: null, width: 120, orderNo: null },
            // { title: "字段5", field: "Field5", width: 120 },
        ],
        tableData: [
            {
                field1: "field1",
                field2: "field2",
                field3: "field3",
                field4: "field4",
            },
            {
                field1: "field1",
                field2: "field2",
                field3: "field3",
                field4: "field4",
            },
            {
                field1: "field1",
                field2: "field2",
                field3: "field3",
                field4: "field4",
            },
        ],
        height: 150,
        icon: "el-icon-c-scale-to-original",
        url: null,
        index: false, //item.index,
        height: 200,
        index: false,
        columnIndex: false,
        ck: true,
        buttons: [
            { name: '添加行', ck: false, icon: 'el-icon-plus',value:'add' },
        { name: '删除行', ck: false, icon: 'el-icon-delete',value:'del' }, 
        { name: '刷新', ck: false ,icon:'el-icon-refresh-right',value:'ref'}],
    },
]
const tableOption = [
    { field: 'field', title: '字段', edit: { type: "text", keep: true }, width: 160 },
    { field: 'title', title: '字段中文名', edit: { type: "text", keep: true }, width: 120 },
    { field: 'show', title: '是否显示', edit: { type: "switch", keep: true }, width: 90 },
    {
        field: 'dataType', title: '显示类型', edit: { type: "select", keep: true }, width: 120, bind: {
            key: '', data: [
                { "key": "switch", "value": "单选" },
                { "key": "date", "value": "年月日" },
                { "key": "img", "value": "图片" },
                { "key": "excel", "value": "excel" },
                { "key": "file", "value": "文件" }
            ]
        }
    },

    { field: 'required', title: '是否必填', edit: { type: "switch", keep: true }, width: 90 },
    { field: 'edit', title: '是否可编辑', edit: { type: "switch", keep: true }, width: 90 },
    {
        field: 'editType', title: '编辑类型', edit: { type: "select", keep: true, }, width: 120, bind: {
            key: '', data: [{ "key": "text", "value": "输入框" },
            { "key": "switch", "value": "单选" },
            { "key": "select", "value": "下拉框" },
            { "key": "selectList", "value": "下拉框多选" },
            { "key": "date", "value": "日期" },
            { "key": "datetime", "value": "日期时分秒" },
            { "key": "checkbox", "value": "复选框多选" },
            { "key": "mail", "value": "邮箱地址" },
            { "key": "number", "value": "数字" },
            { "key": "decimal", "value": "小数" },
            { "key": "phone", "value": "手机号" },
            ]
        }
    },
    { field: 'dataSource', title: '数据源', edit: { type: "select", keep: true, data: [] }, bind: { key: '', data: [] }, width: 120 },
    { field: 'width', title: '列宽度', edit: { type: "text", keep: true }, width: 80 },
    { field: 'orderNo', title: '列显示顺序', edit: { type: "text", keep: true }, width: 100 }
];
export { components, tableOption }