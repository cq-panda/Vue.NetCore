<template>
  <div class="vol-index">
    <div class="vol-index-title">
      <img src="@/assets/vue.jpg" />vol.vue-h5演示系统
    </div>

    <div class="vol-index-contanier">
      <swipe-index></swipe-index>
      <div class="v-success">
        <p>1、VOL.Core单表H5页面已完成，见菜单(表单CURD)</p>
        <p>2、后台代码不变，只需要按(表单CURD)复制修改即可</p>
      </div>
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
    "swipe-index": Swipe,
    "menu-index": Menu
  },
  data () {
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
<style lang="less" scoped>
.v-success {
  border: 1px solid #8ce6b0;
  background-color: #edfff3;
  position: relative;
  /* padding: 8px 48px 8px 16px; */
  border-radius: 4px;
  color: #515a6e;
  font-size: 14px;
  line-height: 12px;
  margin-bottom: 10px;
  padding: 0 10px;
  font-size: 12px;
  margin: 10px 0;
  color: #404b50;
  letter-spacing: 1px;
}
</style>