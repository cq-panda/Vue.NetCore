<template>
  <div class="demo-Circle">
    <div style>
      <i-circle
        :size="size"
        :trail-width="4"
        :stroke-width="5"
        :percent="75"
        stroke-linecap="square"
        stroke-color="#43a3fb"
      >
        <div class="demo-Circle-custom">
          <h1>1500</h1>
          <p>昨日活跃用户数量</p>
          <span>
            占比
            <i>{{1500/20000}}%</i>
          </span>
        </div>
      </i-circle>
    </div>
    <div style>
      <i-circle
        :size="size"
        :trail-width="4"
        :stroke-width="5"
        :percent="75"
        stroke-linecap="square"
        stroke-color="#43a3fb"
      >
        <div class="demo-Circle-custom">
          <h1>12000</h1>
          <p>上月活跃用户数量</p>
          <span>
            占比
            <i>{{12000/150000}}%</i>
          </span>
        </div>
      </i-circle>
    </div>
  </div>
</template>
<script>
export default {
  props:{
    size:{
      type:Number,
      default:150
    }
  }
}
</script>
<style scoped>
.demo-Circle {
  display: flex;
}
.demo-Circle > div {
  flex: 1;
  text-align: center;
}
.demo-Circle > div:first-child{
  padding-left:10%;
}

.demo-Circle > div:last-child{
  padding-right:10%;
}
</style>
<style lang="less" scoped>
.demo-Circle-custom {
  & h1 {
    color:#ffffff;
    font-size: 28px;
    font-weight: normal;
  }
  & p {
    color: #ece8e8;
    font-size: 14px;
    margin: 10px 0 15px;
  }
  & span {
    display: block;
    padding-top: 15px;
    color: wheat;
    font-size: 14px;
    &:before {
      content: "";
      display: block;
      width: 50px;
      height: 1px;
      margin: 0 auto;
      background: #e0e3e6;
      position: relative;
      top: -15px;
    }
  }
  & span i {
    font-style: normal;
    color: white;
  }
}
</style>
