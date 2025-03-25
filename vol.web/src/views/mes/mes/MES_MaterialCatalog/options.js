// *Author：jxx
// *Contact：283591387@qq.com
// *代码由框架生成,任何更改都可能导致被代码生成器覆盖
export default function(){
    const table = {
        key: 'CatalogID',
        footer: "Foots",
        cnName: '物料分类',
        name: 'MES_MaterialCatalog',
        newTabEdit: false,
        url: "/MES_MaterialCatalog/",
        sortName: "CreateDate"
    };
    const tableName = table.name;
    const tableCNName = table.cnName;
    const newTabEdit = false;
    const key = table.key;
    const editFormFields = {"CatalogCode":"","CatalogName":"","ParentId":[],"Enable":"","Remarks":""};
    const editFormOptions = [[{"title":"分类编码","required":true,"field":"CatalogCode"}],
                              [{"title":"分类名称","required":true,"field":"CatalogName"}],
                              [{"dataKey":"物料分类","data":[],"title":"上级分类","field":"ParentId","type":"cascader"}],
                              [{"dataKey":"enable","data":[],"title":"启用状态","field":"Enable","type":"radio"}],
                              [{"title":"备注信息","field":"Remarks","type":"textarea"}]];
    const searchFormFields = {"CatalogName":"","CatalogCode":"","Enable":"","Creator":"","CreateDate":""};
    const searchFormOptions = [[{"title":"分类名称","field":"CatalogName","type":"like"},{"title":"分类编码","field":"CatalogCode","type":"like"},{"dataKey":"enable","data":[],"title":"启用状态","field":"Enable","type":"select"},{"title":"创建人","field":"Creator"},{"title":"创建时间","field":"CreateDate","type":"datetime"}]];
    const columns = [{field:'CatalogID',title:'分类ID',type:'string',width:110,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'CatalogName',title:'分类名称',type:'string',width:120,require:true,align:'left'},
                       {field:'CatalogCode',title:'分类编码',type:'string',link:true,width:120,require:true,align:'left'},
                       {field:'CatalogType',title:'分类类型',type:'string',width:120,hidden:true,align:'left'},
                       {field:'ParentId',title:'上级分类',type:'string',bind:{ key:'物料分类',data:[]},width:110,hidden:true,align:'left'},
                       {field:'Enable',title:'启用状态',type:'int',bind:{ key:'enable',data:[]},width:110,align:'left'},
                       {field:'Remarks',title:'备注信息',type:'string',width:120,align:'left'},
                       {field:'CreateID',title:'创建人ID',type:'int',width:80,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:100,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:140,align:'left'},
                       {field:'ModifyID',title:'修改人ID',type:'int',width:80,hidden:true,align:'left'},
                       {field:'Modifier',title:'修改人',type:'string',width:100,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:140,align:'left'}];
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