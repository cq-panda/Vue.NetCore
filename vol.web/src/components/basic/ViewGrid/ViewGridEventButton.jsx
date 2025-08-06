import {
  getUrl,
  initBox,
  resetAdd,
  resetEditForm,
  initOntinueAdd,
  modelOpenProcess,
  getRemoteFormDefaultKeyValue
} from './ViewGridProvider.jsx'
import { initImportOptions } from './ViewGridInitButtonsAuthFields.jsx'
// import {} './ViewGridProviderDetail.jsx'
import action from './Action.js'

// 新建
export const onAdd = async (proxy, props, dataConfig) => {
  //行内编辑
  if (props.table.editTable) {
    editTableAddRow(proxy, props, {}, -1)
    return
  }
  const boxOptions = dataConfig.boxOptions
  boxOptions.title = proxy.$ts(props.table.cnName) + '(' + proxy.$ts('新建') + ')'
  dataConfig.currentAction.value = action.ADD
  dataConfig.currentRow.value = {}
  if (!(await initBox(proxy, props, dataConfig))) return
  resetAdd(proxy, props, dataConfig)
  initOntinueAdd(proxy, props, dataConfig, true)
  dataConfig.boxModel.value = true
  modelOpenProcess(proxy, props, dataConfig)
}
//编辑
export const onEdit = async (proxy, props, dataConfig, rows) => {
  if (rows) {
    if (!Array.isArray(rows)) {
      rows = [rows]
    }
  } else {
    rows = proxy.getSelected()
  }
  if (rows.length == 0) {
    return proxy.$error(proxy.$ts('请选择要编辑的行!'))
  }
  if (rows.length != 1) {
    return proxy.$error(proxy.$ts('只能选择一行数据进行编辑!'))
  }
  dataConfig.boxOptions.title = proxy.$ts('编辑')
  //编辑
  dataConfig.currentAction.value = action.EDIT
  //记录当前编辑的行
  dataConfig.currentRow.value = rows[0]
  //初始化弹出框
  if (!(await initBox(proxy, props, dataConfig))) return
  initOntinueAdd(proxy, props, dataConfig, true)
  dataConfig.boxModel.value = true
  //重置表单
  //resetDetailTable(proxy,props,dataConfig, rows[0],null)

  //重新表单与明细表数据
  resetEditForm(proxy, props, dataConfig, rows[0])
  //设置远程查询表单的默认key/value
  getRemoteFormDefaultKeyValue(proxy, props, dataConfig)
  //点击编辑按钮弹出框后，可以在此处写逻辑，如，从后台获取数据
  modelOpenProcess(proxy, props, dataConfig, rows[0])
}

export const onDelete = async (proxy, props, rows) => {
  if (rows) {
    if (!Array.isArray(rows)) {
      rows = [rows]
    }
  } else {
    rows = proxy.getSelectRows() //  proxy.$refs.table.getSelected()
  }
  if (!rows || rows.length === 0) return proxy.$error(proxy.$ts('请选择要删除的行!'))
  let delKeys = rows.map((x) => {
    return x[props.table.key]
  })
  if (!delKeys || delKeys.length === 0) return proxy.$error(proxy.$ts('没有获取要删除的行数据!'))
  if (
    !(await props.delBefore(delKeys, rows)) ||
    !(await proxy.delBefore.call(proxy, delKeys, rows))
  ) {
    return
  }
  if (
    !(await props.delBeforeAsync(delKeys, rows)) ||
    !(await proxy.delBeforeAsync.call(proxy,delKeys, rows))
  ) {
    return
  }

  const delMsg =
    proxy.getDelMessage.call(proxy, rows) ||
    props.getDelMessage(rows) ||
    proxy.$ts('确认要删除选择的数据吗?')
  let tigger = false
  proxy
    .$confirm(delMsg, proxy.$ts('警告'), {
      confirmButtonText: proxy.$ts('确定'),
      cancelButtonText: proxy.$ts('取消'),
      dangerouslyUseHTMLString: true,
      type: 'warning',
      center: true
    })
    .then(() => {
      if (tigger) return
      tigger = true
      let url = getUrl(action.DEL, null, props.table)
      proxy.http.post(url, delKeys, proxy.$ts('正在删除数据') + '....').then((x) => {
        if (!x.status) return proxy.$error(x.message)
        proxy.$success(x.message)
        if (!proxy.delAfter.call(proxy, x, rows)) {
          return
        }
        if (!props.delAfter(x, rows)) {
          return
        }
        proxy.search()
      })
    })
    .catch((action) => {
      if (action !== 'cancel') {
        console.log(action)
        proxy.$error(action)
      }
    })
}

