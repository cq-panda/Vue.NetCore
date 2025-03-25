<template>
  <vol-box :lazy="true" v-model="model" title="选择物料" :width="900" :padding="0">
    <div>
      <!-- 搜索配置 -->
      <div class="search-form">
        <label>物料名称：</label>
        <el-input style="width: 120px" v-model="MaterialName"></el-input>
        <label style="margin-left: 10px">物料编号：</label>
        <el-input style="width: 120px" v-model="MaterialCode"></el-input>
        <el-button size="small" type="primary" @click="search">搜索</el-button>
      </div>
      <!-- 表格数据 -->
      <vol-table
        ref="tableRef"
        :loadKey="true"
        :columns="columns"
        :pagination-hide="false"
        :height="370"
        :url="url"
        @loadBefore="loadBefore"
      ></vol-table>
    </div>
    <template #footer>
      <el-button type="primary" @click="detailSelectClick" size="small">选择数据</el-button>
    </template>
  </vol-box>
</template>
<script setup>
import { ref, nextTick, getCurrentInstance } from 'vue'
const { proxy } = getCurrentInstance()
const tableRef = ref()
const model = ref(false)
//调用的接口地址,这里使用的生成页面的接口，也可以参照：组件示例->table组件中自定义配置
const url = ref('api/MES_Material/getPageData')
const MaterialCode = ref('') //物料编码
const MaterialName = ref('') //物料名称

//表格配置(可以将生成vue文件中columns配置复制过来)
const columns = ref([
  { field: 'MaterialCode', title: '物料编码', type: 'string', width: 120 },
  { field: 'MaterialName', title: '物料名称', type: 'string', width: 90 },
  { field: 'Img', title: '物料图片', type: 'img', width: 80 },
  { field: 'Specification', title: '规格型号', type: 'string', width: 110 },
  {
    field: 'Unit',
    title: '单位',
    type: 'string',
    bind: { key: '物料单位', data: [] },
    width: 60
  },
  { field: 'Creator', title: '创建人', type: 'string', width: 80 },
  { field: 'CreateDate', title: '创建时间', type: 'datetime', width: 130 }
])
//弹出框打开选择数据
const open = () => {
  model.value = true
  //刷新表格的数据
  nextTick(() => {
    tableRef.value?.load(null, true)
  })
}

const emit = defineEmits(['onSelect'])
//选择数据按钮
const detailSelectClick = () => {
  //回写数据到明细表
  let rows = tableRef.value.getSelected()
  if (!rows.length) {
    return proxy.$message.error('请选择数据')
  }
  //选择数据回调
  emit('onSelect', rows)
  model.value=false;
}
//查询点击事件
const search = () => {
  tableRef.value.load(null, true)
}
//表数据加载设置查询条件
const loadBefore = (param, callBack) => {
  param.wheres = [
    { name: 'MaterialCode', value: MaterialCode.value, displayType: 'like' },
    { name: 'MaterialName', value: MaterialName.value, displayType: 'like' }
  ]
  callBack(true)
}
//暴露方法给【选择物料】按钮使用
defineExpose({
  open
})
</script>
<style lang="less" scoped>
.search-form {
  display: flex;
  padding: 10px;
  line-height: 34px;
  button {
    margin-left: 10px;
  }
}
</style>
