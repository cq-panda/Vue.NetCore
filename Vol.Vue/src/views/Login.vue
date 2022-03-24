<template>
  <div class="bg">
    <div class="content">
      <div class="l-left">
        <div class="desc">
          <div class="title">vol.vue<span style="font-size:13px;background:#46c706;border-radius:24px;padding:4px 9px;border:1px solid;margin-left:5px;" >vue2.x</span></div>
          <p>后台</p>
          <p>.NetCore、EntityFrameWorkCore、Dapper、Redis</p>
          <p>Vue、Promise、Vuex、IView、Element-UI</p>
          <p>演示账号：admin666 密码:123456</p>
          <p>本地账号：admin &nbsp; &nbsp; &nbsp; 密码:123456</p>
          <div style="margin-top: 30px">
            <a
              href="https://github.com/cq-panda/Vue.NetCore"
              target="_blank"
              style="
                color: #ffff;
                border: 1px solid #ffff;
                width: 80px;
                margin-right: 5px;
              "
              class="
                index-btn
                ivu-btn ivu-btn-primary ivu-btn-circle ivu-btn-ghost
              "
            >
              <span>GitHub</span></a
            >
            <a
              href="https://gitee.com/x_discoverer/Vue.NetCore"
              target="_blank"
              style="
                color: #ffff;
                border: 1px solid #ffff;
                width: 80px;
                margin-right: 5px;
              "
              class="
                index-btn
                ivu-btn ivu-btn-primary ivu-btn-circle ivu-btn-ghost
              "
            >
              <span>Gitee</span></a
            >
            <a
            @click="$message.info('即将开放')"
              style="
                color: #ffff;
                border: 1px solid #ffff;
                width: 80px;
                margin-right: 5px;
                padding-left:9px;
              "
              class="
                index-btn
                ivu-btn ivu-btn-primary ivu-btn-circle ivu-btn-ghost
              "
            >
              <span>框架小程序</span></a
            >
            <a
              href="http://v2.volcore.xyz/document/guide"
              target="_blank"
              style="color: #ffff; border: 1px solid #ffff"
              class="
                index-btn
                ivu-btn ivu-btn-primary ivu-btn-circle ivu-btn-ghost
              "
            >
              <span>框架文档</span></a
            >
          </div>
        </div>
      </div>
      <div class="login">
        <div class="login-contianer">
          <div class="login-form">
            <h2 style="padding: 17px 0px;font-weight: 500;font-size: 26px;color: #000;">账号登录</h2>
            <div class="form-user" @keypress="loginPress">
              <div class="item">
                <div class="f-text">
                  <label>
                    <!-- <Icon type="ios-people"
                          :size="20" /> -->
                    用户名：
                  </label>
                </div>
                <div class="f-input">
                  <input
                    type="text"
                    v-focus
                    v-model="userInfo.userName"
                    placeholder="输入用户"
                  />
                </div>
                <div class="f-remove" @click="userInfo.userName = ''">
                  <!-- <Icon type="ios-close-circle" /> -->
                </div>
              </div>
              <div class="item">
                <div class="f-text">
                  <label>
                    <!-- <Icon type="ios-lock"
                          :size="20" /> -->
                    密&nbsp;&nbsp;&nbsp;码：
                  </label>
                </div>
                <div class="f-input">
                  <input
                    type="password"
                    v-focus
                    v-model="userInfo.passWord"
                    placeholder="输入密码"
                  />
                </div>
                <div v-focus class="f-remove" @click="userInfo.passWord = ''">
                  <Icon type="ios-close-circle" />
                </div>
              </div>
              <div class="item">
                <div class="f-text">
                  <label>
                    <!-- <Icon type="md-images"
                          v-focus
                          :size="20" /> -->
                    验证码：
                  </label>
                </div>
                <div class="f-input">
                  <input
                    v-focus
                    type="text"
                    v-model="userInfo.verificationCode"
                    placeholder="输入验证码"
                  />
                </div>
                <div class="code" @click="getVierificationCode">
                  <img v-show="codeImgSrc != ''" :src="codeImgSrc" />
                </div>
              </div>
            </div>
            <div style="loging-btn">
              <Button
                size="large"
                :loading="loading"
                type="info"
                @click="login"
                long
              >
                <span v-if="!loading">登录</span>
                <span v-else>正在登录...</span>
              </Button>
            </div>
            <div class="action">
              <a @click="() => {}">注册</a>
              <a @click="() => {}">忘记密码</a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="l-bg"></div>
    <div class="r-bg"></div>
    <!--   <div class="c-bg">
      <div class="c-bg-item"></div>
      <div class="c-bg-item"></div>
      <div class="c-bg-item"></div>
      <div class="c-bg-item"></div>
    </div> -->
    <div class="login-footer">
      <a @click="toGitHub">
        <!-- <Icon type="logo-github" /> -->
        GitHub
      </a>
      <a>QQ群：45221949</a>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      loading: false,
      codeImgSrc: "",
      userInfo: {
        userName: "",
        passWord: "",
        verificationCode: "",
      },
    };
  },
  directives: {
    focus: {
      inserted: function (el) {
        el.focus();
      },
    },
  },
  created() {
    this.getVierificationCode();
  },
  methods: {
    getVierificationCode() {
      this.http.get("/api/User/getVierificationCode").then((x) => {
        this.codeImgSrc = "data:image/png;base64," + x.img;
        this.userInfo.UUID = x.uuid;
      });
    },

    toGitHub() {
      window.open("https://github.com/cq-panda/Vue.NetCore");
    },
    loginPress(e) {
      if (event.keyCode == 13) {
        this.login();
      }
    },
    login() {
      if (this.userInfo.userName == "" || this.userInfo.userName.trim() == "")
        return this.$Message.error("请输入用户名");
      if (this.userInfo.passWord == "" || this.userInfo.passWord.trim() == "")
        return this.$Message.error("请输入密码");
      if (
        this.userInfo.verificationCode == "" ||
        this.userInfo.verificationCode.trim() == ""
      )
        return this.$Message.error("请输入验证码");
      this.loading = true;
      this.http
        .post("/api/user/login", this.userInfo, "正在登录....")
        .then((result) => {
          if (!result.status) {
            this.loading = false;
            this.getVierificationCode();
            return this.$Message.error(result.message);
          }
          this.$Message.info("登录成功,正在跳转!");
          this.$store.commit("setUserInfo", result.data);
          this.$router.push({ path: "/" });
        });
    },
  },
};
</script>

