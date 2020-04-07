<template>
  <div class="home-contianer">
    <div>
      <div class="order-title">
        <h2>订单统计</h2>
      </div>
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
              <div class="demo-color-name">{{item.name}}</div>
              <div class="demo-color-desc">#{{item.qty}}</div>
            </div>
          </div>
        </div>
      </div>

      <div class="order-title">
        <h2>订单查询</h2>
      </div>
      <div class="jn-day-total">
        <div class="date-text">
          <label>选择日期：</label>
        </div>
        <div class="date">
          <DatePicker
            :value="beginDate"
            type="date"
            show-week-numbers
              @on-change="(time)=>{beginDate=time; return time}"
            placeholder="Select date"
            style="width: 200px"
          ></DatePicker>
        </div>
        <div class="date">
          <DatePicker
            :value="endDate"
            type="date"
            show-week-numbers
              @on-change="(time)=>{endDate=time; return time}"
            placeholder="Select date"
            style="width: 200px"
          ></DatePicker>
        </div>
        <div class="btn">
          <Button @click="search()" type="success">
            <Icon type="ios-search" />查询
          </Button>
        </div>
      </div>
      <div class="order-range">
        <div class="order-item" v-for="(item,index) in totalRange" :key="index">
          <div class="total">{{item.qty}}</div>
          <div class="name">{{titleLeft+item.name}}</div>
          <div class="date">{{beginDate.replace(/-/g,'.')}} -- {{endDate.replace(/-/g,'.')}}</div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
// var echarts = require("echarts");

export default {
  components: {},
  data() {
    return {
      beginDate: "",
      endDate: "",
      n: 90,
      topColor: [
        {
          name: "订单数",
          desc: "#205",
          background: "rgb(25, 190, 107)",
          icon: "ios-cart",
          qty: 6000,
          key: "total"
        },
        {
          name: "已付款订单",
          desc: "#412",
          background: "rgb(45, 183, 245)",
          icon: "ios-cash",
          qty: 7100,
          key: "total"
        },
        {
          name: "待发货订单",
          desc: "#412",
          background: "rgb(255, 153, 0)",
          icon: "md-bus",
          qty: 500,
          key: "hasPay"
        },
        {
          name: "配送中订单",
          desc: "#412",
          background: " rgb(84, 110, 122)",
          icon: "md-pin",
          qty: 800,
          key: "notShip"
        },
        {
          name: "交易完成",
          desc: "#412",
          background: "rgb(45, 183, 245)",
          icon: "ios-help-buoy",
          qty: 1880,
          key: "completed"
        },
        {
          name: "退货订单",
          desc: "#12",
          background: "rgb(237, 64, 20)",
          icon: "ios-navigate",
          qty: 2290,
          key: "refund"
        }
      ],
      totalRange: [
        {
          name: "订单数",
          desc: "#205",
          background: "rgb(25, 190, 107)",
          icon: "ios-cart",
          qty: 1290,
          key: "total"
        },
        {
          name: "已付款订单",
          desc: "#412",
          background: "rgb(45, 183, 245)",
          icon: "ios-cash",
          qty: 3450,
          key: "total"
        },
        {
          name: "待发货订单",
          desc: "#412",
          background: "rgb(255, 153, 0)",
          icon: "md-bus",
          qty: 200,
          key: "hasPay"
        },
        {
          name: "配送中订单",
          desc: "#412",
          background: " rgb(84, 110, 122)",
          icon: "md-pin",
          qty: 7000,
          key: "notShip"
        },
        {
          name: "交易完成",
          desc: "#412",
          background: "rgb(45, 183, 245)",
          icon: "ios-help-buoy",
          qty: 8900,
          key: "completed"
        },
        {
          name: "退货订单",
          desc: "#12",
          background: "rgb(237, 64, 20)",
          icon: "ios-navigate",
          qty: 2450,
          key: "refund"
        }
      ],
      value1: "1",
      titleLeft:'',
      dateNow:'',
    };
  },
  methods: {
    getDate() {
      var date = new Date();
      var year = date.getFullYear();
      var month = date.getMonth() + 1;
      var day = date.getDate();
      var hour = date.getHours();
      var minutes = date.getMinutes();
      var second = date.getSeconds();
      this.beginDate =
        year +
        "-" +
        (month < 10 ? "0" + month : month) +
        "-" +
        (day < 10 ? "0" + day : day);
      this.endDate = this.beginDate;
      this.dateNow=this.beginDate;
    },search(){
      if (this.dateNow==this.beginDate&&this.dateNow==this.endDate) {
        this.titleLeft='今日';
      }else{
        this.titleLeft="当期"
      }
    }
  },
  created() {
    this.getDate();
  },
  mounted() {}
};
</script>
<style scoped>
.home-contianer {
  background: #efefef;
  width: 100%;
  height: 100%;
  /* padding: 20px; */
}

.ivu-card-body {
  text-align: center;
  padding: 20px 5px;
  /* padding-left: 80px; */
  font-size: 16px;
}
.demo-color-name {
  color: #fff;
  font-size: 14px;
}
.demo-color-desc {
  color: white;
  /* opacity: 0.7; */
  font-size: 20px;
  margin-top: 2px;
}
.ivu-card {
  box-shadow: 0 3px 13px rgba(117, 114, 114, 0.47);
  display: flex;
  position: relative;
}
.ivu-card .icon-left {
  width: 85px;
}
.ivu-card .ivu-card-body {
  flex: 1;
}
.ivu-card .icon-left {
  text-align: center;
  border-right: 1px solid;
  padding: 8px 0px;
  height: 100%;

  font-size: 50px;
  color: white;
}
.ivu-row {
  border-bottom: 2px dotted #eee;
  padding: 15px;
  margin-bottom: 15px;
  display: flex;
}

.ivu-row > div {
  flex: 1;
}

.h5-desc {
  padding-top: 10px;
}
</style>

<style lang="less" scoped>
.jn-day-total {
  display: flex;
  padding: 15px;
  background: white;
  .date-text {
    line-height: 36px;
    padding: 0 15px;
  }
  .date {
    margin-right: 20px;
  }
  .btn {
    margin-left: 10px;
  }
}
.order-title {
  h2 {
    padding: 7px 15px;
    font-weight: 500;
    background: white;
    border-bottom: 1px dotted #d4d4d4;
  }
}

.order-range {
  padding: 0 15px;
  background: white;
  background: white;
  display: flex;
  // flex-direction: row-reverse;
}

.order-range .order-item {
  box-shadow: 0 3px 13px rgba(117, 114, 114, 0.47);
  flex: 1;
  border-radius: 6px;
  font-size: 14px;
  text-align: center;
  border: 1px solid #e6e6e6;
  margin: 7px;
}

.order-range .total {
  color: white;
  font-size: 50px;
  font-weight: bold;
  line-height: 100px;
  background: #55ce80;
  font-family: "Helvetica Neue", Helvetica, "PingFang SC", "Hiragino Sans GB",
    "Microsoft YaHei", "微软雅黑", Arial, sans-serif;
}

.order-range .name {
  font-size: 20px;
  padding: 10px;
}

.order-range .date {
  padding: 1px 0 20px 0;
  color: #9e9e9e;
  font-size: 13px;
}
</style>

