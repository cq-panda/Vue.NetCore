// *Author：jxx
// *Contact：283591387@qq.com
// *代码由框架生成,任何更改都可能导致被代码生成器覆盖
export default function(){
    const table = {
        key: 'Id',
        footer: "Foots",
        cnName: '测试',
        name: 'TestService',
        url: "/TestService/",
        sortName: "CreateDate"
    };
    const tableName = table.name;
    const tableCNName = table.cnName;
    const newTabEdit = false;
    const key = table.key;
    const editFormFields = {"DbName":"","DbContent":""};
    const editFormOptions = [[{"title":"DbName","required":true,"field":"DbName"},
                               {"title":"DbContent","field":"DbContent"}]];
    const searchFormFields = {"DbName":"","DbContent":""};
    const searchFormOptions = [[{"title":"DbName","field":"DbName"},{"title":"DbContent","field":"DbContent"}]];
    const columns = [{field:'Id',title:'Id',type:'string',width:110,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'DbName',title:'DbName',type:'string',width:120,require:true,align:'left'},
                       {field:'DbContent',title:'DbContent',type:'string',width:120,align:'left'},
                       {field:'CreateDate',title:'CreateDate',type:'datetime',width:150,align:'left'},
                       {field:'CreateID',title:'CreateID',type:'int',width:100,hidden:true,align:'left'},
                       {field:'Creator',title:'Creator',type:'string',width:100,align:'left'},
                       {field:'Modifier',title:'Modifier',type:'string',width:100,align:'left'},
                       {field:'ModifyDate',title:'ModifyDate',type:'datetime',width:150,align:'left'},
                       {field:'ModifyID',title:'ModifyID',type:'int',width:100,hidden:true,align:'left'}];
    const detail ={columns:[]};
    const details = [];

    return {
        table,
        key,
        tableName,
        tableCNName,
        newTabEdit,
        editFormFields,
        editFormOptions,
        searchFormFields,
        searchFormOptions,
        columns,
        detail,
        details
    };
}