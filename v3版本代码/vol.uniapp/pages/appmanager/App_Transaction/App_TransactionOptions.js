//************************************************ 
//  *Author：jxx
//  *QQ：283591387
//  *代码由框架生成,任何更改都可能导致被代码生成器覆盖
//  *业务请在App_Transaction.js中编写
//************************************************ 
export default function() {
	return {
		editFormFields: {"Quantity":"","Describe":"","Name":"","PhoneNo":"","TransactionType":"","CowType":""},
		editFormOptions: [{"title":"姓名","required":true,"field":"Name"},
                               {"title":"电话","required":true,"field":"PhoneNo"},
                               {"type":"group"},
                               {"key":"cq","data":[],"title":"状态","required":true,"field":"TransactionType","type":"select"},
                               {"key":"nav","data":[],"title":"类型","field":"CowType","type":"select"},
                               {"type":"group"},
                               {"title":"数量","required":true,"field":"Quantity","type":"number"},
                               {"title":"描述","required":true,"field":"Describe"}],
		searchFormFields: {"Name":"","PhoneNo":"","TransactionType":"","CowType":"","Creator":"","CreateDate":""},
		searchFormOptions: [{"title":"姓名","field":"Name","type":"text"},{"title":"电话","field":"PhoneNo","type":"text"},{"key":"cq","data":[],"title":"状态","field":"TransactionType","type":"select"},{"type":"group"},{"key":"nav","data":[],"title":"类型","field":"CowType","type":"select"},{"title":"提交人","field":"Creator"},{"title":"提交时间","field":"CreateDate","type":"date"}],
		columns: [{field:'Name',title:'姓名',type:'string',link:true},
                       {field:'PhoneNo',title:'电话',type:'string'},
                       {field:'Quantity',title:'数量',type:'int'},
                       {field:'TransactionType',title:'状态',type:'int',bind:{ key:'cq',data:[]}},
                       {field:'CreateDate',title:'提交时间',type:'date'}],
		table: {
			key: 'Id',
			footer: "Foots",
			cnName: '导入导出',
			name: 'App_Transaction',
			url: "/App_Transaction/",
			sortName: "Id"
		}
	}
}
