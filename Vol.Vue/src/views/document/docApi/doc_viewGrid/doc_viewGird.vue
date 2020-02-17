
<template>
    <div>
        <view-grid :columns="columns"
                   :detail="detail"
                   :editFormFileds="editFormFileds"
                   :editFormOptions="editFormOptions"
                   :searchFormFileds="searchFormFileds"
                   :searchFormOptions="searchFormOptions"
                   :table="table"
                   :extend="extend">
        </view-grid>
    </div>
</template>

<script>
    import gridExtend from "../doc_viewGrid/doc_viewGirdExtension.js";
    import ViewGrid from "@/components/basic/ViewGrid.vue";
    var vueParam = {
        components: {
            ViewGrid
        },
        data() {
            return {
                table: {
                    key: 'Order_Id', //排序字段
                    footer: "Foots",
                    cnName: '主从表ViewGird组件使用',//表中文名
                    name: 'SellOrder',//表名(代码生码的别名)
                    url: "/SellOrder/",//后台控制名
                    sortName: "CreateDate" //后台排序字段
                },
                //所以自定义扩展对象，包括：方法、属性、自定义vue组件
                extend: gridExtend,
                //编辑字段
                editFormFileds: {"OrderType":"","TranNo":"","Qty":"","SellNo":"","Remark":"","Creator":"","CreateDate":"","ModifyDate":""},
                //编辑配置
                editFormOptions: [[{"dataKey":"ordertype","title":"订单类型","required":true,"field":"OrderType","type":"select"},
                               {"type":"text","title":"运单号","required":true,"field":"TranNo"},
                               {"type":"number","title":"销售数量","required":true,"field":"Qty"}],
                              [ {"type":"text","title":"销售订单号","required":true,"field":"SellNo"},{"type":"text","title":"创建人","field":"Creator","disabled":true},
                               {"type":"datetime","title":"创建时间","field":"CreateDate","disabled":true}
                             ],
                              [{"title":"备注","field":"Remark","colSize":12,"type":"textarea"}
                              ]],
                //查询字段,第一个字段为快捷查询字段
                searchFormFileds: {"OrderType":"","TranNo":"","SellNo":"","AuditStatus":"","AuditDate":"","Auditor":"","Creator":"","CreateDate":"","ModifyDate":""},
                //查询配置
                searchFormOptions: [
                    [
                        {"title":"运单号","field":"TranNo"},
                        {"type":"text","title":"销售订单号","field":"SellNo"},
                        {"dataKey":"ordertype","title":"订单类型","field":"OrderType","type":"select"}
                    ],
                    [
                        {"columnType":"int","dataKey":"audit","title":"审核状态","field":"AuditStatus","type":"select"},
                        {"title":"审核时间","field":"AuditDate","type":"datetime"},
                        {"type":"text","title":"审核人","field":"Auditor"}
                    ],
                    [
                        {"type":"text","title":"创建人","field":"Creator"},
                        {"title":"创建时间","field":"CreateDate","type":"datetime"},
                        {"title":"修改时间","field":"ModifyDate","type":"datetime"}
                    ]
                ],
                //主表table配置
                columns: [ //列参数为voltable组件的配置
                       {field:'Order_Id',title:'Id',type:'string',width:90,hidden:true,readonly:true,require:true},
                       {field:'OrderType',title:'订单类型',type:'int',bind:{ key:'ordertype',data:[]},width:90,require:true,sortable:true},
                       {field:'TranNo',title:'运单号(点击可弹出框)',type:'string',link:true,width:140,require:true},
                       {field:'SellNo',title:'销售订单号',type:'string',width:140,require:true},
                       {field:'Qty',title:'销售数量',type:'int',width:90,require:true},
                       {field:'Remark',title:'备注',type:'string',width:170},
                       {field:'Creator',title:'创建人',type:'string',width:100,readonly:true},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:90,readonly:true,sortable:true},
                       {field:'ModifyID',title:'ModifyID',type:'int',width:80,hidden:true}
                    ],
                //从表明细表配置
                detail: {
                    cnName:"订单明细",//明细表中文名
                    //明细表table配置
                    columns: [
                        {field:'OrderList_Id',title:'OrderList_Id',type:'string',width:90,hidden:true,require:true},
                       {field:'Order_Id',title:'订单Id',type:'string',width:90,hidden:true,readonly:true,require:true},
                       {field:'ProductName',title:'商品名称',type:'string',bind:{ key:'pn',data:[]},width:150,edit:{type:'select'},require:true,sortable:true},
                       {field:'MO',title:'批次',type:'string',width:100,edit:{type:''},require:true},
                       {field:'Qty',title:'数量',type:'int',width:90,edit:{type:'drop'},require:true},
                       {field:'Weight',title:'重量',type:'decimal',width:90,edit:{type:''}},
                       {field:'Remark',title:'备注',type:'string',width:120,edit:{type:''}},
                       {field:'CreateID',title:'CreateID',type:'int',width:80,hidden:true},
                       {field:'Creator',title:'创建人',type:'string',width:130},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:90,sortable:true},
                       {field:'ModifyID',title:'ModifyID',type:'int',width:80,hidden:true},
                       {field:'Modifier',title:'修改人',type:'string',width:100},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:90,sortable:true}
                    ],
                    //明细表排序字段
                    sortName: "CreateDate",
                    //明细表主键
                    key:"OrderList_Id"
                }
            };
        }
    };
    export default vueParam;
</script>
