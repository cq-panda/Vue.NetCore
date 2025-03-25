export const getGridTableRef = (proxy, props, table) => {
  //获取表主表表格
  if (typeof table == 'boolean') {
    return proxy.$refs.table
  }
  return getDetailTableRef(proxy, props, table)
}
export const getDetailTableRef = (proxy, props, table) => {
  //获取明细表
  if (table && props.details.length) {
    let _obj =
      proxy.$refs.detailsRef.$refs[table] ||
      (proxy.$refs.subDetailsRef && proxy.$refs.subDetailsRef.$refs[table])
    if (_obj) {
      return _obj[0]
    }
    return
  }
  return proxy.$refs.detail
}
