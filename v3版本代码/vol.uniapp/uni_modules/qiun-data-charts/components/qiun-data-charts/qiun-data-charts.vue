<!-- 
 * qiun-data-charts 秋云高性能跨全端图表组件 v2.3.7-20220118
 * Copyright (c) 2021 QIUN® 秋云 https://www.ucharts.cn All rights reserved.
 * Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
 * 复制使用请保留本段注释，感谢支持开源！
 * 为方便更多开发者使用，如有更好的建议请提交码云 Pull Requests ！
 *
 * uCharts®官方网站
 * https://www.uCharts.cn
 * 
 * 开源地址:
 * https://gitee.com/uCharts/uCharts
 * 
 * uni-app插件市场地址：
 * http://ext.dcloud.net.cn/plugin?id=271
 * 
 -->
<template>
  <view class="chartsview" :id="'ChartBoxId'+cid">
    <view v-if="mixinDatacomLoading">
      <!-- 自定义加载状态，请改这里 -->
      <qiun-loading :loadingType="loadingType" />
    </view>
    <view v-if="mixinDatacomErrorMessage && errorShow" @tap="reloading">
      <!-- 自定义错误提示，请改这里 -->
      <qiun-error :errorMessage="errorMessage" />
    </view>
    <!-- APP和H5采用renderjs渲染图表 -->
    <!-- #ifdef APP-VUE || H5 -->
    <block v-if="echarts">
      <view
        :style="{ background: background }"
        style="width: 100%;height: 100%;"
        :data-directory="directory"
        :id="'EC'+cid" 
        :prop="echartsOpts" 
        :change:prop="rdcharts.ecinit" 
        :resize="echartsResize"
        :change:resize="rdcharts.ecresize"
        v-show="showchart"
      />
    </block>
    <block v-else>
      <view
        v-on:tap="rdcharts.tap"
        v-on:mousemove="rdcharts.mouseMove"
        v-on:mousedown="rdcharts.mouseDown"
        v-on:mouseup="rdcharts.mouseUp"
        v-on:touchstart="rdcharts.touchStart"
        v-on:touchmove="rdcharts.touchMove"
        v-on:touchend="rdcharts.touchEnd"
        :id="'UC'+cid"
        :prop="uchartsOpts"
        :change:prop="rdcharts.ucinit"
      >
        <canvas
          :id="cid"
          :canvasId="cid"
          :style="{ width: cWidth + 'px', height: cHeight + 'px', background: background }"
          :disable-scroll="disableScroll"
          @error="_error"
          v-show="showchart"
        />
      </view>
    </block>
    <!-- #endif -->
    <!-- 支付宝小程序 -->
    <!-- #ifdef MP-ALIPAY -->
    <block v-if="ontouch">
      <canvas
        :id="cid"
        :canvasId="cid"
        :width="cWidth * pixel"
        :height="cHeight * pixel"
        :style="{ width: cWidth + 'px', height: cHeight + 'px', background: background }"
        :disable-scroll="disScroll"
        @tap="_tap"
        @touchstart="_touchStart"
        @touchmove="_touchMove"
        @touchend="_touchEnd"
        @error="_error"
        v-show="showchart"
      />
    </block>
    <block v-if="!ontouch">
      <canvas
        :id="cid"
        :canvasId="cid"
        :width="cWidth * pixel"
        :height="cHeight * pixel"
        :style="{ width: cWidth + 'px', height: cHeight + 'px', background: background }"
        :disable-scroll="disScroll"
        @tap="_tap"
        @error="_error"
        v-show="showchart"
      />
    </block>
    <!-- #endif -->
    <!-- 其他小程序通过vue渲染图表 -->
    <!-- #ifdef MP-360 || MP-BAIDU || MP-QQ || MP-TOUTIAO || MP-WEIXIN -->
    <block v-if="type2d">
      <view v-if="ontouch" @tap="_tap">
        <canvas
          :id="cid"
          :canvasId="cid"
          :style="{ width: cWidth + 'px', height: cHeight + 'px', background: background }"
          type="2d"
          :disable-scroll="disScroll"
          @touchstart="_touchStart"
          @touchmove="_touchMove"
          @touchend="_touchEnd"
          @error="_error"
          v-show="showchart"
        />
      </view>
      <view v-if="!ontouch" @tap="_tap">
        <canvas
          :id="cid"
          :canvasId="cid"
          :style="{ width: cWidth + 'px', height: cHeight + 'px', background: background }"
          type="2d"
          :disable-scroll="disScroll"
          @error="_error"
          v-show="showchart"
        />
      </view>
    </block>
    <block v-if="!type2d">
      <view v-if="ontouch" @tap="_tap">
        <canvas
          :id="cid"
          :canvasId="cid"
          :style="{ width: cWidth + 'px', height: cHeight + 'px', background: background }"
          @touchstart="_touchStart"
          @touchmove="_touchMove"
          @touchend="_touchEnd"
          :disable-scroll="disScroll"
          @error="_error"
          v-if="showchart"
        />
      </view>
      <view v-if="!ontouch" >
        <canvas
          :id="cid"
          :canvasId="cid"
          :style="{ width: cWidth + 'px', height: cHeight + 'px', background: background }"
          :disable-scroll="disScroll"
          @tap="_tap"
          @error="_error"
          v-if="showchart"
        />
      </view>
    </block>
    <!-- #endif -->
  </view>
</template>

<script>
import uCharts from '../../js_sdk/u-charts/u-charts.js';
import cfu from '../../js_sdk/u-charts/config-ucharts.js';
// #ifdef APP-VUE || H5
import cfe from '../../js_sdk/u-charts/config-echarts.js';
// #endif

function deepCloneAssign(origin = {}, ...args) {
  for (let i in args) {
    for (let key in args[i]) {
      if (args[i].hasOwnProperty(key)) {
        origin[key] = args[i][key] && typeof args[i][key] === 'object' ? deepCloneAssign(Array.isArray(args[i][key]) ? [] : {}, origin[key], args[i][key]) : args[i][key];
      }
    }
  }
  return origin;
}

function formatterAssign(args,formatter) {
  for (let key in args) {
    if(args[key] !== null && typeof args[key] === 'object'){
      formatterAssign(args[key],formatter)
    }else if(key === 'format' && typeof args[key] === 'string'){
      args['formatter'] = formatter[args[key]] ? formatter[args[key]] : undefined;
    }
  }
  return args;
}

