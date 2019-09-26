import Vue from 'vue'
import Router from 'vue-router'
import store from '@/store'


// import exampleRouter from './router/examplxe.js'
import exampleRouter from './example'
import redirect from './redirect'
import viewgird from './viewGird'
import h5 from './h5'
import form from './form'
Vue.use(Router)

const router = new Router({
  mode: 'history',
  routes: [
    {
      path: '*',
      component: () => import('@/views/redirect/404.vue')
    },
    ...exampleRouter,
    ...h5,
    {
      path: '/',
      name: 'Index',
      component: () => import('@/views/Index'),
      redirect: '/home',
      children: [
        ...form,
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
        ,
        ...viewgird,
        ...redirect
      ]
    }, {
      path: '/edit',
      name: 'edit',
      component: () => import('@/views/example/editTable.vue')
    },

    {
      path: '/HelloWorld',
      name: 'HelloWorld',
      component: () => import('@/components/HelloWorld')
    },
    {
      path: '/login',
      name: 'login',
      component: () => import('@/views/Login.vue'),
      meta: {
        anonymous: true
      }
    },
    {
      path: '/document',
      name: 'document',
      component: () => import('@/views/document/document.vue'),
      redirect: '/document/guide',
      meta: {
        anonymous: true
      }
      ,
      children: [{
        path: '/document/guide',
        name: '/document/guide',
        component: () => import('@/views/document/guide.vue'),
        meta: {
          anonymous: true
        }
      },{
        path: '/document/coder',
        name: '/document/coder',
        component: () => import('@/views/document/coder.vue'),
        meta: {
          anonymous: true
        }
      },{
        path: '/document/vueDev',
        name: '/document/vueDev',
        component: () => import('@/views/document/vueDev.vue'),
        meta: {
          anonymous: true
        }
      },{
        path: '/document/netCoreDev',
        name: '/document/netCoreDev',
        component: () => import('@/views/document/netCoreDev.vue'),
        meta: {
          anonymous: true
        }
      }]
    }
  ]
})


router.beforeEach((to, from, next) => {
  store.getters.getUserInfo()
  if (to.matched.length == 0) return next({ path: '/404' });

  if ((to.hasOwnProperty('meta') && to.meta.anonymous) || store.getters.isLogin()) {
    return next();
  }
  //query产生一个随机数在 login->home->login执行不了
  next({ path: '/login', query: { redirect: Math.random() } });
})

router.onError((error) => {
  const pattern = /Loading chunk (\d)+ failed/g;
  const isChunkLoadFailed = error.message.match(pattern);
  const targetPath = router.history.pending.fullPath;
  console.log(error.message);
  console.log(targetPath);
  if (isChunkLoadFailed) {
    router.replace(targetPath);
  }
});

export default router;