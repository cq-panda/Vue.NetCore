<!--
 *Author：jxx
 *Date：{Date}
 *Contact：283591387@qq.com
 *业务请在@/extension/sys/system/Sys_User.jsx或Sys_User.vue文件编写
 *新版本支持vue或【表.jsx]文件编写业务,文档见:https://v3.volcore.xyz/docs/view-grid、https://v3.volcore.xyz/docs/web
 -->
<template>
  <view-grid ref="grid" :columns="columns" :detail="detail" :details="details" :editFormFields="editFormFields"
    :editFormOptions="editFormOptions" :searchFormFields="searchFormFields" :searchFormOptions="searchFormOptions"
    :table="table" :extend="extend" :onInit="onInit" :onInited="onInited" :searchBefore="searchBefore"
    :searchAfter="searchAfter" :addBefore="addBefore" :addAfter="addAfter" :updateBefore="updateBefore"
    :rowClick="rowClick" :modelOpenBefore="modelOpenBefore" :modelOpenAfter="modelOpenAfter">
    <!-- 自定义组件数据槽扩展，更多数据槽slot见文档 -->
    <template #gridHeader>
    </template>
 
  </view-grid>
  <UserModifyPwd ref="pwdRef"></UserModifyPwd>
</template>
<script setup lang="jsx">
import extend from "@/extension/sys/system/Sys_User.jsx";
import viewOptions from './Sys_User/options.js'
import UserModifyPwd from './Sys_User/UserModifyPwd.vue'
import { ref, reactive, getCurrentInstance, watch, onMounted } from "vue";
const grid = ref(null);
const { proxy } = getCurrentInstance()
//http请求，proxy.http.post/get
const { table, editFormFields, editFormOptions, searchFormFields, searchFormOptions, columns, detail, details } = reactive(viewOptions())
const pwdRef = ref();

let gridRef;//对应[表.jsx]文件中this.使用方式一样
//生成对象属性初始化
const onInit = async ($vm) => {
  gridRef = $vm;
  gridRef.boxOptions.width=650;
  initAction();

}
//生成对象属性初始化后,操作明细表配置用到
const onInited = async () => {
}
const searchBefore = async (param) => {
  //界面查询前,可以给param.wheres添加查询参数
  //返回false，则不会执行查询
  return true;
}
const searchAfter = async (rows, result) => {
  return true;
}
const addBefore = async (formData) => {
  //新建保存前formData为对象，包括明细表，可以给给表单设置值，自己输出看formData的值
  return true;
}
const addAfter = (result) => {
  //用户新建后，显示随机生成的密码
  if (!result.status) {
    return true
  }
  //显示新建用户的密码
  //2020.08.28优化新建成后提示方式
  proxy.$confirm(result.message, proxy.$ts('新建用户成功'), {
    confirmButtonText: proxy.$ts('确定'),
    cancelButtonText: proxy.$ts('取消'),
    type: 'success',
    center: true
  }).then(() => { })

  return false
}
const updateBefore = async (formData) => {
  //编辑保存前formData为对象，包括明细表、删除行的Id
  return true;
}
const rowClick = ({ row, column, event }) => {
  //查询界面点击行事件
  // grid.value.toggleRowSelection(row); //单击行时选中当前行;
}
const modelOpenBefore = async (row) => {//弹出框打开后方法
  return true;//返回false，不会打开弹出框
}
const modelOpenAfter = (row) => {
  //弹出框打开后方法,设置表单默认值,按钮操作等

  //点击弹出框后，如果是编辑状态，禁止编辑用户名，如果新建状态，将用户名字段设置为可编辑
  let isEDIT = gridRef.currentAction != 'Add'
  editFormOptions.forEach((item) => {
    item.forEach((x) => {
      if (x.field == 'UserName') {
        x.disabled = isEDIT
      }
    })
    //不是新建，性别默认值设置为男
    if (!isEDIT) {
      editFormFields.Gender = 0
    }
  })
}


const initAction = () => {
  let hasPwd = gridRef.buttons.some((x) => {
    return x.value == 'Add' || x.value == 'Update'
  })

  let hasDel = gridRef.buttons.some((x) => {
    return x.value == 'Delete'
  })
  gridRef.columns.push({
    title: '操作',
    hidden: false,
    align: 'center',
    fixed: 'right',
    width: 110,
    render: (h, { row, column, index }) => {
      return h(
        <div>
          {hasPwd ? (
            <el-button
              onClick={($e) => {
                pwdRef.value.open(row)
              }}
              type="primary"
              link
              icon="Unlock"
            ></el-button>
          ) : (
            ''
          )}
          <el-button
            onClick={($e) => {
              gridRef.edit(row)
            }}
            type="success"
            link
            icon="Edit"
          ></el-button>
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

defineExpose({})
</script>
