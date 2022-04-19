import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import ElementPlus from 'element-plus';
import 'element-plus/lib/theme-chalk/index.css';
import base from './uitils/common'
import http from './api/http'
import 'dayjs/locale/zh-cn'
// import locale from 'element-plus/lib/locale/lang/zh-cn'

import permission from './api/permission'
import viewgird  from './components/basic/ViewGrid';
const app = createApp(App);
app.config.globalProperties.base = base;
app.config.globalProperties.http = http;
app.config.globalProperties.$tabs = {};
app.config.globalProperties.permission = permission;

app.use(store)
    .use(ElementPlus, {size: 'medium' })
    .use(router)
    .use(viewgird)
    .mount('#app');
app.config.globalProperties.$Message = app.config.globalProperties.$message;
