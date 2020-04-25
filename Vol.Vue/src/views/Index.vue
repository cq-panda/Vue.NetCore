<template>
  <div id="vol-container" :class="['vol-theme-'+theme]">
    <div class="vol-aside">
      <div class="header">
        <img v-bind:src="log" />
      </div>
      <div class="vol-menu">
        <el-scrollbar style="height:100%;">
          <VolMenu theme="dark" :onSelect="onSelect" :options="menuOptions"></VolMenu>
        </el-scrollbar>
      </div>
    </div>
    <div class="vol-container">
      <div class="vol-header">
        <span class="header-text">支持前端、后台业务代码扩展的快速开发框架</span>
        <div class="header-info">
          <div class="h-link">
            <ul>
              <li
                v-for="(item,index) in links"
                :key="index"
                v-bind:class="{actived:selectId==item.id}"
              >
                <a href="javascript:void(0)" @click="to(item)">{{item.text}}</a>
              </li>
            </ul>
          </div>
          <div>
            <img class="user-header" :src="userImg" :onerror="errorImg" />
          </div>
          <div class="user">
            <span>{{userName}}</span>
            <br />
            <span>{{date}}</span>
            <!-- <span>星期五</span> -->
          </div>
          <div class="settings">
            <Icon :size="20" type="md-settings" @click="()=>{theme_moel=true;}" />
            <!-- <Icon type="md-paw" /> -->
          </div>
        </div>
      </div>
      <div class="vol-path">
        <ul class="header-navigation">
          <li
            :class="{active:item.id==selectId}"
            v-for="(item,navIndex) in navigation"
            :key="navIndex"
            @click="selectNav(item.id)"
          >
            {{item.name}}
            <Icon
              @click="removeNav(item.id)"
              v-if="navIndex!=0"
              class="icon-romve"
              type="md-close-circle"
              @click.stop
            />
          </li>
        </ul>
      </div>
      <div class="vol-main" id="vol-main">
        <el-scrollbar style="height:100%;">
          <!-- <transition name="fade" mode="in-out">  -->
          <transition enter-active-class="animated fadeInLeftBig">
            <keep-alive>
              <router-view></router-view>
            </keep-alive>
          </transition>
        </el-scrollbar>
      </div>
    </div>
    <!-- 2020.04.02增加换皮肤功能 -->
    <Drawer class="theme-selector" title="选择皮肤颜色" :closable="false" v-model="theme_moel">
      <div
        @click="changeThen(item.name)"
        class="item"
        v-for="(item,index) in theme_color"
        :key="index"
        :style="{background:item.color}"
      ></div>
    </Drawer>
  </div>
