<template>
  <div
    class="vol-table"
    ref="refTable"
    :class="[
      textInline ? 'text-inline' : '',
      fxRight ? 'fx-right' : '',
      smallCell ? 'small-table' : ''
    ]"
  >
    <template v-if="dragPosition">
      <div v-show="showDragMask" class="drag-mask"></div>
    </template>
    <div class="el-drag" ref="dragRef" v-if="dragPosition == 'top'">+</div>
    <!-- v-if="loading" -->
    <div class="mask" v-if="loading">
      <vol-loading></vol-loading>
    </div>
    <el-table
      :show-summary="summaryData.length > 0"
      :summary-method="getSummaryData"
      :row-key="rowKey"
      :lazy="lazy"
      :defaultExpandAll="defaultExpandAll"
      :expand-row-keys="rowKey ? expandRowKeys : undefined"
      stripe
      :load="loadTreeChildren"
      @select="userSelect"
      @select-all="userSelect"
      @selection-change="selectionChange"
      @row-dblclick="rowDbClick"
      @row-click="rowClick"
      @header-click="headerClick"
      :highlight-current-row="highlightCurrentRow"
      ref="table"
      class="v-table"
      @sort-change="sortChange"
      tooltip-effect="dark"
      :height="realHeight - extraHeight || null"
      :max-height="realMaxHeight"
      :data="url ? rowData : tableData"
      :border="true"
      :row-class-name="initIndex"
      :cell-style="getCellStyle"
      :cell-class-name="getCellClass"
      style="width: 100%"
      :scrollbar-always-on="true"
      @expand-change="expandChange"
      :span-method="cellSpanMethod"
    >
      <el-table-column
        v-if="ck"
        type="selection"
        :fixed="fixed"
        :align="'center'"
        :selectable="selectable"
        width="55"
      ></el-table-column>
      <el-table-column
        v-if="columnIndex"
        type="index"
        :fixed="fixed"
        width="50"
        :label="$ts('序号')"
      ></el-table-column>
      <!-- 2020.10.10移除table第一行强制排序 -->
      <el-table-column
        v-for="(column, cindex) in tableColumns"
        :prop="column.field"
        :label="column.title"
        :min-width="column.width"
        :formatter="formatter"
        :fixed="column.fixed"
        :key="(column.field || '') + cindex"
        :align="column.align"
        :sortable="column.sort ? 'custom' : false"
        :show-overflow-tooltip="column.showOverflowTooltip"
        :class-name="column.class"
        :filters="column.filterData ? getFilters(column) : undefined"
        :filter-method="column.filterData ? filterHandler : undefined"
      >
        <template #filter-icon
          ><el-icon> <Filter /> </el-icon
        ></template>
        <template #header>
          <table-render
            v-if="column.renderHeader"
            :column="column"
            :render="column.renderHeader"
          ></table-render>
          <template v-else>
            <span v-if="(column.require || column.required) && column.edit" class="column-required"
              >*</span
            ><span :style="column.titleStyle">{{ $ts(column.title) }}</span>

            <el-tooltip placement="top" v-if="column.tip">
              <template #content>
                <div v-html="column.tip.text"></div>
              </template>
              <i
                :style="{ color: column.tip.color || '#7d7979' }"
                @click="column.tip.click"
                :class="column.tip.icon || 'el-icon-warning-outline'"
              ></i>
            </el-tooltip>
          </template>
        </template>

        <template #default="scope">
          <!-- 2022.01.08增加多表头，现在只支持常用功能渲染，不支持编辑功能(涉及到组件重写) -->
          <el-table-column
            style="border: none"
            v-for="columnChildren in filterChildrenColumn(column.children)"
            :key="columnChildren.field || columnChildren.title"
            :min-width="columnChildren.width"
            :class-name="columnChildren.class"
            :prop="columnChildren.field"
            :align="columnChildren.align"
            :sortable="columnChildren.sort ? 'custom' : false"
            :show-overflow-tooltip="columnChildren.showOverflowTooltip"
            :label="$ts(columnChildren.title)"
          >
            <template #default="scopeChildren">
              <a
                v-if="columnChildren.link"
                href="javascript:void(0)"
                style="text-decoration: none"
                @click="link(scopeChildren.row, columnChildren, $event)"
                v-text="scopeChildren.row[columnChildren.field]"
              ></a>
              <div
                v-else-if="columnChildren.formatter"
                @click="
                  columnChildren.click &&
                    columnChildren.click(scopeChildren.row, columnChildren, scopeChildren.$index)
                "
                v-html="
                  columnChildren.formatter(scopeChildren.row, columnChildren, scopeChildren.$index)
                "
              ></div>
              <div v-else-if="columnChildren.bind">
                {{ formatter(scopeChildren.row, columnChildren, true) }}
              </div>
              <span v-else-if="columnChildren.type == 'date'">{{
                formatDate(scopeChildren.row, columnChildren)
              }}</span>
              <template v-else>
                {{ scopeChildren.row[columnChildren.field] }}
              </template>
            </template>
          </el-table-column>
          <!-- 2020.06.18增加render渲染自定义内容 -->
          <table-render
            v-if="column.render && typeof column.render == 'function'"
            :row="scope.row"
            key="rd-01"
            :index="scope.$index"
            :column="column"
            :render="column.render"
          ></table-render>
          <!-- 启用双击编辑功能，带编辑功能的不会渲染下拉框文本背景颜色 -->
          <!-- @click="rowBeginEdit(scope.$index,cindex)" -->

          <template
            v-else-if="
              column.edit &&
              !column.readonly &&
              ['file', 'img', 'excel'].indexOf(column.edit.type) != -1
            "
          >
            <div style="display: flex; align-items: center" @click.stop>
              <i
                style="padding: 3px; margin-right: 10px; color: #8f9293; cursor: pointer"
                @click="showUpload(scope.row, column)"
                class="el-icon-upload"
              ></i>
              <template v-if="column.edit.type == 'img'">
                <img
                  v-for="(file, imgIndex) in getFilePath(scope.row[column.field], column)"
                  :key="imgIndex"
                  @error="handleImageError"
                  @click="viewImg(scope.row, column, file.path, $event, imgIndex)"
                  class="table-img"
                  :src="file.path + access_token"
                />
              </template>
              <a
                style="margin-right: 8px"
                v-else
                class="t-file"
                v-for="(file, fIndex) in getFilePath(scope.row[column.field], column)"
                :key="fIndex"
                @click="dowloadFile(file)"
                >{{ file.name }}</a
              >
            </div>
          </template>
          <!-- 2021.09.21增加编辑时对readonly属性判断 -->
          <div
             v-else-if="
              column.edit &&
              !column.readonly &&
              (column.edit.keep || edit.rowIndex == scope.$index) &&
              (!column.checkEdit || column.checkEdit(scope.row, column, scope.$index))
            "
            class="edit-el"
          >
            <div @click.stop class="e-item">
              <div>
                <!-- 2020.07.24增加日期onChange事件 -->
                <el-date-picker
                  clearable
                  size="default"
                  style="width: 100%"
                  :ref="column.field + scope.$index"
                  v-if="['date', 'datetime', 'month'].indexOf(column.edit.type) != -1"
                  v-model="scope.row[column.field]"
                  @click.prevent
                  @change="
                    (val) => {
                      dateChange(scope.row, column, val)
                    }
                  "
                  :type="column.edit.type"
                  :placeholder="$ts(column.placeholder || column.title)"
                  :disabledDate="(val) => getDateOptions(val, column)"
                  :value-format="getDateFormat(column)"
                  :disabled="initColumnDisabled(scope.row, column)"
                  @visible-change="dateVisibleChang"
                >
                </el-date-picker>
                <el-time-picker
                  clearable
                  size="default"
                  style="width: 100%"
                  v-else-if="column.edit.type == 'time'"
                  v-model="scope.row[column.field]"
                  @change="
                    (val) => {
                      column.onChange && column.onChange(scope.row, column, val)
                    }
                  "
                  :placeholder="$ts(column.placeholder || column.title)"
                  :value-format="column.format || 'HH:mm:ss'"
                  :disabled="initColumnDisabled(scope.row, column)"
                >
                </el-time-picker>
                <template v-else-if="column.edit.type == 'color'">
                  {{ scope.row[column.field] }}
                  <el-color-picker
                    @show="isDateChange = true"
                    @hide="isDateChange = false"
                    show-alpha
                    :teleported="true"
                    :predefine="[
                      '#ff4500',
                      '#ff8c00',
                      '#ffd700',
                      '#90ee90',
                      '#00ced1',
                      '#1e90ff',
                      '#c71585'
                    ]"
                    v-model="scope.row[column.field]"
                  />
                </template>
                <el-switch
                  v-else-if="column.edit.type == 'switch'"
                  v-model="scope.row[column.field]"
                  active-color="#0f84ff"
                  inactive-color="rgb(194 194 194)"
                  :active-text="$ts(column.activeText)"
                  :inactive-text="$ts(column.inactiveText)"
                  @change="
                    (val) => {
                      switchChange(val, scope.row, column)
                    }
                  "
                  :active-value="
                    typeof scope.row[column.field] == 'boolean'
                      ? true
                      : typeof scope.row[column.field] == 'string'
                      ? '1'
                      : 1
                  "
                  :inactive-value="
                    typeof scope.row[column.field] == 'boolean'
                      ? false
                      : typeof scope.row[column.field] == 'string'
                      ? '0'
                      : 0
                  "
                  :disabled="initColumnDisabled(scope.row, column)"
                >
                </el-switch>

                <template v-else-if="['select', 'selectList'].indexOf(column.edit.type) != -1">
                  <el-select-v2
                    :ref="column.field + scope.$index"
                    style="width: 100%"
                    size="default"
                    v-if="column.bind.data.length >= select2Count"
                    v-model="scope.row[column.field]"
                    :filterable="column.filter === undefined ? true : column.filter"
                    :multiple="column.edit.type == 'select' ? false : true"
                    :placeholder="$ts(column.placeholder || column.title)"
                    :allow-create="column.autocomplete"
                    :options="column.bind.data"
                    @change="column.onChange && column.onChange(scope.row, column)"
                    clearable
                    :disabled="initColumnDisabled(scope.row, column)"
                  >
                    <template #default="{ item }">
                      {{ item.label }}
                    </template>
                  </el-select-v2>

                  <el-select
                    :ref="column.field + scope.$index"
                    size="default"
                    style="width: 100%"
                    v-else
                    v-model="scope.row[column.field]"
                    :filterable="column.filter === undefined ? true : column.filter"
                    :multiple="column.edit.type == 'select' ? false : true"
                    :placeholder="$ts(column.placeholder || column.title)"
                    :allow-create="column.autocomplete"
                    @change="
                      (val) => {
                        selectChange(scope.row, column, val)
                      }
                    "
                    @clear="
                      (val) => {
                        selectChange(scope.row, column, val, true)
                      }
                    "
                    clearable
                    :disabled="initColumnDisabled(scope.row, column)"
                  >
                    <el-option
                      v-for="item in column.bind.data"
                      :key="item.key"
                      v-show="!item.hidden"
                      :disabled="item.disabled"
                      :label="$ts(item.value)"
                      :value="item.key"
                    >
                    </el-option>
                  </el-select>
                </template>
                <el-tree-select
                  :ref="column.field + scope.$index"
                  style="width: 100%"
                  v-else-if="column.edit.type == 'treeSelect' || column.edit.type == 'cascader'"
                  v-model="scope.row[column.field]"
                  :data="column.bind.data"
                  :multiple="column.multiple === undefined ? true : column.multiple"
                  :render-after-expand="false"
                  :show-checkbox="true"
                  :check-strictly="true"
                  check-on-click-node
                  node-key="key"
                  @change="column.onChange && column.onChange(scope.row, column)"
                  :props="{ label: 'label' }"
                >
                  <template #default="{ data, node }"> {{ $ts(data.label) }}</template>
                </el-tree-select>
                <el-input
                  :ref="column.field + scope.$index"
                  v-else-if="column.edit.type == 'textarea'"
                  type="textarea"
                  :placeholder="$ts(column.placeholder || column.title)"
                  v-model="scope.row[column.field]"
                  :disabled="initColumnDisabled(scope.row, column)"
                  :autosize="{
                    minRows: column.minRows || 2,
                    maxRows: column.maxRows || 10
                  }"
                >
                </el-input>
                <el-input-number
                  :ref="column.field + scope.$index"
                  style="width: 100%"
                  v-else-if="column.edit.type == 'number' || column.edit.type == 'decimal'"
                  v-model="scope.row[column.field]"
                  :precision="column.edit.type == 'number' ? 0 : column.precision"
                  :min="column.min"
                  :disabled="column.readonly || column.disabled"
                  :max="column.max"
                  controls-position="right"
                  @focus="onFocus(scope.row, column, $event)"
                  @blur="onBlur(scope.row, column, $event)"
                  @change="inputKeypress(scope.row, column, $event)"
                  @keyup.delete="inputKeypress(scope.row, column, $event)"
                  @keypress="
                    ($event) => {
                      inputKeypress(scope.row, column, $event)
                    }
                  "
                />
                <input
                  :ref="column.field + scope.$index"
                  class="table-input"
                  v-else-if="!column.summary && !column.onKeyPress"
                  v-model.lazy="scope.row[column.field]"
                  :placeholder="$ts(column.placeholder || column.title)"
                  :disabled="initColumnDisabled(scope.row, column)"
                  @input="inputKeypress(scope.row, column, $event)"
                  @focus="onFocus(scope.row, column, $event)"
                  @blur="onBlur(scope.row, column, $event)"
                />
                <el-input
                  v-else
                  :ref="column.field + scope.$index"
                  @change="inputKeypress(scope.row, column, $event)"
                  @input="inputKeypress(scope.row, column, $event)"
                  @keyup.enter="inputKeypress(scope.row, column, $event)"
                  size="default"
                  v-model="scope.row[column.field]"
                  :placeholder="$ts(column.placeholder || column.title)"
                  :disabled="initColumnDisabled(scope.row, column)"
                  @blur="onBlur(scope.row, column, $event)"
                ></el-input>
              </div>
              <div class="extra" v-if="column.extra && edit.rowIndex == scope.$index">
                <a
                  :style="column.extra.style"
                  style="text-decoration: none"
                  @click="extraClick(scope.row, column, getTableData())"
                >
                  <i v-if="column.extra.icon" :class="[column.extra.icon]" />
                  {{ column.extra.text }}
                </a>
              </div>
            </div>
          </div>
          <!--没有编辑功能的直接渲染标签-->
          <!-- v-text="scope.row[column.field]" -->
          <template v-else>
            <a
              v-if="column.link"
              href="javascript:void(0)"
              style="text-decoration: none"
              @click="link(scope.row, column, $event)"
              v-text="formatter(scope.row, column, true)"
            ></a>
            <img
              v-else-if="column.type == 'img'"
              v-for="(file, imgIndex) in getFilePath(scope.row[column.field], column)"
              :key="imgIndex"
              @error="handleImageError"
              @click="viewImg(scope.row, column, file.path, $event, imgIndex)"
              class="table-img"
              :style="{
                height: (column.imgHeight || 40) + 'px',
                width: (column.imgWidth || 40) + 'px'
              }"
              :src="file.path + access_token"
            />
            <a
              style="margin-right: 8px"
              v-else-if="column.type == 'file' || column.type == 'excel'"
              class="t-file"
              v-for="(file, fIndex) in getFilePath(scope.row[column.field], column)"
              :key="fIndex"
              @click="dowloadFile(file)"
              >{{ file.name }}</a
            >
            <template v-else-if="column.type == 'date'">{{
              formatDate(scope.row, column)
            }}</template>
            <template v-else-if="column.type == 'month'">{{
              (scope.row[column.field] || '').substr(0, 7)
            }}</template>
            <div
              v-else-if="column.formatter"
              @click.stop="formatterClick(scope.row, column, $event)"
              v-html="column.formatter(scope.row, column)"
            ></div>
            <!-- 2021.11.18修复table数据源设置为normal后点击行$event缺失的问题 -->
            <div
              v-else-if="column.bind && (column.normal || column.edit)"
              @click.stop="formatterClick(scope.row, column, $event)"
            >
              <span :style="column.getStyle && column.getStyle(scope.row, column)">
                {{ formatter(scope.row, column, true) }}</span
              >
            </div>
            <div
              v-else-if="column.click && !column.bind"
              @click="formatterClick(scope.row, column)"
            >
              {{ scope.row[column.field] }}
            </div>
            <div
              @click="
                () => {
                  column.click && formatterClick(scope.row, column)
                }
              "
              v-else-if="column.bind"
            >
              <el-tag
                v-if="
                  useTag && column.type != 'cascader' && !base.isEmptyValue(scope.row[column.field])
                "
                class="cell-tag"
                :type="getColor(scope.row, column)"
                :effect="column.effect"
                size="small"
                >{{ formatter(scope.row, column, true) }}</el-tag
              >
              <template v-else>{{ formatter(scope.row, column, true) }}</template>
            </div>

            <template v-else>{{ formatter(scope.row, column, true) }}</template>
          </template>
        </template>
      </el-table-column>
    </el-table>
    <template v-if="!paginationHide">
      <div class="block pagination" key="pagination-01">
        <div>
          <slot name="pagination"></slot>
        </div>
        <div class="pagination-content">
          <el-pagination
            key="pagination-02"
            @size-change="handleSizeChange"
            @current-change="handleCurrentChange"
            :current-page="paginations.page"
            :page-sizes="paginations.sizes"
            :page-size="paginations.size"
            :pager-count="pagerCount"
            layout="total, sizes, prev, pager, next, jumper"
            :total="paginations.total"
          ></el-pagination>
        </div>
      </div>
    </template>
    <div class="el-drag" ref="dragRef" v-if="dragPosition == 'bottom'">+</div>
    <vol-table-upload ref="uploadRef"></vol-table-upload>
    <vol-image-viewer ref="viewer"></vol-image-viewer>
  </div>