<style lang="less" scoped>
.bg {
  display: flex;
  overflow: hidden;
  position: relative;
  height: 100%;
  width: 100%;
  background-image: linear-gradient(135deg, #24aded 10%, #40b3e8);
}

.login {
  flex: 1;
}

.content {
  display: flex;
  z-index: 99;
  position: relative;
  width: 860px;
  left: 0;
  right: 0;

  margin: 0 auto;
  transform: translateY(-50%);
  // background: #dedede40;
  top: 50%;
  height: 400px;
  border-radius: 10px;
  .l-left {
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
    width: 400px;
  }
}

.desc {
  width: 450px;
  padding: 10px 30px;
  box-sizing: border-box;
  height: 100%;
}

.desc p {
  font-size: 15px;
  color: white;
  line-height: 40px;
}

.desc p:before {
  top: -1px;
  content: "o";
  position: relative;
  margin-right: 7px;
}

.title {
  z-index: 999;
  font-size: 70px;
  font-weight: bold;
  color: white;
}

.l-bg {
  height: 1200px;
  width: 1200px;
  border-radius: 50%;
  background: #2cecff;
  position: absolute;
  top: -700px;
  left: -700px;
  background-image: linear-gradient(135deg, #00a7f5 10%, #0cb3ff);
}

.r-bg {
  height: 2000px;
  width: 2000px;
  border-radius: 50%;
  background: #2cecff;
  position: absolute;
  top: -1500px;
  right: -900px;
  background-image: linear-gradient(135deg, #42c2ff 10%, #1da1dc);
}
</style>

<style lang="less" scoped>
.form-user {
  .f-remove {
    display: none;
  }
  margin: 25px 0;
  .item:hover .f-remove {
    display: block;
  }
  .item {
    display: flex;
    padding-bottom: 5px;
    border-bottom: 1px solid #eee;
    margin-bottom: 30px;
    display: flex;
    .f-text {
      color: #484848;
      font-weight: 400;
      width: 110px;
      font-size: 16px;
      i {
        position: relative;
        top: -1px;
        right: 5px;
      }
    }
    .f-input {
      border: 0px;
      flex: 1;
    }
    .code {
      position: relative;
      cursor: pointer;
      top: -5px;
      width: 74px;
      border: 1px solid #fdfdfd;
      border-radius: 2px;
      height: 35px;
      margin-left: 10px;
    }
  }
}
input:-webkit-autofill {
  box-shadow: 0 0 0px 1000px white inset;
}
.login-contianer {
  .login-form {
    // margin-top: 25px;
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
    padding: 10px 30px 40px 30px;
    width: 400px;
    min-height: 340px;
    background: white;
    height: 400px;
    box-shadow: 2px 5px 18px rgb(100 83 83 / 29%);
  }
}
.login-project {
  line-height: 70px;
  img {
    height: 80px;
  }
  .project-name {
    font-size: 50px;
    position: relative;
    color: white;
    font-weight: 600;
    margin-left: 9px;
  }
  .desc {
    color: wheat;
    font-size: 15px;
  }
}
.loging-btn {
  margin-top: 40px;
}
.action {
  text-align: right;
  margin-top: 20px;
  a {
    margin-left: 20px;
  }
}
.login-footer {
  padding: 10px;
  text-align: center;
  font-size: 16px;
  position: absolute;
  width: 100%;
  bottom: 0px;
  background: #06a3ea;
  border-top: 1px solid #e2e2e2;
  i {
    position: relative;
    top: -2px;
    margin-right: 5px;
  }
  a {
    margin-left: 30px;
    color: #f9ebd0;
  }
}
@media screen and (max-width: 600px) {
  .desc {
    display: none;
  }
  .bg {
    background-image: none;
  }
  .login-form {
    box-shadow: none !important;
  }
  .login-form {
    width: 100% !important;
  }
  .login-footer,
  .r-bg,
  .l-bg {
    display: none;
  }
  .l-left {
    display: none;
  }
  .c-bg-item {
    background: none !important;
  }
}
</style>
<style scoped>
.login-contianer >>> .ivu-form .ivu-form-item-content {
  margin-left: 0px !important;
}
</style>
<style>
input:-webkit-autofill {
  -webkit-box-shadow: 0 0 0px 1000px white inset !important;
}
input {
  background: white;
  display: block;
  box-sizing: border-box;
  width: 100%;
  min-width: 0;
  margin: 0;
  padding: 0;
  color: #323233;
  line-height: inherit;
  text-align: left;
  border: 0;
  outline: none;
  font-size: 16px;
  line-height: 20px;
}
</style>
<style lang="less" scoped>
.c-bg {
  position: absolute;
  width: 100%;
  height: 200px;

  .c-bg-item {
    width: 25%;
    background: #00a7f5;
    height: 200px;
  }
}
</style>



