<!--
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *业务请在@/extension/business/Personal.js此处编写
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
    import extend from "@/extension/business/Personal.js";
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
                    cnName: '人员档案',
                    name: 'Personal',
                    url: "/Personal/",
                    sortName: "Id"
                },
                extend: extend,
                editFormFields: {"Name":"","Ethnicity":"","IDCard":"","Photo":"","DateOfBirth":"","Age":"","Gender":"","MaritalStatus":"","CensusRegister":"","CensusRegisterTypes":"","AncestralNativePlace":"","PoliticalStatus":"","CollectiveHouseholdRegistration":"","PostalAddress":"","PhoneNumber":"","Wechat":"","TimeOfEnlistment":"","MilitaryRank":"","CategoriesMilitaryPersonnel":"","MilitaryServiceStatus":"","Major":"","Duty":"","BloodType":"","Height":"","Width":""},
                editFormOptions: [[{"title":"姓名","required":true,"field":"Name"},
                               {"title":"身份证号","required":true,"field":"IDCard"},
                               {"dataKey":"Ethnicity","data":[],"title":"民族","field":"Ethnicity","type":"select"},
                               {"title":"照片","field":"Photo","type":"img"}],
                              [{"title":"出生日期","field":"DateOfBirth"},
                               {"title":"年龄","field":"Age","type":"number"},
                               {"dataKey":"gender","data":[],"title":"性别","required":true,"field":"Gender","type":"select"},
                               {"dataKey":"MaritalStatus","data":[],"title":"婚姻状态","field":"MaritalStatus","type":"select"}],
                              [{"dataKey":"PoliticalStatus","data":[],"title":"政治面貌","field":"PoliticalStatus","type":"select"},
                               {"dataKey":"AncestralNativePlace","data":[],"title":"籍贯","field":"AncestralNativePlace","type":"select"},
                               {"title":"户口所在地","field":"CensusRegister"},
                               {"dataKey":"CensusRegisterTypes","data":[],"title":"户籍类型","field":"CensusRegisterTypes","type":"select"}],
                              [{"dataKey":"enable","data":[],"title":"是否集体户口","field":"CollectiveHouseholdRegistration","type":"select"}],
                              [{"title":"手机号码","field":"PhoneNumber","type":"phone"},
                               {"title":"微信","field":"Wechat"},
                               {"title":"通讯地址","field":"PostalAddress"}],
                              [{"dataKey":"Person_MilitaryServiceStatus","data":[],"title":"兵役状态","field":"MilitaryServiceStatus","type":"select"},
                               {"title":"入伍时间","field":"TimeOfEnlistment","type":"date"},
                               {"dataKey":"CategoriesMilitaryPersonnel","data":[],"title":"军事人员类别","field":"CategoriesMilitaryPersonnel","type":"select"},
                               {"dataKey":"MilitaryRank","data":[],"title":"军衔","field":"MilitaryRank","type":"select"}],
                              [{"title":"职务","field":"Duty","type":"number"},
                               {"title":"专业","field":"Major","type":"number"}],
                              [{"dataKey":" bloodType","data":[],"title":"血型","field":"BloodType","type":"select"},
                               {"title":"身高","field":"Height"},
                               {"title":"体重","field":"Width"}]],
                searchFormFields: {},
                searchFormOptions: [],
                columns: [{field:'Id',title:'Id',type:'int',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:90,align:'left',sortable:true},
                       {field:'CreateID',title:'CreateID',type:'int',width:80,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:130,align:'left'},
                       {field:'Describe',title:'描述',type:'string',width:220,align:'left'},
                       {field:'Modifier',title:'修改人',type:'string',width:130,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:90,align:'left',sortable:true},
                       {field:'ModifyID',title:'ModifyID',type:'int',width:80,hidden:true,align:'left'},
                       {field:'Name',title:'姓名',type:'string',width:90,require:true,align:'left'},                    
                       {field:'MaritalStatus',title:'婚姻状态',type:'int',bind:{ key:'MaritalStatus',data:[]},width:80,align:'left'},
                       {field:'PhoneNumber',title:'手机号码',type:'string',width:90,align:'left'},
                       {field:'Photo',title:'照片',type:'img',width:220,align:'left'},
                       {field:'Wechat',title:'微信',type:'string',width:90,align:'left'}],
                detail: {
                    cnName:"#Name",
                    columns: [],
                    sortName: "",
                    key:""
                }
            };
        }
    };
    export default vueParam;
</script>
