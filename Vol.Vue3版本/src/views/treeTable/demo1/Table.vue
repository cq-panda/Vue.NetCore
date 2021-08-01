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
    import extend from "./table.js";
    var vueParam = {
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
                editFormFileds: {"UserName":"","UserTrueName":"","Role_Id":"","IsRegregisterPhone":"","Gender":"","Enable":"","Remark":"","HeadImageUrl":""},
                editFormOptions: [[{"title":"帐号","required":true,"field":"UserName","disabled":true},
                               {"title":"真实姓名","required":true,"field":"UserTrueName","type":"text"}],
                              // [
                              //    {"dataKey":"roles","title":"角色","required":true,"field":"Role_Id","type":"drop"},
                              //  {"dataKey":"isphone","title":"用户类型","required":true,"field":"IsRegregisterPhone","type":"drop"}],
                              [{"dataKey":"gender","title":"性别","field":"Gender","type":"drop"},
                               {"dataKey":"enable","title":"是否可用","required":true,"field":"Enable","type":"drop"}],
                              [{"title":"备注","field":"Remark","colSize":12,"type":"textarea"}],
                              [{"title":"头像","field":"HeadImageUrl","type":"img"}]],
                searchFormFileds: {"UserName":""},
                searchFormOptions: [[{"title":"帐号","field":"UserName",type:'like'}]],
                columns: [
                  {field:'UserName',title:'帐号',type:'string',link:true,width:120,readonly:true,require:true,align:'left',sortable:true},
                       {field:'RoleName',title:'角色',type:'string',link:true,width:90,require:true,align:'left'},
                       {field:'User_Id',title:'User_Id',type:'int',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'Gender',title:'性别',type:'int',bind:{ key:'gender',data:[]},width:100,align:'left'},
                       {field:'HeadImageUrl',title:'头像',type:'img',width:150,align:'left'},
                       {field:'UserTrueName',title:'真实姓名',type:'string',width:150,require:true,align:'left'},
                       {field:'Enable',title:'是否可用',type:'byte',bind:{ key:'enable',data:[]},width:90,require:true,align:'left'}
],
                detail: {
                    columns: []}
            };
        }
    };
    export default vueParam;
</script>
