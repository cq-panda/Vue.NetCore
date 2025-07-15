<template>
  <div class="c-container">
    <div class="item">
      <div class="left">
        <VolHeader icon="md-apps" text="柱状图" style="padding-left: 10px; margin-bottom: 5px"></VolHeader>
        <div style="height: calc(100% - 45px)" ref="barRef"></div>
      </div>
      <div class="right">
        <VolHeader icon="md-apps" text="基础表单" style="padding-left: 10px; margin-bottom: 20px"></VolHeader>
        <VolForm style="padding-right: 30px" ref="myform1" :loadKey="true" :label-width="80" :formFields="formFields1"
          :formRules="formRules1"></VolForm>
      </div>
    </div>

    <div class="item">
      <div class="left">
        <VolHeader icon="md-apps" text="表单属性字段只读" style="padding-left: 10px; margin-bottom: 20px"></VolHeader>
        <VolForm style="padding-right: 30px" ref="myform1" :loadKey="true" :formFields="formFields2"
          :formRules="formRules2"></VolForm>
      </div>
      <div class="right">
        <VolHeader icon="md-apps" text="饼状图表" style="padding-left: 10px"></VolHeader>
        <div style="height: calc(100% - 30px)" ref="pieRef"></div>
      </div>
    </div>
  </div>
</template>
<script setup>
import VolHeader from '@/components/basic/VolHeader.vue';
import VolForm from '@/components/basic/VolForm.vue';
import * as echarts from 'echarts/core';
import { bar, pie } from './chartOptions';
import {
  formFields1,
  formRules1,
  formFields2,
  formRules2
} from './formOptions';
import { computed, defineComponent, onMounted, onUnmounted, useTemplateRef } from 'vue';
import { BarChart, PieChart } from 'echarts/charts'

import {
  TitleComponent,
  TooltipComponent,
  LegendComponent,
} from 'echarts/components';

echarts.use([
  TitleComponent,
  TooltipComponent,
  LegendComponent,
  BarChart,
  PieChart
])

defineComponent([VolForm, VolHeader])

const barRef = useTemplateRef('barRef');
const pieRef = useTemplateRef('pieRef');
let $bar, $pie;

onMounted(() => {
  $bar = echarts.init(barRef.value);
  $bar.setOption(bar);

  $pie = echarts.init(pieRef.value);
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
  $bar.dispose();
  $pie.dispose();
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
