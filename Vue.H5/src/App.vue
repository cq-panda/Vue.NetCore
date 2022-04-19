<template>
  <div id="app"
       :class="{'u-app':uapp}">
    <!-- <keep-alive> -->
    <!-- <router-view v-if="$route.meta&&$route.meta.keepAlive" /> -->
    <router-view />
    <!-- </keep-alive> -->
    <!-- <router-view v-if="!$route.meta||!$route.meta.keepAlive" /> -->
    <loading v-if="$store.getters.isLoading()"></loading>
  </div>
</template>

<script>
import loading from "@/components/RouterLoading";
import { mapState } from "vuex";
export default {
  components: {
    loading,
  },
  name: "app",
  data () {
    return {
      uapp: false,
    };
  },
  created () {
    this.uapp = window.location.hash.indexOf("?uapp=1") != -1;
    document.getElementById("vue-loading").style.display = "none";
  },
};
</script>

<style>
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  /* text-align: center; */
  color: #2c3e50;
  height: 100%;
}
.u-app .van-nav-bar,
.u-app .vol-index-title {
  background: #11b5ff;
  padding-top: 20px;
}
.u-app .van-nav-bar > div {
  color: white !important;
}
.u-app .van-icon-arrow-left {
  color: white !important;
  margin-top: 20px;
}
.u-app .van-nav-bar__right .van-icon {
  color: white !important;
  margin-top: 20px;
}
.u-app .vol-index-title {
  padding-top: 25px;
  height: 56px !important;
  line-height: 0px !important;
}
.u-app .vol-index-contanier {
  top: 56px !important;
}
</style>

