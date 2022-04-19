<template>
  <div>
    <el-Alert type="success" show-icon>
  
        <h4 style="color: #2196F3;">
          -- 此后台验证封装目的是为了增加代码复用性、尽量避免自己写if esle判断提交的参数。
        </h4>
        <p>1、后台实体复用：同一个实体，不同的接口验证的字段不同，需要注册对应字段。</p>
        <p>2、普通多参数验证：普通参数可用于任何参数名相同的接口。</p>
        <p>3、具体使用参照：ObjectActionValidatorExampleController，具体注入验证规则参照：ValidatorContainer.cs</p>
    </el-Alert>
    <br />
    <div class="validator">
      <div class="general">
        <div class="v1">
          <h2>验证所有普通参数</h2>
          <div class="v-input">
            <label>
              <i class="require">*</i>用户名：
            </label>
            <el-input size="small" v-model="userName1" style="width: 230px" placeholder="输入用户名" />
          </div>
          <div class="v-input">
            <label style="font-size: 12px;">
              <i class="require">*</i>手机号：
            </label>
            <el-input size="small" v-model="phoneNo1" style="width: 230px" placeholder="输入手机号" />
          </div>
          <div class="btn">
            <el-button type="success" size="mini" @click="test1()" long>提交验证test1</el-button>
          </div>
        </div>

        <div class="v2">
          <h2>只验证手机号</h2>
          <div class="v-input">
            <label>用户名：</label>
            <el-input size="small" v-model="userName2" style="width: 230px" placeholder="输入用户名" />
          </div>
          <div class="v-input">
            <label style="font-size:12px;">
              <i class="require">*</i>手机号：
            </label>
            <el-input size="small" v-model="phoneNo2" style="width: 230px" placeholder="输入手机号" />
          </div>
          <div class="btn">
            <el-button type="success" size="mini" @click="test2()" long>提交验证test2</el-button>
          </div>
        </div>
        <div class="v3">
          <h2>验证字符长度与数字大小</h2>
          <div class="v-input">
            <label>
              <i class="require">*</i>所在地：
            </label>
            <el-input size="small" v-model="local" style="width: 230px" placeholder="长度[6-10]" />
          </div>
          <div class="v-input">
            <label>
              <i class="require">*</i>存货量：
            </label>
            <el-input size="small" v-model="qty" style="width: 230px" placeholder="值范围[200-500]" />
          </div>
          <div class="btn">
            <el-button type="success" size="mini" @click="test3()" long>提交验证test3</el-button>
          </div>
        </div>
      </div>

      <div class="object-model">
        <div class="v4">
          <h2>实体校验指定字段：用户名、密码</h2>
          <div class="v-input">
            <label>
              <i class="require">*</i>用户名：
            </label>
            <el-input size="small" v-model="loginInfo1.userName" style="width: 230px" placeholder="输入用户名" />
          </div>
          <div class="v-input">
            <label>
              <i class="require">*</i>密 码：
            </label>
            <el-input size="small" v-model="loginInfo1.passWord" style="width: 230px" placeholder="输入密码" />
          </div>
          <div class="v-input">
            <label>验证码：</label>
            <el-input size="small" v-model="loginInfo1.VerificationCode" style="width: 230px" placeholder="输入验证码" />
          </div>
          <div class="btn">
            <el-button type="success" size="mini" @click="test4()" long>提交验证test4</el-button>
          </div>
        </div>

        <div class="v5">
          <h2>实体校验指定字段：密码</h2>
          <div class="v-input">
            <label>用户名：</label>
            <el-input size="small" v-model="loginInfo2.userName" style="width: 230px" placeholder="输入用户名" />
          </div>
          <div class="v-input">
            <label>
              <i class="require">*</i>密 码：
            </label>
            <el-input size="small" v-model="loginInfo2.passWord" style="width: 230px" placeholder="输入密码" />
          </div>
          <div class="v-input">
            <label>验证码：</label>
            <el-input size="small" v-model="loginInfo2.VerificationCode" style="width: 230px" placeholder="输入验证码" />
          </div>
          <div class="btn">
            <el-button type="success" size="mini" @click="test5()" long>提交验证test5</el-button>
          </div>
        </div>

        <div class="v6">
          <h2>实体字段：用户名、密码，普通参数</h2>
          <div class="v-input">
            <label>
              <i class="require">*</i>用户名：
            </label>
            <el-input size="small" v-model="loginInfo3.userName" style="width: 230px" placeholder="输入用户名" />
          </div>
          <div class="v-input">
            <label>
              <i class="require">*</i>密 码：
            </label>
            <el-input size="small" v-model="loginInfo3.passWord" style="width: 230px" placeholder="输入密码" />
          </div>
          <div class="v-input"  style="font-size:12px;">
            <i class="require">*</i>手机号：
            <el-input size="small" v-model="phoneNo6" style="width: 230px" placeholder="输入手机号" />
          </div>
          <div class="btn">
            <el-button type="success" size="mini" @click="test6()" long>提交验证test6</el-button>
          </div>
        </div>
      </div>
    </div>
    <br />
    <br />
  </div>
