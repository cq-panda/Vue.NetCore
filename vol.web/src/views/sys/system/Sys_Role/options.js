// *Author：jxx
// *Contact：283591387@qq.com
// *代码由框架生成,任何更改都可能导致被代码生成器覆盖
export default function(){
    const table = {
        key: 'Role_Id',
        footer: "Foots",
        cnName: '角色管理',
        name: 'Sys_Role',
        url: "/Sys_Role/",
        sortName: "Role_Id"
    };
    const tableName = table.name;
    const tableCNName = table.cnName;
    const newTabEdit = false;
    const key = table.key;
    const editFormFields = {"ParentId":[],"RoleName":"","Enable":"","Creator":"","CreateDate":""};
    const editFormOptions = [[{"dataKey":"tree_roles","data":[],"title":"父级ID","required":true,"field":"ParentId","type":"cascader"}],
                              [{"title":"角色名称","field":"RoleName"}],
                              [{"dataKey":"enable","data":[],"title":"是否启用","field":"Enable","type":"switch"}],
                              [{"title":"创建人","field":"Creator","disabled":true}],
                              [{"title":"创建时间","field":"CreateDate","disabled":true,"type":"datetime"}]];
    const searchFormFields = {"RoleName":"","DeptName":"","Enable":"","CreateDate":"","ModifyDate":""};
    const searchFormOptions = [[{"title":"角色名称","field":"RoleName","type":"text"},{"title":"部门名称","field":"DeptName","type":"text"},{"dataKey":"enable","data":[],"title":"是否启用","field":"Enable","type":"select"},{"title":"创建时间","field":"CreateDate","type":"datetime"},{"title":"修改时间","field":"ModifyDate","type":"datetime"}]];
    const columns = [{field:'RoleName',title:'角色名称',type:'string',link:true,width:90,align:'left'},
                       {field:'Role_Id',title:'角色ID',type:'int',width:70,readonly:true,require:true,align:'left'},
                       {field:'ParentId',title:'父级ID',type:'int',bind:{ key:'tree_roles',data:[]},width:70,require:true,align:'left'},
                       {field:'Dept_Id',title:'部门ID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'DeptName',title:'部门名称',type:'string',width:90,hidden:true,align:'left'},
                       {field:'Enable',title:'是否启用',type:'byte',bind:{ key:'enable',data:[]},width:90,align:'left'},
                       {field:'OrderNo',title:'排序',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:130,readonly:true,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:90,readonly:true,align:'left'},
                       {field:'Modifier',title:'修改人',type:'string',width:130,readonly:true,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:90,readonly:true,align:'left'}];
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