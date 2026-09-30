import MessageConfig from './MessageConfig.js'
import { computed, watch, nextTick } from 'vue'

/** 顶部主导航「更多」预留宽度（与测量逻辑一致） */
export const TOP_NAV_RESERVE_MORE = 80

/** 顶部布局导航：宽度不足时折叠进「更多」下拉 */
export function registerTopNav(dataConfig) {
  const {
    layout,
    navMenuList,
    navCurrentMenuId,
    permissionInited,
    topNavRowRef,
    topNavMeasureRef,
    topNavVisibleList,
    topNavOverflowList
  } = dataConfig

  const getNavTopIndex = (item) => navMenuList.findIndex((x) => x.id === item.id)

  const navOverflowHasActive = computed(() =>
    topNavOverflowList.value.some((item) => item.id === navCurrentMenuId.value)
  )

  const recalcTopNav = () => {
    if (layout.value !== 'top') {
      topNavVisibleList.value = []
      topNavOverflowList.value = []
      return
    }
    const list = navMenuList
    if (!list.length) {
      topNavVisibleList.value = []
      topNavOverflowList.value = []
      return
    }
    nextTick(() => {
      const measure = topNavMeasureRef.value
      const row = topNavRowRef.value
      if (!measure || !row) {
        topNavVisibleList.value = [...list]
        topNavOverflowList.value = []
        return
      }
      const itemEls = measure.querySelectorAll('.nav-measure-item')
      if (itemEls.length !== list.length) {
        topNavVisibleList.value = [...list]
        topNavOverflowList.value = []
        return
      }
      const widths = Array.from(itemEls).map((el) => el.getBoundingClientRect().width)
      const avail = row.clientWidth
      const n = list.length
      if (avail <= 0) {
        topNavVisibleList.value = [...list]
        topNavOverflowList.value = []
        return
      }
      let sum = 0
      let visibleEnd = 0
      for (let i = 0; i < n; i++) {
        const w = widths[i] || 72
        const notLast = i < n - 1
        if (notLast) {
          if (sum + w + TOP_NAV_RESERVE_MORE <= avail) {
            sum += w
            visibleEnd = i + 1
          } else {
            break
          }
        } else if (sum + w <= avail) {
          visibleEnd = n
        }
      }
      if (visibleEnd === 0 && n > 0) {
        visibleEnd = 1
      }
      if (visibleEnd >= n) {
        topNavVisibleList.value = [...list]
        topNavOverflowList.value = []
      } else {
        topNavVisibleList.value = list.slice(0, visibleEnd)
        topNavOverflowList.value = list.slice(visibleEnd)
      }
    })
  }

  let topNavResizeObserver = null
  const bindTopNavResizeObserver = () => {
    topNavResizeObserver?.disconnect()
    topNavResizeObserver = null
    nextTick(() => {
      const row = topNavRowRef.value
      if (!row || typeof ResizeObserver === 'undefined') return
      topNavResizeObserver = new ResizeObserver(() => {
        recalcTopNav()
      })
      topNavResizeObserver.observe(row)
    })
  }

  watch(
    () => layout.value,
    () => {
      bindTopNavResizeObserver()
      recalcTopNav()
    },
    { flush: 'post' }
  )

  watch(
    () => permissionInited.value,
    (v) => {
      if (v) {
        nextTick(() => {
          bindTopNavResizeObserver()
          recalcTopNav()
        })
      }
    }
  )

  watch(
    navMenuList,
    () => {
      recalcTopNav()
    },
    { deep: true, flush: 'post' }
  )

  const mountTopNav = () => {
    bindTopNavResizeObserver()
    recalcTopNav()
  }

  const unmountTopNav = () => {
    topNavResizeObserver?.disconnect()
    topNavResizeObserver = null
  }

  return {
    getNavTopIndex,
    navOverflowHasActive,
    recalcTopNav,
    bindTopNavResizeObserver,
    mountTopNav,
    unmountTopNav
  }
}

