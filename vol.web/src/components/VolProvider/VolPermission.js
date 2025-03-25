import buttons from '@/api/buttons.js'
import store from '@/store/index.js'
const getButtons = (path, extra, table, tableName) => {
  //extra自定额外按钮
  //table获取指定表的权限
  if (table && table[0] != '/') {
    table = '/' + table
  }
  let permission = store.getters.getPermission(table || path)
  if (!permission) {
    permission = store.getters.getPermission(path.substring(1))
    if (!permission) {
      permission = store.getters.getPermission('/' + tableName)
      if (!permission) {
        permission = { permission: ['Search'] }
      }
    }
  }
  let permissions = permission.permission //.split(',');
  let gridButtons = buttons
    .filter((item) => {
      return !item.value || permissions.indexOf(item.value) != -1
    })
    .map((x) => {
      return Object.assign({}, x)
    })

  if (extra && extra instanceof Array) {
    gridButtons.push(...extra)
  }
  return gridButtons
}
const getAuthButtons = (table) => {
  return getButtons(null, null, table)
}
const hasAuthButton = (table, buttonName) => {
  return getButtons(null, null, table).some((x) => {
    return x == buttonName
  })
}

export default { getButtons, getAuthButtons, hasAuthButton }