</template>
<script>
export default {
  data() {
    return {
      userName1: "",
      phoneNo1: "",
      userName2: "",
      phoneNo2: "",
      local: "",
      qty: "",
      phoneNo6: "",
      loginInfo1: {
        userName: "",
        passWord: "",
        VerificationCode: ""
      },
      loginInfo2: {
        userName: "",
        passWord: "",
        VerificationCode: ""
      },
      loginInfo3: {
        userName: "",
        passWord: ""
      }
    };
  },
  methods: {
    test1() {
      let url =
        "validatorExample/test1?userName=" +
        this.userName1 +
        "&phoneNo=" +
        this.phoneNo1;
      this.http.post(url, {}, "正在验证参数").then(x => {
        this.$Message.info(x.message || x);
      });
    },
    test2() {
      let url =
        "validatorExample/test2?userName=" +
        this.userName1 +
        "&phoneNo=" +
        this.phoneNo1;
      this.http.post(url, {}, "正在验证参数").then(x => {
        this.$Message.info(x.message || x);
      });
    },
    test3() {
      let url =
        "validatorExample/test3?local=" + this.local + "&qty=" + this.qty;
      this.http.post(url, {}, "正在验证参数").then(x => {
        this.$Message.info(x.message || x);
      });
    },
    test4() {
      let url = "validatorExample/test4";
      this.http.post(url, this.loginInfo1, "正在验证参数").then(x => {
        this.$Message.info(x.message || x);
      });
    },
    test5() {
      let url = "validatorExample/test5";
      this.http.post(url, this.loginInfo2, "正在验证参数").then(x => {
        this.$Message.info(x.message || x);
      });
    },
    test6() {
      let url = "validatorExample/test6?phoneNo=" + this.phoneNo6;
      this.http.post(url, this.loginInfo3, "正在验证参数").then(x => {
        this.$Message.info(x.message || x);
      });
    }
  }
};
</script>
<style lang="less" scoped>
.validator {
  text-align: center;
  padding: 10px 30px;
}
.general,
.object-model {
  display: inline-block;
  //display: flex;
  > div {
    // flex: 1;
    width: 300px;
    float: left;
    // padding: 0 30px;
    margin-right: 50px;
  }
  .v-input,
  .btn {
    margin-top: 20px;
  }
  .btn {
    padding-right: 4px;
    padding-left: 13px;
  }
  .require {
    color: red;
    position: relative;
    top: 2px;
    margin-right: 5px;
  }
  label {
    display: inline-block;
    width: 60px;
    text-align: right;
    font-size: 12px;
  }
}
.object-model {
  margin-top: 40px;
}
h2 {
  font-size: 16px;
  text-align: left;
  font-weight: 500;
  padding-left: 14px;
}
</style>