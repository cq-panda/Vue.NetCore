<!--
*Author：jxx
 *Contact：283591387@qq.com
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *业务请在@/extension/system/flow/Sys_WorkFlowTable.js此处编写
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
    import extend from "@/extension/system/flow/Sys_WorkFlowTable.js";
    import { ref, defineComponent } from "vue";
    export default defineComponent({
        setup() {
            const table = ref({
                key: 'WorkFlowTable_Id',
                footer: "Foots",
                cnName: '审批流程',
                name: 'flow/Sys_WorkFlowTable',
                url: "/Sys_WorkFlowTable/",
                sortName: "CreateDate"
            });
            const editFormFields = ref({});
            const editFormOptions = ref([]);
            const searchFormFields = ref({"WorkName":"","WorkTableName":"","AuditStatus":"","CreateDate":""});
            const searchFormOptions = ref([[{"dataKey":"audit","data":[],"title":"审批状态","field":"AuditStatus","type":"select"},{"title":"流程名称","field":"WorkName","type":"like"},{"title":"业务名称","field":"WorkTableName","type":"like"},{"title":"创建时间","field":"CreateDate","type":"datetime"}]]);
            const columns = ref([{field:'WorkFlowTable_Id',title:'WorkFlowTable_Id',type:'guid',width:110,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'WorkFlow_Id',title:'流程id',type:'guid',width:110,hidden:true,align:'left'},
                       {field:'WorkName',title:'流程名称',type:'string',width:180,align:'left',sort:true},
                       {field:'WorkTableKey',title:'表主键id',type:'string',width:180,hidden:true,align:'left'},
                       {field:'WorkTable',title:'表名',type:'string',width:180,align:'left'},
                       {field:'WorkTableName',title:'业务名称',type:'string',width:180,align:'left'},
                       {field:'CurrentOrderId',title:'当前审批节点',type:'int',width:110,align:'left'},
                       {field:'AuditStatus',title:'审批状态',type:'int',bind:{ key:'audit',data:[]},width:110,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:100,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:150,align:'left',sort:true},
                       {field:'CreateID',title:'CreateID',type:'int',width:80,hidden:true,align:'left'},
                       {field:'Enable',title:'Enable',type:'byte',width:110,hidden:true,align:'left'},
                       {field:'Modifier',title:'Modifier',type:'string',width:130,hidden:true,align:'left'},
                       {field:'ModifyDate',title:'ModifyDate',type:'datetime',width:110,hidden:true,align:'left',sort:true},
                       {field:'ModifyID',title:'ModifyID',type:'int',width:80,hidden:true,align:'left'}]);
            const detail = ref({
                cnName: "审批节点",
                table: "Sys_WorkFlowTableStep",
                columns: [{field:'Sys_WorkFlowTableStep_Id',title:'Sys_WorkFlowTableStep_Id',type:'guid',width:110,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'WorkFlowTable_Id',title:'主表id',type:'guid',width:110,require:true,align:'left',sort:true},
                       {field:'WorkFlow_Id',title:'流程id',type:'guid',width:110,align:'left'},
                       {field:'StepId',title:'节点id',type:'string',width:120,align:'left'},
                       {field:'StepName',title:'节名称',type:'string',width:180,align:'left'},
                       {field:'StepType',title:'审批类型',type:'int',width:110,align:'left'},
                       {field:'StepValue',title:'节点类型(1=按用户审批,2=按角色审批)',type:'int',width:110,align:'left'},
                       {field:'OrderId',title:'审批顺序',type:'int',width:110,align:'left'},
                       {field:'Remark',title:'Remark',type:'string',width:220,align:'left'},
                       {field:'CreateDate',title:'CreateDate',type:'datetime',width:110,align:'left',sort:true},
                       {field:'CreateID',title:'CreateID',type:'int',width:80,hidden:true,align:'left'},
                       {field:'Creator',title:'Creator',type:'string',width:130,align:'left'},
                       {field:'Enable',title:'Enable',type:'byte',width:110,align:'left'},
                       {field:'Modifier',title:'Modifier',type:'string',width:130,align:'left'},
                       {field:'ModifyDate',title:'ModifyDate',type:'datetime',width:110,align:'left',sort:true},
                       {field:'ModifyID',title:'ModifyID',type:'int',width:80,hidden:true,align:'left'}],
                sortName: "CreateDate",
                key: "Sys_WorkFlowTableStep_Id"
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
