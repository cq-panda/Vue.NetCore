<template >
  <div style="height:100%;">
    <keep-alive>
      <router-view v-if="$route.meta&&$route.meta.keepAlive"></router-view>
    </keep-alive>
    <router-view v-if="!$route.meta||!$route.meta.keepAlive"></router-view>
    <div class="vol-tabbar">
      <van-tabbar v-model="navigate.active" @change="change">
        <van-tabbar-item v-for="(item,index) in menu" :key="index" :icon="item.icon">{{item.text}}</van-tabbar-item>
      </van-tabbar>
    </div>
  </div>
</template>
<script>
import { Tabbar, TabbarItem } from "vant";

export default {
  components: {
    "van-tabbar": Tabbar,
    "van-tabbar-item": TabbarItem
  },
  data() {
    return {
      navigate: {
        active: 0,
        path: []
      },
      menu: [
        { text: "首  页", icon: "home-o", path: "/index" },
        { text: "菜  单", icon: "coupon-o", path: "/menu" },
        { text: "社  圈", icon: "tv-o", path: "/community" },
        { text: "统  计", icon: "apps-o", path: "/stat" },
        { text: "我  的", icon: "user-circle-o", path: "/user" }
      ]
    };
  },
  methods: {
    change(index) {
      this.$router.push({ path: this.menu[index].path });
    }
  },
  created() {
    this.navigate.path = this.menu.map(x => {
      return x.path;
    });
    let index = this.navigate.path.indexOf(this.$route.path);
    if (index != -1) {
      this.navigate.active = index;
    }
    this.$store.getters.data().navigate = this.navigate;
  }
};
</script>
<style lang="less" scoped>
.vol-tabbar {
  position: absolute;
  bottom: 0;
  width: 100%;
}
</style>
