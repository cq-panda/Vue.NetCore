<!--
*Author：jxx
 *Contact：283591387@qq.com
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *业务请在@/extension/sys/system/Sys_Post.js此处编写
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
    import extend from "@/extension/sys/system/Sys_Post.jsx";
    import { ref, defineComponent } from "vue";
    export default defineComponent({
        setup() {
            const table = ref({
                key: 'PostId',
                footer: "Foots",
                cnName: '岗位管理',
                name: 'system/Sys_Post',
                newTabEdit: false,
                url: "/Sys_Post/",
                sortName: "CreateDate"
            });
            const editFormFields = ref({"PostName":"","PostCode":"","ParentId":[],"Enable":"","Remark":""});
            const editFormOptions = ref([[{"title":"岗位名称","required":true,"field":"PostName"}],
                              [{"title":"岗位编号","field":"PostCode"}],
                              [{"dataKey":"岗位","data":[],"title":"上级岗位","field":"ParentId","type":"cascader"}],
                              [{"dataKey":"enable","data":[],"title":"是否可用","field":"Enable","type":"radio"}],
                              [{"title":"备注","field":"Remark","type":"textarea"}]]);
            const searchFormFields = ref({"PostName":"","PostCode":"","Enable":"","CreateDate":""});
            const searchFormOptions = ref([[{"title":"岗位名称","field":"PostName","type":"like"},{"title":"岗位编号","field":"PostCode","type":"like"},{"dataKey":"enable","data":[],"title":"是否可用","field":"Enable","type":"select"},{"title":"创建时间","field":"CreateDate","type":"datetime"}]]);
            const columns = ref([{field:'PostId',title:'PostId',type:'string',width:120,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'PostName',title:'岗位名称',type:'string',link:true,width:130,require:true,align:'left'},
                       {field:'PostCode',title:'岗位编号',type:'string',width:100,align:'left'},
                       {field:'ParentId',title:'上级岗位',type:'string',bind:{ key:'岗位',data:[]},width:120,hidden:true,align:'left'},
                       {field:'DbServiceId',title:'DbServiceId',type:'string',width:120,hidden:true,align:'left'},
                       {field:'Enable',title:'是否可用',type:'int',bind:{ key:'enable',data:[]},width:60,align:'left'},
                       {field:'Remark',title:'备注',type:'string',width:120,align:'left'},
                       {field:'CreateID',title:'CreateID',type:'int',width:120,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:90,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:120,align:'left'},
                       {field:'ModifyID',title:'ModifyID',type:'int',width:120,hidden:true,align:'left'},
                       {field:'Modifier',title:'修改人',type:'string',width:90,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:120,align:'left'}]);
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
