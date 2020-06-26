import Vue from 'vue'
import Router from 'vue-router'
import store from '@/store'


// import exampleRouter from './router/examplxe.js'
import exampleRouter from './example'
import redirect from './redirect'
import viewgird from './viewGird'
import h5 from './h5'
import form from './form'
import formsMulti from './formsMulti'
import charts from './charts'
import tables from './tables'
import documents from './documents'
Vue.use(Router)

const router = new Router({
  mode: 'history',
  routes: [
    ...exampleRouter,
    ...h5,
    ...documents,
    {
      path: '/bigdata',
      name: 'bigdata',
      component: () => import('@/views/charts/bigdata.vue')
    },
    {
      path: '*',
      component: () => import('@/views/redirect/404.vue')
    },
    {
      path: '/',
      name: 'Index',
      component: () => import('@/views/Index'),
      redirect: '/home',
      children: [
        ...viewgird,//代码生成的后配置菜单的路由
        ...redirect,//401,404,500等路由
        ...form,//Demo表单路由
        ...formsMulti,//Demo一对多表单路由
        ...charts,//Demo图表单路由
        ...tables,
        {
          path: '/home',
          name: 'home',
          component: () => import('@/views/home.vue')
        }, {
          path: '/UserInfo',
          name: 'UserInfo',
          component: () => import('@/views/system/UserInfo.vue')
        }, {
          path: '/coder',
          name: 'coder',
          component: () => import('@/views/builder/coder.vue')
        }
        , {
          path: '/sysMenu',
          name: 'sysMenu',
          component: () => import('@/views/system/Sys_Menu.vue')
        }, {
          path: '/permission',
          name: 'permission',
          component: () => import('@/views/system/Permission.vue')
        }
      ]
    },
    {
      path: '/login',
      name: 'login',
      component: () => import('@/views/Login.vue'),
      meta: {
        anonymous: true
      }
    }

  ]
})


router.beforeEach((to, from, next) => {
  if (to.matched.length == 0) return next({ path: '/404' });
  //2020.06.03增加路由切换时加载提示
  store.dispatch("onLoading", true);
  if ((to.hasOwnProperty('meta') && to.meta.anonymous) || store.getters.isLogin()) {
    return next();
  }
  //query产生一个随机数在 login->home->login执行不了
  next({ path: '/login', query: { redirect: Math.random() } });
})

//2020.06.03增加路由切换时加载提示
router.afterEach((to, from) => {
  store.dispatch("onLoading", false);
})
router.onError((error) => {
  const pattern = /Loading chunk (\d)+ failed/g;
  const isChunkLoadFailed = error.message.match(pattern);
  const targetPath = router.history.pending.fullPath;
  console.log(error.message);
  console.log(targetPath);
  if (isChunkLoadFailed) {
    window.location.replace(window.location.href);
    //  router.replace(targetPath);
  }
});

export default router;
