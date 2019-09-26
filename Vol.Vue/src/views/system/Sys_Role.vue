<!--
*Author：jxx
 *Contact：283591387@qq.com
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *业务请在@/extension/system/Sys_Role.js此处编写
 -->
<template>
    <div>
        <view-grid :columns="columns"
                   :detailColumns="detailColumns"
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
    import extend from "@/extension/system/Sys_Role.js";
    import ViewGrid from "@/components/basic/ViewGrid.vue";
    var vueParam = {
        components: {
            ViewGrid
        },
        data() {
            return {
                table: {
                    key: 'Role_Id',
                    footer: "Foots",
                    cnName: '角色管理',
                    name: 'Sys_Role',
                    url: "/Sys_Role/",
                    sortName: "Role_Id"
                },
                extend: extend,
                editFormFileds: {"ParentId":"","RoleName":"","DeptName":"","Enable":"","Creator":"","CreateDate":"","Modifier":"","ModifyDate":""},
                editFormOptions: [[{"columnType":"int","title":"父级ID","required":true,"field":"ParentId"},
                               {"columnType":"string","title":"角色名称","field":"RoleName"}],
                              [{"columnType":"string","title":"部门名称","field":"DeptName"},
                               {"columnType":"byte","dataKey":"enable","title":"是否启用","field":"Enable","type":"switch"}],
                              [{"columnType":"string","title":"创建人","field":"Creator","disabled":true},
                               {"columnType":"datetime","title":"创建时间","field":"CreateDate","disabled":true,"type":"datetime"}],
                              [{"columnType":"string","title":"修改人","field":"Modifier","disabled":true},
                               {"columnType":"datetime","title":"修改时间","field":"ModifyDate","disabled":true}]],
                searchFormFileds: {"RoleName":"","DeptName":"","Enable":"","CreateDate":"","ModifyDate":""},
                searchFormOptions: [[{"columnType":"string","title":"角色名称","field":"RoleName","type":"text"},{"columnType":"string","title":"部门名称","field":"DeptName","type":"text"},{"columnType":"byte","dataKey":"enable","title":"是否启用","field":"Enable","type":"select"}],[{"columnType":"datetime","title":"创建时间","field":"CreateDate","type":"datetime"},{"columnType":"datetime","title":"修改时间","field":"ModifyDate","type":"datetime"}]],
                columns: [{field:'Role_Id',title:'角色ID',type:'int',width:70,readonly:true,require:true,align:'left',sortable:true},
                       {field:'ParentId',title:'父级ID',type:'int',width:70,require:true,align:'left'},
                       {field:'RoleName',title:'角色名称',type:'string',link:true,width:90,align:'left'},
                       {field:'Dept_Id',title:'部门ID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'DeptName',title:'部门名称',type:'string',width:90,align:'left'},
                       {field:'Enable',title:'是否启用',type:'byte',bind:{ key:'enable',data:[]},width:90,align:'left'},
                       {field:'OrderNo',title:'排序',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:130,readonly:true,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:90,readonly:true,align:'left',sortable:true},
                       {field:'Modifier',title:'修改人',type:'string',width:130,readonly:true,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:90,readonly:true,align:'left',sortable:true}],
                detailColumns: [],
            };
        }
    };
    export default vueParam;
</script>
