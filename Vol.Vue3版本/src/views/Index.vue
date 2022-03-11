<template>
  <div id="vol-container" :class="['vol-theme-' + theme]">
    <div class="vol-aside" :style="{ width: menuWidth + 'px' }">
      <div class="header" :style="{ width: menuWidth - 1 + 'px' }">
        <img v-show="!isCollapse" v-bind:src="logo" />
        <i @click="toggleLeft" class="el-icon-s-fold collapse-menu" />
      </div>
      <div class="vol-menu">
        <el-scrollbar style="height: 100%">
          <VolMenu
            :on-select="onSelect"
            :enable="true"
            :open-select="false"
            :isCollapse="isCollapse"
            :list="menuOptions"
          ></VolMenu>
        </el-scrollbar>
      </div>
    </div>
    <div class="vol-container" :style="{ left: menuWidth - 1 + 'px' }">
      <div class="vol-header">
        <span class="header-text"
          >支持业务代码扩展的快速开发框架(vue3.x版本)</span
        >
        <div class="header-info">
          <div class="h-link">
            <a
              href="javascript:void(0)"
              @click="to(item)"
              v-for="(item, index) in links"
              :key="index"
              v-bind:class="{ actived: selectId == item.id }"
              >{{ item.text }}
            </a>
          </div>
          <div>
            <img class="user-header" :src="userImg" :onerror="errorImg" />
          </div>
          <div class="user">
            <span>{{ userName }}</span>
            <br />
            <span id="index-date"></span>
          </div>
          <div class="settings">
            <i
              style="font-size: 20px"
              class="el-icon-s-tools"
              @click="drawer_model = true"
            />
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
        >
          <el-tab-pane
            v-model="selectId"
            v-for="(item, navIndex) in navigation"
            type="card"
            :name="navIndex + ''"
            :closable="navIndex > 0"
            :key="navIndex"
            class="header-nav-item"
            :label="item.name"
          ></el-tab-pane>
        </el-tabs>
      </div>
      <div class="vol-main" id="vol-main">
        <el-scrollbar style="height: 100%" v-if="permissionInited">
          <loading v-show="$store.getters.isLoading()"></loading>
          <router-view
            v-if="
              !$route.meta ||
              ($route.meta && !$route.meta.hasOwnProperty('keepAlive'))
            "
            v-slot="{ Component }"
          >
            <keep-alive>
              <component :is="Component" />
            </keep-alive>
          </router-view>
          <router-view
            v-if="$route.meta && $route.meta.hasOwnProperty('keepAlive')"
          ></router-view>
        </el-scrollbar>
      </div>
    </div>
    <el-drawer
      title="选择主题"
      v-model="drawer_model"
      direction="rtl"
      destroy-on-close
    >
      <div class="theme-selector">
        <div
          @click="changeTheme(item.name)"
          class="item"
          v-for="(item, index) in theme_color"
          :key="index"
          :style="{ background: item.color }"
        >
          <div
            v-show="item.leftColor"
            :style="{ background: item.leftColor }"
            style="height: 100%; width: 20px"
            class="t-left"
          ></div>
          <div class="t-right"></div>
        </div>
      </div>
    </el-drawer>
  </div>
