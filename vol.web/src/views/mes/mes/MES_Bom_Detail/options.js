// *Author：jxx
// *Contact：283591387@qq.com
// *代码由框架生成,任何更改都可能导致被代码生成器覆盖
export default function(){
    const table = {
        key: 'DomDetailId',
        footer: "Foots",
        cnName: 'BOM明细',
        name: 'MES_Bom_Detail',
        newTabEdit: false,
        url: "/MES_Bom_Detail/",
        sortName: "CreateDate"
    };
    const tableName = table.name;
    const tableCNName = table.cnName;
    const newTabEdit = false;
    const key = table.key;
    const editFormFields = {"MaterialCode":"","MaterialName":"","Spec":"","UsageQty":"","ConsumeModel":"","Warehouse":"","SupplierCode":"","KitScale":""};
    const editFormOptions = [[{"title":"子件物料编码","field":"MaterialCode"}],
                              [{"title":"子件物料名称","field":"MaterialName"}],
                              [{"title":"规格型号","field":"Spec"}],
                              [{"title":"单台用量","required":true,"field":"UsageQty","type":"number"}],
                              [{"title":"消耗方式","required":true,"field":"ConsumeModel"}],
                              [{"title":"投料仓库","field":"Warehouse"}],
                              [{"dataKey":"供应商","data":[],"title":"供应商","field":"SupplierCode","type":"select"}],
                              [{"title":"齐套比例","field":"KitScale","type":"decimal"}]];
    const searchFormFields = {};
    const searchFormOptions = [];
    const columns = [{field:'DomDetailId',title:'ID',type:'string',width:110,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'BomId',title:'BomId',type:'string',width:110,hidden:true,align:'left'},
                       {field:'Sequence',title:'序号',type:'int',width:50,require:true,align:'left'},
                       {field:'MaterialCode',title:'子件物料编码',type:'string',link:true,width:130,align:'left'},
                       {field:'MaterialName',title:'子件物料名称',type:'string',width:130,align:'left'},
                       {field:'Spec',title:'规格型号',type:'string',width:80,align:'left'},
                       {field:'UsageQty',title:'单台用量',type:'decimal',width:90,require:true,align:'left'},
                       {field:'ConsumeModel',title:'消耗方式',type:'string',width:90,require:true,align:'left'},
                       {field:'Warehouse',title:'投料仓库',type:'string',width:90,align:'left'},
                       {field:'SupplierCode',title:'供应商',type:'string',bind:{ key:'供应商',data:[]},width:120,align:'left'},
                       {field:'KitScale',title:'齐套比例',type:'decimal',width:90,align:'left'},
                       {field:'Enable',title:'启用状态',type:'int',width:110,hidden:true,align:'left'},
                       {field:'CreateID',title:'创建人',type:'int',width:80,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:120,hidden:true,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:110,hidden:true,align:'left'},
                       {field:'ModifyID',title:'更新人',type:'int',width:80,hidden:true,align:'left'},
                       {field:'Modifier',title:'更新人名称',type:'string',width:100,hidden:true,align:'left'},
                       {field:'ModifyDate',title:'更新时间',type:'datetime',width:110,hidden:true,align:'left'}];
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