export default function (proxy, dataConfig, router, onSelect) {
  const store = proxy.$store
  let _userInfo = store.getters.getUserInfo()
  if (!_userInfo) {
    router.push({ path: "/login" })
    return;
  }
  const userInfo = dataConfig.userInfo
  userInfo.name = _userInfo.userName
  if (_userInfo.img) {
    userInfo.img = proxy.base.getImgSrc(
      _userInfo.img,
      proxy.$global.oss?.url || proxy.http.ipAddress
    )
  }

  proxy.http.get('api/menu/getTreeMenu', {}, false).then((result) => {
    const navMenuList = dataConfig.navMenuList
    const navCurrentMenuId = dataConfig.navCurrentMenuId
    const menuOptions = dataConfig.menuOptions
    const selectId = dataConfig.selectId
    const menuData = dataConfig.menuData
    proxy.base.setAsyncApi(result.asyncApi)

    let data = result.menu
    let dataItem = data.find((x) => {
      return x.linkType == 3 && (!x.enable || x.enable == 1)
    })
    if (dataConfig.layout.value != 'classics') {
      navMenuList.push(
        ...data.filter((c) => {
          return !c.parentId
        })
      )
    }
    data.push({ id: '0', name: '首页', url: '/home', icon: 'bi-house' }) // 为了获取选中id使用

    initQueryParams(data)

    store.dispatch('setPermission', data)

    if (navMenuList.length) {

      navMenuList.forEach((m) => {
        m.children = data.filter((c) => {
          return c.parentId == m.id
        })
        m.children.forEach((c) => {
          c.parentId = 0
        })
        for (let index = 0; index < m.children.length; index++) {
          const mItem = m.children[index]
          let mChildrenItems = data.filter((c) => {
            return c.parentId == mItem.id
          })
          m.children.push(...mChildrenItems)
        }
      })
      let navMenuIndex = navMenuList.findIndex((c) => {
        return c.id === dataConfig.navCurrentMenuId.value
      })
      if (navMenuIndex == -1) {
        navCurrentMenuId.value = navMenuList[0].id
        menuData.push(...navMenuList[0].children)
      } else {
        menuData.push(...navMenuList[navMenuIndex].children)
      }
    } else {
      menuData.push(...data)
    }
   
    menuOptions.value = data

    // console.log(JSON.stringify(menuOptions.value))

    dataConfig.permissionInited.value = true

    //开启消息推送（main.js中设置是否开启signalR)
    if (proxy.$global.signalR) {
      // MessageConfig(proxy.http, (result) => {
      //   // messageList.unshift(result)
      //   //    console.log(result)
      // })
    }

    //当前刷新是不是首页
    if (router.currentRoute.value?.path != dataConfig.navigation[0]?.path) {
      //查找系统菜单
      let item = menuOptions.value.find((x) => {
        return x.url && x.url == router.currentRoute.value.fullPath
      })
      if (!item) {
        item = menuOptions.value.find((x) => {
          return x.path == router.currentRoute.value.path
        })
      }
      if (item) return onSelect(item.id)
      //查找顶部快捷连接
      item = dataConfig.links.value.find((x) => {
        return x.path == router.currentRoute.value.path
      })
      //查找最后一次跳转的页面
      if (!item) {
        item = getItem(proxy, router)
      }
      if (item) {
        return proxy.$tabs.open(item, false)
      } else {
        const indexVal = dataConfig.navigation.findIndex(x => { return x.path == router.currentRoute.value.path })
        if (indexVal != -1) {
          selectId.value = indexVal + '';
          return;
        }
      }
    }
    selectId.value = '0'
  })
}

const getItem = (proxy, router) => {
  let item =
    router.options.routes[0].children.find((x) => {
      return x.path == router.currentRoute.value.path
    }) || {}
  //生成的编辑页面tabs名称
  if (item.meta && item.meta.name) {
    let name = item.meta.name
    if (item.meta.edit) {
      name =
        proxy.$ts(name) +
        (router.currentRoute.value.query.id
          ? '(' + proxy.$ts('编辑') + ')'
          : '(' + proxy.$ts('新建') + ')')
    }
    item = {
      name: name,
      path: router.currentRoute.value.path,
      query: router.currentRoute.value.query
    }
    return proxy.$tabs.open(item, false)
  } else {
    let nav = localStorage.getItem(window.location.origin + '_tabs')
    return nav ? JSON.parse(nav) : null
  }
  //  return null;
}

const initQueryParams = (data) => {
  for (let index = 0; index < data.length; index++) {
    const d = data[index]
    d.pid = d.parentId
    if (d.url && d.url.indexOf('?') != -1) {
      let _arr = d.url.split('?')
      d.path = _arr[0]
      _arr = _arr[1].split('&')
      let queryObj = {}
      for (let i = 0; i < _arr.length; i++) {
        // 遍历参数
        if (_arr[i].indexOf('=') != -1) {
          // 如果参数中有值
          let str = _arr[i].split('=')
          queryObj[str[0]] = str[1]
        }
      }
      d.query = queryObj
    } else {
      d.path = d.url
    }
    d.to = d.url
  }
}
