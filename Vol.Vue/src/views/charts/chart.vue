<template>
  <div>
    <div class="m-charts">
      <Tabs class="m-tabs">
        <TabPane label="柱状图" icon="ios-aperture">
          <div :style="{height:heigth+'px'}" :id="bar"></div>
        </TabPane>
        <TabPane label="饼状图" icon="ios-apps">
          <div :style="{height:heigth+'px'}" :id="pie"></div>
        </TabPane>
        <TabPane class="tb-3" label="折线图" icon="md-apps">
          <div :style="{height:heigth+'px'}" :id="line"></div>
        </TabPane>
      </Tabs>
    </div>
  </div>
</template>
<script>
let echarts = require("echarts");
import options from './chartOptions'
export default {
  mounted() {
    let $bar = echarts.init(document.getElementById(this.bar));
    $bar.setOption(this.options.bar);
    let $pie = echarts.init(document.getElementById(this.pie));
    $pie.setOption(this.options.pie);
        let $line = echarts.init(document.getElementById(this.line));
    $line.setOption(this.options.line);
  },
  data() {
    return {
      bar: "b-" + ~~(Math.random(10000, 100000) * 100000),
      pie: "p-" + ~~(Math.random(10000, 100000) * 100000),
      line: "l-" + ~~(Math.random(10000, 100000) * 100000),
      heigth: document.documentElement.clientHeight - 190,
     options:options
    };
  }
};
</script>
<style lang="less" scoped>
.m-charts {
  background: #f1f1f1;
  padding: 20px;
  .m-tabs {
    background: white;
  }
}
</style>