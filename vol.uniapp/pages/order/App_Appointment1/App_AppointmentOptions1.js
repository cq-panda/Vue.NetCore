//************************************************ 
//  *Author：jxx
//  *QQ：283591387
//  *代码由框架生成,任何更改都可能导致被代码生成器覆盖
//  *业务请在App_Appointment.js中编写
//************************************************ 
export default function() {
	return {
		editFormFields: {"Name":"","PhoneNo":"","Describe":"","CreateDate":"","Creator":""},
		editFormOptions: [{"title":"姓名","required":true,"field":"Name","disabled":true},
                               {"type":"group"},
                               {"title":"电话","required":true,"field":"PhoneNo","disabled":true},
                               {"title":"描述","required":true,"field":"Describe","disabled":true}],
		searchFormFields: {"Name":"","PhoneNo":"","CreateDate":"","Creator":""},
		searchFormOptions: [{"title":"姓名","field":"Name"},{"title":"电话","field":"PhoneNo"},{"title":"创建时间","field":"CreateDate","type":"datetime"},{"title":"创建人","field":"Creator"}],
		columns: [{field:'Name',title:'姓名',type:'string',link:true,readonly:true},
                       {field:'PhoneNo',title:'电话',type:'string',readonly:true},
                       {field:'Describe',title:'描述',type:'string',readonly:true},
                       {field:'CreateDate',title:'创建时间',type:'datetime',readonly:true},
                       {field:'Creator',title:'创建人',type:'string',readonly:true},
                       {field:'Modifier',title:'修改人',type:'string',readonly:true},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',readonly:true}],
		table: {
			key: 'Id',
			footer: "Foots",
			cnName: '基础表单+编辑只读',
			name: 'App_Appointment',
			url: "/App_Appointment/",
			sortName: "CreateDate"
		}
	}
}
