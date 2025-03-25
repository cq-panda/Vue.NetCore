// *Author：jxx
// *Contact：283591387@qq.com
// *代码由框架生成,任何更改都可能导致被代码生成器覆盖
export default function(){
    const table = {
        key: 'MaintenanceID',
        footer: "Foots",
        cnName: '设备保养',
        name: 'MES_EquipmentMaintenance',
        newTabEdit: false,
        url: "/MES_EquipmentMaintenance/",
        sortName: "CreateDate"
    };
    const tableName = table.name;
    const tableCNName = table.cnName;
    const newTabEdit = false;
    const key = table.key;
    const editFormFields = {"EquipmentID":"","MaintenanceDate":"","MaintenanceType":"","MaintenanceContent":"","MaintenancePerson":"","MaintenanceStatus":"","NextMaintenanceDate":"","MaintenanceCost":"","MaintenanceRemarks":""};
    const editFormOptions = [[{"dataKey":"设备列表","data":[],"title":"设备信息","field":"EquipmentID","type":"select"},
                               {"title":"保养日期","field":"MaintenanceDate"},
                               {"title":"保养类型","field":"MaintenanceType"}],
                              [{"title":"保养内容","field":"MaintenanceContent"},
                               {"title":"保养人员","field":"MaintenancePerson"},
                               {"title":"保养状态","field":"MaintenanceStatus"}],
                              [{"title":"下次保养日期","field":"NextMaintenanceDate"},
                               {"title":"保养成本","field":"MaintenanceCost","type":"decimal"},
                               {"title":"保养备注","field":"MaintenanceRemarks"}]];
    const searchFormFields = {"EquipmentID":"","MaintenanceDate":"","MaintenanceType":"","MaintenanceContent":"","MaintenancePerson":""};
    const searchFormOptions = [[{"dataKey":"设备列表","data":[],"title":"设备信息","field":"EquipmentID","type":"select"},{"title":"保养日期","field":"MaintenanceDate","type":"datetime"},{"title":"保养类型","field":"MaintenanceType"},{"title":"保养内容","field":"MaintenanceContent"},{"title":"保养人员","field":"MaintenancePerson"}]];
    const columns = [{field:'MaintenanceID',title:'保养ID',type:'string',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'EquipmentID',title:'设备信息',type:'string',bind:{ key:'设备列表',data:[]},width:90,align:'left'},
                       {field:'MaintenanceDate',title:'保养日期',type:'datetime',width:90,align:'left'},
                       {field:'MaintenanceType',title:'保养类型',type:'string',width:90,align:'left'},
                       {field:'MaintenanceContent',title:'保养内容',type:'string',link:true,width:90,align:'left'},
                       {field:'MaintenancePerson',title:'保养人员',type:'string',width:90,align:'left'},
                       {field:'MaintenanceStatus',title:'保养状态',type:'string',width:90,align:'left'},
                       {field:'NextMaintenanceDate',title:'下次保养日期',type:'datetime',width:90,align:'left'},
                       {field:'MaintenanceCost',title:'保养成本',type:'decimal',width:90,align:'left'},
                       {field:'MaintenanceRemarks',title:'保养备注',type:'string',width:90,align:'left'},
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