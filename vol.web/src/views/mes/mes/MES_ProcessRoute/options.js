// *Author：jxx
// *Contact：283591387@qq.com
// *代码由框架生成,任何更改都可能导致被代码生成器覆盖
export default function(){
    const table = {
        key: 'RouteID',
        footer: "Foots",
        cnName: '工线路线',
        name: 'MES_ProcessRoute',
        newTabEdit: false,
        url: "/MES_ProcessRoute/",
        sortName: "CreateDate"
    };
    const tableName = table.name;
    const tableCNName = table.cnName;
    const newTabEdit = false;
    const key = table.key;
    const editFormFields = {"ProductName":"","RouteSequence":"","RouteDescription":"","PreProcessID":"","NextProcessID":"","RouteStatus":""};
    const editFormOptions = [[{"title":"路线名称","required":true,"field":"ProductName"}],
                              [{"title":"路线顺序","required":true,"field":"RouteSequence","type":"number"}],
                              [{"title":"路线描述","field":"RouteDescription"}],
                              [{"dataKey":"工序","data":[],"title":"前工序","field":"PreProcessID","type":"select"}],
                              [{"dataKey":"工序","data":[],"title":"后工序","field":"NextProcessID","type":"select"}],
                              [{"dataKey":"enable","data":[],"title":"启用状态","field":"RouteStatus","type":"select"}]];
    const searchFormFields = {"ProductName":"","RouteSequence":"","RouteDescription":"","PreProcessID":"","NextProcessID":""};
    const searchFormOptions = [[{"title":"路线名称","field":"ProductName"},{"title":"路线顺序","field":"RouteSequence","type":"number"},{"title":"路线描述","field":"RouteDescription"},{"dataKey":"工序","data":[],"title":"前工序","field":"PreProcessID","type":"select"},{"dataKey":"工序","data":[],"title":"后工序","field":"NextProcessID","type":"select"}]];
    const columns = [{field:'RouteID',title:'路线ID',type:'string',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'ProcessID',title:'工序',type:'string',width:90,hidden:true,align:'left'},
                       {field:'ProductID',title:'产品ID',type:'string',width:90,hidden:true,align:'left'},
                       {field:'ProductName',title:'路线名称',type:'string',link:true,width:90,require:true,align:'left'},
                       {field:'RouteSequence',title:'路线顺序',type:'int',width:90,require:true,align:'left'},
                       {field:'RouteDescription',title:'路线描述',type:'string',width:90,align:'left'},
                       {field:'PreProcessID',title:'前工序',type:'string',bind:{ key:'工序',data:[]},width:90,align:'left'},
                       {field:'NextProcessID',title:'后工序',type:'string',bind:{ key:'工序',data:[]},width:90,align:'left'},
                       {field:'RouteStatus',title:'启用状态',type:'string',bind:{ key:'enable',data:[]},width:90,align:'left'},
                       {field:'RouteResponsible',title:'路线责任人',type:'string',width:90,hidden:true,align:'left'},
                       {field:'CreateID',title:'创建人ID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:90,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:90,align:'left'},
                       {field:'ModifyID',title:'修改人ID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Modifier',title:'修改人',type:'string',width:90,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:90,align:'left'}];
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