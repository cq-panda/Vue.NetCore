// *Author：jxx
// *Contact：283591387@qq.com
// *代码由框架生成,任何更改都可能导致被代码生成器覆盖
export default function(){
    const table = {
        key: 'DepartmentId',
        footer: "Foots",
        cnName: '组织架构',
        name: 'Sys_Department',
        newTabEdit: false,
        url: "/Sys_Department/",
        sortName: "DepartmentName"
    };
    const tableName = table.name;
    const tableCNName = table.cnName;
    const newTabEdit = false;
    const key = table.key;
    const editFormFields = {"DepartmentName":"","DepartmentCode":"","ParentId":[],"DepartmentType":"","Enable":"","Remark":""};
    const editFormOptions = [[{"title":"名称","required":true,"field":"DepartmentName"},
                               {"title":"编号","field":"DepartmentCode"}],
                              [{"dataKey":"部门级联","data":[],"title":"上级组织","field":"ParentId","type":"cascader"},
                               {"dataKey":"组织类型","data":[],"title":"类型","field":"DepartmentType","type":"radio"}],
                              [{"dataKey":"enable","data":[],"title":"是否可用","field":"Enable","type":"select"},
                               {"title":"备注","field":"Remark","type":"text"}]];
    const searchFormFields = {"DepartmentName":"","DepartmentCode":"","Enable":"","CreateDate":""};
    const searchFormOptions = [[{"title":"名称","field":"DepartmentName","type":"like"},{"title":"编号","field":"DepartmentCode","type":"like"},{"dataKey":"enable","data":[],"title":"是否可用","field":"Enable","type":"select"},{"title":"创建时间","field":"CreateDate","type":"datetime"}]];
    const columns = [{field:'DepartmentId',title:'DepartmentId',type:'guid',width:110,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'DepartmentName',title:'名称',type:'string',link:true,width:150,require:true,align:'left'},
                       {field:'ParentId',title:'上级组织',type:'guid',bind:{ key:'部门级联',data:[]},width:110,hidden:true,align:'left'},
                       {field:'DepartmentCode',title:'编号',type:'string',width:90,align:'left'},
                       {field:'DepartmentType',title:'类型',type:'string',bind:{ key:'组织类型',data:[]},width:80,align:'left'},
                       {field:'Enable',title:'是否可用',type:'int',bind:{ key:'enable',data:[]},width:80,align:'left'},
                       {field:'Remark',title:'备注',type:'string',width:100,align:'left'},
                       {field:'CreateID',title:'CreateID',type:'int',width:80,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:100,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:150,align:'left'},
                       {field:'ModifyID',title:'ModifyID',type:'int',width:80,hidden:true,align:'left'},
                       {field:'Modifier',title:'修改人',type:'string',width:100,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:150,align:'left'},
                       {field:'DbServiceId',title:'所属数据库',type:'guid',width:110,hidden:true,align:'left'}];
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