// 时间转换函数，为了匹配uniClinetDB读取出的时间与categories不同
function getFormatDate(date) {
	var seperator = "-";
	var year = date.getFullYear();
	var month = date.getMonth() + 1;
	var strDate = date.getDate();
	if (month >= 1 && month <= 9) {
			month = "0" + month;
	}
	if (strDate >= 0 && strDate <= 9) {
			strDate = "0" + strDate;
	}
	var currentdate = year + seperator + month + seperator + strDate;
	return currentdate;
}

var lastMoveTime = null;
/**
 * 防抖
 *
 * @param { Function } fn 要执行的方法
 * @param { Number } wait  防抖多少毫秒
 *
 * 在 vue 中使用（注意：不能使用箭头函数，否则this指向不对，并且不能再次封装如：
 * move(){  // 错误调用方式
 *   debounce(function () {
 *   console.log(this.title);
 * }, 1000)}）;
 * 应该直接使用：// 正确调用方式
 * move: debounce(function () {
 *   console.log(this.title);
 * }, 1000)
 */
function debounce(fn, wait) {
  let timer = false;
  return function() {
    clearTimeout(timer);
    timer && clearTimeout(timer);
    timer = setTimeout(() => {
      timer = false;
      fn.apply(this, arguments); // 把参数传进去
    }, wait);
  };
}

