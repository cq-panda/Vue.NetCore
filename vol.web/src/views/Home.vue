<template>
  <div class="home-container">
    <el-scrollbar style="height: 100%">
      <div class="home-content">
        <div class="home-left">
          <div>
            <el-alert
              style="margin-bottom: 10px"
              class="alert-primary"
              :closable="false"
              title="框架前端及文档重构版本发布,兼容原有版本代码及jsx写法,放开自定义扩展组件限制,新版可任意选择vue2/3/typescript语法开发方式"
            ></el-alert>
          </div>
          <div class="home-list">
            <div class="list-item" v-for="(item, index) in list" :key="index">
              <div class="content">
                <div class="content-right">
                  <div class="name">
                    {{ item.name }}
                  </div>
                  <div class="data">
                    {{ (item.qty + '').replace(/\B(?=(\d{3})+(?!\d))/g, ',') }}
                  </div>
                </div>
                <div class="content-icon">
                  <img :src="item.icon" />
                </div>
              </div>
            </div>
          </div>

          <div class="home-list-chart">
            <div class="radio-group">
              <el-radio-group v-model="radioValue" size="small">
                <el-radio-button value="本月" label="本月" />
                <el-radio-button value="上月" label="上月" />
                <el-radio-button value="近三月" label="近三月" />
                <el-radio-button value="近半年" label="近半年" />
              </el-radio-group>
            </div>
            <div id="h-chart1" style="height: 250px; background: white; width: 100%"></div>
          </div>
          <div class="table" style="margin-top: ">
            <div class="title">
              <div class="txt">部门支出记录</div>
              <div class="radio-group-table">
                <el-radio-group v-model="radioValue2" size="small">
                  <el-radio-button value="本月" label="本月" />
                  <el-radio-button value="上月" label="上月" />
                  <el-radio-button value="近三月" label="近三月" />
                  <el-radio-button value="近半年" label="近半年" />
                </el-radio-group>
              </div>
            </div>

            <table>
              <thead>
                <tr>
                  <td style="width: 15px">#</td>
                  <td>部门</td>
                  <td>日期</td>
                  <td>收入</td>
                  <td>支出</td>
                  <td>消费</td>
                  <td>结余</td>
                  <td>备注</td>
                </tr>
              </thead>
              <tbody>
                <tr v-for="(row, index) in tableData" :key="index">
                  <td style="width: 15px">{{ index + 1 }}.</td>
                  <td style="width: 100px">{{ row.dept }}</td>
                  <td style="width: 100px">{{ row.date }}</td>
                  <td>{{ (row.income + '').replace(/\B(?=(\d{3})+(?!\d))/g, ',') }}</td>
                  <td>
                    {{ (row.expenditure + '').replace(/\B(?=(\d{3})+(?!\d))/g, ',') }}
                  </td>
                  <td>{{ (row.consum + '').replace(/\B(?=(\d{3})+(?!\d))/g, ',') }}</td>
                  <td>{{ (row.balance + '').replace(/\B(?=(\d{3})+(?!\d))/g, ',') }}</td>
                  <td style="width: 200px">{{ row.remark }}</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
        <div class="home-right">
          <div style="background: #fff; padding: 15px">
            <div class="title">
              <div class="txt">生产数量统计</div>
            </div>
            <div id="chart-pie" style="height: 300px"></div>
          </div>
          <div class="table">
            <div class="title">
              <div class="txt">站内消息</div>
            </div>

            <table style="font-size: 12px">
              <tobdy>
                <tr v-for="(item, index) in msg" :key="index">
                  <td>
                    <el-tag size="small" type="primary">消息</el-tag>
                    <!-- <div class="item-bg">资讯</div> -->
                  </td>
                  <td>{{ item.name }}</td>
                </tr>
              </tobdy>
            </table>
          </div>
        </div>
      </div>
      <br /><br /><br /><br />
    </el-scrollbar>
  </div>
</template>
<script setup>
import {
  defineComponent,
  ref,
  reactive,
  toRefs,
  getCurrentInstance,
  onMounted,
  onUnmounted
} from 'vue'
import * as echarts from 'echarts'

const msg = ref([
  { name: '健身房突然倒闭，会员们的钱该如何追回？' },
  { name: '智能家电频繁死机，技术瓶颈待突破？' },
  { name: '热门综艺抄袭争议不断，原创之路在何方？' },
  { name: '宠物食品质量堪忧，毛孩子的健康谁守护？' },
  { name: '航空公司超售机票，乘客权益如何保障？' },
  { name: '服装快时尚品牌的环保 “谎言” 被戳破？' },
  { name: '共享充电宝收费乱象，为何屡禁不止？' },
  { name: '新兴职业高薪背后，隐藏着哪些挑战？' },
  { name: '酒店卫生乱象又现，出门住宿该如何选？' },
  { name: '美妆博主推荐产品翻车，信任危机爆发？' },
  { name: '热门景点游客过度拥挤，管理困境如何解？' }
])

