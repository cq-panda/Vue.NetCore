<template>
  <div class="home-contianer">
    <div class="h-top">
      <div class="h-top-left" id="h-chart1">left</div>
      <div class="h-top-center">
        <div class="n-item">
          <div
            @click="open(item)"
            class="item"
            :class="'item' + (index + 1)"
            v-for="(item, index) in center"
            :key="index"
          >
            <i
              style="font-size: 30px; padding-bottom: 10px"
              :class="item.icon"
              :size="20"
            ></i>
            <br />
            {{ item.title }}
          </div>
        </div>
      </div>
      <div class="h-top-right task-table">
        <h3 class="h3">#框架Vue3.x版本变更说明</h3>
        <table border="0" cellspacing="0" cellpadding="0">
          <tr v-for="(row, index) in list" :key="index">
            <td>{{ index + 1 }}</td>
            <td>{{ row.desc }}</td>
          </tr>
        </table>
      </div>
    </div>
    <div class="h-chart">
      <div class="h-left-grid">
        <div class="item" v-for="(item, index) in grid" :key="index">
          <div class="icon-text">
            <i :class="item.icon"></i>
            <span class="name">{{ item.name }}</span>
          </div>
          <div class="desc">{{ item.desc }}</div>
        </div>
      </div>
      <div id="h-chart2"></div>
      <div id="h-chart3"></div>
    </div>
    <div style="display: flex;">
      <div
        id="h-chart4"
        style="height: 350px; background: white; flex: 1;padding-top:15px;"
      ></div>
      <div
        id="h-chart5"
        style="height: 350px; background: white; flex: 1;padding-top:15px;"
      ></div>
    </div>
  </div>
</template>
<script>
// import * as echarts from "echarts";
import "echarts/lib/chart/bar";
import "echarts/lib/chart/line";

