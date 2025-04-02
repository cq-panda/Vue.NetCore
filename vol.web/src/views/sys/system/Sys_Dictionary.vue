<!--
 *Author：jxx
 *Date：{Date}
 *Contact：283591387@qq.com
 *业务请在@/extension/sys/system/Sys_Dictionary.jsx或Sys_Dictionary.vue文件编写
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
    <template #gridBody>
      <el-alert type="success" :closable="false" style="margin-bottom: 10px"
        >所有功能数据源下拉框、级联请在此页面维护</el-alert
      >
    </template>
  </view-grid>
</template>
<script setup lang="jsx">
import extend from '@/extension/sys/system/Sys_Dictionary.jsx'
import viewOptions from './Sys_Dictionary/options.js'
import { ref, reactive, getCurrentInstance,  watch, onMounted } from 'vue'
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

let gridRef
//生成对象属性初始化
const onInit = async ($vm) => {
  gridRef = $vm
  initDb()
  gridRef.text = '表单、表格数据字典维护'
  //启用排序
  gridRef.detailOptions.sortable = true
  //保存后不关闭编辑框
  gridRef.continueAdd = true

  gridRef.paginationHide = true
  gridRef.lazy = false
  //   gridRef.defaultExpandAll = true
  //树形结点的id字段
  gridRef.rowKey = 'Dic_ID'
  //父级id字段
  gridRef.rowParentField = 'ParentId'

  gridRef.columns.forEach((x) => {
    if (x.field == 'ParentId' || x.field == 'OrderNo') {
      x.hidden = true
    }
  })
  initTableButtons()
  const parentOption = proxy.base.getFormOption(editFormOptions, 'ParentId')

  parentOption.required = false
  parentOption.type = 'cascader'
  parentOption.changeOnSelect = true
  parentOption.data = []
  parentOption.orginData = []
}
const getParentOption = () => {
  return proxy.base.getFormOption(editFormOptions, 'ParentId') || { data: [] }
}
//生成对象属性初始化后,操作明细表配置用到
const onInited = async () => {
  gridRef.detailOptions.pagination.sortName = 'OrderNo,CreateDate' //明细表排序字字段
  gridRef.detailOptions.pagination.order = 'desc' //明细表排序方式desc或者asc
  gridRef.detailOptions.columns.forEach((x) => {
    if (x.field == 'OrderNo') {
      x.tip = {
        text: '数据源按从大小到小降序排序,值越大越靠前显示'
      }
    }
  })
  gridRef.boxOptions.width = 1200
}
const searchBefore = async (param) => {
  //界面查询前,可以给param.wheres添加查询参数
  //返回false，则不会执行查询
  return true
}
let parentCascader
const searchAfter = async (rows, result) => {
  parentCascader = rows.map((x) => {
    return {
      id: x.Dic_ID,
      key: x.Dic_ID,
      label: x.DicName,
      value: x.Dic_ID,
      parentId: x.ParentId
    }
  })
  return true
}
const addBefore = async (formData) => {
  //新建保存前formData为对象，包括明细表，可以给给表单设置值，自己输出看formData的值
  return saveBefore(formData)
}
const updateBefore = async (formData) => {
  //编辑保存前formData为对象，包括明细表、删除行的Id
  return saveBefore(formData)
}
const saveBefore = (formData) => {
  if (!formData.mainData.ParentId) {
    formData.mainData.ParentId = 0
  } else {
    formData.mainData.ParentId = (formData.mainData.ParentId + '').split(',').pop()
  }
  if (
    editFormFields.DbSql &&
    (editFormFields.DbSql.indexOf('value') == -1 || editFormFields.DbSql.indexOf('key') == -1)
  ) {
    proxy.$message.error(
      'sql语句必须包括key/value字段,如:select orderType as key,orderName as value from order'
    )
    return false
  }
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
    initParentData()
  //弹出框打开后方法,设置表单默认值,按钮操作等
}

const initParentData = (rows) => {
  let data = parentCascader
  const option = gridRef.getFormOption('ParentId')
  option.orginData = data
  const treeData = proxy.base.convertTree(
    JSON.parse(JSON.stringify(data)),
    (node, item, isRoot) => {}
  )
  option.data = treeData
}

//明细表拖动排序
const detailSortEnd = (rows, newIndex, oldIndex, table) => {
  let orderNo = rows.length * 10
  rows.forEach((x) => {
    orderNo = orderNo - 10
    x.OrderNo = orderNo
  })
}
const addBtnClick = (row) => {
  grid.value.add()
}
defineExpose({})
const initDb = () => {
  const dbSqlOption = proxy.base.getFormOption(editFormOptions, 'DbSql')
  dbSqlOption.labelRender = (h, {}) => {
    return (
      <div>
        <el-popover placement="top-start" title="自定义sql数据源配置" width="720" trigger="hover">
          {{
            default: () => {
              return (
                <div>
                  <div style="font-size:12px;line-height:2">
                    1. 如果需要从数据库返回数据源sql为：SELECT key字段 as 'key',名称字段 as 'value'
                    FROM table{' '}
                  </div>
                  <div style="font-size:12px;line-height:2">
                    2. 如果是级联,数据源sql为： SELECT key字段 AS id,父级id字段 as parentId, key字段
                    AS 'key',名称字段 AS 'value' FROM table{' '}
                  </div>
                  <div style="font-size:12px;line-height:2">
                    3.
                    注意级联sql配置：id,parentId,key,value是必须的,返回的大小写与这几个字段必须一致{' '}
                  </div>
                  <div style="font-size:12px;line-height:2">
                    4.
                    如果需要根据用户信息加载数据源,这里正常配置sql,再修改后台DictionaryHandler.cs类GetCustomDBSql方法{' '}
                  </div>
                </div>
              )
            },
            reference: () => {
              return (
                <div style="color:#1598ff">
                  <span class="el-icon-warning-outline"></span> sql数据源
                </div>
              )
            }
          }}
        </el-popover>
      </div>
    )
  }
}
const initTableButtons = () => {
  columns.push({
    title: '操作',
    field: '操作',
    width: 100,
    fixed: 'right',
    align: 'center',
    render: (h, { row, column, index }) => {
      return (
        <div>
          <el-button
            onClick={($e) => {
              addBtnClick(row)
            }}
            type="primary"
            link
            icon="Plus"
          ></el-button>
          <el-button
            onClick={($e) => {
              gridRef.edit(row)
            }}
            type="success"
            link
            icon="Edit"
          ></el-button>
          <el-button
            link
            onClick={($e) => {
              gridRef.del(row)
            }}
            type="danger"
            icon="Delete"
          ></el-button>
        </div>
      )
    }
  })
}
</script>
