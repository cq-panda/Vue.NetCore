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
                editFormFileds: {"Variety":"","AgeRange":"","City":"","AvgPrice":"","Date":"","IsTop":"","Creator":"","CreateDate":"","Modifier":"","ModifyDate":""},
                editFormOptions: [[{"dataKey":"pz","title":"品种","required":true,"field":"Variety","colSize":12,"type":"select"}],
                              [{"dataKey":"age","title":"月龄","required":true,"field":"AgeRange","colSize":12,"type":"select"}],
                              [{"dataKey":"city","title":"城市","required":true,"field":"City","colSize":12,"type":"select"}],
                              [{"title":"成交均价","required":true,"field":"AvgPrice","colSize":12,"type":"decimal"}],
                              [{"title":"成交日期","required":true,"field":"Date","colSize":12,"type":"date"}],
                              [{"dataKey":"top","title":"是否推荐价格","required":true,"field":"IsTop","colSize":12,"type":"select"}],
                              [{"title":"创建人","field":"Creator","disabled":true},
                               {"title":"创建时间","field":"CreateDate","disabled":true}],
                              [{"title":"修改人","field":"Modifier","disabled":true},
                               {"title":"修改时间","field":"ModifyDate","disabled":true}]],
                searchFormFileds: {"Variety":"","AgeRange":"","City":"","Date":"","IsTop":"","Enable":""},
                searchFormOptions: [[{"dataKey":"pz","title":"品种","field":"Variety","type":"drop"},{"dataKey":"age","title":"月龄","field":"AgeRange","type":"dropList"},{"dataKey":"city","title":"城市","field":"City","type":"dropList"}],[{"title":"成交日期","field":"Date","type":"datetime"},{"dataKey":"top","title":"是否推荐价格","field":"IsTop","type":"drop"},{"dataKey":"enable","title":"是否启用","field":"Enable","type":"drop"}]],
                columns: [{field:'Id',title:'主键ID',type:'int',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'Variety',title:'品种',type:'string',bind:{ key:'pz',data:[]},width:90,require:true,align:'left',sortable:true},
                       {field:'AgeRange',title:'月龄',type:'string',bind:{ key:'age',data:[]},width:90,require:true,align:'left'},
                       {field:'City',title:'城市',type:'string',bind:{ key:'city',data:[]},width:90,require:true,align:'left'},
                       {field:'AvgPrice',title:'成交均价',type:'decimal',link:true,width:80,require:true,align:'left'},
                       {field:'Date',title:'成交日期',type:'datetime',width:90,require:true,align:'left',sortable:true},
                       {field:'IsTop',title:'是否推荐价格',type:'int',bind:{ key:'top',data:[]},width:90,require:true,align:'left'},
                       {field:'Enable',title:'是否启用',type:'byte',bind:{ key:'enable',data:[]},width:90,hidden:true,align:'left'},
                       {field:'CreateID',title:'创建人Id',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:130,readonly:true,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:90,readonly:true,align:'left',sortable:true},
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
