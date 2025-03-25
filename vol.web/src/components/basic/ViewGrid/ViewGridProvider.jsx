
import action from './Action.js'
import { getGridTableRef, getDetailTableRef } from './ViewGridRef.js'
import { resetDetailTable } from './ViewGridProviderDetail.jsx'
import{onAdd} from './ViewGridEventButton.jsx'
import store from '@/store/index.js'
export const searchExec = (proxy, params, resetPage) => {
  if (params && Array.isArray(params)) {
    params = { wheres: params }
  }
  if (resetPage !== false) {
    params = params || {}
    params.resetPage = true
  }
  //获取主表table
  proxy.$nextTick(() => {
    getGridTableRef(proxy, null, true)?.load(params, resetPage)
  })
  // $refs.table.load(params, resetPage);
}

export const resetSearch = (proxy, props) => {
  proxy.base.resetForm(props.searchFormFields, props.searchFormOptions, {})
  proxy.resetSearchFormAfter.call(proxy)
  props.resetSearchFormAfter()
}
//重置新建
export const resetAdd = (proxy, props, dataConfig) => {
  resetEditForm(proxy, props, dataConfig)
  props.editFormOptions.forEach((x) => {
    x.forEach((item) => {
      if (item.type === 'switch') {
        props.editFormFields[item.field] = 0
      }
    })
  })
}

export const resetEditForm = (proxy, props, dataConfig, row) => {
  //重置明细表
  resetDetailTable(proxy, props, dataConfig, row, dataConfig.currentAction.value == action.ADD)

  if (proxy.$refs.form) {
    proxy.$refs.form.$refs.volform && proxy.$refs.form.$refs.volform.clearValidate()
  }
  proxy.base.resetForm(props.editFormFields, props.editFormOptions, row, false)
  //重置编辑表单数据
  props.editFormFields[props.table.key] = (row || {})[props.table.key]
  // resetForm('form', row || {})
  if (proxy.$refs.form && proxy.$refs.form.$refs.volform) {
    setTimeout(() => {
      proxy.$refs.form.$refs.volform.clearValidate()
    }, 100)
  }
}


const modelOpenBeforeAsync = async (proxy, props, dataConfig) => {
  let res = await proxy.modelOpenBeforeAsync.call(
    proxy,
    dataConfig.currentRow.value,
    dataConfig.currentAction.value
  )
  if (res === false) {
    return false
  }
  res = await props.modelOpenBeforeAsync(
    dataConfig.currentRow.value,
    dataConfig.currentAction.value
  )
  if (res === false) {
    return false
  }
  res = await proxy.modelOpenBefore.call(
    proxy,
    dataConfig.currentRow.value,
    dataConfig.currentAction.value
  )
  if (res === false) {
    return false
  }
  res = await props.modelOpenBefore(dataConfig.currentRow.value, dataConfig.currentAction.value)
  if (res === false) {
    return false
  }
  return true
}
//初始化弹出框编辑
export const initBox = async (proxy, props, dataConfig) => {
  const boxButtons = dataConfig.boxButtons
  const currentRow = dataConfig.currentRow.value
  if (dataConfig.isAuditClick.value) {
    dataConfig.isAuditClick.value = false
  } else {
    boxButtons.value.forEach((x) => {
      if (x.value === 'Audit') {
        x.hidden = true
      }
    })
  }
  let value = (currentRow || {})[props.table.key] || ''
  //新窗口编辑
  if (dataConfig.newTabEdit.value) {
    if (!(await modelOpenBeforeAsync(proxy, props, dataConfig))) return false
    proxy.base.setItem(props.table.url.replaceAll('/', '') + '_edit', () => {
       proxy.search(null,false)
    })
    const txt =
      proxy.$ts(props.table.cnName) +
      '(' +
      (!dataConfig.isCopyClick.value && value ? proxy.$ts('编辑') : proxy.$ts('新建')) +
      ')'
    proxy.$tabs.open({
      text: txt,
      path: `${props.table.url}edit`,
      query: { id: value, ...(dataConfig.isCopyClick.value ? { copy: 1 } : {}) }
    })
    dataConfig.isCopyClick.value = false
    return
  }
  const detailOptions = dataConfig.detailOptions
  detailOptions.buttons.forEach((x) => {
    if (x.value === 'export') {
      x.hidden = dataConfig.currentAction.value === 'Add'
    }
  })
  if (!(await modelOpenBeforeAsync(proxy, props, dataConfig))) return false
  if (!dataConfig.boxInit.value) {
    dataConfig.boxInit.value = true
    dataConfig.boxModel.value = true
  }
  return true
}

