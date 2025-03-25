<template>
    <div class="list-container">
      <div style="height: 100%; display: flex; flex-direction: column">
        <div class="search-content">
          <label>开始日期：</label>
          <el-date-picker
            style="width: 150px"
            v-model="searchValue.beginDate"
            placeholder="开始日期"
            value-format="YYYY-MM-DD"
          ></el-date-picker>
          <label class="mg-item">结束日期：</label>
          <el-date-picker
            style="width: 150px"
            v-model="searchValue.endDate"
            value-format="YYYY-MM-DD"
            placeholder="结束日期"
          ></el-date-picker>
          <el-button type="primary" plain icon="Search" @click="initData(true)">搜索</el-button>
        </div>
        <div class="demo-list">
          <div
            class="list-item"
            @click="itemClick(item, index)"
            v-for="(item, index) in tabs"
            :key="index"
          >
            <div class="content">
              <div class="content-right">
                <div class="name">
                  {{ item.name }}
                </div>
                <div class="data">
                  <span class="rmb">¥</span>
                  {{ ((item.totalPrice || 0) + '').replace(/\B(?=(\d{3})+(?!\d))/g, ',') }}
                </div>
              </div>
              <div class="f-icon">
                <el-icon>
                  <MessageBox />
                </el-icon>
              </div>
            </div>
            <div class="content-bottom">
              <div class="num-01">数量：{{ item.qty }}</div>
              <div class="num-01">金额：{{ item.totalPrice }}</div>
            </div>
          </div>
        </div>
  
        <div class="charts fx">
          <!-- <div class="fx fx-1 fx-column">
            <div class="charts-title">订单统计</div>
            <div ref="chartsRef" style="flex: 1"></div>
          </div> -->
          <div class="fx fx-1 fx-column">
            <div class="charts-title">生产订单</div>
            <div ref="chartsRef2" style="flex: 1"></div>
          </div>
        </div>
      </div>
    </div>
  </template>
  <script setup>
  import * as echarts from 'echarts'
  import chart1Options from './ProductionStateOptions.js'
  import { ref, reactive, onMounted,   getCurrentInstance } from 'vue'
  
  const emit = defineEmits(['parentCall'])
  
  const { proxy } = getCurrentInstance()
  
  //默认选中项
  const activeName = ref(-1)
  const tabs = reactive([
    // { name: '全部订单', icon: '', orderType: -1, count: 0, totalPrice: 0, qty: 0 },
    { name: '销售订单', icon: '', orderType: 1, count: 2500, totalPrice: 50000, qty: 2000 },
    { name: '采购订单', icon: '', orderType: 2, count: 3000, totalPrice: 90000, qty: 3000 },
    { name: '退货订单', icon: '', orderType: 3, count: 1500, totalPrice: 15000, qty: 1000 },
    { name: '促销订单', icon: '', orderType: 4, count: 4500, totalPrice: 13500, qty: 4500 },
    { name: '预约订单', icon: '', orderType: 5, count: 5500, totalPrice: 22000, qty: 5500 }
  ])
  
  const searchValue = reactive({
    beginDate: null,
    endDate: null
  })
  
  const dateNow = proxy.base.getDate()
  searchValue.beginDate = proxy.base.addDays(dateNow, -90)
  searchValue.endDate = dateNow
  
  //获取接口统计信息
  const initData = (showMsg) => {
   
      initChart()
  }
  const chartsRef = ref(null)
  const chartsRef2 = ref(null)
  
  
  const initChart = () => {
    //生成图表数据
    const options2 = chart1Options()
    // options.title.text = '合计金额'
    // options.title.subtext = total
    // options.series[0].data = data
    const $chart2 = echarts.init(chartsRef2.value)
    $chart2.setOption(options2)
  
  
    
  }
  
  onMounted(() => {
    initData()
  })
  
  defineExpose({
    tabs,
    initData
  })
  </script>
  
  <style lang="less" scoped>
  .list-container {
    position: absolute;
    height: 100%;
    width: 100%;
    background: #f3f7fb;
  }
  .demo-list {
    padding: 15px 15px 0 15px;
    display: grid;
    -moz-column-gap: 12px;
    column-gap: 12px;
    //上面汇总显示的数量
    grid-template-columns: repeat(5, auto);
  }
  
  .list-item {
    position: relative;
    cursor: pointer;
    display: flex;
    flex-direction: column;
    justify-content: center;
    background: #ffffff;
    border-radius: 5px;
    height: 110px;
    overflow: hidden;
    border: 1px solid #eee;
    box-shadow: 4px 5px 10px 1px #f7f7f7;
    .content {
      position: relative;
  
      display: flex;
      align-items: center;
      .content-right {
        color: #1d252f;
        padding: 0 20px;
  
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
    .f-icon {
      position: absolute;
      right: 10px;
      bottom: 2px;
  
      i {
        font-size: 44px;
        color: #f5f5f5;
      }
    }
  }
  .content-bottom {
    display: flex;
    margin-top: 6px;
    padding: 10px 20px 0;
    border-top: 1px solid #eee;
    .num-01 {
      display: flex;
      font-size: 13px;
      color: #837e7e;
      flex: 1;
    }
  }
  .rmb {
    color: #686161;
    font-size: 14px;
  }
  .search-content {
    margin: 15px 15px 0 15px;
    background: #fff;
    padding: 13px;
    label {
      font-size: 14px;
      color: #6a6565;
    }
    .mg-item,
    button {
      margin-left: 20px;
    }
  }
  .charts {
    margin: 15px;
    background: #fff;
    flex: 1;
    display: flex;
    // flex-direction: column;
    .charts-title {
      font-weight: bolder;
      padding: 15px 15px 0;
    }
  }
  .fx{
    display: flex;
    height: 100%;
  }
  .fx-1{
    flex:1;
  }
  .fx-column{
    flex-direction: column;
  }
  </style>
  