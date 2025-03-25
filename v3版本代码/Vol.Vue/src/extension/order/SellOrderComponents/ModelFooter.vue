<template>
  <div style="background: white;
    padding: 10px 30px;">
    <Divider>你也可在未尾添加组件等业务</Divider>
    <div class="chart-t">
      <div style="height:400px;" id="chart-pie"></div>
      <div style="height:400px;" id="chart-cloumns"></div>
    </div>
    <Alert type="success" show-icon>
      其他属性
      <template slot="desc">
        如果需要获整个ViewGrid的Vue对象,请在方法中使用 this.$emit("parentCall", $vue => {})
        <Button type="success" @click="getUpdateRow">点击获取当前弹出框的数据</Button>
      </template>
    </Alert>

    <br />
    <br />
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
      text: "测试。。。。。",
      value1: "1"
    };
  },
  methods: {
    getUpdateRow() {
      this.$emit("parentCall", $vue => {
        let message = "当前弹出框为";
        if ($vue.currentAction == $vue.const.ADD) {
          message += "新建状态;";
        } else {
          message += "编辑状态;";
        }
        message += "表单数据是：" + JSON.stringify($vue.editFormFileds);
        this.$Message.error(message);
      });
    }
  },
  created() {
    console.log("model-created");
  },
  mounted() {
    let myChart = echarts.init(document.getElementById("chart-cloumns"));
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
    let myPie = echarts.init(document.getElementById("chart-pie"));
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
.chart-t {
  display: flex;
}
.chart-t > div {
  padding: 10px;
  margin: 10px;
  flex: 1;
}
</style>