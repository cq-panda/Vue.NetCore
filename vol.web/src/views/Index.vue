<template>
  <vol-loading v-if="!permissionInited" center></vol-loading>
  <div
    id="vol-container"
    :class="['vol-theme-' + theme, layoutIsLeft() ? 'vol-layout-left' : '']"
    v-if="permissionInited"
  >
    <div class="vol-aside" :style="{ width: (isCollapse ? 63 : 200) + 'px' }">
      <div class="header">
        <div class="vol-aside-project-name">
          .Net8 Vol开发框架
        </div>
        <!-- 这里可以改为logo显示 -->
        <!-- <img  src="@/assets/imgs/logo.png" /> -->
      </div>
      <div class="vol-menu">
        <el-scrollbar style="height: 100%; flex: 1;border-right:0;">
          <VolMenu
            :currentMenuId="currentMenuId"
            :on-select="onSelect"
            :enable="true"
            :open-select="false"
            :isCollapse="isCollapse"
            :list="menuData"
          ></VolMenu>
        </el-scrollbar>
      </div>
    </div>
    <div class="vol-container">
      <div class="vol-header">
        <!-- 这里可以放项目名称 -->
        <!-- <div class="project-name">xx管理平台</div> -->
        <div class="header-text">
         
          <div class="h-link" v-if="layout == 'top'">
            <a
              :class="[navCurrentMenuId === item.id ? 'h-link-a-acitve' : '']"
              @click="menuDataClick(item, index)"
              v-for="(item, index) in navMenuList"
              :key="index"
            >
              <i :class="item.icon"></i> <span> {{ $ts(item.name) }}</span>
            </a>
          </div>
          <div class="h-link">
            <a @click="linkClick(item)" v-for="(item, index) in links" :key="index">
              <i :class="item.icon"></i> <span> {{ item.text }}</span>
            </a>
          </div>
        </div>
        <div class="header-info">
          <!-- <div class="h-link" style="margin-right: 10px">
            <lang :color="color"></lang>
          </div> -->
          <div class="h-link">
            <vol-menu-filter :on-select="onSelect"></vol-menu-filter>
          </div>
          <div class="h-link h-link-icons">
            <a
              v-for="(item, index) in icons"
              @click="linkClick(item)"
              :key="index"
              :class="item.icon"
            ></a>
            <!-- <a><i class="el-icon-message-solid"></i></a> -->
          </div>
          
          <!--消息管理-->
          <div class="h-link">
            <message :list="messageList"></message>
            <!-- <a><i class="el-icon-message-solid"></i></a> -->
          </div>
    
          <div class="user-header-info">
            <el-dropdown trigger="hover">
              <div class="user-header-content">
                <img class="user-header-img" :src="userInfo.img" @error="getErrorImg" />
                <div class="user-header-content-right">
                  <div class="user-name">
                    {{ userInfo.name }}<i class="el-icon-arrow-down user-name-drop-icon"></i>
                  </div>
                  <div id="index-date" class="index-date">{{ indexDate }}</div>
                </div>
              </div>
              <template #dropdown>
                <el-dropdown-menu>
                  <el-dropdown-item v-for="(item, index) in userDropItems" :key="index">
                    <div @click="linkClick(item)">
                      <i :class="item.icon"></i> {{ $ts(item.text) }}
                    </div>
                  </el-dropdown-item>
                </el-dropdown-menu>
              </template>
            </el-dropdown>
          </div>
        </div>
      </div>
      <div class="vol-path">
        <el-tabs
          @tab-click="selectNav"
          @tab-remove="removeNav"
          type="border-card"
          class="header-navigation"
          v-model="selectId"
          :strtch="false"
        >
          <el-tab-pane
            v-for="(item, navIndex) in navigation"
            type="card"
            :name="navIndex + ''"
            :closable="navIndex > 0"
            :key="navIndex"
            :label="$ts(item.name)"
          >
            <span style="display: none">{{ navIndex }}</span>
          </el-tab-pane>
        </el-tabs>
        <!-- 右键菜单 -->
        <div v-show="contextMenuVisible">
          <ul :style="{ left: menuLeft + 'px', top: menuTop + 'px' }" class="contextMenu">
            <li v-show="visibleItem.left">
              <el-button link @click="navCloseTabs('left')"
                ><i class="el-icon-back"></i>{{ $ts('关闭左边') }}</el-button
              >
            </li>
            <li v-show="visibleItem.right">
              <el-button link @click="navCloseTabs('right')">
                <i class="el-icon-right"></i>{{ $ts('关闭右边') }}</el-button
              >
            </li>
            <li v-show="visibleItem.other">
              <el-button link @click="navCloseTabs('other')"
                ><i class="el-icon-right"></i>{{ $ts('关闭其他') }}
              </el-button>
            </li>
            <li>
              <el-button link @click="navRefreshPage"
                ><i class="el-icon-refresh"></i>{{ $ts('刷新页面') }}
              </el-button>
            </li>
          </ul>
        </div>
      </div>
      <div class="vol-main" id="vol-main">
        <el-scrollbar style="height: 100%">
          <index-router-view></index-router-view>
        </el-scrollbar>
      </div>
    </div>
    <el-drawer
      :title="$ts('基础设置')"
      size="360px"
      v-model="drawer_model"
      direction="rtl"
      destroy-on-close
    >
      <home-setting @layoutChange="layoutChange"></home-setting>
    </el-drawer>
  </div>