</template>
<script lang="jsx" setup>
import {
  ref,
  getCurrentInstance,
  defineAsyncComponent,
  computed,
  reactive,
  nextTick,
  onMounted,
  onUnmounted,
  watch
} from 'vue'
import VolTableProps from './VolTable/VolTableProps.js'
import TableRender from './VolTable/VolTableRender'

import { initDataSource } from './VolTable/VolTableDicData.js'
import {
  initCellStyleSummary,
  initSummaryData,
  initColumnSummaryData,
  loadDataSummaries
} from './VolTable/VolTableSummary.js'
import {
  selectChange,
  switchChange,
  inputChange,
  extraClick,
  selectionRowChange,
  expandTreeChange,
  onBlur,
  onFocus
} from './VolTable/VolTableEvent.js'
import { getPath, previewImg } from './VolTable/VolTableFile.js'
import { resetPage, loadData } from './VolTable/VolTableLoadData.js'
import { getDateOptions, getDateFormat } from './VolTable/VolTableDate.js'
import {
  isEmptyTag,
  filterChildrenColumn,
  initColumnDisabled,
  initDrag,
  initSortable,
  toNextTableCell,
  getColumnFilters,
  addTableRow,
  delTableRow,
  resetTable,
  initPaginations
} from './VolTable/VolTableProvider.js'
import { getCellColor, formatDate, cellFormatter } from './VolTable/VolTableFormat.js'
import { tableRowClick, rowEndEdit } from './VolTable/VolTableEdit.js'
const VolTableUpload = defineAsyncComponent(() => import('./VolTable/VolTableUpload.vue'))
import VolLoading from '@/components/basic/VolLoading'
import VolImageViewer from '@/components/basic/VolImageViewer.vue'
const emit = defineEmits([
  'dicInited',
  'loadBefore',
  'loadAfter',
  'rowChange',
  'selectionChange',
  'onSortEnd',
  'rowDbClick',
  'rowClick',
  'paginationChange'
])
const props = defineProps(VolTableProps())
const { proxy, vnode } = getCurrentInstance()

