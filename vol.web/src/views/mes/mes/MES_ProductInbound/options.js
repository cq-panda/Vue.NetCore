// *Author：jxx
// *Contact：283591387@qq.com
// *代码由框架生成,任何更改都可能导致被代码生成器覆盖
export default function(){
    const table = {
        key: 'InboundID',
        footer: "Foots",
        cnName: '产品入库',
        name: 'MES_ProductInbound',
        url: "/MES_ProductInbound/",
        sortName: "CreateDate"
    };
    const tableName = table.name;
    const tableCNName = table.cnName;
    const newTabEdit = false;
    const key = table.key;
    const editFormFields = {"DocumentNo":"","InboundQuantity":"","MaterialName":"","MaterialCode":"","SpecificationModel":"","LocationID":"","InboundUnit":"","InboundDate":""};
    const editFormOptions = [[{"title":"单据号","field":"DocumentNo"},
                               {"title":"入库数量","required":true,"field":"InboundQuantity","type":"number"}],
                              [{"title":"物料名称","field":"MaterialName"},
                               {"dataKey":"物料列表","data":[],"title":"物料编号","field":"MaterialCode","type":"select"}],
                              [{"title":"规格型号","field":"SpecificationModel"},
                               {"dataKey":"仓库","data":[],"title":"货位","field":"LocationID","type":"select"}],
                              [{"dataKey":"物料单位","data":[],"title":"入库单位","field":"InboundUnit","type":"select"},
                               {"title":"入库日期","field":"InboundDate"}]];
    const searchFormFields = {"DocumentNo":"","MaterialName":"","MaterialCode":"","WarehouseID":"","LocationID":""};
    const searchFormOptions = [[{"title":"单据号","field":"DocumentNo"},{"title":"物料名称","field":"MaterialName"},{"dataKey":"物料列表","data":[],"title":"物料编号","field":"MaterialCode"},{"dataKey":"货位","data":[],"title":"仓库","field":"WarehouseID","type":"select"},{"dataKey":"仓库","data":[],"title":"货位","field":"LocationID","type":"select"}]];
    const columns = [{field:'InboundID',title:'入库ID',type:'string',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'DocumentNo',title:'单据号',type:'string',link:true,width:120,align:'left',sort:true},
                       {field:'MaterialName',title:'物料名称',type:'string',width:90,align:'left'},
                       {field:'MaterialCode',title:'物料编号',type:'string',bind:{ key:'物料列表',data:[]},width:90,align:'left'},
                       {field:'SpecificationModel',title:'规格型号',type:'string',width:90,align:'left'},
                       {field:'WarehouseID',title:'仓库',type:'string',bind:{ key:'货位',data:[]},width:90,hidden:true,align:'left'},
                       {field:'LocationID',title:'货位',type:'string',bind:{ key:'仓库',data:[]},width:90,align:'left'},
                       {field:'InboundQuantity',title:'入库数量',type:'int',width:90,require:true,align:'left'},
                       {field:'InboundUnit',title:'入库单位',type:'string',bind:{ key:'物料单位',data:[]},width:90,align:'left'},
                       {field:'InboundDate',title:'入库日期',type:'datetime',width:90,align:'left',sort:true},
                       {field:'InboundOperator',title:'入库操作员',type:'string',width:90,hidden:true,align:'left'},
                       {field:'InboundReason',title:'入库原因',type:'string',width:90,hidden:true,align:'left'},
                       {field:'CreateID',title:'创建人ID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:90,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:90,align:'left',sort:true},
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