<!--
*Author：jxx
 *Contact：283591387@qq.com
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *业务请在@/extension/system/flow/Sys_WorkFlowStep.js此处编写
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
    import extend from "@/extension/system/flow/Sys_WorkFlowStep.js";
    import { ref, defineComponent } from "vue";
    export default defineComponent({
        setup() {
            const table = ref({
                key: 'WorkStepFlow_Id',
                footer: "Foots",
                cnName: '审批节点配置',
                name: 'flow/Sys_WorkFlowStep',
                url: "/Sys_WorkFlowStep/",
                sortName: "CreateDate"
            });
            const editFormFields = ref({});
            const editFormOptions = ref([]);
            const searchFormFields = ref({});
            const searchFormOptions = ref([]);
            const columns = ref([{field:'WorkStepFlow_Id',title:'WorkStepFlow_Id',type:'guid',width:110,hidden:true,readonly:true,require:true,align:'left'},
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
                       {field:'ModifyID',title:'ModifyID',type:'int',width:80,hidden:true,align:'left'}]);
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
