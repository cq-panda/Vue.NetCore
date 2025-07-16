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
<script setup>
import * as echarts from 'echarts/core';
import { bar, pie, line } from "./chartOptions";

import {
  BarChart,
  LineChart,
  PieChart
} from 'echarts/charts';

import {
  CanvasRenderer
} from 'echarts/renderers'

import {
  GridComponent,
  TitleComponent,
  TooltipComponent,
  ToolboxComponent,
  LegendComponent,
} from 'echarts/components';
import { ref, onMounted, onUnmounted } from 'vue';

echarts.use([
  GridComponent,
  TitleComponent,
  TooltipComponent,
  ToolboxComponent,
  LegendComponent,
  CanvasRenderer,
  BarChart,
  LineChart,
  PieChart
]);

let $bar;
let $pie;
let $line;

const name = "bar";
const heigth = ref(450);
const width = ref(1000);

onMounted(() => {
  heigth.value = document.documentElement.clientHeight - 190;
  width.value = document.documentElement.clientWidth - 240;

  $bar = echarts.init(document.getElementById("bar-0001"));
  $bar.setOption(bar);
})

onUnmounted(() => {
  $bar.dispose();
  $bar = null;

  $line?.dispose?.();
  $line = null;

  $pie?.dispose?.();
  $pie = null;
})

function tabClick(name) {
  if (name.props.name == "pie") {
    if (!$pie) {
      $pie = echarts.init(document.getElementById("pie-0001"));
      $pie.setOption(pie);
    }
  } else if (name.props.name == "line") {
    if (!$line) {
      $line = echarts.init(document.getElementById("line-0001"));
      $line.setOption(line);
    }
  }
}
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

.m-charts :deep(.el-tabs__content) {
  height: calc(100% - 45px);
}

.m-charts :deep(.el-tab-pane) {
  height: 100%;
}
</style>