//保存
export const saveClick = (proxy, props, dataConfig) => {
  proxy.$refs.form.validate((result) => {
    if (!result) return
    saveExecute(proxy, props, dataConfig)
  })
}
//保存前确认操作
const saveExecuteConfirm = (proxy, props, formData,dataConfig, callback) => {
  const isAdd=dataConfig.currentAction.value=='Add'
  proxy.saveConfirm.call(proxy, (res) => {
    props.saveConfirm((res) => {
      callback()
    },formData,isAdd)
  },formData,isAdd)
}
const saveExecute = async (proxy, props, dataConfig) => {
  let editFormFields = proxy.base.getFormValues(props.editFormFields, props.editFormOptions)

  const currentAction = dataConfig.currentAction.value
  const currentRow = dataConfig.currentRow.value || {}
  const hiddenFields = dataConfig.hiddenFields.value || []
  if (currentAction !== action.ADD && hiddenFields.length) {
    for (const key in editFormFields) {
      if (hiddenFields.indexOf(key) !== -1) {
        editFormFields[key] = undefined
      }
    }
  }

  let formData = {
    mainData: editFormFields,
    detailData: null,
    delKeys: null
  }
  const $global = proxy.$global
  if ($global.dataVersion) {
    formData.dataVersionField = $global.dataVersion
    if (currentAction !== 'Add' && $global.dataVersion) {
      formData.dataVersionValue = currentRow[$global.dataVersion]
    }
  }

  let details
  if (dataConfig.hasDetail.value) {
    //获取明细表数据
    const rows = proxy.getTable().rowData;
    formData.detailData = convertDetailSubmitData(rows, props.detail.columns)
  } else if (dataConfig.isMultiple.value) {
    details =props.details.map((c) => {
      if (c.columns) {
        let itemDetail = {
          table: c.table,
          delKeys: c.delKeys,
          data: convertDetailSubmitData(proxy.getTable(c.table).rowData, c.columns)
          // data: convertDetailSubmitData(getGridTableRef(proxy, props, c.table).rowData, c.columns)
        }
        if (dataConfig.submitChangeRows.value) {
          itemDetail.data = proxy.$refs.detailsRef.getDiffRows(c.table, c.key, itemDetail.data, c.detail)
          // itemDetail.data = $refs.detailsRef.getDiffRows(c.table, c.key, itemDetail.data, c.detail)
        }
        return itemDetail
      }
      return {
        table: c.table,
        delKeys: c.delKeys,
        data: []
      }
    })
    formData.details = details
  }

  const detailOptions = dataConfig.detailOptions
  if (detailOptions.delKeys.length > 0) {
    formData.delKeys = detailOptions.delKeys
  }
  const subDetails = dataConfig.subDetails.value
  if (subDetails && subDetails.length) {
    formData.subDelInfo = subDetails.map((x) => {
      return { table: x.table, delKeys: x.delKeys }
    })
  }

  let isAdd = currentAction === action.ADD
  if (isAdd) {
    if (
      !(await proxy.addBefore.call(proxy, formData)) ||
      !(await proxy.addBeforeAsync.call(proxy, formData))
    )
      return
    if (!(await props.addBefore(formData)) || !(await props.addBeforeAsync(formData))) return
  } else {
    if (
      !(await proxy.updateBefore.call(proxy, formData)) ||
      !(await proxy.updateBeforeAsync.call(proxy, formData))
    )
      return
    if (!(await props.updateBefore(formData)) || !(await props.updateBeforeAsync(formData))) return
  }
  let url = getUrl(isAdd ? 'add' : 'update', null, props.table)
  // resetAdd(proxy, props, dataConfig);
  // proxy.$refs.form.$refs.volform.clearValidate()
  // return;
  saveExecuteConfirm(proxy, props, formData, dataConfig,() => {
    proxy.http.post(url, formData, true).then((x) => {
      if (isAdd) {
        if (!proxy.addAfter.call(proxy, x, formData)) return
        if (!props.addAfter(x, formData)) return
        //连续添加
        if (dataConfig.continueAdd.value && x.status) {
          proxy.$success(x.message)
          dataConfig.currentAction.value = action.ADD
          let _formFields
          if (proxy.continueAddAfter) {
            _formFields = JSON.parse(JSON.stringify(editFormFields))
          }
          dataConfig.currentRow.value = {}
          proxy.$refs.form.$refs.volform.clearValidate()
          resetAdd(proxy, props, dataConfig)
          proxy.search()
          proxy.continueAddAfter.call(proxy, _formFields, formData, x)
          props.continueAddAfter.call(_formFields, formData, x)
          return
        }
      } else {
        if (!proxy.updateAfter.call(proxy, x, formData)) return
        if (!props.updateAfter(x, formData)) return
      }
      if (!x.status) return proxy.$error(x.message)
      proxy.$success(x.message || proxy.$ts('保存成功'))
      if (dataConfig.boxOptions.saveClose) {
        dataConfig.boxModel.value = false
        //$refs.table.load(null, isAdd)
        proxy.getTable(true).load(null, isAdd)
        return
      }
      let resultRow
      if (typeof x.data === 'string' && x.data !== '') {
        resultRow = JSON.parse(x.data)
      } else {
        resultRow = x.data
      }

      if (currentAction === action.ADD) {
        props.editFormFields[props.table.key] = ''
        dataConfig.currentAction.value = action.EDIT
        dataConfig.currentRow.value = resultRow.data
      }
      resetEditForm(proxy, props, dataConfig, resultRow.data)
      if (dataConfig.hasDetail.value) {
        dataConfig.detailOptions.delKeys = []
        if (resultRow.list) {
          proxy.getTable(true).rowData.push(...resultRow.list)
          // $refs.detail.rowData.push(...resultRow.list)
        }
      }
      proxy.getTable(true).load(null, isAdd)
      //$refs.table.load(null, isAdd)
    })
  })
}

