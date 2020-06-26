
<template>
  <div id="big-data-container" class="big-data-container">
    <div class="head">
      <h1>大屏数据统计分析显示</h1>
    </div>
    <div class="data-container">
      <div class="data-left">
        <div class="data-left-item">
          <div class="title">商品销量分类</div>
          <div id="chart-left-1" style="height: calc(100% - 30px);"></div>
          <div class="data-foot-line"></div>
        </div>
        <div class="data-left-item">
          <div class="title">本月商品销量</div>
          <div id="chart-left-3" style="height: calc(100% - 30px);"></div>

          <div class="data-foot-line"></div>
        </div>
        <div class="data-left-item">
          <div class="title">7日订单销量</div>
          <div id="chart-left-2" style="height: calc(100% - 30px);"></div>
          <div class="data-foot-line"></div>
        </div>
      </div>
      <div class="data-center">
        <!-- <div class="title">中间位置</div> -->
        <div class="center-top-num">
          <div class="item">
            <div class="text">累计销量</div>
            <div class="num">220,000</div>
          </div>
          <div class="item">
            <div class="text">累计销售金额</div>
            <div class="num">58,000,000</div>
          </div>
          <div class="item">
            <div class="text">购买用户人数</div>
            <div class="num">15,000</div>
          </div>
          <div class="data-foot-line"></div>
        </div>
        <div class="center-top">
          <div class="title">用户活跃信息-1</div>
          <iview-circle :size="200" style="padding: 8px 0;"></iview-circle>
          <div class="data-foot-line"></div>
        </div>
        <div class="title">订单销售统计</div>
        <div id="chart-center" class="chart-center"></div>
      </div>
      <div class="data-right">
        <div class="data-right-item">
          <div class="title">销售情况走势</div>
          <div id="chart-right-1" style="height: calc(100% - 30px);"></div>
          <div class="data-foot-line"></div>
        </div>
        <div class="data-right-item">
          <div class="title">用户活跃信息</div>
          <iview-circle></iview-circle>
          <div class="data-foot-line"></div>
        </div>
        <div class="data-right-item right-3">
          <div class="title">商品销售排行</div>
          <div id="chart-right-3" class="right-item">
            <div class="item">
              <div class="top">排名</div>
              <div class="pro-name">商品名称</div>
              <div class="num">销量</div>
              <div class="num">销售金额</div>
            </div>
            <div class="item">
              <div class="top top-1">
                <span>1</span>
              </div>
              <div class="pro-name">卡帝乐鳄鱼</div>
              <div class="num">2,200</div>
              <div class="num">360,00</div>
            </div>
            <div class="item">
              <div class="top top-2">
                <span>2</span>
              </div>
              <div class="pro-name">春夏男T恤</div>
              <div class="num">1,700</div>
              <div class="num">24,500</div>
            </div>
            <div class="item">
              <div class="top top-3">
                <span>3</span>
              </div>
              <div class="pro-name">男女同款休闲鞋</div>
              <div class="num">1,120</div>
              <div class="num">12,700</div>
            </div>
          </div>
          <div class="boxfoot"></div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
var echarts = require("echarts");
import {
  chartLeft1,
  chartLeft2,
  chartLeft3,
  chartRight1
} from "./bigdata/chart-options";
import IviewCircle from "./bigdata/IviewCircle";
import "./bigdata/layout.less";
export default {
  components: {
    "iview-circle": IviewCircle
  },
  data() {
    return {};
  },
  mounted() {
    var $chartLeft1 = echarts.init(document.getElementById("chart-left-1"));
    $chartLeft1.setOption(chartLeft1);

    var $chartLeft2 = echarts.init(document.getElementById("chart-left-2"));
    $chartLeft2.setOption(chartLeft2);

    var $chartLeft3 = echarts.init(document.getElementById("chart-left-3"));
    $chartLeft3.setOption(chartLeft3);

    var $chartCenter = echarts.init(document.getElementById("chart-center"));
    $chartCenter.setOption(chartRight1);

    var $chartRight1 = echarts.init(document.getElementById("chart-right-1"));
    $chartRight1.setOption(chartRight1);
  }
};
</script>
<style scoped>
/* .chart-center {
  display: flex;
  border: 1px solid #0000ff;
  height: 200px;
  flex-direction: column;
  margin-top: 20px;
}
.chart-center .item {
  text-align: center;
  border: 1px solid #00c1b3;
  flex: 1;
} */
.right-3 {
  display: flex;
  flex-direction: column;
  /* margin-top: 20px; */
}

.right-3 .right-item {
  flex: 1;
  display: flex;
  flex-direction: column;
}

.right-3 .item {
  text-align: left;
  border-bottom: 1px solid #549069;
  flex: 1;
  display: flex;
  padding: 5px 10px;
  margin: 0 10px;
  font-size: 14px;
  line-height: 30px;
}

.right-3 .item:last-child {
  border-bottom: 0;
}

.right-3 .item > div {
  color: white;
}

.right-3 .top {
  width: 60px;
  position: relative;
}

.right-3 .top span {
  position: absolute;
  width: 20px;
  line-height: 20px;
  top: 5px;
  text-align: center;
  border-radius: 5px;
}

.right-3 .top-1 span {
  background: #e80d0d;
}

.right-3 .top-2 span {
  background: #00c935;
}

.right-3 .top-3 span {
  background: #0083f4;
}

.right-3 .num {
  width: 88px;
}

.right-3 .pro-name {
  flex: 1;
}
</style>




