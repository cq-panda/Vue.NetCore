<template>
  <div class="vol-index">
    <div class="vol-index-title">
      <img src="@/assets/vue.jpg" />vol.vue-h5演示系统
    </div>

    <div class="vol-index-contanier">
      <swipe-index></swipe-index>
      <div class="v-success">
        <p>1、VOL.Core单表H5页面已完成，见菜单(表单CURD)</p>
        <p>2、VOL.Core菜单渲染功能已完成，见菜单选项</p>
        <p>3、后台代码不变，只需要按(表单CURD)复制修改即可</p>
      </div>
      <div class="fun">
        <h4 class="title">快捷跳转</h4>
        <div class="item-group">
          <div class="item"
               @click="to(item)"
               v-for="(item,index) in link"
               :key="index">

            <van-icon :style="{background:item.color}"
                      :name="item.icon" />
            <br>
            <span>{{item.text}}</span>
          </div>
        </div>
      </div>
      <div class="fun">
        <h4 class="title">H5组件文档</h4>
        <div class="item-group">
          <div class="item"
               @click="to(item)"
               v-for="(item,index) in doc"
               :key="index">

            <van-icon :style="{background:item.color}"
                      :name="item.icon" />
            <br>
            <span>{{item.text}}</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { Icon } from "vant";
import Swipe from "./index/Swipe";
export default {
  components: {
    "van-icon": Icon,
    "swipe-index": Swipe,
  },
  data () {
    return {
      link: [
        { text: "菜  单", icon: "coupon-o", path: "/menu", color: "#f91261" },
        { text: "表  单", icon: "apps-o", path: "/stat", color: "#ff9c0a" },
        { text: "社  圈", icon: "tv-o", path: "/community", color: "#33a4fd" },
        { text: "我  的", icon: "user-circle-o", path: "/user", color: "#07e610" }
      ],
      doc: [{ text: "table组件", icon: "comment-o", path: "/doc_table", color: "#ff9c0a" },
      { text: "表单组件", icon: "comment-o", path: "/doc_form", color: "#33a4fd" },
      { text: "table组件", icon: "comment-o", path: "/doc_table", color: "#ff9c0a" },
      { text: "表单组件", icon: "comment-o", path: "/doc_form", color: "#33a4fd" }]
    };
  },
  methods: {
    to (item) {
      this.$router.push({ path: item.path });
    }
  }
};
</script>
<style lang="less" scoped>
.vol-index-contanier {
  position: absolute;
  top: 51px;
  bottom: 65px;
  width: 100%;
  overflow: scroll;
}
.vol-index {
  height: 100%;
  background: #f7f7f7;
}
.vol-index-title {
  background: white;
  border-bottom: 1px solid #eee;
  line-height: 50px;
  height: 50px;
  padding-left: 1rem;
  letter-spacing: 1px;
  img {
    position: relative;
    height: 17px;
    top: 5px;
    margin-right: 0.5rem;
  }
}
</style>
<style lang="less" scoped>
.v-success {
  border: 1px solid #8ce6b0;
  background-color: #edfff3;
  position: relative;
  /* padding: 8px 48px 8px 16px; */
  border-radius: 4px;
  color: #515a6e;
  font-size: 14px;
  line-height: 12px;
  margin-bottom: 10px;
  padding: 0 10px;
  font-size: 12px;
  margin: 10px 0;
  color: #404b50;
  letter-spacing: 1px;
}
.fun {
  .title {
    padding: 0 17px;
    margin: 10px 0;
    font-weight: 500;
  }
  .item-group {
    background: white;
    padding: 10px;
    .item {
      text-align: center;
    }
    i {
      margin-bottom: 7px !important;

      line-height: 40px;
      width: 40px;
      text-align: center;

      color: white;
      border-radius: 50%;
      font-size: 23px;
      /* padding: 0; */
      margin: 0;
      position: relative;
      left: 0;
    }
    span {
      font-size: 14px;
    }
    display: flex;
    .item {
      flex: 1;
    }
  }
}
</style>