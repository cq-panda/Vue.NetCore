let formFileds1 = {
    Variety: "",
    AgeRange: "",
    DateRange: [],
    City: "",
    AvgPrice: 8.88,
    Date: "",
    IsTop: "还没想好..."
}
let formRules1 = [
    //两列的表单，formRules数据格式为:[[{},{}]]
    [
        {
            link:true,
            dataKey: "city",
            title: "城市",
            required: true,
            field: "City",
            data: [],
            type: "select"
        },
        {
            title: "多选日期",
            range: true, //设置为true可以选择开始与结束日期
            required: false,
            field: "DateRange",
            //   colSize: 4,//设置宽度为1/3
            type: "date"
        }
    ],
    [
        {
            dataKey: "age", //后台下拉框对应的数据字典编号
            data: [], //loadKey设置为true,会根据dataKey从后台的下拉框数据源中自动加载数据
            title: "月龄",
            required: true, //设置为必选项
            field: "AgeRange",
            type: "select"
        },
        {
            title: "日期",
            required: true,
            field: "Date",
            placeholder: "你可以设置colSize属性决定标签的长度，可选值12/8/6/4",
            //  colSize: 8,//设置宽度为2/3
            type: "datetime"
        }
    ],
    [
        {
            title: "品种",
            dataKey: "age",
            placeholder: "此处数据源为手动绑定",
            //如果这里绑定了data数据，后台不会加载此数据源
            data: [{ key: "1", value: "1" }, { key: "2", value: "2" }],
            required: false,
            field: "Variety",
            type: "select"
        },
        {
            type: "decimal",
            title: "价格",
            required: true,
            placeholder: "你可以自己定义placeholder显示的文字",
            field: "AvgPrice"
        }
    ],
    [
        {
            title: "备注",
            required: true,
            field: "IsTop",
            colSize: 12, //设置12，此列占100%宽度
            type: "textarea"
        }
    ]
]

let formFileds2 = {
    Variety: "一次性用品",
    City: "北京市",
    DateRange: "2019-09-01",
    AvgPrice: 8.88,
    Variety1: "",
    DateRange1: "2019-09-02",
    AvgPrice1: 7.72,
    Address:"北京市海淀区001号",
    IsChange: 1
}
let formRules2 = [
    //两列的表单，formRules数据格式为:[[{},{}]]
    [
        {
            title: "商品类型",
            dataKey: "age",
            //如果这里绑定了data数据，后台不会加载此数据源
            data: [{ key: "1", value: "1" }, { key: "2", value: "2" }],
            field: "Variety",
            disabled: true,
            type: "select"
        },
        {
            dataKey: "city",
            title: "所在城市",
            field: "City",
            disabled: true,
            type: "select",
            data: []
        }],
    [
        {
            title: "销售日期",
            field: "DateRange",
            disabled: true,
        },
        {
            title: "销售价格",
            field: "AvgPrice",
            disabled: true
        }],
    [
        {
            title: "生产日期",
            field: "DateRange1",
            disabled: true,
        },
        {
            title: "中间价格",
            field: "AvgPrice1",
            disabled: true
        }],
    [
        {
            title: "销售地址",
            field: "Address",
            disabled: true,
        },
        {
            title: "是否成交",
            field: "IsChange",
            dataKey: "enable",//这里设置了数据字典源的编号会自动从后台加载数据源的key/value
            data: [],
            disabled: true
        }]
]


export { formFileds1, formRules1, formFileds2, formRules2 }