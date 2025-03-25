// *Author：jxx
// *Contact：283591387@qq.com
// *代码由框架生成,任何更改都可能导致被代码生成器覆盖
export default function(){
    const table = {
        key: 'InspectionRecordID',
        footer: "Foots",
        cnName: '质检记录',
        name: 'MES_QualityInspectionRecord',
        newTabEdit: false,
        url: "/MES_QualityInspectionRecord/",
        sortName: "CreateDate"
    };
    const tableName = table.name;
    const tableCNName = table.cnName;
    const newTabEdit = false;
    const key = table.key;
    const editFormFields = {"InspectionNumber":"","Inspector":"","InspectionTime":"","InspectedQuantity":"","PassedQuantity":"","FailedQuantity":"","InspectionResult":"","Creator":"","CreateDate":"","DefectDescription":""};
    const editFormOptions = [[{"title":"检验单号","required":true,"field":"InspectionNumber"},
                               {"dataKey":"用户列表","data":[],"title":"检验员","required":true,"field":"Inspector","type":"select"},
                               {"title":"检验时间","required":true,"field":"InspectionTime","type":"datetime"}],
                              [{"title":"实际检验数量","required":true,"field":"InspectedQuantity","type":"number"},
                               {"title":"合格数量","required":true,"field":"PassedQuantity","type":"number"},
                               {"title":"不合格数量","required":true,"field":"FailedQuantity","type":"number"}],
                              [{"title":"检验结果","required":true,"field":"InspectionResult"},
                               {"title":"创建人","field":"Creator","disabled":true},
                               {"title":"创建时间","field":"CreateDate","disabled":true}],
                              [{"title":"缺陷描述","field":"DefectDescription","colSize":12,"type":"textarea"}]];
    const searchFormFields = {};
    const searchFormOptions = [];
    const columns = [{field:'InspectionRecordID',title:'检验记录ID',type:'string',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'InspectionPlanDetailID',title:'检验计划明细ID',type:'string',width:90,hidden:true,align:'left'},
                       {field:'InspectionNumber',title:'检验单号',type:'string',link:true,width:80,require:true,align:'left'},
                       {field:'Inspector',title:'检验员',type:'string',bind:{ key:'用户列表',data:[]},width:70,require:true,align:'left'},
                       {field:'InspectionTime',title:'检验时间',type:'datetime',sort:true,width:140,require:true,align:'left'},
                       {field:'InspectedQuantity',title:'实际检验数量',type:'int',width:90,require:true,align:'left'},
                       {field:'PassedQuantity',title:'合格数量',type:'int',sort:true,width:90,require:true,align:'left'},
                       {field:'FailedQuantity',title:'不合格数量',type:'int',sort:true,width:90,require:true,align:'left'},
                       {field:'InspectionResult',title:'检验结果',type:'string',width:90,require:true,align:'left'},
                       {field:'DefectDescription',title:'缺陷描述',type:'string',width:90,align:'left'},
                       {field:'CreateID',title:'创建人ID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:90,readonly:true,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:90,readonly:true,align:'left'},
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