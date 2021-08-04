import { createRouter, createWebHistory, createWebHashHistory } from 'vue-router'
import form from './form'
import formsMulti from './formsMulti'
import tables from './tables'
import viewgird from './viewGird'
import store from '../store/index'
import redirect from './redirect'
import charts from './charts'
const routes = [
  {
    path: '/',
    name: 'Index',
    component: () => import('@/views/Index'),
    redirect: '/home',
    children: [
      ...form,//Demo表单路由
      ...formsMulti,
      ...tables,//tables
      ...viewgird,
      ...redirect,
      ...charts,
      {
        path: '/home',
        name: 'home',
        component: () => import('@/views/Home.vue')
      }, {
        path: '/UserInfo',
        name: 'UserInfo',
        component: () => import('@/views/system/UserInfo.vue')
      },
      {
        path: '/sysMenu',
        name: 'sysMenu',
        component: () => import('@/views/system/Sys_Menu.vue')
      }, {
        path: '/coder',
        name: 'coder',
        component: () => import('@/views/builder/coder.vue')
      }]
  },
  {
    path: '/login',
    name: 'login',
    component: () => import('@/views/Login.vue')
  },
  {
    path: '/app/guide',
    name: 'apphome',
    meta: {
      anonymous: true
    },
    component: () => import('@/views/h5/Guide.vue'),
  },
  {
    path: '/bigdata',
    name: 'bigdata',
    component: () => import('@/views/charts/bigdata.vue'),
    meta: {
      keepAlive: false
    }
  }
]

const router = createRouter({
  history: createWebHashHistory(), //createWebHistory(process.env.BASE_URL),
  routes
})


router.beforeEach((to, from, next) => {
  if (to.matched.length == 0) return next({ path: '/404' });
  //2020.06.03增加路由切换时加载提示
  store.dispatch("onLoading", true);
  if ((to.hasOwnProperty('meta') && to.meta.anonymous) || store.getters.isLogin() || to.path == '/login') {
    return next();
  }

  next({ path: '/login', query: { redirect: Math.random() } });
})
router.afterEach((to, from) => {
  store.dispatch("onLoading", false);
})
router.onError((error) => {
  // const targetPath = router.currentRoute.value.matched;
  try {
    console.log(error.message);
    if (process.env.NODE_ENV == 'development') {
      alert(error.message)
    }
    localStorage.setItem("route_error", error.message)
  } catch (e) {

  }
  window.location.href = '/'
});
export default router
