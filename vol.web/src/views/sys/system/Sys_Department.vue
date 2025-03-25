<!--
*Author：jxx
 *Contact：283591387@qq.com
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *业务请在@/extension/sys/system/Sys_Department.js此处编写
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
    import extend from "@/extension/sys/system/Sys_Department.jsx";
    import { ref, defineComponent } from "vue";
    export default defineComponent({
        setup() {
            const table = ref({
                key: 'DepartmentId',
                footer: "Foots",
                cnName: '组织架构',
                name: 'system/Sys_Department',
                url: "/Sys_Department/",
                sortName: "DepartmentName"
            });
            const editFormFields = ref({"DepartmentName":"","DepartmentCode":"","ParentId":[],"DepartmentType":"","Enable":"","Remark":""});
            const editFormOptions = ref([[{"title":"名称","required":true,"field":"DepartmentName"},
                               {"title":"编号","field":"DepartmentCode"}],
                              [{"dataKey":"部门级联","data":[],"title":"上级组织","field":"ParentId","type":"cascader"},
                               {"dataKey":"组织类型","data":[],"title":"类型","field":"DepartmentType","type":"radio"}],
                              [{"dataKey":"enable","data":[],"title":"是否可用","field":"Enable","type":"select"},
                               {"title":"备注","field":"Remark","type":"text"}]]);
            const searchFormFields = ref({"DepartmentName":"","DepartmentCode":"","Enable":"","CreateDate":""});
            const searchFormOptions = ref([[{"title":"名称","field":"DepartmentName","type":"like"},{"title":"编号","field":"DepartmentCode","type":"like"},{"dataKey":"enable","data":[],"title":"是否可用","field":"Enable","type":"select"},{"title":"创建时间","field":"CreateDate","type":"datetime"}]]);
            const columns = ref([{field:'DepartmentId',title:'DepartmentId',type:'guid',width:110,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'DepartmentName',title:'名称',type:'string',link:true,width:150,require:true,align:'left',sort:true},
                       {field:'ParentId',title:'上级组织',type:'guid',bind:{ key:'部门级联',data:[]},width:110,hidden:true,align:'left'},
                       {field:'DepartmentCode',title:'编号',type:'string',width:90,align:'left'},
                       {field:'DepartmentType',title:'类型',type:'string',bind:{ key:'组织类型',data:[]},width:80,align:'left'},
                       {field:'Enable',title:'是否可用',type:'int',bind:{ key:'enable',data:[]},width:80,align:'left'},
                       {field:'Remark',title:'备注',type:'string',width:100,align:'left'},
                       {field:'CreateID',title:'CreateID',type:'int',width:80,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:100,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:150,align:'left',sort:true},
                       {field:'ModifyID',title:'ModifyID',type:'int',width:80,hidden:true,align:'left'},
                       {field:'Modifier',title:'修改人',type:'string',width:100,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:150,align:'left',sort:true},
                       {field:'DbServiceId',title:'所属数据库',type:'guid',width:110,hidden:true,align:'left'}]);
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
