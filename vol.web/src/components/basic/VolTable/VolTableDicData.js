const hasBindData = (column) => {
  if (column.bind && column.bind.key) {
    if (!column.bind.data) {
      column.bind.data = []
    }
    if (!column.bind.data.length) {
      return true
    }
  }
  return false
}

const getHasDicData = (columns) => {
  const dicColumns = []
  for (let index = 0; index < columns.length; index++) {
    const column = columns[index]
    if (column.children && Array.isArray(column.children)) {
      column.children.forEach((cl) => {
        if (hasBindData(cl)) dicColumns.push(cl)
      })
      continue
    }
    if (hasBindData(column)) {
      dicColumns.push(column)
    }
  }
  return dicColumns
}
const arrType = ['cascader', 'treeSelect']
//初始化字典数据源
export const initDataSource = async (proxy, props, resetData, dicInitedCallback) => {
  if (!props.loadKey) return

  const columns = getHasDicData(props.columns)
  if (!columns.length) {
    return
  }
  const keys = columns.map((x) => {
    return x.bind.key
  })
  const url = 'api/Sys_Dictionary/GetVueDictionary'
  const dic = await proxy.http.post(url, keys, false).then((res) => {
    return res
  })
  dicInitedCallback && dicInitedCallback(dic)
  bindData(columns, dic, proxy, resetData, false)
}

export const bindData = (columns, dic, proxy, resetData, checkBind = true) => {
  for (let index = 0; index < columns.length; index++) {
    const column = columns[index]
    if (checkBind && !hasBindData(column)) {
      continue
    }
    if (!resetData && column.bind.data.length) {
      continue
    }
    const dicItem = dic.find((x) => {
      return x.dicNo == column.bind.key
    })
    if (!dicItem) continue
    //级联
    if (arrType.indexOf(column.type) != -1 || arrType.indexOf(column.edit?.type) != -1) {
      column.bind.orginData = JSON.parse(JSON.stringify(dicItem.data))
      column.bind.data = proxy.base.convertTree(dicItem.data, (node, data, isRoot) => {
        if (!node.inited) {
          node.inited = true
          node.label = node.value
          node.value = node.key + ''
        }
      })
      continue
    }
    //绑定数据源
    column.bind.data = dicItem.data
  }
}