export const setEditForm = (row) => {
  let remoteColumns = $refs.table.remoteColumns
  remoteColumns.forEach((column) => {
    editFormOptions.forEach((option) => {
      option.forEach((x) => {
        if (x.field === column.field) {
          x.data.data = Object.assign([], x.data, column.bind.data)
        }
      })
    })
  })
  editFormFields[table.key] = row[table.key]
  resetEditForm(row)
  currentAction = action.EDIT
  boxModel = true
}

export const initOntinueAdd = (proxy, props, dataConfig, isAdd = true) => {
  if (!dataConfig.continueAdd.value) return
  var _button = dataConfig.boxButtons.value.find((x) => {
    return x.value === 'save'
  })
  if (_button) {
    _button.name = isAdd ? dataConfig.continueAddName.value : proxy.$ts('保存')
  }
}

export const getRemoteFormDefaultKeyValue = (proxy, props, dataConfig) => {
  if (dataConfig.currentAction.value !== action.EDIT || dataConfig.remoteKeys.value.length === 0)
    return
  props.editFormOptions.forEach((x, xIndex) => {
    x.forEach((item, yIndex) => {
      if (item.remote) {
        let column = props.columns.find((x) => {
          return x.bind && x.bind.key === item.dataKey
        })
        if (!column) return
        let key = dataConfig.currentRow.value[item.field]
        let obj = column.bind.data.find((x) => {
          return x.key === key
        })
        item.data = [{ key: key, value: obj ? obj.value : key }]
        props.editFormOptions[xIndex].splice(yIndex, 1, item)
      }
    })
  })
}

export const modelOpenProcess = (proxy, props, dataConfig, row) => {
  proxy.$nextTick(() => {
    proxy.modelOpenAfter.call(
      proxy,
      row,
      dataConfig.currentAction.value,
      dataConfig.isCopyClick.value
    )
    props.modelOpenAfter(row, dataConfig.currentAction.value, dataConfig.isCopyClick.value)
    if (dataConfig.isCopyClick.value) {
      dataConfig.isCopyClick.value = false
      dataConfig.currentAction.value = 'Add'
      dataConfig.currentRow.value = {}
      dataConfig.boxOptions.title = proxy.$ts(props.table.cnName) + '(' + proxy.$ts('新建') + ')'
    }
  })
}



const viewModelCancel = () => {
  //查看表结构
  viewModel = false
}

// 初始化查询、编辑对象的下拉框数据源、图片上传链接地址

export const getUrl = (action, ingorPrefix, table) => {
  //是否忽略前缀/  获取操作的url
  return (!ingorPrefix ? '/' : '') + 'api' + table.url + action
}

