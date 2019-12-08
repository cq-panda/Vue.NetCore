<!--
*Author：jxx
 *Contact：283591387@qq.com
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *业务请在@/extension/system/Sys_User.js此处编写
 -->
<template>
    <div>
        <view-grid :columns="columns"
                   :detail="detail"
                   :editFormFileds="editFormFileds"
                   :editFormOptions="editFormOptions"
                   :searchFormFileds="searchFormFileds"
                   :searchFormOptions="searchFormOptions"
                   :table="table"
                   :extend="extend">
        </view-grid>
    </div>
</template>

<script>
    import extend from "@/extension/system/Sys_User.js";
    import ViewGrid from "@/components/basic/ViewGrid.vue";
    var vueParam = {
        components: {
            ViewGrid
        },
        data() {
            return {
                table: {
                    key: 'User_Id',
                    footer: "Foots",
                    cnName: '用户管理',
                    name: 'Sys_User',
                    url: "/Sys_User/",
                    sortName: "User_Id"
                },
                extend: extend,
                editFormFileds: {"UserName":"","UserTrueName":"","Role_Id":"","IsRegregisterPhone":"","Address":"","Mobile":"","Gender":"","Token":"","Enable":"","Email":"","CreateDate":"","Creator":"","Remark":"","HeadImageUrl":""},
                editFormOptions: [[{"title":"用户名","required":true,"field":"UserName","disabled":true},
                               {"title":"用户真实姓名","required":true,"field":"UserTrueName","type":"text"}],
                              [{"dataKey":"roles","title":"角色","required":true,"field":"Role_Id","type":"drop"},
                               {"dataKey":"isphone","title":"是否手机用户","required":true,"field":"IsRegregisterPhone","type":"drop"}],
                              [{"title":"地址","field":"Address","type":"text"},
                               {"title":"电话","field":"Mobile","type":"text"}],
                              [{"dataKey":"gender","title":"性别","field":"Gender","type":"drop"},
                               {"title":"Token","field":"Token"}],
                              [{"dataKey":"enable","title":"是否可用","required":true,"field":"Enable","type":"drop"},
                               {"title":"Email","field":"Email","type":"mail"}],
                              [{"title":"注册时间","field":"CreateDate","disabled":true},
                               {"title":"创建人","field":"Creator","disabled":true}],
                              [{"title":"备注","field":"Remark","colSize":12,"type":"textarea"}],
                              [{"title":"头像","field":"HeadImageUrl","type":"img"}]],
                searchFormFileds: {"UserName":"","Gender":"","DeptName":"","Role_Id":"","Token":"","AppType":"","UserTrueName":"","CreateDate":"","IsRegregisterPhone":"","PhoneNo":"","Enable":"","LastLoginDate":"","Address":"","Email":""},
                searchFormOptions: [[{"title":"用户名","field":"UserName"},{"dataKey":"gender","title":"性别","field":"Gender","type":"drop"},{"title":"用户真实姓名","field":"UserTrueName"}],[{"title":"部门","field":"DeptName"},{"dataKey":"roles","title":"角色","field":"Role_Id","type":"drop"},{"title":"Token","field":"Token"}],[{"dataKey":"ut","title":"登陆设备类型","field":"AppType","type":"dropList"},{"dataKey":"isphone","title":"是否手机用户","field":"IsRegregisterPhone","type":"drop"},{"title":"手机号","field":"PhoneNo"}],[{"dataKey":"enable","title":"是否可用","field":"Enable","type":"drop"},{"title":"地址","field":"Address"},{"title":"Email","field":"Email"}],[{"title":"注册时间","field":"CreateDate","type":"datetime"},{"title":"最后登陆时间","field":"LastLoginDate","type":"datetime"}]],
                columns: [{field:'UserName',title:'用户名',type:'string',link:true,width:120,readonly:true,require:true,align:'left',sortable:true},
                       {field:'User_Id',title:'User_Id',type:'int',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'Gender',title:'性别',type:'int',bind:{ key:'gender',data:[]},width:100,align:'left'},
                       {field:'HeadImageUrl',title:'头像',type:'img',width:150,align:'left'},
                       {field:'Dept_Id',title:'Dept_Id',type:'int',width:90,hidden:true,align:'left'},
                       {field:'DeptName',title:'部门',type:'string',width:150,hidden:true,align:'left'},
                       {field:'Role_Id',title:'角色',type:'int',bind:{ key:'roles',data:[]},width:150,require:true,align:'left'},
                       {field:'RoleName',title:'RoleName',type:'string',width:90,hidden:true,require:true,align:'left'},
                       {field:'Token',title:'Token',type:'string',width:180,align:'left'},
                       {field:'AppType',title:'登陆设备类型',type:'int',bind:{ key:'ut',data:[]},width:150,align:'left'},
                       {field:'UserTrueName',title:'用户真实姓名',type:'string',width:150,require:true,align:'left'},
                       {field:'CreateDate',title:'注册时间',type:'datetime',width:150,readonly:true,align:'left',sortable:true},
                       {field:'IsRegregisterPhone',title:'是否手机用户',type:'int',bind:{ key:'isphone',data:[]},width:120,hidden:true,require:true,align:'left'},
                       {field:'PhoneNo',title:'手机号',type:'string',width:150,align:'left'},
                       {field:'Tel',title:'Tel',type:'string',width:90,hidden:true,align:'left'},
                       {field:'CreateID',title:'CreateID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:130,readonly:true,align:'left'},
                       {field:'Enable',title:'是否可用',type:'byte',bind:{ key:'enable',data:[]},width:90,require:true,align:'left'},
                       {field:'ModifyID',title:'ModifyID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Modifier',title:'修改人',type:'string',width:130,readonly:true,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:90,readonly:true,align:'left',sortable:true},
                       {field:'AuditStatus',title:'审核状态',type:'int',bind:{ key:'audit',data:[]},width:90,align:'left'},
                       {field:'Auditor',title:'审核人',type:'string',width:90,align:'left'},
                       {field:'AuditDate',title:'审核时间',type:'datetime',width:150,align:'left',sortable:true},
                       {field:'LastLoginDate',title:'最后登陆时间',type:'datetime',width:150,align:'left',sortable:true},
                       {field:'LastModifyPwdDate',title:'最后密码修改时间',type:'datetime',width:150,align:'left',sortable:true},
                       {field:'Address',title:'地址',type:'string',width:190,align:'left'},
                       {field:'Mobile',title:'电话',type:'string',width:140,align:'left'},
                       {field:'Email',title:'Email',type:'string',width:140,align:'left'},
                       {field:'Remark',title:'备注',type:'string',width:180,align:'left'},
                       {field:'OrderNo',title:'排序号',type:'int',width:90,align:'left'}],
                detail: {
                    cnName:"#detailCnName",
                    columns: [],
                    sortName: "",
                    key:""
                }
            };
        }
    };
    export default vueParam;
</script>
