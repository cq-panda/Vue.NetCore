// *Author：jxx
// *Contact：283591387@qq.com
// *代码由框架生成,任何更改都可能导致被代码生成器覆盖
export default function(){
    const table = {
        key: 'MaterialID',
        footer: "Foots",
        cnName: '物料管理',
        name: 'MES_Material',
        newTabEdit: false,
        url: "/MES_Material/",
        sortName: "CreateDate"
    };
    const tableName = table.name;
    const tableCNName = table.cnName;
    const newTabEdit = false;
    const key = table.key;
    const editFormFields = {"MaterialCode":"","MaterialName":"","CatalogID":[],"MaterialType":"","Specification":"","Unit":"","Remarks":"","Img":""};
    const editFormOptions = [[{"title":"物料编码","required":true,"field":"MaterialCode"}],
                              [{"title":"物料名称","required":true,"field":"MaterialName"}],
                              [{"dataKey":"物料分类","data":[],"title":"物料分类","field":"CatalogID","type":"cascader"}],
                              [{"title":"物料类型","field":"MaterialType"}],
                              [{"title":"规格型号","field":"Specification"}],
                              [{"dataKey":"物料单位","data":[],"title":"单位","field":"Unit","type":"select"}],
                              [{"title":"备注信息","field":"Remarks","type":"textarea"}],
                              [{"title":"物料图片","field":"Img","type":"img"}]];
    const searchFormFields = {"MaterialCode":"","MaterialName":"","MaterialType":"","Specification":"","Unit":""};
    const searchFormOptions = [[{"title":"物料编码","field":"MaterialCode"},{"title":"物料名称","field":"MaterialName"},{"title":"物料类型","field":"MaterialType"},{"title":"规格型号","field":"Specification"},{"dataKey":"物料单位","data":[],"title":"单位","field":"Unit"}]];
    const columns = [{field:'MaterialID',title:'物料ID',type:'string',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'MaterialCode',title:'物料编码',type:'string',link:true,width:120,require:true,align:'left'},
                       {field:'MaterialName',title:'物料名称',type:'string',width:90,require:true,align:'left'},
                       {field:'Img',title:'物料图片',type:'img',width:80,align:'left'},
                       {field:'CatalogID',title:'物料分类',type:'string',bind:{ key:'物料分类',data:[]},width:120,align:'left'},
                       {field:'MaterialType',title:'物料类型',type:'string',width:90,hidden:true,align:'left'},
                       {field:'Specification',title:'规格型号',type:'string',width:110,align:'left'},
                       {field:'Unit',title:'单位',type:'string',bind:{ key:'物料单位',data:[]},width:70,align:'left'},
                       {field:'Price',title:'单价',type:'decimal',width:70,hidden:true,align:'left'},
                       {field:'Remarks',title:'备注信息',type:'string',width:90,align:'left'},
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