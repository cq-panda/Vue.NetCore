// import base from '@/uitils/common.js'
//合计信息、单元格颜色配置
const hasSummary = (columns) => {
  return columns.some((x) => {
    return !x.hidden && x.summary
  });
}

export const initCellStyleSummary = (props, proxy, cellStyleColumns, summaryData, summaryIndex) => {
  summaryData.splice(0)
  for (let key in summaryIndex) {
    delete summaryIndex[key]
  }
  for (let key in cellStyleColumns) {
    delete cellStyleColumns[key]
  }
  props.columns.forEach((x) => {
    if (x.cellStyle) {
      cellStyleColumns[x.field] = x.cellStyle
    }
  })

  if (!hasSummary(props.columns)) {
    summaryData.splice(0)
    return
  }
  summaryData.push(proxy.$ts('合计'))
  if (props.columnIndex && props.ck) {
    summaryData.push(' ')
  }
  props.columns.forEach((x) => {
    if (!x.hidden) {
      summaryData.push('')
      summaryIndex[x.field] = summaryData.length - 1
    }
  })
}

export const initSummaryData = (props, tableData, summaryData, summaryIndex) => {
  props.columns.forEach((column) => {
    if (column.summary) {
      initColumnSummaryData(column, tableData, summaryData, summaryIndex)
    }
  })
}

export const initColumnSummaryData = (column, tableData, summaryData, summaryIndex) => {
  // column列设置了summary属性的才计算值
  if (!column.summary) {
    return;
  }
  let sum = 0
  //  let _index = 0;
  tableData.forEach((x, index) => {
    if (x.hasOwnProperty(column.field) && !isNaN(x[column.field])) {
      sum += x[column.field] * 1
    }
  })
  if (column.summaryFormatter) {
    sum = column.summaryFormatter(sum, column, tableData, summaryData)
  } else {
    sum = sum * 1.0
    if (sum) {
      if (column.summary == 'avg') {
        sum = sum / (tableData.length || 1)
      }
      sum = (sum * 1.0).toFixed(column.numberLength || 2)
      sum = parseFloat(sum).toString()
    }
  }
  summaryData[summaryIndex[column.field]] = sum
}

//加载后合计重新计算
export const loadDataSummaries = (proxy, props, data, summaryData) => {
  summaryData.splice(0)
  if (!hasSummary(props.columns)) {
    return;
  }
  // 开启了行号的，+1
  if (props.columnIndex) {
    summaryData.push('')
  }
  // 如果有checkbox，应该算作是第一行
  if (props.ck) {
    summaryData.push('')
  }

  props.columns.forEach((col) => {
    if (col.children && col.children.length) {
      col.children.forEach((item) => {
        getColumnSummaries(item, data, summaryData)
      })
    } else {
      getColumnSummaries(col, data, summaryData)
    }
  })
  if (summaryData.length > 0 && summaryData[0] == '') {
    summaryData[0] = proxy.$ts('合计')
  }
}

export const getColumnSummaries = (col, data, summaryData) => {
  if (!col.hidden) {
    if (data.summary && data.summary.hasOwnProperty(col.field)) {
      let sum = data.summary[col.field] * 1.0
      //2024.01.07增加自定义合计格式化
      if (col.summaryFormatter) {
        sum = col.summaryFormatter(sum, col, data.rows || data, summaryData)
      } else if (sum) {
        sum = (sum * 1.0).toFixed(col.numberLength || 2)
        sum = parseFloat(sum).toString()
      }
      summaryData.push(sum)
    } else {
      summaryData.push('')
    }
  }
}
