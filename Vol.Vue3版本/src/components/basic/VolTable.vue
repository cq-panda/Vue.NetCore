<template>
  <!-- 2021.11.18移除voltable方法@cell-mouse-leave="rowEndEdit" -->
  <div
    class="vol-table"
    :class="[
      textInline ? 'text-inline' : '',
      fxRight ? 'fx-right' : '',
      isChrome ? 'chrome' : '',
    ]"
  >
    <div class="mask" v-show="loading"></div>
    <div class="message" v-show="loading">加载中.....</div>
    <el-table
      :show-summary="summary"
      :summary-method="getSummaryData"
      :row-key="rowKey"
      :key="randomTableKey"
      lazy
      stripe
      :load="loadTreeChildren"
      @select="userSelect"
      @select-all="userSelect"
      @selection-change="selectionChange"
      @row-dblclick="rowDbClick"
      @row-click="rowClick"
      @header-click="headerClick"
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
      style="width: 100%"
    >
      <el-table-column
        v-if="columnIndex"
        type="index"
        :fixed="fixed"
        width="55"
      ></el-table-column>
      <el-table-column
        v-if="ck"
        type="selection"
        :fixed="fixed"
        width="55"
      ></el-table-column>
      <!-- 2020.10.10移除table第一行强制排序 -->
      <el-table-column
        v-for="(column, cindex) in filterColumns"
        :prop="column.field"
        :label="column.title"
        :min-width="column.width"
        :formatter="formatter"
        :fixed="column.fixed"
        :key="column.field + cindex"
        :align="column.align"
        :sortable="column.sort ? 'custom' : false"
      >
        <template #default="scope">
          <!-- 2022.01.08增加多表头，现在只支持常用功能渲染，不支持编辑功能(涉及到组件重写) -->
          <el-table-column
            style="border: none"
            v-for="columnChildren in filterChildrenColumn(column.children)"
            :key="columnChildren.field"
            :min-width="columnChildren.width"
            :class-name="columnChildren.class"
            :prop="columnChildren.field"
            :align="columnChildren.align"
            :label="columnChildren.title"
          >
            <template #scope1>
              <a
                href="javascript:void(0)"
                style="text-decoration: none"
                @click="link(scope1.row, columnChildren, $event)"
                v-if="column.link"
                v-text="scope1.row[columnChildren.field]"
              ></a>
              <div
                v-else-if="columnChildren.formatter"
                @click="
                  columnChildren.click &&
                    columnChildren.click(
                      scope1.row,
                      columnChildren,
                      scope1.$index
                    )
                "
                v-html="
                  columnChildren.formatter(
                    scope1.row,
                    columnChildren,
                    scope1.$index
                  )
                "
              ></div>
              <div v-else-if="column.bind">
                {{ formatter(scope1.row, columnChildren, true) }}
              </div>
              <span v-else-if="column.type == 'date'">{{
                formatterDate(scope1.row, columnChildren)
              }}</span>
              <template v-else>
                {{ scope1.row[columnChildren.field] }}
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
          <!-- 2021.09.21增加编辑时对readonly属性判断 -->
          <div v-else-if="column.edit && !column.readonly" class="edit-el">
            <div
              @click.stop
              v-if="column.edit.keep || edit.rowIndex == scope.$index"
              class="e-item"
            >
              <div>
                <!-- 2020.07.24增加日期onChange事件 -->
                <el-date-picker
                  clearable
                  size="small"
                  style="width: 100%"
                  v-if="['date', 'datetime'].indexOf(column.edit.type) != -1"
                  v-model="scope.row[column.field]"
                  @change="column.onChange"
                  :type="column.edit.type"
                  :placeholder="column.placeholder || column.title"
                  :disabledDate="(val) => getDateOptions(val, column)"
                  :value-format="getDateFormat(column)"
                >
                </el-date-picker>
                <el-switch
                  v-else-if="column.edit.type == 'switch'"
                  v-model="scope.row[column.field]"
                  active-color="#0f84ff"
                  inactive-color="rgb(194 194 194)"
                  @change="
                    (val) => {
                      switchChange(val, scope.row, column);
                    }
                  "
                  :active-value="
                    typeof scope.row[column.field] == 'boolean' ? true : 1
                  "
                  :inactive-value="
                    typeof scope.row[column.field] == 'boolean' ? false : 0
                  "
                >
                </el-switch>
                <el-select
                  size="small"
                  style="width: 100%"
                  v-else-if="
                    ['select', 'selectList'].indexOf(column.edit.type) != -1
                  "
                  v-model="scope.row[column.field]"
                  :filterable="
                    column.filter || column.bind.data.length > 10 ? true : false
                  "
                  :multiple="column.edit.type == 'select' ? false : true"
                  :placeholder="column.placeholder || column.title"
                  :autocomplete="column.autocomplete"
                  @change="
                    column.onChange && column.onChange(scope.row, column)
                  "
                  clearable
                >
                  <el-option
                    v-for="item in column.bind.data"
                    :key="item.key"
                    :label="item.value"
                    :value="item.key"
                    >{{ item.value }}
                  </el-option>
                </el-select>
                <el-input
                  v-else
                  @change="inputKeyPress(scope.row, column, $event)"
                  @input="inputKeyPress(scope.row, column, $event)"
                  @keyup.enter="inputKeyPress(scope.row, column, $event)"
                  size="small"
                  v-model="scope.row[column.field]"
                  :placeholder="column.placeholder || column.title"
                ></el-input>
              </div>
              <div
                class="extra"
                v-if="column.extra && edit.rowIndex == scope.$index"
              >
                <a
                  :style="column.extra.style"
                  style="text-decoration: none"
                  @click="extraClick(scope.row, column)"
                >
                  <i v-if="column.extra.icon" :clss="[column.extra.icon]" />
                  {{ column.extra.text }}
                </a>
              </div>
            </div>
            <template v-else>
              <div
                v-if="column.formatter"
                v-html="column.formatter(scope.row, column)"
              ></div>
              <div v-else>{{ formatter(scope.row, column, true) }}</div>
            </template>
          </div>
          <!--没有编辑功能的直接渲染标签-->
          <template v-else>
            <a
              href="javascript:void(0)"
              style="text-decoration: none"
              @click="link(scope.row, column, $event)"
              v-if="column.link"
              v-text="scope.row[column.field]"
            ></a>
            <img
              v-else-if="column.type == 'img'"
              v-for="(file, imgIndex) in getFilePath(
                scope.row[column.field],
                column
              )"
              :key="imgIndex"
              :onerror="defaultImg"
              @click="viewImg(scope.row, column, file.path, $event)"
              class="table-img"
              :src="file.path"
            />
            <a
              style="margin-right: 8px"
              v-else-if="column.type == 'file' || column.type == 'excel'"
              class="t-file"
              v-for="(file, fIndex) in getFilePath(
                scope.row[column.field],
                column
              )"
              :key="fIndex"
              @click="dowloadFile(file)"
              >{{ file.name }}</a
            >
            <span v-else-if="column.type == 'date'">{{
              formatterDate(scope.row, column)
            }}</span>
            <div
              v-else-if="column.formatter"
              @click="formatterClick(scope.row, column, $event)"
              v-html="column.formatter(scope.row, column)"
            ></div>
            <!-- 2021.11.18修复table数据源设置为normal后点击行$event缺失的问题 -->
            <div
              v-else-if="column.bind && column.normal"
              @click="formatterClick(scope.row, column, $event)"
              :style="column.getStyle && column.getStyle(scope.row, column)"
            >
              {{ formatter(scope.row, column, true) }}
            </div>
            <div
              v-else-if="column.click"
              @click="formatterClick(scope.row, column)"
            >
              {{ scope.row[column.field] }}
            </div>
            <template v-else-if="column.bind">
              <el-tag
                size="small"
                :class="[isEmptyTag(scope.row, column)]"
                :type="getColor(scope.row, column)"
                >{{ formatter(scope.row, column, true) }}</el-tag
              >
            </template>

            <span v-else>{{ formatter(scope.row, column, true) }}</span>
          </template>
        </template>
      </el-table-column>
    </el-table>
    <template v-if="!paginationHide">
      <div class="block pagination" key="pagination-01">
        <el-pagination
          key="pagination-02"
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="paginations.page"
          :page-sizes="paginations.sizes"
          :page-size="paginations.size"
          layout="total, sizes, prev, pager, next, jumper"
          :total="paginations.total"
        ></el-pagination>
      </div>
    </template>
  </div>
