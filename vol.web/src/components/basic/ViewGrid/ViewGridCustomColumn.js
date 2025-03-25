export const getViewCacheKey = (name) => {
  return 'custom:column:' + name // + props.table.name
}
export const initViewColumns = (proxy, props, dataConfig, isReset) => {
  //多表头的暂时不能自定义
  if (
    props.columns.some((c) => {
      return c.children
    })
  ) {
    dataConfig.showCustom.value = false
    return
  }

  const fields = props.columns.filter(x => { return !x.hidden }).map(x => { return x.field });
  dataConfig.orginColumnFields.push(...fields);
 

  const values = localStorage.getItem(getViewCacheKey(props.table.name));
  if (!values) {
    return;
  }

  try {
    let sortColumns = []
    let cacheColumns = JSON.parse(values).filter(x=>{return fields.indexOf(x.f)!=-1});
    cacheColumns.forEach((column) => {
      let _column = props.columns.find((c) => {
        return c.field == column.f
      })
      if (_column) {
        _column.hidden = !column.s
        _column.fixed = column.fx == 'none' || !column.fx ? false : column.fx;
        _column.align = column.a;
        sortColumns.push(_column)
      }
    })
    let hiddenColumns = props.columns.filter((c) => {
      return !sortColumns.some((s) => {
        return c.field == s.field
      })
    })
    sortColumns.push(...hiddenColumns)
    props.columns.splice(0)
    props.columns.push(...sortColumns)
  } catch (error) {
    console.log(error)
    console.log('初始化自定义列异常:' + error.message);
  }


  // console.log('重构中')
  return
  // if (
  //   props.columns.some((c) => {
  //     return c.children
  //   })
  // ) {
  //   dataConfig.showCustom.value = false
  //   return
  // }
  // //初始化自定列配置
  // if (isReset) {
  //   resetViewColumns(proxy, props, dataConfig)
  // }
  // const orginColumnFields = dataConfig.orginColumnFields
  // if (!orginColumnFields.length) {
  //   orginColumnFields = this.columns.map((c) => {
  //     return c.field
  //   })
  // }
  // const viewColumns = dataConfig.viewColumns

  // viewColumns.value = this.columns
  //   .filter((c) => {
  //     return !c.hidden && !c.render
  //   })
  //   .map((c) => {
  //     return { field: c.field, title: c.title, show: !c.hidden }
  //   })
  // if (isReset) {
  //   return
  // }
  //待完
  //this.getCacheViewColumn();
}



const resetViewColumns = (proxy, props, dataConfig) => {
  localStorage.setItem(getViewCacheKey(), '')
  const orginColumnFields = dataConfig.orginColumnFields
  if (!orginColumnFields.length) {
    return
  }
  let _columns = []
  orginColumnFields.forEach((x) => {
    _columns.push(
      props.columns.find((c) => {
        return c.field == x
      })
    )
  })
  let otherColumns = props.columns.filter((c) => {
    return !orginColumnFields.some((s) => {
      return c.field == s
    })
  })
  _columns.push(...otherColumns)
  props.columns.splice(0)
  props.columns.push(..._columns)
}

const sortViewColumns = (props, sortColumns) => {
  if (sortColumns.length) {
    let hiddenColumns = props.columns.filter((c) => {
      return !sortColumns.some((s) => {
        return c.field == s.field
      })
    })
    sortColumns.push(...hiddenColumns)
    props.columns.splice(0)
    props.columns.push(...sortColumns)
  }
}
const showCustomModel = (dataConfig) => {
  if (!dataConfig.viewColumns.value.length) {
    this.initViewColumns()
  }
  dataConfig.viewColumnsClone.value = JSON.parse(JSON.stringify(dataConfig.viewColumns.value))
  dataConfig.viewModel.value = true
}
const closeCustomModel = (dataConfig) => {
  dataConfig.viewModel.value = false
  if (checkColumnChanged(dataConfig)) {
    dataConfig.viewColumns.value = JSON.parse(JSON.stringify(dataConfig.viewColumnsClone.value))
  }
}
const checkColumnChanged = (dataConfig) => {
  return (
    JSON.stringify(dataConfig.viewColumns.value) !=
    JSON.stringify(dataConfig.viewColumnsClone.value)
  )
}
const saveColumnConfig = (proxy, props, dataConfig) => {
  let hasShowColumn = dataConfig.viewColumns.value.some((x) => {
    return x.show
  })
  if (!hasShowColumn) {
    return proxy.$message.error('至少选择一列显示')
  }
  dataConfig.viewModel.value = false
  if (checkColumnChanged(dataConfig)) {
    let sortColumns = []
    dataConfig.viewColumns.value.forEach((column) => {
      let _column = props.columns.find((c) => {
        return c.field == column.field
      })
      if (_column) {
        _column.hidden = !column.show
        sortColumns.push(_column)
      }
    })
    sortViewColumns(props, sortColumns)
  }
  try {
    localStorage.setItem(getViewCacheKey(props), JSON.stringify(dataConfig.viewColumns.value))
  } catch (error) {
    console.log('获取自定义列异常:' + error.message)
  }
}
