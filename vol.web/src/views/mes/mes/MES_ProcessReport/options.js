// *Author：jxx
// *Contact：283591387@qq.com
// *代码由框架生成,任何更改都可能导致被代码生成器覆盖
export default function(){
    const table = {
        key: 'ReportID',
        footer: "Foots",
        cnName: '工序统计',
        name: 'MES_ProcessReport',
        newTabEdit: false,
        url: "/MES_ProcessReport/",
        sortName: "CreateDate"
    };
    const tableName = table.name;
    const tableCNName = table.cnName;
    const newTabEdit = false;
    const key = table.key;
    const editFormFields = {};
    const editFormOptions = [];
    const searchFormFields = {"ProcessID":"","ReportDate":"","CompletedQuantity":[null,null],"DefectiveQuantity":[null,null],"ReportedBy":""};
    const searchFormOptions = [[{"dataKey":"工序","data":[],"title":"工序名称","field":"ProcessID","type":"select"},{"title":"统计日期","field":"ReportDate"},{"title":"完成数量","field":"CompletedQuantity","type":"range"},{"title":"不良数量","field":"DefectiveQuantity","type":"range"},{"title":"统计人","field":"ReportedBy"}]];
    const columns = [{field:'ReportID',title:'ID',type:'string',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'ProcessID',title:'工序名称',type:'string',bind:{ key:'工序',data:[]},width:90,align:'left'},
                       {field:'ReportDate',title:'统计日期',type:'datetime',width:130,require:true,align:'left'},
                       {field:'CompletedQuantity',title:'完成数量',type:'int',width:90,require:true,align:'left'},
                       {field:'DefectiveQuantity',title:'不良数量',type:'int',width:90,require:true,align:'left'},
                       {field:'ReportedBy',title:'统计人',type:'string',width:90,hidden:true,align:'left'},
                       {field:'ReportStatus',title:'汇报状态',type:'string',width:90,hidden:true,align:'left'},
                       {field:'ReportRemarks',title:'备注',type:'string',width:130,align:'left'},
                       {field:'StartTime',title:'工序开始时间',type:'datetime',width:90,align:'left'},
                       {field:'EndTime',title:'工序结束时间',type:'datetime',width:90,align:'left'},
                       {field:'CreateID',title:'创建人ID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:90,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:130,align:'left'},
                       {field:'ModifyID',title:'修改人ID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Modifier',title:'修改人',type:'string',width:90,hidden:true,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:130,hidden:true,align:'left'}];
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