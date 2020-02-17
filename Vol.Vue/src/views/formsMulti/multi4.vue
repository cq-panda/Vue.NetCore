<!--
*Author：jxx
 *Contact：283591387@qq.com
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *业务请在@/extension/order/SellOrder.js此处编写
 -->
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
    import extend from "../formsMulti/multil4Extension/multil4.js";
    import ViewGrid from "@/components/basic/ViewGrid.vue";
    var vueParam = {
        components: {
            ViewGrid
        },
        data() {
            return {
                table: {
                    key: 'Order_Id',
                    footer: "Foots",
                    cnName: '主从表单明细一对多',
                    name: 'SellOrder',
                    url: "/SellOrder/",
                    sortName: "CreateDate"
                },
                extend: extend,
                editFormFileds: {"OrderType":"","TranNo":"","Qty":"","SellNo":"","Remark":"","Creator":"","CreateDate":"","ModifyDate":""},
                editFormOptions: [[{"dataKey":"ordertype","title":"订单类型","required":true,"field":"OrderType","type":"select"},
                               {"type":"text","title":"运单号","required":true,"field":"TranNo"},
                               {"type":"number","title":"销售数量","required":true,"field":"Qty"}],
                               
                              [ {"type":"text","title":"销售订单号","required":true,"field":"SellNo"},{"type":"text","title":"创建人","field":"Creator","disabled":true},
                               {"type":"datetime","title":"创建时间","field":"CreateDate","disabled":true}
                             ],
                              [{"title":"备注","field":"Remark","colSize":12,"type":"textarea"}
                              ]],
                searchFormFileds: {"OrderType":"","TranNo":"","SellNo":"","AuditStatus":"","AuditDate":"","Auditor":"","Creator":"","CreateDate":"","ModifyDate":""},
                searchFormOptions: [[{"title":"运单号","field":"TranNo"},
                {"type":"text","title":"销售订单号","field":"SellNo"},
                {"dataKey":"ordertype","title":"订单类型","field":"OrderType","type":"select"}],
                [{"columnType":"int","dataKey":"audit","title":"审核状态","field":"AuditStatus","type":"select"},{"title":"审核时间","field":"AuditDate","type":"datetime"},{"type":"text","title":"审核人","field":"Auditor"}],[{"type":"text","title":"创建人","field":"Creator"},{"title":"创建时间","field":"CreateDate","type":"datetime"},{"title":"修改时间","field":"ModifyDate","type":"datetime"}]],
                columns: [{field:'Order_Id',title:'Id',type:'string',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'OrderType',title:'订单类型',type:'int',bind:{ key:'ordertype',data:[]},width:90,require:true,align:'left',sortable:true},
                       {field:'TranNo',title:'运单号',type:'string',link:true,width:150,require:true,align:'left'},
                       {field:'SellNo',title:'销售订单号',type:'string',width:200,require:true,align:'left'},
                       {field:'Qty',title:'销售数量',type:'int',width:90,require:true,align:'left'},
                       {field:'AuditStatus',title:'审核状态',type:'int',bind:{ key:'audit',data:[]},width:90,require:true,align:'left'},
                       {field:'AuditDate',title:'审核时间',type:'datetime',width:120,align:'left',sortable:true},
                       {field:'Auditor',title:'审核人',type:'string',width:90,align:'left'},
                       {field:'AuditId',title:'审核人Id',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Remark',title:'备注',type:'string',width:100,align:'left'},
                       {field:'CreateID',title:'CreateID',type:'int',width:80,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:100,readonly:true,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:90,readonly:true,align:'left',sortable:true},
                       {field:'ModifyID',title:'ModifyID',type:'int',width:80,hidden:true,align:'left'},
                       {field:'Modifier',title:'修改人',type:'string',width:100,hidden:true,readonly:true,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:90,readonly:true,align:'left',sortable:true}],
                detail: {
                    cnName:"订单明细",
                    columns: [{field:'OrderList_Id',title:'OrderList_Id',type:'string',width:90,hidden:true,require:true,align:'left'},
                       {field:'Order_Id',title:'订单Id',type:'string',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'ProductName',title:'商品名称',type:'string',bind:{ key:'pn',data:[]},width:150,edit:{type:'select'},require:true,align:'left',sortable:true},
                       {field:'MO',title:'批次',type:'string',width:100,edit:{type:''},require:true,align:'left'},
                       {field:'Qty',title:'数量',type:'int',width:90,edit:{type:'drop'},require:true,align:'left'},
                       {field:'Weight',title:'重量',type:'decimal',width:90,edit:{type:''},align:'left'},
                       {field:'Remark',title:'备注',type:'string',width:120,edit:{type:''},align:'left'},
                       {field:'CreateID',title:'CreateID',type:'int',width:80,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:130,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:90,align:'left',sortable:true},
                       {field:'ModifyID',title:'ModifyID',type:'int',width:80,hidden:true,align:'left'},
                       {field:'Modifier',title:'修改人',type:'string',width:100,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:90,align:'left',sortable:true}],
                    sortName: "CreateDate",
                    key:"OrderList_Id"
                }
            };
        }
    };
    export default vueParam;
</script>
