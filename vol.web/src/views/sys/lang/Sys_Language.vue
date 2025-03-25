<!--
*Author：jxx
 *Contact：283591387@qq.com
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *业务请在@/extension/system/lang/Sys_Language.js此处编写
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
    import extend from "@/extension/sys/lang/Sys_Language.js";
    import { ref, defineComponent } from "vue";
    export default defineComponent({
        setup() {
            const table = ref({
                key: 'Id',
                footer: "Foots",
                cnName: '语言管理',
                name: 'lang/Sys_Language',
                url: "/Sys_Language/",
                sortName: "Id"
            });
            const editFormFields = ref({"ZHCN":"","ZHTW":"","English":"","Spanish":"","French":"","Russian":"","Arabic":""});
            const editFormOptions = ref([[{"title":"简体中文","required":true,"field":"ZHCN","type":"textarea"},
                               {"title":"繁体中文","field":"ZHTW","type":"textarea"},
                               {"title":"英语","field":"English","type":"textarea"},
                               {"title":"西班牙语","field":"Spanish","type":"textarea"}],
                              [{"title":"法语","field":"French","type":"textarea"},
                               {"title":"俄语","field":"Russian","type":"textarea"},
                               {"title":"阿拉伯语","field":"Arabic","type":"textarea"}]]);
            const searchFormFields = ref({"ZHCN":"","ZHTW":"","English":"","French":"","Spanish":"","Russian":"","Arabic":"","CreateDate":""});
            const searchFormOptions = ref([[{"title":"简体中文","field":"ZHCN","type":"like"},{"title":"繁体中文","field":"ZHTW","type":"like"},{"title":"英语","field":"English","type":"like"},{"title":"西班牙语","field":"Spanish","type":"like"}],[{"title":"法语","field":"French","type":"like"},{"title":"俄语","field":"Russian","type":"like"},{"title":"阿拉伯语","field":"Arabic","type":"like"},{"title":"创建时间","field":"CreateDate"}]]);
            const columns = ref([{field:'Id',title:'Id',type:'int',width:110,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'ZHCN',title:'简体中文',type:'string',link:true,width:140,require:true,align:'left',sort:true},
                       {field:'ZHTW',title:'繁体中文',type:'string',width:140,align:'left'},
                       {field:'English',title:'英语',type:'string',width:140,align:'left'},
                       {field:'French',title:'法语',type:'string',width:120,align:'left'},
                       {field:'Spanish',title:'西班牙语',type:'string',width:140,align:'left'},
                       {field:'Russian',title:'俄语',type:'string',width:140,align:'left'},
                       {field:'Arabic',title:'阿拉伯语',type:'string',width:140,align:'left'},
                       {field:'Module',title:'Module',type:'string',width:110,hidden:true,align:'left'},
                       {field:'IsPackageContent',title:'IsPackageContent',type:'int',width:110,hidden:true,align:'left'},
                       {field:'CreateId',title:'CreateId',type:'int',width:110,hidden:true,align:'left'},
                       {field:'Creator',title:'Creator',type:'string',width:130,hidden:true,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:140,align:'left',sort:true},
                       {field:'ModifyId',title:'ModifyId',type:'int',width:110,hidden:true,align:'left'},
                       {field:'ModifyDate',title:'ModifyDate',type:'datetime',width:110,hidden:true,align:'left',sort:true},
                       {field:'Modifier',title:'Modifier',type:'string',width:130,hidden:true,align:'left'}]);
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
