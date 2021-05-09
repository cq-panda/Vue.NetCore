<template>
  <div>
    <div class="vol-table"
         :class="[textInline ? 'text-inline' : '']">
      <div class="mask"
           v-show="loading"></div>
      <div class="message"
           v-show="loading">加载中.....</div>
      <el-table :show-summary="summary"
                :summary-method="
          (columns, row) => {
            return this.summaryData;
          }
        "
                :row-key="rowKey"
                lazy
                :load="loadTreeChildren"
                @selection-change="selectionChange"
                @row-click="rowClick"
                @header-click="headerClick"
                @cell-mouse-leave="
          (row, column, cell) => {
            !this.clickEdit && this.rowEndEdit(row, column, cell);
          }
        "
                ref="table"
                class="v-table"
                @sort-change="sortChange"
                tooltip-effect="dark"
                :height="realHeight"
                :max-height="realMaxHeight"
                :data="url ? rowData : tableData"
                border
                :row-class-name="initIndex"
                :cell-style="getCellStyle"
                style="width: 100%">
        <el-table-column v-if="columnIndex"
                         type="index"
                         :fixed="true"
                         width="55"></el-table-column>
        <el-table-column v-if="ck"
                         type="selection"
                         :fixed="true"
                         width="55"></el-table-column>
        <!-- 2020.10.10移除table第一行强制排序 -->
        <el-table-column v-for="(column, cindex) in filterColumns"
                         :key="cindex"
                         :prop="column.field"
                         :label="column.title"
                         :min-width="column.width"
                         :formatter="formatter"
                         :fixed="column.fixed"
                         :align="column.align"
                         :sortable="column.sort ? 'custom' : false">
          <template slot-scope="scope">
            <!-- 2020.06.18增加render渲染自定义内容 -->
            <table-render v-if="column.render && typeof column.render == 'function'"
                          :row="scope.row"
                          :index="scope.$index"
                          :column="column"
                          :render="column.render"></table-render>
            <!-- 启用双击编辑功能，带编辑功能的不会渲染下拉框文本背景颜色 -->
            <!-- @click="rowBeginEdit(scope.$index,cindex)" -->
            <div v-else-if="column.edit"
                 class="edit-el">
              <div v-if="column.edit.keep || edit.rowIndex == scope.$index"
                   class="e-item">
                <div>
                  <!-- 2020.07.24增加日期onChange事件 -->
                  <DatePicker :transfer="true"
                              v-if="
                      column.edit.type == 'date' ||
                      column.edit.type == 'datetime'
                    "
                              :type="column.edit.type"
                              :format="
                      column.edit.type == 'date'
                        ? 'yyyy-MM-dd'
                        : 'yyyy-MM-dd HH:mm:ss'
                    "
                              :placeholder="column.title"
                              :value="scope.row[column.field]"
                              @on-change="
                      (time) => {
                        scope.row[column.field] = time;
                        column.onChange && column.onChange(time, column);
                        return time;
                      }
                    "></DatePicker>
                  <i-switch v-else-if="column.edit.type == 'switch'"
                            :true-value="
                      typeof scope.row[column.field] == 'boolean' ? true : 1
                    "
                            :false-value="
                      typeof scope.row[column.field] == 'boolean' ? false : 0
                    "
                            v-model="scope.row[column.field]"
                            @on-change="
                      (value) => {
                        column.onChange &&
                          column.onChange(
                            column,
                            scope.row,
                            url ? rowData : tableData,
                            value
                          );
                      }
                    ">
                    <span slot="open">是</span>
                    <span slot="close">否</span>
                  </i-switch>
                  <!--如果是1或0请加上属性 true-value="1" false-value="0"
               如果value是字符串数字则使用 :true-value="1" :false-value="0"
                  -->
                  <Select :transfer="true"
                          v-else-if="column.edit.type == 'select'"
                          v-model="scope.row[column.field]"
                          :filterable="
                      column.filter || getSelectedOptions(column).length > 10
                        ? true
                        : false
                    "
                          :placeholder="'请选择' + column.title"
                          @on-change="
                      column.onChange &&
                        column.onChange(
                          column,
                          scope.row,
                          url ? rowData : tableData
                        )
                    "
                          clearable>
                    <Option v-for="(kv, kvIndex) in getSelectedOptions(column)"
                            :key="kvIndex"
                            :value="kv.key === undefined ? '' : kv.key">{{ kv.value }}</Option>
                  </Select>
                  <!-- 2020.10.18增加iview input组件on-keypress事件 -->
                  <Input v-else
                         clearable
                         :ref="column.field + scope.$index"
                         @on-change="
                      (event) => {
                        onChange(scope, scope.row[column.field], event, column);
                      }
                    "
                         @on-keypress="
                      ($event) => {
                        column.onKeyPress &&
                          column.onKeyPress($event, scope, column);
                      }
                    "
                         v-model="scope.row[column.field]"
                         :placeholder="'请输入' + column.title"></Input>
                </div>
                <div class="extra"
                     v-if="column.extra && edit.rowIndex == scope.$index">
                  <a :style="column.extra.style"
                     @click="
                      () => {
                        column.extra.click &&
                          column.extra.click(
                            column,
                            scope.row,
                            url ? rowData : tableData
                          );
                      }
                    ">
                    <Icon v-if="column.extra.icon"
                          :type="column.extra.icon" />
                    {{ column.extra.text }}
                  </a>
                </div>
              </div>
              <template v-else>
                <div v-if="column.formatter"
                     v-html="column.formatter(scope.row, column)"></div>
                <div v-else>{{ formatter(scope.row, column, true) }}</div>
              </template>
            </div>
            <!--没有编辑功能的直接渲染标签-->
            <template v-else>
              <a href="javascript:void(0)"
                 @click="link(scope.row, column, $event)"
                 v-if="column.link"
                 v-text="scope.row[column.field]"></a>
              <img v-else-if="column.type == 'img'"
                   v-for="(file, vIndex) in getFilePath(
                  scope.row[column.field],
                  column
                )"
                   :key="vIndex"
                   :onerror="defaultImg"
                   @click="viewImg(scope.row, column, file.path)"
                   class="table-img"
                   :src="file.path" />
              <a style="margin-right: 15px"
                 v-else-if="column.type == 'file' || column.type == 'excel'"
                 class="t-file"
                 v-for="(file, vIndex) in getFilePath(
                  scope.row[column.field],
                  column
                )"
                 :key="vIndex"
                 @click="dowloadFile(file)">{{ file.name }}</a>
              <Tag v-else-if="column.type == 'date'">{{
                formatterDate(scope.row, column)
              }}</Tag>
              <div v-else-if="column.formatter"
                   @click="formatterClick(scope.row, column)"
                   v-html="column.formatter(scope.row, column)"></div>
              <!--2020.09.06增加table有数据源的列，可以移除或自定义显示背景颜色及点击事件-->
              <div v-else-if="column.bind && column.normal"
                   @click="formatterClick(scope.row, column)"
                   :style="column.getStyle && column.getStyle(scope.row, column)">
                {{ formatter(scope.row, column, true) }}
              </div>
              <div v-else-if="column.click"
                   @click="formatterClick(scope.row, column)">
                {{ scope.row[column.field] }}
              </div>
              <Tag v-else-if="column.bind"
                   :color="getColor(scope.row, column)">{{ formatter(scope.row, column, true) }}</Tag>
              <template v-else>{{
                formatter(scope.row, column, true)
              }}</template>
            </template>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <div class="block pagination"
         v-if="!paginationHide">
      <el-pagination @size-change="handleSizeChange"
                     @current-change="handleCurrentChange"
                     :current-page="paginations.page"
                     :page-sizes="paginations.sizes"
                     :page-size="paginations.size"
                     layout="total, sizes, prev, pager, next, jumper"
                     :total="paginations.total"></el-pagination>
    </div>
  </div>
