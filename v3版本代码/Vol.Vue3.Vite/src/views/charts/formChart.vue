<template>
  <div class="c-container">
    <div class="item">
      <div class="left">
        <VolHeader icon="md-apps" text="柱状图" style="padding-left: 10px; margin-bottom: 5px"></VolHeader>
        <div id="barId" style="height: calc(100% - 45px)"></div>
      </div>
      <div class="right">
        <VolHeader icon="md-apps" text="基础表单" style="padding-left: 10px; margin-bottom: 20px"></VolHeader>
        <VolForm style="padding-right: 30px" :loadKey="true" :label-width="80" :formFields="formFields1"
          :formRules="formRules1"></VolForm>
      </div>
    </div>

    <div class="item">
      <div class="left">
        <VolHeader icon="md-apps" text="表单属性字段只读" style="padding-left: 10px; margin-bottom: 20px"></VolHeader>
        <VolForm style="padding-right: 30px" :loadKey="true" :formFields="formFields2"
          :formRules="formRules2"></VolForm>
      </div>
      <div class="right">
        <VolHeader icon="md-apps" text="饼状图表" style="padding-left: 10px"></VolHeader>
        <div id="pieId" style="height: calc(100% - 30px)" ></div>
      </div>
    </div>
  </div>
</template>
<script setup>
import VolHeader from '@/components/basic/VolHeader.vue';
import VolForm from '@/components/basic/VolForm.vue';
import * as echarts from 'echarts/core';
import { defineComponent, onMounted, onUnmounted } from 'vue';
import { BarChart, PieChart } from 'echarts/charts'

import { bar, pie } from './chartOptions';
import {
  formFields1,
  formRules1,
  formFields2,
  formRules2
} from './formOptions';

import {
  CanvasRenderer
} from 'echarts/renderers'

import {
  TitleComponent,
  TooltipComponent,
  LegendComponent,
  GridComponent,
} from 'echarts/components';

echarts.use([
  TitleComponent,
  TooltipComponent,
  LegendComponent,
  CanvasRenderer,
  GridComponent,
  BarChart,
  PieChart
])

defineComponent([VolForm, VolHeader])

let $bar, $pie;

onMounted(() => {
  $bar = echarts.init(document.getElementById('barId'));
  $pie = echarts.init(document.getElementById('pieId'));

  $bar.setOption(bar);
  $pie.setOption({
    ...pie, ...{
      legend: {
        top: 50,
        right: 80,
        orient: 'vertical',
      }
    }
  });
})

onUnmounted(() => {
  if($bar){
    $bar.dispose();
    $bar = null;
  }
  if($pie){
    $pie.dispose();
    $pie = null;
  }
})
</script>

<style lang="less" scoped>
.c-container {
  position: absolute;
  height: 100%;
  width: 100%;
  background: #f1f1f1;
  display: flex;
  flex-direction: column;
  padding: 3px;

  .item {
    flex: 1;
    height: 0;
    display: flex;

    >div {
      flex: 1;
      width: 0;
      // margin: 10px;
      background: #fff;
    }

    .left {
      margin: 4px;
    }

    .right {
      margin: 4px;
    }
  }
}
</style>
