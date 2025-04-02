<!--
 *Author：jxx
 *Date：{Date}
 *Contact：283591387@qq.com
 *业务请在@/extension/mes/mes/MES_MaterialCatalog.jsx或MES_MaterialCatalog.vue文件编写
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
    :addAfter="addAfter"
    :updateAfter="updateAfter"
    :delAfter="delAfter"
    :rowClick="rowClick"
    :modelOpenBefore="modelOpenBefore"
    :modelOpenAfter="modelOpenAfter"
  >
    <!-- 自定义组件数据槽扩展，更多数据槽slot见文档 -->
    <template #gridHeader> </template>
  </view-grid>
</template>
<script setup lang="jsx">

import extend from '@/extension/mes/mes/MES_MaterialCatalog.jsx'
import viewOptions from './MES_MaterialCatalog/options.js'
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

let gridRef //对应[表.jsx]文件中this.使用方式一样
//生成对象属性初始化
const onInit = async ($vm) => {
  gridRef = $vm
  gridRef.queryFields=['CatalogName','CatalogCode','Enable']
  //开启树形结构
  gridRef.paginationHide = false
  gridRef.lazy = false
  //树形结点的id字段
  gridRef.rowKey = 'CatalogID'
  //父级id字段
  gridRef.rowParentField = 'ParentId'

}
let addCurrnetRow
//生成对象属性初始化后,操作明细表配置用到
const onInited = async () => {
  //绑定表格操作按钮
  let hasUpdate, hasDel, hasAdd
  gridRef.buttons.forEach((x) => {
    if (x.value == 'Update') {
      x.hidden = true
      hasUpdate = true
    } else if (x.value == 'Delete') {
      hasDel = true
      x.hidden = true //隐藏按钮
    } else if (x.value == 'Add') {
      x.type = 'primary'
      hasAdd = true
    }
  })
  if (!(hasUpdate || hasDel || hasAdd)) {
    return
  }
  gridRef.columns.push({
    title: '操作',
    field: '操作',
    width: 100,
    fixed: 'right',
    align: 'center',
    render: (h, { row, column, index }) => {
      return (
        <div>
          {hasAdd ? (
            <el-button
              onClick={($e) => {
                addCurrnetRow = row
                gridRef.add()
              }}
              type="primary"
              link
              icon="Plus"
            ></el-button>
          ) : (
            ''
          )}
          {hasUpdate ? (
            <el-button
              onClick={($e) => {
                gridRef.edit(row)
              }}
              type="success"
              link
              icon="Edit"
            ></el-button>
          ) : (
            ''
          )}
          {hasDel ? (
            <el-button
              link
              onClick={($e) => {
                gridRef.del(row)
              }}
              type="danger"
              icon="Delete"
            ></el-button>
          ) : (
            ''
          )}
        </div>
      )
    }
  })
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
  //查询界面点击行事件
  // grid.value.toggleRowSelection(row); //单击行时选中当前行;
}
const modelOpenBefore = async (row) => {
  //弹出框打开后方法
  return true //返回false，不会打开弹出框
}
const modelOpenAfter = (row) => {
  //弹出框打开后方法,设置表单默认值,按钮操作等
  //点击行上的添加按钮事件
  if (addCurrnetRow) {
    //获取当前组织构架的所有父级id,用于设置新建时父级id的默认值
    //获取数据数据源
    let data = []
    editFormOptions.forEach((options) => {
      options.forEach((option) => {
        if (option.field == 'ParentId') {
          data = option.orginData
        }
      })
    })
    let parentIds = proxy.base.getTreeAllParent(addCurrnetRow.CatalogID, data).map((x) => {
      return x.id
    })
    //设置编辑表单上级组织的默认值
    editFormFields.ParentId = parentIds
    addCurrnetRow = null
  }
}
//刷新字典
const addAfter = () => {
  gridRef.initDicKeys()
  return true
}
const updateAfter = () => {
  gridRef.initDicKeys()
  return true
}
const delAfter = () => {
  gridRef.initDicKeys()
  return true
}

//监听表单输入，做实时计算
//watch(() => editFormFields.字段,(newValue, oldValue) => {	})
//对外暴露数据
defineExpose({})
</script>
