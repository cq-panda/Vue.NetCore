<template>
  <div>
    <div class="head">
      <Icon type="ios-arrow-back" />个人中心
    </div>
    <div class="info">
      <div>
        <img
          src="https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/u%3D1407034680%2C1803900872%26fm%3D26%26gp%3D0.jpg"
        />
      </div>
      <div>
        <span class="name">哈哈HaHa...</span>
        <br />
        <Tag color="success">富三代</Tag>
        <Tag color="orange">土豪</Tag>
      </div>
    </div>
    <div class="list">
      <div @click="link(item)" class="row" v-for="(item,index) in list" :key="index">
        <div class="text">
          <Icon :color="item.color" :type="item.icon" />
          {{item.text}}
        </div>
        <div>
          <Icon type="ios-arrow-forward" />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      list: [
        { text: "消息", icon: "ios-chatbubbles", path: "", color: "#0ebf8f" },
        { text: "等级", icon: "logo-buffer", path: "", color: "#e00b9c" },
        { text: "足迹", icon: "md-compass", path: "", color: "#FF9800" },
        { text: "我有话说", icon: "md-contact", path: "", color: "#03A9F4" },
        { text: "修改密码", icon: "md-key", path: "", color: "#F44336" },
        { text: "绑定邮箱", icon: "ios-mail", path: "", color: "#e00b9c" },
        {
          text: "我的社圈",
          icon: "ios-globe-outline",
          path: "",
          color: "#0ebf8f"
        },
        { text: "分享", icon: "md-git-merge", path: "", color: "#F44336" },
        { text: "关于我们", icon: "md-contacts", path: "", color: "#FF9800" },
        { text: "安全退出", icon: "md-compass", path: "", color: "#03A9F4" }
      ]
    };
  },
  methods: {
    link(item) {
      this.$message.error(item.text);
    }
  }
};
</script>

<style lang="less" scoped>
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
  margin-top: 50px;
  padding: 1rem;
  background: white;
  color: #ff9800;
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
  margin-top: 0.6rem;
  background: white;
  width: 100%;
  display: inline-block;
  .row {
    cursor: pointer;
    width: 100%;
    padding: 0.9rem;
    border-bottom: 1px solid #f3f3f3;
    display: flex;

    .text {
      font-size: 0.9rem;
      i {
        position: relative;
        font-size: 1.3rem;
      }
    }
    > div:last-child {
      flex: 1;
      text-align: right;
    }
  }
}
</style>