//图标库
const list = ref([
  {
    name: '本月入库数量',
    qty: 2200,
    icon: '/static/imgs/icon1.png'
  },
  {
    name: '本月出库数量',
    qty: 1400,
    icon: '/static//imgs/icon2.png'
  },
  {
    name: '累计入库数量',
    qty: 28000,
    icon: '/static//imgs/icon3.png'
  },
  {
    name: '累计出库数量',
    qty: 14000,
    icon: '/static//imgs/icon4.png'
  }
])
const radioValue = ref('本月')
const radioValue2 = ref('')

onMounted(() => {
  let $chart = echarts.init(document.getElementById('h-chart1'))
  console.log(getChartData())
  $chart.setOption(getChartData())
  let $pie = echarts.init(document.getElementById('chart-pie'))
  $pie.setOption(chartPie())
})

const { proxy } = getCurrentInstance()

let dateArr = new Array(10).fill(0).map((x, i) => {
  let date = proxy.base.getDate()
  return proxy.base.addDays(date, i * -1)
})

const tableData = reactive([])
tableData.push(
  ...dateArr.map((x) => {
    return {
      date: x,
      dept: '公共事业部',
      income: ~~(Math.random() * 100) + '00',
      expenditure: ~~(Math.random() * 100) + '00',
      consum: ~~(Math.random() * 100) + '00',
      balance: ~~(Math.random() * 100) + '00',
      remark: '这家伙很懒,没有说明信息...'
    }
  })
)

const getChartData = () => {
  return {
    title: {
      text: '出入库数量',
      textStyle: {
        fontSize: 16
      }
    },
    tooltip: {
      trigger: 'axis'
    },
    legend: {
      padding: 5,
      textStyle: {
        fontSize: 12
        // color: '#afe3ff'
      },
      itemHeight: 9,
      itemWidth: 12,
      icon: 'roundRect', // 'circle',
      data: ['入库', '出库']
    },
    xAxis: {
      show: true,
      axisTick: {
        show: false // 不显示坐标轴刻度线
      },
      axisLine: {
        show: false // 不显示坐标轴线
      },
      type: 'category',
      // boundaryGap: false,
      data: dateArr // ['05-17', '05-18', '05-19', '05-20', '05-21', '05-22', '05-23'],
    },
    grid: {
      left: 50,
      bottom: 20,
      top: 40,
      right: 50
    },
    yAxis: {
      splitNumber: 3,
      splitLine: { show: false },
      type: 'value'
    },
    series: [
      {
        name: '收入',
        type: 'bar',
        smooth: true,
        lineStyle: {
          // 阴影部分
          shadowOffsetX: 0, // 折线的X偏移
          shadowOffsetY: 6, // 折线的Y偏移
          shadowBlur: 8, // 折线模糊
          shadowColor: '#e3d6fd' //折线颜色
        },

        showSymbol: false,

        emphasis: {
          focus: 'series'
        },
        data: [
          330, 765, 456, 697, 23, 564, 400, 345, 478, 123, 45, 789, 231, 654, 98, 34, 56, 78, 192,
          321, 645, 700, 213, 546, 600, 312
        ]
      },
      {
        name: '支出',
        type: 'bar',
        smooth: true,
        lineStyle: {
          // 阴影部分
          shadowOffsetX: 0, // 折线的X偏移
          shadowOffsetY: 7, // 折线的Y偏移
          shadowBlur: 8, // 折线模糊
          shadowColor: '#9fceff' //折线颜色
        },

        itemStyle: {
          color: '#2196F3'
        },
        showSymbol: false,

        emphasis: {
          focus: 'series'
        },
        data: [
          200, 456, 789, 280, 800, 470, 213, 546, 98, 312, 432, 567, 891, 234, 561, 784, 325, 647,
          892, 135, 462, 781, 700, 236, 578, 899
        ]
      }
    ]
  }
}

