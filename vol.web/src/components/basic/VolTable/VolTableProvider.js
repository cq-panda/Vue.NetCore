import { default as Sortable } from 'sortablejs'
import { cellFormatter } from './VolTableFormat.js'
export const initPaginations = (paginations) => {
  // const paginations = reactive({
  //   sort: "",
  //   order: "desc",
  //   Foots: "",
  //   total: 0,
  //   sizes: [30, 60, 100, 120],
  //   size: 30, // 默认分页大小
  //   wheres: [],
  //   page: 1,
  //   rows: 30,
  // });
  paginations.sort = paginations.sortName || paginations.sort
  paginations.order = paginations.order || 'desc'
  paginations.total = paginations.total || 0
  paginations.sizes = paginations.sizes || [30, 60, 100, 120]
  paginations.size = paginations.size || 30
  paginations.rows = paginations.size
  paginations.page = paginations.page || 1
  paginations.wheres = paginations.wheres || 30
}
export const getColumnFilters = (proxy, column, tableData) => {
  let arr = []
  let rows = tableData
  for (let index = 0; index < rows.length; index++) {
    const row = rows[index]
    if (
      !arr.some((c) => {
        return c.value === row[column.field]
      })
    ) {
      let obj = { text: cellFormatter(proxy, row, column, true), value: row[column.field] }
      arr.push(obj)
    }
  }
  return arr
}
export const isEmptyTag = (row, column) => {
  if (!row[column.field] && row[column.field] != '0') {
    return 'empty-tag'
  }
  return
}
export const filterChildrenColumn = (children) => {
  if (!children) {
    return []
  }
  return children.filter((x) => {
    return !x.hidden
  })
}

export const initColumnDisabled = (row, column) => {
  return column.getDisabled && column.getDisabled(row, column)
}

export const initDrag = (props, dragRef, tableRef, showDragMask, realHeight) => {
  if (!props.dragPosition) {
    return
  }
  let disY = 0
  // console.log('11111')
  dragRef.onmousedown = (ev) => {
    // return;
    showDragMask.value = true
    ev = ev || window.event
    disY = ev.clientY
    let disH = tableRef.offsetHeight // 获取拖拽前div的高
    document.onmousemove = (ev) => {
      ev = ev || window.event
      let H = ev.clientY - disY + disH
      if (H < 100) {
        H = 100
      }
      if (H > 600) {
        H = 600
      }
      realHeight.value = H
    }
    document.onmouseup = () => {
      setTimeout(() => {
        showDragMask.value = false
      }, 400)
      document.onmousemove = null
      document.onmouseup = null
    }
  }
}

