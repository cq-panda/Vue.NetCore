// *Author：jxx
// *Contact：283591387@qq.com
// *代码由框架生成,任何更改都可能导致被代码生成器覆盖
export default function(){
    const table = {
        key: 'FaultRecordID',
        footer: "Foots",
        cnName: '设备故障',
        name: 'MES_EquipmentFaultRecord',
        newTabEdit: false,
        url: "/MES_EquipmentFaultRecord/",
        sortName: "CreateDate"
    };
    const tableName = table.name;
    const tableCNName = table.cnName;
    const newTabEdit = false;
    const key = table.key;
    const editFormFields = {"EquipmentID":"","FaultDate":"","FaultType":"","FaultDescription":"","FaultImpact":"","FaultReportedBy":"","FaultStatus":"","TroubleshootingStartTime":"","TroubleshootingEndTime":""};
    const editFormOptions = [[{"dataKey":"设备列表","data":[],"title":"设备名称","field":"EquipmentID","type":"select"},
                               {"title":"故障日期","field":"FaultDate","type":"datetime"},
                               {"title":"故障类型","field":"FaultType"}],
                              [{"title":"故障描述","field":"FaultDescription"},
                               {"title":"故障影响","field":"FaultImpact"},
                               {"title":"故障报告人","field":"FaultReportedBy"}],
                              [{"title":"故障状态","field":"FaultStatus"},
                               {"title":"排查开始时间","field":"TroubleshootingStartTime","type":"datetime"},
                               {"title":"排查结束时间","field":"TroubleshootingEndTime","type":"datetime"}]];
    const searchFormFields = {"EquipmentID":"","FaultDate":"","FaultType":"","FaultDescription":"","FaultReportedBy":""};
    const searchFormOptions = [[{"dataKey":"设备列表","data":[],"title":"设备名称","field":"EquipmentID","type":"select"},{"title":"故障日期","field":"FaultDate","type":"datetime"},{"title":"故障类型","field":"FaultType"},{"title":"故障描述","field":"FaultDescription"},{"title":"故障报告人","field":"FaultReportedBy"}]];
    const columns = [{field:'FaultRecordID',title:'故障记录ID',type:'string',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'EquipmentID',title:'设备名称',type:'string',bind:{ key:'设备列表',data:[]},width:90,align:'left'},
                       {field:'FaultDate',title:'故障日期',type:'datetime',width:90,align:'left'},
                       {field:'FaultType',title:'故障类型',type:'string',width:90,align:'left'},
                       {field:'FaultDescription',title:'故障描述',type:'string',link:true,width:90,align:'left'},
                       {field:'FaultImpact',title:'故障影响',type:'string',width:90,align:'left'},
                       {field:'FaultReportedBy',title:'故障报告人',type:'string',width:90,align:'left'},
                       {field:'FaultStatus',title:'故障状态',type:'string',width:90,align:'left'},
                       {field:'TroubleshootingStartTime',title:'排查开始时间',type:'datetime',width:90,hidden:true,align:'left'},
                       {field:'TroubleshootingEndTime',title:'排查结束时间',type:'datetime',width:90,align:'left'},
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