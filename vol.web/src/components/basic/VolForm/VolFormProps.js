//2024.11.16重写组件
export default function () {
    return {
        labelPosition: {
            type: String,
            default: ''
        },
        loadKey: {
            // 是否加载formRules字段配置的数据源
            type: Boolean,
            default: true
        },
        width: {
            // 表单宽度
            type: Number,
            default: 0
        },
        labelWidth: {
            // 表单左边label文字标签的宽度
            type: Number,
            default: 85
        },
        formRules: {
            // 表单配置规则，如字段类型，是否必填
            type: Array,
            default: []
        },
        formFields: {
            type: Object,
            default: () => {
                return {}
            }
        },
        editor: {
            // 2021.01.16编辑器信息 {uploadImgUrl:"",upload:null//上传方法}
            type: Object,
            default: () => {
                return {}
            }
        },
        size: {
            type: String, //large / default / small
            default: 'default'
        },
        select2Count: {
            //超出数量显示select2组件
            type: Number,
            default: 6000
        }
    }
}