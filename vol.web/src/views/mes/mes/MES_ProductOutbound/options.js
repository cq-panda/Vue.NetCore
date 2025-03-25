// *Author：jxx
// *Contact：283591387@qq.com
// *代码由框架生成,任何更改都可能导致被代码生成器覆盖
export default function(){
    const table = {
        key: 'OutboundID',
        footer: "Foots",
        cnName: '产品出库',
        name: 'MES_ProductOutbound',
        url: "/MES_ProductOutbound/",
        sortName: "CreateDate"
    };
    const tableName = table.name;
    const tableCNName = table.cnName;
    const newTabEdit = false;
    const key = table.key;
    const editFormFields = {"DocumentNo":"","MaterialName":"","MaterialCode":"","SpecificationModel":"","LocationID":"","OutboundQuantity":"","OutboundUnit":"","OutboundDate":""};
    const editFormOptions = [[{"title":"单据号","field":"DocumentNo"},
                               {"title":"物料名称","required":true,"field":"MaterialName"}],
                              [{"dataKey":"物料列表","data":[],"title":"物料编号","required":true,"field":"MaterialCode","type":"select"},
                               {"title":"规格型号","field":"SpecificationModel"}],
                              [{"dataKey":"货位","data":[],"title":"货位","required":true,"field":"LocationID","type":"select"},
                               {"title":"出库数量","required":true,"field":"OutboundQuantity","type":"number"}],
                              [{"dataKey":"物料单位","data":[],"title":"出库单位","field":"OutboundUnit","type":"select"},
                               {"title":"出库日期","field":"OutboundDate","type":"date"}]];
    const searchFormFields = {"DocumentNo":"","MaterialName":"","MaterialCode":"","SpecificationModel":"","LocationID":"","OutboundQuantity":[null,null],"OutboundUnit":"","OutboundDate":"","Creator":"","CreateDate":""};
    const searchFormOptions = [[{"title":"单据号","field":"DocumentNo"},{"title":"物料名称","field":"MaterialName"},{"dataKey":"物料列表","data":[],"title":"物料编号","field":"MaterialCode"},{"title":"规格型号","field":"SpecificationModel"},{"dataKey":"货位","data":[],"title":"货位","field":"LocationID","type":"select"}],[{"title":"出库数量","field":"OutboundQuantity","type":"range"},{"dataKey":"物料单位","data":[],"title":"出库单位","field":"OutboundUnit"},{"title":"出库日期","field":"OutboundDate","type":"date"},{"title":"创建人","field":"Creator"},{"title":"创建时间","field":"CreateDate","type":"datetime"}]];
    const columns = [{field:'OutboundID',title:'出库ID',type:'string',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'DocumentNo',title:'单据号',type:'string',link:true,width:130,align:'left'},
                       {field:'MaterialName',title:'物料名称',type:'string',width:90,require:true,align:'left'},
                       {field:'MaterialCode',title:'物料编号',type:'string',bind:{ key:'物料列表',data:[]},width:90,require:true,align:'left'},
                       {field:'SpecificationModel',title:'规格型号',type:'string',width:90,align:'left'},
                       {field:'WarehouseID',title:'仓库',type:'string',width:90,hidden:true,align:'left'},
                       {field:'LocationID',title:'货位',type:'string',bind:{ key:'货位',data:[]},width:90,require:true,align:'left'},
                       {field:'OutboundQuantity',title:'出库数量',type:'int',width:70,require:true,align:'left'},
                       {field:'OutboundUnit',title:'出库单位',type:'string',bind:{ key:'物料单位',data:[]},width:70,align:'left'},
                       {field:'OutboundDate',title:'出库日期',type:'date',width:90,align:'left'},
                       {field:'OutboundOperator',title:'出库操作员',type:'string',width:90,hidden:true,align:'left'},
                       {field:'OutboundReason',title:'出库原因',type:'string',width:90,hidden:true,align:'left'},
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