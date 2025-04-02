<!--
 *Author：jxx
 *Date：{Date}
 *Contact：283591387@qq.com
 *业务请在@/extension/mes/mes/MES_Material.jsx或MES_Material.vue文件编写
 *新版本支持vue或【表.jsx]文件编写业务,文档见:https://v3.volcore.xyz/docs/view-grid、https://v3.volcore.xyz/docs/web
 -->
<template>
  <div class="tree">
    <div class="left">
      <material-tree ref="treRef" @node-click="nodeClick"></material-tree>
    </div>
    <div class="right">
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
      >
        <!-- 自定义组件数据槽扩展，更多数据槽slot见文档 -->
        <template #gridHeader> </template>
      </view-grid>
    </div>
  </div>
</template>
<script setup lang="jsx">
import QrcodeVue from 'qrcode.vue'
import MaterialTree from './MES_Material/MES_MaterialTree.vue'
import extend from '@/extension/mes/mes/MES_Material.jsx'
import viewOptions from './MES_Material/options.js'
import { ref, reactive, getCurrentInstance, nextTick, watch, onMounted } from 'vue'
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

let gridRef //对应[表.jsx]文件中this.使用方式一样
//生成对象属性初始化
const onInit = async ($vm) => {
  gridRef = $vm
  gridRef.load=false;//设置默认不加载数据，左边树点击的时候加载
  //设置显示所有查询条件
  gridRef.setFixedSearchForm(true)
   
  //配置显示二维码
  gridRef.columns.splice(4, 1, {
    title: '物料二维码',
    field: '物料二维码',
    width: 100,
    align: 'center',
    tip: {
      text: '表格动态生成二维码'
    },
    render: (h, { row, column, index }) => {
      return (
        <div style="padding-top:4px">
          {' '}
          <QrcodeVue value={row.CatalogCode} size={40} />
        </div>
      )
    }
  })
}
//生成对象属性初始化后,操作明细表配置用到
const onInited = async () => {}

let catalogIds
let nodes
//左边树点击事件
const nodeClick = (ids, nodes) => {
  //左边树节点点击事件
  //左边树节点的甩有子节点，用于查询数据
  catalogIds = ids.join(',')
  //左侧树选中节点的所有父节点,用于新建时设置级联的默认值
  nodes = nodes
  nextTick(() => {
    //调用查询方法
    gridRef.search()
  })
}
//左边点击的时候，设置查询条件
const searchBefore = async (param) => {
  //界面查询前,可以给param.wheres添加查询参数
  //返回false，则不会执行查询
  if (catalogIds) {
    param.wheres.push({
      name: 'CatalogID', //查询分类字段，注意字段大小写
      value: catalogIds,
      displayType: 'selectList'
    })
  }
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
  //查询界面点击行事件
  // grid.value.toggleRowSelection(row); //单击行时选中当前行;
}
const modelOpenBefore = async (row) => {
  //弹出框打开后方法
  return true //返回false，不会打开弹出框
}
const modelOpenAfter = (row) => {
  //弹出框打开后方法,设置表单默认值,按钮操作等
}

defineExpose({})
</script>
<style scoped lang="less">
.tree {
  display: flex;
  .left {
    width: 200px;
  }
  .right {
    flex: 1;
    width: 0;
  }
}
</style>