proxy.errMsg = ''
proxy.errorFiled = ''
const table = ref(null)
const randomTableKey = ref(1)
const realHeight = ref(0)
const realMaxHeight = ref(0)
const isPageLoad = ref(false)
const defaultImg = new URL('@/assets/imgs/error-img.png', import.meta.url).href
const loading = ref(false)
const formatConfig = reactive({})
//外部调用rowData只能使用splice+push
// const rowData = reactive(props.tableData);
const rowData = ref(props.tableData)

//分页选择的数据
const reserveSelectionRows = [] // reactive([]);
const paginations = reactive(props.pagination)
initPaginations(paginations)

const edit = reactive({ columnIndex: -1, rowIndex: -1 }) // 当前双击编辑的行与列坐标
// const summary = ref(false); // 是否显示合计
// 目前只支持从后台返回的summaryData数据
const summaryData = reactive([])
const summaryIndex = reactive({})
const cellStyleColumns = reactive({})
const remoteColumns = reactive([]) // 需要每次刷新或分页后从后台加载字典数据源的列配置
//-table带数据源的单元格是否启用tag标签(下拉框等单元格以tag标签显示)
//2023.04.02更新voltable与main.js
const useTag = ref(true)

const smallCell = ref(true)
const showDragMask = ref(false)
//文件权限token
const access_token = ref(proxy.base.getAccessToken())

