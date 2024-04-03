let dataA = {
    "name": "流程A",
    "nodeList": [
        {
            "id": "0",
            "name": "流程开始",
            "type": "start",
            "left": "346px",
            "top": "22px",
            "ico": "el-icon-user-solid"
        },
        {
            "id": "nodeA",
            "name": "流程A-节点A",
            "type": "node",
            "left": "346px",
            "top": "132px",
            "ico": "el-icon-user-solid"
        },
    //     {
    //         "id": "nodeB",
    //         "name": "流程A-节点B",
    //         "type": "node",
    //         "left": "347px",
    //         "top": "235px",
    //         "ico": "el-icon-goods"
    //     },
    //     {
    //         "id": "nodeC",
    //         "name": "流程A-节点C",
    //         "type": "node",
    //         "left": "323px",
    //         "top": "399px",
    //         "ico": "el-icon-present"
    //     }
    ],
    "lineList": [
        {
            "from": "0",
            "to": "nodeA"
        },
        // {
        //     "from": "nodeA",
        //     "to": "nodeB"
        // },
        // {
        //     "from": "nodeB",
        //     "to": "nodeC"
        // }
    ]
}
export function getDataA () {
    return dataA
}
