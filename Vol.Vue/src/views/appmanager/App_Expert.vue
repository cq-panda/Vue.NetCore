<!--
*Author：jxx
 *Contact：283591387@qq.com
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *业务请在@/extension/appmanager/App_Expert.js此处编写
 -->
<template>
    <div>
        <view-grid :columns="columns"
                   :detail="detail"
                   :editFormFileds="editFormFileds"
                   :editFormOptions="editFormOptions"
                   :searchFormFileds="searchFormFileds"
                   :searchFormOptions="searchFormOptions"
                   :table="table"
                   :extend="extend">
        </view-grid>
    </div>
</template>

<script>
    import extend from "@/extension/appmanager/App_Expert.js";
    import ViewGrid from "@/components/basic/ViewGrid.vue";
    var vueParam = {
        components: {
            ViewGrid
        },
        data() {
            return {
                table: {
                    key: 'ExpertId',
                    footer: "Foots",
                    cnName: '启用图片支持',
                    name: 'App_Expert',
                    url: "/App_Expert/",
                    sortName: "ExpertId"
                },
                extend: extend,
                editFormFileds: {"ExpertName":"","ReallyName":"","IDNumber":"","Education":"","Professional":"","City":"","PhoneNo":"","Company":"","Enable":"","CreateDate":"","SpecialField":"","Resume":"","HeadImageUrl":""},
                editFormOptions: [[{"title":"专家名称","field":"ExpertName"},
                               {"title":"真实姓名","field":"ReallyName"}],
                              [{"title":"身份证号","field":"IDNumber"},
                               {"title":"学历","field":"Education"}],
                              [{"title":"职业","field":"Professional"},
                               {"dataKey":"city","title":"服务地区","field":"City","type":"drop"}],
                              [{"title":"电话","field":"PhoneNo"},
                               {"title":"所在公司","field":"Company"}],
                              [{"dataKey":"enable","title":"是否启用","required":true,"field":"Enable","type":"drop"},
                               {"title":"申请时间","field":"CreateDate","disabled":true}],
                              [{"title":"擅长领域","field":"SpecialField","type":"excel"},
                               {"title":"个人简介","field":"Resume","type":"file"}],
                              [{"title":"专家头像","field":"HeadImageUrl","type":"img"}]],
                searchFormFileds: {"ExpertName":"","AuditStatus":"","ReallyName":"","IDNumber":"","Education":"","Professional":"","Company":"","City":"","AuditDate":""},
                searchFormOptions: [[{"title":"专家名称","field":"ExpertName"},{"title":"真实姓名","field":"ReallyName"},{"title":"身份证号","field":"IDNumber"}],[{"title":"学历","field":"Education","type":"text"},{"title":"职业","field":"Professional"},{"title":"所在公司","field":"Company"}],[{"dataKey":"audit","title":"审核状态","field":"AuditStatus","type":"dropList"},{"dataKey":"city","title":"服务地区","field":"City","type":"dropList"},{"title":"审核时间","field":"AuditDate","type":"datetime"}]],
                columns: [{field:'ExpertId',title:'主键ID',type:'int',width:80,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'User_Id',title:'申请人帐号Id',type:'int',width:90,hidden:true,align:'left'},
                       {field:'ExpertName',title:'专家名称',type:'string',width:150,align:'left',sortable:true},
                       {field:'HeadImageUrl',title:'专家头像',type:'img',width:220,align:'left'},
                       {field:'UserName',title:'申请人帐号',type:'string',link:true,width:120,align:'left'},
                       {field:'UserTrueName',title:'申请人',type:'string',width:120,align:'left'},
                       {field:'AuditStatus',title:'审核状态',type:'int',bind:{ key:'audit',data:[]},width:120,require:true,align:'left'},
                       {field:'Auditor',title:'审核人',type:'string',width:150,align:'left'},
                       {field:'Enable',title:'是否启用',type:'byte',bind:{ key:'enable',data:[]},width:90,require:true,align:'left'},
                       {field:'ReallyName',title:'真实姓名',type:'string',width:150,align:'left'},
                       {field:'IDNumber',title:'身份证号',type:'string',width:200,align:'left'},
                       {field:'PhoneNo',title:'电话',type:'string',width:150,align:'left'},
                       {field:'Education',title:'学历',type:'string',width:120,align:'left'},
                       {field:'Professional',title:'职业',type:'string',width:120,align:'left'},
                       {field:'Company',title:'所在公司',type:'string',width:150,align:'left'},
                       {field:'City',title:'服务地区',type:'string',bind:{ key:'city',data:[]},width:120,align:'left'},
                       {field:'SpecialField',title:'擅长领域',type:'file',width:120,align:'left'},
                       {field:'Resume',title:'个人简介',type:'excel',width:220,align:'left'},
                       {field:' Certificate',title:'资质证书',type:'img',width:200,align:'left'},
                       {field:'AuditId',title:'审核人Id',type:'int',width:80,hidden:true,align:'left'},
                       {field:'AuditDate',title:'审核时间',type:'datetime',width:150,align:'left',sortable:true},
                       {field:'CreateID',title:'创建人Id',type:'int',width:80,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:130,hidden:true,align:'left'},
                       {field:'CreateDate',title:'申请时间',type:'datetime',width:150,readonly:true,align:'left',sortable:true},
                       {field:'ModifyID',title:'修改人ID',type:'int',width:80,hidden:true,align:'left'},
                       {field:'Modifier',title:'修改人',type:'string',width:130,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:150,align:'left',sortable:true}],
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