</template>
<script>
import VolMenu from "@/components/basic/VolMenu.vue";
let imgUrl = require("@/assets/imgs/log.png");
var $vueIndex;
export default {
  data() {
    return {
      theme_moel: false,
      theme_color: [
        { name: "dark", color: "#272929" },
        { name: "blue", color: "rgb(45, 140, 240)" },
        { name: "red", color: "rgb(237, 64, 20)" },
        { name: "orange", color: "rgb(255, 153, 0)" },
        { name: "white", color: "#fff" },
        { name: "green", color: "rgb(25, 190, 107)" }
      ], //2020.04.02增加换皮肤功能
      errorImg: 'this.src="' + require("@/assets/imgs/error-img.png") + '"',
      userName: "--",
      userImg: "",
      selectId: 0,
      navigation: [{ name: "首页", id: 0, path: "/home" }],
      log: imgUrl,
      date: "",
      theme: "blue",
      links: [
        { text: "框架文档", path: "/document", id: -2 },
        { text: "GitHub", path: "#", id: -3 },
        { text: "个人中心", path: "/UserInfo", id: -1 },
        { text: "安全退出", path: "/login", id: -4 }
      ],
      menuOptions: []
    };
  },
  components: {
    VolMenu
  },
  created() {
    let theme = localStorage.getItem("vol_theme");
    if (theme) {
      this.theme = theme;
    }
    let userInfo = this.$store.getters.getUserInfo();
    this.userName = userInfo.userName;
    this.userImg = this.base.getImgSrc(userInfo.img, this.http.ipAddress);
    $vueIndex = this;
    this.showTime();
    setInterval(function() {
      $vueIndex.showTime();
    }, 1000);
    this.http.ajax({
      url: "api/menu/getTreeMenu",
      json: true,
      success: function(data) {
        data.forEach(d => {
          if (!d.icon) d.icon = "ios-aperture";
          d.path = (d.url || "").replace("/Manager", "");
          d.to = (d.url || "").replace("/Manager", "");
        });
        $vueIndex.$store.dispatch("setPermission", data);
        $vueIndex.menuOptions = data;
      },
      type: "get",
      async: false
    });

    //当前刷新是不是首页
    if (this.$route.path != this.navigation[0].path) {
      let linkNow = this.links.find(x => {
        return x.path == this.$route.path;
      });
      if (linkNow) {
        this.selectId = linkNow.id;
        return;
      }
      let item = this.menuOptions.find(x => {
        return x.path == this.$route.path;
      });
      if (item == undefined) {
        return (this.selectId = 0);
      }
      this.onSelect(item.id);
    }
  },
  methods: {
    changeThen(name) {
      if (this.theme != name) {
        this.theme = name;
      }
      localStorage.setItem("vol_theme", name);
    },
    to(item) {
      if (item.path == "#") {
        window.open("https://github.com/cq-panda/Vue.NetCore");
        return;
      }

      var hasId = this.navigation.find(function(x) {
        return x.id == item.id;
      });
      if (hasId && hasId.id == this.selectId) return;

      if (item.path == "/login") {
        this.$store.commit("clearUserInfo", "");
      } else {
        this.selectId = item.id;
        if (!hasId) {
          this.navigation.push({
            id: item.id,
            name: item.text,
            path: item.path
          });
        }
      }
      this.$router.push({
        path: item.path
      });
    },
    selectNav(id) {
      this.selectId = id;
      this.$router.push({
        path: this.getNavigation(id).path
      });
    },
    removeNav(id) {
      var _index = -1;
      this.navigation.forEach((item, index) => {
        if (item.id == id) {
          _index = index;
          return;
        }
      });
      if (_index == -1) {
        return this.$message("菜单关闭发生错误");
      }
      var navItem = this.navigation[_index - 1];
      this.selectId = navItem.id;
      this.navigation.splice(_index, 1);
      this.$router.push({
        path: navItem.path
      });
    },
    getNavigation(id) {
      return this.navigation.find(function(x) {
        return x.id == id;
      });
    },
    getSelectMenuName(id) {
      return this.menuOptions.find(function(x) {
        return x.id == id;
      });
    },
    onSelect(treeId) {
      if (treeId == this.selectId) return;
      var hasId = this.navigation.find(function(x) {
        return x.id == treeId;
      });
      if (hasId && hasId.id == this.selectId) return;
      console.log(treeId);
      var item = $vueIndex.getSelectMenuName(treeId);

      console.log(item);
      if (!hasId) {
        $vueIndex.navigation.push({
          id: treeId,
          name: item.name,
          path: item.path
        });
      }
      $vueIndex.selectId = treeId;
    },
    showTime() {
      var week = new Array(
        "星期一",
        "星期二",
        "星期三",
        "星期四",
        "星期五",
        "星期六",
        "星期日"
      );
      var date = new Date();
      var year = date.getFullYear();
      var month = date.getMonth() + 1;
      var day = date.getDate();
      var hour = date.getHours();
      var minutes = date.getMinutes();
      var second = date.getSeconds();
      this.date =
        year +
        "." +
        (month < 10 ? "0" + month : month) +
        "." +
        day +
        "" +
        " " +
        hour +
        ":" +
        minutes +
        ":" +
        (second < 10 ? "0" + second : second) +
        " " +
        (week[date.getDay() - 1] || "");
    },
    handleOpen(key, keyPath) {
      console.log(key, keyPath);
    },
    handleClose(key, keyPath) {
      console.log(key, keyPath);
    }
  },
  watch: {
    "$route.path": function(newVal, oldVal) {
      var navItem = this.getNavigation(this.selectId);
      console.log(navItem.name);
      // if (item.path != newVal) {
      //   //根据newVal获取当前路径的selectid
      // }
      console.log(newVal + "," + oldVal);
    }
    // ,
    // $route(to, from) {

    // }
  }
};
</script>

