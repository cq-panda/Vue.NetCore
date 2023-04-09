import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import ElementPlus from 'element-plus';
// import 'element-plus/lib/theme-chalk/index.css';
import 'element-plus/dist/index.css'
import './assets/element-icon/icon.css'
import base from './uitils/common'
import http from './api/http'
// import 'dayjs/locale/zh-cn'
// import locale from 'element-plus/lib/locale/lang/zh-cn'

import permission from './api/permission'
import viewgird from './components/basic/ViewGrid';  
const app = createApp(App);
app.config.globalProperties.base = base;
app.config.globalProperties.http = http;
app.config.globalProperties.$tabs = {};
app.config.globalProperties.permission = permission;
app.config.globalProperties.$global = { 
    signalR: false, //是否开启signalR
    table:{
        //vol-table带数据源的单元格是否启用tag标签(下拉框等单元格以tag标签显示)
        useTag:true
    }
}
//2023.03.13，
//修改见：volupload.vue，后台AliOSSController.cs，阿里云OSS配置.doc
window.oss={
    ali:{ //阿里云
        use:false,//使用阿里云上传文件
        //阿里缩略图压缩大小
        //.aliyuncs.com
        small:"?x-oss-process=image/resize,m_lfit,w_200"
    }
}
app.use(store)
    .use(ElementPlus, { size: 'default' })
    .use(router)
    .use(viewgird)
    .mount('#app');
app.config.globalProperties.$Message = app.config.globalProperties.$message;

