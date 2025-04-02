<!--
 *Author：jxx
 *Date：{Date}
 *Contact：283591387@qq.com
 *业务请在@/extension/mes/mes/MES_Bom_Main.jsx或MES_Bom_Main.vue文件编写
 *新版本支持vue或【表.jsx]文件编写业务,文档见:https://v3.volcore.xyz/docs/view-grid、https://v3.volcore.xyz/docs/web
 -->
<template>
  <view-grid ref="grid" :columns="columns" :detail="detail" :details="details" :editFormFields="editFormFields"
    :editFormOptions="editFormOptions" :searchFormFields="searchFormFields" :searchFormOptions="searchFormOptions"
    :table="table" :extend="extend" :onInit="onInit" :onInited="onInited" :searchBefore="searchBefore"
    :searchAfter="searchAfter" :addBefore="addBefore" :updateBefore="updateBefore" :rowClick="rowClick"
    :modelOpenBefore="modelOpenBefore" :modelOpenAfter="modelOpenAfter" :detailSortEnd="detailSortEnd">
    <!-- 自定义组件数据槽扩展，更多数据槽slot见文档 -->
    <template #gridHeader> </template>
    <template #gridFooter>
      <div class="bom-detail">
        <bom-detail ref="bomDetailRef"></bom-detail>
      </div>
    </template>
    <template #modelBody>
      <el-alert style="margin-bottom: -1px" title="可拖动明细表对【序号】自动完成排序" class="alert-primary"
        :closable="false"></el-alert>
    </template>
  </view-grid>
</template>
<script setup lang="jsx">
import bomDetail from './MES_Bom_Detail.vue'
import extend from '@/extension/mes/mes/MES_Bom_Main.jsx'
import viewOptions from './MES_Bom_Main/options.js'
import { ref, reactive, getCurrentInstance, watch, onMounted } from 'vue'
const grid = ref(null)
const { proxy } = getCurrentInstance()
//http请求，proxy.http.post/get
const {
  table,
  editFormFields,
  editFormOptions,
  searchFormFields,
  searchFormOptions,
  columns,
  detail,
  details
} = reactive(viewOptions())

const bomDetailRef = ref();
let gridRef //对应[表.jsx]文件中this.使用方式一样
//生成对象属性初始化
const onInit = async ($vm) => {
  gridRef = $vm

  //缓存主表方法，返回主表选中的行，在下面的bom明细表[MES_Bom_Detail]中会调用
  proxy.base.setItem('getBomSelectRow', () => {
    return gridRef.getTable(true).getSelected();
  })

  //设置弹出框编辑宽度
  gridRef.boxOptions.width = 1100
  //启用明细表排序
  gridRef.detailOptions.sortable = true

  gridRef.detailOptions.pagination.sortName = "Sequence";  //明细表排序字字段
  gridRef.detailOptions.pagination.order = "asc"; //明细表排序方式desc或者asc
}
//生成对象属性初始化后,操作明细表配置用到
const onInited = async () => {
  gridRef.height = gridRef.height - 310;
  if (gridRef.height < 200) {
    gridRef.height = 200;
  }
}
const searchBefore = async (param) => {
  //界面查询前,可以给param.wheres添加查询参数
  //返回false，则不会执行查询
  return true
}
const searchAfter = async (rows, result) => {
  return true
}
const addBefore = async (formData) => {
  //新建保存前formData为对象，包括明细表，可以给给表单设置值，自己输出看formData的值
  return true
}
const updateBefore = async (formData) => {
  //编辑保存前formData为对象，包括明细表、删除行的Id
  return true
}
const rowClick = ({ row, column, event }) => {
  //点击行清除选中的行(用于下面明细表判断)
  grid.value.clearSelection();
  //点击行默认选中
  grid.value.toggleRowSelection(row); //单击行时选中当前行;
  //加载明细表
  bomDetailRef.value.$refs.grid.search();
}
const modelOpenBefore = async (row) => {
  //弹出框打开后方法
  return true //返回false，不会打开弹出框
}
const modelOpenAfter = (row) => {
  //弹出框打开后方法,设置表单默认值,按钮操作等
}
const detailSortEnd = (rows, newIndex, oldIndex, table) => {
  rows.forEach((x, index) => {
    x.Sequence = index + 1
  })
}
//监听表单输入，做实时计算
//watch(() => editFormFields.字段,(newValue, oldValue) => {	})
//对外暴露数据
defineExpose({})
</script>
<style lang="less" scoped>
.bom-detail {
  margin-top: 13px;
  border-top: 7px solid #eee;
}
</style>
