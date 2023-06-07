<template>
  <div id="nav"></div>
  <el-config-provider :locale="locale">
    <router-view />
  </el-config-provider>
</template>
<script>
import { ElConfigProvider } from "element-plus";
import zhCn from "element-plus/lib/locale/lang/zh-cn";
export default {
  name: "vol_app",
  components: {
    [ElConfigProvider.name]: ElConfigProvider, //添加组件
  },
  data() {
    return {
      locale: zhCn,
    };
  },
};
</script>
<style lang="stylus">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  height: 100%;
  width: 100%;
}

.el-alert--error.is-light {
  border: 1px solid #ffe0e0;
}

.el-alert--error.is-light {
  color: #f74444 !important;
}

.el-alert--warning.is-light {
  border: 1px solid #ffe6c1;
}

.el-alert--info.is-light {
  border: 1px solid #e6e5e5;
}

.el-alert--info .el-alert__description {
  color: #6b6b6b !important;
}

.el-alert--warning.is-light {
  background-color: #fdf6ec;
  color: #d68409 !important;
}

.el-alert--success.is-light {
  border: 1px solid #cdf7b8;
}

.el-alert--success.is-light .el-alert__description {
  color: #3baf02 !important;
}
</style>