export default {
  name: 'qiun-data-charts',
  mixins: [uniCloud.mixinDatacom],
  props: {
    type: {
      type: String,
      default: null
    },
    canvasId: {
      type: String,
      default: 'uchartsid'
    },
    canvas2d: {
      type: Boolean,
      default: false
    },
    background: {
      type: String,
      default: 'rgba(0,0,0,0)'
    },
    animation: {
      type: Boolean,
      default: true
    },
    chartData: {
      type: Object,
      default() {
        return {
          categories: [],
          series: []
        };
      }
    },
    opts: {
      type: Object,
      default() {
        return {};
      }
    },
    eopts: {
      type: Object,
      default() {
        return {};
      }
    },
    loadingType: {
      type: Number,
      default: 2
    },
    errorShow: {
      type: Boolean,
      default: true
    },
    errorReload: {
      type: Boolean,
      default: true
    },
    errorMessage: {
      type: String,
      default: null
    },
    inScrollView: {
      type: Boolean,
      default: false
    },
    reshow: {
      type: Boolean,
      default: false
    },
    reload: {
      type: Boolean,
      default: false
    },
    disableScroll: {
      type: Boolean,
      default: false
    },
    ontap: {
      type: Boolean,
      default: true
    },
    ontouch: {
      type: Boolean,
      default: false
    },
    onmouse: {
      type: Boolean,
      default: true
    },
    onmovetip: {
      type: Boolean,
      default: false
    },
    echartsH5: {
      type: Boolean,
      default: false
    },
    echartsApp: {
      type: Boolean,
      default: false
    },
    tooltipShow: {
      type: Boolean,
      default: true
    },
    tooltipFormat: {
      type: String,
      default: undefined
    },
    tooltipCustom: {
      type: Object,
      default: undefined
    },
    startDate: {
      type: String,
      default: undefined
    },
    endDate: {
      type: String,
      default: undefined
    },
    textEnum: {
      type: Array,
      default () {
        return []
      }
    },
    groupEnum: {
      type: Array,
      default () {
        return []
      }
    },
    pageScrollTop: {
      type: Number,
      default: 0
    },
    directory: {
      type: String,
      default: '/'
    },
    tapLegend: {
      type: Boolean,
      default: true
    },
    menus: {
      type: Array,
      default () {
        return []
      }
    }
  },
  data() {
    return {
      cid: 'uchartsid',
      inWx: false,
      inAli: false,
      inTt: false,
      inBd: false,
      inH5: false,
      inApp: false,
      inWin: false,
      type2d: true,
      disScroll: false,
      openmouse: false,
      pixel: 1,
      cWidth: 375,
      cHeight: 250,
      showchart: false,
      echarts: false,
      echartsResize:false,
      uchartsOpts: {},
      echartsOpts: {},
      drawData:{},
      lastDrawTime:null,
    };
  },
  created(){
    this.cid = this.canvasId
    if (this.canvasId == 'uchartsid' || this.canvasId == '') {
      let t = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'
      let len = t.length
      let id = ''
      for (let i = 0; i < 32; i++) {
        id += t.charAt(Math.floor(Math.random() * len))
      }
      this.cid = id
    }
    const systemInfo = uni.getSystemInfoSync()
    if(systemInfo.platform === 'windows' || systemInfo.platform === 'mac'){
      this.inWin = true;
    }
    // #ifdef MP-WEIXIN
    this.inWx = true;
    if (this.canvas2d === false || systemInfo.platform === 'windows' || systemInfo.platform === 'mac') {
      this.type2d = false;
    }else{
      this.pixel = systemInfo.pixelRatio;
      if (this.canvasId === 'uchartsid' || this.canvasId == '') {
        console.log('[uCharts]:开启canvas2d模式，必须指定canvasId，否则会出现偶尔获取不到dom节点的问题！');
      }
    }
    // #endif
    //非微信小程序端强制关闭canvas2d模式
    // #ifndef MP-WEIXIN
    this.type2d = false;
    // #endif
    // #ifdef MP-ALIPAY
    this.inAli = true;
    this.pixel = systemInfo.pixelRatio;
    // #endif
    // #ifdef MP-BAIDU
    this.inBd = true;
    // #endif
    // #ifdef MP-TOUTIAO
    this.inTt = true;
    // #endif
    this.disScroll = this.disableScroll;
  },
  mounted() {
    // #ifdef APP-VUE
    this.inApp = true;
    if (this.echartsApp === true) {
      this.echarts = true;
      this.openmouse = false;
    }
    // #endif
    // #ifdef APP-NVUE
    this.inApp = true;
    this.mixinDatacomLoading = false
    this.mixinDatacomErrorMessage = "暂不支持NVUE"
    // #endif
    // #ifdef H5
    this.inH5 = true;
    if(this.inWin === true){
      this.openmouse = this.onmouse;
    }
    if (this.echartsH5 === true) {
      this.echarts = true;
    }
    // #endif
    this.$nextTick(()=>{
      this.beforeInit();
    })
    // #ifndef MP-ALIPAY || MP-BAIDU || MP-TOUTIAO || APP-VUE
    const time = this.inH5 ? 500 : 200;
    const _this = this;
    uni.onWindowResize(
      debounce(function(res) {
        if (_this.mixinDatacomLoading == true) {
          return;
        }
        let errmsg = _this.mixinDatacomErrorMessage;
        if (errmsg !== null && errmsg !== 'null' && errmsg !== '') {
          return;
        }
        if (_this.echarts) {
          _this.echartsResize = !_this.echartsResize;
        } else {
          _this.resizeHandler();
        }
      }, time)
    );
    // #endif
  },
  destroyed(){
    if(this.echarts === true){
      delete cfe.option[this.cid]
      delete cfe.instance[this.cid]
    }else{
      delete cfu.option[this.cid]
      delete cfu.instance[this.cid]
    }
    // #ifndef MP-ALIPAY || MP-BAIDU || MP-TOUTIAO
    uni.offWindowResize(()=>{})
    // #endif
  },
  watch: {
    chartDataProps: {
      handler(val, oldval) {
        if (typeof val === 'object') {
          if (JSON.stringify(val) !== JSON.stringify(oldval)) {
            if (val.series && val.series.length > 0) {
              this.beforeInit();
            }else{
              this.mixinDatacomLoading = true;
              this._clearChart();
              this.showchart = false;
              this.mixinDatacomErrorMessage = null;
            }
          }
        } else {
          this.mixinDatacomLoading = false;
          this._clearChart();
          this.showchart = false;
          this.mixinDatacomErrorMessage = '参数错误：chartData数据类型错误';
        }
      },
      immediate: false,
      deep: true
    },
    localdata:{
      handler(val, oldval) {
        if (JSON.stringify(val) !== JSON.stringify(oldval)) {
          if (val.length > 0) {
            this.beforeInit();
          }else{
            this.mixinDatacomLoading = true;
            this._clearChart();
            this.showchart = false;
            this.mixinDatacomErrorMessage = null;
          }
        }
      },
      immediate: false,
      deep: true
    },
    optsProps: {
      handler(val, oldval) {
        if (typeof val === 'object') {
          if (JSON.stringify(val) !== JSON.stringify(oldval) && this.echarts === false) {
            this.checkData(this.drawData);
          }
        } else {
          this.mixinDatacomLoading = false;
          this._clearChart();
          this.showchart = false;
          this.mixinDatacomErrorMessage = '参数错误：opts数据类型错误';
        }
      },
      immediate: false,
      deep: true
    },
    eoptsProps: {
      handler(val, oldval) {
        if (typeof val === 'object') {
          if (JSON.stringify(val) !== JSON.stringify(oldval) && this.echarts === true) {
            this.checkData(this.drawData);
          }
        } else {
          this.mixinDatacomLoading = false;
          this.showchart = false;
          this.mixinDatacomErrorMessage = '参数错误：eopts数据类型错误';
        }
      },
      immediate: false,
      deep: true
    },
    reshow(val, oldval) {
      if (val === true && this.mixinDatacomLoading === false) {
        setTimeout(() => {
          this.mixinDatacomErrorMessage = null;
          this.echartsResize = !this.echartsResize;
          this.checkData(this.drawData);
        }, 200);
      }
    },
    reload(val, oldval) {
      if (val === true) {
        this.showchart = false;
        this.mixinDatacomErrorMessage = null;
        this.reloading();
      }
    },
    mixinDatacomErrorMessage(val, oldval) {
      if (val) {
        this.emitMsg({name: 'error', params: {type:"error", errorShow: this.errorShow, msg: val, id: this.cid}});
        if(this.errorShow){
          console.log('[秋云图表组件]' + val);
        }
      }
    },
    errorMessage(val, oldval) {
      if (val && this.errorShow && val !== null && val !== 'null' && val !== '') {
        this.showchart = false;
        this.mixinDatacomLoading = false;
        this.mixinDatacomErrorMessage = val;
      } else {
        this.showchart = false;
        this.mixinDatacomErrorMessage = null;
        this.reloading();
      }
    }
  },
  computed: {
    optsProps() {
      return JSON.parse(JSON.stringify(this.opts));
    },
    eoptsProps() {
      return JSON.parse(JSON.stringify(this.eopts));
    },
    chartDataProps() {
      return JSON.parse(JSON.stringify(this.chartData));
    },
  },
  methods: {
    beforeInit(){
      this.mixinDatacomErrorMessage = null;
      if (typeof this.chartData === 'object' && this.chartData != null && this.chartData.series !== undefined && this.chartData.series.length > 0) {
        //拷贝一下chartData，为了opts变更后统一数据来源
        this.drawData = deepCloneAssign({}, this.chartData);
        this.mixinDatacomLoading = false;
        this.showchart = true;
        this.checkData(this.chartData);
      }else if(this.localdata.length>0){
        this.mixinDatacomLoading = false;
        this.showchart = true;
        this.localdataInit(this.localdata);
      }else if(this.collection !== ''){
        this.mixinDatacomLoading = false;
        this.getCloudData();
      }else{
        this.mixinDatacomLoading = true;
      }
    },
    localdataInit(resdata){
      //替换enum类型为正确的描述
      if(this.groupEnum.length>0){
        for (let i = 0; i < resdata.length; i++) {
          for (let j = 0; j < this.groupEnum.length; j++) {
            if(resdata[i].group === this.groupEnum[j].value){
              resdata[i].group = this.groupEnum[j].text
            }
          }
        }
      }
      if(this.textEnum.length>0){
        for (let i = 0; i < resdata.length; i++) {
          for (let j = 0; j < this.textEnum.length; j++) {
            if(resdata[i].text === this.textEnum[j].value){
              resdata[i].text = this.textEnum[j].text
            }
          }
        }
      }
      let needCategories = false;
      let tmpData = {categories:[], series:[]}
      let tmpcategories = []
      let tmpseries = [];
      //拼接categories
      if(this.echarts === true){
        needCategories = cfe.categories.includes(this.type)
      }else{
        needCategories = cfu.categories.includes(this.type)
      }
      if(needCategories === true){
        //如果props中的chartData带有categories，则优先使用chartData的categories
        if(this.chartData && this.chartData.categories && this.chartData.categories.length>0){
          tmpcategories = this.chartData.categories
        }else{
          //如果是日期类型的数据，不管是本地数据还是云数据，都按起止日期自动拼接categories
          if(this.startDate && this.endDate){
            let idate = new Date(this.startDate)
            let edate = new Date(this.endDate)
            while (idate <= edate) {
            	tmpcategories.push(getFormatDate(idate))
            	idate = idate.setDate(idate.getDate() + 1)
            	idate = new Date(idate)
            }
          //否则从结果中去重并拼接categories
          }else{
            let tempckey = {};
            resdata.map(function(item, index) {
              if (item.text != undefined && !tempckey[item.text]) {
                tmpcategories.push(item.text)
                tempckey[item.text] = true
              }
            });
          }
        }
        tmpData.categories = tmpcategories
      }
      //拼接series
      let tempskey = {};
      resdata.map(function(item, index) {
        if (item.group != undefined && !tempskey[item.group]) {
          tmpseries.push({ name: item.group, data: [] });
          tempskey[item.group] = true;
        }
      });
      //如果没有获取到分组名称(可能是带categories的数据，也可能是不带的饼图类)
      if (tmpseries.length == 0) {
        tmpseries = [{ name: '默认分组', data: [] }];
        //如果是需要categories的图表类型
        if(needCategories === true){
          for (let j = 0; j < tmpcategories.length; j++) {
            let seriesdata = 0;
            for (let i = 0; i < resdata.length; i++) {
              if (resdata[i].text == tmpcategories[j]) {
                seriesdata = resdata[i].value;
              }
            }
            tmpseries[0].data.push(seriesdata);
          }
        //如果是饼图类的图表类型
        }else{
          for (let i = 0; i < resdata.length; i++) {
            tmpseries[0].data.push({"name": resdata[i].text,"value": resdata[i].value});
          }
        }
      //如果有分组名
      } else {
        for (let k = 0; k < tmpseries.length; k++) {
          //如果有categories
          if (tmpcategories.length > 0) {
            for (let j = 0; j < tmpcategories.length; j++) {
              let seriesdata = 0;
              for (let i = 0; i < resdata.length; i++) {
                if (tmpseries[k].name == resdata[i].group && resdata[i].text == tmpcategories[j]) {
                  seriesdata = resdata[i].value;
                }
              }
              tmpseries[k].data.push(seriesdata);
            }
          //如果传了group而没有传text，即没有categories（正常情况下这种数据是不符合数据要求规范的）
          } else {
            for (let i = 0; i < resdata.length; i++) {
              if (tmpseries[k].name == resdata[i].group) {
                tmpseries[k].data.push(resdata[i].value);
              }
            }
          }
        }
      }
      tmpData.series = tmpseries
      //拷贝一下chartData，为了opts变更后统一数据来源
      this.drawData = deepCloneAssign({}, tmpData);
      this.checkData(tmpData)
    },
    reloading() {
      if(this.errorReload === false){
        return;
      }
      this.showchart = false;
      this.mixinDatacomErrorMessage = null;
      if (this.collection !== '') {
        this.mixinDatacomLoading = false;
        this.onMixinDatacomPropsChange(true);
      } else {
        this.beforeInit();
      }
    },
    checkData(anyData) {
      let cid = this.cid
      //复位opts或eopts
      if(this.echarts === true){
        cfe.option[cid] = deepCloneAssign({}, this.eopts);
        cfe.option[cid].id = cid;
        cfe.option[cid].type = this.type;
      }else{
        if (this.type && cfu.type.includes(this.type)) {
          cfu.option[cid] = deepCloneAssign({}, cfu[this.type], this.opts);
          cfu.option[cid].canvasId = cid;
        } else {
          this.mixinDatacomLoading = false;
          this.showchart = false;
          this.mixinDatacomErrorMessage = '参数错误：props参数中type类型不正确';
        }
      }
      //挂载categories和series
      let newData = deepCloneAssign({}, anyData);
      if (newData.series !== undefined && newData.series.length > 0) {
        this.mixinDatacomErrorMessage = null;
        if (this.echarts === true) {
          cfe.option[cid].chartData = newData;
          this.$nextTick(()=>{
            this.init()
          })
        }else{
          cfu.option[cid].categories = newData.categories;
          cfu.option[cid].series = newData.series;
          this.$nextTick(()=>{
            this.init()
          })
        }
      }
    },
    resizeHandler() {
      //渲染防抖
      let currTime = Date.now();
      let lastDrawTime = this.lastDrawTime?this.lastDrawTime:currTime-3000;
      let duration = currTime - lastDrawTime;
      if (duration < 1000) return;
      let chartdom = uni
        .createSelectorQuery()
        // #ifndef MP-ALIPAY
        .in(this)
        // #endif
        .select('#ChartBoxId'+this.cid)
        .boundingClientRect(data => {
          this.showchart = true;
          if (data.width > 0 && data.height > 0) {
            if (data.width !== this.cWidth || data.height !== this.cHeight) {
              this.checkData(this.drawData)
            }
          }
        })
        .exec();
    },
    getCloudData() {
      if (this.mixinDatacomLoading == true) {
        return;
      }
      this.mixinDatacomLoading = true;
      this.mixinDatacomGet()
        .then(res => {
          this.mixinDatacomResData = res.result.data;
          this.localdataInit(this.mixinDatacomResData);
        })
        .catch(err => {
          this.mixinDatacomLoading = false;
          this.showchart = false;
          this.mixinDatacomErrorMessage = '请求错误：' + err;
        });
    },
    onMixinDatacomPropsChange(needReset, changed) {
      if (needReset == true && this.collection !== '') {
        this.showchart = false;
        this.mixinDatacomErrorMessage = null;
        this._clearChart();
        this.getCloudData();
      }
    },
    _clearChart() {
      let cid = this.cid
      if (this.echrts !== true) {
        const ctx = uni.createCanvasContext(cid, this);
        ctx.clearRect(0, 0, this.cWidth, this.cHeight);
        ctx.draw();
      }
    },
    init() {
      let cid = this.cid
      let chartdom = uni
        .createSelectorQuery()
        // #ifndef MP-ALIPAY
        .in(this)
        // #endif
        .select('#ChartBoxId'+cid)
        .boundingClientRect(data => {
          if (data.width > 0 && data.height > 0) {
            this.mixinDatacomLoading = false;
            this.showchart = true;
            this.lastDrawTime = Date.now();
            this.cWidth = data.width;
            this.cHeight = data.height;
            if(this.echarts !== true){
              cfu.option[cid].background = this.background == 'rgba(0,0,0,0)' ? '#FFFFFF' : this.background;
              cfu.option[cid].canvas2d = this.type2d;
              cfu.option[cid].pixelRatio = this.pixel;
              cfu.option[cid].animation = this.animation;
              cfu.option[cid].width = data.width * this.pixel;
              cfu.option[cid].height = data.height * this.pixel;
              cfu.option[cid].ontap = this.ontap;
              cfu.option[cid].ontouch = this.ontouch;
              cfu.option[cid].onmouse = this.openmouse;
              cfu.option[cid].onmovetip = this.onmovetip;
              cfu.option[cid].tooltipShow = this.tooltipShow;
              cfu.option[cid].tooltipFormat = this.tooltipFormat;
              cfu.option[cid].tooltipCustom = this.tooltipCustom;
              cfu.option[cid].inScrollView = this.inScrollView;
              cfu.option[cid].lastDrawTime = this.lastDrawTime;
              cfu.option[cid].tapLegend = this.tapLegend;
            }
            //如果是H5或者App端，采用renderjs渲染图表
            if (this.inH5 || this.inApp) {
              if (this.echarts == true) {
                cfe.option[cid].ontap = this.ontap;
                cfe.option[cid].onmouse = this.openmouse;
                cfe.option[cid].tooltipShow = this.tooltipShow;
                cfe.option[cid].tooltipFormat = this.tooltipFormat;
                cfe.option[cid].tooltipCustom = this.tooltipCustom;
                cfe.option[cid].lastDrawTime = this.lastDrawTime;
                this.echartsOpts = deepCloneAssign({}, cfe.option[cid]);
              } else {
                cfu.option[cid].rotateLock = cfu.option[cid].rotate;
                this.uchartsOpts = deepCloneAssign({}, cfu.option[cid]);
              }
            //如果是小程序端，采用uCharts渲染
            } else {
              cfu.option[cid] = formatterAssign(cfu.option[cid],cfu.formatter)
              this.mixinDatacomErrorMessage = null;
              this.mixinDatacomLoading = false;
              this.showchart = true;
              this.$nextTick(()=>{
                if (this.type2d === true) {
                  const query = uni.createSelectorQuery().in(this)
                  query
                    .select('#' + cid)
                    .fields({ node: true, size: true })
                    .exec(res => {
                      if (res[0]) {
                        const canvas = res[0].node;
                        const ctx = canvas.getContext('2d');
                        cfu.option[cid].context = ctx;
                        canvas.width = data.width * this.pixel;
                        canvas.height = data.height * this.pixel;
                        canvas._width = data.width * this.pixel;
                        canvas._height = data.height * this.pixel;
                        cfu.option[cid].rotateLock = cfu.option[cid].rotate;
                        if(cfu.instance[cid] && cfu.option[cid] && cfu.option[cid].update === true){
                          this._updataUChart(cid)
                        }else{
                          setTimeout(()=>{
                            cfu.option[cid].context.restore();
                            cfu.option[cid].context.save();
                            this._newChart(cid)
                          },100)
                        }
                      } else {
                        this.showchart = false;
                        this.mixinDatacomErrorMessage = '参数错误：开启2d模式后，未获取到dom节点，canvas-id:' + cid;
                      }
                    });
                } else {
                  if(this.inAli){
                    cfu.option[cid].rotateLock = cfu.option[cid].rotate;
                  }
                  cfu.option[cid].context = uni.createCanvasContext(cid, this);
                  if(cfu.instance[cid] && cfu.option[cid] && cfu.option[cid].update === true){
                    this._updataUChart(cid)
                  }else{
                    setTimeout(()=>{
                      cfu.option[cid].context.restore();
                      cfu.option[cid].context.save();
                      this._newChart(cid)
                    },100)
                  }
                }
              })
            }
          } else {
            this.mixinDatacomLoading = false;
            this.showchart = false;
            if (this.reshow == true) {
              this.mixinDatacomErrorMessage = '布局错误：未获取到父元素宽高尺寸！canvas-id:' + cid;
            }
          }
        })
        .exec();
    },
    saveImage(){
    	uni.canvasToTempFilePath({
    	  canvasId: this.cid,
    	  success: res=>{
    	    //#ifdef H5
    			var a = document.createElement("a");
    			a.href = res.tempFilePath;
    			a.download = this.cid;
    			a.target = '_blank'
    			a.click();
    	    //#endif
    	    //#ifndef H5
    	      uni.saveImageToPhotosAlbum({
    	          filePath: res.tempFilePath,
    	          success: function () {
    	              uni.showToast({
    	                  title: '保存成功',
    	                  duration: 2000
    	              });
    	          }
    	      });
    	    //#endif
    	  } 
    	},this);
    },
    // #ifndef APP-VUE || H5
    _newChart(cid) {
      if (this.mixinDatacomLoading == true) {
        return;
      }
      this.showchart = true;
      cfu.instance[cid] = new uCharts(cfu.option[cid]);
      cfu.instance[cid].addEventListener('renderComplete', () => {
        this.emitMsg({name: 'complete', params: {type:"complete", complete: true, id: cid}});
        cfu.instance[cid].delEventListener('renderComplete')
      });
      cfu.instance[cid].addEventListener('scrollLeft', () => {
        this.emitMsg({name: 'scrollLeft', params: {type:"scrollLeft", scrollLeft: true, id: cid}});
      });
      cfu.instance[cid].addEventListener('scrollRight', () => {
        this.emitMsg({name: 'scrollRight', params: {type:"scrollRight", scrollRight: true, id: cid}});
      });
    },
    _updataUChart(cid) {
      cfu.instance[cid].updateData(cfu.option[cid])
    },
    _tooltipDefault(item, category, index, opts) {
      if (category) {
        let data = item.data
        if(typeof item.data === "object"){
          data = item.data.value
        }
        return category + ' ' + item.name + ':' + data;
      } else {
        if (item.properties && item.properties.name) {
          return item.properties.name;
        } else {
          return item.name + ':' + item.data;
        }
      }
    },
    _showTooltip(e) {
      let cid = this.cid
      let tc = cfu.option[cid].tooltipCustom
      if (tc && tc !== undefined && tc !== null) {
        let offset = undefined;
        if (tc.x >= 0 && tc.y >= 0) {
          offset = { x: tc.x, y: tc.y + 10 };
        }
        cfu.instance[cid].showToolTip(e, {
          index: tc.index,
          offset: offset,
          textList: tc.textList,
          formatter: (item, category, index, opts) => {
            if (typeof cfu.option[cid].tooltipFormat === 'string' && cfu.formatter[cfu.option[cid].tooltipFormat]) {
              return cfu.formatter[cfu.option[cid].tooltipFormat](item, category, index, opts);
            } else {
              return this._tooltipDefault(item, category, index, opts);
            }
          }
        });
      } else {
        cfu.instance[cid].showToolTip(e, {
          formatter: (item, category, index, opts) => {
            if (typeof cfu.option[cid].tooltipFormat === 'string' && cfu.formatter[cfu.option[cid].tooltipFormat]) {
              return cfu.formatter[cfu.option[cid].tooltipFormat](item, category, index, opts);
            } else {
              return this._tooltipDefault(item, category, index, opts);
            }
          }
        });
      }
    },
    _tap(e,move) {
      let cid = this.cid
      let currentIndex = null;
      let legendIndex = null;
      if (this.inScrollView === true || this.inAli) {
        let chartdom = uni
          .createSelectorQuery()
          // #ifndef MP-ALIPAY
          .in(this)
          .select('#ChartBoxId'+cid)
          // #endif
          // #ifdef MP-ALIPAY
          .select('#'+this.cid)
          // #endif
          .boundingClientRect(data => {
            e.changedTouches=[];
            if (this.inAli) {
              e.changedTouches.unshift({ x: e.detail.clientX - data.left, y: e.detail.clientY - data.top});
            }else{
              e.changedTouches.unshift({ x: e.detail.x - data.left, y: e.detail.y - data.top - this.pageScrollTop});
            }
            if(move){
              if (this.tooltipShow === true) {
                this._showTooltip(e);
              }
            }else{
              currentIndex = cfu.instance[cid].getCurrentDataIndex(e);
              legendIndex = cfu.instance[cid].getLegendDataIndex(e);
              if(this.tapLegend === true){
                cfu.instance[cid].touchLegend(e);
              }
              if (this.tooltipShow === true) {
                this._showTooltip(e);
              }
              this.emitMsg({name: 'getIndex', params: { type:"getIndex", event:{ x: e.detail.x - data.left, y: e.detail.y - data.top }, currentIndex: currentIndex, legendIndex: legendIndex, id: cid, opts: cfu.instance[cid].opts}});
            }
          })
          .exec();
      } else {
        if(move){
          if (this.tooltipShow === true) {
            this._showTooltip(e);
          }
        }else{
          e.changedTouches=[];
          e.changedTouches.unshift({ x: e.detail.x - e.currentTarget.offsetLeft, y: e.detail.y - e.currentTarget.offsetTop });
          currentIndex = cfu.instance[cid].getCurrentDataIndex(e);
          legendIndex = cfu.instance[cid].getLegendDataIndex(e);
          if(this.tapLegend === true){
            cfu.instance[cid].touchLegend(e);
          }
          if (this.tooltipShow === true) {
            this._showTooltip(e);
          }
          this.emitMsg({name: 'getIndex', params: {type:"getIndex", event:{ x: e.detail.x, y: e.detail.y - e.currentTarget.offsetTop }, currentIndex: currentIndex, legendIndex: legendIndex, id: cid, opts: cfu.instance[cid].opts}});
        }
      }
    },
    _touchStart(e) {
      let cid = this.cid
      lastMoveTime=Date.now();
      if(cfu.option[cid].enableScroll === true){
        cfu.instance[cid].scrollStart(e);
      }
      this.emitMsg({name:'getTouchStart', params:{type:"touchStart", event:e.changedTouches[0], id:cid}});
    },
    _touchMove(e) {
      let cid = this.cid
      let currMoveTime = Date.now();
      let duration = currMoveTime - lastMoveTime;
      if (duration < Math.floor(1000 / 60)) return;//每秒60帧
      lastMoveTime = currMoveTime;
      if(cfu.option[cid].enableScroll === true){
        cfu.instance[cid].scroll(e);
      }
      this.emitMsg({name: 'getTouchMove', params: {type:"touchMove", event:e.changedTouches[0], id: cid}});
      if(this.ontap === true && cfu.option[cid].enableScroll === false && this.onmovetip === true){
        this._tap(e,true)
      }
    },
    _touchEnd(e) {
      let cid = this.cid
      if(cfu.option[cid].enableScroll === true){
        cfu.instance[cid].scrollEnd(e);
      }
      this.emitMsg({name:'getTouchEnd', params:{type:"touchEnd", event:e.changedTouches[0], id:cid}});
      if(this.ontap === true && cfu.option[cid].enableScroll === false && this.onmovetip === true){
        this._tap(e,true)
      }
    },
    // #endif
    _error(e) {
      this.mixinDatacomErrorMessage = e.detail.errMsg;
    },
    emitMsg(msg) {
      this.$emit(msg.name, msg.params);
    },
    getRenderType() {
      //防止如果开启echarts且父元素为v-if的情况renderjs监听不到prop变化的问题
      if(this.echarts===true && this.mixinDatacomLoading===false){
        this.beforeInit()
      }
    },
    toJSON(){
      return this
    }
  }
};
</script>

