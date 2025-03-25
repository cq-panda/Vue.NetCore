import common from '@/uitils/common.js'
import store from '@/store/index'
const getImgUrls = (imgs) => {
  return imgs
    .filter((x) => {
      return x.path || x.orginUrl
    })
    .map((m) => {
      return m.path || m.orginUrl
    })
    .join(',')
}

//将表volform表单数据转换为json对象提交
const getFormValues = (formFields, formOptions) => {
  if (formFields.value) {
    formFields = formFields.value
  }
  if (formOptions.value && Array.isArray(formOptions.value)) {
    formOptions = formOptions.value
  }
  //将数组转换成string
  const formValues = {}
  for (const key in formFields) {
    let val = formFields[key]
    const option = getFormOption(formOptions, key, false)
    if (typeof val == 'function') {
      formValues[key] = formFields[key]()
      continue
    }
    //解决下拉框清除后不能保存数据的问题
    if (val === undefined) {
      val = null
    }
    if (Array.isArray(val)) {
      //上传的图片
      if (['img', 'file', 'excel'].includes(option.type)) {
        formValues[key] = getImgUrls(val)
      } else if (option.type == 'cascader') {
        formValues[key] = formFields[key][formFields[key].length - 1] || null
      } else {
        formValues[key] = val.join(',')
      }
      continue
    }
    formValues[key] = val
  }
  return formValues
}
//重置表单,//"vue": "^3.5.13",
const resetForm = (formFields, formOptions, data) => {
  //console.log('66')
  if (formFields.value) {
    formFields = formFields.value
  }
  if (formOptions.value && Array.isArray(formOptions.value)) {
    formOptions = formOptions.value
  }
  if (!data) {
    data = {}
  }
  for (const key in formFields) {
    if (!data.hasOwnProperty(key) || isEmptyValue(data[key])) {
      if (Array.isArray(formFields[key])) {
        const isRnage = formOptions.some((x) => {
          return x.field == key && x.range
        })
        formFields[key] = isRnage ? [null, null] : []
      } else {
        const option = getFormOption(formOptions, key, false) || {}
        if (['selectList', 'checkbox', 'cascader', 'treeSelect'].includes(option.type)) {
          formFields[key] = []
        } else {
          formFields[key] = undefined
        }
      }
      continue
    }
    setFormValue(formFields, formOptions, key, data)
  }
}

const setFormValue = (formFields, formOptions, field, data) => {
  const option = getFormOption(formOptions, field, false) || {}
  //图片处理待完

  let newVal = data[field]
  if (['cascader'].includes(option.type)) {
    if (option.orginData && option.orginData.length) {
      newVal = typeof option.orginData[0].id === 'number' ? newVal * 1 || 0 : newVal + ''
      let _cascaderParentTree = common.getTreeAllParent(newVal, option.orginData)
      if (_cascaderParentTree && _cascaderParentTree.length) {
        formFields[field] = _cascaderParentTree.map((x) => {
          return x.id
        })
        return
      }
    }
    formFields[field] = [data[field]]
    return
  }
  const isNumber = option.data && typeof option.data[0]?.key == 'number'
  if (['selectList', 'checkbox', 'treeSelect'].includes(option.type)) {
    let arr = (data[field] + '').split(',')
    if (isNumber) {
      arr = arr.map((x) => {
        return x * 1
      })
    }
    formFields[field] = arr
    return
  }
  if (isNumber || option.type == 'number' || option.type == 'decimal') {
    newVal = newVal * 1
  } else {
    if (typeof newVal == 'number') {
      newVal = newVal + '';
    }
  }
  formFields[field] = newVal
}
// Array.prototype.getFormOption = (field) => {
//   return getFormOption(this, field)
// }

//获取表单配置
const getFormOption = (formOptions, field, showMsg = true) => {
  if (formOptions.value && Array.isArray(formOptions.value)) {
    formOptions = formOptions.value
  }
  let option
  for (var index = 0; index < formOptions.length; index++) {
    var options = formOptions[index]
    option = options.find((x) => {
      return x.field == field
    })
    if (option) return option
  }
  // if (showMsg) {
  //   console.log(`未获取字段配置:${field}`)
  // }
  return
}
// Array.prototype.getFormDicData = (field) => {
//   return getFormDicData(this, field)
// }
//获取表单字典
const getFormDicData = (formOptions, field) => {
  const option = getFormOption(formOptions, field)
  return option.data
}
// Array.prototype.getFormDicItem = (field, key) => {
//   return getFormDicItem(this, field, key)
// }
//获取表单字典选项(根据key获取value显示文本)
const getFormDicItem = (formOptions, field, key) => {
  const data = getFormDicData(formOptions, field)
  if (Array.isArray(key)) {
    return data.filter((x) => {
      return key.includes(x.key)
    })
  }
  return data.find((x) => {
    return key == x.key
  })
}

