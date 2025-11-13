//后台返回的字典key值不能有重复的，否则
export const initDicData = (proxy, props, ctx, dataConfig,reset) => {
  //初始化字典数据
  let keys = []
  const dicKeys = dataConfig.dicKeys.value
  if (reset) {
    dicKeys.splice(0);
  }
  //2022.04.17优化重新加载数据源
  dicKeys.forEach((item) => {
    if (item.data) {
      item.data.splice(0)
      item.orginData && item.orginData.splice(0)
    }
  })
  if (!dicKeys.length) {
    //this.dicKeys.splice(0);
    //初始化编辑数据源,默认为一个空数组，如果要求必填设置type=number/decimal的最小值
    initFormOptions(proxy, props, dataConfig, props.editFormOptions, keys, props.editFormFields, true)
    //初始化查询数据源,默认为一个空数组
    initFormOptions(
      proxy,
      props,
      dataConfig,
      props.searchFormOptions,
      keys,
      props.searchFormFields,
      false
    )
    //查询日期设置为可选开始与结果日期
    props.searchFormOptions.forEach((item) => {
      item.forEach((x) => {
        if (['date', 'datetime', 'month','year'].includes(x.type) && x.range === undefined) x.range = true
      })
    })
    //初始化datatable表数据源,默认为一个空数组,dicKeys为界面所有的数据字典编号
    initColumns(proxy, props, dataConfig, keys)
  }else{
    keys=dicKeys.map(x=>{return x.dicNo});
  }


  if (keys.length === 0) return
  proxy.http.post('/api/Sys_Dictionary/GetVueDictionary', keys).then((dic) => {
    bindOptions(proxy, props, dataConfig, dic)
    //2022.04.04增加字典加载完成方法
    proxy.dicInited.call(proxy, dic)
    props.dicInited(dic)
  })
}

const initFormOptions = (proxy, props, dataConfig, formOptions, keys, formFields, isEdit) => {
  const dicKeys = dataConfig.dicKeys.value
  const remoteKeys = dataConfig.remoteKeys.value
  formOptions.forEach((item) => {
    item.forEach((d) => {
      if (d.type === 'number') {
        if (formFields[d.field] === '') {
          formFields[d.field] = undefined
        }
        return
      }
      if (['img', 'excel', 'file', 'img'].includes(d.type) && !d.url) {
        d.url = proxy.http.ipAddress + 'api' + props.table.url + 'Upload'
      }
      if (!d.dataKey) {
        return true
      }
      // 2022.02.20 强制开启联级可以选择某个节点
      if (d.type === 'cascader' && !d.hasOwnProperty('changeOnSelect')) {
        d.changeOnSelect = true
      }
      if (d.remote) {
        remoteKeys.push(d.dataKey)
        d.data = []
        return true
      }
      if (d.type === 'checkbox' && !Array.isArray(formFields[d.field])) {
        formFields[d.field] = []
      }
      let dicItem
      if (keys.indexOf(d.dataKey) === -1) {
        keys.push(d.dataKey)
        dicItem = {
          dicNo: d.dataKey,
          data: [],
          orginData: []
        }
        dicKeys.push(dicItem)
        d.data = dicItem.data
      } else {
        dicItem = dicKeys.find((x) => {
          return x.dicNo == d.dataKey
        })
        d.data = dicItem.data
      }
      if (isEdit && isCascader(d.type)) {
        dicItem.type = d.type
      }
      if (!isEdit&& isCascader(d.type)) {
          d.data=[];
      }
    })
  })
}

const initColumnData = (proxy, props, dataConfig, keys, item) => {
  if (!item.bind || (item.bind.data && item.bind.data.length > 0)) return true
  const dicKeys = dataConfig.dicKeys.value
  const remoteKeys = dataConfig.remoteKeys.value

  let key = item.bind.key || item.bind.dicNo
  if (remoteKeys.indexOf(key) !== -1) {
    item.bind.remote = true
    return true
  }
  const dic = dicKeys.find((x) => {
    return x.dicNo === key
  })
  if (!dic) {
    const objItem = { dicNo: key, data: [], orginData: [] }
    dicKeys.push(objItem)
    keys.push(key)
    item.bind.data = objItem.data
  } else {
    item.bind.data = dic.data
  }
  const formOption = proxy.base.getFormOption(props.editFormOptions, item.field)
  if (
    (formOption && ['cascader', 'treeSelect'].includes(formOption.type)) ||
    (item.edit && ['cascader', 'treeSelect'].includes(item.edit.type)) ||
    ['cascader', 'treeSelect'].includes(item.type)
  ) {
    //增加cascader级联显示全路径名称
    item.type = 'cascader'
    item.separator = ' / '
  }
}

