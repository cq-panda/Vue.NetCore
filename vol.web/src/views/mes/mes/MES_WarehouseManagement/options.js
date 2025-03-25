// *Author：jxx
// *Contact：283591387@qq.com
// *代码由框架生成,任何更改都可能导致被代码生成器覆盖
export default function(){
    const table = {
        key: 'WarehouseID',
        footer: "Foots",
        cnName: '仓库管理',
        name: 'MES_WarehouseManagement',
        url: "/MES_WarehouseManagement/",
        sortName: "CreateDate"
    };
    const tableName = table.name;
    const tableCNName = table.cnName;
    const key = table.key;
    const editFormFields = {"WarehouseCode":"","WarehouseName":"","WarehouseType":"","WarehouseArea":"","WarehouseAddress":"","WarehousePhone":"","WarehouseStatus":"","WarehouseCapacity":""};
    const editFormOptions = [[{"title":"仓库编码","required":true,"field":"WarehouseCode"},
                               {"title":"仓库名称","required":true,"field":"WarehouseName"},
                               {"dataKey":"仓库类型","data":[],"title":"仓库类型","field":"WarehouseType","type":"select"},
                               {"title":"仓库面积","required":true,"field":"WarehouseArea","type":"decimal"}],
                              [{"title":"仓库地址","field":"WarehouseAddress"},
                               {"title":"仓库电话","field":"WarehousePhone"},
                               {"dataKey":"enable","data":[],"title":"启用状态","field":"WarehouseStatus","type":"radio"},
                               {"title":"仓库容量","required":true,"field":"WarehouseCapacity","type":"number"}]];
    const searchFormFields = {"WarehouseCode":"","WarehouseName":"","WarehouseType":"","WarehouseAddress":"","WarehousePhone":""};
    const searchFormOptions = [[{"title":"仓库编码","field":"WarehouseCode","type":"like"},{"title":"仓库名称","field":"WarehouseName","type":"like"},{"dataKey":"仓库类型","data":[],"title":"仓库类型","field":"WarehouseType","type":"select"},{"title":"仓库地址","field":"WarehouseAddress"},{"title":"仓库电话","field":"WarehousePhone"}]];
    const columns = [{field:'WarehouseID',title:'仓库ID',type:'string',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'WarehouseCode',title:'仓库编码',type:'string',link:true,width:90,require:true,align:'left',sort:true},
                       {field:'WarehouseName',title:'仓库名称',type:'string',width:90,require:true,align:'left'},
                       {field:'WarehouseType',title:'仓库类型',type:'string',bind:{ key:'仓库类型',data:[]},width:90,align:'left'},
                       {field:'WarehouseArea',title:'仓库面积',type:'decimal',sort:true,width:90,require:true,align:'left'},
                       {field:'WarehouseAddress',title:'仓库地址',type:'string',width:90,align:'left'},
                       {field:'WarehousePhone',title:'仓库电话',type:'string',width:90,align:'left'},
                       {field:'WarehouseManager',title:'仓库管理员',type:'string',width:90,hidden:true,align:'left'},
                       {field:'WarehouseStatus',title:'启用状态',type:'string',bind:{ key:'enable',data:[]},width:60,align:'left'},
                       {field:'WarehouseCapacity',title:'仓库容量',type:'int',sort:true,width:90,require:true,align:'left'},
                       {field:'CreateID',title:'创建人ID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:70,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:130,align:'left',sort:true},
                       {field:'ModifyID',title:'修改人ID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Modifier',title:'修改人',type:'string',width:90,hidden:true,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:90,hidden:true,align:'left',sort:true}];
    const detail ={columns:[]};
    const details = [];

    return {
        table,
        key,
        tableName,
        tableCNName,
        editFormFields,
        editFormOptions,
        searchFormFields,
        searchFormOptions,
        columns,
        detail,
        details
    };
}