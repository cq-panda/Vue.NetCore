// *Author：jxx
// *Contact：283591387@qq.com
// *代码由框架生成,任何更改都可能导致被代码生成器覆盖
export default function(){
    const table = {
        key: 'id',
                editTable:true ,
        footer: "Foots",
        cnName: '省市区县',
        name: 'Sys_Region',
        newTabEdit: false,
        url: "/Sys_Region/",
        sortName: "id"
    };
    const tableName = table.name;
    const tableCNName = table.cnName;
    const newTabEdit = false;
    const key = table.key;
    const editFormFields = {"code":"","name":"","parentId":"","level":"","mername":"","Lng":"","Lat":"","pinyin":""};
    const editFormOptions = [[{"title":"编码","field":"code"},
                               {"title":"名称","field":"name"},
                               {"title":"上级编码","field":"parentId","type":"number"},
                               {"title":"级别","field":"level","type":"number"},
                               {"title":"完整地址","field":"mername"},
                               {"title":"经度","field":"Lng","type":"decimal"},
                               {"title":"纬度","field":"Lat","type":"decimal"},
                               {"title":"拼音","field":"pinyin"}]];
    const searchFormFields = {"name":"","level":"","mername":"","pinyin":""};
    const searchFormOptions = [[{"title":"名称","field":"name"},{"title":"级别","field":"level","type":"number"},{"title":"完整地址","field":"mername","type":"like"},{"title":"拼音","field":"pinyin","type":"like"}]];
    const columns = [{field:'id',title:'id',type:'int',width:110,hidden:true,require:true,align:'left'},
                       {field:'code',title:'编码',type:'string',width:70,edit:{type:''},align:'left'},
                       {field:'name',title:'名称',type:'string',width:100,edit:{type:''},align:'left'},
                       {field:'parentId',title:'上级编码',type:'int',width:70,edit:{type:''},align:'left'},
                       {field:'level',title:'级别',type:'int',width:60,edit:{type:''},align:'left'},
                       {field:'mername',title:'完整地址',type:'string',width:170,edit:{type:''},align:'left'},
                       {field:'Lng',title:'经度',type:'float',width:70,edit:{type:''},align:'left'},
                       {field:'Lat',title:'纬度',type:'float',width:70,edit:{type:''},align:'left'},
                       {field:'pinyin',title:'拼音',type:'string',width:120,edit:{type:''},align:'left'}];
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