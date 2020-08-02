<template>
  <div class="user-info">
    <div class="info">
      <div>
        <img
          src="https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/u%3D1407034680%2C1803900872%26fm%3D26%26gp%3D0.jpg"
        />
      </div>
      <div>
        <span class="name">{{userInfo.userName}}</span>
        <br />
        <van-tag plain type="primary">标签1</van-tag>
        <van-tag plain type="success">标签2</van-tag>
      </div>
    </div>
    <div class="list">
      <div
        @click="link(item)"
        class="row"
        :class="{group:item.group}"
        v-for="(item,index) in list"
        :key="index"
      >
        <div class="text">
          <van-icon :color="item.color" :name="item.icon" />
          {{item.text}}
        </div>
        <div>
          <van-icon name="arrow" />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import VolHeader from "@/components/VolHeader.vue";
import { Tag, Icon } from "vant";
export default {
  components: {
    "vol-header": VolHeader,
    "van-tag": Tag,
    "van-icon": Icon
  },
  created() {
    this.userInfo = this.$store.getters.getUserInfo();
  },
  data() {
    return {
      userInfo: {},
      list: [
        { text: "我的消息", icon: "chat-o", path: "", color: "#0ebf8f" },
        { text: "绑定邮箱", icon: "envelop-o", path: "", color: "#e00b9c" },
        { text: "我的社圈", icon: "home-o", path: "", color: "#0ebf8f" },
        {
          text: "分享App",
          icon: "good-job-o",
          path: "",
          color: "#F44336",
          group: true
        },
        { text: "关于我们", icon: "user-circle-o", path: "", color: "#FF9800" },
        {
          text: "安全退出",
          icon: "cash-back-record",
          path: "/login",
          color: "#03A9F4",
          group: true
        }
      ]
    };
  },
  methods: {
    link(item) {
      if (!item.path) {
         return  this.$toast('没有配置好path');
      }
      this.$store.commit("clearUserInfo");
      this.$router.push({ path: item.path });
    }
  }
};
</script>

<style lang="less" scoped>
.user-info {
  background: #f5f5f5ee;
  height: 100%;
  .group {
    margin-top: 15px;
  }
}
.head {
  top: 0;
  position: fixed;
  background: #03a9f4;
  padding: 0.8rem;
  font-size: 1rem;
  color: white;
  width: 100%;
  z-index: 999;
}
.info {
  padding: 1rem;
  background: #4775f9;
  color: white;
  font-size: 16px;
  display: inline-block;
  width: 100%;
  > div {
    float: left;
  }
  > div:last-child {
    line-height: 2.2rem;
    margin-left: 2rem;
  }
  img {
    height: 70px;
    width: 70px;
    border-radius: 50%;
    margin-right: 0px;
    top: 4px;
    position: relative;

    border: 2px solid #eaeaea;
  }
}
.list {
  margin-top: 13px;

  width: 100%;
  display: inline-block;
  .row {
    background: white;
    cursor: pointer;
    width: 100%;
    padding: 12px 19px;
    border-bottom: 1px solid #f3f3f3;
    display: flex;

    .text {
      font-size: 0.9rem;
      i {
        position: relative;
        font-size: 1.1rem;
        top: 4px;
        margin-right: 5px;
      }
    }
    > div:last-child {
      flex: 1;
      text-align: right;
      padding-right: 35px;
      color: #e4e4e4;
      font-size: 13px;
      /* line-height: 24px; */
      padding-top: 3px;
    }
  }
}
</style>
