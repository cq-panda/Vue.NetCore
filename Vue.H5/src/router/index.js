import Vue from 'vue'
import Router from 'vue-router'
import store from '@/store'
import doc from './doc'
import { Form } from 'vant'
const routerPush = Router.prototype.push
Router.prototype.push = function push (location) {
  return routerPush.call(this, location).catch(error => { console.log(error) })
}
Vue.use(Router)
const router = new Router({
  routes: [
    {
      path: '/',
      name: 'home',
      component: () => import('@/Home.vue'),
      redirect: '/index',
      meta: {
        keepAlive: true
      },
      children: [
        ...doc,
        {
          path: '/index',
          name: 'index',
          component: () => import('@/views/Index.vue'),
          meta: {
            keepAlive: true
          }
        },
        {
          path: '/menu',
          name: 'menu',
          component: () => import('@/views/menu/menu.vue'),
          meta: {
            keepAlive: true
          }
        },
        {
          path: '/community',
          name: 'community',
          component: () => import('@/views/Community/community.vue'),
          meta: {
            keepAlive: true
          }
        },
        {
          path: '/user',
          name: 'user',
          component: () => import('@/views/user/index.vue'),
          meta: {
            keepAlive: true
          }
        }
      ]
    },
    {
      path: '/login',
      name: 'login',
      component: () => import('@/Login.vue'),
      meta: {
        anonymous: true
      }
    }
    ,
    {
      path: '/404',
      name: '404',
      component: () => import('@/views/redirect/404.vue'),
      meta: {
      }
    },
    {
      path: '/stat',
      name: 'stat',
      component: () => import('@/views/stat/index.vue'),
      meta: {
      }
    },
    {
      path: '/app_appointment',
      name: 'app_appointment',
      component: () => import('@/views/page/app_appointment.vue'),
      meta: {
      }
    }
    ,
    {
      path: '/app_transactionAvgPrice',
      name: 'app_transactionAvgPrice',
      component: () => import('@/views/page/app_transactionAvgPrice.vue'),
      meta: {
      }
    },
    {
      path: '/App_Expert',
      name: 'App_Expert',
      component: () => import('@/views/page/App_Expert.vue'),
      meta: {
      }
    }
    ,
    {
      path: '/sellOrder',
      name: 'SellOrder',
      component: () => import('@/views/page/sellOrder/SellOrder.vue'),
      meta: {
      }
    },
    {
      path: '/sellOrder/detail',
      name: 'SellOrder_detail',
      component: () => import('@/views/page/sellOrder/detail.vue'),
      meta: {
      }
    }
    ,
    {
      path: '/test',
      name: 'test',
      component: () => import('@/views/test/Test.vue'),
      meta: {
      }
    }
  ]
})


router.beforeEach((to, from, next) => {
  if (to.matched.length == 0) return next({ path: '/404' });
  store.dispatch("onLoading", true);
  if (store.getters.data().lastPage && from.path != "/login" && to.path == "/login") {
    store.getters.data().lastPage = "";
    return next({ path: '/' });
  }
  let navigate = store.getters.data().navigate;
  if (navigate && navigate.path.indexOf(to.path) != -1) {
    navigate.active = navigate.path.indexOf(to.path);
  }

  if (to.path == "/login") {
    store.getters.data().lastPage = from.path;
  }
  if ((to.hasOwnProperty('meta') && to.meta.anonymous) || store.getters.isLogin()) {
    return next();
  }

  next({ path: '/login', query: { redirect: Math.random() } });
})

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
  }
});

export default router;