if (proxy.$global && proxy.$global.table) {
  useTag.value = proxy.$global.table && proxy.$global.table.useTag
  smallCell.value = proxy.$global.table && proxy.$global.table.smallCell
}

// 没有定义高度与最大高度，使用table默认值 // 定义了最大高度则不使用高度
realHeight.value =
  (!props.height && !props.maxHeight) || props.maxHeight ? null : props.height || null
// 没有定义高度与最大高度，使用table默认值
realMaxHeight.value = props.maxHeight || props.height || null

const setHeight = (value) => {
  realHeight.value = value
}

const getTableData = () => {
  // return rowData.value;
  return props.url ? rowData.value : props.tableData
}
const getTable = () => {
  return table.value
}
const tableColumns = computed(() => {
  return proxy.columns.filter((x) => {
    return !x.hidden
  })
})

//右侧固定
const fxRight = computed(() => {
  return proxy.columns.some((x) => {
    return x.fixed == 'right' && !x.hidden
  })
})
//左边固定
const fixed = computed(() => {
  return props.columns.some((x) => {
    return x.fixed && x.fixed != 'right' && !x.hidden
  })
})

const initIndex = ({ row, rowIndex }) => {
  //if (props.ck) {
  row.elementIndex = rowIndex
  //}
  return
}
// 背景颜色、合计
const initConfig = () => {
  initCellStyleSummary(props, proxy, cellStyleColumns, summaryData, summaryIndex)
}
const getSummaryData = () => {
  return summaryData
}
const getCellClass = ({ row, column, rowIndex, columnIndex }) => {
  const b = props.columns.some((x) => {
    return x.field === column.property && x.edit && (x.edit.keep || edit.rowIndex === rowIndex)
  })
  if (b) return 'current-edit-cell'
  if (props.columns[columnIndex]) {
    return props.columns[columnIndex].class
  }
}
const getCellStyle = (option) => {
  // 2020.12.13增加设置单元格颜色
  if (!option.column.property || !cellStyleColumns[option.column.property]) return
  return cellStyleColumns[option.column.property](
    option.row,
    option.rowIndex,
    option.columnIndex,
    getTableData()
  )
}
initConfig()

