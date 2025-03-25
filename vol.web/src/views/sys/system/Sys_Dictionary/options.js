// *Author：jxx
// *Contact：283591387@qq.com
// *代码由框架生成,任何更改都可能导致被代码生成器覆盖
export default function(){
    const table = {
        key: 'Dic_ID',
        footer: "Foots",
        cnName: '字典数据',
        name: 'Sys_Dictionary',
        url: "/Sys_Dictionary/",
        sortName: "Dic_ID"
    };
    const tableName = table.name;
    const tableCNName = table.cnName;
    const newTabEdit = false;
    const key = table.key;
    const editFormFields = {"DicNo":"","DicName":"","ParentId":"","OrderNo":"","Remark":"","Enable":"","DbSql":""};
    const editFormOptions = [[{"title":"字典编号","required":true,"field":"DicNo"},
                               {"title":"字典名称","required":true,"field":"DicName"},
                               {"title":"父级ID","required":true,"field":"ParentId","type":"number"}],
                              [{"title":"排序号","field":"OrderNo","type":"number"},
                               {"title":"备注","field":"Remark","type":"text"},
                               {"dataKey":"enable","data":[],"title":"是否启用","required":true,"field":"Enable","type":"select"}],
                              [{"title":"sql语句","field":"DbSql","colSize":12,"type":"textarea"}]];
    const searchFormFields = {"DicNo":"","DicName":"","ParentId":"","Enable":"","CreateDate":"","ModifyDate":""};
    const searchFormOptions = [[{"title":"字典编号","field":"DicNo"},{"title":"字典名称","field":"DicName","type":"textarea"},{"title":"父级ID","field":"ParentId","type":"number"}],[{"dataKey":"enable","data":[],"title":"是否启用","field":"Enable","type":"select"},{"title":"创建时间","field":"CreateDate","type":"datetime"},{"title":"修改时间","field":"ModifyDate","type":"datetime"}]];
    const columns = [{field:'Dic_ID',title:'字典ID',type:'int',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'DicNo',title:'字典编号',type:'string',width:130,require:true,align:'left'},
                       {field:'DicName',title:'字典名称',type:'string',link:true,width:140,require:true,align:'left'},
                       {field:'ParentId',title:'父级ID',type:'int',width:90,require:true,align:'left'},
                       {field:'Config',title:'配置项',type:'string',width:300,hidden:true,align:'left'},
                       {field:'DbSql',title:'sql语句',type:'string',width:200,align:'left'},
                       {field:'DBServer',title:'所在数据库',type:'string',bind:{ key:'dbServer',data:[]},width:90,hidden:true,align:'left'},
                       {field:'OrderNo',title:'排序号',type:'int',width:90,align:'left'},
                       {field:'Remark',title:'备注',type:'string',width:90,align:'left'},
                       {field:'Enable',title:'是否启用',type:'byte',bind:{ key:'enable',data:[]},width:90,require:true,align:'left'},
                       {field:'CreateID',title:'CreateID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:130,hidden:true,readonly:true,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:150,readonly:true,align:'left'},
                       {field:'ModifyID',title:'ModifyID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Modifier',title:'修改人',type:'string',width:130,hidden:true,readonly:true,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:150,readonly:true,align:'left'}];
    const detail =  {
                    cnName: '字典明细',
                    table: 'Sys_DictionaryList',
                    columns: [{field:'DicList_ID',title:'DicList_ID',type:'int',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'Dic_ID',title:'数据源ID',type:'int',width:90,hidden:true,readonly:true,align:'left'},
                       {field:'DicValue',title:'数据源key',type:'string',width:90,edit:{type:'text'},align:'left'},
                       {field:'DicName',title:'数据源文本',type:'string',width:90,edit:{type:'text'},align:'left'},
                       {field:'OrderNo',title:'排序号',type:'int',width:90,edit:{type:'text'},align:'left'},
                       {field:'Remark',title:'备注',type:'string',width:90,edit:{type:'text'},align:'left'},
                       {field:'Enable',title:'是否可用',type:'byte',bind:{ key:'enable',data:[]},width:90,edit:{type:'switch'},align:'left'},
                       {field:'CreateID',title:'CreateID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:90,readonly:true,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:130,readonly:true,align:'left'},
                       {field:'ModifyID',title:'ModifyID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Modifier',title:'修改人',type:'string',width:90,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:130,align:'left'}],
                    sortName: 'DicList_ID',
                    key: 'DicList_ID'
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