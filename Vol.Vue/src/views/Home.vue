<template>
  <div class="home-contianer">
    <el-scrollbar style="height:100%;">
      <div style>
        <div data-v-542f4644 class="ivu-row" style="padding:15px;background: white;">
          <div
            v-for="item in topColor"
            :key="item.name"
            class="ivu-col ivu-col-span-6"
            style="padding-left: 8px; padding-right: 8px;"
          >
            <div data-v-542f4644 class="ivu-card" :style="{background:item.background}">
              <div class="icon-left">
                <Icon :type="item.icon" />
              </div>
              <div class="ivu-card-body">
                <div data-v-542f4644 class="demo-color-name">{{item.name}}</div>
                <div data-v-542f4644 class="demo-color-desc">{{item.desc}}</div>
              </div>
            </div>
          </div>
        </div>
        <div style="background:#fff;">
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
          name: "订单数",
          desc: "#205",
          background: "rgb(25, 190, 107)",
          icon: "ios-home"
        },
        {
          name: "支付数",
          desc: "#412",
          background: "rgb(45, 183, 245)",
          icon: "ios-help-buoy"
        },
        {
          name: "已取消",
          desc: "#200",
          background: "rgb(255, 153, 0)",
          icon: "md-ionic"
        },
        {
          name: "退货",
          desc: "#12",
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
  }
};
</script>
<style scoped>
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
  border-bottom: 2px dotted #eee;
  padding: 15px;
  margin-bottom: 15px;
}

.h5-desc {
  padding-top: 10px;
}
</style>
<style lang="less">
.charts {
  display: inline-block;
  width: 100%;
  margin-top: 20px;
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

