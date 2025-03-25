// *Author：jxx
// *Contact：283591387@qq.com
// *代码由框架生成,任何更改都可能导致被代码生成器覆盖
export default function(){
    const table = {
        key: 'InventoryID',
        footer: "Foots",
        cnName: '库存管理',
        name: 'MES_InventoryManagement',
        newTabEdit: false,
        url: "/MES_InventoryManagement/",
        sortName: "CreateDate"
    };
    const tableName = table.name;
    const tableCNName = table.cnName;
    const newTabEdit = false;
    const key = table.key;
    const editFormFields = {"MaterialName":"","MaterialCode":"","SpecificationModel":"","WarehouseID":"","LocationID":"","InventoryQuantity":"","InventoryUnit":""};
    const editFormOptions = [[{"title":"物料名称","field":"MaterialName"},
                               {"title":"物料编号","field":"MaterialCode"},
                               {"title":"规格型号","field":"SpecificationModel"}],
                              [{"dataKey":"货位","data":[],"title":"仓库","field":"WarehouseID","type":"select"},
                               {"dataKey":"仓库","data":[],"title":"货位","field":"LocationID","type":"select"},
                               {"title":"库存数量","required":true,"field":"InventoryQuantity","type":"number"},
                               {"dataKey":"物料单位","data":[],"title":"单位","field":"InventoryUnit","type":"select"}]];
    const searchFormFields = {"MaterialName":"","MaterialCode":"","WarehouseID":"","LocationID":"","InboundDate":""};
    const searchFormOptions = [[{"title":"物料名称","field":"MaterialName"},{"title":"物料编号","field":"MaterialCode"},{"dataKey":"货位","data":[],"title":"仓库","field":"WarehouseID","type":"select"},{"dataKey":"仓库","data":[],"title":"货位","field":"LocationID","type":"select"},{"title":"入库日期","field":"InboundDate","type":"datetime"}]];
    const columns = [{field:'InventoryID',title:'库存ID',type:'string',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'DocumentNo',title:'单据号',type:'string',width:90,hidden:true,align:'left'},
                       {field:'MaterialName',title:'物料名称',type:'string',width:90,align:'left'},
                       {field:'MaterialCode',title:'物料编号',type:'string',width:90,align:'left'},
                       {field:'SpecificationModel',title:'规格型号',type:'string',width:90,align:'left'},
                       {field:'WarehouseID',title:'仓库',type:'string',bind:{ key:'货位',data:[]},width:90,align:'left'},
                       {field:'LocationID',title:'货位',type:'string',bind:{ key:'仓库',data:[]},width:90,align:'left'},
                       {field:'InventoryQuantity',title:'库存数量',type:'int',sort:true,width:90,require:true,align:'left'},
                       {field:'InventoryUnit',title:'单位',type:'string',bind:{ key:'物料单位',data:[]},width:90,align:'left'},
                       {field:'InventoryCost',title:'库存成本',type:'decimal',width:90,hidden:true,require:true,align:'left'},
                       {field:'InventoryStatus',title:'库存状态',type:'string',width:90,align:'left'},
                       {field:'InboundDate',title:'入库日期',type:'datetime',width:90,align:'left'},
                       {field:'CreateID',title:'创建人ID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:90,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:90,align:'left'},
                       {field:'Modifier',title:'修改人',type:'string',width:90,hidden:true,align:'left'},
                       {field:'ModifyID',title:'修改人ID',type:'int',width:90,hidden:true,align:'left'},
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