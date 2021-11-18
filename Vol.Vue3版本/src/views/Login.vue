<template>
  <div class="bg">
    <div class="content">
      <div class="l-left">
        <div class="desc">
          <div class="title">
            vol.vue<span style="
                font-size: 13px;
                background: #46c706;
                border-radius: 24px;
                padding: 4px 9px;
                border: 1px solid;
                margin-left: 5px;
              ">vue3.x</span>
          </div>
          <p>后台</p>
          <p>.NetCore、EntityFrameWorkCore、Dapper、Redis</p>
          <p>Vue、Promise、Vuex、IView、Element-UI</p>
          <p>演示账号：admin666 密码:123456</p>
          <p>本地账号：admin &nbsp; &nbsp; &nbsp; 密码:123456</p>
          <div style="margin-top: 30px"
               class="link">
            <a href="https://github.com/cq-panda/Vue.NetCore"
               target="_blank">
              <span>GitHub</span></a>
            <a href="https://gitee.com/x_discoverer/Vue.NetCore"
               target="_blank">
              <span>Gitee</span></a>
            <a href="http://v2.volcore.xyz/"
               target="_blank">
              <span>Vue2版本</span></a>
            <a href="http://v2.volcore.xyz/document/guide"
               target="_blank">
              <span>框架文档</span></a>
          </div>
        </div>
      </div>
      <div class="login">
        <div class="login-contianer">
          <div class="login-form">
            <h2>账号登陆</h2>
            <div class="v-tag">Vue3.x版本</div>
            <div class="form-user"
                 @keypress="loginPress">
              <div class="item">
                <div class="f-text">
                  <label> 用户名： </label>
                </div>
                <div class="f-input">
                  <input type="text"
                         v-focus
                         v-model="userInfo.userName"
                         placeholder="输入用户" />
                </div>
              </div>
              <div class="item">
                <div class="f-text">
                  <label> 密&nbsp;&nbsp;&nbsp;码： </label>
                </div>
                <div class="f-input">
                  <input type="password"
                         v-focus
                         v-model="userInfo.password"
                         placeholder="输入密码" />
                </div>
              </div>
              <div class="item">
                <div class="f-text">
                  <label> 验证码： </label>
                </div>
                <div class="f-input">
                  <input v-focus
                         type="text"
                         v-model="userInfo.verificationCode"
                         placeholder="输入验证码" />
                </div>
                <div class="code"
                     @click="getVierificationCode">
                  <img v-show="codeImgSrc != ''"
                       :src="codeImgSrc" />
                </div>
              </div>
            </div>
            <div class="loging-btn">
              <el-button size="large"
                         :loading="loading"
                         type="primary"
                         @click="login"
                         long>
                <span v-if="!loading">登陆</span>
                <span v-else>正在登陆...</span>
              </el-button>
            </div>
            <div class="action">
              <a href="http://v2.volcore.xyz/"
                 target="_blank">
                <span>查看Vue2版本</span></a>
              <a @click="() => {}">注册</a>
              <a @click="() => {}">忘记密码</a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="l-bg"></div>
    <div class="r-bg"></div>

    <div class="login-footer">
      <a @click="openUrl('https://github.com/cq-panda/Vue.NetCore')">
        GitHub
      </a>
      <a @click="openUrl('https://gitee.com/x_discoverer/Vue.NetCore')">
        Gitee
      </a>
      <a @click="openUrl('http://v2.volcore.xyz/')"> Vue2版本 </a>
      <a>QQ1群：45221949(已满)</a>
      <a>QQ2群：913189178</a>
      <a style="text-decoration: none;" href="https://beian.miit.gov.cn/" target="_blank">京ICP备19056538号-1</a>
    </div>
  </div>
</template>
<script>
import { defineComponent, ref, reactive, toRefs, getCurrentInstance } from "vue";
import { useRouter, useRoute } from "vue-router";
import store from "../store/index";
import http from "@/../src/api/http.js";
export default defineComponent({
  setup (props, context) {
    const loading = ref(false);
    const codeImgSrc = ref("");
    const userInfo = reactive({
      userName: "",
      password: "",
      verificationCode: "",
      UUID: undefined,
    });

    const getVierificationCode = () => {
      http.get("/api/User/getVierificationCode").then((x) => {
        codeImgSrc.value = "data:image/png;base64," + x.img;
        userInfo.UUID = x.uuid;
      });
    };
    getVierificationCode();

    let appContext = getCurrentInstance().appContext;
    let $message = appContext.config.globalProperties.$message;
    let router = useRouter();

    const login = () => {
      if (!userInfo.userName) return $message.error("请输入用户名");
      if (!userInfo.password) return $message.error("请输入密码");
      if (!userInfo.verificationCode) {
        return $message.error("请输入验证码");
      }
      loading.value = true;
      http
        .post("/api/user/login", userInfo, "正在登陆....")
        .then((result) => {
          if (!result.status) {
            loading.value = false;
            getVierificationCode();
            return $message.error(result.message);
          }
          $message.success("登陆成功,正在跳转!");
          store.commit("setUserInfo", result.data);
          router.push({ path: "/" });
        });
    };
    const loginPress = (e) => {
      if (e.keyCode == 13) {
        login();
      }
    };
    const openUrl = (url) => {
      window.open(url, "_blank");
    };
    return {
      loading,
      codeImgSrc,
      getVierificationCode,
      login,
      userInfo,
      loginPress,
      openUrl,
    };
  },
  directives: {
    focus: {
      inserted: function (el) {
        el.focus();
      },
    },
  },
});
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
.loging-btn {
  button {
    width: 100%;
  }
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
    background-image: linear-gradient(135deg, #0d82ff 10%, #0cd7bd);
    border: 1px solid #5c87ff;
  }
}

.desc {
  text-align: left;
  width: 450px;
  padding: 10px 30px;
  box-sizing: border-box;
  height: 100%;
}

.desc p {
  font-size: 15px;
  color: white;
  line-height: 30px;
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
  margin: 25px 0;

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
      text-align: left;
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
    position: relative;
    overflow: hidden;
    // margin-top: 25px;
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
    padding: 10px 30px 40px 30px;
    width: 400px;
    min-height: 340px;
    background: white;
    height: 400px;
    box-shadow: 0px 4px 21px #d6d6d6;
    h2 {
      font-weight: 500;
      padding: 10px 0px;
      text-align: left;
      margin-top: 15px;
    }
    .v-tag {
      top: -23px;
      text-align: center;
      position: absolute;
      background: #eee;
      right: -43px;
      line-height: 49px;
      top: -17px;
      padding-left: 21px;
      font-size: 12px;
      width: 158px;
      background: #5fbd30;
      padding-top: 25px;
      color: white;
      -webkit-transform: rotate(40deg);
      letter-spacing: 2px;
    }
  }
}

.loging-btn {
  margin-top: 20px;
}
.action {
  text-align: right;
  margin-top: 20px;
  font-size: 12px;
  color: #9c9c9c;
  cursor: pointer;
  a {
    margin-left: 20px;
  }
}
.login-footer {
  cursor: pointer;
  padding: 10px;
  text-align: center;
  font-size: 14px;
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
.link a {
  text-decoration: none;

  color: #ffff;
  border: 1px solid #ffff;
  width: 80px;
  margin-right: 5px;
  display: inline-block;
  margin-bottom: 0;
  font-weight: 400;
  text-align: center;
  touch-action: manipulation;
  cursor: pointer;
  background-image: none;

  white-space: nowrap;
  user-select: none;
  padding: 5px 15px 6px;
  font-size: 12px;
  border-radius: 32px;
}
</style>
<style  scoped>
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



