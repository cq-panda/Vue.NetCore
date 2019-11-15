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
        { name: "data", desc: "数据源，可以手动绑定格式[{key:1,value:'是'}]也可以自动绑定,自定绑定需要设置属性loadKey='true'", type: "array", default: "[]" },
        { name: "title", desc: "标签名称", type: "string", default: "" },
        { name: "required", desc: "是否必填", type: "bool", default: "false" },
        { name: "field", desc: "字段，与表单字段必须相同", type: "string", default: "" },
        { name: "type", desc: "渲染的标签类型,可选值,mail、text、textarea、img、checkbox、number、decimal、date、datetime、phone、switch", type: "string", default: "text" },
        { name: "range", desc: "如果type是日期，需要选开始与结束日期", type: "bool", default: "false" },
        { name: "min", desc: "最小值", type: "number", default: "" },
        { name: "max", desc: "最大值", type: "number", default: "" },
        {
            name: "validator", desc: "对标签的值进行自定义验证，如：    validator: (rule, val, callback) => {\
            if (val != '234') {\
              return callback(new Error('必须输入【234】'));\
            }\
            return callback();\
          }", type: "function", default: ""
        },
        { name: "onChange", desc: "只有type=select才可以配置此属性", type: "function", default: "" },
        { name: "}", desc: "表单字段formRules的参数配置说明", type: "", default: "" },
        { name: "表单重置", desc: "表单重置使用：this.$refs.你的ref名字.reset()", type: "", default: "" },
        { name: "表单验证", desc: "表单验证使用：this.$refs.你的ref名字.validate()，返回值bool", type: "", default: "" },
        { name: "数据槽slot", desc: "可以在表单的第一行第前使用<div name='header'></div>或最后一行<div name='footer'></div>", type: "", default: "" }],
        methods: []

        
    }
}
export default param;