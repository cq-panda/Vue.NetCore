import { validateRow } from './VolTableProvider.js'

export const tableRowClick = async (
  proxy,
  props,
  tableData,
  edit,
  nextTick,
  emit,
  row,
  column,
  event
) => {
  //2022.02.20增加点击时表格参数判断
  if (!column) {
    return
  }
  //正在编辑时，禁止出发rowClick事件
  if (edit.rowIndex == -1) {
    emit('rowClick', { row, column, event, index: row.elementIndex })
  }
  // 点击其他行时，如果点击的行与正在编辑的行相同，保持编辑状态
  if (edit.rowIndex != -1) {
    if (row.elementIndex == edit.rowIndex) {
      // 点击的单元格如果不可以编辑，直接结束编辑
      // 2020.10.12修复结束编辑时，element table高版本属性获取不到的问题
      let _col = props.columns.find((x) => {
        return x.field == ((event && event.property) || column.property)
      })
      if (_col && (!_col.edit || _col.readonly)) {
        if (await rowEndEdit(proxy, props, tableData, column, edit)) {
          edit.rowIndex = -1
        }
      }
      return
    }
    if (await rowEndEdit(proxy, props, tableData, column, edit)) {
      edit.rowIndex = -1
    }
    //当正在编辑，且点击到其他行时，在原编辑的行结束编辑后，触发新行的rowClick事件
    //正在编辑时，禁止出发rowClick事件
    if (edit.rowIndex == -1) {
      emit('rowClick', { row, column, event })
    }
  }
  rowBeginEdit(proxy, props, edit, nextTick, row, column)
}

export const rowBeginEdit = (proxy, props, edit, nextTick, row, column) => {
  if (edit.rowIndex != -1) {
    return
  }
  let col = column // props.columns.find((x) => x.field == column.property)
  if (col) {
    if (col.readonly && (col.click || col.render)) {
      return
    }
    //不能编辑的字段、switch，点击不开启启编辑功能
    if (!col.edit || (col.edit.keep && col.edit.type == 'switch')) {
      return
    }
  }
  if (!hasEdit(props)) return
  proxy.errMsg = ''
  // 编辑前
  const columns = props.columns.filter((x) => {
    return x.bind && x.bind.data && x.bind.data.length
  })
  columns.forEach((column) => {
    let val = row[column.field]
    if (typeof column.bind.data[0].key == 'string') {
      if (typeof val == 'number') {
        row[column.field] = row[column.field] + ''
      }
      return
    }
    //2024.01.10修复多选、级联编辑时类型转换的问题
    if (Array.isArray(val)) {
      val = val.map((v) => {
        return v * 1
      })
      row[column.field] = val
    } else if (typeof val == 'string' && val) {
      let _val = val * 1
      if (_val + '' === val) {
        row[column.field] = _val
      }
    }
  })
  if (!props.beginEdit(row, column, row.elementIndex)) return
  if (row.hasOwnProperty('elementIndex')) {
    if (edit.rowIndex == row.elementIndex) {
      return
    }
    edit.rowIndex = row.elementIndex
  }
  // let col = props.columns.find((x) => {
  //   return x.field == (column.field || column.property)
  // })
  if (col && col.edit) {
    if (col.edit.type == 'cascader' && !col.bind.orginData) {
      col.bind.orginData = col.bind.data
      col.bind.data = proxy.base.convertTree(col.bind.data, (node, data, isRoot) => {
        //  node.value = node.value;
        node.label = node.value
        // node.text = node.name;
      })
    }
    //&&x.edit&&x.edit.type=='selectTable'
    nextTick(() => {
      let refEl = proxy.$refs[(column.field || column.property) + row.elementIndex]
      if (refEl && Array.isArray(refEl)) {
        refEl[0].focus && refEl[0].focus()
      }
    })
  }
}

const hasEdit = (props) => {
  return props.columns.some((x) => {
    return !x.hidden && x.edit
  })
}
export const rowEndEdit = async (proxy, props, tableData, column, edit) => {
  if (!edit) {
    // console.log('edit')
    return
  }
  if (!hasEdit(props) || edit.rowIndex == -1) {
    return true
  }
  let _row = tableData[edit.rowIndex]
  if (!_row) {
    //可能点击的是另一个表格，这里不会强制结束
    edit.rowIndex = -1
    return
  }
  // 结束编辑前
  if (! await props.endEditBefore(_row, column, edit.rowIndex)) return false
  if (edit.rowIndex != -1) {
    //2022.06.26修复表格内容切换后行数不一致时不能编辑的问题
    if (edit.rowIndex - 1 > tableData.length) {
      edit.rowIndex = -1
      return
    }
    let row = tableData[edit.rowIndex]
    for (let index = 0; index < props.columns.length; index++) {
      const _column = props.columns[index]
      if (_column.edit) {
        if (!validateRow(proxy, props, row, _column)) {
          return
        }
      }
    }
  }
  if (!props.endEditAfter(_row, column, edit.rowIndex)) return false
  edit.rowIndex = -1
  return true
}
