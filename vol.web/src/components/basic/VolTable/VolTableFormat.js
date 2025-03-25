const colors = [null, 'success', 'success', 'danger', 'info']
const editType = ['selectList', 'checkbox', 'cascader', 'treeSelect']
export const formatDate = (row, column) => {
  return (row[column.field] || '').substr(0, 10)
}
export const getCellColor = (row, column, formatConfig) => {
  let val = row[column.field]
  if (column.getColor && typeof column.getColor === 'function') {
    let _color = column.getColor(row, column)
    if (_color) {
      return _color
    }
  }
  if (!val && val != '0') {
    return null
  }
  if (!formatConfig[column.field]) {
    formatConfig[column.field] = [val]
    return colors[0]
  }
  let index = formatConfig[column.field].indexOf(val)
  if (index != -1) {
    return colors[index]
  }
  if (formatConfig[column.field].length > 5) {
    return null
  }

  if (index == -1) {
    formatConfig[column.field].push(val)
    index = formatConfig[column.field].length - 1
  }
  return colors[index]
}

export const cellFormatter = (proxy, row, column, template) => {
  if (!template) return row[column.property]
  let val = row[column.field]
  if (!val && val != 0) return val
  // 是否值
  if (column.edit && column.edit.type == 'switch') {
    return proxy.$ts(val ? '是' : '否')
  }
  if (!column.bind || !column.bind.data) {
    return row[column.field]
  }
  //2024.05.28增加级联显示完整路径
  if (column.type == 'cascader' && proxy.$global.table.cascaderFullPath !== false) {
    if (column.bind.orginData && column.bind.orginData.length) {
      return proxy.base
        .getTreeAllParent(val, column.bind.orginData)
        .map((c) => {
          return c.value
        })
        .join(column.separator || ' / ')
    } else {
      if (column.bind.data) {
        let fullValue = proxy.base
          .getTreeAllParent(val, column.bind.data)
          .map((c) => {
            return c.value
          })
          .join(column.separator || ' / ')
        if (fullValue && fullValue !== val) {
          return fullValue
        }
      }
    }
  }
  if (column.edit && editType.includes(column.edit.type)) {
    if (!Array.isArray(val)) {
      row[column.field] = (val + '').split(',')
    } else {
      val = val.join(',')
    }
    return getSelectFormat(column, val, proxy)
  }

  if ((val + '').indexOf(',') != -1) {
    return getSelectFormat(column, val, proxy)
  }
  let source = column.bind.data.filter((x) => {
    // return x.key != "" && x.key == val;
    // 2020.06.06修复单独使用table组件时,key为数字0时转换成文本失败的问题
    return x.key !== '' && x.key !== undefined && x.key + '' === val + ''
  })
  if (source && source.length > 0) val = source[0].label || source[0].value
  return proxy.$ts(val)
}
const getSelectFormat = (column, val, proxy) => {
  // 编辑多选table显示
  let valArr = (val + '').split(',')
  for (let index = 0; index < valArr.length; index++) {
    ;(column.bind.orginData && column.bind.orginData.length
      ? column.bind.orginData
      : column.bind.data
    ).forEach((x) => {
      // 2020.06.06修复数据源为selectList时,key为数字0时不能转换文本的问题
      if (x.key !== '' && x.key !== undefined && x.key + '' == valArr[index] + '') {
        valArr[index] = x.label || proxy.$ts(x.value)
      }
    })
  }
  return valArr.join(',')
}