//reset=是否重置
const initDicKeys = (reset = true) => {
  initDataSource(proxy, props, reset, (dicData) => {
    emit('dicInited', dicData)
  })
}
//初始化字典
initDicKeys(false)

//获取选中行
const getSelectionRows = () => {
  if (props.reserveSelection && props.rowKey) {
    const rows = table.value.getSelectionRows()
    if (!reserveSelectionRows.length) {
      return rows
    }
    const rows2 = reserveSelectionRows.filter((x) => {
      return !rows.some((c) => {
        return c[props.rowKey] == x[props.rowKey]
      })
    })
    //如果有删除行操作，这里可能不准会误删
    return [...rows, ...rows2]
  }

  return table.value ? table.value.getSelectionRows() : []
}
//获取选中行
const getSelected = () => {
  return getSelectionRows()
}
const getSelectedIndex = () => {
  // if (!props.index) {
  //   // 只有设置了属性index才有索引行
  //   return [];
  // }
  return getSelectionRows().map((x) => {
    return x.elementIndex
  })
}
//合计
const initSummary = () => {
  initSummaryData(props, getTableData(), summaryData, summaryIndex)
}
const getInputSummaries = (scope, val, event, column) => {
  if (!column) return
  initColumnSummaryData(column)
}
//设置字段配置合计
const setColumnSummary = (column) => {
  initColumnSummaryData(column, getTableData(), summaryData, summaryIndex)
}
if (props.tableData.length) {
  initSummary()
}