<style scoped>
body {
  height: 100%;
  width: 100%;
}
.vol-aside {
  height: 100%;
  position: absolute;
  width: 200px;
  float: left;
  overflow: hidden;
}
.vol-aside .tac {
  text-align: left;
}
.vol-aside .el-submenu .el-menu-item {
  max-width: 200px;
  min-width: 190px;
}
.vol-aside .header {
  text-align: center;
  position: absolute;
  height: 60px;
  width: 199px;
  position: relative;
  line-height: 60px;
  /* background-color: rgb(1, 5, 8); */
}
.vol-aside .vol-menu {
  position: absolute;
  width: 100%;
  top: 60px;
  bottom: 0;
  border-right: 1px solid #e3e3e3;
}
.vol-aside .vol-menu >>> .ivu-menu {
  text-align: left;
  width: 100% !important;
}
.vol-container {
  min-width: 800px;
  right: 0;
  display: inline-block;
  position: absolute;
  margin: 0;
  left: 199px;
  box-sizing: border-box;
  height: 100%;
}

.vol-container .vol-path {
  position: relative;
  width: 100%;
  display: inline-block;
  border-top: 1px solid #e4e4e4;
  border-bottom: 2px solid #eee;
  /* z-index: 1; */
}
.vol-container .vol-path span {
  position: relative;
  margin-right: 10px;
  color: #969696;
}
.vol-header {
  height: 60px;
  width: 100%;
  position: relative;
  /* line-height: 60px; */
  /* background-color: #272929; */
}
.vol-main {
  /* background: #ecebeb; */
  position: absolute;
  width: 100%;
  /* height: 100%; */
  bottom: 0;
  top: 92px;
  margin: 0;
  /* padding: 15px; */
  overflow: auto;
}
</style>

<style lang="less" scoped>
.header {
  padding: 5px;
}
.header img {
  height: 100%;
  margin-right: 25px;
}
.header-info {
  right: 20px;
  display: inline-block;
  position: absolute;
  height: 100%;
  /* width: 300px; */
  /* text-align: right; */
}
.header-info > div {
  float: left;
  height: 100%;
}
.user-header {
  height: 52px;
  width: 52px;
  border-radius: 50%;
  margin-right: 0px;
  top: 4px;
  position: relative;
  /* right: 35px; */
  border: 2px solid #dfdfdf;
  /* float: right; */
}
.header-text {
  vertical-align: middle;
  height: 100%;
  position: absolute;

  text-align: center;
  font-size: 15px;
  left: 21px;
  line-height: 60px;
  letter-spacing: 2px;
}
.vol-header .user {
  padding: 12px;
  position: relative;
  display: inline-block;
  height: 100%;
}
.vol-header .settings {
  padding-top: 10px;
  color: #d4d2d2;
}
.vol-header .user span {
  position: relative;
}
.header-info:hover {
  cursor: pointer;
}
.header-navigation {
  cursor: pointer;
    box-shadow: 3px 0px 6px #f6f7f7;
  border-bottom: 1px solid #eee;
  // border-top: 1px solid #eee;
  height: 32px;
  overflow: hidden;
  line-height: 32px;
  display: block;
  margin: 0;
  padding: 0;
  outline: 0;
  list-style: none;
  position: relative;
  z-index: 900;
  font-weight: initial;
}
.header-navigation li {
  position: relative;
  float: left;
  padding: 0 20px;
  min-width: 80px;
  border-right: 1px solid #eee;
}

.header-navigation li .icon-romve {
  top: 5px;
  position: absolute;
  /* margin-left: 5px; */
  right: 6px;
}
/* .header-navigation li:hover .icon-romve {
  display: block;
} */
.vol-header .user span:first-child {
  font-size: 15px;
  font-weight: bolder;
  /* letter-spacing: 3px; */
}

.h-link ul {
  height: 100%;
  display: inline-block;
}

