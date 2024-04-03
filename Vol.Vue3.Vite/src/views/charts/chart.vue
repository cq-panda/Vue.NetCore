<template>
  <div class="m-charts">
    <el-tabs
      v-model="name"
      @tab-click="tabClick"
      type="border-card"
      style="height: 100%; width: 100%; box-shadow: none"
    >
      <el-tab-pane name="bar">
        <template #label>
          <span><i class="el-icon-date"></i> 柱状图 </span>
        </template>
        <div
          :style="{ height: heigth + 'px', width: width + 'px' }"
          id="bar-0001"
        ></div>
      </el-tab-pane>
      <el-tab-pane name="pie" :lazy="false" label="消息中心">
        <template #label>
          <span><i class="el-icon-date"></i> 饼状图 </span>
        </template>
        <div
          :style="{ height: heigth + 'px', width: width + 'px' }"
          id="pie-0001"
        ></div>
      </el-tab-pane>
      <el-tab-pane name="line" :lazy="false" label="角色管理">
        <template #label>
          <span><i class="el-icon-date"></i> 折线图 </span>
        </template>
        <div
          :style="{ height: heigth + 'px', width: width + 'px' }"
          id="line-0001"
        ></div>
      </el-tab-pane>
    </el-tabs>
  </div>
</template>
<script>
let echarts = require("echarts");
import options from "./chartOptions";
let $bar;
let $pie;
let $line;
export default {
  mounted() {
    $bar = echarts.init(document.getElementById("bar-0001"));
    $bar.setOption(this.options.bar);
  },
  created() {
    this.heigth = document.documentElement.clientHeight - 190;
    this.width = document.documentElement.clientWidth - 240;
  },
  methods: {
    tabClick(name) {
      if (name.props.name == "pie") {
        if (!$pie) {
          $pie = echarts.init(document.getElementById("pie-0001"));
          $pie.setOption(this.options.pie);

        }
      } else if (name.props.name == "line") {
        if (!$line) {
          $line = echarts.init(document.getElementById("line-0001"));
          $line.setOption(this.options.line);
         
        }
      }
    },
  },
  data() {
    return {
      name: "bar",
      heigth: 450,
      width: 1000,
      options: options,
    };
  },
};
</script>
<style lang="less" scoped>
.m-charts {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: #f1f1f1;
  margin: auto 0;
  padding: 12px;
  .m-tabs {
    background: white;
  }
}
.m-charts ::v-deep(.el-tabs__content) {
  height: calc(100% - 45px);
}
.m-charts ::v-deep(.el-tab-pane) {
  height: 100%;
}
</style>