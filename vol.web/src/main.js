import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import './assets/element-icon/icon.css'
import './assets/bootstrap-icons/font/bootstrap-icons.min.css'
import base from './uitils/common'
import VolProvider from './components/VolProvider'
import http from './api/http'
import translator from './uitils/translator'
import permission from './api/permission'
import viewgird from './components/basic/ViewGrid'
import * as ElementPlusIconsVue from '@element-plus/icons-vue'

const app = createApp(App)

for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
  app.component(key, component)
}
translator.init(app)
app.config.globalProperties.base = Object.assign(base, VolProvider)
app.config.globalProperties.http = http
app.config.globalProperties.$tabs = {}
app.config.globalProperties.permission = permission


app.config.globalProperties.$global = {
  useIncludeCache:true,//使用include做缓存,旧版本升级的代码这里需要设置为false
  theme: 'blue', //默认布局颜色：dark、blue、red、orange、green
  layout: 'top', //菜单布局方式：classics=经典导航，top=顶部导航
  menuSearch: true, //菜单是否启用搜索功能
  navSearch: true, //导航是否启用菜单搜索功能
  table: {
    useTag: true, //table组件下拉框数据源的字段是否显示背景颜色
  },
  border: true,
  labelPosition: 'left', //表单(弹出框表单)标签显示位置,可选值，top、left，2023.07.04
  signalR: true, //是否开启signalR
  audit: {
    //审核选项
    data: [
      { text: '通过', value: 1 },
      { text: '拒绝', value: 3 },
      { text: '驳回', value: 4 }
    ],
    auditType: [
    ],
    status: [0, 2] //审核中的数据
  }
}
import VolTitle from './components/basic/VolTitle'
import VolTable from './components/basic/VolTable/index'
import VolForm from './components/basic/VolForm/index'
import VolBox from './components/basic/VolBox/index'
app
  .use(store)
  .use(ElementPlus, { size: 'default' })
  .use(router)
  .use(VolTitle)
  .use(VolTable)
  .use(VolForm)
  .use(VolBox)
  .use(viewgird)
  .mount('#app')
app.config.globalProperties.$Message = app.config.globalProperties.$message