</template>
<style lang="less" scoped>
@import "./index/index.less";
</style>
<script>
import loading from "@/components/basic/RouterLoading";
import VolMenu from "@/components/basic/VolElementMenu.vue";
var imgUrl = require("@/assets/imgs/logo.png");
var $this;
var $interval;
var $indexDate;
import { defineComponent, ref, onMounted, getCurrentInstance } from "vue";
import { useRouter, useRoute } from "vue-router";
import store from "../store/index";
import http from "@/../src/api/http.js";
export default defineComponent({
  components: {
    VolMenu,
    loading,
  },
  setup(props, context) {
    const menuWidth = ref(200);
    const isCollapse = ref(false);
    const drawer_model = ref(false);
    const theme_color = ref([
      { name: "blue", color: "rgb(45, 140, 240)" },
      { name: "blue2", color: "rgb(45, 140, 240)", leftColor: "#0068d6" },
      { name: "red", color: "rgb(237, 64, 20)" },
      { name: "red2", color: "rgb(237, 64, 20)", leftColor: "#a90000" },
      { name: "dark", color: "#272929" },
      { name: "orange", color: "#ff9900" },
      { name: "orange2", color: "#ff9900", leftColor: "rgb(232 141 5)" },
      { name: "green", color: "rgb(25, 190, 107)" },
      { name: "green2", color: "rgb(25, 190, 107)", leftColor: "#019e4f" },
      { name: "white", color: "#fff" },
    ]);
    const links = ref([
      { text: "大屏数据", path: "/bigdata", id: -3 },
      { text: "框架文档", path: "http://v2.volcore.xyz/document/guide", id: -2 },
      { text: "GitHub", path: "#", id: -3 },
      { text: "个人中心", path: "/UserInfo", id: -1 },
      { text: "安全退出", path: "/login", id: -4 },
    ]);
    const errorImg = ref(
      'this.src="' + require("@/assets/imgs/error-img.png") + '"'
    );
    const selectId = ref("0");
    const userName = ref("--");
    const userInfo = ref({});
    const userImg = ref("");
    const navigation = ref([{ name: "首页", id: 0, path: "/home" }]);
    const logo = ref(imgUrl);
    const theme = ref("blue2");
    const menuOptions = ref([]);
    const permissionInited = ref(false);

    let _config = getCurrentInstance().appContext.config.globalProperties;
    let router = useRouter();
    const toggleLeft = () => {
      isCollapse.value = !isCollapse.value;
      menuWidth.value = isCollapse.value ? 63 : 200;
    };
    //2021.08.28开放手动折叠菜单方法
    _config.menu = {
      show() {
        toggleLeft();
      },
      hide() {
        toggleLeft();
      },
    };
    const changeTheme = (name) => {
      if (theme.value != name) {
        theme.value = name;
      }
      localStorage.setItem("vol3_theme", name);
    };
    const to = (item) => {
      /* 2020.07.31增加手动打开tabs*/
      if (item.path == "#") {
        window.open("https://github.com/cq-panda/Vue.NetCore");
        return;
      }
      if (item.path.indexOf("http") != -1) {
        window.open(item.path);
        return;
      }
      if (typeof item == "string" || item.path == "/login") {
        if (item == "/login" || item.path == "/login") {
          store.commit("clearUserInfo", "");
          window.location.href = "/";
          return;
        }
        router.push({ path: item });
        return;
      }
      if (item.path == "#") return;
      open(item);
    };
    const open = (item, useRoute) => {
      /* 2020.07.31增加手动打开tabs*/
      let _index = navigation.value.findIndex((x) => {
        return x.path == item.path;
      });
      if (_index == -1) {
        navigation.value.push({
          name: item.name || item.text || "无标题",
          path: item.path,
          query: item.query, //2021.03.20修复自定义二次打开$tabs时参数丢失的问题
        });
        //新打开的tab移至最后一个选项
        selectId.value = navigation.value.length - 1 + "";
        //return;
      } else {
        selectId.value = _index + "";
      }
      if (useRoute === undefined) {
        //非标准菜单，记录最后一次跳转的页面，用于刷新
        setItem(item);
        router.push(item);
        // this.$router.push(item);
      }
    };
    const close = (path) => {
      /* 2020.07.31增加手动打开tabs*/
      let index = navigation.value.findIndex((x) => {
        return x.path == path;
      });
      if (index == -1) {
        return _config.$Message.error("未找到菜单");
      }
      removeNav(index);
    };
    const setItem = (item) => {
      /* 2020.07.31增加手动打开tabs*/
      localStorage.setItem(
        window.location.origin + "_tabs",
        JSON.stringify(item)
      );
    };
    const getItem = () => {
      /* 2020.07.31增加手动打开tabs*/
      let nav = localStorage.getItem(window.location.origin + "_tabs");
      return nav ? JSON.parse(nav) : null;
    };
    const selectNav = (item) => {
      selectId.value = item.instance.props.name + "";
      router.push({
        path: navigation.value[item.index].path,
        query: navigation.value[item.index].query,
      });
    };
    const removeNav = (_index) => {
      return new Promise(() => {
        //关闭的当前项,跳转到前一个页面
        if (selectId.value == _index + "") {
          setItem(navigation.value[_index - 1]);
          router.push({
            path: navigation.value[_index - 1].path,
          });
          navigation.value.splice(_index, 1);
          selectId.value = selectId.value - 1 + "";
          return;
        }
        if (_index < selectId.value) {
          selectId.value = selectId.value - 1 + "";
        }
        navigation.value.splice(_index, 1);
      });
    };

    const getSelectMenuName = (id) => {
      return menuOptions.value.find(function (x) {
        return x.id == id;
      });
    };
    const onSelect = (treeId) => {
      /* 2020.07.31增加手动打开tabs*/
      var item = getSelectMenuName(treeId);
      open(item, false);
    };

    const created = () => {
      let _theme = localStorage.getItem("vol3_theme");
      if (_theme) {
        theme.value = _theme;
      }

      let _userInfo = store.getters.getUserInfo();
      if (_userInfo) {
        userName.value = _userInfo.userName;
        userImg.value = _config.base.getImgSrc(_userInfo.img, http.ipAddress);
      }
      Object.assign(_config.$tabs, { open: open, close: close });

      http.get("api/menu/getTreeMenu", {}, true).then((data) => {
        data.forEach((d) => {
          d.path = (d.url || "").replace("/Manager", "");
          d.to = (d.url || "").replace("/Manager", "");
          if (!d.icon || d.icon.substring(0, 3) != "el-") {
            d.icon = "el-icon-menu";
          }
        });
        store.dispatch("setPermission", data);
        menuOptions.value = data;
        permissionInited.value = true;

        //当前刷新是不是首页
        if (router.currentRoute.value.path != navigation.value[0].path) {
          //查找系统菜单
          let item = menuOptions.value.find((x) => {
            return x.path == router.currentRoute.value.path; //this.$route.path;
          });
          if (item) return onSelect(item.id);
          //查找顶部快捷连接
          item = links.value.find((x) => {
            return x.path == router.currentRoute.value.path; //this.$route.path;
          });
          //查找最后一次跳转的页面
          if (!item) {
            item = getItem();
          }
          if (item) {
            return open(item, false);
          }
        }
        selectId.value = "0";
      });
    };
    created();
    return {
      menuWidth,
      isCollapse,
      drawer_model,
      theme_color,
      errorImg,
      userInfo,
      userName,
      userImg,
      selectId,
      navigation,
      links,
      onSelect,
      selectNav,
      removeNav,
      logo,
      theme,
      menuOptions,
      permissionInited,
      changeTheme,
      to,
      toggleLeft,
    };
  },
  mounted() {
    let _date = showTime();
    $indexDate = document.getElementById("index-date");
    $indexDate.innerText = _date;
    $interval = setInterval(function () {
      $indexDate.innerText = showTime();
    }, 1000);
  },
  destroyed() {
    $this = null;
    clearInterval($interval);
  },
});
const week = new Array(
  "星期一",
  "星期二",
  "星期三",
  "星期四",
  "星期五",
  "星期六",
  "星期日"
);
function showTime() {
  let date = new Date();
  let year = date.getFullYear();
  let month = date.getMonth() + 1;
  let day = date.getDate();
  let hour = date.getHours();
  let minutes = date.getMinutes();
  let second = date.getSeconds();

  return (
    year +
    "." +
    (month < 10 ? "0" + month : month) +
    "." +
    (day < 10 ? "0" + day : day) + //202.08.08修复日期天数小于10时添加0
    "" +
    " " +
    (hour < 10 ? "0" + hour : hour) +
    ":" +
    (minutes < 10 ? "0" + minutes : minutes) +
    ":" +
    (second < 10 ? "0" + second : second) +
    " " + //2020.08.30修复首页日期星期天不显示的问题
    (week[date.getDay() - 1] || week[6])
  );
}
</script>

<style lang="less" scoped>
.vol-container .vol-path ::v-deep(.el-tabs__content) {
  padding: 0;
}
</style>
<style >
.horizontal-collapse-transition {
  transition: 0s width ease-in-out, 0s padding-left ease-in-out,
    0s padding-right ease-in-out;
}
</style>