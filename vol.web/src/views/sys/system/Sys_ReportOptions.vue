<!--
*Author：jxx
 *Contact：283591387@qq.com
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *业务请在@/extension/sys/system/Sys_ReportOptions.js此处编写
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
    import extend from "@/extension/sys/system/Sys_ReportOptions.jsx";
    import { ref, defineComponent } from "vue";
    export default defineComponent({
        setup() {
            const table = ref({
                key: 'ReportOptionsId',
                footer: "Foots",
                cnName: '报表模板',
                name: 'system/Sys_ReportOptions',
                newTabEdit: false,
                url: "/Sys_ReportOptions/",
                sortName: "CreateDate"
            });
            const editFormFields = ref({"ReportName":"","ReportCode":"","DbService":"","Options":"","FilePath":""});
            const editFormOptions = ref([[{"title":"报表名称","required":true,"field":"ReportName"}],
                              [{"title":"报表编码","required":true,"field":"ReportCode","disabled":true}],
                              [{"dataKey":"dbServer","data":[],"title":"所在数据库","field":"DbService","type":"select"}],
                              [{"title":"数据源sql","field":"Options","type":"textarea"}],
                              [{"title":"模板文件","required":true,"field":"FilePath","type":"file"}]]);
            const searchFormFields = ref({"ReportName":"","ReportCode":"","DbService":""});
            const searchFormOptions = ref([[{"title":"报表名称","field":"ReportName","type":"like"},{"title":"报表编码","field":"ReportCode"},{"dataKey":"dbServer","data":[],"title":"所在数据库","field":"DbService","type":"select"}]]);
            const columns = ref([{field:'ReportOptionsId',title:'ReportOptionsId',type:'guid',width:110,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'ReportName',title:'报表名称',type:'string',link:true,width:110,require:true,align:'left'},
                       {field:'ReportCode',title:'报表编码',type:'string',width:140,readonly:true,require:true,align:'left'},
                       {field:'DbService',title:'所在数据库',type:'string',bind:{ key:'dbServer',data:[]},width:130,align:'left'},
                       {field:'ReportType',title:'报表类型',type:'string',width:120,hidden:true,align:'left'},
                       {field:'ParentId',title:'父级id',type:'guid',width:110,hidden:true,align:'left'},
                       {field:'FilePath',title:'模板文件',type:'string',width:100,require:true,align:'left'},
                       {field:'Options',title:'数据源sql',type:'string',width:100,hidden:true,align:'left'},
                       {field:'OptionsText',title:'OptionsText',type:'string',width:150,hidden:true,align:'left'},
                       {field:'Enable',title:'发布状态',type:'int',width:100,hidden:true,align:'left'},
                       {field:'DbServiceId',title:'DbServiceId',type:'guid',width:110,hidden:true,align:'left'},
                       {field:'UserId',title:'UserId',type:'int',width:110,hidden:true,align:'left'},
                       {field:'TenancyId',title:'租户id',type:'string',width:120,hidden:true,align:'left'},
                       {field:'CreateID',title:'CreateID',type:'int',width:80,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:100,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:150,align:'left'},
                       {field:'ModifyID',title:'ModifyID',type:'int',width:80,hidden:true,align:'left'},
                       {field:'Modifier',title:'修改人',type:'string',width:100,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:150,align:'left'}]);
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
