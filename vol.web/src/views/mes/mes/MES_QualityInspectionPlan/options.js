// *Author：jxx
// *Contact：283591387@qq.com
// *代码由框架生成,任何更改都可能导致被代码生成器覆盖
export default function(){
    const table = {
        key: 'InspectionPlanID',
        footer: "Foots",
        cnName: '质量检验',
        name: 'MES_QualityInspectionPlan',
        newTabEdit: false,
        url: "/MES_QualityInspectionPlan/",
        sortName: "CreateDate"
    };
    const tableName = table.name;
    const tableCNName = table.cnName;
    const newTabEdit = false;
    const key = table.key;
    const editFormFields = {"InspectionPlanNumber":"","PlanStartTime":"","PlanEndTime":"","ResponsiblePerson":""};
    const editFormOptions = [[{"title":"检验单号","required":true,"field":"InspectionPlanNumber"},
                               {"title":"检验开始时间","required":true,"field":"PlanStartTime","type":"datetime"},
                               {"title":"检验结束时间","required":true,"field":"PlanEndTime","type":"datetime"},
                               {"dataKey":"用户列表","data":[],"title":"检验人","required":true,"field":"ResponsiblePerson","type":"select"}]];
    const searchFormFields = {"InspectionPlanNumber":"","PlanStartTime":"","PlanEndTime":"","ResponsiblePerson":""};
    const searchFormOptions = [[{"title":"检验单号","field":"InspectionPlanNumber"},{"title":"检验开始时间","field":"PlanStartTime","type":"datetime"},{"title":"检验结束时间","field":"PlanEndTime","type":"datetime"},{"dataKey":"用户列表","data":[],"title":"检验人","field":"ResponsiblePerson"}]];
    const columns = [{field:'InspectionPlanID',title:'检验计划ID',type:'string',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'InspectionPlanNumber',title:'检验单号',type:'string',link:true,width:130,require:true,align:'left'},
                       {field:'OrderID',title:'订单ID',type:'string',width:90,hidden:true,align:'left'},
                       {field:'PlanStartTime',title:'检验开始时间',type:'datetime',width:140,require:true,align:'left'},
                       {field:'PlanEndTime',title:'检验结束时间',type:'datetime',width:140,require:true,align:'left'},
                       {field:'ResponsiblePerson',title:'检验人',type:'string',bind:{ key:'用户列表',data:[]},width:90,require:true,align:'left'},
                       {field:'PlanStatus',title:'计划状态',type:'string',width:90,hidden:true,align:'left'},
                       {field:'CreateID',title:'创建人ID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:90,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:140,align:'left'},
                       {field:'ModifyID',title:'修改人ID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Modifier',title:'修改人',type:'string',width:90,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:140,align:'left'}];
    const detail =  {
                    cnName: '质检明细',
                    table: 'MES_QualityInspectionPlanDetail',
                    columns: [{field:'InspectionPlanDetailID',title:'明细ID',type:'string',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'InspectionPlanID',title:'检验id',type:'string',width:90,hidden:true,align:'left'},
                       {field:'MaterialCode',title:'检验物料',type:'string',bind:{ key:'物料列表',data:[]},width:90,edit:{type:'select'},require:true,align:'left'},
                       {field:'MaterialName',title:'物料名称',type:'string',width:90,hidden:true,edit:{type:''},align:'left'},
                       {field:'MaterialSpecification',title:'物料规格',type:'string',width:90,edit:{type:''},require:true,align:'left'},
                       {field:'QuantityToInspect',title:'检验数量',type:'int',width:90,edit:{type:''},require:true,align:'left'},
                       {field:'InspectionMethod',title:'检验方法',type:'string',width:90,edit:{type:''},require:true,align:'left'},
                       {field:'InspectionStandard',title:'检验标准',type:'string',width:90,edit:{type:''},require:true,align:'left'},
                       {field:'CreateID',title:'创建人ID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:90,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:90,align:'left'},
                       {field:'ModifyID',title:'修改人ID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Modifier',title:'修改人',type:'string',width:90,hidden:true,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:90,hidden:true,align:'left'}],
                    sortName: 'CreateDate',
                    key: 'InspectionPlanDetailID'
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