<!-- #ifdef APP-VUE || H5 -->
<script module="rdcharts" lang="renderjs">
import uChartsRD from '../../js_sdk/u-charts/u-charts.js';
import cfu from '../../js_sdk/u-charts/config-ucharts.js';
import cfe from '../../js_sdk/u-charts/config-echarts.js';

var that = {};
var rootdom = null;

function rddeepCloneAssign(origin = {}, ...args) {
  for (let i in args) {
    for (let key in args[i]) {
      if (args[i].hasOwnProperty(key)) {
        origin[key] = args[i][key] && typeof args[i][key] === 'object' ? rddeepCloneAssign(Array.isArray(args[i][key]) ? [] : {}, origin[key], args[i][key]) : args[i][key];
      }
    }
  }
  return origin;
}

function rdformatterAssign(args,formatter) {
  for (let key in args) {
    if(args[key] !== null && typeof args[key] === 'object'){
      rdformatterAssign(args[key],formatter)
    }else if(key === 'format' && typeof args[key] === 'string'){
      args['formatter'] = formatter[args[key]] ? formatter[args[key]] : undefined;
    }
  }
  return args;
}

export default {
  data() {
    return {
      rid:null
    }
  },
  mounted() {
    rootdom = {top:0,left:0}
    // #ifdef H5
    let dm = document.querySelectorAll('uni-main')[0]
    if(dm === undefined){
      dm = document.querySelectorAll('uni-page-wrapper')[0]
    }
    rootdom = {top:dm.offsetTop,left:dm.offsetLeft}
    // #endif
    setTimeout(()=>{
      if(this.rid === null){
        this.$ownerInstance && this.$ownerInstance.callMethod('getRenderType')
      }
    },200)
  },
  destroyed(){
    delete cfu.option[this.rid]
    delete cfu.instance[this.rid]
    delete cfe.option[this.rid]
    delete cfe.instance[this.rid]
  },
  methods: {
    //==============以下是ECharts的方法====================
    ecinit(newVal, oldVal, owner, instance){
      let cid = JSON.stringify(newVal.id)
      this.rid = cid
      that[cid] = this.$ownerInstance || instance
      let eopts = JSON.parse(JSON.stringify(newVal))
      let type = eopts.type;
      //载入并覆盖默认配置
      if (type && cfe.type.includes(type)) {
        cfe.option[cid] = rddeepCloneAssign({}, cfe[type], eopts);
      }else{
        cfe.option[cid] = rddeepCloneAssign({}, eopts);
      }
      let newData = eopts.chartData;
      //挂载categories和series
      if(cfe.option[cid].xAxis && cfe.option[cid].xAxis.type && cfe.option[cid].xAxis.type === 'category'){
        cfe.option[cid].xAxis.data = newData.categories
      }
      if(cfe.option[cid].yAxis && cfe.option[cid].yAxis.type && cfe.option[cid].yAxis.type === 'category'){
        cfe.option[cid].yAxis.data = newData.categories
      }
      cfe.option[cid].series = []
      for (var i = 0; i < newData.series.length; i++) {
        cfe.option[cid].seriesTemplate = cfe.option[cid].seriesTemplate ? cfe.option[cid].seriesTemplate : {}
        let Template = rddeepCloneAssign({},cfe.option[cid].seriesTemplate,newData.series[i])
        cfe.option[cid].series.push(Template)
      }
      if (typeof window.echarts === 'object') {
          this.newEChart()
      }else{
        const script = document.createElement('script')
        // #ifdef APP-VUE
        script.src = './uni_modules/qiun-data-charts/static/app-plus/echarts.min.js'
        // #endif
        // #ifdef H5
        const rooturl = window.location.origin 
        const directory = instance.getDataset().directory
        script.src = rooturl + directory + 'uni_modules/qiun-data-charts/static/h5/echarts.min.js'
        // #endif
        script.onload = this.newEChart
        document.head.appendChild(script)
      }
    },
    ecresize(newVal, oldVal, owner, instance){
      if(cfe.instance[this.rid]){
        cfe.instance[this.rid].resize()
      }
    },
    newEChart(){
      let cid = this.rid
      if(cfe.instance[cid] === undefined){
        cfe.instance[cid] = echarts.init(that[cid].$el.children[0])
        //ontap开启后才触发click事件
        if(cfe.option[cid].ontap === true){
          cfe.instance[cid].on('click', resdata => {
            let event = JSON.parse(JSON.stringify({
              x:resdata.event.offsetX,y:resdata.event.offsetY
            }))
            that[cid].callMethod('emitMsg',{name:"getIndex", params:{type:"getIndex", event:event, currentIndex:resdata.dataIndex, value:resdata.data, seriesName: resdata.seriesName,id:cid}})
          })
          // 增加ECharts的highlight消息，实现按下移动返回索引功能。add by onefish 创建于 2021-12-11 09:50
          cfe.instance[cid].on('highlight', resdata => {
            that[cid].callMethod('emitMsg',{name:"getHighlight", params:{type:"highlight", dataIndex:resdata.batch[0].dataIndex, id:cid}})
          })
        }
        this.updataEChart(cid,cfe.option[cid])
      }else{
        this.updataEChart(cid,cfe.option[cid])
      }
    },
    updataEChart(cid,option){
      //替换option内format属性为formatter的预定义方法
      option = rdformatterAssign(option,cfe.formatter)
      if(option.tooltip){
        option.tooltip.show = option.tooltipShow?true:false;
        option.tooltip.position = this.tooltipPosition()
        //tooltipFormat方法，替换组件的tooltipFormat为config-echarts.js内对应的方法
        if (typeof option.tooltipFormat === 'string' && cfe.formatter[option.tooltipFormat]) {
          option.tooltip.formatter = option.tooltip.formatter ? option.tooltip.formatter : cfe.formatter[option.tooltipFormat]
        }
      }
      // 颜色渐变添加的方法
      if (option.series) {
      	for (let i in option.series) {
      		let linearGradient = option.series[i].linearGradient
      		if (linearGradient) {
      			option.series[i].color = new echarts.graphic.LinearGradient(linearGradient[0],linearGradient[1],linearGradient[2],linearGradient[3],linearGradient[4])
      		}
      	}
      }
      cfe.instance[cid].setOption(option, option.notMerge)
      cfe.instance[cid].on('finished', function(){
        that[cid].callMethod('emitMsg',{name:"complete",params:{type:"complete",complete:true,id:cid}})
        if(cfe.instance[cid]){
          cfe.instance[cid].off('finished')
        }
      })
    },
    tooltipPosition(){
      return (point, params, dom, rect, size) => {
      	let x = point[0]
      	let y = point[1]
      	let viewWidth = size.viewSize[0]
      	let viewHeight = size.viewSize[1]
      	let boxWidth = size.contentSize[0]
      	let boxHeight = size.contentSize[1]
      	let posX = x + 30 
      	let posY = y + 30 
      	if (posX + boxWidth > viewWidth) { 
      		posX = x - boxWidth - 30
      	}
      	if (posY + boxHeight > viewHeight) {
      		posY = y - boxHeight - 30
      	}
      	return [posX, posY]
      }
    },
    //==============以下是uCharts的方法====================
    ucinit(newVal, oldVal, owner, instance){
      if(JSON.stringify(newVal) == JSON.stringify(oldVal)){
        return;
      }
      if(!newVal.canvasId){
        return;
      }
      let cid = JSON.parse(JSON.stringify(newVal.canvasId))
      this.rid = cid
      that[cid] = this.$ownerInstance || instance
      cfu.option[cid] = JSON.parse(JSON.stringify(newVal))
      cfu.option[cid] = rdformatterAssign(cfu.option[cid],cfu.formatter)
      let canvasdom = document.getElementById(cid)
      if(canvasdom && canvasdom.children[0]){
        cfu.option[cid].context = canvasdom.children[0].getContext("2d")
        if(cfu.instance[cid] && cfu.option[cid] && cfu.option[cid].update === true){
          this.updataUChart()
        }else{
          setTimeout(()=>{
            cfu.option[cid].context.restore();
            cfu.option[cid].context.save();
            this.newUChart()
          },100)
        }
      }
    },
    newUChart() {
      let cid = this.rid
      cfu.instance[cid] = new uChartsRD(cfu.option[cid])
      cfu.instance[cid].addEventListener('renderComplete', () => {
        that[cid].callMethod('emitMsg',{name:"complete",params:{type:"complete",complete:true,id:cid}})
        cfu.instance[cid].delEventListener('renderComplete')
      });
      cfu.instance[cid].addEventListener('scrollLeft', () => {
        that[cid].callMethod('emitMsg',{name:"scrollLeft",params:{type:"scrollLeft",scrollLeft:true,id:cid}})
      });
      cfu.instance[cid].addEventListener('scrollRight', () => {
        that[cid].callMethod('emitMsg',{name:"scrollRight",params:{type:"scrollRight",scrollRight:true,id:cid}})
      });
    },
    updataUChart() {
      let cid = this.rid
      cfu.instance[cid].updateData(cfu.option[cid])
    },
    tooltipDefault(item, category, index, opts) {
      if (category) {
        let data = item.data
        if(typeof item.data === "object"){
          data = item.data.value
        }
        return category + ' ' + item.name + ':' + data;
      } else {
        if (item.properties && item.properties.name) {
          return item.properties.name ;
        } else {
          return item.name + ':' + item.data;
        }
      }
    },
    showTooltip(e,cid) {
      let tc = cfu.option[cid].tooltipCustom
      if (tc && tc !== undefined && tc !== null) {
        let offset = undefined;
        if (tc.x >= 0 && tc.y >= 0) {
          offset = { x: tc.x, y: tc.y + 10 };
        }
        cfu.instance[cid].showToolTip(e, {
          index: tc.index,
          offset: offset,
          textList: tc.textList,
          formatter: (item, category, index, opts) => {
            if (typeof cfu.option[cid].tooltipFormat === 'string' && cfu.formatter[cfu.option[cid].tooltipFormat]) {
              return cfu.formatter[cfu.option[cid].tooltipFormat](item, category, index, opts);
            } else {
              return this.tooltipDefault(item, category, index, opts);
            }
          }
        });
      } else {
        cfu.instance[cid].showToolTip(e, {
          formatter: (item, category, index, opts) => {
            if (typeof cfu.option[cid].tooltipFormat === 'string' && cfu.formatter[cfu.option[cid].tooltipFormat]) {
              return cfu.formatter[cfu.option[cid].tooltipFormat](item, category, index, opts);
            } else {
              return this.tooltipDefault(item, category, index, opts);
            }
          }
        });
      }
    },
    tap(e) {
      let cid = this.rid
      let ontap = cfu.option[cid].ontap
      let tooltipShow = cfu.option[cid].tooltipShow
      let tapLegend = cfu.option[cid].tapLegend
      if(ontap == false) return;
      let currentIndex=null
      let legendIndex=null
      let rchartdom = document.getElementById('UC'+cid).getBoundingClientRect()
      let tmpe = {}
      if(e.detail.x){//tap或者click的事件
        tmpe = { x: e.detail.x - rchartdom.left, y:e.detail.y - rchartdom.top + rootdom.top}
      }else{//mouse的事件
        tmpe = { x: e.clientX - rchartdom.left, y:e.clientY - rchartdom.top + rootdom.top}
      }
      e.changedTouches = [];
      e.changedTouches.unshift(tmpe)
      currentIndex=cfu.instance[cid].getCurrentDataIndex(e)
      legendIndex=cfu.instance[cid].getLegendDataIndex(e)
      if(tapLegend === true){
        cfu.instance[cid].touchLegend(e);
      }
      if(tooltipShow==true){
        this.showTooltip(e,cid)
      }
      that[cid].callMethod('emitMsg',{name:"getIndex",params:{type:"getIndex",event:tmpe,currentIndex:currentIndex,legendIndex:legendIndex,id:cid, opts: cfu.instance[cid].opts}})
    },
    touchStart(e) {
      let cid = this.rid
      let ontouch = cfu.option[cid].ontouch
      if(ontouch == false) return;
      cfu.instance[cid].scrollStart(e)
      that[cid].callMethod('emitMsg',{name:"getTouchStart",params:{type:"touchStart",event:e.changedTouches[0],id:cid}})
    },
    touchMove(e) {
      let cid = this.rid
      let ontouch = cfu.option[cid].ontouch
      if(ontouch == false) return;
      cfu.instance[cid].scroll(e)
      that[cid].callMethod('emitMsg',{name:"getTouchMove",params:{type:"touchMove",event:e.changedTouches[0],id:cid}})
      if(cfu.option[cid].ontap === true && cfu.option[cid].enableScroll === false && cfu.option[cid].onmovetip === true){
        let rchartdom = document.getElementById('UC'+cid).getBoundingClientRect()
        let tmpe = { x: e.changedTouches[0].clientX - rchartdom.left, y:e.changedTouches[0].clientY - rchartdom.top + rootdom.top}
        e.changedTouches = [];
        e.changedTouches.unshift(tmpe)
        if(cfu.option[cid].tooltipShow === true){
          this.showTooltip(e,cid)
        }
      }
    },
    touchEnd(e) {
      let cid = this.rid
      let ontouch = cfu.option[cid].ontouch
      if(ontouch == false) return;
      cfu.instance[cid].scrollEnd(e)
      that[cid].callMethod('emitMsg',{name:"getTouchEnd",params:{type:"touchEnd",event:e.changedTouches[0],id:cid}})
    },
    mouseDown(e) {
      let cid = this.rid
      let onmouse = cfu.option[cid].onmouse
      if(onmouse == false) return;
      let rchartdom = document.getElementById('UC'+cid).getBoundingClientRect()
      let tmpe = {}
      tmpe = { x: e.clientX - rchartdom.left, y:e.clientY - rchartdom.top + rootdom.top}
      e.changedTouches = [];
      e.changedTouches.unshift(tmpe)
      cfu.instance[cid].scrollStart(e)
      cfu.option[cid].mousedown=true;
      that[cid].callMethod('emitMsg',{name:"getTouchStart",params:{type:"mouseDown",event:tmpe,id:cid}})
    },
    mouseMove(e) {
      let cid = this.rid
      let onmouse = cfu.option[cid].onmouse
      let tooltipShow = cfu.option[cid].tooltipShow
      if(onmouse == false) return;
      let rchartdom = document.getElementById('UC'+cid).getBoundingClientRect()
      let tmpe = {}
      tmpe = { x: e.clientX - rchartdom.left, y:e.clientY - rchartdom.top + rootdom.top}
      e.changedTouches = [];
      e.changedTouches.unshift(tmpe)
      if(cfu.option[cid].mousedown){
        cfu.instance[cid].scroll(e)
        that[cid].callMethod('emitMsg',{name:"getTouchMove",params:{type:"mouseMove",event:tmpe,id:cid}})
      }else if(cfu.instance[cid]){
        if(tooltipShow==true){
          this.showTooltip(e,cid)
        }
      }
    },
    mouseUp(e) {
      let cid = this.rid
      let onmouse = cfu.option[cid].onmouse
      if(onmouse == false) return;
      let rchartdom = document.getElementById('UC'+cid).getBoundingClientRect()
      let tmpe = {}
      tmpe = { x: e.clientX - rchartdom.left, y:e.clientY - rchartdom.top + rootdom.top}
      e.changedTouches = [];
      e.changedTouches.unshift(tmpe)
      cfu.instance[cid].scrollEnd(e)
      cfu.option[cid].mousedown=false;
      that[cid].callMethod('emitMsg',{name:"getTouchEnd",params:{type:"mouseUp",event:tmpe,id:cid}})
    },
  }
}
</script>
<!-- #endif -->

<style scoped>
.chartsview {
  width: 100%;
  height: 100%;
  display: flex;
  flex: 1;
  justify-content: center;
  align-items: center;
}
</style>
