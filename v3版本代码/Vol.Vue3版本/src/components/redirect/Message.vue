<template>
  <div class="middle-box">
    <div class="text-center animated fadeInDown">
      <i style="font-size: 50px;color: #67c23a;margin-top:40px;" class="el-icon-circle-check"></i>
      <div style="font-size: 20px;margin-top: 10px;" class="error-desc">{{ text }}</div>
    </div>
  </div>
</template>
  <script>
export default {
  props: {
    text: {
      type: String,
      default: "操作成功！",
    },
  },
  methods: {
  },
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

