<!--
*Author：jxx
 *Contact：283591387@qq.com
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *业务请在@/extension/sys/system/Sys_PrintOptions.js此处编写
 -->
<template>
    <view-grid ref="grid"
               :columns="columns"
               :detail="detail"
               :details="details"
               :editFormFields="editFormFields"
               :editFormOptions="editFormOptions"
               :searchFormFields="searchFormFields"
               :searchFormOptions="searchFormOptions"
               :table="table"
               :extend="extend">
    </view-grid>
</template>
<script>
    import extend from "@/extension/sys/system/Sys_PrintOptions.jsx";
    import { ref, defineComponent } from "vue";
    export default defineComponent({
        setup() {
            const table = ref({
                key: 'PrintOptionsId',
                footer: "Foots",
                cnName: '打印管理',
                name: 'system/Sys_PrintOptions',
                newTabEdit: false,
                url: "/Sys_PrintOptions/",
                sortName: "TableName,CreateDate"
            });
            const editFormFields = ref({"TableName":"","CustomName":"",Html:""});
            const editFormOptions = ref([[{"title":"打印模块","required":true,"field":"TableName"}],
                              [{"title":"模板名称","required":true,"field":"CustomName"}],
                              [{"title":"回调地址",placeholder:"打印成功/失败后回调接口","required":false,"field":"Html"}]]);
            const searchFormFields = ref({"CustomName":"","TableName":"","CreateDate":"","Creator":""});
            const searchFormOptions = ref([[{"title":"打印模块","field":"TableName"},{"title":"模板名称","field":"CustomName"},{"title":"创建时间","field":"CreateDate","type":"datetime"},{"title":"创建人","field":"Creator","type":"like"}]]);
            const columns = ref([{field:'PrintOptionsId',title:'PrintOptionsId',type:'guid',width:110,hidden:true,require:true,align:'left'},
                       {field:'CustomName',title:'模板名称',type:'string',link:true,width:150,require:true,align:'left',sort:true},
                       {field:'TableName',title:'打印模块',type:'string',width:120,hidden:true,require:true,align:'left'},
                       {field:'TableCNName',title:'打印模块名称',type:'string',width:120,align:'left'},
                       {field:'Options',title:'参数',type:'string',width:110,hidden:true,align:'left'},
                       {field:'Html',title:'Html',type:'string',width:110,hidden:true,align:'left'},
                       {field:'Enable',title:'Enable',type:'int',width:110,hidden:true,align:'left'},
                       {field:'DbService',title:'DbService',type:'guid',width:110,hidden:true,align:'left'},
                       {field:'UserId',title:'UserId',type:'int',width:110,hidden:true,align:'left'},
                       {field:'TenancyId',title:'TenancyId',type:'string',width:120,hidden:true,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:110,align:'left',sort:true},
                       {field:'CreateID',title:'CreateID',type:'int',width:80,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:130,align:'left'},
                       {field:'ModifyID',title:'ModifyID',type:'int',width:80,hidden:true,align:'left'},
                       {field:'Modifier',title:'修改人',type:'string',width:130,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:150,align:'left',sort:true}]);
            const detail = ref({columns:[]});
            const details = ref([]);
            return {
                table,
                extend,
                editFormFields,
                editFormOptions,
                searchFormFields,
                searchFormOptions,
                columns,
                detail,
                details
            };
        },
    });
</script>