const clearSelection = () => {
  reserveSelectionRows.splice(0)
  table.value.clearSelection()
}

const toggleRowSelection = (row) => {
  table.value.toggleRowSelection(row)
}

const watchRowSelectChange = (newLen, oldLen) => {
  if (!props.reserveSelection && newLen < oldLen && getSelectionRows().length) {
    //reserveSelectionRows.splice(0);
    clearSelection()
  }
  if (!props.reserveSelection && isPageLoad.value) {
    isPageLoad.value = false
    return
  }
  initSummary()
}
//刷新指定字段合计
const updateSummary = (fields) => {
  if (!fields) {
    fields = props.columns
      .filter((c) => {
        return c.summary
      })
      .map((c) => {
        return c.field
      })
  } else if (!Array.isArray(fields)) {
    fields = [fields]
  }
  for (let index = 0; index < fields.length; index++) {
    const field = fields[index]
    //这里可能有多级表头
    const column = proxy.base.getColumn(props.columns, field)
    if (column) {
      setColumnSummary(column)
    }
  }
}

//输入事件
const inputKeypress = (row, column, $event) => {
  inputChange(row, column, $event)
  setColumnSummary(column)
}
const link = (row, column, $e) => {
  $e.stopPropagation && $e.stopPropagation()
  props.linkView(row, column)
}