</template>
<script>
import VolTableRender from './VolTable/VolTableRender'
var $vue
export default {
  components: { 'table-render': VolTableRender },
  props: {
    rowKey: {
      // 树形结构的主键字段，如果设置值默认会开启树形table；注意rowKey字段的值必须是唯一（2021.05.02）
      typeof: String,
      default: undefined
    },
    loadTreeChildren: {
      // 树形结构加载子节点
      type: Function,
      default: (tree, treeNode, resolve) => {
        return resolve([])
      }
    },
    textInline: {
      // 表格内容超出后是否换行显示（2020.01.16）
      type: Boolean,
      default: true
    },
    tableData: {
      // 表数据源,配置了url就不用传这个参数了
      type: Array,
      default: () => {
        return []
      }
    },
    columns: {
      type: Array,
      default: []
      // [ {
      //   field: "columnType",
      //   title: "数据类型",
      //   width: 120,
      //   hidden:false,
      //   edit: { type: "text", status: false, data: [], key: "" }
      // }] //列的的数据格式edit格式： type类型(text,date,datetime,select,switch),status是否默认为编辑状态
      // data如果是select这里data应该有数据源，如果没有数据请设置key字典编号
    },
    height: {
      type: Number,
      default: 0
    },
    maxHeight: {
      type: Number,
      default: 0
    },
    linkView: {
      type: Function,
      default: function () {
        return 1
      }
    },
    pagination: {
      type: Object,
      default: function () {
        return { total: 0, size: 0, sortName: '' }
      }
    },
    url: {
      type: String,
      default: ''
    },
    paginationHide: {
      type: Boolean,
      default: true
    },
    color: {
      type: Boolean,
      default: true
    },
    index: {
      // 是否创建索引号,如果需要表格编辑功能，这里需要设置为true
      type: Boolean,
      default: false
    },
    allowEmpty: {
      // 表格数据为空时是否默认为--
      type: Boolean,
      default: true
    },
    defaultLoadPage: {
      // 传入了url，是否默认加载表格数据
      type: Boolean,
      default: true
    },
    loadKey: {
      // 是否自动从后台加载数据源,如【审核状态】字段是的值是数字，但要显示对应的文字，1=审核中，2=审核通过
      type: Boolean,
      default: false
    },
    single: {
      type: Boolean, // 是否单选
      default: false
    },
    doubleEdit: {
      type: Boolean, // 是否双击启用编辑功能
      default: true
    },
    clickEdit: {
      type: Boolean, // 是否点击行编辑，再次点击行时结束编辑(默认点击行编辑，鼠标离开结束编辑)
      default: false
    },
    beginEdit: {
      // 编辑开始
      type: Function,
      default: function (row, column, index) {
        return true
      }
    },
    endEditBefore: {
      // 结束编辑前
      type: Function,
      default: function (row, column, index) {
        return true
      }
    },
    endEditAfter: {
      // 结束编辑前
      type: Function,
      default: function (row, column, index) {
        return true
      }
    },
    ck: {
      // 是否显示checkbox
      type: Boolean,
      default: true
    },
    columnIndex: {
      // 是否显示行号(2020..11.1)
      type: Boolean,
      default: true
    }
  },
  data () {
    return {
      visiblyColumns: [],
      key: '',
      realHeight: 0,
      realMaxHeight: 0,
      enableEdit: false, // 是否启表格用编辑功能
      empty: this.allowEmpty ? '' : '--',
      defaultImg: 'this.src="' + require('@/assets/imgs/error.png') + '"',
      loading: false,
      footer: {},
      total: 0,
      formatConfig: {},
      defaultColor: 'default',
      // 2020.09.06调整table列数据源的背景颜色
      colors: [
        'cyan',
        'red',
        'blue',
        'green',
        'magenta',
        'geekblue',
        'gold',
        'orange',
        'default'
      ],
      rule: {
        phone: /^[1][3,4,5,6,7,8,9][0-9]{9}$/,
        decimal: /(^[\-0-9][0-9]*(.[0-9]+)?)$/,
        number: /(^[\-0-9][0-9]*([0-9]+)?)$/
      },
      columnNames: [],
      rowData: [],
      paginations: {
        sort: '',
        order: 'desc',
        Foots: '',
        total: 0,
        // 2020.08.29增加自定义分页条大小
        sizes: [30, 60, 100, 120],
        size: 30, // 默认分页大小
        Wheres: [],
        page: 1,
        rows: 30
      },
      errorFiled: '',
      edit: { columnIndex: -1, rowIndex: -1 }, // 当前双击编辑的行与列坐标
      editStatus: {},
      summary: false, // 是否显示合计
      // 目前只支持从后台返回的summaryData数据
      summaryData: [],
      summaryIndex: {},
      remoteColumns: [], // 需要每次刷新或分页后从后台加载字典数据源的列配置
      cellStyleColumns: {} // 有背景颜色的配置
    }
  },
  created () {
    // 升级element 2.15.1版本后，这个高度有问题，如果有统计求和的table，强制使用max-height属性
    if (this.columns.some(x => { return x.summary })) {
      this.realHeight = null
      this.realMaxHeight = this.maxHeight || this.height
    } else {
      this.realHeight = this.getHeight()
      this.realMaxHeight = this.getMaxHeight()
    }

    // 从后台加下拉框的[是否启用的]数据源
    let keys = []
    let columnBind = []
    this.summaryData.push('合计')
    if (this.columnIndex) {
      this.summaryData.push(' ')
    }
    this.columns.forEach((x, _index) => {
      if (x.cellStyle) {
        this.cellStyleColumns[x.field] = x.cellStyle
      }
      if (!x.hidden) {
        // this.summaryIndex[x.field] = _index;
        // 2020.10.11修复求和列错位的问题
        this.summaryData.push('')
        this.summaryIndex[x.field] = this.summaryData.length - 1
      }
      // 求和
      if (x.summary && !this.summary) {
        this.summary = true
      }
      if (x.bind && x.bind.key && (!x.bind.data || x.bind.data.length == 0)) {
        // 写入远程
        if (!x.bind.data) x.bind.data = []
        if (x.bind.remote) {
          this.remoteColumns.push(x)
        } else if (this.loadKey) {
          keys.push(x.bind.key)
          x.bind.valueTyoe = x.type
          columnBind.push(x.bind)
        }
      }
    })
    if (keys.length > 0) {
      this.http
        .post('/api/Sys_Dictionary/GetVueDictionary', keys)
        .then((dic) => {
          dic.forEach((x) => {
            columnBind.forEach((c) => {
              // 转换数据源的类型与列的类型一致(2020.04.04)
              if (c.valueTyoe == 'int' || c.valueTyoe == 'sbyte') {
                x.data.forEach((d) => {
                  // 2020.09.01增加对数字类型的二次判断
                  if (!isNaN(d.key)) {
                    d.key = ~~d.key
                  }
                })
              }
              if (c.key == x.dicNo) c.data.push(...x.data)
            })
          })
        })
    }

    this.paginations.sort = this.pagination.sortName
    // 2020.08.29增加自定义分页条大小
    Object.assign(this.paginations, this.pagination)
    if (this.pagination.size) {
      this.paginations.rows = this.pagination.size
    }
    this.enableEdit = this.columns.some((x) => {
      return x.hasOwnProperty('edit')
    })
    let keyColumn = this.columns.find((x) => {
      return x.isKey
    })
    if (keyColumn) {
      this.key = keyColumn.field
    }
    // 如果下拉框，判断bind或edit.data是否有数据源，妱果没有则获取数据源bind
    $vue = this
    // this.$emit
    this.defaultLoadPage && this.load()
  },
  computed: {
    filterColumns () {
      return this.columns.filter((x) => {
        return !x.hidden
      })
    }
  },
  methods: {
    headerClick (column, event) {
      if (this.clickEdit && this.edit.rowIndex != -1) {
        if (
          this.rowEndEdit(
            this.url
              ? this.rowData[this.edit.rowIndex]
              : this.tableData[this.edit.rowIndex],
            column
          )
        ) {
          this.edit.rowIndex = -1
        }
      }
      // this.edit.rowIndex = -1;
    },
    rowClick (row, column, event) {
      // 点击行事件(2020.11.07)
      this.$emit('rowClick', { row, column, event })
      if (!this.doubleEdit) {
        return
      }
      // 点击其他行时，如果点击的行与正在编辑的行相同，保持编辑状态
      if (this.clickEdit && this.edit.rowIndex != -1) {
        if (row.elementIdex == this.edit.rowIndex) {
          // 点击的单元格如果不可以编辑，直接结束编辑
          // 2020.10.12修复结束编辑时，element table高版本属性获取不到的问题
          if (
            !this.columns.some(
              (x) =>
                x.field == ((event && event.property) || column.property) &&
                x.edit
            )
          ) {
            if (this.rowEndEdit(row, event)) {
              this.edit.rowIndex = -1
            }
          }
          return
        }
        if (this.rowEndEdit(row, event && event.property ? event : column)) {
          this.edit.rowIndex = -1
        }
      }
      this.rowBeginEdit(row, column)
    },
    dowloadFile (file) {
      this.base.dowloadFile(
        file.path,
        file.name,
        {
          Authorization: this.$store.getters.getToken()
        },
        this.http.ipAddress
      )
    },
    getFilePath (pathSring, column) {
      // 获取表的图片与文件显示
      if (!pathSring) return []
      // 增加图片自定义操作
      // 返回格式必须是[{name:"文件名",path:"图片全路径或base64格式"}]
      if (column.formatter) {
        return column.formatter(pathSring)
      }
      let filePath = pathSring.replace(/\\/g, '/').split(',')
      let fileInfo = []
      for (let index = 0; index < filePath.length; index++) {
        let file = filePath[index]
        // 2020.12.19增加base64图片显示
        if (column.base64) {
          fileInfo.push({
            name: '',
            path:
              (file.indexOf('base64,') == -1 ? 'data:image/png;base64,' : '') +
              file
          })
        } else if (file.indexOf('.') != -1) {
          let splitFile = file.split('/')
          if (splitFile.length > 0) {
            fileInfo.push({
              name: splitFile[splitFile.length - 1],
              path: this.base.isUrl(file) ? file : this.http.ipAddress + file
            })
          }
        }
      }
      return fileInfo
    },
    // 重置table
    reset () {
      if (this.tableData && this.tableData.length > 0) {
        this.tableData.splice(0)
      }
      if (this.rowData && this.rowData.length > 0) {
        this.rowData.splice(0)
      }
      if (!this.paginationHide) {
        this.paginations.page = 1
        // this.paginations.rows = 30;
        if (this.paginations.wheres && this.paginations.wheres.length > 0) {
          this.paginations.wheres.splice(0)
        }
      }
      this.errorFiled = ''
      this.edit.columnIndex = -1
      this.edit.rowIndex = -1
    },
    getHeight () {
      // 没有定义高度与最大高度，使用table默认值
      if (!this.height && !this.maxHeight) {
        return null
      }
      // 定义了最大高度则不使用高度
      if (this.maxHeight) {
        return null
      }
      // 使用当前定义的高度
      return this.height
    },
    getMaxHeight () {
      // 没有定义高度与最大高度，使用table默认值
      if (!this.height && !this.maxHeight) {
        return null
      }
      // 定义了最大高度使用最大高度
      if (this.maxHeight) {
        return this.maxHeight
      }
      // 不使用最大高度
      return null
    },
    getSelectedOptions (column) {
      if (column.bind && column.bind.data && column.bind.data.length > 0) {
        return column.bind.data
      }
      return []
    },
    formatterClick (row, column, event) {
      column.click && column.click(row, column, event)
    },
    initIndex (obj) {
      if (this.index) {
        obj.row.elementIdex = obj.rowIndex
      }
      return ''
    },
    toggleEdit (event) { },
    setEditStatus (status) {
      this.columns.forEach((x) => {
        if (x.hasOwnProperty('edit')) {
          this.$set(x.edit, 'status', status)
        }
      })
    },
    // 通过button按钮启用编辑
    beginWithButtonEdit (scope) {
      // url?rowData:tableData
      this.rowBeginEdit(scope.row, this.columns[scope.$index])
    },
    // 通过button结束编辑
    endWithButtonEdit (scope) {
      if (this.edit.rowIndex == -1) return

      if (
        !this.endEditBefore(scope.row, this.columns[scope.$index], scope.$index)
      ) { return }

      for (let index = 0; index < this.columns.length; index++) {
        let column = this.columns[index]
        if (!column.hidden && (column.required || column.require)) {
          if (!this.validateColum(column, scope.row)) return
        }
      }
      this.edit.rowIndex = -1
      if (
        !this.endEditAfter(scope.row, this.columns[scope.$index], scope.$index)
      ) { }
    },
    rowBeginEdit (row, column) {
      if (this.edit.rowIndex != -1) {
        return
      }
      if (!this.enableEdit) return
      // 编辑前
      if (!this.beginEdit(row, column, row.elementIdex)) return
      if (row.hasOwnProperty('elementIdex')) {
        if (this.edit.rowIndex == row.elementIdex) {
          return
        }
        this.edit.rowIndex = row.elementIdex
      }
    },
    validateColum (option, data) {
      if (option.hidden || option.bind) return true
      let val = data[option.field]
      if (option.require || option.required) {
        if (val != '0' && (val == '' || val == undefined)) {
          if (!this.errorFiled) {
            //  event.focus();
            this.$Message.error(option.title + '不能为空')
          }
          return false
        }
      }
      if (!option.edit) {
        return true
      }
      let editType = option.edit.type
      // 验证数字
      if (editType == 'int' || editType == 'decimal' || editType == 'number') {
        if (val == '' || val == undefined) return true
        if (editType == 'decimal') {
          if (!this.rule.decimal.test(val)) {
            this.$Message.error(option.title + '只能是数字')
            return false
          }
        } else if (!this.rule.decimal.test(val)) {
          this.$Message.error(option.title + '只能是整数')
          return false
        }
        if (
          option.edit.min != undefined &&
          typeof option.edit.min === 'number' &&
          val < option.edit.min
        ) {
          this.$Message.error(option.title + '不能小于' + option.edit.min)
          return false
        }
        if (
          option.edit.max != undefined &&
          typeof option.edit.max === 'number' &&
          val > option.edit.max
        ) {
          // 2020.09.26修复表格验证最大值取值错误的问题
          this.$Message.error(option.title + '不能大于' + option.edit.max)
          return false
        }
        return true
      }

      // 验证字符串
      if (val && (editType == 'text' || editType == 'string')) {
        if (
          option.edit.min != undefined &&
          typeof option.edit.min === 'number' &&
          val.length < option.edit.min
        ) {
          this.$Message.error(
            option.title + '至少' + option.edit.min + '个字符'
          )
          return false
        }
        if (
          option.edit.max != undefined &&
          typeof option.edit.max === 'number' &&
          val.length > option.edit.max
        ) {
          this.$Message.error(
            option.title + '最多' + option.edit.max + '个字符'
          )
          return false
        }
        return true
      }
      return true
    },
    rowEndEdit (row, column, event) {
      if (this.clickEdit && event) {
        return true
      }
      if (!this.enableEdit) {
        if (!this.errorFiled) {
          if (
            this.edit.rowIndex != -1 &&
            !this.endEditAfter(row, column, this.edit.rowIndex)
          ) { return false }
          this.edit.rowIndex = -1
        }
        return true
      }
      if (!this.doubleEdit && event) {
        return true
      }
      // 结束编辑前
      if (!this.endEditBefore(row, column, this.edit.rowIndex)) return false

      if (
        this.edit.rowIndex != -1 &&
        (!this.errorFiled || this.errorFiled == column.property)
      ) {
        let data = (this.url ? this.rowData : this.tableData)[
          this.edit.rowIndex
        ]
        let option = this.columns.find((x) => {
          return x.field == column.property
        })
        if (!option || !option.edit) {
          return true
        }
        if (
          option.edit.type == 'datetime' ||
          option.edit.type == 'date' ||
          option.edit.type == 'select'
        ) {
          if (this.edit.rowIndex == row.elementIdex) {
            return true
          }
        }
        if (!this.validateColum(option, data)) {
          this.errorFiled = option.field
          return false
        } else {
          this.errorFiled = ''
        }
      }
      if (this.errorFiled) {
        return false
      }
      if (!this.endEditAfter(row, column, this.edit.rowIndex)) return false
      //  this.errorFiled = "";
      this.edit.rowIndex = -1
      return true
      // this.edit.columnIndex=-1;
    },
    delRow () {
      let rows = this.getSelected()
      if (rows.length == 0) return this.$Message.error('请选择要删除的行!')

      let data = this.url ? this.rowData : this.tableData
      let indexArr = this.getSelectedIndex()
      if (indexArr.length == 0) {
        return this.$Message.error(
          "删除操作必须设置VolTable的属性index='true'"
        )
      }
      // if (indexArr.length == 0 || !this.key) {
      //   return this.$message.error(
      //     "请设置index=true属性或指columns的字段为key"
      //   );
      // }
      if (indexArr.length == 0) {
        // let keyValues=[]
        // rows.forEach(x=>{
        //   if (x[this.key]) {
        //   }
        //   keyValues.push(x[this.key])
        // })
        // data.find(x=>)
      } else {
        for (let i = data.length - 1; i >= 0; i--) {
          if (indexArr.indexOf(i) != -1) {
            data.splice(i, 1)
          }
        }
      }
      this.edit.rowIndex = -1
      return rows
    },
    addRow (row) {
      if (!row) {
        row = {}
      }
      this.columns.forEach((x) => {
        if (!row.hasOwnProperty(x.field)) {
          if (x.edit && x.edit.type == 'switch') {
            row[x.field] = x.type == 'bool' ? false : 0
          } else if (!row.hidden) {
            // 2020.09.06添加行时，设置默认字段
            row[x.field] = undefined
          }
        }
      })
      if (!this.url) {
        this.tableData.push(row)
        return
      }
      this.rowData.push(row)
    },
    viewImg (row, column, url) {
      this.base.previewImg(url)
      // window.open(row[column.field]);
    },
    link (row, column, $e) {
      $e.stopPropagation()
      this.$props.linkView(row, column)
    },
    getSelected () {
      return this.$refs.table.selection
    },
    getSelectedIndex () {
      if (!this.index) {
        // 只有设置了属性index才有索引行
        return []
      }
      let indexArr = this.$refs.table.selection.map((x) => {
        return x.elementIdex
      })
      return indexArr || []
    },
    GetTableDictionary (rows) {
      // 分页或刷新或重新绑定数据源
      if (this.remoteColumns.length == 0 || !rows || rows.length == 0) return
      let remoteInfo = {}
      for (let index = 0; index < this.remoteColumns.length; index++) {
        const column = this.remoteColumns[index]
        //  column.bind.data.splice(0);
        let key = column.bind.key
        let data = []
        rows.forEach((row) => {
          if (data.indexOf(row[column.field]) == -1) {
            data.push(row[column.field])
          }
        })
        if (data.length > 0) {
          remoteInfo[key] = data
        }
      }
      if (remoteInfo.length == 0) return
      // ha= Object.assign([], ha, hb)
      this.http
        .post('/api/Sys_Dictionary/GetTableDictionary', remoteInfo)
        .then((dic) => {
          dic.forEach((x) => {
            this.remoteColumns.forEach((column) => {
              if (column.bind.key == x.key) {
                column.bind.data = Object.assign([], column.bind.data, x.data)
                // column.bind.data.push(...x.data);
              }
            })
          })
        })
    },
    load (query, isResetPage) {
      // isResetPage重置分页数据
      if (!this.url) return
      if (isResetPage) {
        this.resetPage()
      }
      let param = {
        page: this.paginations.page,
        rows: this.paginations.rows,
        sort: this.paginations.sort,
        order: this.paginations.order,
        wheres: [] // 查询条件，格式为[{ name: "字段", value: "xx" }]
      }
      let status = true
      // 合并查询信息(包查询分页、排序、查询条件等)
      if (query) {
        param = Object.assign(param, query)
      }
      /* 查询前处理(如果需要查询条件，实现组件方法loadBefore方法即可:
        loadBefore=(param, callBack)=>{
          param.wheres = [{ name: "PhoneNo", value: "13419098211" }];
          callBack(true);
        })
      */
      this.$emit('loadBefore', param, (result) => {
        status = result
      })
      if (!status) return

      if (param.wheres && param.wheres instanceof Array) {
        param.wheres = JSON.stringify(param.wheres)
      }
      this.loading = true
      this.http.post(this.url, param).then(
        (data) => {
          this.loading = false
          // 查询返回结果后处理
          // 2020.10.30增加查询后返回所有的查询信息
          this.$emit(
            'loadAfter',
            data.rows || [],
            (result) => {
              status = result
            },
            data
          )
          if (!status) return
          this.GetTableDictionary(data.rows)
          this.rowData = data.rows || []
          this.paginations.total = data.total
          // 合计
          this.getSummaries(data)
        },
        (error) => {
          this.loading = false
          // this.$Message.error(error || "网络异常");
        }
      )
    }, // 获取统计
    getSummaries (data) {
      if (!this.summary || !data.summary) return
      this.summaryData.splice(0)
      // 开启了行号的，+1
      if (this.columnIndex) {
        this.summaryData.push('')
      }
      // 如果有checkbox，应该算作是第一行
      if (this.ck) {
        this.summaryData.push('')
      }

      this.columns.forEach((col) => {
        if (!col.hidden) {
          if (data.summary.hasOwnProperty(col.field)) {
            this.summaryData.push(data.summary[col.field])
          } else {
            this.summaryData.push('')
          }
        }
      })
      if (this.summaryData.length > 0 && this.summaryData[0] == '') {
        this.summaryData[0] = '合计'
      }
    },
    getInputChangeSummaries () { },
    handleSizeChange (val) {
      this.paginations.rows = val
      this.load()
    },
    handleCurrentChange (val) {
      this.paginations.page = val
      this.load()
    },
    sortChange (sort) {
      this.paginations.sort = sort.prop
      this.paginations.order = sort.order == 'ascending' ? 'asc' : 'desc'
      this.load()
    },
    resetPage () {
      // 重置查询分页
      // this.paginations.rows = 30;
      this.paginations.page = 1
    },
    selectionChange (selection) {
      // console.log(selection);
      // 选择行事件,只有单选才触发
      if (this.single && selection.length == 1) {
        this.$emit('rowChange', selection[0]) //
      }
      if (this.single && selection.length > 1) {
        this.$refs.table.toggleRowSelection(selection[0])
      }
      // this.rowChange(selection[0]);
    },
    getColor (row, column) {
      let val = row[column.field]

      // if (val == "" || val == null || val == undefined) {
      //  return "none";
      // }
      if (column.getColor && typeof column.getColor === 'function') {
        let _color = column.getColor(row, column)
        if (_color) {
          return _color
        }
      }
      if (!val && val != '0') {
        return this.defaultColor
      }
      if (!this.formatConfig[column.field]) {
        this.formatConfig[column.field] = [val]
        return this.colors[0]
      }
      let index = this.formatConfig[column.field].indexOf(val)
      if (index != -1) {
        return this.colors[index]
      }
      if (this.formatConfig[column.field].length > 15) {
        return this.defaultColor
      }

      if (index == -1) {
        this.formatConfig[column.field].push(val)
        index = this.formatConfig[column.field].length - 1
      }
      return this.colors[index]
    },
    formatterDate (row, column) {
      return (row[column.field] || '').substr(0, 10)
    },
    formatter (row, column, template) {
      if (!template) return row[column.property]
      let val = row[column.field]
      // 是否值
      if (column.edit && column.edit.type == 'switch') {
        return val ? '是' : '否'
      }
      if (!column.bind || !column.bind.data) {
        return row[column.field]
      }
      if (!val && val != 0) return val
      // 编辑多选table显示
      if (
        (column.bind.type == 'selectList' || column.bind.type == 'checkbox') &&
        typeof val === 'string' &&
        val.indexOf(',') != -1
      ) {
        return this.getSelectFormatter(column, val)
      }
      let source = column.bind.data.filter((x) => {
        // return x.key != "" && x.key == val;
        // 2020.06.06修复单独使用table组件时,key为数字0时转换成文本失败的问题
        return x.key !== '' && x.key !== undefined && x.key + '' === val + ''
      })
      if (source && source.length > 0) val = source[0].value
      return val
    },
    getSelectFormatter (column, val) {
      // 编辑多选table显示
      let valArr = val.split(',')
      for (let index = 0; index < valArr.length; index++) {
        column.bind.data.forEach((x) => {
          // 2020.06.06修复数据源为selectList时,key为数字0时不能转换文本的问题
          if (
            x.key !== '' &&
            x.key !== undefined &&
            x.key + '' == valArr[index] + ''
          ) {
            valArr[index] = x.value
          }
        })
      }
      return valArr.join(',')
    },
    onChange (scope, val, event, column) {
      // 2020.09.03修复onChange不触发的问题
      let row = scope.row
      if (column.onChange && !column.onChange(row, val, event)) {
        return
      }
      // 输入框求和实时计算
      this.getInputSummaries(scope, val, event, column)
    },
    // input输入实时求和
    getInputSummaries (scope, val, event, column) {
      // column列设置了summary属性的才计算值
      if (!column.summary) return
      let sum = 0
      let _index = 0;
      (this.url ? this.rowData : this.tableData).forEach((x, index) => {
        if (x.hasOwnProperty(column.field) && !isNaN(x[column.field])) {
          _index = index
          sum += x[column.field] * 1
        }
      })
      this.$set(this.summaryData, this.summaryIndex[column.field], sum)
    },
    getCellStyle (row) {
      // 2020.12.13增加设置单元格颜色
      if (row.column.property) {
        return (
          this.cellStyleColumns[row.column.property] &&
          this.cellStyleColumns[row.column.property](
            row.row,
            row.rowIndex,
            row.columnIndex
          )
        )
      }
    }
  }
}
</script>
<style lang="less" scoped>
.vol-table {
  position: relative;
  .mask {
    opacity: 0.2;
    position: absolute;
    width: 100%;
    height: 100%;
    background: #d0d0d0;
    z-index: 100;
  }
  .message {
    text-align: center;
    color: #635c5c;
    font-size: 15px;
    font-weight: 600;
    background: #eee;
    transform: translateY(-50%);
    top: 50%;
    position: absolute;
    z-index: 200;
    left: 0;
    right: 0;
    width: 150px;
    margin: 0 auto;
    line-height: 40px;
    border-radius: 4px;
    border: 1px solid #a09e9e;
  }
}
.e-item {
  display: flex;
  > div:first-child {
    flex: 1;
  }
}
</style>

