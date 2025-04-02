<template>
    <div style="padding: 0 4px;border-top: 10px solid #eee;">
        <vol-title style="padding: 10px;" title="订单明细"></vol-title>
        <!-- <h3>
            <i class="ivu-icon ivu-icon-ios-information-circle-outline"></i>订单明细
        </h3> -->
        <div style="padding:10px;background: white;padding-top: 0;">
            <!-- 更多table配置见文档：http://v3.volcore.xyz/table 或使用element plus原生table -->
            <vol-table ref="tableRef" :ck="false" :loadKey="true" :columns="columns" :pagination-hide="true"
                :height="230" :defaultLoadPage="false" @loadBefore="loadBefore" :url="url"
                :row-index="true"></vol-table>
        </div>
    </div>
</template>

<script setup>
import { reactive, ref } from 'vue';
const loadBefore = (params, callback) => {//表格数据加载时触发
    //更多table配置见文档：http://v3.volcore.xyz/table
    //   这里也可以设置一些查询条件
    params.order='asc'
    return callback(true);
}
const tableRef = ref();
const gridRowClick = (row) => { //主表点击行加载明细表
    //load方法可参照voltable组件api文档
    //根据主表id查询明细表
    tableRef.value?.load({ value: row.OrderID })
}

const url = ref('api/MES_ProductionOrder/getDetailPage')//指定从某个接口获取table数据
//更多table配置见文档：http://v3.volcore.xyz/table
//明细表格配置，从生成的vue文件中可以复制过来
const columns = reactive([{field:'PlanDetailID',title:'计划明细ID',type:'string',width:90,hidden:true},
                       {field:'OrderID',title:'订单ID',type:'string',width:90,hidden:true},
                       {field:'MaterialCode',title:'物料编码',width:90},
                       {field:'MaterialName',title:'物料名称',type:'string',width:90},
                       {field:'MaterialSpecification',title:'物料规格',type:'string',width:110},
                       {field:'Unit',title:'单位',type:'string',bind:{ key:'物料单位',data:[]},width:80},
                       {field:'PlanQuantity',title:'订单数量',type:'int',summary:true},
                       {field:'Creator',title:'创建人',type:'string',width:90},
                       {field:'CreateDate',title:'创建时间',type:'datetime',width:150}])

defineExpose({ gridRowClick })
</script>
<style scoped>
h3 {
    font-weight: 500;
    padding-left: 10px;
    background: white;
    margin-top: 8px;
    padding-bottom: 5px;
}
</style>
