// *Author：jxx
// *Contact：283591387@qq.com
// *代码由框架生成,任何更改都可能导致被代码生成器覆盖
export default function(){
    const table = {
        key: 'ProcessID',
        footer: "Foots",
        cnName: '工序管理',
        name: 'MES_Process',
        newTabEdit: false,
        url: "/MES_Process/",
        sortName: "CreateDate"
    };
    const tableName = table.name;
    const tableCNName = table.cnName;
    const newTabEdit = false;
    const key = table.key;
    const editFormFields = {"ProcessCode":"","ProcessName":"","ProcessType":"","ProcessSequence":"","ProcessDescription":"","WorkCenter":"","StandardWorkingHours":"","ProcessStatus":""};
    const editFormOptions = [[{"title":"工序编码","required":true,"field":"ProcessCode"},
                               {"title":"工序名称","required":true,"field":"ProcessName"},
                               {"title":"工序类型","field":"ProcessType"},
                               {"title":"工序顺序","required":true,"field":"ProcessSequence","type":"number"}],
                              [{"title":"工序描述","field":"ProcessDescription"},
                               {"title":"工作中心","field":"WorkCenter"},
                               {"title":"标准工时","required":true,"field":"StandardWorkingHours","type":"decimal"},
                               {"title":"工序状态","field":"ProcessStatus"}]];
    const searchFormFields = {"ProcessCode":"","ProcessName":"","ProcessType":"","ProcessSequence":"","ProcessDescription":""};
    const searchFormOptions = [[{"title":"工序编码","field":"ProcessCode"},{"title":"工序名称","field":"ProcessName"},{"title":"工序类型","field":"ProcessType"},{"title":"工序顺序","field":"ProcessSequence","type":"number"},{"title":"工序描述","field":"ProcessDescription"}]];
    const columns = [{field:'ProcessID',title:'工序ID',type:'string',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'ProcessCode',title:'工序编码',type:'string',link:true,width:90,require:true,align:'left'},
                       {field:'ProcessName',title:'工序名称',type:'string',width:90,require:true,align:'left'},
                       {field:'ProcessType',title:'工序类型',type:'string',width:90,align:'left'},
                       {field:'ProcessSequence',title:'工序顺序',type:'int',width:90,require:true,align:'left'},
                       {field:'ProcessDescription',title:'工序描述',type:'string',width:90,align:'left'},
                       {field:'WorkCenter',title:'工作中心',type:'string',width:90,align:'left'},
                       {field:'StandardWorkingHours',title:'标准工时',type:'decimal',width:90,require:true,align:'left'},
                       {field:'ProcessStatus',title:'工序状态',type:'string',width:90,align:'left'},
                       {field:'ResponsibleWorker',title:'责任人',type:'string',width:90,hidden:true,align:'left'},
                       {field:'CreateID',title:'创建人ID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:90,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:90,align:'left'},
                       {field:'ModifyID',title:'修改人ID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Modifier',title:'修改人',type:'string',width:90,hidden:true,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:90,hidden:true,align:'left'}];
    const detail =  {
                    cnName: '工艺路线',
                    table: 'MES_ProcessRoute',
                    columns: [{field:'RouteID',title:'路线ID',type:'string',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'ProcessID',title:'工序',type:'string',width:90,hidden:true,align:'left'},
                       {field:'ProductID',title:'产品ID',type:'string',width:90,hidden:true,align:'left'},
                       {field:'ProductName',title:'路线名称',type:'string',link:true,width:90,edit:{type:''},require:true,align:'left'},
                       {field:'RouteSequence',title:'路线顺序',type:'int',width:90,edit:{type:''},require:true,align:'left'},
                       {field:'RouteDescription',title:'路线描述',type:'string',width:90,edit:{type:''},align:'left'},
                       {field:'PreProcessID',title:'前工序',type:'string',bind:{ key:'工序',data:[]},width:90,edit:{type:'select'},align:'left'},
                       {field:'NextProcessID',title:'后工序',type:'string',bind:{ key:'工序',data:[]},width:90,edit:{type:'select'},align:'left'},
                       {field:'RouteStatus',title:'启用状态',type:'string',bind:{ key:'enable',data:[]},width:90,edit:{type:'select'},align:'left'},
                       {field:'RouteResponsible',title:'路线责任人',type:'string',width:90,hidden:true,align:'left'},
                       {field:'CreateID',title:'创建人ID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:90,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:90,align:'left'},
                       {field:'ModifyID',title:'修改人ID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Modifier',title:'修改人',type:'string',width:90,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:90,align:'left'}],
                    sortName: 'CreateDate',
                    key: 'RouteID'
                                            };
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