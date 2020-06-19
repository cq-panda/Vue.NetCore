<template>
  <div class="home-contianer">
    <el-scrollbar style="height:100%;">
      <div style>
        <div data-v-542f4644 class="ivu-row">
          <div v-for="item in topColor" :key="item.name" class="ivu-col ivu-col-span-6">
            <div class="item-name">
              {{item.name}}
              <Tooltip class="icon" placement="left-start">
                <Icon type="ios-information-circle-outline" />
                <div slot="content">
                  <p>{{item.name}}</p>
                </div>
              </Tooltip>
            </div>
            <div class="total">￥{{(item.total+'').replace(/(\d{1,3})(?=(\d{3})+(?:$|\.))/g, "$1,")}}</div>
            <div class="rate">
              <span>
                <span>环比{{item.down}}%</span>
                <Icon class="down" type="md-arrow-dropdown" />
              </span>
              <span>
                <span>同比{{item.up}}%</span>
                <Icon class="up" type="md-arrow-dropup" />
              </span>
            </div>
            <div class="bottom">平均增长趋势{{item.up}}%</div>
          </div>
        </div>
        <div class="charts-line">
          <div id="charts-line" style="height:350px;"></div>
        </div>
        <div style="background:#fff; margin: 0 13px;">
          <div class="h5-desc">
            <Divider>移动H5页面(此处是H5页面,可点击--功能未实现)</Divider>
          </div>
          <div class="home-app">
            <div class="list">
              <Cow></Cow>
            </div>
            <div class="list">
              <Community></Community>
            </div>

            <div class="list">
              <Question></Question>
            </div>
          </div>
        </div>
        <div class="charts">
          <div id="charts" style="height:360px;padding-bottom:0;" class="left"></div>
          <div class="right">
            <div class="title">活跃用户榜</div>

            <div class="user-item">
              <div v-for="(item,index) in cell" :key="index" class="cell">
                <div class="primary">
                  <span :class="{top3:index<3,badge:index>=3}" class="badge-count">{{index+1}}</span>
                  <Avatar :src="item.img" />
                  <span class="name">{{item.name}}</span>
                  <span class="desc">{{item.desc}}</span>
                </div>

                <div>{{item.number}}</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </el-scrollbar>
  </div>
</template>
<script>
import Community from "@/../src/components/Community/index.vue";
import Cow from "@/../src/components/Community/cow.vue";
import Question from "@/../src/components/Community/question.vue";
var echarts = require("echarts");

