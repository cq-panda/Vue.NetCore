<!--
 *Author：jxx
 *Date：{Date}
 *Contact：283591387@qq.com
 *业务请在@/extension/mes/mes/MES_Bom_Detail.jsx或MES_Bom_Detail.vue文件编写
 *新版本支持vue或【表.jsx]文件编写业务,文档见:https://v3.volcore.xyz/docs/view-grid、https://v3.volcore.xyz/docs/web
 -->
<template>
    <view-grid ref="grid" :columns="columns" :detail="detail" :details="details" :editFormFields="editFormFields"
        :editFormOptions="editFormOptions" :searchFormFields="searchFormFields" :searchFormOptions="searchFormOptions"
        :table="table" :extend="extend" :onInit="onInit" :onInited="onInited" :searchBefore="searchBefore"
        :searchAfter="searchAfter" :addBefore="addBefore" :updateBefore="updateBefore" :rowClick="rowClick"
        :modelOpenBefore="modelOpenBefore" :modelOpenAfter="modelOpenAfter">
        <!-- 自定义组件数据槽扩展，更多数据槽slot见文档 -->
        <template #gridHeader>
        </template>
    </view-grid>
</template>
<script setup lang="jsx">
import extend from "@/extension/mes/mes/MES_Bom_Detail.jsx";
import viewOptions from './MES_Bom_Detail/options.js'
import { ref, reactive, getCurrentInstance, watch, onMounted } from "vue";
const grid = ref(null);
const { proxy } = getCurrentInstance()
//http请求，proxy.http.post/get
const { table, editFormFields, editFormOptions, searchFormFields, searchFormOptions, columns, detail, details } = reactive(viewOptions())

let gridRef;//对应[表.jsx]文件中this.使用方式一样
//生成对象属性初始化
const onInit = async ($vm) => {
    gridRef = $vm;
    //默认不加载数据
    gridRef.load = false
}
//隐藏高级查询按钮
const onInited = async () => {
    gridRef.height = 200;
    gridRef.buttons.forEach(x => {
        if (x.name == '高级查询') {
            x.hidden = true;
        }
    })
}
const searchBefore = async (param) => {
    //界面查询前,可以给param.wheres添加查询参数
    //返回false，则不会执行查询
    const bomRows = getBomSelectRow();
    if (!bomRows.length) {
        proxy.$message.error('请先选择【制造BOM】数据')
        return false;
    }
    //查询前获取bom的id，查询明细表
    param.wheres.push({ name: "BomId", value: bomRows[0].BomId })
    return true;
}
const searchAfter = async (rows, result) => {
    return true;
}
const addBefore = async (formData) => {
    //明细表新建前获取【制造bom】选中的主键BomId值(若不获取，写入的明细表数据无法知道属于哪个nom)
    const BomId = getBomSelectRow()[0].BomId;
    formData.mainData['BomId'] = BomId
    return true;
}
const updateBefore = async (formData) => {
    //编辑保存前formData为对象，包括明细表、删除行的Id
    return true;
}
const rowClick = ({ row, column, event }) => {
    //查询界面点击行事件
}
//获取MES_Bom_Main.vue中缓存的方法，读取bom主表选中的行，保存数据时可以知道是哪条bom数据的明细
const getBomSelectRow = () => {
    const fn = proxy.base.getItem('getBomSelectRow');
    return fn();
}
const modelOpenBefore = async (row) => {//弹出框打开后方法
    //获取MES_Bom_Main.vue中缓存的方法，读取bom主表选中的行，保存数据时可以知道是哪条bom数据的明细
    const bomRows = getBomSelectRow();
    if (!bomRows.length) {
        proxy.$message.error('请先选择【制造BOM】数据')
        return false;
    }
    return true;//返回false，不会打开弹出框
}
const modelOpenAfter = (row) => {
    //弹出框打开后方法,设置表单默认值,按钮操作等
}
//监听表单输入，做实时计算
//watch(() => editFormFields.字段,(newValue, oldValue) => {	})
//对外暴露数据
defineExpose({})
</script>