</template>
<style lang="less" scoped>
@import './index/index.less';
@import './index/aside.less';
</style>
<script setup>
import VolLoading from '@/components/basic/VolLoading'
import VolMenuFilter from '@/components/basic/VolMenuFilter.vue'
import VolMenu from '@/components/basic/VolElementMenu.vue'
import Message from './index/Message.vue'
import IndexDataConfig from './index/IndexDataConfig.js'
import IndexTabs from './index/IndexTabs.js'
import HomeSetting from './index/Setting.vue'
import inintMenu from './index/IndexMethods.js'
import IndexRouterView from './index/IndexRouterView'

import { reactive, ref, watch, onMounted, onUnmounted, getCurrentInstance, computed } from 'vue'
import { useRouter, useRoute } from 'vue-router'
import store from '../store/index'
const router = useRouter()
const $route = useRoute()
const { proxy, appContext } = getCurrentInstance()
const dataConfig = IndexDataConfig()
const {
  permissionInited,
  indexDate,
  layout,
  navigation,
  menuTop,
  menuLeft,
  menuWidth,
  navCurrentMenuId,
  contextMenuVisible,
  isCollapse,
  drawer_model,
  userImg,
  selectId,
  selectMenuIndex,
  currentMenuId,
  userName,
  userInfo,
  menuOptions,
  visibleItem,
  links,
  navMenuList,
  menuData
} = dataConfig
const { navCloseTabs, open, close, selectNav, removeNav,navRefreshPage } = IndexTabs(proxy, dataConfig, router)

navigation.push({ orderNo: '0', id: '1', name: '首页', path: '/home' })
links.value.push(...[{
  text: 'App移动端',
  path: 'http://app.volcore.xyz/',
  id: -1,
  icon: 'el-icon-mobile',
  left: true
},{
  text: '框架文档',
  path: 'http://v3.volcore.xyz/',
  id: -1,
  icon: 'el-icon-folder-opened',
  left: true
},{
  text: '企业版本',
  path: 'http://pro.volcore.xyz/',
  id: -1,
  icon: 'el-icon-coin',
  left: true
},{
  text: '框架视频',
  path: 'https://www.cctalk.com/m/group/90268531',
  id: -1,
  icon: 'el-icon-video-camera',
  left: true
}])

