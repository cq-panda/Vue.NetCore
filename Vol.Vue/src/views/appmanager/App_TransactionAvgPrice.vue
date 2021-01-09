<!--
*Author：jxx
 *Contact：283591387@qq.com
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *业务请在@/extension/appmanager/App_TransactionAvgPrice.js此处编写
 -->
<template>
    <div>
        <view-grid
                   ref="grid"
                   :columns="columns"
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
    import extend from "@/extension/appmanager/App_TransactionAvgPrice.js";
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
                    cnName: '自动绑定下拉框',
                    name: 'App_TransactionAvgPrice',
                    url: "/App_TransactionAvgPrice/",
                    sortName: "Id"
                },
                extend: extend,
                editFormFields: {"Variety":[],"AgeRange":"","City":"","AvgPrice":"","Date":"","IsTop":"","Creator":"","CreateDate":"","Modifier":"","ModifyDate":""},
                editFormOptions: [[{"dataKey":"pz","data":[],"title":"品种","required":true,"field":"Variety","colSize":12,"type":"checkbox"}],
                              [{"dataKey":"age","data":[],"title":"月龄","required":true,"field":"AgeRange","colSize":12,"type":"select"}],
                              [{"dataKey":"city","data":[],"title":"城市","required":true,"field":"City","colSize":12,"type":"select"}],
                              [{"title":"均价","required":true,"field":"AvgPrice","colSize":12,"type":"decimal"}],
                              [{"title":"日期","required":true,"field":"Date","colSize":12,"type":"date"}],
                              [{"dataKey":"top","data":[],"title":"价格","required":true,"field":"IsTop","colSize":12,"type":"select"}],
                              [{"title":"创建人","field":"Creator","disabled":true},
                               {"title":"创建时间","field":"CreateDate","disabled":true}],
                              [{"title":"修改人","field":"Modifier","disabled":true},
                               {"title":"修改时间","field":"ModifyDate","disabled":true}]],
                searchFormFields: {"Variety":"","AgeRange":"","City":"","Date":"","IsTop":"","Enable":""},
                searchFormOptions: [[{"dataKey":"pz","data":[],"title":"品种","field":"Variety","type":"select"},{"dataKey":"age","data":[],"title":"月龄","field":"AgeRange","type":"select"},{"dataKey":"city","data":[],"title":"城市","field":"City","type":"select"}],[{"title":"日期","field":"Date","type":"datetime"},{"dataKey":"top","data":[],"title":"价格","field":"IsTop","type":"select"},{"dataKey":"enable","data":[],"title":"启用","field":"Enable","type":"select"}]],
                columns: [{field:'Id',title:'主键ID',type:'int',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'Variety',title:'品种',type:'string',bind:{ key:'pz',data:[]},sort:true,width:90,require:true,align:'left',sortable:true},
                       {field:'AgeRange',title:'月龄',type:'string',bind:{ key:'age',data:[]},sort:true,width:90,require:true,align:'left'},
                       {field:'City',title:'城市',type:'string',bind:{ key:'city',data:[]},sort:true,width:90,require:true,align:'left'},
                       {field:'AvgPrice',title:'均价',type:'decimal',link:true,sort:true,width:80,require:true,align:'left'},
                       {field:'Date',title:'日期',type:'datetime',sort:true,width:90,require:true,align:'left',sortable:true},
                       {field:'IsTop',title:'价格',type:'int',bind:{ key:'top',data:[]},sort:true,width:90,require:true,align:'left'},
                       {field:'Enable',title:'启用',type:'sbyte',bind:{ key:'enable',data:[]},sort:true,width:90,hidden:true,align:'left'},
                       {field:'CreateID',title:'创建人Id',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:130,readonly:true,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',sort:true,width:90,readonly:true,align:'left',sortable:true},
                       {field:'ModifyID',title:'修改人ID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Modifier',title:'修改人',type:'string',width:130,readonly:true,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:90,readonly:true,align:'left',sortable:true}],
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
