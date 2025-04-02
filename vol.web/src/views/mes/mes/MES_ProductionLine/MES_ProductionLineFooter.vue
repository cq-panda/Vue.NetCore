<template>
    <div style="padding: 0 4px;border-top: 10px solid #eee;">
        <vol-title style="padding: 10px;" title="产线设备"></vol-title>
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
    return callback(true);
}
const tableRef = ref();
const gridRowClick = (row) => { //主表点击行加载明细表
    //load方法可参照voltable组件api文档
    tableRef.value?.load({ value: row.ProductionLineID, sort: "CreateDate" })
}

const url = ref('api/MES_ProductionLine/getDetailPage')//指定从某个接口获取table数据
//更多table配置见文档：http://v3.volcore.xyz/table
//明细表格配置，从生成的vue文件中可以复制过来
const columns = reactive([{ field: 'DeviceID', title: '设备ID', type: 'string', width: 90, hidden: true, readonly: true,  align: 'left' },
{ field: 'DeviceName', title: '设备名称', type: 'string', width: 90, edit: { type: '' },  align: 'left' },
{ field: 'DeviceModel', title: '设备型号', type: 'string', width: 90, edit: { type: '' }, align: 'left' },
{ field: 'Manufacturer', title: '制造商', type: 'string', width: 90, edit: { type: '' }, align: 'left' },
{ field: 'PurchaseDate', title: '购买日期', type: 'date', width: 90, edit: { type: 'date' }, align: 'left' },
{ field: 'WarrantyDate', title: '保修日期', type: 'date', width: 90, edit: { type: 'date' }, align: 'left' },
{ field: 'Status', title: '设备状态', type: 'string', width: 90, edit: { type: '' }, align: 'left' },
{ field: 'LocationOnLine', title: '线上位置', type: 'string', width: 90, hidden: true, edit: { type: '' }, align: 'left' },
{ field: 'Remarks', title: '备注信息', type: 'string', width: 90, edit: { type: '' }, align: 'left' },
{ field: 'CreateID', title: '创建人ID', type: 'int', width: 90, hidden: true, align: 'left' },
{ field: 'Creator', title: '创建人', type: 'string', width: 90, align: 'left' },
{ field: 'CreateDate', title: '创建时间', type: 'datetime', width: 120, align: 'left' }])

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
