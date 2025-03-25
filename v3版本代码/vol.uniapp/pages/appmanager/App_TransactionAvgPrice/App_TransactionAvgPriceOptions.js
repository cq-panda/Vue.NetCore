//************************************************ 
//  *Author：jxx
//  *QQ：283591387
//  *代码由框架生成,任何更改都可能导致被代码生成器覆盖
//  *业务请在App_TransactionAvgPrice.js中编写
//************************************************ 
export default function() {
	return {
		editFormFields: {"Variety":[],"AgeRange":"","City":"","AvgPrice":"","Date":"","IsTop":"","Creator":"","CreateDate":""},
		editFormOptions: [{"key":"pz","data":[],"title":"多选","required":true,"field":"Variety","type":"checkbox"},
                               {"key":"age","data":[],"title":"值范围","required":true,"field":"AgeRange","type":"select"},
                               {"key":"city","data":[],"title":"城市","required":true,"field":"City","type":"select"},
                               {"title":"价格","required":true,"field":"AvgPrice","type":"decimal"},
                               {"title":"日期","required":true,"field":"Date","type":"date"},
                               {"key":"top","data":[],"title":"置顶","required":true,"field":"IsTop","type":"select"}],
		searchFormFields: {"Variety":"","AgeRange":"","City":"","Date":"","IsTop":"","Enable":""},
		searchFormOptions: [{"key":"pz","data":[],"title":"多选","field":"Variety","type":"select"},{"key":"age","data":[],"title":"值范围","field":"AgeRange","type":"select"},{"key":"city","data":[],"title":"城市","field":"City","type":"select"},{"type":"group"},{"title":"日期","field":"Date","type":"datetime"},{"key":"top","data":[],"title":"置顶","field":"IsTop","type":"select"},{"key":"enable","data":[],"title":"是否启用","field":"Enable","type":"select"}],
		columns: [{field:'Variety',title:'多选',type:'string',bind:{ key:'pz',data:[]}},
                       {field:'AgeRange',title:'值范围',type:'string',bind:{ key:'age',data:[]}},
                       {field:'City',title:'城市',type:'string',bind:{ key:'city',data:[]}},
                       {field:'AvgPrice',title:'价格',type:'decimal',link:true},
                       {field:'Date',title:'日期',type:'date'},
                       {field:'IsTop',title:'置顶',type:'int',bind:{ key:'top',data:[]}},
                       {field:'Creator',title:'创建人',type:'string',readonly:true},
                       {field:'CreateDate',title:'创建时间',type:'datetime',readonly:true}],
		table: {
			key: 'Id',
			footer: "Foots",
			cnName: '自动绑定下拉框',
			name: 'App_TransactionAvgPrice',
			url: "/App_TransactionAvgPrice/",
			sortName: "Id"
		}
	}
}
