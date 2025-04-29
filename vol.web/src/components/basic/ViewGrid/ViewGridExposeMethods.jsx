import { getGridTableRef, getDetailTableRef } from './ViewGridRef.js'
import { resetSearch, setFixedSearch, initOntinueAdd, searchExec } from './ViewGridProvider.jsx'
//组件内部方法
export const initMethods = (proxy, props, dataConfig) => {
  //查询
  const search = (params, resetPage) => {
    searchExec(proxy, params, resetPage)
  }
  //刷新
  const refresh = () => {
    search(null, true)
  }
  const getSearchParameters = () => {
    return proxy.base.getSearchParameters(proxy, props.searchFormFields, props.searchFormOptions)
  }

  //重置查询
  const onResetSearch = () => {
    resetSearch(proxy, props)
  }
  //高级查询
  const advancedSearch = () => {
    dataConfig.searchBoxShow.value = false
    search()
  }
  //快捷搜索
  const quickSearchKeyPress = ($event) => {
    //查询字段为input时，按回车查询
    if ($event.keyCode === 13) {
      search()
    }
  }
  //设置显示所有查询条件
  const setFiexdSearchForm = (visiable) => {
    setFixedSearchForm(visiable)
  }
  const setFixedSearchForm = (visiable) => {
    setFixedSearch(proxy, props, dataConfig, visiable)
  }

  //获取编辑表单配置
  const getFormOption = (field) => {
    return proxy.base.getFormOption(props.editFormOptions, field)
  }
  //获取编辑表单配置
  const getSearchFormOption = (field) => {
    return proxy.base.getFormOption(props.searchFormOptions, field)
  }
  //编辑表单分组事件
  const editFormTabClick = (name) => {
    //表单分组切换事件
    proxy.tabClick.call(proxy, name)
    props.tabClick(name)
  }
  //获取voltable对象,table=true获取主表table
  const getTable = (table) => {
    return getGridTableRef(proxy, props, table)
  }
  const getTableRef = (table) => {
    return getGridTableRef(proxy, props, table)
  }
  //获取原生el table组件
  const getElementTableRef = (table) => {
    return getGridTableRef(proxy, props, table).getTable()
  }

  //获取主表选中的行
  const getSelectRows = () => {
    //获取选中的行
    return getGridTableRef(proxy, props, true).getSelected()
  }
  //获取主表选中的行
  const getSelected = () => {
    return getSelectRows()
  }

    //主表点击行选中当前行
    const toggleRowSelection = (row) => {
      getGridTableRef(proxy, props, true).toggleRowSelection(row);
    }
     //清除选中的行
    const clearSelection=()=>{
      getGridTableRef(proxy, props, true).clearSelection();
    }
  
  //获取明细表选中的行
  const getDetailSelectRows = (table) => {
    return getDetailTableRef(proxy, props, table).getSelected()
  }
  //获取主表数据
  const rowData = () => {
    return getDetailTableRef(proxy, props, table).rowData
  }
  const getCurrentAction = () => {
    if (dataConfig.currentReadonly.value) return ''
    return `(${proxy.$ts(dataConfig.currentAction.value === action.ADD ? '新增' : '编辑')})`
  }
  //刷新明细表合计
  const updateDetailTableSummaryTotal = (fields, table) => {
    getTableRef(table).updateSummary(fields)
  }
  //设置\取消只读
  const setFormReadonly = (readonly) => {
    props.editFormOptions.forEach((x) => {
      x.forEach((ops) => {
        ops.readonly = !!readonly
      })
    })
    dataConfig.detailOptions.columns.forEach((x) => {
      x.readonly = !!readonly
    })
    dataConfig.detailOptions.buttons.forEach((x) => {
      x.hidden = !!readonly
    })
    if (props.details.length) {
      props.details.forEach((x) => {
        if (x.columns) {
          x.columns.forEach((col) => {
            col.readonly = !!readonly
          })
          x.buttons.forEach((btn) => {
            btn.hidden = !!readonly
          })
        }
      })
    }
  }

  return {
    editFormTabClick,
    getSelectRows,
    getSelected,
    toggleRowSelection,
    clearSelection,
    getDetailSelectRows,
    getTable,
    getTableRef,
    getElementTableRef,
    rowData,
    getFormOption,
    getSearchFormOption,
    search,
    refresh,
    getSearchParameters,
    onResetSearch,
    quickSearchKeyPress,
    advancedSearch,
    setFiexdSearchForm,
    setFixedSearchForm,
    getCurrentAction,
    setFormReadonly,
    updateDetailTableSummaryTotal
  }
}
