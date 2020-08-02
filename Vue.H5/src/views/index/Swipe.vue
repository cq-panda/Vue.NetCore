<template>
  <van-swipe class="my-swipe" :autoplay="2000" indicator-color="white">
    <van-swipe-item>vol.vue-h5上线啦</van-swipe-item>
    <van-swipe-item>同样的代码生成(开发中)</van-swipe-item>
    <van-swipe-item>丰富的ui组件</van-swipe-item>
    <van-swipe-item>一套后台代码多端运行</van-swipe-item>
  </van-swipe>
</template>
<script>
import { Swipe, SwipeItem, Icon } from "vant";
export default {
  components: {
    "van-icon": Icon,
    "van-swipe": Swipe,
    "van-swipe-item": SwipeItem
  },
  data() {
    return {};
  },
  methods: {},
  created() {}
};
</script>
<style lang="less" scoped>
  .my-swipe .van-swipe-item {
    color: #fff;
    font-size: 20px;
    line-height: 150px;
    text-align: center;
    font-family:"Comic Sans MS", cursive, sans-serif;
    background-color: #39a9ed;
  }
</style>
