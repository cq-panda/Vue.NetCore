<!--
*Author：jxx
 *Contact：283591387@qq.com
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *业务请在@/extension/system/system/Sys_Department.js此处编写
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
    import extend from "@/extension/system/system/Sys_Department.js";
    import { ref, defineComponent } from "vue";
    export default defineComponent({
        setup() {
            const table = ref({
                key: 'DepartmentId',
                footer: "Foots",
                cnName: '组织架构',
                name: 'system/Sys_Department',
                url: "/Sys_Department/",
                sortName: "CreateDate"
            });
            const editFormFields = ref({"DepartmentName":"","DepartmentCode":"","ParentId":[],"Remark":""});
            const editFormOptions = ref([[{"title":"组织名称","required":true,"field":"DepartmentName"}],
                              [{"title":"组织编号","field":"DepartmentCode"}],
                              [{"dataKey":"组织机构","data":[],"title":"上级组织","field":"ParentId","type":"cascader"}],
                              [{"title":"备注","field":"Remark","type":"textarea"}]]);
            const searchFormFields = ref({"DepartmentName":"","DepartmentCode":"","Creator":"","CreateDate":""});
            const searchFormOptions = ref([[{"title":"组织名称","field":"DepartmentName","type":"like"},{"title":"组织编号","field":"DepartmentCode"},{"title":"创建人","field":"Creator"},{"title":"创建时间","field":"CreateDate","type":"datetime"}]]);
            const columns = ref([{field:'DepartmentId',title:'DepartmentId',type:'guid',width:110,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'DepartmentName',title:'组织名称',type:'string',link:true,width:180,require:true,align:'left',sort:true},
                       {field:'DepartmentCode',title:'组织编号',type:'string',width:90,align:'left'},
                       {field:'ParentId',title:'上级组织',type:'guid',bind:{ key:'组织机构',data:[]},width:110,hidden:true,align:'left'},
                       {field:'DepartmentType',title:'组织类型',type:'string',width:110,hidden:true,align:'left'},
                       {field:'Enable',title:'是否可用',type:'int',width:110,hidden:true,align:'left'},
                       {field:'Remark',title:'备注',type:'string',width:100,align:'left'},
                       {field:'CreateID',title:'CreateID',type:'int',width:100,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:90,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:145,align:'left',sort:true},
                       {field:'ModifyID',title:'ModifyID',type:'int',width:100,hidden:true,align:'left'},
                       {field:'Modifier',title:'修改人',type:'string',width:90,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:140,align:'left',sort:true}]);
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
