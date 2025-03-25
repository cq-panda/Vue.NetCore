<!--
*Author：jxx
 *Contact：283591387@qq.com
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *业务请在@/extension/system/quartz/Sys_QuartzOptions.js此处编写
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
    import extend from "@/extension/system/quartz/Sys_QuartzOptions.js";
    import { ref, defineComponent } from "vue";
    export default defineComponent({
        setup() {
            const table = ref({
                key: 'Id',
                footer: "Foots",
                cnName: '定时任务',
                name: 'quartz/Sys_QuartzOptions',
                url: "/Sys_QuartzOptions/",
                sortName: "TaskName"
            });
            const editFormFields = ref({"TaskName":"","GroupName":"","Method":"","CronExpression":"","TimeOut":"","Describe":"","AuthKey":"","AuthValue":"","ApiUrl":"","PostData":"","Creator":"","CreateDate":""});
            const editFormOptions = ref([[{"title":"任务名称","required":true,"field":"TaskName"},
                               {"title":"任务分组","required":true,"field":"GroupName"}],
                              [{"dataKey":"请求方式","data":[],"title":"请求方式","field":"Method","type":"select"},
                               {"title":"Corn表达式","required":true,"field":"CronExpression"}],
                              [{"title":"超时时间(秒)","field":"TimeOut","type":"number"},
                               {"title":"描述","field":"Describe"}],
                              [{"title":"AuthKey","field":"AuthKey"},
                               {"title":"AuthValue","field":"AuthValue"}],
                              [{"title":"Url地址","field":"ApiUrl","colSize":12}],
                              [{"title":"post参数","field":"PostData","colSize":12,"type":"textarea"}],
                              [{"title":"创建人","field":"Creator","disabled":true},
                               {"title":"创建时间","field":"CreateDate","disabled":true}]]);
            const searchFormFields = ref({"TaskName":"","LastRunTime":"","CreateDate":"","ModifyDate":""});
            const searchFormOptions = ref([[{"title":"任务名称","field":"TaskName","type":"like"},{"title":"最后执行时间","field":"LastRunTime","type":"datetime"},{"title":"创建时间","field":"CreateDate","type":"datetime"},{"title":"修改时间","field":"ModifyDate","type":"datetime"}]]);
            const columns = ref([{field:'Id',title:'Id',type:'guid',width:110,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'TaskName',title:'任务名称',type:'string',link:true,width:120,require:true,align:'left',sort:true},
                       {field:'GroupName',title:'任务分组',type:'string',width:100,require:true,align:'left'},
                       {field:'Method',title:'请求方式',type:'string',bind:{ key:'请求方式',data:[]},width:110,align:'left'},
                       {field:'TimeOut',title:'超时时间(秒)',type:'int',width:80,hidden:true,align:'left'},
                       {field:'CronExpression',title:'Corn表达式',type:'string',width:120,require:true,align:'left'},
                       {field:'ApiUrl',title:'Url地址',type:'string',width:150,align:'left'},
                       {field:'PostData',title:'post参数',type:'string',width:110,hidden:true,align:'left'},
                       {field:'AuthKey',title:'AuthKey',type:'string',width:100,hidden:true,align:'left'},
                       {field:'AuthValue',title:'AuthValue',type:'string',width:100,hidden:true,align:'left'},
                       {field:'Describe',title:'描述',type:'string',width:120,align:'left'},
                       {field:'LastRunTime',title:'最后执行时间',type:'datetime',width:150,align:'left',sort:true},
                       {field:'Status',title:'运行状态',type:'int',width:90,align:'left'},
                       {field:'CreateID',title:'CreateID',type:'int',width:80,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:130,hidden:true,readonly:true,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:150,hidden:true,readonly:true,align:'left',sort:true},
                       {field:'ModifyID',title:'ModifyID',type:'int',width:80,hidden:true,align:'left'},
                       {field:'Modifier',title:'Modifier',type:'string',width:130,hidden:true,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:110,hidden:true,align:'left',sort:true}]);
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
