//2024.11.16重写组件
const rule = {
    change: ['checkbox', 'select', 'date', 'datetime', 'drop', 'radio', 'cascader'], // 2020.05.31增加级联类型
    phone: /^[1][3,4,5,6,7,8,9][0-9]{9}$/,
    decimal: /(^[\-0-9][0-9]*(.[0-9]+)?)$/,
    number: /(^[\-0-9][0-9]*([0-9]+)?)$/
}
const inputTypeArr = ['text', 'string', 'mail', 'textarea', 'password', 'editor']
const types = {
    int: 'number',
    byte: 'number',
    decimal: 'number', // "float",
    string: 'string',
    bool: 'boolean',
    date: 'datetime',
    date: 'date',
    mail: 'email'
}
function isReadonly(item) {
    return item.readonly || item.disabled
}

function validatorPhone(ruleOption, value, $ts, callback) {
    if (!ruleOption.required && !value && value != '0') {
        return callback()
    }
    if (!rule.phone.test((value || '').trim())) {
        return callback(new Error($ts('请输入正确的手机号')))
    }
    callback()
}
function validatorPwd(ruleOption, value,$ts, callback) {
    if (!ruleOption.required && !value && value != '0') {
        return callback()
    }
    if ((value + '').trim().length < 6) {
        return callback(new Error($ts('密码长度不能小于6位')))
    }
    callback()
}
export default function (item, formFields, $ts) {
    //range与swtich暂时不做校验
    if (
        // item.readonly ||
        // item.disabled ||
        item.type == 'switch' ||
        item.type == 'range'
    ) {
        return { required: false }
    }

    // 用户设置的自定义方法
    if (item.validator && typeof item.validator === 'function') {
        return {
            validator: (rule, val, callback) => {
                // 用户自定义的方法，如果返回了值，直接显示返回的值，验证不通过
                let message = item.validator(rule, val)
                if (message) return callback(new Error(message + ''))
                return callback()
            },
            required: item.required,
            trigger: rule.change.indexOf(item.type) != -1 ? 'change' : 'blur'
        }
    }
    if (['img', 'excel', 'file'].indexOf(item.type) != -1) {
        return {
            validator: (rule, val, callback) => {
                //2021.09.05移除文件上传默认必填
                if (item.required && !isReadonly(item) && (!val || !val.length)) {
                    return callback(new Error($ts(item.type == 'img' ? '请上传照片' : '请上传文件')))
                }
                return callback()
            },
            required: item.required,
            trigger: 'change'
        }
    }
    // 设置数字的最大值民最小值
    if (
        item.type == 'number' ||
        item.columnType == 'number' ||
        item.columnType == 'int' ||
        item.type == 'decimal'
    ) {
        return {
            required: item.required,
            message: item.title + '只能是数字',
            title: item.title,
            trigger: 'blur',
            min: item.min,
            max: item.max,
            type: item.columnType || item.type,
            validator: (ruleObj, value, callback) => {
                if (!ruleObj.min && !ruleObj.max) {
                    if (ruleObj.required) {
                        if ((!value && value != '0') || !rule.decimal.test(value)) {
                            return callback(new Error('只能是数字'))
                        }
                    }
                    return callback()
                }
                if (isReadonly(item)) return callback()
                if (ruleObj.type == 'number') {
                    if (!rule.number.test(value)) {
                        ruleObj.message = $ts([ruleObj.title, '只能是整数'], true)
                        return callback(new Error(ruleObj.message))
                    }
                } else {
                    if (!rule.decimal.test(value)) {
                        ruleObj.message = $ts([ruleObj.title, '只能是数字'], true)
                        return callback(new Error(ruleObj.message))
                    }
                }
                if (
                    ruleObj.min !== undefined &&
                    typeof ruleObj.min === 'number' &&
                    value < ruleObj.min
                ) {
                    ruleObj.message = ruleObj.title + '不能小于' + ruleObj.min
                    return callback(new Error(ruleObj.message))
                }
                if (
                    ruleObj.max !== undefined &&
                    typeof ruleObj.max === 'number' &&
                    value > ruleObj.max
                ) {
                    ruleObj.message = ruleObj.title + '不能大于' + ruleObj.max
                    return callback(new Error(ruleObj.message))
                }
                return callback()
            }
        }
    }

    // 手机、密码验证
    if (item.type == 'password' || item.type == 'phone') {
        return {
            validator: (ruleOption, value, callback) => { item.type == 'phone' ? validatorPhone(ruleOption, value, $ts, callback) : validatorPwd(ruleOption, value, $ts, callback) },
            required: item.required,
            trigger: 'blur'
        }
    }

    if (!item.required && item.type != 'mail') return { required: false }

    if (!item.hasOwnProperty('type')) item.type = 'text'

    if (inputTypeArr.indexOf(item.type) != -1) {
        let message = $ts(
            [item.title, item.type == 'mail' ? '必须是一个邮箱地址' : '不能为空'],
            true
        )
        let type = item.type == 'mail' ? 'email' : types[item.columnType]
        let _rule = {
            required: item.required,
            message: message,
            trigger: 'blur',
            type: type,
            validator: (ruleObj, value, callback) => {
                if (!isReadonly(item) && (value === '' || value === undefined || value === null)) {
                    return callback(new Error(ruleObj.message))
                }
                return callback()
            }
        }
        if (item.type == 'mail') {
            _rule.validator = undefined
            return _rule
        }
        return _rule
    }

    if (item.type == 'radio') {
        return {
            required: item.required,
            message: $ts(['请选择', item.title], true),
            trigger: 'change',
            type: 'string'
        }
    }
    if (
        item.type == 'date' ||
        item.type == 'datetime' ||
        item.type == 'time' ||
        item.type == 'month'
    ) {
        return {
            required: true,
            message: $ts(['请选择', item.title], true),
            trigger: 'change',
            type: item.range ? 'array' : 'string',
            validator: (rule, val, callback) => {
                if (isReadonly(item)) return callback()
                // 用户自定义的方法，如果返回了值，直接显示返回的值，验证不通过
                if (!val || (item.range && !val.length)) {
                    return callback(new Error($ts('请选择')))
                }
                return callback()
            }
        }
    }

    if (item.type == 'cascader') {
        return {
            type: 'array',
            required: true,
            min: item.min || 1,
            message: $ts(['请选择', item.title], true),
            trigger: 'change',
            validator: (rule, val, callback) => {
                if (isReadonly(item)) return callback()
                // 用户自定义的方法，如果返回了值，直接显示返回的值，验证不通过
                let _arr = formFields[item.field]
                if (!_arr || !_arr.length) {
                    return callback(new Error($ts('请选择')))
                }
                return callback()
            }
        }
    }

    if (
        ['select', 'selectList', 'checkbox', 'cascader', 'treeSelect'].indexOf(
            item.type
        ) != -1
    ) {
        let _rule = {
            type: item.type == 'select' ? 'string' : 'array',
            required: true,
            min: item.min || 1,
            message: $ts(['请选择', item.title], true),
            trigger: 'change',
            validator: (rule, value, callback) => {
                if (isReadonly(item)) return callback()
                //2021.11.27修复多选没有提示的问题
                if (value == undefined || value === '') {
                    return callback(new Error(rule.message))
                } else if (
                    (item.type == 'checkbox' || item.type == 'selectList' || item.type == 'treeSelect') &&
                    (!(value instanceof Array) || !value.length)
                ) {
                    if (item.type == 'treeSelect' && item.multiple === false) {
                        return callback()
                    }
                    return callback(new Error(rule.message))
                }
                return callback()
            }
        }

        if (_rule.max) {
            _rule.nax = item.max
        }
        return _rule
    }
    return {}
}