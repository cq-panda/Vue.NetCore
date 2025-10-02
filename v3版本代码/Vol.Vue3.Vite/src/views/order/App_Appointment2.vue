<!--
*Author：jxx
 *Contact：283591387@qq.com
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *业务请在@/extension/system/App_Appointment.js此处编写
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
    import extend from "@/extension/order/App_Appointment2.js";
    import { ref, defineComponent } from "vue";
    export default defineComponent({
        setup() {
            const table = ref({
                key: 'Id',
                footer: "Foots",
                cnName: '多级表头',
                name: 'App_Appointment',
                url: "/App_Appointment/",
                sortName: "CreateDate"
            });
            const editFormFields = ref({"Name":"","Id":"","Describe":"","PhoneNo":"","CreateDate":"","Creator":"","Modifier":"","ModifyDate":""});
            const editFormOptions = ref([[{"title":"用户姓名","required":true,"field":"Name","disabled":true},
                               {"title":"主键ID","required":true,"field":"Id","disabled":true}],
                              [{"title":"描述信息","required":true,"field":"Describe","disabled":true},
                               {"title":"电话","required":true,"field":"PhoneNo","disabled":true}],
                              [{"title":"创建时间","field":"CreateDate","disabled":true},
                               {"title":"创建人","field":"Creator","disabled":true}],
                              [{"title":"修 改 人","field":"Modifier","disabled":true},
                               {"title":"修改时间","field":"ModifyDate","disabled":true}]]);
            const searchFormFields = ref({"Name":"","PhoneNo":"","CreateDate":"","Creator":""});
            const searchFormOptions = ref([[{"title":"用户姓名","field":"Name","type":"like"},{"title":"电话","field":"PhoneNo"},{"title":"创建时间","field":"CreateDate","type":"datetime"},{"title":"创建人","field":"Creator"}]]);
            const columns = ref([{field:'Name',title:'用户姓名',type:'string',link:true,width:100,readonly:true,require:true,align:'left',sortable:true},
                       {field:'Describe',title:'描述信息',type:'string',width:180,readonly:true,require:true,align:'left'},
                       {field:'PhoneNo',title:'电话',type:'string',width:130,readonly:true,require:true,align:'left'},
                       {field:'Id',title:'主键ID',type:'string',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:120,readonly:true,align:'left',sortable:true},
                       {field:'CreateID',title:'CreateID',type:'int',width:80,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:130,readonly:true,align:'left'},
                       {field:'Modifier',title:'修 改 人',type:'string',width:130,readonly:true,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:90,readonly:true,align:'left',sortable:true},
                       {field:'ModifyID',title:'ModifyID',type:'int',width:80,hidden:true,align:'left'}]);
            const detail = ref({
                cnName: "#detailCnName",
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
