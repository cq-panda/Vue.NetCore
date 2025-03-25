import { auditTabelOnClick, showAudit, saveAuditClick } from './ViewGridAuditConfig.jsx'
import { customFilterClick, initFormOptionType } from './ViewGridProvider.jsx'
import {
  onDelete,
  onAdd,
  onEdit,
  saveClick,
  exportData,
  importData,
  onImportExcelAfter
} from './ViewGridEventButton.jsx'
import debounce from '../VolDebounce/index.js'
import action from './Action.js'
export default (proxy, props, ctx, dataConfig) => {
  proxy.const = action;
  const loadTableBefore = async (param, callBack) => {
    if (!Array.isArray(param.wheres)) {
      param.wheres = []
    }
    //待完
    let wheres = proxy.base.getSearchParameters(
      proxy,
      props.searchFormFields,
      props.searchFormOptions
    )
    param.wheres.push(...wheres)

    if (proxy.$route.query.viewflow && proxy.$route.query.id) {
      param.wheres.push({
        name: props.table.key,
        value: proxy.$route.query.id
      })
    }
    //新版支持查询前方法异步处理
    let status = await proxy.searchBefore.call(proxy, param)
    if (!status) {
      callBack(false)
      return
    }
    status = await props.searchBefore(param)
    callBack(status)
  }

  const loadTableAfter = async (data, callBack, result) => {
    let status = proxy.searchAfter.call(proxy, data, result)
    if (status) {
      status = await props.searchAfter(data, result)
    }
    if (dataConfig.isBoxAudit.value && data.length) {
      dataConfig.isBoxAudit.value = false
      auditTabelOnClick(proxy, props, dataConfig, data[0])
    }
    callBack(status)
  }
  //树形结构
  const loadTreeTableChildren = (tree, treeNode, resolve) => {
    if (props.loadTreeChildren) {
      props.loadTreeChildren(tree, treeNode, resolve)
      return
    }
    proxy.loadTreeChildren.call(proxy, tree, treeNode, resolve)
  }

  const loadTreeChildren = (tree, treeNode, resolve) => {
    //树形结构加载子节点(2021.05.02),在onInit中设置了rowKey主键字段后才会生效
    return resolve([])
  }

  //选中行checkbox行事件
  const rowOnChange = (rows) => {
    proxy.rowChange.call(proxy, rows)
    props.rowChange(rows)
  }

  const selectionOnChange = (rows) => {
    proxy.selectionChange.call(proxy, rows)
    props.selectionChange(rows)
  }

  const rowOnClick = ({ row, column, event }) => {
    proxy.rowClick.call(proxy, { row, column, event })
    props.rowClick({ row, column, event })
  }
  const rowOnDbClick = ({ row, column, event }) => {
    proxy.rowDbClick.call(proxy, { row, column, event })
    props.rowDbClick({ row, column, event })
  }
  //表格编辑
  const tableBeginEdit = (row, column, index) => {
    if (!proxy.beginEdit.call(proxy, row, column, index)) {
      return false
    }
    return props.beginEdit.call(proxy, row, column, index)
  }
  const tableEndEditBefore = (row, column, index) => {
    if (!proxy.endEditBefore.call(proxy, row, column, index)) {
      return false
    }
    return props.endEditBefore.call(proxy, row, column, index)
  }
  //表CheckBox 是否可以勾选
  const onSelectable = (row, index) => {
    if (!proxy.selectable.call(proxy, row, index)) {
      return false
    }
    return props.selectable(row, index)
  }
  //表格合并
  const onSpanMethod = ({ row, column, rowIndex, columnIndex }, rows) => {
    return (
      proxy.spanMethod.call(proxy, { row, column, rowIndex, columnIndex }, rows) ||
      props.spanMethod({ row, column, rowIndex, columnIndex }, rows)
    )
  }
  const onDetailSpanMethod = ({ row, column, rowIndex, columnIndex }, rows) => {
    return (
      proxy.detailSpanMethod.call(proxy, { row, column, rowIndex, columnIndex }, rows) ||
      props.detailSpanMethod({ row, column, rowIndex, columnIndex }, rows)
    )
  }
  //主表排序
  const onSortEnd = (newIndex, oldIndex, rows) => {
    proxy.sortEnd.call(proxy, newIndex, oldIndex, rows)
    props.sortEnd(newIndex, oldIndex, rows)
  }

  const onCustomFilterClick = (result) => {
    customFilterClick(proxy, props, dataConfig, result)
  }
  const onCustomFilterChange = (filter) => {
    dataConfig.extraHeight.value = filter.length ? 30 : 0
  }
  //所有按钮点击事件
  const registerClick = (click) => {
    debounce(() => {
      click && click.call(proxy)
    }, 1000)
  }

  const changeDropdown = (btnName, v1) => {
    let button = dataConfig.buttons.value.filter((x) => {
      return x.name === btnName
    })
    if (button && button.length > 0) {
      registerClick(button[0].onClick)
    }
  }
  //弹出框保存
  const save = () => {
    saveClick(proxy, props, dataConfig)
  }

  //新建
  const add = async () => {
    onAdd(proxy, props, dataConfig)
  }
  const edit = async (rows) => {
    onEdit(proxy, props, dataConfig, rows)
  }
  const linkData = async (row, column) => {
    edit(row)
  }
  //删除
  const del = async (rows) => {
    onDelete(proxy, props, rows)
  }

  //复制数据
  const copyData = async (rows) => {
    //2024.05.23增加复制数据功能
    if (rows) {
      if (!Array.isArray(rows)) {
        rows = [rows]
      }
    } else {
      rows = proxy.getTable(true).getSelected()
    }
    if (!rows || rows.length === 0) return proxy.$error(proxy.$ts('请选择要复制的行'))
    if (rows.length > 1) return proxy.$error(proxy.$ts('只能选择一行数据复制'))
    if (!(await proxy.copyDataBefore.call(proxy, rows)) || !(await props.copyDataBefore(rows))) {
      return
    }
    dataConfig.currentAction.value = 'copy'
    dataConfig.isCopyClick.value = true
    await onEdit(proxy, props, dataConfig, rows)
    props.editFormFields[props.table.key] = undefined
  }
  //审批
  const audit = async (rows, isAnti, view) => {
    showAudit(proxy, props, dataConfig, rows, isAnti, view)
  }
  //表格点击查看流程
  const auditTabelClick = (row) => {
    auditTabelOnClick(proxy, props, dataConfig, row)
  }
  //反审
  const antiAudit = async (rows) => {
    //反审
    audit(rows, true)
  }
  //保存审批
  const saveAudit = async (params, rows, callback) => {
    saveAuditClick(proxy, props, params, rows, callback)
  }
  //弹出框关闭事件
  const onGridModelClose = (iconClick) => {
    if (dataConfig.isBoxAudit.value) {
      initFormOptionType(proxy, props, dataConfig, false)
    }
    isBoxAudit = false
    if (!props.onModelClose(iconClick)) {
      return
    }
    proxy.onModelClose.call(proxy, iconClick)
  }
  proxy.export = (isDetail) => {
    exportData(proxy, props, dataConfig, isDetail)
  }
  proxy.import = (isDetail) => {
    importData(proxy, props, dataConfig, isDetail)
  }

  const importExcelAfter = (data) => {
    onImportExcelAfter(proxy, props, dataConfig, data)
  }
  //导入前
  const importExcelBefore = (formData, callback) => {
    if (!proxy.importBefore.call(proxy, formData, callback)) {
      return false
    }
    return props.importBefore(formData, callback)
  }

  const onPrintModelClose = () => {
    proxy.printModelClose.call(proxy)
    props.printModelClose();
  }

  return {
    loadTableBefore,
    loadTableAfter,
    loadTreeTableChildren,
    loadTreeChildren,
    rowOnChange,
    selectionOnChange,
    rowOnClick,
    rowOnDbClick,
    tableBeginEdit,
    tableEndEditBefore,
    onSelectable,
    onSpanMethod,
    onDetailSpanMethod,
    onSortEnd,
    onCustomFilterClick,
    onCustomFilterChange,
    registerClick,
    changeDropdown,
    save,
    add,
    edit,
    linkData,
    del,
    copyData,
    audit,
    auditTabelClick,
    antiAudit,
    saveAudit,
    onGridModelClose,
    importExcelAfter,
    importExcelBefore,
    onPrintModelClose
  }
}