import "echarts/lib/chart/pie";
import "echarts/lib/component/legend";
import "echarts/lib/component/title";
import "echarts/lib/component/grid";
let echarts = require("echarts/lib/echarts");
import { chart1, chart2, chart3, chart4 } from "./home/home-chart-options";
import { ref, onMounted, onUnmounted } from "vue";
var $chart2;
export default {
  components: {},
  data() {
    return {
      center: [
        {
          title: "GitHub",
          icon: "el-icon-set-up",
          url: "https://github.com/cq-panda/Vue.NetCore",
        },
        {
          title: "Gitee",
          icon: "el-icon-turn-off",
          url: "https://gitee.com/x_discoverer/Vue.NetCore",
        },
        {
          title: "框架Vue2版本",
          icon: "el-icon-reading",
          url: "http://v2.volcore.xyz",
        },

        {
          title: "框架文档",
          icon: "el-icon-document",
          url: "http://v2.volcore.xyz/document/guide",
        },

        {
          title: "大屏数据",
          icon: "el-icon-chat-line-round",
          url: "http://www.volcore.xyz/bigdata",
        },
        {
          title: "QQ群45221949",
          icon: "el-icon-chat-dot-round",
          url: "",
        },
      ],
      n: 90,
      value1: "1",
      applicants: {
        //报名信息
        day: 20, //本日
        week: 150, //本周
        month: 1200, //本月
        totalBoy: 800,
        totalGirl: 890,
        taotal: 1690,
      }, //报名信息
      list: [
        { desc: "框架2.x版本不支持直接升级Vue3版本(代码生成器已修改)" },
        { desc: "框架使用的Element Plus组件，移除了Iview组件的依赖" },
        { desc: "框架内部组件全部重新优化,相比2.x版本首屏大小减少60%" },
        { desc: "框架Vue2版本会继续维护,并与Vue3版本同步更新,请放心使用" },
        { desc: "框架Vue2、Vue3版本开发文档一致(差异部分文档会备注说明)" },
        //{ desc: "若正在使用Vue2框架版本继续使用即可;其他建议使用Vue3版本" },
        {
          desc: "vue2、vue3文档相同,开文档大部分文档仍然使用的vue2语法",
        },
        {
          desc: "自定义部分既可以使用vue3语法与可以使用vue3语法",
        },
        //(框架内部组件vue2/3语法都在使用),你也可以使用vue3语法
      ],
      grid: [
        {
          name: "用户管理",
          desc: "系统用户管理,注册用户3000000人。",
          icon: "el-icon-user",
        },
        {
          name: "站内消息",
          desc: "您有一条新的消息,请及时处理。",
          icon: "el-icon-chat-dot-round",
        },
        {
          name: "系统管理",
          desc: "这里放点什么,还没想好。",
          icon: "el-icon-setting",
        },
        {
          name: "还没想好",
          desc: "这里不知道应该放点什么或者写点什么。",
          icon: "el-icon-document",
        },
        {
          name: "语音导航",
          desc: "高德地图林志玲为您语音导航。",
          icon: "el-icon-microphone",
        },
        {
          name: "垃圾回收",
          desc: "删除过的数据在此处找回。。。。",
          icon: "el-icon-delete",
        },
      ],
    };
  },
  setup() {
    let open = (item) => {
      window.open(item.url, "_blank");
    };
    let interval;
    onMounted(() => {
      $chart = echarts.init(document.getElementById("h-chart1"));
      $chart.setOption(chart1);
      $chart2 = echarts.init(document.getElementById("h-chart2"));
      $chart2.setOption(chart2);

      // interval = setInterval(() => {
      //   chart2.xAxis[0].data.splice(0, 1);
      //   let lastYear =
      //     chart2.xAxis[0].data[chart2.xAxis[0].data.length - 1] * 1 + 1;
      //   chart2.xAxis[0].data.push(lastYear);

      //   chart2.series[0].data.splice(0, 1);
      //   chart2.series[0].data.push(~~(Math.random() * 1000));

      //   chart2.series[1].data.splice(0, 1);
      //   chart2.series[1].data.push(~~(Math.random() * 1000));
      //   $chart2.setOption(chart2);
      // }, 2000);

      $chart3 = echarts.init(document.getElementById("h-chart3"));
      $chart3.setOption(chart3);
      let $chart4 = echarts.init(document.getElementById("h-chart4"));
      $chart4.setOption(chart4);
      let $chart5 = echarts.init(document.getElementById("h-chart5"));
      $chart5.setOption(chart2);
    });
    onUnmounted(() => {
      interval && clearInterval(interval);
      if ($chart) {
        $chart.dispose();
        $chart2.dispose();
        $chart3.dispose();
      }
    });
    return { open };
  },
  destroyed() {
    $chart2 = null;
  },
};
var $chart, $chart2, $chart3;
// window.addEventListener("resize", function () {
//   $chart2.setOption(chart2);
// });
</script>
<style lang="less" scoped>
.home-contianer {
  padding: 6px;
  background: #eee;
  width: 100%;
  height: 100%;
  // max-width: 800px;
  // position: absolute;
  top: 0;
  right: 0;
  left: 0;
  margin: 0 auto;

  .h-top {
    display: flex;
    .h-top-left {
      height: 100%;
      width: 300px;
      background: white;
    }
    height: 300px;
  }
  .h-top > div {
    border: 1px solid #e8e7e7;
    border-radius: 5px;
    // margin: 6px;
  }
  .h-top-center {
    height: 100%;
    background: white;
    margin: 0 6px;
    display: flex;
    flex-direction: column;
    flex: 1;
    .item1 .num {
      padding-top: 28px;
    }
    .item2 .num {
      padding-bottom: 20px;
    }

    .n-item {
      width: 100%;
      height: 100%;
      text-align: center;
      cursor: pointer;
      // display: flex;
      .item {
        border-right: 1px solid #e5e5e5;
        width: 33.3333333%;
        float: left;
        height: 50%;
        border-bottom: 1px solid #e5e5e5;
        padding: 47px 0;
        font-size: 13px;
      }
      .item:hover {
        background: #f9f9f9;
        cursor: pointer;
      }
      .item:last-child {
        border-right: 0;
      }
      .item3,
      .item6 {
        border-right: 0;
      }
      .num {
        word-break: break-all;
        color: #282727;
        font-size: 30px;
        transition: transform 0.8s;
      }
      .num:hover {
        color: #55ce80;
        transform: scale(1.2);
      }
      .text {
        font-size: 13px;
        color: #777;
      }
    }
  }
  .h-top-right {
    // flex: 1;

    width: 400px;
    height: 100%;
    background: white;
  }
  .h3 {
    padding: 7px 15px;
    font-weight: 500;
    background: #fff;
    border-bottom: 1px dotted #d4d4d4;
  }
}
.task-table {
  table {
    width: 100%;
    .thead {
      font-weight: bold;
    }
    tr {
      cursor: pointer;
      td {
        border-bottom: 1px solid #f3f3f3;
        padding: 9px 8px;
        font-size: 12px;
      }
    }
    tr:hover {
      background: #eee;
    }
  }
}
.h-chart {
  height: 340px;
  margin: 6px 0px;
  display: flex;
  .h-left-grid {
    width: 300px;
    height: 100%;
    background: white;
    display: inline-block;
    .name {
      margin-left: 7px;
    }
    .item:hover {
      background: #f9f9f9;
      cursor: pointer;
    }
    .item {
      padding: 22px 14px;
      float: left;
      width: 50%;
      height: 33.33333%;
      border-bottom: 1px solid #eee;
      border-right: 1px solid #eee;
      i {
        font-size: 30px;
      }
      .desc {
        font-size: 12px;
        color: #c3c3c3;
        padding: 5px 0 0 4px;
        line-height: 1.5;
      }
    }
  }
}
#h-chart2 {
  border-radius: 3px;
  background: white;
  padding-top: 10px;
  height: 100%;
  width: 0;
  flex: 1;
  margin: 0 7px;
}
#h-chart3 {
  border-radius: 3px;
  padding: 10px 10px 0 10px;
  background: white;
  // padding-top: 10px;
  height: 100%;

  width: 400px;
}
</style>
 