const convertDetailSubmitData = (detailData, columns) => {
  const types = ['selectList', 'cascader', 'treeSelect']
  let _fields = columns
    .filter((c) => {
      return types.indexOf(c.type) !== -1 || types.indexOf(c.edit && c.edit.type) !== -1
    })
    .map((c) => {
      return c.field
    })
  if (_fields.length) {
    detailData = JSON.parse(JSON.stringify(detailData))
    detailData.forEach((row) => {
      for (let index = 0; index < _fields.length; index++) {
        const _field = _fields[index]
        if (Array.isArray(row[_field])) {
          row[_field] = row[_field].join(',')
        }
      }
    })
  }
  return detailData
}

//导入
export const importData = async (proxy, props, dataConfig, isDetail) => {
  const upload = dataConfig.upload
  if (!upload.url) {
    initImportOptions(proxy, props, dataConfig)
  }
  upload.excel = true
  proxy.$refs.upload_excel?.reset()
}

//导出
export const exportData = async (proxy, props, dataConfig, isDetail) => {
  //导出
  let url, wheres, param
  if (isDetail) {
    //明细表导出时如果是新建状态，禁止导出
    if (dataConfig.currentAction.value === 'Add') {
      return
    }
    url = `api/${props.detail.table}/${action.EXPORT}`
    param = {
      wheres: [{ name: props.table.key, value: props.editFormFields[props.table.key] }]
    }
  } else {
    //主表导出
    url = getUrl(action.EXPORT, null, props.table)
    wheres = proxy.base.getSearchParameters(proxy, props.searchFormFields, props.searchFormOptions)
    param = {
      order: proxy.$refs.table.paginations.order,
      sort: proxy.$refs.table.paginations.sort,
      wheres: wheres||[]
    }
    if (
      !param.wheres.some((x) => {
        return x.name === props.table.key
      })
    ) {
      let ids = proxy
        .getSelectRows()
        .map((x) => {
          return x[props.table.key]
        })
        .join(',')
      //2024.01.13增加默认导出勾选的数据
      if (ids) {
        param.wheres.push({
          name: props.table.key,
          value: ids,
          displayType: 'selectList'
        })
      }
    }
    //2024.02.03增加导出列表与界面显示字段一致
    let _columns = []
    props.columns.forEach((col) => {
      if (!col.hidden && !col.render) {
        if (col.children) {
          _columns.push(
            ...col.children
              .filter((c) => {
                return !c.hidden
              })
              .map((m) => {
                return m.field
              })
          )
        } else {
          _columns.push(col.field)
        }
      }
    })
    if (_columns.length) {
      param.columns = _columns
    }
  }
  //2020.06.25增加导出前处理
  if (!isDetail) {
    if (!(await props.exportBefore(param))) {
      return
    }
    if (!(await proxy.exportBefore.call(proxy, param))) {
      return
    }
  }

  if (param.wheres && typeof param.wheres === 'object') {
    param.wheres = JSON.stringify(param.wheres)
  }

  //2022.09.26增加自定义导出文件名
  let fileName = dataConfig.downloadFileName.value
  if (!fileName) {
    fileName = props.getFileName(isDetail) || proxy.getFileName.call(proxy, isDetail)
  }
  if (!fileName) {
    if (isDetail) {
      fileName = proxy.$ts(props.detail.cnName) + '.xlsx'
    }
    fileName = proxy.$ts(props.table.cnName) + '.xlsx'
  }
  //url, params, fileName, loading
  proxy.http.download(url, param, fileName, 'loading....', (res) => {
    if (!props.exportAfter(res, param)) {
      return
    }
    if (!proxy.exportAfter.call(proxy, res, param)) {
      return
    }
  })
}

export const onImportExcelAfter = (proxy, props, dataConfig, data) => {
  //2022.01.08增加明细表导入后方法判断
  if (!data.status) {
    return // this.$message.error(data.message);
  }
  if (data.data && typeof data.data === 'string') {
    data.data = JSON.parse(data.data)
  }

  //明细表导入
  if (dataConfig.boxModel.value) {
    if (!data.data) {
      data.data = []
    }
    data.data.forEach((x) => {
      x[props.detail.key] = undefined
      x[props.table.key] = undefined
    })
    //增加明细表导入后处理
    if (!proxy.importDetailAfter.call(proxy, data)) {
      return
    }
    if (!props.importDetailAfter(data)) {
      return
    }
    proxy.$refs.detail.rowData.unshift(...data.data)
    dataConfig.upload.excel = false
    //刷新明细表proxy.upd
    return
  }
  //主表导入
  if (!proxy.importAfter.call(proxy, data)) {
    return
  }
  if (!props.importAfter(data)) {
    return
  }
  proxy.$message(proxy.$ts('上传成功'))
  //刷新主表导入信息
  proxy.search()
}
