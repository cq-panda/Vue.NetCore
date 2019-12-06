let param = {
    icons: {
        attr: [],
        methods: [{ name: "on-select", desc: "选中图标事件", param: "图标样式名" }]
    }, form: {
        attr: [{ name: "loadKey", desc: "是否自动绑定select/checkboxt等标签的数据源", type: "bool", default: "false" },
        { name: "width", desc: "表单宽度", type: "number", default: "100%" },
        { name: "labelWidth", desc: "左边标签宽度", type: "number", default: "100" },
        { name: "formFileds", desc: "表单字段key/value，如:{name:'admin',age:''}", type: "json", default: "" },
        { name: "disabled", desc: "是否只读", type: "bool", default: "false" },
        { name: "placeholder", desc: "标签提示文字", type: "string", default: "" },
        { name: "colSize", desc: "每行列的宽度，可选值:12,8,6,如果是12标签会占100%宽度", type: "number", default: "" },
        { name: "formRules", desc: "表单字段的参数配置说明(数组的元素个数决定了表单每行显示的标签个数)", type: "array", default: "[]" },
        { name: "{", desc: "表单字段formRules的参数配置说明", type: "", default: "" },
        { name: "dataKey", desc: "数据源字典编号(菜单->系统->下拉框绑定中的字典编号)", type: "string", default: "" },
        { name: "data", desc: "数据源，可以手动绑定格式[{key:1,value:'是'}],也可以自动绑定,自定绑定需要设置属性loadKey='true'", type: "array", default: "[]" },
        { name: "title", desc: "标签名称", type: "string", default: "" },
        //
        { name: "readonly/readonly", desc: "是否只读", type: "bool", default: "false" },
        { name: "required", desc: "是否必填", type: "bool", default: "false" },
        { name: "field", desc: "字段，与表单字段必须相同", type: "string", default: "" },
        { name: "filter", desc: "启用搜索,只对select/selectList生效,默认下拉框数据源超出10个开启搜索", type: "bool", default: "false" },
        { name: "type", desc: "渲染的标签类型,可选值,mail、text、textarea、img、checkbox、number、decimal、date、datetime、phone、switch、select、selectList(多选下拉框)", type: "string", default: "text" },
        { name: "range", desc: "如果type是日期，需要选开始与结束日期", type: "bool", default: "false" },
        { name: "min", desc: "1、数字类型标签：最小值,如果是type=number(整数)类型，默认验证最小值是1(decimal最小默认值0.1)，如果在代码生后的页面需要修改默认值，在扩展js的方法onInit中遍历form对象，可参考SellOrder.js中onInit方法。    2、其他标签,如：input/textarea设置min就是指的字符的最大长度", type: "number", default: "" },
        { name: "max", desc: "最大值,操作与min相同", type: "number", default: "" },
        {
            name: "validator", desc: "对标签的值进行自定义验证，如：    validator: (rule, val, callback) => {\
            if (val != '234') {\
              return callback(new Error('必须输入【234】'));\
            }\
            return callback();\
          }", type: "function", default: ""
        },
        {
            name: "onKeyPress", desc: '只对input/textarea生效,onKeyPress: $event => {\
                if ($event.keyCode == 13) {}\
              }', type: "function", default: ""
        },
        { name: "onChange", desc: "只有type=select才可以配置此属性", type: "function", default: "" },
        { name: "extra", desc: '添加额外标签：  extra: {//显示图标 icon: "ios-search", //显示文本 text: "点击可触发事件",//触发事件 click: item => {}}', type: "string", default: "" },
        { name: "minRows", desc: "textarea标签最小高度", type: "number", default: "2" },
        { name: "maxRows", desc: "textarea标签最大高度", type: "number", default: "10" },
        { name: "}", desc: "表单字段formRules的参数配置说明", type: "", default: "" },
        { name: "表单重置", desc: "表单重置使用：this.$refs.你的ref名字.reset()", type: "", default: "" },
        { name: "表单验证", desc: "表单验证使用：this.$refs.你的ref名字.validate()，返回值bool", type: "", default: "" },
        { name: "数据槽slot", desc: "可以在表单的第一行第前使用<div name='header'></div>或最后一行<div name='footer'></div>", type: "", default: "" }],
        methods: []
    }, header: {
        attr: [{ name: "icon", desc: "显示图标", type: "string", default: "" },
        { name: "text", desc: "显示名称", type: "string", default: "" },
        { name: "slot数据槽", desc: "右边button显示的这部份内容", type: "", default: "" },
        { name: "slot数据槽content", desc: "使用方式<div slot='content'>VolHeader这里可以定义显示内容</div>", type: "", default: "" }],
        methods: []
    },
    box: {
        attr: [{ name: "title", desc: "弹出框标题", type: "string", default: "基本信息" },
        { name: "icon", desc: "弹出框图标", type: "string", default: "ios-information-circle-outline" },
        { name: "model", desc: "是否显示弹出框", type: "bool", default: "false" },
        { name: "height", desc: "弹出框高度", type: "int", default: "200" },
        { name: "width", desc: "弹出框宽度", type: "int", default: "650" },
        { name: "padding", desc: "弹出框内容padding大小", type: "int", default: "16" },
        { name: "mask", desc: "弹出框是否显示遮罩", type: "boole", default: "true" },
        { name: "数据槽slot", desc: "弹出框内容", type: "", default: "" },
        { name: "数据槽footer", desc: "弹出框底部按钮，默认只有一个关闭按钮，如果加了 <div slot='footer'></div>关闭按钮不会显示，需要自己添加", type: "", default: "" }],
        methods: []
    }, voltable: {
        attr: [{ name: "loadKey", desc: "是否自动绑定数据源key/value,如果=true会自动把带bind属性data长度为0的列绑定上数据源", type: "bool", default: "false" },
        { name: "height", desc: "table高度", type: "number", default: "" },
        { name: "max-height", desc: "table最大高度,如果设置了max-height属性，height属性将不会生效", type: "number", default: "" },
        { name: "--", desc: "--", type: "--", default: "--" },
        { name: "pagination", desc: "分页参数", type: "json", default: "{ total: 0, size: 0, sortName: ''}" },
        { name: "{", desc: "", type: "", default: "" },
        { name: "total", desc: "总数量", type: "number", default: "0" },
        { name: "size", desc: "分页大小", type: "number", default: "0" },
        { name: "sortName", desc: "排序字段", type: "string", default: "" },
        { name: "}", desc: "", type: "", default: "" },
        { name: "--", desc: "--", type: "--", default: "--" },
        { name: "url", desc: "远程加载数据的地址，配置了url默认从远程加载数据", type: "string", default: "" }, { name: "defaultLoadPage", desc: "传入了url参数，是否默认加载表格数据", type: "bool", default: "true" },
        { name: "paginationHide", desc: "是否显示分页数据", type: "string", default: "" },
        { name: "index", desc: "是否创建索引号,如果需要表格编辑功能，这里需要设置为true", type: "bool", default: "false" },
        { name: "tableData", desc: "table表数据，如果不需要从远程加载table数据，请设置tableData属性,格式:[{'字段1':'值1'},{'字段2':'值2'}]", type: "array", default: "[]" },
        { name: "--", desc: "--", type: "--", default: "--" },
        { name: "columns", desc: "table表参数配置", type: "array", default: "[]" },
        { name: "{-----", desc: "-----columns属性介绍开始处-----", type: "-----", default: "-----" },
        { name: "field", desc: "字段", type: "string", default: "" },
        { name: "title", desc: "table列名", type: "string", default: "" },
        { name: "width", desc: "列宽度", type: "number", default: "" },
        { name: "sortable", desc: "是否排序,目前只对第一列生效", type: "bool", default: "false" },
        { name: "hidden", desc: "是否隐藏列", type: "bool", default: "false" },
        { name: "fixed", desc: "是否固定列", type: "bool", default: "false" },
        { name: "type", desc: "目前只有img,其他不需要设置", type: "string", default: "" },
        { name: "required", desc: "是否必填项(设置edit了属性才会生效)", type: "bool", default: "false" },
        { name: "edit{", desc: "表格编辑配置", type: "json", default: "" },
        { name: "type", desc: "编辑创建的标签类型：number、decimal、text、datetime、date、switch、select", type: "", default: "" },
        { name: "min", desc: "type为number、decimal时验证最小值,其他验证长度", type: "number", default: "" },
        { name: "max}", desc: "同上min", type: "number", default: "" },
        { name: "--", desc: "--", type: "--", default: "--" },
        { name: "bind{", desc: "数据源绑定配置", type: "json", default: "" },
        { name: "key", desc: "后台字典数据的key", type: "string", default: "" },
        { name: "data}", desc: "数据源,如果设置的loadKey=true,些处将设置为data:[]。格式:[{key:'1',value:'北京市'},{key:'2',value:'上海市'}],如果data长度>0，不会被loadKey从后台加载的数据源覆盖", type: "array", default: "[]" },
        { name: "formatter", desc: "列格式化处理,格式：formatter:(row) => {return '123'}", type: "function", default: "" },
        { name: "click", desc: "单元格点击事件,格式：click: (row, column, event) => {}", type: "function", default: "" },
        { name: "getColor", desc: "设置绑定了bind数据源属性的单元格颜色,格式：getColor:(row) => {return 'red'}", type: "function", default: "" },
        { name: "-----}", desc: "-----columns属性介绍结尾处-----", type: "-----", default: "-----" },
        ],
        methods: [{ name: "delRow", desc: "删除选中行，this.$refs.自定义的名字.delRow()", param: "" },
        { name: "add", desc: "添加行，this.$refs.自定义的名字.add({'字段1':'值1'})", param: "" },
        { name: "selection", desc: "获取选中的行，this.$refs.自定义的名字.selection,注意此处selection是属性", param: "" },
        { name: "load", desc: "刷新表数据，this.$refs.自定义的名字.load({条件:}),条件可以任意写你自己接收的格式", param: "" },
        { name: "resetPage", desc: "重置分页信息，this.$refs.自定义的名字.resetPage()", param: "" },
        { name: "loadBefore", desc: "从后台加载数据前处理，可参照【从api加载数据】Demo", param: "(param, callBack) 参数：param为查询相关配置，可自己修改此配置;callBack回调方法，callBack(true),如果回调传入false，将中断代码执行" },
        { name: "loadTableAfter", desc: "从后台加载数据后处理，可参照【从api加载数据】Demo", param: "(data, callBack) 参数：data为后台返回的数据;callBack回调方法，callBack(true),如果回调传入false，将中断代码执行" }]
    }, edittable: {
        attr: [],
        methods: []
    }, viewGrid: {
        attr: [{ name: "columns", desc: "查询页面table表的配置,具体配置可参照VolTable参数", type: "array", default: "[]" },
        { name: "detail", desc: "从表配置：{columns:[],sortName:''},columns从表table列配置,sortName从表排序字段", type: "json", default: "{}" },
        { name: "editFormFileds", desc: "编辑字段，可参照VolForm配置", type: "json", default: "{}" },
        { name: "editFormOptions", desc: "编辑配置,，可参照VolForm配置", type: "array", default: "[]" },
        { name: "searchFormFileds", desc: "查询字段，同上", type: "json", default: "{}" },
        { name: "searchFormOptions", desc: "查询配置，同上", type: "array", default: "[]" },
        {
            name: "table", desc: "表其他配置,如：     table: {\
            key: 'Order_Id', //排序字段\
            footer: 'Foots',\
            cnName: '主从表ViewGird组件使用',//表中文名\
            name: 'SellOrder',//表名(代码生码的别名)\
            url: '/SellOrder/',//后台控制器名\
            sortName: 'CreateDate' //后台排序字段}", type: "array", default: "{}"
        },
        { name: "extend", desc: "扩展js中的所有对象,如:doc_viewGirdExtension.js整个js文件的对象", type: "json", default: "array" },
        { name: "currentAction", desc: "当前操作的状态:如：Add,update", type: "string", default: "" },
        { name: "currentRow", desc: "当前编辑的行数据", type: "json", default: "" },
        { name: "labelWidth", desc: "高级查询label标签的宽度", type: "number", default: "100" },
        { name: "maxBtnLength", desc: "查询界面显示的按钮最大数量，超过的在更多中显示", type: "number", default: "3" },
        { name: "buttons", desc: "查询界面的所有按钮", type: "array", default: "[]" },
        { name: "boxButtons", desc: "弹出框的所有按钮", type: "array", default: "[]" },
        { name: "dicKeys", desc: "所有数据源的字典编号", type: "array", default: "[]" },
        { name: "hasKeyField", desc: "所有有数据源的字段", type: "array", default: "[]" },
        { name: "hasDetail", desc: "是否有明细", type: "bool", default: "false" },
        { name: "detailOptions", desc: "明细配置", type: "array", default: "[]" }],
        methods: []
    }, uploadExcel: {
        attr: [],
        methods: []
    }, uploadImg: {
        attr: [],
        methods: []
    }, volmenu: {
        attr: [],
        methods: []
    }
}
export default param;  