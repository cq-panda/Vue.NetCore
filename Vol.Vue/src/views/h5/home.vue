<template>
  <div class="home">
    <div class="head">
      <div class="location">
        <Dropdown>
          <a href="javascript:void(0)">
            北京市
            <Icon type="ios-arrow-down"></Icon>
          </a>
          <DropdownMenu slot="list">
            <DropdownItem>上海市</DropdownItem>
            <DropdownItem>天津市</DropdownItem>
            <DropdownItem>广州市</DropdownItem>
          </DropdownMenu>
        </Dropdown>
      </div>
      <div class="text">首页</div>
      <div class="search">
        <Icon type="ios-search" />
      </div>
      <!-- <Input search placeholder="搜索..." /> -->
    </div>
    <div class="home-content">
      <!-- autoplay -->
      <div class="title" style="border-left: 2px solid #00BCD4;">优选功能</div>
      <Carousel class="carouse" style="display:none;" :height="180" v-model="value2" loop>
        <CarouselItem v-for="(item,i) in carouse" :key="i">
          <img :src="item.src" />
        </CarouselItem>
      </Carousel>
      <div >
      <!-- <div class="title">快捷功能</div> -->
      <div class="icon-item">
        <a class="item" v-for="(item,index) in icons" :key="index">
          <!-- <Icon :type="item.icon" /> -->
          <Avatar :style="{'background':item.color}" :icon="item.icon" size="large" />
          <br />
          <span>{{item.name}}</span>
        </a>
      </div>
      <div  style="margin-top: 1rem;">
        <Cow></Cow>
      </div>
      </div>
    </div>
  </div>
  <!--  -->
</template>
<script>
import Cow from "@/../src/components/Community/cow.vue";
export default {
  components: { Cow: Cow },
  data() {
    return {
      icons: [
        {
          name: "热 点",
          path: "/app/home",
          icon: "ios-aperture",
          color: "#FF9800"
        },
        {
          name: "商 圈",
          path: "/app/home",
          icon: "ios-cart",
          color: "#7dbcee"
        },
        {
          name: "社 圈",
          path: "/app/home",
          icon: "ios-globe-outline",
          color: "#fa805a"
        },
        {
          name: "话 题",
          path: "/app/home",
          icon: "ios-contacts",
          color: "rgb(224, 140, 238)"
        },
        {
          name: "服 务",
          path: "/app/home",
          icon: "ios-appstore",
          color: "rgb(0, 201, 8)"
        },
        { name: "交 友", path: "/app/home", icon: "md-cafe", color: "#fa805a" },
        {
          name: "二 手",
          path: "/app/home",
          icon: "ios-hand",
          color: "rgb(255, 121, 167)"
        },
        {
          name: "其 他",
          path: "/app/home",
          icon: "ios-ionic",
          color: "#7dbcee"
        }
      ],
      carouse: [
        {
          src: "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5/h51.jpg"
        },
        {
          src: "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5/h52.jpg"
        },
        {
          src: "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5/h53.jpg"
        },
        {
          src: "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5/h54.jpg"
        }
      ],
      value2: 0
    };
  }
};
</script>
<style lang="less" scoped>
.home {
  background: #f9f8f8;
  height: 100%;
}
.home-content{
      margin-top: 42px;
  overflow-y: auto;
}
.carouse {
  height: 180px;
  img {
    height: 100%;
    width: 100%;
  }
}
.head {
  width: 100%;
  padding: 0.6rem;
  background: white;
  display: inline-block;
      border-bottom: 1px solid #eee;
      top: 0;
    position: fixed;
    z-index: 100;
  > div {
    float: left;
    width: 33.3333%;
  }
  .location .ivu-dropdown {
    top: 5px;
    position: relative;
  }
  .text {
    text-align: center;
    font-size: 1rem;
    color: forestgreen;
  }
  .search {
    text-align: right;
    font-size: 1.1rem;
    color: forestgreen;
  }
}
.title {
  padding: 0.6rem;
}
.icon-item {
  width: 100%;
  display: inline-block;
  position: relative;
  background: white;
  /* height: 3.7rem; */
  /* background: red; */
  border: 1px solid #eee;
  // padding: 1rem 0;
  // margin-top: 1rem;
  > a {
    float: left;
    width: 25%;
    padding: 0.6rem 0.3rem;
    text-align: center;
    color: #7c7979;
    border: 1px solid #f1eded;
    > i {
      font-size: 1.8rem;
    }
  }
}
</style>
<style scoped>
.head >>> input {
  border-radius: 20px;
}
</style>