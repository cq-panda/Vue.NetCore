// *Author：jxx
// *Contact：283591387@qq.com
// *代码由框架生成,任何更改都可能导致被代码生成器覆盖
export default function(){
    const table = {
        key: 'LocationID',
        footer: "Foots",
        cnName: '货位管理',
        name: 'MES_LocationManagement',
        newTabEdit: false,
        url: "/MES_LocationManagement/",
        sortName: "CreateDate"
    };
    const tableName = table.name;
    const tableCNName = table.cnName;
    const newTabEdit = false;
    const key = table.key;
    const editFormFields = {"LocationCode":"","LocationName":"","WarehouseID":"","LocationType":"","LocationCapacity":"","LocationStatus":"","LocationRow":"","LocationColumn":"","LocationFloor":""};
    const editFormOptions = [[{"title":"货位编码","required":true,"field":"LocationCode"},
                               {"title":"货位名称","required":true,"field":"LocationName"},
                               {"dataKey":"仓库","data":[],"title":"所属仓库","field":"WarehouseID","type":"select"}],
                              [{"title":"货位类型","field":"LocationType"},
                               {"title":"货位容量","required":true,"field":"LocationCapacity","type":"number"},
                               {"title":"货位状态","field":"LocationStatus"}],
                              [{"title":"货位行号","required":true,"field":"LocationRow","type":"number"},
                               {"title":"货位列号","required":true,"field":"LocationColumn","type":"number"},
                               {"title":"货位层数","required":true,"field":"LocationFloor","type":"number"}]];
    const searchFormFields = {"LocationCode":"","LocationName":"","WarehouseID":"","LocationType":"","LocationCapacity":""};
    const searchFormOptions = [[{"title":"货位编码","field":"LocationCode"},{"title":"货位名称","field":"LocationName"},{"dataKey":"仓库","data":[],"title":"所属仓库","field":"WarehouseID"},{"title":"货位类型","field":"LocationType"},{"title":"货位容量","field":"LocationCapacity","type":"number"}]];
    const columns = [{field:'LocationID',title:'货位ID',type:'string',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'LocationCode',title:'货位编码',type:'string',link:true,width:90,require:true,align:'left'},
                       {field:'LocationName',title:'货位名称',type:'string',width:90,require:true,align:'left'},
                       {field:'WarehouseID',title:'所属仓库',type:'string',bind:{ key:'仓库',data:[]},width:90,align:'left'},
                       {field:'LocationType',title:'货位类型',type:'string',width:90,align:'left'},
                       {field:'LocationCapacity',title:'货位容量',type:'int',width:90,require:true,align:'left'},
                       {field:'LocationStatus',title:'货位状态',type:'string',width:90,align:'left'},
                       {field:'LocationRow',title:'货位行号',type:'int',width:90,require:true,align:'left'},
                       {field:'LocationColumn',title:'货位列号',type:'int',width:90,require:true,align:'left'},
                       {field:'LocationFloor',title:'货位层数',type:'int',width:90,require:true,align:'left'},
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