<style scoped>
/*表头错行 .el-table th.gutter{
    display: table-cell!important;
} */
.pagination {
  text-align: right;
  /* margin-top: 8px; */
  padding: 2px 28px;
  border: 1px solid #eee;
  border-top: 0px;
}
.v-table >>> .el-table__header th {
  padding: 0px !important;
  background-color: #f8f8f9 !important;
  font-size: 13px;
  height: 41px;
  color: #616161;
}
.v-table >>> .el-table__header th.is-sortable {
  padding: 3px !important;
}
.vol-table.text-inline >>> .el-table__body .cell {
  word-break: inherit !important;
  white-space: nowrap !important;
}
.v-table >>> .el-table__body td {
  padding: 9px 0 !important;
}

.v-table >>> .el-table__footer td {
  padding: 7px 0 !important;
}
/* 2021.01.30修复火狐checkbox错位问题 */
.vol-table >>> .el-table-column--selection .cell {
  display: inline;
}
.vol-table.text-inline >>> .el-table th > .cell {
  white-space: nowrap !important;
}
.vol-table >>> .el-table__body-wrapper::-webkit-scrollbar {
  width: 10px;
  height: 10px;
}
.vol-table >>> .el-table__body-wrapper::-webkit-scrollbar-thumb {
  border-radius: 5px;
  background: #ddd;
}
.vol-table .table-img {
  height: 40px;
  border-radius: 5px;
  margin-right: 10px;
  width: 40px;
  object-fit: cover;
}
.vol-table .table-img:hover {
  cursor: pointer;
}
.v-table >>> .ivu-tag-default {
  border: none !important;
  background: none !important;
}
/* .v-table >>> .el-table__fixed-body-wrapper {
  top: 41px !important;
} */
.v-table >>> .el-table__fixed:before {
  border-color: none !important;
}
</style>
