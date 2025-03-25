<!--
*Author：jxx
 *Contact：283591387@qq.com
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *业务请在@/extension/system/Sys_DictionaryList.js此处编写
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
    import extend from "@/extension/system/Sys_DictionaryList.js";
    var vueParam = {
        data() {
            return {
                table: {
                    key: 'DicList_ID',
                    footer: "Foots",
                    cnName: '字典明细',
                    name: 'Sys_DictionaryList',
                    url: "/Sys_DictionaryList/",
                    sortName: "DicList_ID"
                },
                extend: extend,
                editFormFields: {"DicValue":"","DicName":"","OrderNo":"","Remark":"","Enable":""},
                editFormOptions: [[{"columnType":"string","title":"数据源Value","field":"DicValue","type":"text"},
                               {"columnType":"string","title":"数据源Text","field":"DicName","type":"text"},
                               {"columnType":"int","title":"排序号","field":"OrderNo","type":"text"},
                               {"columnType":"int","title":"备注","field":"Remark","type":"text"},
                               {"columnType":"byte","dataKey":"enable","title":"是否可用","field":"Enable","type":"switch"}]],
                searchFormFields: {},
                searchFormOptions: [],
                columns: [{field:'DicList_ID',title:'DicList_ID',type:'int',width:90,hidden:true,readonly:true,require:true,align:'left'},
                       {field:'Dic_ID',title:'数据源ID',type:'int',width:90,readonly:true,align:'left',sortable:true},
                       {field:'DicValue',title:'数据源Value',type:'string',width:90,align:'left'},
                       {field:'DicName',title:'数据源Text',type:'string',width:90,align:'left'},
                       {field:'OrderNo',title:'排序号',type:'int',width:90,align:'left'},
                       {field:'Remark',title:'备注',type:'int',width:90,align:'left'},
                       {field:'Enable',title:'是否可用',type:'byte',bind:{ key:'enable',data:[]},width:90,align:'left'},
                       {field:'CreateID',title:'CreateID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Creator',title:'创建人',type:'string',width:130,readonly:true,align:'left'},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:90,readonly:true,align:'left',sortable:true},
                       {field:'ModifyID',title:'ModifyID',type:'int',width:90,hidden:true,align:'left'},
                       {field:'Modifier',title:'修改人',type:'string',width:130,align:'left'},
                       {field:'ModifyDate',title:'修改时间',type:'datetime',width:90,align:'left',sortable:true}],
                detail: {
                    cnName:"#detailCnName",
                    columns: [],
                    sortName: "#detailSortName"
                }
            };
        }
    };
    export default vueParam;
</script>
