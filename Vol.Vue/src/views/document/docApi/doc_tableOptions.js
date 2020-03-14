let editTable = {
    data: [  //表数据
        {
            ExpertId: 276,
            NotNull: "还没想好",
            LimitLenght: "baba",
            UserImg:
                "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x1.jpg",
            LimitNumber: 3,
            EventClick: "七秒钟的记忆",
            FormatString: '2019-11-20',
            BindKeyValue: "1",
            Enable: 1,
            ReallyName: "七秒的记忆",
            filetest: "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/github/wordtest.docx",//也是设置为api服务器的文件，地址如：static/20191206/xx.xlsx
            CreateDate: "2018-09-18 17:45:54"
        },
        {
            ExpertId: 276,
            NotNull: "往事已成风",
            LimitLenght: "冷风中",
            UserImg:
                "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x2.jpg",
            LimitNumber: 5,
            EventClick: "不午休的猫",
            FormatString: '2019-11-08',
            BindKeyValue: "2",
            Enable: 0,
            ReallyName: "月穿潭底水無痕",
            CreateDate: "2018-09-18 17:45:54",
            filetest: "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/github/wordtest.docx,https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/github/exceltest.xlsx" //也是设置为api服务器的文件，地址如：static/20191206/xx.xlsx
        }
    ],
    columns: [
        //表配置
        {
            field: "ExpertId", //数据库表字段,必须和数据库一样，并且大小写一样
            title: "主键ID", //表头显示的名称
            isKey: true, //是否为主键字段
            hidden: true //是否显示
        },
        {
            field: "NotNull",
            title: "不可为空",
            width: 70,
            required: true,
            edit: { type: "text" },
            sortable: true //是否排序(目前第一个字段为排序字段，其他字段排序开发中)
        },
        {
            field: "LimitLenght",
            title: "限制长度",
            fixed: true,
            width: 80,
            required: true,
            edit: { type: "text", min: 2, max: 4 }
        },
        {
            field: "UserImg",
            title: "图片",
            type: "img",
            width: 120
        },
        {
            field: "filetest",
            title: "文件下载",
            width: 110,
            type: 'file'//指定为file与excel即可下载文件
        },
        {
            field: "LimitNumber",
            title: "数字大小",
            summary:true,//设置求和，并可以实时计算
            width: 70,
            require: true,
            edit: { type: "number", min: 3, max: 5 }
        },
        {
            field: "EventClick",
            title: "不可编辑",
            type: "string",
            width: 80,
            require: true
            // ,
            // click: (row, column) => {
            //     //单元格点击事亻
            //     this.$Message.error(
            //         "此单元格没有设置编辑属性。如果columns写在配置js中，拿不到this，请在created方法动态添加click方法"
            //     );
            // }
        },
        {
            field: "FormatString",
            title: "格式化日期",
            width: 90,
            require: true,
            formatter: row => {
                //对单元格的数据格式化处理
                if (!row.FormatString) {
                    return;
                }
                return row.FormatString.replace(/-/g, '.');
            }
        },
        {
            field: "BindKeyValue",
            title: "手动绑定数据源Key.Value",
            type: "int",
            edit: { type: "select" },
            bind: {
                //如果后面返回的数据为数据源的数据，请配置此bind属性，可以从后台字典数据源加载，也只以直接写上
                key: "audit",
                data: [
                    { key: "0", value: "审核中" },
                    { key: "1", value: "审核通过" },
                    { key: "2", value: "审核未通过" }
                ]
            },
            width: 110
        },
        {
            field: "Enable",
            title: "自动绑定KeyValue",
            type: "byte",
            bind: { key: "enable", data: [] }, //此处值为data空数据，自行从后台字典数据源加载
            width: 110,
            edit: { type: "switch" }
        },
        {
            field: "CreateDate",
            title: "日期",
            type: "datetime",
            width: 110,
            edit: { type: "datetime" }
        }
    ]
}

let remoteColumns = [
    //表配置
    {
        field: "ExpertId", //数据库表字段,必须和数据库一样，并且大小写一样
        title: "主键ID", //表头显示的名称
        isKey: true, //是否为主键字段
        hidden: true //是否显示
    },
    {
        field: "HeadImageUrl",
        title: "头像",
        type: "img",
        width: 160
    },
    {
        field: "UserName",
        title: "申请人帐号",
        sort: true,
        link: true, //设置link=true后此单元格可以点击获取当前行的数据进行其他操作
        width: 120
    },
    {
        field: "UserTrueName",
        sort: true,
        title: "申请人",
        width: 120
    },
    {
        field: "AuditStatus",
        title: "审核状态",
        width: 120,
        bind: {
            //如果后面返回的数据为数据源的数据，请配置此bind属性，可以从后台字典数据源加载，也只以直接写上
            key: "audit",
            data: []
        }
    },
    {
        field: "ReallyName",
        title: "真实姓名",
        width: 120,
        // click: (row, column) => {
        //     //单元格点击事亻
        //     let msg =
        //         "此处可以自己自定格式显示内容,此单元格原始值是:【" +
        //         row.ReallyName +
        //         "】";
        //     this.$message.error(msg);
        // },
        formatter: () => {
            //对单元格的数据格式化处理
            return "<a>点我</a>";
        }
    }
]
export { editTable, remoteColumns }