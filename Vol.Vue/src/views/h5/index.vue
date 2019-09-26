<template>
  <div class="app-container">
    <div class="header"></div>
    <div class="content">
      <router-view></router-view>
    </div>
    <div class="footer">
      <a :class="{active:activeIndex==index}" 
      @click="redirect(item,index)"
      class="item" v-for="(item,index) in menu" :key="index">
        <Icon :type="item.icon" />
        <br>
        <span>{{item.name}}</span>
      </a>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      activeIndex:0,
      menu: [
        { name: "首 页", path: "/app/home", icon: "ios-home" },
        { name: "话 题", path: "/app/topic", icon: "ios-cart" },
        { name: "社 圈", path: "/app/question", icon: "ios-globe-outline" },
        { name: "我 的", path: "/app/my", icon: "ios-contacts" }
      ]
    };
  },methods:{
    redirect(item,index){
      this.activeIndex=index;
         this.$router.push({ path:this.menu[this.activeIndex].path });
    }
  }
};
</script>

<style lang="less" scoped>
.app-container {
  height: 100%;
  display: flex;
  flex-direction: column;
  .content {
    flex: 1;
    overflow: scroll;
        background: #eaeaea;
  }
  .footer {
    height: 3.7rem;
    /* background: red; */
    border: 1px solid #eee;
    > a{
      float: left;
      width: 25%;
      padding: 0.3rem;
          text-align: center;
              float: left;
    width: 25%;
    padding: 0.3rem;
    text-align: center;
    color: #7c7979;
    > i{
          font-size: 1.8rem;
    }
    }
  }
}
.active{
    color: #fc0000 !important;
}
</style>
