// *Author：jxx
// *Contact：283591387@qq.com
// *代码由框架生成,任何更改都可能导致被代码生成器覆盖
export default function(){
    const table = {
        key: 'DefectiveID',
        footer: "Foots",
        cnName: '生产不良记录',
        name: 'MES_DefectiveProductRecord',
        newTabEdit: false,
        url: "/MES_DefectiveProductRecord/",
        sortName: "CreateDate"
    };
    const tableName = table.name;
    const tableCNName = table.cnName;
    const newTabEdit = false;
    const key = table.key;
    const editFormFields = {};
    const editFormOptions = [];
    const searchFormFields = {"MaterialCode":"","MaterialName":"","MaterialSpecification":"","DefectiveQuantity":[null,null],"CreateDate":""};
    const searchFormOptions = [[{"title":"物料编号","field":"MaterialCode","type":"like"},{"title":"物料名称","field":"MaterialName","type":"like"},{"title":"物料规格","field":"MaterialSpecification"},{"title":"不良品数量","field":"DefectiveQuantity","type":"range"},{"title":"创建时间","field":"CreateDate","type":"datetime"}]];
    const columns = [{field:'DefectiveID',title:'不良品ID',type:'string',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'ReportingID',title:'报工ID',type:'string',width:90,hidden:true,align:'left'},
                       {field:'MaterialCode',title:'物料编号',type:'string',width:90,require:true,align:'left'},
                       {field:'MaterialName',title:'物料名称',type:'string',width:90,require:true,align:'left'},
                       {field:'MaterialSpecification',title:'物料规格',type:'string',width:90,require:true,align:'left'},
                       {field:'DefectiveQuantity',title:'不良品数量',type:'int',width:90,require:true,align:'left'},
                       {field:'DefectType',title:'缺陷类型',type:'string',width:90,require:true,align:'left'},
                       {field:'DefectReason',title:'缺陷原因',type:'string',width:90,require:true,align:'left'},
                       {field:'DisposalMethod',title:'处理方式',type:'string',width:90,require:true,align:'left'},
                       {field:'DisposalStatus',title:'处理状态',type:'string',width:90,require:true,align:'left'},
                       {field:'CreateID',title:'创建人ID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:90,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:140,align:'left'},
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