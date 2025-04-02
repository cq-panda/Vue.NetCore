<!--
 *Author：jxx
 *Date：{Date}
 *Contact：283591387@qq.com
 *业务请在@/extension/mes/mes/MES_Process.jsx或MES_Process.vue文件编写
 *新版本支持vue或【表.jsx]文件编写业务,文档见:https://v3.volcore.xyz/docs/view-grid、https://v3.volcore.xyz/docs/web
 -->
<template>
  <view-grid
    ref="grid"
    :columns="columns"
    :detail="detail"
    :details="details"
    :editFormFields="editFormFields"
    :editFormOptions="editFormOptions"
    :searchFormFields="searchFormFields"
    :searchFormOptions="searchFormOptions"
    :table="table"
    :extend="extend"
    :onInit="onInit"
    :onInited="onInited"
    :searchBefore="searchBefore"
    :searchAfter="searchAfter"
    :addBefore="addBefore"
    :updateBefore="updateBefore"
    :rowClick="rowClick"
    :modelOpenBefore="modelOpenBefore"
    :modelOpenAfter="modelOpenAfter"
    :detailSortEnd="detailSortEnd"
  >
    <!-- 自定义组件数据槽扩展，更多数据槽slot见文档 -->
    <template #gridHeader> </template>
    <template #modelBody>
      <el-alert
        style="margin-bottom: -1px"
        title="可拖动明细表对【路线顺序】排序"
        class="alert-primary"
        :closable="false"
      ></el-alert>
    </template>
    <template #gridFooter>
      <grid-footer ref="footerRef"></grid-footer>
    </template>
  </view-grid>
</template>
<script setup lang="jsx">
import gridFooter from './MES_Process/MES_ProcessFooter.vue'
import extend from '@/extension/mes/mes/MES_Process.jsx'
import viewOptions from './MES_Process/options.js'
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

detail.columns.forEach((x) => {
  if (x.link) {
    x.link = false
  }
})
let gridRef //对应[表.jsx]文件中this.使用方式一样
//生成对象属性初始化
const onInit = async ($vm) => {
  gridRef = $vm
  //启用明细表排序
  gridRef.detailOptions.sortable = true

  gridRef.pagination.sortName = 'ProcessSequence' //设置排序字段,多个字段排序用逗号隔开,如:a,b,c
  gridRef.pagination.order = 'asc' //排序方式desc或者asc
  gridRef.detailOptions.pagination.sortName = 'RouteDescription' //明细表排序字字段
  gridRef.detailOptions.pagination.order = 'asc' //明细表排序方式desc或者asc

  //与jsx中的this.xx使用一样，只需将this.xx改为gridRef.xx
  //更多属性见：https://v3.volcore.xyz/docs/view-grid
}
//生成对象属性初始化后,操作明细表配置用到
const onInited = async () => {
  gridRef.height = gridRef.height - 280
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
const footerRef = ref()
//查询界面点击行事件,加载明细表数据
const rowClick = ({ row, column, event }) => {
  // grid.value.toggleRowSelection(row); //单击行时选中当前行;
  footerRef.value.gridRowClick(row)
}
const modelOpenBefore = async (row) => {
  //弹出框打开后方法
  return true //返回false，不会打开弹出框
}
const modelOpenAfter = (row) => {
  //弹出框打开后方法,设置表单默认值,按钮操作等
}
//明细表拖动排序
const detailSortEnd = (rows, newIndex, oldIndex, table) => {
  rows.forEach((x, index) => {
    x.RouteSequence = index + 1
  })
}
//监听表单输入，做实时计算
//watch(() => editFormFields.字段,(newValue, oldValue) => {	})
//对外暴露数据
defineExpose({})
</script>