export const initBoxHeightWidth = (proxy, props, ctx, dataConfig) => {
  const boxOptions = dataConfig.boxOptions
  const editFormOptions = props.editFormOptions
  const editor = dataConfig.editor
  const detailOptions = dataConfig.detailOptions
  //初始化弹出框的高度与宽度
  let clientHeight = document.documentElement.clientHeight
  //弹出框高度至少250px
  let adjustedClientHeight = clientHeight < 250 ? 250 : clientHeight
  let clientWidth = document.documentElement.clientWidth
  if (clientWidth > 2000) {
    clientWidth = 2000
  }
  if (
    editFormOptions.some((x) => {
      return x.some((item) => {
        return item.type === 'editor'
      })
    })
  ) {
    editor.uploadImgUrl = getUrl('upload',null,props.table)
    //this.boxOptions.height = clientHeight * 0.8
    boxOptions.width = clientWidth * 0.8
  } else {
    if (boxOptions.height) {
      //如果高度与宽度超过了获取到的可见高宽度，则设为默认的90%高宽
      if (boxOptions.height > adjustedClientHeight * 0.8) {
        boxOptions.height = adjustedClientHeight * 0.8
      }
    }
    if (boxOptions.width) {
      //如果高度与宽度超过了获取到的可见高宽度，则设为默认的90%高宽
      if (boxOptions.width > clientWidth * 0.8) {
        boxOptions.width = clientWidth * 0.8
      }
    }
  }
  let height = dataConfig.tableHeight.value || adjustedClientHeight - 203
  const labelHeight = proxy.$global.labelPosition === 'top' ? 22 : 0
  if (proxy.$global.fixedSearch) {
    dataConfig.maxBtnLength.value = 10
    // this.fixedSearchForm=true;
    setFixedSearch(proxy, props, dataConfig, true)

    // height = height - props.searchFormOptions.length * (32 + labelHeight) - 16
    // if (props.searchFormOptions.length === 1) {
    //   height += 6
    // }
  }
  if (proxy.$global.gridPadding) {
    height = height - 16
  }
  if (height < 300) {
    height = 300
  }

  const detail = props.detail
  //计算弹出框的高与宽度
  //如果有明细表，高度与宽带设置为0.9/0.82
  if (detail.columns && detail.columns.length > 0) {
    dataConfig.hasDetail.value = true
    clientWidth = clientWidth * 0.8
    clientHeight = clientHeight * 0.85
    if (!detailOptions.height) {
      detailOptions.height = clientHeight - props.editFormOptions.length * 36 - 234
      detailOptions.height = detailOptions.height < 240 ? 240 : detailOptions.height
    }

    detailOptions.columns = detail.columns
    detailOptions.pagination.sortName = detail.sortName
    detailOptions.cnName = detail.cnName
    detailOptions.key = detail.key
    detailOptions.url = getUrl('getDetailPage', null, props.table)
  } else {
    let maxColumns = 1 //最大列数，根据列计算弹框的宽度
    editFormOptions.forEach((x) => {
      if (x.length > maxColumns) maxColumns = x.length
    })
    let maxHeightRate = 0.7,
      maxWidthRate = 0.5
    maxWidthRate = maxColumns / 10 + 0.3
    maxHeightRate = (editFormOptions.length || 1) * 0.1 + 0.03
    maxHeightRate = maxHeightRate > 0.9 ? 0.9 : maxHeightRate
    clientWidth = clientWidth * maxWidthRate
    clientHeight = clientHeight * maxHeightRate
  }

  if (!boxOptions.width) {
    if (props.details && props.details.length) {
      boxOptions.width = clientWidth + clientWidth * 0.25
    } else {
      boxOptions.width = clientWidth + 30
    }
  }
  if (props.paginationHide) {
    dataConfig.height.value = dataConfig.height.value + 37
  }
  if (height <= 100) {
    height = 150
  }
  dataConfig.height.value = height
  //initExtraHeight(proxy, dataConfig) //初始化表格高度，减去自定义过滤高度与查询条件高度
}
export const initExtraHeight = (proxy, dataConfig,isInit) => {
  //初始化表格高度，减去自定义过滤高度与查询条件高度
  if (dataConfig.fixedSearchForm.value) {
    //页面加载时如果有复选框，radio时字典是异步加载的，这里可能会延迟加载导致高度不准确
    let exValue=dataConfig.paginationHide.value?32:0;
    //首次加载找多选单行的数据
    if (isInit) {
        proxy.searchFormOptions.forEach(x=>{
            if (x.length==1) {
              const b=x.some(c=>{return c.type=='radio'||c.type=='checkbox'})
                if (b) {
                  exValue=exValue-33;
                }
            }
        })
    }
    //console.log(exValue)
    proxy.$nextTick(() => {
      dataConfig.extraHeight.value =
        proxy.$refs.fixedSearchBox.clientHeight + 5-exValue
    })
  }
}

