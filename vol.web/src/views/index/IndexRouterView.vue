<template>
  <!-- <vol-loading v-show="$store.getters.isLoading()"></vol-loading> -->
  <router-view v-slot="{ Component }">
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
</template>
<script setup>
// import VolLoading from "@/components/basic/VolLoading";
import { useRouter, useRoute } from 'vue-router'
import { ref, getCurrentInstance, nextTick } from 'vue'
const { proxy } = getCurrentInstance()
const router = useRouter()
const $route = useRoute()
const isRouterAlive = ref(true)

const refreshPage = (routeName, _clearCache) => {
  const name = routeName || router.currentRoute.value.name

  // if (typeof _clearCache == 'boolean' && _clearCache) {
  clearCache(name)
  // }
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
</script>