</template>
<script>
import VolTableRender from "./VolTable/VolTableRender";
var $vue;
let _errMsg;
import { defineComponent } from "vue";
export default defineComponent({
  //https://github.com/element-plus/element-plus/issues/1483
  //没有原先的selection属性了，看issue上使用select/selectall获取
  //监听数组长度，如果删除了数据，现在只能被迫清除所有选中的行
  watch: {
    "tableData.length": {
      handler(newLen, oldLen) {
        this.watchRowSelectChange(newLen, oldLen);
      },
    },
    "rowData.length": {
      handler(newLen, oldLen) {
        this.watchRowSelectChange(newLen, oldLen);
      },
    },
  },
  components: { "table-render": VolTableRender },
  props: {
    rowKey: {
      // 树形结构的主键字段，如果设置值默认会开启树形table；注意rowKey字段的值必须是唯一（2021.05.02）
      typeof: String,
      default: undefined,
    },
    loadTreeChildren: {
      // 树形结构加载子节点
      type: Function,
      default: (tree, treeNode, resolve) => {
        return resolve([]);
      },
    },
    textInline: {
      // 表格内容超出后是否换行显示（2020.01.16）
      type: Boolean,
      default: true,
    },
    tableData: {
      // 表数据源,配置了url就不用传这个参数了
      type: Array,
      default: () => {
        return [];
      },
    },
    columns: {
      type: Array,
      default: [],
    },
    height: {
      type: Number,
      default: 0,
    },
    maxHeight: {
      type: Number,
      default: 0,
    },
    linkView: {
      type: Function,
      default: function () {
        return 1;
      },
    },
    pagination: {
      type: Object,
      default: function () {
        return { total: 0, size: 30, sortName: "" };
      },
    },
    url: {
      type: String,
      default: "",
    },
    paginationHide: {
      type: Boolean,
      default: true,
    },
    color: {
      type: Boolean,
      default: true,
    },
    index: {
      // 是否创建索引号,如果需要表格编辑功能，这里需要设置为true
      type: Boolean,
      default: false,
    },
    allowEmpty: {
      // 表格数据为空时是否默认为--
      type: Boolean,
      default: true,
    },
    defaultLoadPage: {
      // 传入了url，是否默认加载表格数据
      type: Boolean,
      default: true,
    },
    loadKey: {
      // 是否自动从后台加载数据源
      type: Boolean,
      default: true,
    },
    single: {
      type: Boolean, // 是否单选
      default: false,
    },
    doubleEdit: {
      type: Boolean, // 是否双击启用编辑功能
      default: true,
    },
    beginEdit: {
      // 编辑开始
      type: Function,
      default: function (row, column, index) {
        return true;
      },
    },
    endEditBefore: {
      // 结束编辑前
      type: Function,
      default: function (row, column, index) {
        return true;
      },
    },
    endEditAfter: {
      // 结束编辑前
      type: Function,
      default: function (row, column, index) {
        return true;
      },
    },
    ck: {
      // 是否显示checkbox
      type: Boolean,
      default: true,
    },
    columnIndex: {
      // 是否显示行号(2020..11.1)
      type: Boolean,
      default: true,
    },
  },
  data() {
    return {
      fixed: false, //是固定行号与checkbox
      clickEdit: true, //2021.07.17设置为点击行结束编辑
      randomTableKey: 1,
      visiblyColumns: [],
      key: "",
      realHeight: 0,
      realMaxHeight: 0,
      enableEdit: false, // 是否启表格用编辑功能
      empty: this.allowEmpty ? "" : "--",
      defaultImg: 'this.src="' + require("@/assets/imgs/error.png") + '"',
      loading: false,
      footer: {},
      total: 0,
      formatConfig: {},
      // defaultColor: "",
      // 2020.09.06调整table列数据源的背景颜色
      colors: [
        "",
        "warning",
        "success",
        "green",
        "info",
        // "magenta",
        // "geekblue",
        // "gold",
        // "orange",
        // "default",
      ],
      rule: {
        phone: /^[1][3,4,5,6,7,8,9][0-9]{9}$/,
        decimal: /(^[\-0-9][0-9]*(.[0-9]+)?)$/,
        number: /(^[\-0-9][0-9]*([0-9]+)?)$/,
      },
      columnNames: [],
      rowData: [],
      paginations: {
        sort: "",
        order: "desc",
        Foots: "",
        total: 0,
        // 2020.08.29增加自定义分页条大小
        sizes: [30, 60, 100, 120],
        size: 30, // 默认分页大小
        Wheres: [],
        page: 1,
        rows: 30,
      },
      errorFiled: "",
      edit: { columnIndex: -1, rowIndex: -1 }, // 当前双击编辑的行与列坐标
      editStatus: {},
      summary: false, // 是否显示合计
      // 目前只支持从后台返回的summaryData数据
      summaryData: [],
      summaryIndex: {},
      remoteColumns: [], // 需要每次刷新或分页后从后台加载字典数据源的列配置
      cellStyleColumns: {}, // 有背景颜色的配置
      fxRight: false, //是否有右边固定表头
      selectRows: [], //当前选中的行
      isChrome: false,
    };
  },
  created() {
    //2021.06.19判断谷歌内核浏览重新计算table高度
    if (
      navigator.userAgent.indexOf("Chrome") != -1 ||
      navigator.userAgent.indexOf("Edge") != -1
    ) {
      this.isChrome = true;
    }
    this.realHeight = this.getHeight();
    this.realMaxHeight = this.getMaxHeight();
    this.fxRight = this.columns.some((x) => {
      return x.fixed == "right";
    });
    //2021.09.21移除强制固定行号与checkbox列
    if (
      this.fxRight ||
      this.columns.some((x) => {
        return x.fixed;
      })
    ) {
      this.fixed = true;
    }

    // 从后台加下拉框的[是否启用的]数据源
    let keys = [];
    let columnBind = [];
    this.summaryData.push("合计");
    if (this.columnIndex) {
      this.summaryData.push(" ");
    }
    this.columns.forEach((x, _index) => {
      if (x.cellStyle) {
        this.cellStyleColumns[x.field] = x.cellStyle;
      }
      if (!x.hidden) {
        // this.summaryIndex[x.field] = _index;
        // 2020.10.11修复求和列错位的问题
        this.summaryData.push("");
        this.summaryIndex[x.field] = this.summaryData.length - 1;
      }
      // 求和
      if (x.summary && !this.summary) {
        this.summary = true;
      }
      if (x.bind && x.bind.key && (!x.bind.data || x.bind.data.length == 0)) {
        // 写入远程
        if (!x.bind.data) x.bind.data = [];
        if (x.bind.remote) {
          this.remoteColumns.push(x);
        } else if (this.loadKey) {
          keys.push(x.bind.key);
          x.bind.valueTyoe = x.type;
          columnBind.push(x.bind);
        }
      }
    });
    if (keys.length > 0) {
      this.http
        .post("/api/Sys_Dictionary/GetVueDictionary", keys)
        .then((dic) => {
          dic.forEach((x) => {
            columnBind.forEach((c) => {
              // 转换数据源的类型与列的类型一致(2020.04.04)
              if (c.valueTyoe == "int" || c.valueTyoe == "sbyte") {
                x.data.forEach((d) => {
                  // 2020.09.01增加对数字类型的二次判断
                  if (!isNaN(d.key)) {
                    d.key = ~~d.key;
                  }
                });
              }
              if (c.key == x.dicNo) c.data.push(...x.data);
            });
          });
        });
    }

    this.paginations.sort = this.pagination.sortName;
    // 2020.08.29增加自定义分页条大小
    Object.assign(this.paginations, this.pagination);
    if (this.pagination.size) {
      this.paginations.rows = this.pagination.size;
    }
    this.enableEdit = this.columns.some((x) => {
      return x.hasOwnProperty("edit");
    });
    let keyColumn = this.columns.find((x) => {
      return x.isKey;
    });
    if (keyColumn) {
      this.key = keyColumn.field;
    }
    // 如果下拉框，判断bind或edit.data是否有数据源，妱果没有则获取数据源bind
    $vue = this;
    // this.$emit
    this.defaultLoadPage && this.load();
  },
  computed: {
    filterColumns() {
      return this.columns.filter((x, index) => {
        if (!x.field) {
          x.field = x.title + index;
        }
        return !x.hidden;
      });
    },
  },
  methods: {
    watchRowSelectChange(newLen, oldLen) {
      if (newLen < oldLen && this.selectRows.length) {
        this.selectRows = [];
        $vue.$refs.table.clearSelection();
      }
    },
    switchChange(val, row, column) {
      //这里在初始化的时候也会触发change事件
      if (Object.keys(row).length <= 1) {
        return;
      }
      if (column.onChange) {
        column.onChange(val, row, column);
      }
    },
    inputKeyPress(row, column, $event, $e) {
      column.onKeyPress && column.onKeyPress(row, column, $event);
      this.getInputSummaries(null, null, $event, column);
    },
    extraClick(row, column) {
      column.extra.click &&
        column.extra.click(row, column, url ? rowData : tableData);
    },
    headerClick(column, event) {
      if (this.clickEdit && this.edit.rowIndex != -1) {
        if (
          this.rowEndEdit(
            this.url
              ? this.rowData[this.edit.rowIndex]
              : this.tableData[this.edit.rowIndex],
            column
          )
        ) {
          this.edit.rowIndex = -1;
        }
      }
      // this.edit.rowIndex = -1;
    },
    rowDbClick(row, column, event) {
      //2021.05.23增加双击行事件
      this.$emit("rowDbClick", { row, column, event });
    },
    rowClick(row, column, event) {
      //2022.02.20增加点击时表格参数判断
      if (!column) {
        return;
      }
      //正在编辑时，禁止出发rowClick事件
      if (this.edit.rowIndex == -1) {
        this.$emit("rowClick", { row, column, event });
      }
      // 点击行事件(2020.11.07)

      if (!this.doubleEdit) {
        return;
      }
      // 点击其他行时，如果点击的行与正在编辑的行相同，保持编辑状态
      if (this.clickEdit && this.edit.rowIndex != -1) {
        if (row.elementIndex == this.edit.rowIndex) {
          // 点击的单元格如果不可以编辑，直接结束编辑
          // 2020.10.12修复结束编辑时，element table高版本属性获取不到的问题
          let _col = this.columns.find((x) => {
            return x.field == ((event && event.property) || column.property);
          });
          if (_col && (!_col.edit || _col.readonly)) {
            if (this.rowEndEdit(row, event)) {
              this.edit.rowIndex = -1;
            }
          }
          return;
        }
        if (this.rowEndEdit(row, event && event.property ? event : column)) {
          this.edit.rowIndex = -1;
        }
      }
      this.rowBeginEdit(row, column);
    },
    dowloadFile(file) {
      this.base.dowloadFile(
        file.path,
        file.name,
        {
          Authorization: this.$store.getters.getToken(),
        },
        this.http.ipAddress
      );
    },
    getFilePath(pathSring, column) {
      // 获取表的图片与文件显示
      if (!pathSring) return [];
      // 增加图片自定义操作
      // 返回格式必须是[{name:"文件名",path:"图片全路径或base64格式"}]
      if (column.formatter) {
        return column.formatter(pathSring);
      }
      let filePath = pathSring.replace(/\\/g, "/").split(",");
      let fileInfo = [];
      for (let index = 0; index < filePath.length; index++) {
        let file = filePath[index];
        // 2020.12.19增加base64图片显示
        if (column.base64) {
          fileInfo.push({
            name: "",
            path:
              (file.indexOf("base64,") == -1 ? "data:image/png;base64," : "") +
              file,
          });
        } else if (file.indexOf(".") != -1) {
          let splitFile = file.split("/");
          if (splitFile.length > 0) {
            fileInfo.push({
              name: splitFile[splitFile.length - 1],
              path: this.base.isUrl(file) ? file : this.http.ipAddress + file,
            });
          }
        }
      }
      return fileInfo;
    },
    // 重置table
    reset() {
      if (this.tableData && this.tableData.length > 0) {
        this.tableData.splice(0);
      }
      if (this.rowData && this.rowData.length > 0) {
        this.rowData.splice(0);
      }
      if (!this.paginationHide) {
        this.paginations.page = 1;
        // this.paginations.rows = 30;
        if (this.paginations.wheres && this.paginations.wheres.length > 0) {
          this.paginations.wheres.splice(0);
        }
      }
      this.errorFiled = "";
      this.edit.columnIndex = -1;
      this.edit.rowIndex = -1;
    },
    getHeight() {
      // 没有定义高度与最大高度，使用table默认值
      if (!this.height && !this.maxHeight) {
        return null;
      }
      // 定义了最大高度则不使用高度
      if (this.maxHeight) {
        return null;
      }
      // 使用当前定义的高度
      return this.height;
    },
    getMaxHeight() {
      // 没有定义高度与最大高度，使用table默认值
      if (!this.height && !this.maxHeight) {
        return null;
      }
      // 定义了最大高度使用最大高度
      if (this.maxHeight) {
        return this.maxHeight;
      }
      // 不使用最大高度
      return null;
    },
    getSelectedOptions(column) {
      if (column.bind && column.bind.data && column.bind.data.length > 0) {
        return column.bind.data;
      }
      return [];
    },
    formatterClick(row, column, event) {
      column.click && column.click(row, column, event);
      event.stopPropagation();
    },
    initIndex({ row, rowIndex }) {
      if (this.index) {
        row.elementIndex = rowIndex;
      }
      // if (rowIndex%2!==0) {
      //  return "even-row";
      // }
      return;
    },
    toggleEdit(event) {},
    setEditStatus(status) {
      // this.columns.forEach((x) => {
      //   if (x.hasOwnProperty("edit")) {
      //     this.$set(x.edit, "status", status);
      //   }
      // });
    },
    // 通过button按钮启用编辑
    beginWithButtonEdit(scope) {
      // url?rowData:tableData
      this.rowBeginEdit(scope.row, this.columns[scope.$index]);
    },
    rowBeginEdit(row, column) {
      if (this.edit.rowIndex != -1) {
        return;
      }
      let _row = this.columns.find((x) => x.field == column.property);
      if (_row) {
        if (_row.readonly) {
          return;
        }
        if (
          //不能编辑的字段、switch，点击不开启启编辑功能
          !_row.edit ||
          (_row.edit.keep && _row.edit.type == "switch")
        ) {
          return;
        }
      }
      if (!this.enableEdit) return;
      _errMsg = "";
      // 编辑前
      if (!this.beginEdit(row, column, row.elementIndex)) return;
      if (row.hasOwnProperty("elementIndex")) {
        if (this.edit.rowIndex == row.elementIndex) {
          return;
        }
        this.edit.rowIndex = row.elementIndex;
      }
    },
    rowEndEdit(row, column, event) {
      if (this.clickEdit && event) {
        return true;
      }
      if (!this.enableEdit) {
        if (!this.errorFiled) {
          if (
            this.edit.rowIndex != -1 &&
            !this.endEditAfter(row, column, this.edit.rowIndex)
          ) {
            return false;
          }
          this.edit.rowIndex = -1;
        }
        return true;
      }
      if (!this.doubleEdit && event) {
        return true;
      }
      // 结束编辑前
      if (!this.endEditBefore(row, column, this.edit.rowIndex)) return false;

      if (this.edit.rowIndex != -1) {
        let row = (this.url ? this.rowData : this.tableData)[
          this.edit.rowIndex
        ];
        for (let index = 0; index < this.columns.length; index++) {
          const _column = this.columns[index];
          if (_column.edit) {
            if (!this.validateRow(row, _column)) {
              return;
            }
          }
        }
      }
      if (!this.endEditAfter(row, column, this.edit.rowIndex)) return false;
      this.edit.rowIndex = -1;
      return true;
    },
    validateRow(row, option1) {
      if (!this.validateColum(option1, row)) {
        this.errorFiled = option1.field;
        _errMsg = option1.title + _errMsg;
        this.$message.error(_errMsg);
        return false;
      }
      this.errorFiled = "";
      return true;
    },
    validateColum(option, data) {
      if (option.hidden || option.bind) return true;
      let val = data[option.field];
      if (option.require || option.required) {
        if (val != "0" && (val === "" || val === undefined)) {
          if (!this.errorFiled) {
            _errMsg = "不能为空";
          }
          return false;
        }
      }
      if (!option.edit) {
        return true;
      }
      let editType = option.edit.type;
      // 验证数字
      if (editType == "int" || editType == "decimal" || editType == "number") {
        if (val == "" || val == undefined) return true;
        if (editType == "decimal") {
          if (!this.rule.decimal.test(val)) {
            _errMsg = "只能是数字";
            return false;
          }
        } else if (!this.rule.decimal.test(val)) {
          _errMsg = "只能是数字";
          return false;
        }
        if (
          option.edit.min != undefined &&
          typeof option.edit.min === "number" &&
          val < option.edit.min
        ) {
          _errMsg = "不能小于" + option.edit.min;
          return false;
        }
        if (
          option.edit.max != undefined &&
          typeof option.edit.max === "number" &&
          val > option.edit.max
        ) {
          _errMsg = "不能大于" + option.edit.max;
          return false;
        }
        return true;
      }

      // 验证字符串
      if (val && (editType == "text" || editType == "string")) {
        if (
          option.edit.min != undefined &&
          typeof option.edit.min === "number" &&
          val.length < option.edit.min
        ) {
          _errMsg = "至少" + option.edit.min + "个字符";
          return false;
        }
        if (
          option.edit.max != undefined &&
          typeof option.edit.max === "number" &&
          val.length > option.edit.max
        ) {
          _errMsg = "最多" + option.edit.max + "个字符";
          return false;
        }
      }
      return true;
    },
    delRow() {
      let rows = this.getSelected();
      if (rows.length == 0) return this.$Message.error("请选择要删除的行!");

      let data = this.url ? this.rowData : this.tableData;
      let indexArr = this.getSelectedIndex();
      if (indexArr.length == 0) {
        return this.$Message.error(
          "删除操作必须设置VolTable的属性index='true'"
        );
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
            data.splice(i, 1);
          }
        }
      }
      this.edit.rowIndex = -1;
      return rows;
    },
    addRow(row) {
      if (!row) {
        row = {};
      }
      this.columns.forEach((x) => {
        if (!row.hasOwnProperty(x.field)) {
          if (x.edit && x.edit.type == "switch") {
            row[x.field] = x.type == "bool" ? false : 0;
          } else if (!row.hidden) {
            // 2020.09.06添加行时，设置默认字段
            row[x.field] = undefined;
          }
        }
      });
      if (!this.url) {
        this.tableData.push(row);
        return;
      }
      this.rowData.push(row);
    },
    viewImg(row, column, url, $event) {
      $event.stopPropagation();
      this.base.previewImg(url);
      // window.open(row[column.field]);
    },
    link(row, column, $e) {
      $e.stopPropagation();
      this.$props.linkView(row, column);
    },
    getSelected() {
      return this.selectRows;
    },
    getSelectedIndex() {
      if (!this.index) {
        // 只有设置了属性index才有索引行
        return [];
      }
      let indexArr = this.selectRows.map((x) => {
        return x.elementIndex;
      });
      return indexArr || [];
    },
    GetTableDictionary(rows) {
      // 分页或刷新或重新绑定数据源
      if (this.remoteColumns.length == 0 || !rows || rows.length == 0) return;
      let remoteInfo = {};
      for (let index = 0; index < this.remoteColumns.length; index++) {
        const column = this.remoteColumns[index];
        //  column.bind.data.splice(0);
        let key = column.bind.key;
        let data = [];
        rows.forEach((row) => {
          if (data.indexOf(row[column.field]) == -1) {
            data.push(row[column.field]);
          }
        });
        if (data.length > 0) {
          remoteInfo[key] = data;
        }
      }
      if (remoteInfo.length == 0) return;
      // ha= Object.assign([], ha, hb)
      this.http
        .post("/api/Sys_Dictionary/GetTableDictionary", remoteInfo)
        .then((dic) => {
          dic.forEach((x) => {
            this.remoteColumns.forEach((column) => {
              if (column.bind.key == x.key) {
                column.bind.data = Object.assign([], column.bind.data, x.data);
                // column.bind.data.push(...x.data);
              }
            });
          });
        });
    },
    load(query, isResetPage) {
      // isResetPage重置分页数据
      if (!this.url) return;
      if (isResetPage) {
        this.resetPage();
      }
      let param = {
        page: this.paginations.page,
        rows: this.paginations.rows,
        sort: this.paginations.sort,
        order: this.paginations.order,
        wheres: [], // 查询条件，格式为[{ name: "字段", value: "xx" }]
      };
      let status = true;
      // 合并查询信息(包查询分页、排序、查询条件等)
      if (query) {
        param = Object.assign(param, query);
      }
      /* 查询前处理(如果需要查询条件，实现组件方法loadBefore方法即可:
        loadBefore=(param, callBack)=>{
          param.wheres = [{ name: "PhoneNo", value: "13419098211" }];
          callBack(true);
        })
      */
      this.$emit("loadBefore", param, (result) => {
        status = result;
      });
      if (!status) return;

      if (param.wheres && param.wheres instanceof Array) {
        param.wheres = JSON.stringify(param.wheres);
      }
      this.loading = true;
      this.http.post(this.url, param).then(
        (data) => {
          //2021.06.04修复tree不刷新的问题
          if (this.rowKey) {
            this.randomTableKey++;
            this.rowData.splice(0);
          }
          this.loading = false;
          // 查询返回结果后处理
          // 2020.10.30增加查询后返回所有的查询信息
          this.$emit(
            "loadAfter",
            data.rows || [],
            (result) => {
              status = result;
            },
            data
          );
          if (!status) return;
          this.GetTableDictionary(data.rows);
          this.rowData = data.rows || [];
          this.paginations.total = data.total;
          // 合计
          this.getSummaries(data);
        },
        (error) => {
          this.loading = false;
          // this.$Message.error(error || "网络异常");
        }
      );
    }, // 获取统计
    getSummaries(data) {
      if (!this.summary || !data.summary) return;
      this.summaryData.splice(0);
      // 开启了行号的，+1
      if (this.columnIndex) {
        this.summaryData.push("");
      }
      // 如果有checkbox，应该算作是第一行
      if (this.ck) {
        this.summaryData.push("");
      }

      this.columns.forEach((col) => {
        if (!col.hidden) {
          if (data.summary.hasOwnProperty(col.field)) {
            this.summaryData.push(data.summary[col.field]);
          } else {
            this.summaryData.push("");
          }
        }
      });
      if (this.summaryData.length > 0 && this.summaryData[0] == "") {
        this.summaryData[0] = "合计";
      }
    },
    getInputChangeSummaries() {},
    handleSizeChange(val) {
      this.paginations.size = val;
      this.paginations.rows = val;
      this.load();
    },
    handleCurrentChange(val) {
      this.paginations.page = val;
      this.load();
    },
    sortChange(sort) {
      this.paginations.sort = sort.prop;
      this.paginations.order = sort.order == "ascending" ? "asc" : "desc";
      this.load();
    },
    resetPage() {
      // 重置查询分页
      // this.paginations.rows = 30;
      this.paginations.page = 1;
    },
    selectionChange(selection) {
      // console.log(selection);
      // 选择行事件,只有单选才触发
      this.selectRows = selection;
      if (this.single) {
        if (selection.length == 1) {
          this.$emit("rowChange", selection[0]);
        }
        if (selection.length > 1) {
          let _row = selection[selection.length - 1];
          this.$refs.table.toggleRowSelection(selection[0]);
          this.selectRows = [_row];
        }
      }
    },
    getColor(row, column) {
      let val = row[column.field];
      if (column.getColor && typeof column.getColor === "function") {
        let _color = column.getColor(row, column);
        if (_color) {
          return _color;
        }
      }
      if (!val && val != "0") {
        return "";
      }
      if (!this.formatConfig[column.field]) {
        this.formatConfig[column.field] = [val];
        return this.colors[0];
      }
      let index = this.formatConfig[column.field].indexOf(val);
      if (index != -1) {
        return this.colors[index];
      }
      if (this.formatConfig[column.field].length > 5) {
        return "";
      }

      if (index == -1) {
        this.formatConfig[column.field].push(val);
        index = this.formatConfig[column.field].length - 1;
      }
      return this.colors[index];
    },
    formatterDate(row, column) {
      return (row[column.field] || "").substr(0, 10);
    },
    formatter(row, column, template) {
      if (!template) return row[column.property];
      let val = row[column.field];
      // 是否值
      if (column.edit && column.edit.type == "switch") {
        return val ? "是" : "否";
      }
      if (!column.bind || !column.bind.data) {
        return row[column.field];
      }
      if (!val && val != 0) return val;
      // 编辑多选table显示
      if (
        (column.bind.type == "selectList" || column.bind.type == "checkbox") &&
        typeof val === "string" &&
        val.indexOf(",") != -1
      ) {
        return this.getSelectFormatter(column, val);
      }
      let source = column.bind.data.filter((x) => {
        // return x.key != "" && x.key == val;
        // 2020.06.06修复单独使用table组件时,key为数字0时转换成文本失败的问题
        return x.key !== "" && x.key !== undefined && x.key + "" === val + "";
      });
      if (source && source.length > 0) val = source[0].value;
      return val;
    },
    getSelectFormatter(column, val) {
      // 编辑多选table显示
      let valArr = val.split(",");
      for (let index = 0; index < valArr.length; index++) {
        column.bind.data.forEach((x) => {
          // 2020.06.06修复数据源为selectList时,key为数字0时不能转换文本的问题
          if (
            x.key !== "" &&
            x.key !== undefined &&
            x.key + "" == valArr[index] + ""
          ) {
            valArr[index] = x.value;
          }
        });
      }
      return valArr.join(",");
    },
    onChange(scope, val, event, column) {
      // 2020.09.03修复onChange不触发的问题
      let row = scope.row;
      if (column.onChange && !column.onChange(row, val, event)) {
        return;
      }
      // 输入框求和实时计算
      this.getInputSummaries(scope, val, event, column);
    },
    // input输入实时求和
    getInputSummaries(scope, val, event, column) {
      // column列设置了summary属性的才计算值
      if (!column.summary) return;
      let sum = 0;
      let _index = 0;
      (this.url ? this.rowData : this.tableData).forEach((x, index) => {
        if (x.hasOwnProperty(column.field) && !isNaN(x[column.field])) {
          _index = index;
          sum += x[column.field] * 1;
        }
      });
      this.summaryData[this.summaryIndex[column.field]] = sum;
    },
    getSummaryData({ columns, data }) {
      return this.summaryData;
    },
    getCellStyle(row) {
      // 2020.12.13增加设置单元格颜色
      if (row.column.property) {
        return (
          this.cellStyleColumns[row.column.property] &&
          this.cellStyleColumns[row.column.property](
            row.row,
            row.rowIndex,
            row.columnIndex
          )
        );
      }
    },
    compareDate(date1, date2) {
      if (!date2) {
        return true;
      }
      return (
        date1.valueOf() <
        (typeof date2 == "number" ? date2 : new Date(date2).valueOf())
      );
    },
    getDateOptions(date, item) {
      //2021.07.17设置时间可选范围
      if ((!item.min && !item.max) || !date) {
        return false;
      }
      if (item.min && item.min.indexOf(" ") == -1) {
        //不设置时分秒，后面会自动加上 08:00
        item.min = item.min + " 00:00:000";
      }
      return (
        this.compareDate(date, item.min) || !this.compareDate(date, item.max)
      );
    },
    getDateFormat(column) {
      //见https://day.js.org/docs/zh-CN/display/format
      return column.edit.type == "date" ? "YYYY-MM-DD" : "YYYY-MM-DD HH:mm:ss";
    },
    userSelect(selection, row) {
      this.selectRows = selection;
      if (!this.single) {
        this.$emit("rowChange", { row, selection });
      }
    },
    isEmptyTag(row, column) {
      if (!row[column.field] && row[column.field] != "0") {
        return "empty-tag";
      }
      return "";
    },
    filterChildrenColumn(children) {
      if (!children) {
        return [];
      }
      return children.filter((x) => {
        return !x.hidden;
      });
    },
  },
});
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
.vol-table ::v-deep(.el-pager .number) {
  padding: 0 7px;
  border-radius: 5px;
  border: 1px solid #e6e6e6;
  margin-left: 8px;
  font-weight: 500;
  min-width: 28px;
}
.vol-table ::v-deep(.el-pager .number.active) {
  background: #ed4014;
  color: #fff;
}
.vol-table .t-file {
  color: #1e8cff;
  cursor: pointer;
  border-bottom: 1px solid;
  padding-bottom: 2px;
}
.vol-table .empty-tag {
  border: none;
  background: none;
}
.v-table ::v-deep(.el-date-editor .el-icon-date),
.v-table ::v-deep(.el-date-editor .el-icon-time) {
  width: 10px;
}

