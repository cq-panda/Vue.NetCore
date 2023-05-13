<template>
  <div class="login-container">
    <div class="project-name">VOL开发框架,Vue3版本</div>
    <div class="login-form">
      <div class="form-user" @keypress="loginPress">
        <div class="login-text">
          <div>
            <div>欢迎登录...</div>
            <div class="login-line"></div>
          </div>
          <div style="flex:1;"></div>
        </div>
        <div class="login-text-small">WELCOME TO LOGIN</div>
        <div class="item">
          <div class="input-icon el-icon-user"></div>
          <input type="text" v-focus v-model="userInfo.userName" placeholder="请输入账号" />
        </div>
        <div class="item">
          <div class="input-icon el-icon-lock"></div>
          <input type="password" v-focus v-model="userInfo.password" placeholder="请输入密码" />
        </div>
        <div class="item">
          <div class="input-icon el-icon-mobile"></div>

          <input v-focus type="text" v-model="userInfo.verificationCode" placeholder="输入验证码" />
          <div class="code" @click="getVierificationCode">
            <img v-show="codeImgSrc != ''" :src="codeImgSrc" />
          </div>
        </div>
      </div>
      <div class="loging-btn">
        <el-button size="large" :loading="loading" color="#3a6cd1" :dark="true" @click="login" long>
          <span v-if="!loading">登录</span>
          <span v-else>正在登录...</span>
        </el-button>
      </div>

      <!-- 账号信息 -->
      <div class="account-info">
        <p>演示账号：admin666 &nbsp; &nbsp;密码:123456</p>
        <p>本地账号：admin &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;密码:123456</p>
        <p><a href="https://jq.qq.com/?_wv=1027&k=Sqstuy0M" style="text-decoration: none"
            target="_blank">QQ3群:743852316</a>
          &nbsp; &nbsp;&nbsp; &nbsp;
          <a href="http://v2.volcore.xyz/document/guide" style="text-decoration: none" target="_blank">框架文档</a>
        </p>
      </div>
      <!-- 链接位置 -->
      <div class="app-link" >
        <a href="#" style="text-decoration: none">移动端扫码</a>
        <a>
          <i class="el-icon-chat-dot-round"></i> 小程序
          <img src="https://app-1256993465.cos.ap-nanjing.myqcloud.com/wechat.jpg" /></a>
        <a>
          <i class="el-icon-apple"></i>
          Android
          <img src="https://app-1256993465.cos.ap-nanjing.myqcloud.com/Android.png" /></a>
        <a>
          <i class="el-icon-document"></i>
          H5
          <img src="https://app-1256993465.cos.ap-nanjing.myqcloud.com/H5.png" /></a>
      </div>
    </div>

    <!-- 页面底部 -->
    <div class="login-footer">
      <a style="text-decoration: none" href="https://beian.miit.gov.cn/" target="_blank">京ICP备19056538号-1</a>


      <a href="https://dotnet9.com/" style="text-decoration: none" target="blank">Dotnet9</a>
      <a href="https://space.bilibili.com/525836469" style="text-decoration: none" target="blank">NET视频教程(微软MVP-ACE录制)</a>
      <a href="https://www.cctalk.com/m/group/90268531" style="text-decoration: none" target="blank">VOL框架视频</a>
      <a href="http://120.48.115.252:9990" style="text-decoration: none" target="blank">视频演示地址</a>
    </div>

    <img class="login-bg" src="/static/login_bg.png" />
  </div>
</template>


<script >
import {
  defineComponent,
  ref,
  reactive,
  toRefs,
  getCurrentInstance
} from 'vue';
import { useRouter, useRoute } from 'vue-router';
import store from '../store/index';
import http from '@/../src/api/http.js';
export default defineComponent({
  setup(props, context) {
    store.commit('clearUserInfo', '');
    const loading = ref(false);
    const codeImgSrc = ref('');
    const userInfo = reactive({
      userName: '',
      password: '',
      verificationCode: '',
      UUID: undefined
    });

    const getVierificationCode = () => {
      http.get('/api/User/getVierificationCode').then((x) => {
        codeImgSrc.value = 'data:image/png;base64,' + x.img;
        userInfo.UUID = x.uuid;
      });
    };
    getVierificationCode();

    let appContext = getCurrentInstance().appContext;
    let $message = appContext.config.globalProperties.$message;
    let router = useRouter();

    const login = () => {
      if (!userInfo.userName) return $message.error('请输入用户名');
      if (!userInfo.password) return $message.error('请输入密码');
      if (!userInfo.verificationCode) {
        return $message.error('请输入验证码');
      }
      loading.value = true;
      http.post('/api/user/login', userInfo, '正在登录....').then((result) => {
        if (!result.status) {
          loading.value = false;
          getVierificationCode();
          return $message.error(result.message);
        }
        $message.success('登录成功,正在跳转!');
        store.commit('setUserInfo', result.data);
        router.push({ path: '/' });
      });
    };
    const loginPress = (e) => {
      if (e.keyCode == 13) {
        login();
      }
    };
    const openUrl = (url) => {
      window.open(url, '_blank');
    };
    return {
      loading,
      codeImgSrc,
      getVierificationCode,
      login,
      userInfo,
      loginPress,
      openUrl
    };
  },
  directives: {
    focus: {
      inserted: function (el) {
        el.focus();
      }
    }
  }
});
</script>
<style lang="less" scoped>
.login-container {
  display: flex;
  width: 100%;
  height: 100%;
  background: rgb(246, 247, 252);
  justify-content: flex-end;
  align-items: center;
}