.h-link li {
  height: 100%;
  list-style: none;
  float: left;
  padding: 20px 10px;
  position: relative;
  cursor: pointer;
  z-index: 3;
  /*transition: all .2s ease-in-out;*/
}

.h-link a {
  color: #b0b0b0;
  font-size: 15px;
  text-decoration: none;
  padding: 20px 20px;
}

img[src=""],
img:not([src]) {
  opacity: 0;
}
</style>

<style lang="less" scoped>
//黑色
.vol-theme-dark {
  .header-text {
    color: #dcdfe6;
  }
  .vol-header,
  .header {
    background-color: #272929;
  }
  .h-link a:hover {
    color: #b0b0b0;
  }
  .h-link a:hover {
    color: #dfdfdf;
  }
  .h-link .actived {
    border-bottom: 2px solid white;
  }
  .h-link .actived a {
    color: white !important;
  }
  .vol-header .user {
    color: #ececec;
  }
  .vol-header .settings {
    color: #d4d2d2;
  }
  .vol-aside .vol-menu {
    background: black;
  }
  .header-navigation li.active {
    background: #607d8b;
    /* border-bottom: 3px solid #03a9f4; */
    color: white;
    /* border-bottom: 2px solid #03a9f4; */
  }
  .header-navigation li:hover {
    cursor: pointer;
    background: #607d8b;
    color: white;
  }
}
</style>

<style  scoped>
/* 黑色左侧菜单 */
.vol-theme-dark .vol-aside .vol-menu >>> .ivu-menu {
  color: hsla(0, 0%, 100%, 0.7);
  background: black;
}
.vol-theme-dark
  .vol-aside
  .vol-menu
  >>> .ivu-menu-item-active.ivu-menu-item-selected {
  color: white !important;
  background: #0fa0e1 !important;
}
</style>



<style lang="less" scoped>
//红色
.vol-theme-red {
  .header-text {
    color: #dcdfe6;
  }
  .vol-header,
  .header {
    background-color: rgb(237, 64, 20);
  }

  .h-link a:hover {
    color: #dfdfdf;
  }
  .h-link .actived {
    border-bottom: 2px solid white;
  }

  .h-link a,
  .h-link .actived a,
  .vol-header .settings,
  .vol-header .user {
    color: white;
  }

  .header-navigation li.active,
  .header-navigation li:hover {
    background: rgb(237, 64, 20);
    color: #fff;
  }
  .vol-header .header-text {
    color: #fbfbfb;
  }
  .vol-aside .vol-menu {
    background: #515a6e;
  }
}
</style>



<style lang="less" scoped>
//橙色
.vol-theme-orange {
  .header-text {
    color: #dcdfe6;
  }
  .vol-header,
  .header {
    background-color: rgb(255, 153, 0);
  }

  .h-link a:hover {
    color: #dfdfdf;
  }
  .h-link .actived {
    border-bottom: 2px solid white;
  }

  .h-link a,
  .h-link .actived a,
  .vol-header .settings,
  .vol-header .user {
    color: white;
  }

  .header-navigation li.active,
  .header-navigation li:hover {
    background: rgb(255, 153, 0);
    color: #fff;
  }
  .vol-header .header-text {
    color: #fbfbfb;
  }
  .vol-aside .vol-menu {
    background: #515a6e;
  }
}
</style>


<style lang="less" scoped>
//绝色
.vol-theme-green {
  .header-text {
    color: #dcdfe6;
  }
  .vol-header,
  .header {
    background-color: rgb(25, 190, 107);
  }

  .h-link a:hover {
    color: #dfdfdf;
  }
  .h-link .actived {
    border-bottom: 2px solid white;
  }

  .h-link a,
  .h-link .actived a,
  .vol-header .settings,
  .vol-header .user {
    color: white;
  }

  .header-navigation li.active,
  .header-navigation li:hover {
    background: rgb(25, 190, 107);
    color: #fff;
  }
  .vol-header .header-text {
    color: #fbfbfb;
  }
  .vol-aside .vol-menu {
    background: #515a6e;
  }
}
</style>


