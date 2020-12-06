<!--
*Author：jxx
 *Contact：283591387@qq.com
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *业务请在@/extension/business/Personal_Certificates.js此处编写
 -->
<template>
    <div>
        <view-grid :columns="columns"
                   :detail="detail"
                   :editFormFields="editFormFields"
                   :editFormFileds="editFormFields"
                   :editFormOptions="editFormOptions"
                   :searchFormFields="searchFormFields"
                   :searchFormFileds="searchFormFields"
                   :searchFormOptions="searchFormOptions"
                   :table="table"
                   :extend="extend">
        </view-grid>
    </div>
</template>

<script>
    import extend from "@/extension/business/Personal_Certificates.js";
    import ViewGrid from "@/components/basic/ViewGrid.vue";
    var vueParam = {
        components: {
            ViewGrid
        },
        data() {
            return {
                table: {
                    key: 'Id',
                    footer: "Foots",
                    cnName: '人员_证件管理',
                    name: 'Personal_Certificates',
                    url: "/Personal_Certificates/",
                    sortName: "Id"
                },
                extend: extend,
                editFormFields: {},
                editFormOptions: [],
                searchFormFields: {"PersonalId":""},
                searchFormOptions: [[{"dataKey":"Personal","data":[],"title":"所属人员","field":"PersonalId","type":"select"}]],
                columns: [{field:'Id',title:'编号',type:'int',width:90,hidden:true,require:true,align:'left'},
                       {field:'PersonalId',title:'所属人员',type:'int',bind:{ key:'Personal',data:[]},width:90,require:true,align:'left',sortable:true},
                       {field:'CertificateType',title:'类型',type:'int',bind:{ key:'CertificatesType',data:[]},width:80,require:true,align:'left'},
                       {field:'IDCardInfo',title:'身份证信息',type:'string',width:220,hidden:true,align:'left'},
                       {field:'IDCardImagePath',title:'身份证照片',type:'img',width:60,align:'left'},
                       {field:'Describe',title:'描述',type:'string',width:220,hidden:true,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:90,align:'left',sortable:true},
                       {field:'CreateID',title:'CreateID',type:'int',width:80,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:130,align:'left'},
                       {field:'Modifier',title:'修改人',type:'string',width:130,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:90,align:'left',sortable:true},
                       {field:'ModifyID',title:'ModifyID',type:'int',width:80,hidden:true,align:'left'}],
                detail: {
                    cnName:"#detailCnName",
                    columns: [],
                    sortName: "",
                    key:""
                }
            };
        }
    };
    export default vueParam;
</script>
