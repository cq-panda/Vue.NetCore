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
                editFormOptions: [[{"columnType":"string","title":"用户名","required":true,"field":"UserName","disabled":true},
                               {"columnType":"string","title":"用户真实姓名","required":true,"field":"UserTrueName","type":"text"}],
                              [{"columnType":"string","dataKey":"roles","title":"角色","required":true,"field":"Role_Id","type":"drop"},
                               {"columnType":"int","dataKey":"isphone","title":"是否手机用户","required":true,"field":"IsRegregisterPhone","type":"drop"}],
                              [{"columnType":"string","title":"地址","field":"Address","type":"text"},
                               {"columnType":"string","title":"电话","field":"Mobile","type":"text"}],
                              [{"columnType":"bool","dataKey":"gender","title":"性别","field":"Gender","type":"drop"},
                               {"columnType":"string","title":"Token","field":"Token"}],
                              [{"columnType":"byte","dataKey":"enable","title":"是否可用","required":true,"field":"Enable","type":"drop"},
                               {"columnType":"string","title":"Email","field":"Email","type":"text"}],
                              [{"columnType":"datetime","title":"注册时间","field":"CreateDate","disabled":true},
                               {"columnType":"string","title":"创建人","field":"Creator","disabled":true}],
                              [{"columnType":"string","title":"备注","field":"Remark","colSize":12,"type":"textarea"}],
                              [{"columnType":"img","title":"头像","field":"HeadImageUrl"}]],
                searchFormFileds: {"UserName":"","Gender":"","DeptName":"","Role_Id":"","Token":"","AppType":"","UserTrueName":"","CreateDate":"","IsRegregisterPhone":"","PhoneNo":"","Enable":"","LastLoginDate":"","Address":"","Email":""},
                searchFormOptions: [[{"columnType":"string","title":"用户名","field":"UserName"},{"columnType":"bool","dataKey":"gender","title":"性别","field":"Gender","type":"drop"},{"columnType":"string","title":"用户真实姓名","field":"UserTrueName"}],[{"columnType":"string","title":"部门","field":"DeptName"},{"columnType":"string","dataKey":"roles","title":"角色","field":"Role_Id","type":"drop"},{"columnType":"string","title":"Token","field":"Token"}],[{"columnType":"int","dataKey":"ut","title":"登陆设备类型","field":"AppType","type":"dropList"},{"columnType":"int","dataKey":"isphone","title":"是否手机用户","field":"IsRegregisterPhone","type":"drop"},{"columnType":"string","title":"手机号","field":"PhoneNo"}],[{"columnType":"byte","dataKey":"enable","title":"是否可用","field":"Enable","type":"drop"},{"columnType":"string","title":"地址","field":"Address"},{"columnType":"string","title":"Email","field":"Email"}],[{"columnType":"datetime","title":"注册时间","field":"CreateDate","type":"datetime"},{"columnType":"datetime","title":"最后登陆时间","field":"LastLoginDate","type":"datetime"}]],
                columns: [{field:'UserName',title:'用户名',type:'string',link:true,width:120,readonly:true,require:true,align:'left',sortable:true},
                       {field:'User_Id',title:'User_Id',type:'int',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'Gender',title:'性别',type:'bool',bind:{ key:'gender',data:[]},width:100,align:'left'},
                       {field:'HeadImageUrl',title:'头像',type:'img',width:150,align:'left'},
                       {field:'Dept_Id',title:'Dept_Id',type:'int',width:90,hidden:true,align:'left'},
                       {field:'DeptName',title:'部门',type:'string',width:150,hidden:true,align:'left'},
                       {field:'Role_Id',title:'角色',type:'string',bind:{ key:'roles',data:[]},width:150,require:true,align:'left'},
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
                    sortName: "#detailSortName",
                    key:"#detailKey"
                }
            };
        }
    };
    export default vueParam;
</script>
