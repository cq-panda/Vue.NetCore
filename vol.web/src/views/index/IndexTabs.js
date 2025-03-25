
import { nextTick } from 'vue'
export default function (proxy, dataConfig, router) {
    const open = (item, useRoute) => {
        openTabs(proxy, dataConfig, item, useRoute, router)
    }

    const close = (value) => {
        closeTabs(proxy, dataConfig, router, value)

    }
    //导航右键关闭
    const navCloseTabs = (value) => {
        onNavCloseTabs(proxy, dataConfig, value)
    }
    const removeNav = (index) => {
        onRemoveNav(proxy, dataConfig, router, index);
    };

    const isDynamicPage = (item) => {
        return checkDynamicPage(router, item);
    }

    const navRefreshPage = (item) => {
        proxy.$tabs.reload(router.currentRoute.value.name)
    }
    const selectNav = (item) => {
        const navigation = dataConfig.navigation;
        dataConfig.selectId.value = item.props.name;
        let _path = navigation[item.index].path;
        dataConfig.currentMenuId.value =
            (
                dataConfig.menuOptions.value.find((c) => {
                    return c.path == _path;
                }) || { id: 0 }
            ).id * 1;

        router.push({
            path: navigation[item.index].path,
            query: navigation[item.index].query,
        });
        toDynamicPage(proxy,dataConfig,navigation[item.index],router)
    };
    return {
        navCloseTabs,
        open,
        close,
        selectNav,
        removeNav,
        isDynamicPage,
        navRefreshPage
    }
}


const toDynamicPage=(proxy,dataConfig,item,router)=>{
    if (!item) {
        console.log('item is null')
        return;
    }
    const navigation=dataConfig.navigation;
    if (checkDynamicPage(router,item)) {//navigation[item.index]
        const _path=item.path;
        router.push({ path: _path, query:item.query})// navigation[item.index].query 
        nextTick(() => {
            setTimeout(() => {
                proxy.$tabs.reload && proxy.$tabs.reload(getRouteOption(router, _path).name || router.currentRoute.value.name)
            }, 50);
        });
    }
}

//导航右键关闭
const onNavCloseTabs = (proxy, dataConfig, value) => {
    const navigation = dataConfig.navigation;
    const selectId = dataConfig.selectId;
    const selectMenuIndex = dataConfig.selectMenuIndex;
    //首页右键
    if (selectId.value=='-1') {
        selectId.value=0
        value=''
    }
    let _menuId = navigation[selectId.value * 1].id
    let currnetIndex = selectId.value * 1 // navigation.findIndex(c => { return c.id == selectId.value });
    switch (value) {
        case 'left': {
            // 删除左侧tab标签
            navigation.splice(1, currnetIndex - 1) // 删除左侧tab标签
            break
        }
        case 'right': {
            // 删除右侧tab标签
            if (selectMenuIndex.value == 0) {
                navigation.splice(currnetIndex) // 删除右侧tab标签
                toHome(proxy,navigation)
            } else {
                navigation.splice(currnetIndex + 1) // 删除右侧tab标签
                if (selectMenuIndex.value < currnetIndex) {
                    navigation.splice(selectMenuIndex.value, currnetIndex - selectMenuIndex.value)
                }
            }
            break
        }
        case 'other': {
            // 删除其他所有tab标签
            navigation.splice(currnetIndex + 1) // 删除右侧tab标签(这里必须按照右→左顺序删除)
            navigation.splice(1, currnetIndex - 1) // 删除左侧tab标签
            break
        }
        default: {
            //关闭所有
            navigation.splice(1, navigation.length)
            toHome(proxy,navigation)
            break
        }
    }
    selectId.value =
        navigation.findIndex((c) => {
            return c.id == _menuId
        }) + ''

    dataConfig.contextMenuVisible.value = false

}

const toHome = (proxy, navigation) => {
    proxy.$tabs.open({
        text: navigation[0].name,
        path: navigation[0].path
    })
}
//动态页面
const checkDynamicPage = (router, item) => {
    const b= router.getRoutes().some((x) => {
        return x.path == item.path && x.meta && x.meta.dynamic
    })
    return b;
}


const openTabs = (proxy, dataConfig, item, useRoute, router) => {
    const navigation = dataConfig.navigation;
    const selectId = dataConfig.selectId;
    const currentMenuId = dataConfig.currentMenuId;


    const dynamicPage = checkDynamicPage(router, item)
    let _index = navigation.findIndex((x) => {
        if (dynamicPage) {
            return x.path == item.path && x.name == item.name
        }
        return x.path == item.path
    })
    let b = false
    if (navigation[selectId * 1] && navigation[selectId * 1].path == item.path) {
        b = true
        //同一个页面不再跳转
        if (navigation[_index].name == item.name) {
            if (dynamicPage) {
                proxy.$tabs.reload && proxy.$tabs?.reload(router.currentRoute.value.name);
            }
            return
        }
    }
    //如果打开的是表单编辑设置tabs的标题
    setTabsName(proxy, dataConfig, item, _index)
    if (_index == -1) {
        navigation.push({
            //  orderNo: String(navigation.length),// 序号
            id: item.id + '',
            name: item.name || item.text || '无标题',
            path: item.path,
            query: item.query //2021.03.20修复自定义二次打开$tabs时参数丢失的问题
        })
        //新打开的tab移至最后一个选项
        selectId.value = navigation.length - 1 + ''
    } else {
        navigation[_index].query = item.query
        selectId.value = _index + ''
    }
    if (useRoute === undefined) {
        //非标准菜单，记录最后一次跳转的页面，用于刷新
        setItem(item)
        router.push(item)
        // this.$router.push(item);
    }
    if (dynamicPage) {
        toDynamicPage(proxy,dataConfig,item,router)
        // router.push({ path: item.path, query: item.query })
        // nextTick(() => {
        //     // proxy.$tabs.reload && proxy.$tabs.reload(getRouteOption(router, item.path).name)
        //     setTimeout(() => {
        //         proxy.$tabs.reload && proxy.$tabs.reload(getRouteOption(router, item.path).name || router.currentRoute.value.name)
        //         // proxy.$tabs.reload && proxy.$tabs.reload(router.currentRoute.value.name);
        //     }, 50);
        // });
        // setTimeout(() => {
        //     proxy.$tabs.reload()
        //     //refreshPage()
        // }, 50)
        // return;
    }
    currentMenuId.value = item.id * 1
    // tab菜单绑定右键事件
    nextTick(function (e) {
        bindRightClickMenu(true, proxy, dataConfig, router)
    })
}
const closeTabs = (proxy, dataConfig, router, path) => {
    /* 2020.07.31增加手动打开tabs*/
    let index = dataConfig.navigation.findIndex((x) => {
        return x.path == path
    })
    if (index == -1) {
        return proxy.$Message.error('未找到菜单')
    }
    onRemoveNav(proxy, dataConfig, router, index)

}