const initColumns = (proxy, props, dataConfig, keys) => {
  const columns = props.columns
  if (!Array.isArray(columns)) return
  columns.forEach((item) => {
    if (item.children) {
      item.children.forEach(c => {
        initColumnData(proxy, props, dataConfig, keys, c)
      })
    } else {
      initColumnData(proxy, props, dataConfig, keys, item)
    }
  })
}
const isCascader = (type) => {
  return type === 'cascader' || type === 'treeSelect'
}

const bindOptions = (proxy, props, dataConfig, dicRes) => {
  const childrenColumns = props.columns.filter(c => { return c.children && c.children.some(x => { return x.bind }) });
  const dicKeys = dataConfig.dicKeys.value
  //console.log(dicKeys)
  const numberFields = props.columns
    .filter((x) => {
      return x.type == 'int' && x.bind
    })
    .map((x) => {
      return { field: x.field, dicNo: x.bind.key }
    })
  for (let index = 0; index < dicRes.length; index++) {
    const item = dicRes[index]
    //字典数据类型转换
    const b = numberFields.some((c) => {
      return c.dicNo == item.dicNo
    })
    if (b) {
      item.data.forEach((c) => {
        if (!isNaN(c.key)) {
          c.key = c.key * 1
        } else {
          console.log(`不能给int字段绑定字符串数据源，字典编号[${item.dicNo}],key值:${c.key}`);
        }
      })
    }
    const _isCascader = dicKeys.some((x) => {
      return x.dicNo === item.dicNo && isCascader(x.type)
    })
    //数据字典转换select2
    if (item.data.length >= (dataConfig.select2Count.value)) {
      if (!_isCascader) {
        item.data.forEach((x) => {
          x.label = x.value
          x.value = x.key
        })
      }
    }
    const dicItem = dicKeys.find((x) => {
      return x.dicNo == item.dicNo
    })
    if (!dicItem) {
      continue
    }

    //查询与编辑类型都要设置为级联，否则不生效
    if (_isCascader) {
      // x.data=d.data;
      //生成tree结构
      const _data = JSON.parse(JSON.stringify(item.data))
      props.columns.forEach((column) => {
        if (column.bind && column.bind.key === item.dicNo) {
          column.bind.data = item.data
          column.type = dicItem.type
        }
      })
      const arr = proxy.base.convertTree(_data, (node, data, isRoot) => {
        if (!node.inited) {
          node.inited = true
          node.label = proxy.$ts(node.value)
          node.value = node.key
        }
      })

      dicItem.data.push(...arr)
      dicItem.orginData.push(...item.data)
      bindSearchCascader(proxy, item, arr)
      //2021.10.17修复级联不能二级刷新的问题
      proxy.editFormOptions.forEach((editOption) => {
        editOption.forEach((_option) => {
          if (isCascader(_option.type) && _option.dataKey === item.dicNo) {
            _option.data = arr
            _option.orginData = item.data
          }
        })
      })
      continue
    }
    bindSearchCascader(proxy, item)
    dicItem.data.push(...item.data)
    if (childrenColumns.length) {
      childrenColumns.forEach(cl => {
        cl.children.forEach(c => {
          if (c.bind && c.bind.key == dicItem.dicNo) {
            c.bind.data = item.data
          }
        })
      })
    }
  }
}


const bindSearchCascader = (proxy, item, arr) => {
  proxy.searchFormOptions.forEach((searchOption) => {
    searchOption.forEach((_option) => {
      if (isCascader(_option.type) && _option.dataKey === item.dicNo && (!_option.orginData || !_option.orginData.length)) {
        if (!arr) {
          const _data = JSON.parse(JSON.stringify(item.data))
          arr = proxy.base.convertTree(_data, (node, data, isRoot) => {
            if (!node.inited) {
              node.inited = true
              node.label = proxy.$ts(node.value)
              node.value = node.key
            }
          })
        }
        _option.data = arr
        _option.orginData = item.data
      }
    })
  })
}