<style lang="less" scoped>
//蓝色
.vol-theme-blue {
  .header-text {
    color: #dcdfe6;
  }
  .vol-header,
  .header {
    background-color: rgb(45, 140, 240);
  }

  .h-link a:hover {
    color: #dfdfdf;
  }
  .h-link .actived {
    border-bottom: 2px solid white;
  }

  .h-link a,
  .h-link .actived a,
  .vol-header .settings,
  .vol-header .user {
    color: white;
  }

  .header-navigation li.active,
  .header-navigation li:hover {
    background: #1a89ff;
    color: white;
  }
  .vol-header .header-text {
    color: #fbfbfb;
  }
  .vol-aside .vol-menu {
    background: #005bb8;
  }
}
</style>

<style  scoped>
.vol-theme-blue .vol-aside >>> .ivu-menu-submenu-title {
  background: #005bb8 !important;
}
.vol-theme-blue .vol-aside >>> .ivu-menu-opened {
  background: #006cdf !important;
  color: white;
}
</style>


<style lang="less" scoped>
//白色
.vol-theme-white {
  // .header-text {
  //   color: #dcdfe6;
  // }
  // .vol-header,
  // .header {
  //   background-color: rgb(45, 140, 240);
  // }

  .h-link a:hover {
    color: #dfdfdf;
  }
  // .h-link .actived {
  //   border-bottom: 2px solid white;
  // }

  // .h-link a,
  // .h-link .actived a,
  // .vol-header .settings,
  // .vol-header .user {
  //   color: white;
  // }


  .header-navigation {
    box-shadow: -7px 11px 10px -13px #678aa7;
    border-bottom: 1px solid #eee;
    border-top: 1px solid #eee;
    height: 32px;
    overflow: hidden;
    line-height: 32px;
    display: block;
    margin: 0;
    padding: 0;
    outline: 0;
    list-style: none;
    position: relative;
    z-index: 900;
    font-weight: 400;
  }
  .header-navigation li.active,
  .header-navigation li:hover {
    background: #1a89ff;
    color: white;
  }
  // .vol-header .header-text {
  //   color: #fbfbfb;
  // }
  .vol-aside .vol-menu {
    background: #515a6e;
  }
}
</style>
<style  scoped>

.vol-theme-white .vol-aside >>> .ivu-menu-submenu-title {
  background: #005bb8 !important;
}
.vol-theme-white .vol-aside >>> .ivu-menu-opened {
  background: #006cdf !important;
  color: white;
}
</style>

<style>
.el-scrollbar__wrap {
  overflow-x: hidden;
}
.el-scrollbar__bar.is-vertical {
  /*background: #e9e7e7;*/
  color: #ffffff;
  /*z-index不能超过1058，否则会影响弹出框select标签(2020-02-02)*/
  z-index: 999;
  right: 0;
  width: 6px;
}
*::-webkit-scrollbar {
  width: 10px;
  height: 7px;
  background-color: transparent;
}
*::-webkit-scrollbar-track {
  background-color: #f0f6ff;
}
*::-webkit-scrollbar-thumb {
  background-color: #73abb1;
  border-radius: 3px;
}
.scrollbarHide::-webkit-scrollbar {
  display: none;
}
.scrollbarShow::-webkit-scrollbar {
  display: block;
}
.ivu-select-dropdown::-webkit-scrollbar {
  width: 6px;
  height: 13px;
}
.ivu-select-dropdown::-webkit-scrollbar {
  width: 6px;
  height: 14px;
}
.ivu-select-dropdown::-webkit-scrollbar-thumb {
  border-radius: 5px;
  background: #dadac9;
}
.animated {
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
}
@-webkit-keyframes fadeInLeftBig {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(-50px, 0, 0);
    transform: translate3d(-50px, 0, 0);
  }
  to {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}
@keyframes fadeInLeftBig {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(-50px, 0, 0);
    transform: translate3d(-50px, 0, 0);
  }
  to {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}
.fadeInLeftBig {
  -webkit-animation-name: fadeInLeftBig;
  animation-name: fadeInLeftBig;
}
</style>
<style lang="less" scoped>
.theme-selector {
  .item {
    cursor: pointer;
    width: 230px;
    height: 80px;
    border-radius: 5px;
    margin-bottom: 17px;
    border: 1px solid #d4d2d2;
  }
}
</style>
