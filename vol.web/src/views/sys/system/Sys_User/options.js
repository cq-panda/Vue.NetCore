// *Author：jxx
// *Contact：283591387@qq.com
// *代码由框架生成,任何更改都可能导致被代码生成器覆盖
export default function(){
    const table = {
        key: 'User_Id',
        footer: "Foots",
        cnName: '用户管理',
        name: 'Sys_User',
        url: "/Sys_User/",
        sortName: "User_Id"
    };
    const tableName = table.name;
    const tableCNName = table.cnName;
    const newTabEdit = false;
    const key = table.key;
    const editFormFields = {"UserName":"","UserTrueName":"","Role_Id":[],"Gender":"","Enable":"","Email":"","DeptIds":"","Remark":"","HeadImageUrl":""};
    const editFormOptions = [[{"title":"帐号","required":true,"field":"UserName","disabled":true},
                               {"title":"姓名","required":true,"field":"UserTrueName","type":"text"}],
                              [{"dataKey":"tree_roles","data":[],"title":"角色","required":true,"field":"Role_Id","type":"cascader"},
                               {"dataKey":"gender","data":[],"title":"性别","field":"Gender","type":"select"}],
                              [{"dataKey":"enable","data":[],"title":"是否可用","required":true,"field":"Enable","type":"select"},
                               {"title":"邮箱","field":"Email","type":"mail"}],
                              [{"dataKey":"部门级联","data":[],"title":"组织构架","field":"DeptIds","colSize":12,"type":"treeSelect"}],
                              [{"title":"备注","field":"Remark","colSize":12,"type":"textarea"}],
                              [{"title":"头像","field":"HeadImageUrl","type":"img"}]];
    const searchFormFields = {"UserName":"","UserTrueName":"","Role_Id":[],"Gender":"","CreateDate":""};
    const searchFormOptions = [[{"title":"帐号","field":"UserName"},{"title":"姓名","field":"UserTrueName"},{"dataKey":"tree_roles","data":[],"title":"角色","field":"Role_Id","type":"cascader"},{"dataKey":"gender","data":[],"title":"性别","field":"Gender","type":"select"},{"title":"注册时间","field":"CreateDate","type":"datetime"}]];
    const columns = [{field:'User_Id',title:'User_Id',type:'int',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'UserName',title:'帐号',type:'string',link:true,width:100,readonly:true,require:true,align:'left',sort:true},
                       {field:'UserTrueName',title:'姓名',type:'string',width:90,require:true,align:'left'},
                       {field:'Role_Id',title:'角色',type:'int',bind:{ key:'tree_roles',data:[]},width:140,require:true,align:'left'},
                       {field:'Gender',title:'性别',type:'int',bind:{ key:'gender',data:[]},width:60,align:'left'},
                       {field:'DeptIds',title:'组织构架',type:'string',bind:{ key:'部门级联',data:[]},width:220,hidden:true,align:'left'},
                       {field:'HeadImageUrl',title:'头像',type:'img',width:70,align:'left'},
                       {field:'Enable',title:'是否可用',type:'byte',bind:{ key:'enable',data:[]},width:80,require:true,align:'left'},
                       {field:'Email',title:'邮箱',type:'string',width:120,hidden:true,align:'left'},
                       {field:'Token',title:'Token',type:'string',width:180,hidden:true,align:'left'},
                       {field:'Remark',title:'备注',type:'string',width:120,align:'left'},
                       {field:'PhoneNo',title:'手机号',type:'string',width:150,hidden:true,align:'left'},
                       {field:'CreateID',title:'CreateID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'LastLoginDate',title:'最后登陆时间',type:'datetime',width:150,hidden:true,align:'left',sort:true},
                       {field:'LastModifyPwdDate',title:'最后密码修改时间',type:'datetime',width:150,hidden:true,align:'left',sort:true},
                       {field:'Creator',title:'创建人',type:'string',width:90,readonly:true,align:'left'},
                       {field:'ModifyID',title:'ModifyID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'CreateDate',title:'注册时间',type:'datetime',width:150,readonly:true,align:'left',sort:true},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:90,hidden:true,readonly:true,align:'left',sort:true},
                       {field:'Modifier',title:'修改人',type:'string',width:130,hidden:true,readonly:true,align:'left'},
                       {field:'OrderNo',title:'排序号',type:'int',width:90,hidden:true,align:'left'},
                       {field:'RoleName',title:'RoleName',type:'string',width:220,hidden:true,align:'left'},
                       {field:'Tel',title:'Tel',type:'string',width:110,hidden:true,align:'left'},
                       {field:'DeptName',title:'DeptName',type:'string',width:220,hidden:true,align:'left'},
                       {field:'Dept_Id',title:'Dept_Id',type:'int',width:80,hidden:true,align:'left'},
                       {field:'IsRegregisterPhone',title:'IsRegregisterPhone',type:'int',width:80,hidden:true,align:'left'},
                       {field:'Address',title:'Address',type:'string',width:220,hidden:true,align:'left'},
                       {field:'AppType',title:'AppType',type:'int',width:80,hidden:true,align:'left'},
                       {field:'AuditDate',title:'AuditDate',type:'datetime',width:150,hidden:true,align:'left',sort:true},
                       {field:'AuditStatus',title:'AuditStatus',type:'int',width:80,hidden:true,align:'left'},
                       {field:'Auditor',title:'Auditor',type:'string',width:220,hidden:true,align:'left'},
                       {field:'Mobile',title:'Mobile',type:'string',width:110,hidden:true,align:'left'}];
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