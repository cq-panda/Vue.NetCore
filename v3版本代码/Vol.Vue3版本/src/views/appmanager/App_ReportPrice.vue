<!--
*Author：jxx
 *Contact：283591387@qq.com
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *业务请在@/extension/appmanager/App_ReportPrice.js此处编写
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
    import extend from "@/extension/appmanager/App_ReportPrice.js";
    import { ref, defineComponent } from "vue";
    export default defineComponent({
        setup() {
            const table = ref({
                key: 'Id',
                footer: "Foots",
                cnName: '自定义实现一对多',
                name: 'App_ReportPrice',
                url: "/App_ReportPrice/",
                sortName: "Id"
            });
            const editFormFields = ref({"Variety":"","Age":"","City":"","Price":"","Creator":"","Enable":"","CreateDate":"","AuditDate":"","ModifyDate":""});
            const editFormOptions = ref([[{"dataKey":"pz","data":[],"title":"分类","required":true,"field":"Variety","type":"select"},
                               {"dataKey":"age","data":[],"title":"年龄","required":true,"field":"Age","type":"select"},
                               {"dataKey":"city","data":[],"title":"城市","required":true,"field":"City","type":"select"}],
                              [{"title":"价格","required":true,"field":"Price","type":"decimal"},
                               {"title":"创建人","field":"Creator","disabled":true},
                               {"dataKey":"enable","data":[],"title":"是否启用","field":"Enable","disabled":true,"type":"switch"}],
                              [{"title":"创建时间","field":"CreateDate","disabled":true,"type":"datetime"},
                               {"title":"审核时间","field":"AuditDate","disabled":true},
                               {"title":"修改时间","field":"ModifyDate","disabled":true}]]);
            const searchFormFields = ref({"Variety":"","Age":"","City":"","CreateDate":"","AuditStatus":""});
            const searchFormOptions = ref([[{"dataKey":"pz","data":[],"title":"分类","field":"Variety","type":"select"},{"dataKey":"age","data":[],"title":"年龄","field":"Age","type":"select"},{"dataKey":"city","data":[],"title":"城市","field":"City","type":"select"}],[{"title":"创建时间","field":"CreateDate","type":"datetime"},{"dataKey":"audit","data":[],"title":"审核状态","field":"AuditStatus","type":"select"}]]);
            const columns = ref([{field:'Id',title:'主键ID',type:'int',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'Variety',title:'分类',type:'string',bind:{ key:'pz',data:[]},width:80,require:true,align:'left',sort:true},
                       {field:'Age',title:'年龄',type:'string',bind:{ key:'age',data:[]},width:80,require:true,align:'left'},
                       {field:'City',title:'城市',type:'string',bind:{ key:'city',data:[]},width:90,require:true,align:'left'},
                       {field:'Price',title:'价格',type:'decimal',link:true,width:90,require:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:100,hidden:true,readonly:true,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:150,hidden:true,readonly:true,align:'left',sort:true},
                       {field:'AuditStatus',title:'审核状态',type:'int',bind:{ key:'audit',data:[]},width:90,align:'left'},
                       {field:'AuditId',title:'审核人Id',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Auditor',title:'审核人',type:'string',width:90,align:'left'},
                       {field:'Enable',title:'是否启用',type:'byte',bind:{ key:'enable',data:[]},width:90,readonly:true,align:'left'},
                       {field:'CreateID',title:'创建人Id',type:'int',width:90,hidden:true,align:'left'},
                       {field:'ModifyID',title:'修改人ID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Modifier',title:'测试',type:'string',width:100,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:90,readonly:true,align:'left',sort:true}]);
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