//固定查询
export const setFixedSearch = (proxy, props, dataConfig, visiable) => {
  if (visiable === undefined) {
    visiable = true
  }
  dataConfig.fixedSearchForm.value = visiable
  // const refreshBtn = dataConfig.buttons.value.find((x) => x.name === '刷新');
  if (visiable) {
    dataConfig.searchBoxShow.value = true
  }
}

export const filterPermission = (tableName, permission) => {
  //2021.03.19判断是否有某个表的按钮权限
  const _result = (store.state.permission || []).find((x) => {
    return x.url === '/' + tableName
  })
  return _result && _result.permission.some((x) => x === permission)
}

export const destroyed = () => {
  //2021.04.11增加vue页面销毁方法,路由必须设置keepLive:false，设置方法见：前端开发文档-》[禁用页面缓存keepAlive]
}


export const initFormOptionType = (proxy, props, dataConfig, isReadonly) => {
  props.editFormOptions.forEach((options) => {
    options.forEach((option) => {
      if (isReadonly) {
        if (!option.readonly) {
          dataConfig.formFieldsType.value.push(option.field)
          option.readonly = true
        }
      } else {
        if (dataConfig.formFieldsType.value.indexOf(option.field) !== -1) {
          option.readonly = false
        }
      }
    })
  })
}

export const initFlowQuery = (proxy, props, dataConfig, route) => {
  const _key = 'wk:add'

  if (sessionStorage.getItem(_key) === props.table.url.replaceAll('/', '')) {
    sessionStorage.setItem(_key, '')
    onAdd(proxy,props,dataConfig)
    return
  }
  if (route.query.viewflow) {
    if (proxy.$global.table.boxAudit) {
      dataConfig.isBoxAudit.value = true
    }
    getGridTableRef(proxy, props, true) && proxy.search(null, true)
  }
}

export const fullscreen = (full) => {
  //弹出框全屏方法
}


//绑定回车跳转到下一个标签
// const initFormInputEvent = () => {
//   //绑定回车事件
//   editFormOptions.forEach((options, rowIndex) => {
//     options.forEach((x, colIndex) => {
//       if (!x.onKeyPress) {
//         x.onKeyPress = ($e) => {
//           if ($e && $e.keyCode === 13) {
//             //获取当前行的下一个字段
//             let field = (editFormOptions[rowIndex][colIndex + 1] || {}).field
//             //当前已是最后一个字段就找下一行
//             if (!field && editFormOptions[rowIndex + 1]) {
//               field = (editFormOptions[rowIndex + 1][0] || {}).field
//             }
//             if (!field || !$refs.form.$refs[field][0]) {
//               return
//             }
//             $refs.form.$refs[field][0].focus()
//           }
//         }
//       }
//     })
//   })
// }

export const customFilterClick = (proxy, props, dataConfig, result) => {
  //处自定查询生成的表单
  props.searchFormOptions.splice(0)
  props.searchFormOptions.push(...result.form)
  for (const key in props.searchFormFields) {
    if (props.searchFormFields.hasOwnProperty(key)) {
      delete props.searchFormFields[key]
    }
  }
  Object.assign(props.searchFormFields, result.fields)
  //显示了固定查询
  initExtraHeight(proxy, dataConfig)
  proxy.$nextTick(() => {
    proxy.$refs.quickSearch && proxy.$refs.quickSearch.initForm()
    searchExec(proxy)
  })
}

