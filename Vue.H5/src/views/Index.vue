<template>
  <div class="vol-index">
    <div class="vol-index-title">
      <img src="@/assets/vue.jpg" />vol.vue-h5演示系统
    </div>
    <div class="vol-index-contanier">
      <swipe-index></swipe-index>
      <menu-index></menu-index>
    </div>
  </div>
</template>
<script>
import { Icon } from "vant";
import Swipe from "./index/Swipe";
import Menu from "./index/Menu";
export default {
  components: {
    "van-icon": Icon,
    "swipe-index":Swipe,
    "menu-index": Menu
  },
  data() {
    return {};
  },
  methods: {}
};
</script>
<style lang="less" scoped>
.vol-index-contanier {
  position: absolute;
  top: 51px;
  bottom: 65px;
  width: 100%;
  overflow: scroll;
}
.vol-index {
  height: 100%;
  background: #f9f9f9;
}
.vol-index-title {
  background: white;
  border-bottom: 1px solid #eee;
  line-height: 50px;
  height: 50px;
  padding-left: 1rem;
  letter-spacing: 1px;
  img {
    position: relative;
    height: 17px;
    top: 5px;
    margin-right: 0.5rem;
  }
}
</style>
