<!--
*Author：jxx
 *Contact：283591387@qq.com
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *业务请在@/extension/appmanager/App_TransactionAvgPrice.js此处编写
 -->
<template>
    <div>
        <view-grid :columns="columns"
                   :detail="detail"
                   :editFormFields="editFormFields"
                   :editFormOptions="editFormOptions"
                   :searchFormFields="searchFormFields"
                   :searchFormOptions="searchFormOptions"
                   :table="table"
                   :extend="extend">
        </view-grid>
    </div>
</template>

<script>
    import extend from "../formsMulti/multil1Extension/multi1.js"
    var vueParam = {
        data() {
            return {
                table: {
                    key: 'Id',
                    footer: "Foots",
                    cnName: '表单一对多table',
                    name: 'App_TransactionAvgPrice1',
                    url: "/App_TransactionAvgPrice/",
                    sortName: "Id"
                },
                extend:extend,
                editFormFields: {"Variety":"","AgeRange":"","City":"","AvgPrice":"","Date":"","IsTop":"","Creator":"","CreateDate":"","Modifier":"","ModifyDate":""},
                editFormOptions: [[{"dataKey":"pz","title":"种类","required":true,"field":"Variety","type":"select"},
                              {"dataKey":"city","title":"城市","required":true,"field":"City","type":"select"}],
                              [{"title":"价格","required":true,type:"number","field":"AvgPrice"},
                              {"title":"成交日期","required":true,"field":"Date","type":"date"}],
                              [{"dataKey":"enable","title":"状态","required":true,"field":"IsTop","type":"select"},
                               {"type":"datetime","title":"创建时间","field":"CreateDate","disabled":true}]],
                searchFormFields: {"Variety":"","City":""},
                searchFormOptions: [[{"dataKey":"pz","title":"品种","field":"Variety","type":"drop"},{"dataKey":"city","title":"城市","field":"City","type":"dropList"}]],
                columns: [{field:'Id',title:'主键ID',type:'int',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'Variety',title:'种类',type:'string',bind:{ key:'pz',data:[]},width:90,require:true,align:'left',sortable:true},
                       {field:'City',title:'城市',type:'string',bind:{ key:'city',data:[]},width:90,require:true,align:'left'},
                       {field:'AvgPrice',title:'价格',type:'decimal',link:true,width:80,require:true,align:'left'},
                       {field:'Date',title:'成交日期',type:'datetime',width:90,require:true,align:'left',sortable:true},
                       {field:'IsTop',title:'状态',type:'int',bind:{ key:'enable',data:[]},width:90,require:true,align:'left'},
                       {field:'Enable',title:'是否启用',type:'byte',bind:{ key:'enable',data:[]},width:90,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:130,readonly:true,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:90,readonly:true,align:'left',sortable:true}],
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
