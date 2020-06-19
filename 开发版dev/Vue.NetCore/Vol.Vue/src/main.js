// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import iView from 'iview'
import 'iview/dist/styles/iview.css'
import router from './router'
import http from './api/http'
import permission from './api/permission'
import store from './store/index'
import base from './utilities/common'
// import NProgress from 'nprogress'
// import 'nprogress/nprogress.css'
// import Vuex from 'vuex'
// Vue.use(Vuex)
Vue.use(iView)
Vue.config.productionTip = false
Vue.use(ElementUI)
/* eslint-disable no-new */
// NProgress.configure({
//   easing: 'ease',  // 动画方式    
//   speed: 500,  // 递增进度条的速度    
//   showSpinner: false, // 是否显示加载ico    
//   trickleSpeed: 200, // 自动递增间隔    
//   minimum: 0.3 // 初始化时的最小百分比
// })


var vue = new Vue({
  el: '#app',
  store,
  router,
  components: { App },
  template: '<App/>'
})
// Vue.use(permission);
Vue.prototype.http = http;
Vue.prototype.http.init(vue);
Vue.prototype.permission = permission;
Vue.prototype.permission.init(vue);
Vue.prototype.base = base;

router.beforeEach((to, from, next) => {
  vue.$Loading.start({ color: 'white', height: 2 });
  // NProgress.start();
  next();
})

router.afterEach(() => {
  vue.$Loading.finish();
  // NProgress.done()
})