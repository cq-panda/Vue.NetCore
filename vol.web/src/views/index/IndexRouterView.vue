<template>
  <router-view v-slot="{ Component }" v-if="useIncludeCache">
    <keep-alive :include="include">
      <component
        :is="Component"
        :key="$route.name"
        v-if="
          isRouterAlive &&
          (!$route.meta || ($route.meta && !$route.meta.hasOwnProperty('keepAlive')))
        "
      />
    </keep-alive>
    <component
      :is="Component"
      :key="$route.name"
      v-if="$route.meta && $route.meta.hasOwnProperty('keepAlive')"
    />
  </router-view>

  <router-view v-slot="{ Component }" v-else>
    <keep-alive>
      <component
        :is="Component"
        :key="$route.name + componentKey"
        v-if="!$route.meta || ($route.meta && !$route.meta.hasOwnProperty('keepAlive'))"
      />
    </keep-alive>
    <component
      :is="Component"
      :key="$route.name"
      v-if="$route.meta && $route.meta.hasOwnProperty('keepAlive')"
    />
  </router-view>
</template>
<script setup>
// import VolLoading from "@/components/basic/VolLoading";
import { useRouter, useRoute } from 'vue-router'
import { ref, getCurrentInstance, nextTick } from 'vue'
const { proxy } = getCurrentInstance()
const router = useRouter()
const $route = useRoute()
const isRouterAlive = ref(true)

const useIncludeCache = ref(true)
useIncludeCache.value = proxy.$global.useIncludeCache || proxy.$global.useIncludeCache === undefined

const componentKey = ref('')

const refreshPage = (routeName, _callback) => {
  routeName = routeName || router.currentRoute.value.name
  //旧版缓存
  if (!useIncludeCache.value) {
    setTimeout(() => {
      // if ((routeName && typeof (routeName) == 'string')) {
      routeName = $route.name
      //}
      componentKey.value = routeName + Date.now()

      router.replace({ ...$route })
      if (_callback && typeof _callback == 'function') {
        setTimeout(() => {
          _callback()
        }, 300)
      }
    }, 50)
    return
  }
  const name = routeName || router.currentRoute.value.name
  clearCache(name)
  //刷新当前页面
  if (routeName && routeName === router.currentRoute.value.name) {
    isRouterAlive.value = false
    nextTick(() => {
      isRouterAlive.value = true
      include.value.push(name)
    })
  }
}

const clearCache = (name) => {
  if (!name) {
    name = router.currentRoute.value.name
  }
  const index = include.value.indexOf(name)
  if (index != -1) {
    include.value.splice(index, 1)
  }
}

proxy.$tabs.clearCache = (name) => {
  clearCache(name)
}
const include = ref([])
router.beforeEach((to, from, next) => {
  if (!to.meta || to.meta.keepAlive !== false) {
    if (!include.value.includes(to.name)) {
      include.value.push(to.name)
    }
  }
  next()
})

proxy.$tabs.reload = refreshPage
proxy.$tabs.clearCache = clearCache
include.value.push(router.currentRoute.value.name)
</script>
