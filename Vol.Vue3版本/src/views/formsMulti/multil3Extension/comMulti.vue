<template>
  <div class="m-chart">
    <div class="chart-t">
      <div style="height: 370px" :id="pie"></div>
      <div style="height: 370px" :id="cli"></div>
    </div>
  </div>
</template>
<script>
let echarts = require("echarts");
export default {
  data() {
    return {
      pie: "p-" + ~~(Math.random(10000, 100000) * 100000),
      cli: "c-" + ~~(Math.random(10000, 100000) * 100000),
      text: "测试。。。。。",
      value1: "1",
    };
  },
  created() {
    console.log("model-created");
  },
  mounted() {
    let myChart = echarts.init(document.getElementById(this.cli));
    // 绘制图表
    myChart.setOption({
      title: {
        text: "Vue3从入门到放弃",
        left: "center",
      },
      tooltip: {
        trigger: "item",
      },
      legend: {
        top: 100,
        orient: "vertical",
        right: "10",
      },
      series: [
        {
          name: "访问来源",
          type: "pie",
          radius: ["40%", "75%"],
          avoidLabelOverlap: false,
          itemStyle: {
            borderRadius: 10,
            borderColor: "#fff",
            borderWidth: 2,
          },
          label: {
            show: false,
            position: "center",
          },
          emphasis: {
            label: {
              show: true,
              fontSize: "40",
              fontWeight: "bold",
            },
          },
          labelLine: {
            show: false,
          },
          data: [
            { value: 1048, name: "搜索引擎" },
            { value: 735, name: "直接访问" },
            { value: 580, name: "邮件营销" },
            { value: 484, name: "联盟广告" },
            { value: 300, name: "视频广告" },
          ],
        },
      ],
    });

    let myPie = echarts.init(document.getElementById(this.pie));
    myPie.setOption({
      tooltip: {
        trigger: "axis",
        axisPointer: {
          // Use axis to trigger tooltip
          type: "shadow", // 'shadow' as default; can also be 'line' or 'shadow'
        },
      },
      legend: {
        data: [
          "Direct",
          "Mail Ad",
          "Affiliate Ad",
          "Video Ad",
          "Search Engine",
        ],
      },
      grid: {
        top: 30,
        left: "3%",
        right: "4%",
        bottom: 0,
        containLabel: true,
      },
      xAxis: {
        type: "value",
      },
      yAxis: {
        type: "category",
        data: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
      },
      series: [
        {
          name: "Direct",
          type: "bar",
          stack: "total",
          label: {
            show: true,
          },
          emphasis: {
            focus: "series",
          },
          data: [320, 302, 301, 334, 390, 330, 320],
        },
        {
          name: "Mail Ad",
          type: "bar",
          stack: "total",
          label: {
            show: true,
          },
          emphasis: {
            focus: "series",
          },
          data: [120, 132, 101, 134, 90, 230, 210],
        },
        {
          name: "Affiliate Ad",
          type: "bar",
          stack: "total",
          label: {
            show: true,
          },
          emphasis: {
            focus: "series",
          },
          data: [220, 182, 191, 234, 290, 330, 310],
        },
        {
          name: "Video Ad",
          type: "bar",
          stack: "total",
          label: {
            show: true,
          },
          emphasis: {
            focus: "series",
          },
          data: [150, 212, 201, 154, 190, 330, 410],
        },
      ],
    });
  },
};
</script>
<style scoped>
.m-chart {
  margin-top: 20px;
  background: white;
  border-top: 10px solid #eee;
}
.chart-t {
  display: flex;
}
.chart-t > div {
  padding: 10px;
  margin: 10px;
  flex: 1;
}
</style>