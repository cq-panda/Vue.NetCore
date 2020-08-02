// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import store from './store/index'
import http from './api/http'
import base from './utilities/common'
import 'vant/lib/index.css';
import loading from '@/components/loading/loading.js' // 引入loading
Vue.use(loading) // 全局使用loading
//引入nprogress
// import NProgress from 'nprogress' // 进度条
// import 'nprogress/nprogress.css' //这个样式必须引入
// import Vuex from 'vuex'//引入vuex
// Vue.use(Vuex); //使用 vuex
// import 'vant/lib/index.css';
Vue.config.productionTip = false
// import { Button } from 'vant';
import { Button } from 'vant';
import { Toast } from 'vant';
import { NavBar } from "vant";
Vue.use(Toast);
Vue.use(Button);
Vue.use(NavBar);
Vue.prototype.http = http;

// NProgress.inc(0.2)
// NProgress.configure({ easing: 'ease', speed: 500, showSpinner: false })
// router.beforeEach((to,from,next) => {
//   NProgress.start()
//   next()
// })

// router.afterEach(() => {
//   NProgress.done()
// })

var vue = new Vue({
  el: '#app',
  store,
  router,
  components: { App },
  template: '<App/>'
})
// Vue.use(permission);

Vue.prototype.http.init(vue);
Vue.prototype.base = base;
//Vue.prototype.permission.init(vue);