const headerClick = (column, event) => {
  if (edit.rowIndex != -1) {
    const b = rowEndEdit(proxy, props, getTableData(), column, edit)
    if (b) {
      edit.rowIndex = -1
    }
  }
}
//行双击事件
const rowDbClick = (row, column, event) => {
  //2021.05.23增加双击行事件
  emit('rowDbClick', { row, column, event, index: row.elementIndex })
}
//行点击事件
const rowClick = (row, column, event) => {
  if (!column) {
    column = props.columns.find((x) => {
      return x.field && x.edit && !x.edit.readonly && !x.readonly
    })
  } else if (!column.field && column.property) {
    column = props.columns.find((x) => {
      return x.field == column.property
    })
  }

  tableRowClick(proxy, props, getTableData(), edit, nextTick, emit, row, column, event)
  // console.log(edit);
}

//图片预览
const viewer = ref(null)
const viewImg = (row, column, path, $event, index) => {
  $event && $event.stopPropagation()
  previewImg(proxy, row, column, index, viewer.value)
}

const getFilePath = (url, column) => {
  return getPath(url, column, proxy)
}

const dowloadFile = (file) => {
  proxy.base.dowloadFile(
    file.path + access_token.value,
    file.name,
    {
      Authorization: proxy.$store.getters.getToken()
    },
    proxy.http.ipAddress
  )
}
const reset = () => {
  resetTable(proxy, props, getTableData(), paginations, edit)
}

//加数据
const load = async (query, isResetPage) => {
  if (!props.url) {
    return
  }
  let data = await loadData(
    props,
    proxy,
    vnode,
    getTableData(),
    emit,
    loading,
    paginations,
    query,
    isResetPage,
    isPageLoad,
    randomTableKey
  )
  if (!data) {
    return
  }
  //重置合计
  loadDataSummaries(proxy, props, data, summaryData)
  //设置分页后记录默认选中行2024.09.10
  if (!(props.reserveSelection && props.rowKey)) return
  // isPageLoad.value = false;
  nextTick(() => {
    isPageLoad.value = true
    const selectRows = reserveSelectionRows
    getTableData().forEach((row) => {
      const b = selectRows.some((c) => {
        return c[proxy.rowKey] === row[proxy.rowKey]
      })
      if (b) toggleRowSelection(row)
    })
    isPageLoad.value = false
  })
}
if (props.defaultLoadPage) {
  load()
}

const handleSizeChange = (val) => {
  paginations.size = val
  paginations.rows = val
  load()
  emit('paginationChange', paginations)
}
const handleCurrentChange = (val) => {
  paginations.page = val
  load()
  emit('paginationChange', paginations)
}
const sortChange = (sort) => {
  if (props.url) {
    paginations.sort = sort.prop
    paginations.order = sort.order == 'ascending' ? 'asc' : 'desc'
    load()
    return
  }
  const rows = getTableData()
  rows.sort(function (a, b) {
    if (sort.order == 'ascending') {
      return a[sort.prop] - b[sort.prop]
    }
    return b[sort.prop] - a[sort.prop]
  })
}
//复选框选中事件
const selectionChange = (selection) => {
  selectionRowChange(
    props,
    emit,
    getTableData(),
    selection,
    table.value,
    reserveSelectionRows,
    isPageLoad
  )
}
const userSelect = (selection, row) => {
  //   this.$emit("rowChange", { row, selection });
}
const isDateChange = ref(false)
const dateVisibleChang = (show) => {
  isDateChange.value = show
}
const dateChange = (row, column, val) => {
  isDateChange.value = true
  column.onChange && column.onChange(row, column, val)
}
//树形结构展开事件
const expandChange = (row, expandedRows) => {
  expandTreeChange(props, row, expandedRows)
}

