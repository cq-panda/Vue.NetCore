<!--
 *Author：jxx
 *Date：{Date}
 *Contact：283591387@qq.com
 *业务请在@/extension/mes/mes/MES_ProductionOrder.jsx或MES_ProductionOrder.vue文件编写
 *新版本支持vue或【表.jsx]文件编写业务,文档见:https://v3.volcore.xyz/docs/view-grid、https://v3.volcore.xyz/docs/web
 -->
<template>
  <div class="grid">
    <view-grid ref="grid" :columns="columns" :detail="detail" :details="details" :editFormFields="editFormFields"
      :editFormOptions="editFormOptions" :searchFormFields="searchFormFields" :searchFormOptions="searchFormOptions"
      :table="table" :extend="extend" :onInit="onInit" :onInited="onInited" :searchBefore="searchBefore"
      :searchAfter="searchAfter" :addBefore="addBefore" :updateBefore="updateBefore" :rowClick="rowClick"
      :modelOpenBefore="modelOpenBefore" :modelOpenAfter="modelOpenAfter">
      <!-- 自定义组件数据槽扩展，更多数据槽slot见文档 -->
      <template #gridHeader>
      </template>
      <template #modelBody>
        <el-alert style="margin-bottom: -1px;" title="只需简单配置，明细表订单数量输入即可实时计算表单的数量" class="alert-primary"
          :closable="false"></el-alert>
      </template>
      <template #gridFooter>
        <order-footer ref="footerRef"></order-footer>
      </template>
    </view-grid>
  </div>

  <select-material ref="materialRef" @onSelect="onSelect"></select-material>
</template>
<script setup lang="jsx">
import orderFooter from './MES_ProductionOrder/MES_ProductionOrderFooter.vue'
import SelectMaterial from './MES_ProductionOrder/SelectMaterial.vue'
import extend from '@/extension/mes/mes/MES_ProductionOrder.jsx'
import viewOptions from './MES_ProductionOrder/options.js'
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

//方式1：明细表：物料编号下拉框选择给其他字段设置值
detail.columns.forEach((item) => {
  if (item.field == 'MaterialCode') {
    item.onChange = (row) => {
      //查找数据源，数据字典维护的sql,已经返回了其他字段的值，或者这里通过proy.http调用接口返回数据
      const dic =
        item.bind.data.find((x) => {
          return x.key == row.MaterialCode
        }) || {}
      row.MaterialName = dic.value
      row.MaterialSpecification = dic.Specification
      row.Unit = dic.Unit
    }
  } else if (item.field == 'PlanQuantity') {//设置明细表输时实时计算给表单设置值
    item.summary = true;
    //明细表订单数量输入时给主表的订单数量设置合计值
    item.summaryFormatter = (qtyValue, column, rows, summaryArrData) => {
      //明细表输入或者值变化后给表单字段设置值
      editFormFields.OrderQty = qtyValue
      //这里的return qtyValue一定要写上,自定义返回格式,return qtyValue+'件'
      return qtyValue + '件'
    }
  }
})

//设置主表合计字段
columns.forEach(x => {
  if (x.field == 'OrderQty') {
    x.summary = true;
  }
})

columns.splice(7,1,{
  field: "工序生产进度",
  title: "工序生产进度",
  align: "left",
  width: 200,
  render: (h, { row, column, index }) => {
    //量多步骤条属性见：https://element-plus.org/zh-CN/component/steps.html
    return (
      //可以根据row的值动态生成步骤信息
      <el-steps style="padding:10px 0" active={index + 1}>
        {[
          { title: "建模", desc: "建模建模建模" },
          { title: "冲压", desc: "冲压冲压冲压" },
          { title: "焊接", desc: "焊接焊接焊接" },
          { title: "涂装", desc: "涂装涂装涂装" },
          { title: "总装", desc: "总装总装总装" },
        ].map((c) => {
          return <el-step>
            {{ title: () => { return <span style="font-size:12px">{c.title}</span> } }}
          </el-step>

        })}
      </el-steps>
    );
  },
})

columns.splice(8,1,{
  field: "任务进度",
  title: "任务进度",
  align: "left",
  width: 150,
  render: (h, { row, column, index }) => {
    //更多步骤条属性见：https://element-plus.org/zh-CN/component/steps.html
    return <div>
      <el-progress
      stroke-width={6}
      color="#409eff"
      show-text={false}
      percentage={80} />  <div>80%/({row.OrderQty})</div></div>

  }
})

const materialRef = ref()

let gridRef //对应[表.jsx]文件中this.使用方式一样
//生成对象属性初始化
const onInit = async ($vm) => {
  gridRef = $vm
  //方式2：通过弹出框选择数据
  gridRef.detailOptions.buttons.unshift({
    name: '选择物料', //按钮名称
    icon: 'el-icon-plus', //按钮图标，参照iview图标
    hidden: false, //是否隐藏按钮(如果想要隐藏按钮，在onInited方法中遍历buttons，设置hidden=true)
    onClick: () => {
      //触发事件
      materialRef.value.open()
    }
  })
}
//选择数据回调
const onSelect = (rows) => {
  //转换数据格式与当前明细表字段一致
  rows = rows.map((c) => {
    return {
      MaterialName: c.MaterialName,
      MaterialCode: c.MaterialCode,
      MaterialSpecification: c.Specification,
      Unit: c.Unit
    }
  })
  //写入明细表
  gridRef.getTable().rowData.unshift(...rows)
}

//生成对象属性初始化后,操作明细表配置用到
const onInited = async () => {
  //设置弹出框宽度
  gridRef.boxOptions.width = 1000
  //设置表格高度
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
  //查询界面点击行事件
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
//监听表单输入，做实时计算
//watch(() => editFormFields.字段,(newValue, oldValue) => {	})
//对外暴露数据
defineExpose({})
</script>
<style lang="less">
.grid .el-step__title {
  line-height: 22px !important;
}
</style>