const chartPie = () => {
  return {
    color: [
      '#7020ff',
      '#2EC7C9',
      '#c3a4ff',
      '#00d4f9',
      '#FF6384', // 亮粉色
      '#36A2EB', // 天蓝色
      '#FFCE56', // 亮黄色
      '#4BC0C0', // 青绿色
      '#9966FF', // 深紫色
      '#FF9F40', // 橙色
      '#00CC96', // 清新绿色
      '#E7717D', // 浅红色
      '#5D9CEC', // 淡蓝色
      '#F67280' // 淡粉色
    ],
    tooltip: {
      trigger: 'item'
    },
    title: {
      show: true,
      text: '合计',
      subtext: 3270,
      x: '50%',
      y: '30%',
      subtextStyle: {
        color: 'rgba(0,0,0,0.85)',
        fontSize: 25,
        fontWeight: '700'
      },
      textAlign: 'center'
    },
    grid: {
      left: 40,
      bottom: 20,
      top: 40,
      right: 10
    },
    legend: {
      icon: 'circle',
      itemWidth: 12,
      itemHeight: 12,
      orient: 'horizontal',
      data: null,
      bottom: 'bottom'
    },
    graphic: {
      type: 'text',
      left: 'center',
      top: 'center',
      style: {
        textAlign: 'center',
        fill: '#000',
        fontSize: 20
      }
    },
    series: [
      {
        type: 'pie',
        radius: ['45%', '60%'],
        center: ['50%', '40%'],
        avoidLabelOverlap: false,
        label: {
          show: true,
          position: 'outside'
        },
        emphasis: {
          label: {
            show: true,
            fontWeight: 'bold'
          }
        },
        labelLine: {
          show: true
        },
        data: [
          {
            value: 1000,
            name: '排产数量'
          },
          {
            value: 700,
            name: '计划数量'
          },
          {
            value: 450,
            name: '成品数量'
          },
          {
            value: 300,
            name: '报废数量'
          },
          {
            value: 820,
            name: '入库数量'
          },
          {
            value: 320,
            name: '调拨数量'
          },
          {
            value: 620,
            name: '待产数量'
          },
          {
            value: 370,
            name: '已产数量'
          }
        ]
      }
    ]
  }
}
</script>
<style lang="less" scoped>
.home-container {
  position: absolute;
  height: 100vh;
  width: 100%;
  background: #f3f7fb;
  padding-bottom: 15px;
}

.home-content {
  padding: 15px;
  display: flex;

  .home-left {
    flex: 1;
  }

  .home-right {
    width: 350px;
  }
}

.home-list {
  display: grid;
  -moz-column-gap: 12px;
  column-gap: 15px;
  grid-template-columns: repeat(4, auto);
}

.list-item {
  position: relative;
  cursor: pointer;
  margin-bottom: 15px;

  .content {
    position: relative;
    height: 90px;
    // padding-left: 40px;
    background: #ffffff;
    display: flex;
    align-items: center;
    transition: all 1.5s;
    border-radius: 5px;
    overflow: hidden;

    .content-right {
      color: #1d252f;
      padding: 0 15px;

      .el-icon-warning-outline {
        margin-right: 5px;
      }
    }

    .name {
      color: #7d7b7b;
      font-size: 14px;
      font-weight: 400;
      padding-bottom: 5px;
    }

    .data {
      font-size: 19px;
      font-family: Source Han Sans CN, sans-serif;
      color: #505050;
      font-weight: bold;
      letter-spacing: 1px;
    }
  }
}

.content-icon {
  flex: 1;
  display: flex;
  align-items: center;
  justify-content: flex-end;
  padding-right: 23px;
  padding-top: 8px;

  img {
    width: 40px;
    height: 40px;
    box-shadow: 5px 3px 5px 0px #ecf9ffed;
    border-radius: 11px;
  }
}

.home-list-chart {
  // margin: -12px 12px;
  background: #ffff;
  padding: 15px;
  display: flex;
  margin-bottom: 12px;
  position: relative;

  .radio-group {
    position: absolute;
    right: 10px;
    top: 10px;
    z-index: 999;
  }
}

.title {
  font-size: 14px;
  font-weight: bolder;
  display: flex;
  margin-bottom: 5px;
  .txt {
    flex: 1;
  }
}
.table {
  background: #ffff;
  font-size: 14px;
  padding: 15px;
  position: relative;

  table {
    width: 100%;
  }

  thead {
    font-weight: bolder;

    td {
      color: #101111 !important;
    }
  }

  tr {
    border-bottom: 1px solid #eee;
  }
  tr:nth-child(even) {
    background: #f4fcff;
  }
  td {
    padding: 9px 3px;
    font-size: 13px;
    color: #3d3c3c;
    cursor: pointer;
    border-bottom: 1px solid #f7f7f7;
  }
}

.home-right {
  margin-left: 15px;

  .item-bg {
    font-size: 12px;
    padding: 2px 4px;
    background: #daf3ff;
    border-radius: 3px;
    text-align: center;
    width: 36px;
    color: #339aed;
  }
}
</style>
