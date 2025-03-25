// *Author：jxx
// *Contact：283591387@qq.com
// *代码由框架生成,任何更改都可能导致被代码生成器覆盖
export default function(){
    const table = {
        key: 'ChangeRecordID',
        footer: "Foots",
        cnName: '变更记录',
        name: 'MES_ProductionPlanChangeRecord',
        newTabEdit: false,
        url: "/MES_ProductionPlanChangeRecord/",
        sortName: "CreateDate"
    };
    const tableName = table.name;
    const tableCNName = table.cnName;
    const newTabEdit = false;
    const key = table.key;
    const editFormFields = {"OrderNumber":"","CustomerName":"","OrderDate":"","ChangeDate":"","OriginalPlanQuantity":"","NewPlanQuantity":"","ChangeReason":"","ChangedBy":""};
    const editFormOptions = [[{"title":"订单编号","required":true,"field":"OrderNumber"},
                               {"title":"客户名称","required":true,"field":"CustomerName"}],
                              [{"title":"订单日期","field":"OrderDate","type":"date"},
                               {"title":"变更日期","required":true,"field":"ChangeDate","type":"date"}],
                              [{"title":"原计划数量","required":true,"field":"OriginalPlanQuantity","type":"number"},
                               {"title":"新计划数量","required":true,"field":"NewPlanQuantity","type":"number"}],
                              [{"title":"变更原因","required":true,"field":"ChangeReason"},
                               {"title":"变更人","required":true,"field":"ChangedBy"}]];
    const searchFormFields = {"OrderNumber":"","CustomerName":"","OrderDate":"","ChangeDate":"","OriginalPlanQuantity":[null,null]};
    const searchFormOptions = [[{"title":"订单编号","field":"OrderNumber"},{"title":"客户名称","field":"CustomerName"},{"title":"订单日期","field":"OrderDate","type":"date"},{"title":"变更日期","field":"ChangeDate","type":"date"},{"title":"原计划数量","field":"OriginalPlanQuantity","type":"range"}]];
    const columns = [{field:'ChangeRecordID',title:'变更记录ID',type:'string',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'PlanDetailID',title:'计划明细ID',type:'string',width:90,hidden:true,align:'left'},
                       {field:'OrderNumber',title:'订单编号',type:'string',link:true,width:90,require:true,align:'left'},
                       {field:'CustomerName',title:'客户名称',type:'string',width:90,require:true,align:'left'},
                       {field:'OrderDate',title:'订单日期',type:'date',width:90,align:'left'},
                       {field:'ChangeDate',title:'变更日期',type:'date',width:90,require:true,align:'left'},
                       {field:'OriginalPlanQuantity',title:'原计划数量',type:'int',width:90,require:true,align:'left'},
                       {field:'NewPlanQuantity',title:'新计划数量',type:'int',width:90,require:true,align:'left'},
                       {field:'OriginalPlannedStartTime',title:'原计划开始时间',type:'date',width:90,hidden:true,align:'left'},
                       {field:'NewPlannedStartTime',title:'新计划开始时间',type:'date',width:90,hidden:true,align:'left'},
                       {field:'OriginalPlannedEndTime',title:'原计划结束时间',type:'date',width:90,hidden:true,align:'left'},
                       {field:'NewPlannedEndTime',title:'新计划结束时间',type:'date',width:90,hidden:true,align:'left'},
                       {field:'ChangeReason',title:'变更原因',type:'string',width:90,require:true,align:'left'},
                       {field:'ChangedBy',title:'变更人',type:'string',width:90,require:true,align:'left'},
                       {field:'CreateID',title:'创建人ID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:90,hidden:true,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:90,hidden:true,align:'left'},
                       {field:'ModifyID',title:'修改人ID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Modifier',title:'修改人',type:'string',width:90,hidden:true,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:90,hidden:true,align:'left'}];
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