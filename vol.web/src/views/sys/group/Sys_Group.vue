<!--
*Author：jxx
 *Contact：283591387@qq.com
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *业务请在@/extension/system/group/Sys_Group.js此处编写
 -->
<template>
    <view-grid ref="grid"
               :columns="columns"
               :detail="detail"
               :editFormFields="editFormFields"
               :editFormOptions="editFormOptions"
               :searchFormFields="searchFormFields"
               :searchFormOptions="searchFormOptions"
               :table="table"
               :extend="extend">
    </view-grid>
</template>
<script>
    import extend from "@/extension/sys/group/Sys_Group.js";
    import { ref, defineComponent } from "vue";
    export default defineComponent({
        setup() {
            const table = ref({
                key: 'GroupId',
                footer: "Foots",
                cnName: '集团管理',
                name: 'group/Sys_Group',
                url: "/Sys_Group/",
                sortName: "CreateDate"
            });
            const editFormFields = ref({"GroupName":"","PhoneNo":"","Address":"","Remark":""});
            const editFormOptions = ref([[{"title":"集团名称","required":true,"field":"GroupName"}],
                              [{"title":"电话","field":"PhoneNo"}],
                              [{"title":"地址","field":"Address"}],
                              [{"title":"备注","field":"Remark","type":"textarea"}]]);
            const searchFormFields = ref({});
            const searchFormOptions = ref([]);
            const columns = ref([{field:'GroupId',title:'GroupId',type:'guid',width:110,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'GroupName',title:'集团名称',type:'string',link:true,width:150,require:true,align:'left',sort:true},
                       {field:'PhoneNo',title:'电话',type:'string',width:140,align:'left'},
                       {field:'Address',title:'地址',type:'string',width:120,align:'left'},
                       {field:'Enable',title:'Enable',type:'int',width:110,hidden:true,align:'left'},
                       {field:'Remark',title:'备注',type:'string',width:100,align:'left'},
                       {field:'CreateID',title:'CreateID',type:'int',width:80,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:100,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:150,align:'left',sort:true},
                       {field:'ModifyID',title:'ModifyID',type:'int',width:150,hidden:true,align:'left'},
                       {field:'Modifier',title:'修改人',type:'string',width:100,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:150,align:'left',sort:true}]);
            const detail = ref({
                cnName: "#detailCnName",
                table: "#detailTable",
                columns: [],
                sortName: "",
                key: ""
            });
            return {
                table,
                extend,
                editFormFields,
                editFormOptions,
                searchFormFields,
                searchFormOptions,
                columns,
                detail,
            };
        },
    });
</script>
