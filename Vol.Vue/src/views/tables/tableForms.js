let options = {
    formFileds1: {//表单配置
        Variety: "",
        AgeRange: "",
        DateRange: [],
        City: "",
        AvgPrice: 8.88,
        Date: "",
        IsTop: "还没想好..."
    }
    , formRules1: [//表单配置
        [
            {
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
    ],
    table: { //table表单配置
        data: [{ ExpertName: "移动手机", AuditStatus: 0, CreateDate: "2019-11-01", UserTrueName: "沈万三" },
        { ExpertName: "电子产品", AuditStatus: 1, CreateDate: "2019-11-02", UserTrueName: "鲁班" },
        { ExpertName: "生活用品", AuditStatus: 2, CreateDate: "2019-11-03", UserTrueName: "二货" },
        { ExpertName: "家具办公", AuditStatus: 0, CreateDate: "2019-11-04", UserTrueName: "二手" }],
        columns: [{
            field: "ExpertName",
            title: "商品名称"
        },
        {
            field: "AuditStatus",
            title: "审核状态",
            bind: {
                key: "audit",
                data: [
                    { key: "0", value: "审核中" },
                    { key: "1", value: "审核通过" },
                    { key: "2", value: "审核未通过" }
                ]
            }
        }, {
            field: "UserTrueName",
            title: "申请人",
            width: 120
        }, {
            field: "CreateDate",
            title: "申请时间",
            type: "datetime"
        }]
    }
}
export default options;