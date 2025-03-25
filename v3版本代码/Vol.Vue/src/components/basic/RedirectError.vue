<template>
  <div class="middle-box">
    <div class="text-center animated fadeInDown">
      <h1>{{errorNumber}}</h1>
      <h3 class="font-bold">页面未找到！</h3>
      <slot></slot>
      <div class="error-desc">{{text}}</div>
      <div class="back">
        <Button type="success" @click="backHome" icon="md-arrow-round-back">返回首页</Button>
      </div>
    </div>
  </div>
</template>
  <script>
import { Script } from "vm";
export default {
  props:{
    errorNumber:{
      type:String,
      default:'500'
    },
    text:{
      type:String,
      default:'唉...好像出了点问题~'
    }
  },
  methods: {
    backHome: function() {
      this.$router.push({
        path: '/home'
      });
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
    font-size: 140px;
    font-weight: 100;
  }
  .back {
    padding: 10px;
  }
}
</style>