// Array.prototype.setFormFocus = (field, timeout = 400) => {
//   return setFormFocus(this, field, timeout)
// }
//设置表单焦点
const setFormFocus = (formOptions, field, timeout = 400) => {
  const option = getFormOption(formOptions, field)
  if (!timeout || timeout < 50) {
    timeout = 200
  }
  option.focus = false
  setTimeout(() => {
    option.focus = true
  }, timeout)
}
// Array.prototype.getColumn = (field) => {
//   return getColumn(this, field)
// }
//获取表格配置
const getColumn = (columns, field) => {
  if (columns.value && Array.isArray(columns.value)) {
    columns = columns.value
  }
  const column = columns.find((x) => {
    return x.field == field
  })
  if (!column) {
    console.log('未获取字段配置')
  }
  return column
}
// Array.prototype.getColumnDicData = (field) => {
//   return getColumnDicData(this, field)
// }
//获取表格字典配置
const getColumnDicData = (columns, field) => {
  const column = getColumn(columns, field)

  if (column.bind && column.bind.data) {
    return column.bind.data
  }
  console.log('未获取到字段字典配置')
  return
}
// Array.prototype.getColumnDicItem = (field, key) => {
//   return getColumnDicItem(this, field, key)
// }
//获取表格字典项(根据key获取value显示文本)
const getColumnDicItem = (columns, field, key) => {
  const data = getColumnDicData(columns, field)
  if (Array.isArray(key)) {
    return data.filter((x) => {
      return key.includes(x.key)
    })
  }
  return (
    data.find((x) => {
      return key == x.key
    }) || {}
  )
}

const setItem = (key, obj) => {
  store.getters.data()[key] = obj
}
const getItem = (key) => {
  const obj = store.getters.data()[key]
  return obj
}
const getAccessToken = () => {
  const tk = (store.getters.getUserInfo() || { accessToken: '' }).accessToken
  return tk ? '?access_token=' + tk : ''
}
const isEmptyValue = (value) => {
  if (typeof value == 'string') {
    value = value.trim()
    if (value === '') {
      return true
    }
    return false
  }
  if (value instanceof Array && !value.length) {
    return true
  }
  return value === null || value === undefined
}
//将表单转换为后台接口查询条件
const getSearchParameters = (proxy, formFields, formRules) => {
  if (formFields.value) {
    formFields = formFields.value
  }
  if (formRules.value && Array.isArray(formRules.value)) {
    formRules = formRules.value
  }
  const wheres = []
  for (const key in formFields) {
    let value = formFields[key]
    if (isEmptyValue(value)) continue

    if (typeof value == 'number') {
      value = value + ''
    }

    const option = getFormOption(formRules, key) || {}

    let displayType = option.range ? 'range' : option.type

    //联级只保留选中节点的最后一个值
    if (displayType == 'cascader') {
      //查询下面所有的子节点，如：选中的是父节点，应该查询下面所有的节点数据--待完
      if (value && value.length) {
        let nodes = proxy.base.getTreeAllChildren(value[value.length - 1], option.orginData)
        value = nodes.map((x) => {
          return x.id
        })
        displayType = 'selectList'
      }
    } else if (displayType == 'treeSelect' && Array.isArray(value)) {
      displayType = 'selectList'
      value = (value || []).join(',')
    }
    //2021.05.02增加区间查询
    if (
      typeof value == 'string' ||
      ['date', 'datetime', 'month', 'range'].indexOf(displayType) == -1
    ) {
      wheres.push({
        name: key,
        value: typeof value == 'string' ? (value + '').trim() : value.join(','),
        displayType: displayType
      })
      continue
    }
    for (let index = 0; index < value.length; index++) {
      if (!isEmptyValue(value[index])) {
        wheres.push({
          name: key,
          value: (value[index] + '').trim(),
          displayType: (() => {
            if (['date', 'datetime', 'month', 'range'].indexOf(displayType) != -1) {
              return index ? 'lessorequal' : 'thanorequal'
            }
            return displayType
          })()
        })
      }
    }
  }
  return wheres
}

export default {
  getFormValues,
  resetForm,
  getFormOption,
  getFormDicData,
  getFormDicItem,
  setFormFocus,
  getColumn,
  getColumnDicData,
  getColumnDicItem,
  setItem,
  getItem,
  getAccessToken,
  isEmptyValue,
  getSearchParameters
}
