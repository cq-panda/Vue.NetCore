<template>
  <el-dialog v-model="model" width="450" align-center :close-on-click-modal="false" draggable>
    <template #header>
      <div class="sort-header">{{ $ts('自定义排序') }}</div>
    </template>
    <el-alert
      :title="$ts('拖动列名可调整表格列显示顺序')"
      type="success"
      :show-icon="true"
      :closable="false"
    >
    </el-alert>
    <div class="view-column view-column-title">
      <div class="view-column-index">#</div>
      <div class="view-column-left">{{ $ts('列名') }}</div>
      <div class="view-column-ck">{{ $ts('是否显示') }}</div>
    </div>
    <el-scrollbar :max-height="maxHeight">
      <draggable
        tag="transition-group"
        :component-data="componentData"
        :list="columns"
        v-bind="dragOptions"
        item-key="order"
      >
        <transition-group>
          <div class="view-column" v-for="(column, index) in columns" :key="index">
            <div class="view-column-index">{{ index + 1 }}</div>
            <div class="view-column-left">{{ $ts(column.t) }}</div>
            <div class="view-column-ck">
              <el-checkbox v-model="column.s"> </el-checkbox>
            </div>
          </div>
        </transition-group>
      </draggable>
    </el-scrollbar>
    <template #footer>
      <div class="dialog-footer">
        <el-button @click="model = false" icon="Close">{{ $ts('关闭') }}</el-button>
        <el-button color="#626aef" icon="Sort" plain @click="reset">{{ $ts('重置') }}</el-button>
        <el-button type="primary" icon="Check" plain @click="save">{{ $ts('保存') }}</el-button>
      </div>
    </template>
  </el-dialog>
</template>
<script setup>
import { getViewCacheKey } from './ViewGridCustomColumn.js'
import { VueDraggableNext as draggable } from 'vue-draggable-next'
import { ref, reactive, getCurrentInstance } from 'vue'

const { proxy } = getCurrentInstance()

const maxHeight = ref(~~(document.body.clientHeight * 0.8 - 100))

let tableName = ''
const columns = ref([])
let tableColumns = [] // reactive([])

let tableFields = []

const model = ref(false)
const show = (cols, fields, table) => {
  if (!columns.value.length) {
    tableName = table
    tableColumns = cols //.push(cols)
    tableFields = fields
    console.log(columns)
    columns.value = cols
      .filter((x) => {
        return fields.includes(x.field)
      })
      .map((x) => {
        return {
          t: x.title,
          f: x.field,
          s: !x.hidden,
          fx: x.fixed === true ? 'left' : x.fixed,
          a: x.align
        }
      })
  }
  model.value = true
}

const dragOptions = reactive({
  animation: 200,
  group: 'description',
  disabled: false,
  ghostClass: 'ghost'
})
const componentData = reactive({
  tag: 'ul',
  type: 'transition-group'
})

const reset = () => {
  let sortColumns = []
  tableFields.forEach((f) => {
    let _column = tableColumns.find((c) => {
      return c.field == f
    })
    if (_column) {
      columns.value.find((x) => {
        return x.f == f
      }).s = true
      _column.hidden = false
      _column.align = ''
      // _column.fixed=''
      sortColumns.push(_column)
    }
  })
  sortViewColumns(sortColumns)
  const key = getViewCacheKey(tableName)
  localStorage.removeItem(key)
  columns.value = []
  model.value = false
}

const save = () => {
  if (
    !columns.value.some((x) => {
      return x.s
    })
  ) {
    proxy.$message.error(proxy.$ts('至少选择一个【是否显示】字段'))
    return
  }
  let sortColumns = []
  columns.value.forEach((column) => {
    let _column = tableColumns.find((c) => {
      return c.field == column.f
    })
    if (_column) {
      _column.hidden = !column.s
      _column.fixed = column.fx == 'none' || !column.fx ? false : column.fx
      _column.align = column.a
      sortColumns.push(_column)
    }
  })
  sortViewColumns(sortColumns)
  const key = getViewCacheKey(tableName)
  localStorage.setItem(key, JSON.stringify(columns.value))
  model.value = false
}
const sortViewColumns = (sortColumns) => {
  if (sortColumns.length) {
    let hiddenColumns = tableColumns.filter((c) => {
      return !sortColumns.some((s) => {
        return c.field == s.field
      })
    })
    sortColumns.push(...hiddenColumns)
    tableColumns.splice(0)
    tableColumns.push(...sortColumns)
  }
}

defineExpose({
  show
})

// export default defineComponent({
//   props: {
//     viewColumns: {
//       type: Array,
//       default: () => {
//         return [];
//       },
//     },
//   },
//   components: {
//     draggable: VueDraggableNext,
//   },
//   data() {
//     return {};
//   },
//   setup(props, context) {
//     const dragOptions = reactive({
//       animation: 200,
//       group: "description",
//       disabled: false,
//       ghostClass: "ghost",
//     });
//     const componentData = reactive({
//       tag: "ul",
//       type: "transition-group",
//     });
//     return { dragOptions, componentData };
//   },
// });
</script>
<style lang="less" scoped>
.sort-header {
  display: flex;
  align-items: center;
  padding-left: 16px;
  padding-top: 13px;
}
.dialog-footer {
  padding: 16px;
  padding-top: 0;
  text-align: center;
}
.view-column {
  cursor: pointer;
  display: flex;
  padding: 5px 16px;
  border-bottom: 1px solid #f3f3f3;
  align-items: center;
  .view-column-index {
    width: 30px;
  }
  .view-column-left {
    width: 120px;
    padding: 0 10px;
  }
  .view-column-right {
    flex: 1;
  }
  .view-column-ck {
    width: 80px;
    display: flex;
    align-content: center;
  }
}
.view-column:nth-child(even) {
  background-color: #f7f8f9;
}
.view-column-title {
  font-weight: bold;
  font-size: 13px;
  padding: 10px 15px;
  background-color: #f2f8ff;
}
.el-icon-warning-outline {
  font-weight: bold;
  font-size: 13px;
}
.view-column:last-child {
  border-bottom: 0;
}
::v-deep(.el-radio) {
  margin-right: 7px;
}
::v-deep(.el-radio__label) {
  padding: 4px;
}
</style>