export default {
  components: { Community: Community, Cow: Cow, Question: Question },
  data() {
    return {
      n: 90,
      cell: [
        {
          name: "小姐李好白",
          img:
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/u%3D1407034680%2C1803900872%26fm%3D26%26gp%3D0.jpg",
          number: "342,766",
          desc: "趁着年轻你需要多受一些苦。不然....",
          slider: 90
        },
        {
          name: "梦醒时分",
          // img: require("@/assets/imgs/h5/02.jpg"),
          img:
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/u%3D2546115535%2C3321343280%26fm%3D26%26gp%3D0.jpg",
          number: "438,12",
          desc: "人没钱不如鬼,汤没盐不如水,你会慢慢发现...",
          slider: 70
        },
        {
          name: "生末净旦你",
          img: require("@/assets/imgs/h5/03.jpg"),
          number: "12,764",
          desc: "我不能给你幸福，但可以给你舒服！",
          slider: 45
        },
        {
          name: "大爷",
          img:
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/u%3D2030158350%2C58383224%26fm%3D26%26gp%3D0.jpg",
          number: "89,44",
          desc: "师太！你就从了老衲吧！",
          slider: 20
        },
        {
          name: "哈哈....",
          img:
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/u%3D538930594%2C714478555%26fm%3D26%26gp%3D0.jpg",
          number: "12,03",
          desc: "我以为我颓废，原来我报废了！",
          slider: 5
        }
      ],
      topColor: [
        {
          name: "订单金额",
          desc: "#205",
          background: "rgb(25, 190, 107)",
          total: 670000,
          down: -10,
          up: 60,
          icon: "ios-home"
        },
        {
          name: "支付金额",
          desc: "#412",
          total: 540000,
          down: -15,
          up: 45,
          background: "rgb(45, 183, 245)",
          icon: "ios-help-buoy"
        },
        {
          name: "取消金额",
          desc: "#200",
          total: 872500,
          down: -18,
          up: 70,
          background: "rgb(255, 153, 0)",
          icon: "md-ionic"
        },
        {
          name: "退货金额",
          total: 253500,
          down: -25,
          up: 45,
          background: "rgb(237, 64, 20)",
          icon: "ios-navigate"
        }
      ],
      value1: "1"
    };
  },
  mounted() {
    var myChart = echarts.init(document.getElementById("charts"));
    // 绘制图表
    myChart.setOption({
      color: ["#3398DB"],
      title: {
        left: "center",
        text: "QQ交流群：还没想好..."
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
    var $charts_line = echarts.init(document.getElementById("charts-line"));
    $charts_line.setOption({
    title: {
      text: '日销售订单统计'
    },
    tooltip: {
      trigger: 'axis',
      axisPointer: {
        type: 'cross',
        label: {
          backgroundColor: '#6a7985'
        }
      }
    },

    color: ['#ffab6f', '#09b916', '#83cddc'], //图例颜色
    legend: {
      icon: "roundRect",
       data:['销售订单', '退货订单', '折扣订单']
    },
    toolbox: {
      feature: {

      }
    },
    grid: {
      left: '3%',
      right: '4%',
      bottom: '3%',
      containLabel: true
    },
    xAxis: [
      {
        type: 'category',
        boundaryGap: false,
        data: ['2020.06.15', '2020.06.16', '2020.06.17',
        '2020.06.18', '2020.06.19', '2020.06.20', '2020.06.21','2020.06.22']
      }
    ],
    yAxis: [
      {
        type: 'value'
      }
    ],
    series: [
       {
         name: '销售订单',
         type: 'line',
         smooth: true,
         lineStyle: {
           color: "#45d4ba",
           width: 1
         }, //线条的样式
         areaStyle: {
           color: new
             echarts.graphic.LinearGradient(0, 0, 0, 1, [{
               offset: 0,
               color: '#83cddc'
             }, {
               offset: 1,
               color: '#bfdffbb5'
             }])
         },
         data: [5, 22, 150, 54, 1, 230, 4,1]
       },
       {
         name: '退货订单',
         type: 'line',

         smooth: true,
         lineStyle: {
           color: "#04a710",
           width: 1
         }, //
         areaStyle: {
           color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
             offset: 0,
             color: '#0cbf22'
           }, {
             offset: 1,
             color: '#b8f7d1b5'
           }])
         },
         data: [10, 150, 1, 250,
           20, 100, 10,150]
       },
       {
         name: '折扣订单',
         type: 'line',

         lineStyle: {
           color:
             "#0864c3",
           width: 1
         }, //线条的样式
         smooth: true,
         areaStyle: {
           color: new
             echarts.graphic.LinearGradient(0, 0, 0, 1, [{
               offset: 0,
               color: '#29d7ff'
             }, {
               offset: 1,
               color: '#34ccef85'
             }])
         },
         data: [100, 2, 260, 1, 200, 30, 101,40]
       }
    ]
});
  }
};
</script>
<style lang="less" scoped>
.home-contianer {
  background: #efefef;
  width: 100%;
  height: 100%;
  /* padding: 20px; */
}
.home-app {
  display: inline-block;
  /* display: -webkit-flex;
  display: flex; */
  padding: 15px;
  padding-top: 5px;
}
.home-app > div {
  float: left;
  width: 33.33333%;
  padding-left: 8px;
  padding-right: 8px;
}
.ivu-card-body {
  text-align: center;
  padding: 25px 13px;
  padding-left: 80px;
}
.demo-color-name {
  color: #fff;
  font-size: 16px;
}
.demo-color-desc {
  color: #fff;
  opacity: 0.7;
}
.ivu-card {
  position: relative;
}
.ivu-card .icon-left {
  border-right: 1px solid;
  padding: 10px 24px;
  height: 100%;
  position: absolute;
  font-size: 50px;
  color: white;
}
.ivu-row {
  display: flex;
  border-bottom: 2px dotted #eee;
  padding: 0px 5px;
  .ivu-col {
    border-radius: 4px;
    background: white;
    flex: 1;
    margin: 13px 8px;
    padding: 20px 20px;
    padding-bottom: 15px;
  }
  .total {
    word-break: break-all;
    color: #282727;
    font-size: 30px;
    padding-bottom: 12px;
    font-family: -apple-system, BlinkMacSystemFont, Segoe UI, PingFang SC,
      Hiragino Sans GB, Microsoft YaHei, Helvetica Neue, Helvetica, Arial,
      sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol;
  }
  .item-name {
    position: relative;
    .icon {
      position: absolute;
      right: 0;
      top: -1px;
    }
  }
  .item-name,
  .rate,
  .bottom {
    color: #5f5f5f;
    font-size: 14px;
  }
  .rate {
    border-bottom: 1px solid #e6e6e6;
    padding-bottom: 10px;
  }
  .bottom {
    padding-top: 8px;
  }
  .down {
    color: #10d310;
  }
  .up {
    color: red;
  }
}

.h5-desc {
  padding-top: 10px;
}
</style>
<style lang="less">
.charts-line {
  margin: 0px 13px 13px 13px;
  background: white;
  padding-top: 10px;
}
.charts {
  margin: 25px 13px;
  display: inline-block;
  width: 100%;
  // padding: 0px 24px;
  .left {
    padding: 25px;
    background: white;
    height: 360px;
    width: 49%;
    float: left;
    margin-right: 1%;
    background: white;
  }
  .right {
    padding: 25px 45px;
    background: white;
    height: 360px;
    width: 49%;
    float: left;
    margin-left: 1%;
    .badge-count {
      padding: 3px 7px;
      position: relative;
      border: 1px solid #eee;
      border-radius: 50%;

      margin-right: 11px;
    }
    .badge {
      background: #e2e2e2;
      color: #3a3535;
    }
    .top3 {
      background: #2db7f5;
      color: white;
    }
    .cell {
      position: relative;
      display: flex;
      padding: 10px 0;
      border-bottom: 1px dotted #eee;
    }
    .primary {
      flex: 1;
    }
    .title {
      font-size: 16px;
      padding-bottom: 6px;
      border-bottom: 1px solid #eee;
      margin-bottom: 11px;
    }
    .name {
      font-size: 15px;
      position: relative;
      top: 5px;
      color: #303133;
      left: 12px;
    }
    .desc {
      margin-left: 27px;
      font-size: 12px;
      color: #b3b3b3;
      position: relative;
      top: 5px;
    }
  }
}
</style>

