//************************************************ 
//  *Author：jxx
//  *QQ：283591387
//  *代码由框架生成,任何更改都可能导致被代码生成器覆盖
//  *业务请在SellOrder.js中编写
//************************************************ 
export default function() {
	return {
		editFormFields: {"AuditStatus":"","AuditDate":"","OrderType":"","TranNo":"","Qty":"","SellNo":""},
		editFormOptions: [{"key":"audit","data":[],"title":"审核状态","required":true,"field":"AuditStatus","type":"number"},
                               {"title":"审核时间","field":"AuditDate"},
                               {"type":"group"},
                               {"key":"ordertype","data":[],"title":"订单类型","required":true,"field":"OrderType","type":"select"},
                               {"title":"运单号","required":true,"field":"TranNo"},
                               {"title":"销售数量","required":true,"field":"Qty","type":"number"},
                               {"type":"group"},
                               {"title":"销售订单号","required":true,"field":"SellNo"}],
		searchFormFields: {"OrderType":"","TranNo":"","SellNo":"","Qty":"","AuditStatus":"","AuditDate":""},
		searchFormOptions: [{"title":"销售数量","field":"Qty","type":"number"},{"type":"group"},{"title":"运单号","field":"TranNo"},{"title":"销售订单号","field":"SellNo"},{"key":"ordertype","data":[],"title":"订单类型","field":"OrderType","type":"select"},{"type":"group"},{"key":"audit","data":[],"title":"审核状态","field":"AuditStatus","type":"select"},{"title":"审核时间","field":"AuditDate","type":"datetime"}],
		columns: [{field:'OrderType',title:'订单类型',type:'int',bind:{ key:'ordertype',data:[]}},
                       {field:'TranNo',title:'运单号',type:'string',link:true},
                       {field:'SellNo',title:'销售订单号',type:'string'},
                       {field:'Qty',title:'销售数量',type:'int'},
                       {field:'AuditStatus',title:'审核状态',type:'int',bind:{ key:'audit',data:[]}},
                       {field:'AuditDate',title:'审核时间',type:'datetime'}],
		table: {
			key: 'Order_Id',
			footer: "Foots",
			cnName: '销售订单',
			name: 'SellOrder',
			url: "/SellOrder/",
			sortName: "CreateDate"
		}
	}
}