//单元格颜色
const getColor = (row, column) => {
  return getCellColor(row, column, formatConfig)
}
//格式化
const formatter = (row, column, template) => {
  return cellFormatter(proxy, row, column, template)
}
const formatterClick = (row, column, event) => {
  if (column.click) {
    column.click(row, column, event)
    event.stopPropagation && event.stopPropagation()
  } else {
    rowClick(row, column, event)
  }
}
//合并单元格
const cellSpanMethod = ({ row, column, rowIndex, columnIndex }) => {
  return props.spanMethod({ row, column, rowIndex, columnIndex }, getTableData())
}
//表头过滤
const getFilters = (column) => {
  return getColumnFilters(proxy, column, getTableData())
}

const filterHandler = (value, row, column) => {
  return row[column.property] === value
}

const handleImageError = ($e) => {
  $e.target.src = defaultImg
}
//按回车跳转到下一行
const toNextCell = (row, nextField, newRow) => {
  toNextTableCell(proxy, props, getTableData(), row, edit, nextField, newRow)
}
//添加行
const addRow = (row) => {
  addTableRow(proxy, props, getTableData(), row)
  return row
}

const delRow = (rows) => {
   rows =rows|| getSelected()
  delTableRow(proxy, edit, getTableData(), rows, getSelectedIndex())
  return rows
}

//上传图片、文件
const uploadRef = ref(null)
const showUpload = (row, column) => {
  uploadRef.value.showUpload(row, column, props.url)
}

const refTable = ref()

const setEdit = (index) => {
  //结束编辑
  if (index == -1) {
    if (edit.rowIndex == -1) {
      return
    }
    let row = getTableData[edit.rowIndex]
    rowEndEdit(proxy, props, getTableData(), row, edit)
    return
  }
  //开启编辑
  rowClick(getTableData()[index], null, {})
}

// watch(
//   () => props.tableData.length,
//   (newLen, oldLen) => {
//     watchRowSelectChange(newLen, oldLen);
//   }
// );
watch(
  () => rowData.value.length,
  (newLen, oldLen) => {
    watchRowSelectChange(newLen, oldLen)
  }
)

const handleTableClickOutside = async (event) => {
  if (!refTable.value?.contains(event.target)) {
    if (isDateChange.value) return
    if (edit.rowIndex != -1) {
      let row = getTableData[edit.rowIndex]
      if ((await rowEndEdit(proxy, props, getTableData(), row, edit)) !== false) {
        edit.rowIndex = -1
      }
    }
  }
}

const dragRef = ref(null)
const hasEdit = () => {
  return props.columns.some((x) => {
    return x.edit
  })
}
onMounted(() => {
  nextTick(() => {
    initDrag(props, dragRef.value, refTable.value, showDragMask, realHeight)
  })
  if (hasEdit()) {
    document.addEventListener('click', handleTableClickOutside)
  }
  initSortable(props, emit, nextTick, refTable.value, () => {
    return getTableData()
  })
})
onUnmounted(() => {
  if (hasEdit()) {
    window.removeEventListener('click', handleTableClickOutside)
  }
})

defineExpose({
  table,
  getTable,
  getTableData,
  paginations,
  rowData,
  edit,
  realHeight,
  realMaxHeight,
  setHeight,
  initConfig,
  initDicKeys,
  initSummary,
  getInputSummaries,
  setColumnSummary,
  getSelectionRows,
  getSelected,
  getSelectedIndex,
  load,
  updateSummary,
  toNextCell,
  clearSelection,
  toggleRowSelection,
  addRow,
  delRow,
  remoteColumns,
  reset,
  setEdit,
  viewImg,
  tableData: props.tableData
})
</script>
<style lang="less" scoped>
@import './VolTable/VolTable.less';
</style>