export const initSortable = (props, emit, nextTick, refTable, getTable) => {
  if (!props.sortable) return
  const tbody = refTable.querySelectorAll('.el-table__body-wrapper tbody')[0]
  Sortable.create(tbody, {
    disabled: false,
    animation: 150,
    group: { pull: false, put: false },
    onEnd: ({ newIndex, oldIndex }) => {
      let rows = getTable();//  tableData
      rows.splice(newIndex, 0, rows.splice(oldIndex, 1)[0])
      const newArr = rows.splice(0)
      nextTick(() => {
        rows.push(...newArr)
        emit('onSortEnd', rows, newIndex, oldIndex)
      })
    }
  })
}
export const validateRow = (proxy, props, row, column) => {
  proxy.errMsg = ''
  proxy.errField = ''
  if (!validateColum(proxy, props, column, row)) {
    proxy.errField = column.field
    // 2022.05.06 修改错误信息重复的问题
    proxy.$message.error(`[${proxy.$ts(column.title)}]` + proxy.$ts(proxy._errMsg || '是必填项目'))
    return false
  }
  proxy.errField = ''
  return true
}
export const validateColum = (proxy, props, option, data) => {
  if (option.hidden || option.bind) return true
  let val = data[option.field]
  if (option.require || option.required) {
    if (val != '0' && (val === '' || val === undefined)) {
      if (!proxy.errorFiled) {
        proxy.errMsg = proxy.$ts('不能为空')
      }
      return false
    }
  }
  if (!option.edit) {
    return true
  }
  let editType = option.edit.type
  // 验证数字
  if (['int', 'decimal', 'number'].includes(editType)) {
    if (val == '' || val == undefined) return true
    if (editType == 'decimal') {
      if (!proxy.base.isDecimal(val)) {
        proxy.errMsg = proxy.$ts('只能是数字')
        return false
      }
    } else if (!proxy.base.isNumber(val)) {
      proxy.errMsg = proxy.$ts('只能是数字')
      return false
    }
    if (
      option.edit.min != undefined &&
      typeof option.edit.min === 'number' &&
      val < option.edit.min
    ) {
      proxy.errMsg = proxy.$ts('不能小于') + option.edit.min
      return false
    }
    if (
      option.edit.max != undefined &&
      typeof option.edit.max === 'number' &&
      val > option.edit.max
    ) {
      proxy.errMsg = proxy.$ts('不能大于') + option.edit.max
      return false
    }
    return true
  }
  // 验证字符串
  if (val && (editType == 'text' || editType == 'string')) {
  }
  return true
}
//添加行
export const addTableRow = (proxy, props, tableData, row) => {
  if (Array.isArray(row)) {
    tableData.push(...row)
    return;
  }
  if (!row) row = {}
  props.columns.forEach((x) => {
    // 2022.05.06 添加行时，如果列有编辑属性，设置开启编辑(避免关闭编辑后，无法再次启用编辑)??
    //x.readonly = false;
    if (!row.hasOwnProperty(x.field)) {
      if (x.edit && x.edit.type == 'switch') {
        row[x.field] = x.type == 'bool' ? false : 0
      } else if (!row.hidden) {
        // 2020.09.06添加行时，设置默认字段
        row[x.field] = undefined
      }
    }
  })
  tableData.push(row)
}
//删除选中行
export const delTableRow = (proxy, edit, tableData, rows, indexArr) => {
  if (rows.length == 0) return proxy.$message.error(proxy.$ts('请选择要删除的行!'))

  let data = tableData
  // let indexArr = this.getSelectedIndex()
  // if (indexArr.length == 0) {
  //   return proxy.$message.error('删除操作必须设置的属性<vol-table index></vol-table>')
  // }
  // if (indexArr.length == 0 || !this.key) {
  //   return this.$message.error(
  //     "请设置index=true属性或指columns的字段为key"
  //   );
  // }
  for (let i = data.length - 1; i >= 0; i--) {
    if (indexArr.indexOf(i) != -1) {
      data.splice(i, 1)
    }
  }
  edit.rowIndex = -1
  return rows
}

export const resetTable = (proxy, props, tableData, paginations, edit) => {
  if (tableData && tableData.length > 0) {
    tableData.splice(0)
  }
  if (!props.paginationHide) {
    paginations.page = 1
    // this.paginations.rows = 30;
    if (Array.isArray(paginations.wheres)) {
      paginations.wheres.splice(0)
    }
  }
  paginations.page = 1
  paginations.total = 0
  proxy.errorFiled = ''
  edit.columnIndex = -1
  edit.rowIndex = -1
}

export const toNextTableCell = (proxy, props, tableData, row, edit, nextField, newRow) => {
  //2024.07.05按回车键后自动跳转到下一行指定字段并获取焦点
  for (let index = 0; index < props.columns.length; index++) {
    const column = props.columns[index]
    if (column.edit) {
      if (!validateRow(proxy, props, row, column)) {
        return
      }
    }
  }
  let currentIndex = row.elementIndex + 1
  let rows = tableData
  if (rows.length == currentIndex) {
    //没有下一行并且不需要自动添加行直接返回
    if (!newRow) {
      return
    }
    //添加新的一行
    addRow(proxy, props)
  }
  edit.rowIndex = currentIndex
  setTimeout(() => {
    proxy.$refs[nextField + currentIndex][0].focus()
  }, 400)
}
