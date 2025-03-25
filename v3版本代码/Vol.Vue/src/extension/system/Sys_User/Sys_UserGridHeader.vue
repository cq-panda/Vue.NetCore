<template>
  <div>
    <vol-box :model.sync="model" :padding="30" title="修改密码" :width="450" :height="200">
      <Alert type="info">
        <h3>
          <span>帐号：{{row.UserName}}</span>
          <span>用户：{{row.UserTrueName}}</span>
        </h3>
      </Alert>
      <div>
        <Input
          placeholder="请输入密码"
          v-model="password"
          size="large"
          style="  width: 100%;margin-top: 15px;"
        >
          <Icon type="ios-lock" slot="prefix" />
        </Input>
      </div>
      <div slot="footer">
        <Button type="info" size="large" icon="md-checkmark-circle" @click="savePwd()">修改密码</Button>
        <Button
          type="info"
          size="large"
          icon="md-close"
          @click="()=>{this.model=false}"
        >关闭</Button>
      </div>
    </vol-box>
  </div>
</template>
<script>
export default {
  components: {
    VolBox: () => import("@/components/basic/VolBox.vue"),
  },
  data() {
    return {
      row: {},
      password: "",
      model: false,
    };
  },
  methods: {
    open(row) {
      this.password="";
      this.row = row;
      this.model = true;
    },
    savePwd() {
      if (!this.password) return this.$Message.error("请输密码");
      if (this.password.length < 6)
        return this.$Message.error("密码长度至少6位");
      let url =
        "/api/user/modifyUserPwd?password=" +
        this.password +
        "&userName=" +
        this.row.UserName;
      this.http.post(url, {}, true).then((x) => {
        if (!x.status) {
          return this.$message.error(x.message);
        }
        this.model = false;
        this.$Message.success(x.message);
      });
    },
  },
  created() {},
};
</script>
<style lang="less" scoped>
h3 {
  font-weight: 500;
  > span:last-child {
    margin-left: 30px;
  }
}
</style>