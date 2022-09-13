<!--
*Author：jxx
 *Contact：283591387@qq.com
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *业务请在@/extension/system/flow/Sys_WorkFlow.js此处编写
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
    import extend from "@/extension/system/flow/Sys_WorkFlow.js";
    import { ref, defineComponent } from "vue";
    export default defineComponent({
        setup() {
            const table = ref({
                key: 'WorkFlow_Id',
                footer: "Foots",
                cnName: '审批流程配置',
                name: 'flow/Sys_WorkFlow',
                url: "/Sys_WorkFlow/",
                sortName: "CreateDate"
            });
            const editFormFields = ref({"WorkName":"","WorkTable":"","Remark":""});
            const editFormOptions = ref([[{"title":"流程名称","required":true,"field":"WorkName"},
                               {"title":"表名","required":true,"field":"WorkTable"},
                               {"title":"备注","field":"Remark"}]]);
            const searchFormFields = ref({"WorkName":"","WorkTable":"","Enable":"","Creator":""});
            const searchFormOptions = ref([[{"title":"流程名称","field":"WorkName"},{"title":"表名","field":"WorkTable"},{"dataKey":"enable","data":[],"title":"是否启用","field":"Enable","type":"select"},{"title":"创建人","field":"Creator","type":"datetime"}]]);
            const columns = ref([{field:'WorkFlow_Id',title:'WorkFlow_Id',type:'guid',width:110,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'WorkName',title:'流程名称',type:'string',link:true,width:140,require:true,align:'left',sort:true},
                       {field:'WorkTable',title:'表名',type:'string',width:100,require:true,align:'left'},
                       {field:'WorkTableName',title:'功能菜单',type:'string',width:120,align:'left'},
                       {field:'Enable',title:'是否启用',type:'byte',bind:{ key:'enable',data:[]},width:100,align:'left'},
                       {field:'NodeConfig',title:'节点信息',type:'string',width:110,hidden:true,align:'left'},
                       {field:'LineConfig',title:'连接配置',type:'string',width:110,hidden:true,align:'left'},
                       {field:'Remark',title:'备注',type:'string',width:130,align:'left'},
                       {field:'CreateID',title:'CreateID',type:'int',width:80,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:100,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:150,align:'left',sort:true},
                       {field:'ModifyID',title:'ModifyID',type:'int',width:80,hidden:true,align:'left'},
                       {field:'Modifier',title:'修改人',type:'string',width:100,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:160,align:'left',sort:true}]);
            const detail = ref({
                cnName: "审批节点配置",
                table: "Sys_WorkFlowStep",
                columns: [{field:'WorkStepFlow_Id',title:'WorkStepFlow_Id',type:'guid',width:110,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'WorkFlow_Id',title:'流程主表id',type:'guid',width:110,align:'left',sort:true},
                       {field:'StepId',title:'流程节点Id',type:'string',width:120,align:'left'},
                       {field:'StepName',title:'节点名称',type:'string',width:110,align:'left'},
                       {field:'StepType',title:'节点类型(1=按用户审批,2=按角色审批)',type:'int',width:110,align:'left'},
                       {field:'StepValue',title:'审批用户id或角色id',type:'int',width:110,align:'left'},
                       {field:'Remark',title:'备注',type:'string',width:220,align:'left'},
                       {field:'OrderId',title:'审批顺序',type:'int',width:80,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:110,align:'left',sort:true},
                       {field:'CreateID',title:'CreateID',type:'int',width:80,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:130,align:'left'},
                       {field:'Enable',title:'Enable',type:'byte',width:110,align:'left'},
                       {field:'Modifier',title:'修改人',type:'string',width:130,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:110,align:'left',sort:true},
                       {field:'ModifyID',title:'ModifyID',type:'int',width:80,hidden:true,align:'left'}],
                sortName: "CreateDate",
                key: "WorkStepFlow_Id"
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
