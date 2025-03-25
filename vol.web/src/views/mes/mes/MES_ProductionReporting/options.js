// *Author：jxx
// *Contact：283591387@qq.com
// *代码由框架生成,任何更改都可能导致被代码生成器覆盖
export default function(){
    const table = {
        key: 'ReportingID',
        footer: "Foots",
        cnName: '生产报工',
        name: 'MES_ProductionReporting',
        newTabEdit: false,
        url: "/MES_ProductionReporting/",
        sortName: "CreateDate"
    };
    const tableName = table.name;
    const tableCNName = table.cnName;
    const newTabEdit = false;
    const key = table.key;
    const editFormFields = {"ReportingNumber":"","ReportedBy":"","ReportingTime":"","Total":"","RejectedQuantity":"","AcceptedQuantity":"","ReportHour":"","CreateDate":""};
    const editFormOptions = [[{"title":"报工单号","field":"ReportingNumber"},
                               {"dataKey":"用户列表","data":[],"title":"报工人","required":true,"field":"ReportedBy","type":"select"},
                               {"title":"报工时间","field":"ReportingTime","type":"date"},
                               {"title":"报工数量","field":"Total","type":"number"}],
                              [{"title":"不合格数量","field":"RejectedQuantity","type":"number"},
                               {"title":"合格数量","field":"AcceptedQuantity","type":"number"},
                               {"title":"工时(小时)","field":"ReportHour","type":"decimal"},
                               {"title":"创建时间","field":"CreateDate","disabled":true}]];
    const searchFormFields = {"ReportingNumber":"","ReportedBy":"","ReportingTime":"","Total":[null,null],"AuditStatus":""};
    const searchFormOptions = [[{"title":"报工单号","field":"ReportingNumber"},{"dataKey":"用户列表","data":[],"title":"报工人","field":"ReportedBy","type":"select"},{"title":"报工时间","field":"ReportingTime","type":"datetime"},{"title":"报工数量","field":"Total","type":"range"},{"dataKey":"audit","data":[],"title":"审批状态","field":"AuditStatus","type":"select"}]];
    const columns = [{field:'ReportingID',title:'报工ID',type:'string',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'OrderID',title:'订单',type:'string',width:90,hidden:true,align:'left'},
                       {field:'ReportingNumber',title:'报工单号',type:'string',link:true,width:125,align:'left'},
                       {field:'ReportedBy',title:'报工人',type:'string',bind:{ key:'用户列表',data:[]},width:90,require:true,align:'left'},
                       {field:'ReportingTime',title:'报工时间',type:'date',sort:true,width:90,align:'left'},
                       {field:'Total',title:'报工数量',type:'int',sort:true,width:100,align:'left'},
                       {field:'RejectedQuantity',title:'不合格数量',type:'int',width:90,align:'left'},
                       {field:'AcceptedQuantity',title:'合格数量',type:'int',width:80,align:'left'},
                       {field:'ReportHour',title:'工时(小时)',type:'decimal',sort:true,width:110,align:'left'},
                       {field:'AuditStatus',title:'审批状态',type:'int',bind:{ key:'audit',data:[]},width:90,align:'left'},
                       {field:'Auditor',title:'审批人',type:'string',width:80,hidden:true,align:'left'},
                       {field:'CreateID',title:'创建人ID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:90,hidden:true,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:150,readonly:true,align:'left'},
                       {field:'ModifyID',title:'修改人ID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Modifier',title:'修改人',type:'string',width:90,hidden:true,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:130,hidden:true,align:'left'}];
    const detail =  {
                    cnName: '报工明细',
                    table: 'MES_ProductionReportingDetail',
                    columns: [{field:'DetailID',title:'明细ID',type:'string',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'ReportingID',title:'报工ID',type:'string',width:90,hidden:true,align:'left'},
                       {field:'MaterialCode',title:'报工物料',type:'string',bind:{ key:'物料列表',data:[]},width:90,edit:{type:'select'},require:true,align:'left'},
                       {field:'MaterialName',title:'物料名称',type:'string',width:90,hidden:true,edit:{type:''},require:true,align:'left'},
                       {field:'MaterialSpecification',title:'物料规格',type:'string',width:90,edit:{type:''},require:true,align:'left'},
                       {field:'ReportHour',title:'工时(小时)',type:'decimal',width:90,edit:{type:'decimal'},align:'left'},
                       {field:'ReportedQuantity',title:'报工数量',type:'int',width:90,edit:{type:'number'},require:true,align:'left'},
                       {field:'AcceptedQuantity',title:'合格数量',type:'int',width:90,edit:{type:'number'},require:true,align:'left'},
                       {field:'RejectedQuantity',title:'不合格数量',type:'int',width:90,edit:{type:'number'},require:true,align:'left'},
                       {field:'CreateID',title:'创建人ID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:90,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:150,align:'left'},
                       {field:'ModifyID',title:'修改人ID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Modifier',title:'修改人',type:'string',width:90,hidden:true,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:90,hidden:true,align:'left'}],
                    sortName: 'CreateDate',
                    key: 'DetailID'
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