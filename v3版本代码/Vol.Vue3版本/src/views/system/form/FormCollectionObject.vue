<!--
*Author：jxx
 *Contact：283591387@qq.com
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *业务请在@/extension/system/form/FormCollection.js此处编写
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
    import extend from "@/extension/system/form/FormCollectionObject.js";
    import { ref, defineComponent } from "vue";
    export default defineComponent({
        setup() {
            const table = ref({
                key: 'FormCollectionId',
                footer: "Foots",
                cnName: '数据采集',
                name: 'form/FormCollectionObject',
                url: "/FormCollectionObject/",
                sortName: "CreateDate"
            });
            const editFormFields = ref({"Title":"","FormData":""});
            const editFormOptions = ref([[{"title":"标题","field":"Title"},
                               {"title":"表单数据","field":"FormData"}]]);
            const searchFormFields = ref({"Title":"","Creator":"","CreateDate":""});
            const searchFormOptions = ref([[{"title":"标题","field":"Title","type":"like"},{"title":"提交人","field":"Creator","type":"like"},{"title":"提交时间","field":"CreateDate","type":"datetime"}]]);
            const columns = ref([{field:'FormCollectionId',title:'FormCollectionId',type:'guid',width:110,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'FormId',title:'表单ID',type:'guid',width:110,hidden:true,align:'left'},
                       {field:'Title',title:'标题',type:'string',width:110,align:'left',sort:true},
                       {field:'FormData',title:'表单数据',type:'string',width:110,hidden:true,align:'left'},
                       {field:'Creator',title:'提交人',type:'string',width:100,align:'left'},
                       {field:'CreateDate',title:'提交时间',type:'datetime',width:145,align:'left',sort:true},
                       {field:'CreateID',title:'CreateID',type:'int',width:80,hidden:true,align:'left'},
                       {field:'Modifier',title:'Modifier',type:'string',width:130,hidden:true,align:'left'},
                       {field:'ModifyDate',title:'ModifyDate',type:'datetime',width:110,hidden:true,align:'left',sort:true},
                       {field:'ModifyID',title:'ModifyID',type:'int',width:80,hidden:true,align:'left'}]);
            const detail = ref({
                cnName: "#detailCnName",
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