.login-form {
  align-items: center;
  width: 50%;
  display: flex;
  flex-direction: column;
  // margin-right: 150px;
  z-index: 999;

  .form-user {
    // margin: 25px 0;

    .item {
      border-radius: 5px;
      border: 1px solid #ececec;
      display: flex;
      margin-bottom: 30px;
      background: #ffff;
      height: 45px;
      padding-left: 20px;
      display: flex;

      .code {
        position: relative;
        cursor: pointer;
        width: 74px;
        padding: 5px 10px 0 0;
      }

      .input-icon {
        line-height: 45px;
        color: #7a7a7a;
        padding-right: 20px;
      }
    }
  }

  input:-webkit-autofill {
    box-shadow: 0 0 0px 1000px white inset;
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
}

.form-user,
.loging-btn {
  width: 400px;
}

.loging-btn {
  box-shadow: 2px 4px 11px #a4c2ff;
  margin-top: 10px;

  button {
    padding: 21px;
    font-size: 14px !important;
    width: 100%;
  }
}

.login-text {
  font-weight: bolder;
  font-size: 20px;
  letter-spacing: 2px;

  position: relative;
  display: flex;

  .login-line {
    z-index: -1;
    padding: 5px;
    position: relative;
    top: -8px;
    width: 100%;
    background-image: linear-gradient(to right, #6598ff, white);
  }
}

.login-text-small {
  margin-bottom: 20px;
  font-size: 13px;
  color: #7d7c7c;
}

.login-bg {
  left: 0;
  position: absolute;
  height: 100%;
  width: 50%;
  z-index: 0;
}

.project-name {
  position: absolute;
  top: 40px;
  left: 40px;
  z-index: 9999;
  font-weight: bolder;
  background-image: linear-gradient(to right, #1850c1, #9c009c);
  -webkit-background-clip: text;
  color: transparent;
  font-size: 25px;
}
</style>
<style lang="less" scoped>
.app-link {
  // font-weight: bolder;
  text-align: center;
  padding-top: 5px;
  font-size: 12px;
  width: 400px;
  padding-left: 40px;
  display: flex;

  a {
    flex: 1;
    position: relative;
    cursor: pointer;
    width: 70px;
    color: #666666;
    margin: 2px 10px 0 0;
  }

  img {
    display: none;
  }

  a:hover {
    color: #0545f6 !important;

    img {
      display: block;
      position: absolute;
      z-index: 999999999;
      top: -130px;
      width: 120px;
      left: -22px;

      border: 1px solid #b1b1b1;
    }
  }
}

.login-footer {
  position: absolute;
  width: 50%;
  bottom: 0.5rem;
  font-size: 12px;
  text-align: center;
  padding-bottom: 10px;
  color: #4f4f4f;

  a {
    margin-right: 10px;
    font-size: 12px;
    color: #4f4f4f;
  }

  div {
    margin-bottom: 5px;
  }

  a:hover {
    cursor: pointer;
    color: #0540e3 !important;
  }
}

.account-info {
  font-size: 12px;
  color: #636363;
  margin-top: 15px;
}
</style>

<style lang="less" scoped>
@media screen and (max-width: 700px) {

  .login-bg,
  .account-info,
  .app-link,
  .login-footer,
  .project-name {
    display: none;
  }

  .login-container {
    padding: 2rem;
    justify-content: center;
  }

  .login-form {
    width: 100%;
  }

  .form-user,
  .loging-btn {
    width: 100%;
  }
}
</style>