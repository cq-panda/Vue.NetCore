<template>
  <div class="login-contianer xx" style="  box-shadow: 0px 4px 21px rgb(214, 214, 214);">
    <Menu mode="horizontal" style="margin-bottom: 30px;" active-name="1">
      <MenuItem name="1">
        <Icon type="ios-paper" />帐号登陆
      </MenuItem>
      <MenuItem name="2">
        <Icon type="ios-people" />手机登陆
      </MenuItem>
    </Menu>
    <Form :model="userInfo" :label-width="80">
      <FormItem>
        <Input
          size="large"
          v-model="userInfo.userName"
          prefix="ios-contact"
          clearable
          placeholder="输入用户名"
        />
      </FormItem>
      <FormItem>
        <Input
          size="large"
          type="password"
          clearable
          v-model="userInfo.passWord"
          prefix="ios-lock"
          placeholder="输入密码"
        />
      </FormItem>
      <FormItem>
        <Alert type="error">
        测试帐号：admin666  密码:123456
        <br>
        本地超级管理员帐号：admin  密码:123456
        </Alert>
        <!-- <CheckboxGroup v-model="userInfo.checkbox">
          <Checkbox label="记住密码"></Checkbox>
        </CheckboxGroup>-->
      </FormItem>
      <FormItem>
        <Button size="large" type="primary" @click="login" long>登陆</Button>
      </FormItem>
      <FormItem>
        <div>
          <div>
            <a href="javascript:void(0)">注册</a>
            <a style="float:right" href="javascript:void(0)">忘记密码</a>
          </div>
        </div>
      </FormItem>
    </Form>
  </div>
</template>
<script>
export default {
  data() {
    return {
      userInfo: { userName: "", passWord: "", checkbox: [] }
    };
  },
  methods: {
    login() {
      if (this.userInfo.userName == "" || this.userInfo.userName.trim() == "")
        return this.$Message.error("请输入用户名");

      if (this.userInfo.passWord == "" || this.userInfo.passWord.trim() == "")
        return this.$Message.error("请输入密码");

      this.http
        .post(
          "/api/user/login",
          {
            userName: this.userInfo.userName,
            passWord: this.userInfo.passWord
          },
          "正在登陆...."
        )
        .then(result => {
          if (!result.status) return this.$Message.error(result.message);
          this.$Message.info("登陆成功,正在跳转!");
          this.$store.commit("setUserInfo", result.data);
          this.$router.push({ path: "/" });
        });
    }
  }
};
</script>
<style scoped>
.login-contianer >>> input {
  border: 0px;
  border-bottom: 1px solid #cecdcd;
  border-radius: 0px;
}
</style>

<style lang="less" scoped>
input:-webkit-autofill {
  box-shadow: 0 0 0px 1000px white inset;
}
.login-contianer {
  border-radius: 5px;
  padding: 30px;
  padding-bottom: 5px;
  transform: translateY(-50%);
  top: 45%;
  position: absolute;
  margin: 0 auto;
  left: 0;
  width: 400px;
  line-height: 300px;
  right: 0;
  text-align: center;
  box-shadow: 0px 4px 21px rgb(214, 214, 214);
}
</style>
<style scoped>
.login-contianer >>> .ivu-form .ivu-form-item-content {
  margin-left: 0px !important;
}
</style>
<style>
input:-webkit-autofill,
input:-webkit-autofill:hover,
input:-webkit-autofill:focus {
  -webkit-box-shadow: 0 0 0px 1000px white inset !important;
  box-shadow: 0 0 0 60px #eee inset;
  -webkit-text-fill-color: #878787;
}
</style>


