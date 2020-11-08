<template>
  <div class="middle-box">
    <div class="text-center animated fadeInDown">
      <h1>{{errorNumber}}</h1>
      <h3 class="font-bold">您访问的页面未找到！</h3>
      <slot></slot>
      <div class="back">
        <van-button type="primary"
                    @click="backHome"
                    plain
                    hairline
                    size="small">返回首页</van-button>
        <van-button type="info"
                    @click="back"
                    plain
                    hairline
                    style="margin-left:15px;"
                    size="small">返 回</van-button>
      </div>
    </div>
  </div>
</template>
  <script>
import { Button } from "vant";
export default {
  components: {
    "van-button": Button
  },
  props: {
    errorNumber: {
      type: String,
      default: "404"
    },
    text: {
      type: String,
      default: "唉...好像出了点问题~"
    }
  },
  methods: {
    backHome () {
      this.$router.push({
        path: "/"
      });
    },
    back () {
      this.$router.go(-1);
    }
  }
};
</script>
<style lang="less" scoped>
body {
  background-color: #fff;
}
.middle-box {
  text-align: center;
  padding-top: 80px;
  height: 100%;
  // background: #eee;
  h1 {
    font-size: 60px;
    margin: 0px;
    /* padding: 0px; */
  }
  .back {
    padding: 10px;
  }
  h3 {
    text-align: center;
    font-weight: 500;
  }
}
</style>