export const onRemoveNav = (proxy, dataConfig, router, index) => {
    proxy.$tabs.clearCache()
    return new Promise(() => {
        const navigation = dataConfig.navigation;
        const selectId = dataConfig.selectId;
        const currentMenuId = dataConfig.currentMenuId;
        //关闭的当前项,跳转到前一个页面
        if (selectId.value == index + '') {
            //console.log(navigation[_index - 1])
            setItem(navigation[index - 1])
            router.push({
                path: navigation[index - 1].path,
                //2022.06.27修复tabs二次切换后参数丢失的问题
                query: navigation[index - 1].query
            })
            navigation.splice(index, 1)
            selectId.value = selectId.value - 1 + ''
            toDynamicPage(proxy,dataConfig,dataConfig.navigation[index-1],router)
            return
        }
        if (index < selectId.value) {
            selectId.value = selectId.value - 1 + ''
        }
        navigation.splice(index, 1)
        currentMenuId.value = (
            dataConfig.menuOptions.value.find((c) => {
                return c.path == navigation[selectId.value * 1].path
            }) || { id: 0 }
        ).id * 1
    })
}

const setItem = (item) => {
    /* 2020.07.31增加手动打开tabs*/
    localStorage.setItem(window.location.origin + '_tabs', JSON.stringify(item))
}

const getRouteOption = (router, path) => {
    return router.options.routes[0].children.find((x) => {
        return x.path == path
    })
}
const setTabsName = (proxy, dataConfig, item, _index) => {
    const navigation = dataConfig.navigation;
    const router = proxy.$router;
    const routeOption = getRouteOption(router, item.path);
    if (!routeOption) {
        return
    }
    if (routeOption.meta && routeOption.meta.name && routeOption.meta.edit) {
        if (!item.query) {
            item.query = {}
        }
        let _item = navigation.find((c) => {
            return c.path == item.path
        })
        if (_item) {
            _item.query = item.query
        }
        let id = _index == -1 ? router.currentRoute.value.query.id : item.query.id
        if (!id) {
            id = item.query.id
        }
        item.text = routeOption.meta.name //+ (id ? '(' + $ts('编辑') + ')' : '(' + $ts('新建') + ')');
    }
    if (_index != -1) {
        navigation[_index].name = item.text || item.name
    }
}

const bindRightClickMenu = (enable, proxy, dataConfig, router) => {
    if (!enable) return
    // 使用原生js 为单个dom绑定鼠标右击事件
    nextTick(() => {
        let tab_top_dom = Object.assign([], document.getElementsByClassName('el-tabs__item is-top'))
        tab_top_dom.forEach((item, index) => {
            item.oncontextmenu = (e) => {
                openTabsMenu(e, proxy, dataConfig, router)
            }
        })
    })
}

/**
* 显示右键菜单
* @param {*} e 事件对象
*/
const openTabsMenu = function (e, proxy, dataConfig) {
    const navigation = dataConfig.navigation;
    e.preventDefault() // 防止默认菜单弹出
    let tabId = e.target.id.split('-')[1] * 1

    //记录当前选中的菜单index
    dataConfig.selectMenuIndex.value = document.getElementById('pane-' + tabId).children[0].textContent * 1
    //只有首页时不显示
    if (navigation.length == 1) {
        return
    }

    const visibleItem = dataConfig.visibleItem;
    //首页设置显示关闭右边菜单
    if (!dataConfig.selectMenuIndex.value) {
        visibleItem.all = false
        visibleItem.right = true
        visibleItem.left = false
        visibleItem.other = false
    } else {
        visibleItem.all = true
        //不是最后一个显示关闭右边菜单
        visibleItem.right = dataConfig.selectMenuIndex.value != navigation.length - 1
        //只有两个菜单时不显示关闭左边
        visibleItem.left = navigation.length != 2
        //只有两个菜单时不显示关闭其他
        visibleItem.other = navigation.length != 2
    }
    dataConfig.contextMenuVisible.value = true
    // 设置右键菜单显示的位置
    dataConfig.menuLeft.value = e.target.getBoundingClientRect().left + 1 //- (isCollapse.value ? 63 : 198); //-e.target.clientWidth
    dataConfig.menuTop.value = e.target.getBoundingClientRect().top + e.target.clientHeight + 4
}