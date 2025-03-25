// *Author：jxx
// *Contact：283591387@qq.com
// *代码由框架生成,任何更改都可能导致被代码生成器覆盖
export default function(){
    const table = {
        key: 'PlanDetailID',
        footer: "Foots",
        cnName: '订单明细',
        name: 'MES_ProductionPlanDetail',
        newTabEdit: false,
        url: "/MES_ProductionPlanDetail/",
        sortName: "CreateDate"
    };
    const tableName = table.name;
    const tableCNName = table.cnName;
    const newTabEdit = false;
    const key = table.key;
    const editFormFields = {"MaterialCode":"","MaterialName":"","MaterialSpecification":"","Unit":"","PlanQuantity":""};
    const editFormOptions = [[{"dataKey":"物料列表","data":[],"title":"物料编码","required":true,"field":"MaterialCode","type":"select"},
                               {"title":"物料名称","required":true,"field":"MaterialName","disabled":true},
                               {"title":"物料规格","field":"MaterialSpecification","disabled":true},
                               {"dataKey":"物料单位","data":[],"title":"单位","field":"Unit","disabled":true,"type":"select"},
                               {"title":"订单数量","field":"PlanQuantity","type":"number"}]];
    const searchFormFields = {};
    const searchFormOptions = [];
    const columns = [{field:'PlanDetailID',title:'计划明细ID',type:'string',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'OrderID',title:'订单ID',type:'string',width:90,hidden:true,align:'left'},
                       {field:'MaterialCode',title:'物料编码',type:'string',bind:{ key:'物料列表',data:[]},width:100,require:true,align:'left'},
                       {field:'MaterialName',title:'物料名称',type:'string',width:100,readonly:true,require:true,align:'left'},
                       {field:'MaterialSpecification',title:'物料规格',type:'string',width:130,readonly:true,align:'left'},
                       {field:'Unit',title:'单位',type:'string',bind:{ key:'物料单位',data:[]},width:70,readonly:true,align:'left'},
                       {field:'PlanQuantity',title:'订单数量',type:'int',width:80,align:'left'},
                       {field:'PlannedStartTime',title:'计划开始时间',type:'datetime',width:90,hidden:true,align:'left'},
                       {field:'PlannedEndTime',title:'计划结束时间',type:'datetime',width:90,hidden:true,align:'left'},
                       {field:'PlanStatus',title:'计划状态',type:'string',width:90,hidden:true,align:'left'},
                       {field:'CreateID',title:'创建人ID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:90,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:90,align:'left'},
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