.vol-table.fx-right ::v-deep(.el-table__header th:last-child) {
  border-left: 1px solid #eff1f5;
}
.vol-table.fx-right ::v-deep(.el-table__row) {
  td:last-child {
    border-left: 1px solid #eff1f5;
  }
}
</style>

<style scoped>
/* .v-table ::v-deep(.even-row){
  background: rgb(245,247,250);
} */
.pagination {
  text-align: right;
  padding: 2px 28px;
  border: 1px solid #eee;
  border-top: 0px;
}
.v-table ::v-deep(.el-input .el-input__inner) {
  padding: 0 7px;
}
.v-table ::v-deep(.el-table__header th) {
  /* padding: 0px !important; */
  background-color: #f8f8f9 !important;
  font-size: 13px;
  height: 46px;
  color: #616161;
}
.v-table ::v-deep(.el-date-editor .el-input__inner) {
  padding-left: 20px;
}
.v-table ::v-deep(.el-table__header th.is-sortable) {
  padding: 3px !important;
}
.vol-table.text-inline ::v-deep(.el-table__body .cell),
.vol-table ::v-deep(.el-table__header-wrapper .cell) {
  word-break: inherit !important;
  white-space: nowrap !important;
}
/* .v-table  ::v-deep(.el-table__body td) {
  padding: 9px 0 !important;
} */

.v-table ::v-deep(.el-table__footer td) {
  padding: 7px 0 !important;
}

.vol-table ::v-deep(.el-table-column--selection .cell) {
  display: inline;
}
.vol-table.text-inline ::v-deep(.el-table th > .cell) {
  white-space: nowrap !important;
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

.vol-table.chrome ::v-deep(.el-table__fixed) {
  height: calc(100% - 8px) !important;
  /* background: white; */
  /* box-shadow: 0px -11px 10px rgb(0 0 0 / 12%) !important; */
}
.vol-table.chrome ::v-deep(.el-table__body-wrapper::-webkit-scrollbar) {
  width: 8px;
  height: 8px;
}
.vol-table.chrome ::v-deep(.el-table__body-wrapper::-webkit-scrollbar-thumb) {
  border-radius: 5px;
  background: rgb(109, 109, 109);
}

.vol-table.chrome ::v-deep(.el-table__fixed:before) {
  background-color: unset;
}
</style>
