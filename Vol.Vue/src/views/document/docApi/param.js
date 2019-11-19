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
        { name: "type", desc: "渲染的标签类型,可选值,mail、text、textarea、img、checkbox、number、decimal、date、datetime、phone、switch", type: "string", default: "text" },
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
    }, uploadExcel: {
        attr: [],
        methods: []
    }, uploadImg: {
        attr: [],
        methods: []
    }, volmenu: {
        attr: [],
        methods: []
    }, voltable: {
        attr: [],
        methods: []
    }, viewGrid: {
        attr: [],
        methods: []
    } 
}
export default param;  