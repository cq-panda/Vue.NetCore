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
import * as ElementPlusIconsVue from '@element-plus/icons-vue'



import permission from './api/permission'
import viewgird from './components/basic/ViewGrid';
const app = createApp(App);
for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
    app.component(key, component)
}
app.config.globalProperties.base = base;
app.config.globalProperties.http = http;
app.config.globalProperties.$tabs = {};
app.config.globalProperties.permission = permission;
app.config.globalProperties.$global = {
    signalR: false, //是否开启signalR
    menuSearch:true,//菜单是否启用搜索功能
    table: {
      smallCell:false,//表格单元格大小
      useTag: true //table组件下拉框数据源的字段是否显示背景颜色
    },
    audit: { //审核选项
        data: [
            { text: '通过', value: 1 },
            { text: '拒绝', value: 3 },
            { text: '驳回', value: 4 }
        ],
        status:[0,2] //审核中的数据
        // 待审核 = 0,
        // 审核通过 = 1,
        // 审核中 = 2,
        // 审核未通过 = 3,
        // 驳回 = 4
    }
}
//2023.03.13，
//修改见：volupload.vue，后台AliOSSController.cs，阿里云OSS配置.doc
window.oss = {
    ali: { //阿里云
        use: false,//使用阿里云上传文件
        //阿里缩略图压缩大小
        //.aliyuncs.com
        small: "?x-oss-process=image/resize,m_lfit,w_200"
    }
}
app.use(store)
    .use(ElementPlus, { size: 'default' })
    .use(router)
    .use(viewgird)
    .mount('#app');
app.config.globalProperties.$Message = app.config.globalProperties.$message;

