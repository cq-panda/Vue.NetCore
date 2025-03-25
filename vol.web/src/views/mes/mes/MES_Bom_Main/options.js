// *Author：jxx
// *Contact：283591387@qq.com
// *代码由框架生成,任何更改都可能导致被代码生成器覆盖
export default function(){
    const table = {
        key: 'BomId',
        footer: "Foots",
        cnName: '制造BOM',
        name: 'MES_Bom_Main',
        newTabEdit: false,
        url: "/MES_Bom_Main/",
        sortName: "CreateDate"
    };
    const tableName = table.name;
    const tableCNName = table.cnName;
    const newTabEdit = false;
    const key = table.key;
    const editFormFields = {"Code":"","MaterialCode":"","MaterialName":"","Spec":"","Purpose":"","Edition":"","EffectiveDate":"","InvalidDate":""};
    const editFormOptions = [[{"title":"BOM编号","required":true,"field":"Code"},
                               {"title":"母件物料编码","field":"MaterialCode"},
                               {"title":"母件物料名称","field":"MaterialName"},
                               {"title":"规格型号","field":"Spec"}],
                              [{"title":"用途","field":"Purpose"},
                               {"title":"版本","field":"Edition"},
                               {"title":"有效日期","required":true,"field":"EffectiveDate","type":"date"},
                               {"title":"失效日期","required":true,"field":"InvalidDate","type":"date"}]];
    const searchFormFields = {"Code":"","MaterialCode":"","MaterialName":"","Purpose":"","EffectiveDate":""};
    const searchFormOptions = [[{"title":"BOM编号","field":"Code","type":"like"},{"title":"母件物料编码","field":"MaterialCode","type":"like"},{"title":"母件物料名称","field":"MaterialName","type":"like"},{"title":"用途","field":"Purpose"},{"title":"有效日期","field":"EffectiveDate","type":"date"}]];
    const columns = [{field:'BomId',title:'ID',type:'string',width:110,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'Code',title:'BOM编号',type:'string',link:true,sort:true,width:110,require:true,align:'left'},
                       {field:'MaterialCode',title:'母件物料编码',type:'string',width:120,align:'left'},
                       {field:'MaterialName',title:'母件物料名称',type:'string',width:130,align:'left'},
                       {field:'Spec',title:'规格型号',type:'string',width:70,align:'left'},
                       {field:'Purpose',title:'用途',type:'string',width:70,align:'left'},
                       {field:'Edition',title:'版本',type:'string',width:70,align:'left'},
                       {field:'EffectiveDate',title:'有效日期',type:'date',sort:true,width:90,require:true,align:'left'},
                       {field:'InvalidDate',title:'失效日期',type:'date',sort:true,width:90,require:true,align:'left'},
                       {field:'Enable',title:'启用状态',type:'int',width:110,hidden:true,require:true,align:'left'},
                       {field:'CreateID',title:'创建人',type:'int',width:70,hidden:true,require:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:100,require:true,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:110,hidden:true,require:true,align:'left'},
                       {field:'ModifyID',title:'更新人',type:'int',width:80,hidden:true,align:'left'},
                       {field:'Modifier',title:'更新人名称',type:'string',width:100,hidden:true,align:'left'},
                       {field:'ModifyDate',title:'更新时间',type:'datetime',width:110,hidden:true,align:'left'}];
    const detail =  {
                    cnName: 'BOM明细',
                    table: 'MES_Bom_Detail',
                    columns: [{field:'DomDetailId',title:'ID',type:'string',width:110,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'BomId',title:'BomId',type:'string',width:110,hidden:true,align:'left'},
                       {field:'Sequence',title:'序号',type:'int',width:70,require:true,align:'left'},
                       {field:'MaterialCode',title:'子件物料编码',type:'string',width:130,edit:{type:''},align:'left'},
                       {field:'MaterialName',title:'子件物料名称',type:'string',width:130,edit:{type:''},align:'left'},
                       {field:'Spec',title:'规格型号',type:'string',width:80,edit:{type:''},align:'left'},
                       {field:'UsageQty',title:'单台用量',type:'decimal',width:90,edit:{type:'number'},require:true,align:'left'},
                       {field:'ConsumeModel',title:'消耗方式',type:'string',width:90,edit:{type:''},require:true,align:'left'},
                       {field:'Warehouse',title:'投料仓库',type:'string',width:90,edit:{type:''},align:'left'},
                       {field:'SupplierCode',title:'供应商',type:'string',bind:{ key:'供应商',data:[]},width:120,edit:{type:'select'},align:'left'},
                       {field:'KitScale',title:'齐套比例',type:'decimal',width:90,edit:{type:''},align:'left'},
                       {field:'Enable',title:'启用状态',type:'int',width:110,hidden:true,align:'left'},
                       {field:'CreateID',title:'创建人',type:'int',width:80,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:120,hidden:true,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:110,hidden:true,align:'left'},
                       {field:'ModifyID',title:'更新人',type:'int',width:80,hidden:true,align:'left'},
                       {field:'Modifier',title:'更新人名称',type:'string',width:100,hidden:true,align:'left'},
                       {field:'ModifyDate',title:'更新时间',type:'datetime',width:110,hidden:true,align:'left'}],
                    sortName: 'CreateDate',
                    key: 'DomDetailId'
                                            };
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