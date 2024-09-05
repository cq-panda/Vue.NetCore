<!--
*Author：jxx
 *Contact：283591387@qq.com
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *业务请在@/extension/system/system/Sys_Config.jsx此处编写
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
    import extend from "@/extension/system/system/Sys_Config.jsx";
    import { ref, defineComponent } from "vue";
    export default defineComponent({
        setup() {
            const table = ref({
                key: 'Con_ID',
                footer: "Foots",
                cnName: '参数配置',
                name: 'system/Sys_Config',
                url: "/Sys_Config/",
                sortName: "OrderNo"
            });
            const editFormFields = ref({"Con_Name":"","Con_Code":"","Con_Value":"","Sys_Flag":"","GroupCode":"","OrderNo":"","Remark":""});
            const editFormOptions = ref([[{"title":"配置名称","required":true,"field":"Con_Name","colSize":12}],
                              [{"title":"配置编码","required":true,"field":"Con_Code","colSize":12}],
                              [{"title":"属性值","required":true,"field":"Con_Value","colSize":12}],
                              [{"dataKey":"enable","data":[],"title":"内置参数","required":true,"field":"Sys_Flag","colSize":12,"type":"radio"}],
                              [{"dataKey":"参数分组","data":[],"title":"分组编码","field":"GroupCode","colSize":6},
                               {"title":"排序","field":"OrderNo","colSize":6,"type":"number"}],
                              [{"title":"备注","field":"Remark","colSize":12,"type":"textarea"}]]);
            const searchFormFields = ref({"Con_Name":"","Con_Code":"","GroupCode":""});
            const searchFormOptions = ref([[{"title":"配置名称","field":"Con_Name","type":"like"},{"title":"配置编码","field":"Con_Code","type":"like"},{"dataKey":"参数分组","data":[],"title":"分组编码","field":"GroupCode","type":"select"}]]);
            const columns = ref([{field:'Con_ID',title:'Con_ID',type:'guid',width:110,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'Con_Name',title:'配置名称',type:'string',width:120,require:true,align:'left',sort:true},
                       {field:'Con_Code',title:'配置编码',type:'string',width:120,require:true,align:'left'},
                       {field:'Con_Value',title:'属性值',type:'string',width:120,require:true,align:'left'},
                       {field:'Sys_Flag',title:'内置参数',type:'int',bind:{ key:'enable',data:[]},width:110,require:true,align:'left'},
                       {field:'GroupCode',title:'分组编码',type:'string',bind:{ key:'参数分组',data:[]},width:120,align:'left'},
                       {field:'OrderNo',title:'排序',type:'int',width:110,align:'left'},
                       {field:'Remark',title:'备注',type:'string',width:220,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:150,align:'left',sort:true},
                       {field:'CreateID',title:'创建人',type:'int',width:100,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:100,align:'left'},
                       {field:'Modifier',title:'修改人',type:'string',width:100,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:150,align:'left',sort:true},
                       {field:'ModifyID',title:'修改人',type:'int',width:100,hidden:true,align:'left'}]);
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
