<template >
  <div class="login-container">
    <vol-header :back="false" title="vol.vue-h5演示环境"></vol-header>
    <h2>帐号登陆</h2>
    <div class="login-input">
      <van-field
        size="large"
        v-model="userInfo.userName"
        placeholder="请输入帐号"
        type="text"
        label="帐号"
      />
      <van-field
        size="large"
        v-model="userInfo.password"
        placeholder="请输入密码"
        type="password"
        label="密码"
      />
      <van-field
        v-model="userInfo.verificationCode"
        center
        clearable
        label="验证码"
        placeholder="请输入验证码"
      >
        <template #button>
          <img @click="()=>{getVierificationCode()}" v-show="codeImgSrc!=''" :src="codeImgSrc" />
        </template>
      </van-field>
    </div>
    <div class="login-btn">
      <van-button @click="login()" v-show="!loading" block type="info">登陆</van-button>
      <van-button disabled v-show="loading" block loading type="info" loading-text="正在登陆..." />
    </div>
    <div class="login-account">
      <a>注册</a>
      <a>忘记密码</a>
    </div>
    <van-divider class="login-line" dashed>其他方式登陆</van-divider>
    <div class="login-other">
      <div class="item"></div>
      <div class="item">
        <img src="https://img.yzcdn.cn/vant/share-icon-wechat.png" />
        <br />微信
      </div>
      <div class="item">
        <img src="https://img.yzcdn.cn/vant/share-icon-qq.png" />
        <br />QQ
      </div>
      <div class="item">
        <img src="https://img.yzcdn.cn/vant/share-icon-weibo.png" />
        <br />微博
      </div>
      <div class="item"></div>
    </div>
  </div>
</template>
<script>
import { Field, Divider } from "vant";
import VolHeader from "@/components/VolHeader.vue";
export default {
  components: {
    "vol-header": VolHeader,
    "van-field": Field,
    "van-divider": Divider
  },
  data() {
    return {
      codeImgSrc: "",
      loading: false,
      userInfo: {
        userName: "admin666",
        password: "123456",
        verificationCode: ""
      }
    };
  },
  created() {
    this.getVierificationCode();
  },
  methods: {
    getVierificationCode() {
      this.http.get("/api/User/getVierificationCode").then(x => {
        this.codeImgSrc = "data:image/png;base64," + x.img;
        this.userInfo.UUID = x.uuid;
      });
    },
    login() {
      if (this.userInfo.userName == "" || this.userInfo.userName.trim() == "")
        return this.$Message.error("请输入用户名");
      if (this.userInfo.password == "" || this.userInfo.password.trim() == "")
        return this.$Message.error("请输入密码");
      if (
        this.userInfo.verificationCode == "" ||
        this.userInfo.verificationCode.trim() == ""
      )
        return this.$Message.error("请输入验证码");

      this.loading = true;
      let url = "/api/user/login";
      this.http.post(url, this.userInfo).then(x => {
        this.$toast(x.message);
        if (!x.status) {
          this.loading = false;
          this.getVierificationCode();
          return;
        }
        this.$store.commit("setUserInfo", x.data);
        this.$router.push({ path: "/" });
      });
    }
  }
};
</script>
<style lang="less" scoped>
h2 {
  padding-left: 40px;
  padding-top: 1rem;
  margin-bottom: 8px;
  font-size: 21px;
  font-weight: 500;
  text-align: left;
}
.login-container {
  .login-logo {
    text-align: center;
    img {
      width: 100%;
    }
  }
  .login-input {
    padding: 1rem 1.5rem;
    img {
      height: 20px;
      position: relative;
    }
  }
  .login-btn {
    padding: 1rem 1.5rem;
    > button {
      border-radius: 7px;
    }
  }
  .register {
    text-align: right;
    a {
      color: #a7a7a7;
      padding-right: 1rem;
      font-size: 13px;
    }
  }
  .login-account {
    position: relative;
    padding: 0rem 1.7rem;
    color: #afafaf;
    font-size: 13px;
    a:last-child {
      float: right;
    }
  }
  .login-line {
    margin-top: 1rem;
  }
  .login-other {
    display: flex;
    .item {
      img {
        height: 50px;
      }
      flex: 1;
      text-align: center;
      margin-top: 8px;
      padding: 0 4px;
      color: #646566;
      font-size: 12px;
    }
  }
}
</style>
