<template>
  <div class="m-chart">
    <div class="chart-t">
      <div style="height:400px;" :id="pie"></div>
      <div style="height:400px;" :id="cli"></div>
    </div>
    <br />
    <br />
    <br />
    <br />
  </div>
</template>
<script>
let echarts = require("echarts");
export default {
  data() {
    return {
      pie:'p-'+~~(Math.random(10000,100000)*100000),
      cli:'c-'+~~(Math.random(10000,100000)*100000),
      text: "测试。。。。。",
      value1: "1"
    };
  },
  created() {
    console.log("model-created");
  },
  mounted() {
    let myChart = echarts.init(document.getElementById(this.cli));
    // 绘制图表
    myChart.setOption({
      color: ["#3398DB"],
      title: {
        left: "center",
        text: "Vue从入门到放弃"
      },
      tooltip: {},
      xAxis: {
        data: ["商品", "数据", "订单", "消息", "标签", "异常", "审批", "取消"]
      },
      yAxis: {},
      series: [
        {
          name: "数量",
          type: "bar",
          data: [5, 20, 36, 10, 10, 20, 15, 22]
        }
      ]
    });
    let myPie = echarts.init(document.getElementById(this.pie));
    myPie.setOption({
      tooltip: {
        trigger: "item",
        formatter: "{a} <br/>{b}: {c} ({d}%)"
      },
      legend: {
        data: ["直接访问", "邮件营销", "联盟广告", "视频广告", "搜索引擎"]
      },
      series: [
        {
          name: "访问来源",
          type: "pie",
          radius: ["50%", "70%"],
          avoidLabelOverlap: false,
          label: {
            normal: {
              show: false,
              position: "center"
            },
            emphasis: {
              show: true,
              textStyle: {
                fontSize: "30",
                fontWeight: "bold"
              }
            }
          },
          labelLine: {
            normal: {
              show: false
            }
          },
          data: [
            { value: 335, name: "直接访问" },
            { value: 310, name: "邮件营销" },
            { value: 234, name: "联盟广告" },
            { value: 135, name: "视频广告" },
            { value: 1548, name: "搜索引擎" }
          ]
        }
      ]
    });
  }
};
</script>
<style scoped>
.m-chart {
  margin-top: 20px;
  background: white;
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