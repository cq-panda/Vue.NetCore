import { ref, reactive } from 'vue'

const dataConfig = () => {
  return {
    permissionInited:ref(false),
    indexDate: ref(''),
    navigation: reactive([]),
    layout: ref(null),
    menuTop: ref(0),
    menuLeft: ref(0),
    menuWidth: ref(200),
    contextMenuVisible: ref(false),
    isCollapse: ref(false),
    drawer_model: ref(false),
    messageModel: ref(false),
    selectId: ref('1'),
    links: ref([]),
    navCurrentMenuId:ref(null),
    
    // 【首页】标签序号(当前右键选中的菜单)
    selectMenuIndex: ref('0'),
    currentMenuId: ref(0),
    userInfo: reactive({
      name: 'user',
      img: new URL('@/assets/imgs/default_header.png', import.meta.url).href,
      errorImg: ref(new URL('@/assets/imgs/default_header.png', import.meta.url).href)
    }),
    menuOptions: ref([]),
    navMenuList: reactive([]),
    menuData: reactive([]),
    visibleItem: reactive({
      left: false,
      right: false,
      all: false,
      other: false
    })
  }
}

export default dataConfig