const userDropItems = reactive([
  { text: '消息管理', icon: 'el-icon-bell', hidden: true },
  { text: '个人中心', path: '/userInfo', icon: 'el-icon-user' },
  {
    text: '基础设置',
    icon: 'el-icon-setting',
    click: () => {
      drawer_model.value = true
    }
  },
  { text: '安全退出', path: '/login', icon: 'el-icon-switch-button' }
])
const icons = computed(() => {
  return userDropItems.filter((x) => {
    return !x.hidden
  })
})

const color = ref('')
const getColor = () => {
  color.value = layoutIsLeft() || theme.value == 'dark' ? '#000' : '#ffff'
}

const theme = ref()
theme.value = proxy.$global.theme || ''
const messageList = reactive([])

const toggleLeft = () => {
  isCollapse.value = !isCollapse.value
  menuWidth.value = isCollapse.value ? 63 : 200
}

appContext.config.globalProperties.menu = {
  show() {
    toggleLeft()
  },
  hide() {
    toggleLeft()
  }
}

const getErrorImg = ($e) => {
  $e.target.src = userInfo.errorImg
}


const linkClick = (item) => {
  if (item.click) {
    item.click()
    return
  }
  if (!item.path) {
    item.path = ''
  }
  /* 2020.07.31增加手动打开tabs*/
  if (item.path.indexOf('http') != -1) {
    window.open(item.path)
    return
  }
  if (typeof item == 'string' || item.path == '/login') {
    if (item == '/login' || item.path == '/login') {
      store.commit('clearUserInfo', '')
      window.location.reload()
      return
    }
    router.push({ path: item })
    return
  }
  if (item.path == '#') return
  open(item)
}

const getSelectMenuName = (id) => {
  return menuOptions.value.find(function (x) {
    return x.id == id
  })
}
const onSelect = (treeId) => {
  /* 2020.07.31增加手动打开tabs*/
  var item = getSelectMenuName(treeId)
  open(item, false)
}

const closeTabsMenu = () => {
  contextMenuVisible.value = false
}

watch(
  () => contextMenuVisible.value,
  (newVal, oldVal) => {
    if (newVal) {
      document.body.addEventListener('click', closeTabsMenu)
    } else {
      document.body.removeEventListener('click', closeTabsMenu)
    }
  }
)

const navKey = 'nav:id'
navCurrentMenuId.value = localStorage.getItem(navKey) * 1 || -1
const menuDataClick = (mItem, index) => {
  if (navCurrentMenuId.value === navMenuList[index].id) {
    return
  }

  navCurrentMenuId.value = navMenuList[index].id
  localStorage.setItem(navKey, navCurrentMenuId.value)
  menuData.splice(0)
  menuData.push(...navMenuList[index].children)
}

layout.value = localStorage.getItem('vol-layout')
if (!layout.value) {
  layout.value = proxy.$global.layout || 'top'
}
const layoutChange = (layoutValue, themeValue) => {
  layout.value = layoutValue
  theme.value = themeValue
  getColor()
}
const layoutIsLeft = () => {
  return layout.value == 'left'
}
theme.value = localStorage.getItem('vol-theme')
if (!theme.value) {
  if (layoutIsLeft()) {
    theme.value = proxy.$global.theme + '-aside'
  } else {
    theme.value = proxy.$global.theme
  }
}

getColor()
inintMenu(proxy, dataConfig, router, onSelect)

Object.assign(proxy.$tabs, { open: open, close: close })

let interval
onMounted(() => {
  indexDate.value = proxy.base.getDate(true)
  interval = setInterval(() => {
    indexDate.value = proxy.base.getDate(true)
  }, 1000)
})
onUnmounted(() => {
  clearInterval(interval)
})
</script>
<style>
.horizontal-collapse-transition {
  transition: 0s width ease-in-out, 0s padding-left ease-in-out, 0s padding-right ease-in-out;
}
</style>
