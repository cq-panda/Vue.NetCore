// *Author：jxx
// *Contact：283591387@qq.com
// *代码由框架生成,任何更改都可能导致被代码生成器覆盖
export default function(){
    const table = {
        key: 'RepairID',
        footer: "Foots",
        cnName: '设备维修',
        name: 'MES_EquipmentRepair',
        newTabEdit: false,
        url: "/MES_EquipmentRepair/",
        sortName: "CreateDate"
    };
    const tableName = table.name;
    const tableCNName = table.cnName;
    const newTabEdit = false;
    const key = table.key;
    const editFormFields = {"EquipmentID":"","RepairDate":"","RepairReason":"","RepairContent":"","RepairPerson":"","RepairCost":"","RepairStatus":"","RepairStartTime":"","RepairEndTime":""};
    const editFormOptions = [[{"dataKey":"设备列表","data":[],"title":"设备名称","field":"EquipmentID","type":"select"},
                               {"title":"维修日期","field":"RepairDate","type":"datetime"},
                               {"title":"维修原因","field":"RepairReason"}],
                              [{"title":"维修内容","field":"RepairContent"},
                               {"title":"维修人员","field":"RepairPerson"},
                               {"title":"维修成本","field":"RepairCost","type":"decimal"}],
                              [{"title":"维修状态","field":"RepairStatus"},
                               {"title":"维修开始时间","field":"RepairStartTime","type":"datetime"},
                               {"title":"维修结束时间","field":"RepairEndTime","type":"datetime"}]];
    const searchFormFields = {"EquipmentID":"","RepairDate":"","RepairReason":"","RepairContent":"","RepairPerson":""};
    const searchFormOptions = [[{"dataKey":"设备列表","data":[],"title":"设备名称","field":"EquipmentID","type":"select"},{"title":"维修日期","field":"RepairDate","type":"datetime"},{"title":"维修原因","field":"RepairReason"},{"title":"维修内容","field":"RepairContent"},{"title":"维修人员","field":"RepairPerson"}]];
    const columns = [{field:'RepairID',title:'维修ID',type:'string',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'EquipmentID',title:'设备名称',type:'string',bind:{ key:'设备列表',data:[]},width:90,align:'left'},
                       {field:'RepairDate',title:'维修日期',type:'datetime',width:120,align:'left'},
                       {field:'RepairReason',title:'维修原因',type:'string',link:true,width:90,align:'left'},
                       {field:'RepairContent',title:'维修内容',type:'string',width:90,align:'left'},
                       {field:'RepairPerson',title:'维修人员',type:'string',width:70,align:'left'},
                       {field:'RepairCost',title:'维修成本',type:'decimal',width:70,align:'left'},
                       {field:'RepairStatus',title:'维修状态',type:'string',width:70,align:'left'},
                       {field:'RepairStartTime',title:'维修开始时间',type:'datetime',width:90,hidden:true,align:'left'},
                       {field:'RepairEndTime',title:'维修结束时间',type:'datetime',width:90,align:'left'},
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