export const resetPage = (paginations) => {
  // 重置查询分页
  // this.paginations.rows = 30;
  paginations.page = 1
}
export const loadData = async (
  props,
  proxy,
  vnode,
  tableData,
  emit,
  loading,
  paginations,
  query,
  isResetPage,
  isPageLoad,
  randomTableKey
) => {
  // isResetPage重置分页数据
  if (!props.url) return
  if (isResetPage) {
    resetPage(paginations)
  }
  let param = {
    page: paginations.page,
    rows: props.paginationHide ? 1000 : paginations.rows,
    sort: paginations.sort,
    order: paginations.order,
    wheres: [] // 查询条件，格式为[{ name: "字段", value: "xx" }]
  }
  let status = true
  // 合并查询信息(包查询分页、排序、查询条件等)
  if (query) {
    param = Object.assign(param, query)
  }
  if (!(await props.loadBeforeAsync(param))) {
    return
  }
  const eventName = 'loadBefore'
  const onEventName = `on${eventName[0].toUpperCase() + eventName.slice(1)}`
  if (vnode.props && onEventName in vnode.props) {
    // console.log('参数长度',vnode.props[onEventName].length);
    //兼容自定义页面早期写法问题
    if (vnode.props[onEventName].length <= 1) {
      emit(eventName, param);
    } else {
      const loadBefore = () => {
        return new Promise((resolve) => {
          emit(eventName, param, resolve)
        })
      }
      status = await loadBefore()
    }
  }
  if (!status) return

  if (param.wheres && Array.isArray(param.wheres)) {
    param.wheres = JSON.stringify(param.wheres)
  }
  loading.value = true
  let url = param.url || props.url
  param.url = undefined
  let data = await proxy.http.post(url, param).then(
    (res) => {
      return res
    },
    (error) => {
      console.log(error)
      loading.value = false
    }
  )
  if (Array.isArray(data)) {
    data = { rows: data, total: data.length }
  }
  //2021.06.04修复tree不刷新的问题
  if (props.rowKey) {
    randomTableKey.value++
    tableData.splice(0)
  }
  loading.value = false
  emit(
    'loadAfter',
    data.rows,
    (result) => {
      status = result
    },
    data
  )
  if (!status) return
  // this.GetTableDictionary(data.rows)
  let rows = data.rows || []
  if (props.rowParentField) {
    rows = proxy.base.convertTree(rows, null, props.rowKey, props.rowParentField)
  }
  if (tableData.length !== rows.length) {
    isPageLoad.value = true
  }
  tableData.splice(0)
  tableData.push(...rows)
  //  this.rowData = rows
  paginations.total = data.total || 0

  return data
}
