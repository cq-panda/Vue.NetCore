//2024.11.16重写组件
export default function () {
  return {
    rowKey: {
      // 树形结构的主键字段，如果设置值默认会开启树形table；注意rowKey字段的值必须是唯一（2021.05.02）
      typeof: String,
      default: undefined
    },
    loadTreeChildren: {
      // 树形结构加载子节点
      type: Function,
      default: (tree, treeNode, resolve) => {
        if (resolve) {
          return resolve([])
        }
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
    },
    height: {
      type: Number,
      default: 0
    },
    extraHeight: {
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
        return { total: 0, size: 30, sortName: '' }
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
      default: true
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
      // 是否自动从后台加载数据源
      type: Boolean,
      default: true
    },
    single: {
      type: Boolean, // 是否单选
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
    },
    highlightCurrentRow: {
      //增加选中行高亮显示(2022.10.07)
      type: Boolean,
      default: true
    },
    select2Count: {
      //超出数量显示select2组件
      type: Number,
      default: 1500
    },
    selectable: {
      type: Function,
      default: (row, index) => {
        return true
      }
    },
    lazy: {
      //树形表格是否默认延迟加载
      type: Boolean,
      default: true
    },
    defaultExpandAll: {
      //树形表格是否展开所有
      type: Boolean,
      default: false
    },
    expandRowKeys: {
      //默认展开行
      type: Array,
      default: () => {
        return []
      }
    },
    rowParentField: {
      //树形表格父级id
      type: String,
      default: ''
    },
    dragPosition: {
      //2023.11.22
      type: String,
      default: '' //可拖动位置，顶部拖动top,底部bottom
    },
    spanMethod: {
      type: Function,
      default: ({ row, column, rowIndex, columnIndex }, rows) => {}
    },
    reserveSelection: {
      //分页或者刷新表格数据后是否保留复选框选择状态，2024.09.10
      type: Boolean,
      default: false
    },
    sortable: {
      //表格是否可以拖拽排序
      type: Boolean,
      default: false
    },
    pagerCount: {
      //分页按钮数量
      type: Number,
      default: 7
    },
    loadBeforeAsync: {
      //异步加载
      type: Function,
      default: (params) => {
        return true
      }
    }
  }
}
