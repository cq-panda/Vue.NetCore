<template>
  <div class="user-info">
    <div class="left">
      <div>
        <img class="header-img" :src="userInfo.img" />
        <div class="text">
          <p class="name">
            <span>{{userInfo.userName}}</span>
          </p>
          <p class="date">
            <span>注册日期：{{userInfo.createDate}}</span>
          </p>
          <p>
            <Button
              style="padding: 3px 16px;"
              @click="modifyImg"
              type="info"
              size="small"
              ghost
            >修改头像</Button>
          </p>
        </div>
      </div>
      <Divider>
        <span icon="ios-settings">信息绑定</span>
      </Divider>
      <Card class="binding-group" shadow>
        <CellGroup>
          <Cell :title="'手机：'+(userInfo.phoneNo||'未绑定')">
            <Button
              type="success"
              size="small"
              @click="modifyPhone"
              icon="md-phone-portrait"
              slot="extra"
            >修改手机</Button>
          </Cell>
          <Cell :title="'邮箱：'+(userInfo.email||'未绑定')">
            <Button
              type="info"
              size="small"
              @click="modifyEmail"
              icon="ios-mail-outline"
              slot="extra"
            >绑定邮箱</Button>
          </Cell>
        </CellGroup>
      </Card>
      <div style="padding: 17px;">
        <Button type="error" @click="modifyPwd" size="large" icon="md-lock" long>修改密码</Button>
      </div>
    </div>
    <div class="right">
      <vol-form ref="form" :width="500" :formRules="editFormOptions" :formFileds="editFormFileds">
        <div slot="header">
          <Divider>
            <span class="ivu-icon ios-alert-outline">个人信息</span>
          </Divider>
        </div>
        <div slot="footer">
          <Button
            style="margin-top: 2px;"
            type="info"
            size="large"
            icon="md-checkmark-circle"
            long
            @click="modifyInfo"
          >保存</Button>
        </div>
      </vol-form>
    </div>
    <VolBox :width="500" :footer="false" :model.sync="modifyOptions.model" title="修改密码">
      <div style="padding:10px;20px;">
        <VolForm ref="pwd" :formRules="modifyOptions.data" :formFileds="modifyOptions.fileds"></VolForm>
        <Button type="info" size="large" icon="md-checkmark-circle" long @click="savePwd">保存</Button>
      </div>
      <div slot="footer">
        <span></span>
      </div>
    </VolBox>
  </div>
</template>
<script>
import VolForm from "@/components/basic/VolForm.vue";
export default {
  components: {
    VolForm: VolForm,
    VolBox: () => import("@/components/basic/VolBox.vue")
  },
  methods: {
    modifyImg() {
      this.$message.info("修改头像");
    },
    modifyEmail() {
      this.$message.info("修改邮箱");
    },
    modifyPhone() {
      this.$message.info("修改电话");
    },
    modifyPwd() {
      this.$refs.pwd.reset();
      this.modifyOptions.model = true;
    },
    savePwd() {
      if (!this.$refs.pwd.validate()) return;
      if (
        this.modifyOptions.fileds.newPwd != this.modifyOptions.fileds.newPwd1
      ) {
        return this.$message.error("两次密码不一致");
      }
      let url =
        "/api/user/modifyPwd?oldPwd=" +
        this.modifyOptions.fileds.oldPwd +
        "&newPwd=" +
        this.modifyOptions.fileds.newPwd;
      this.http.post(url, {}, true).then(x => {
        if (!x.status) {
          return this.$message.error(x.message);
        }
        this.modifyOptions.model = false;
        this.$Message.success(x.message);
        this.$refs.pwd.reset();
      });
    },
    modifyInfo() {
      this.$message.info("修改个人信息");
    }
  },
  created() {
    this.http.post("/api/user/getCurrentUserInfo", {}, true).then(x => {
      if (!x.status) {
        return this.$message(x.message);
      }
      x.data.createDate = (x.data.createDate || "").replace("T", " ");
      x.data.gender = x.data.gender + "";
      this.$refs.form.reset(x.data);
      this.userInfo.img = x.data.headImageUrl;
      this.userInfo.createDate = x.data.createDate;
      this.userInfo.userName = x.data.userTrueName;
      this.userInfo.phoneNo = x.data.phoneNo;
      this.userInfo.email = x.data.email;
      //   this.editFormFileds = x.data;
    });
  },
  data() {
    return {
      modifyOptions: {
        model: false,
        fileds: { oldPwd: "", newPwd: "", newPwd1: "" },
        data: [
          [
            {
              columnType: "string",
              required: true,
              title: "旧密码",
              field: "oldPwd"
            }
          ],
          [
            {
              type: "password",
              required: true,
              title: "新密码",
              field: "newPwd"
            }
          ],
          [
            {
              type: "password",
              required: true,
              title: "确认密码",
              field: "newPwd1"
            }
          ]
        ]
      },
      binging: [{}],
      userInfo: {
        img: "",
        createDate: "--",
        userName: "--",
        email: "",
        phoneNo: ""
      },
      editFormFileds: {
        roleName: "",
        userName: "",
        userTrueName: "",
        address: "",
        gender: "",
        remark: ""
      },
      editFormOptions: [
        [
          {
            columnType: "string",
            title: "用户名",
            field: "userName",
            disabled: true
          }
        ],
        [
          {
            columnType: "string",
            title: "角色",
            field: "roleName",
            disabled: true,
            type: "text"
          }
        ],
        [
          {
            columnType: "string",
            title: "真实姓名",
            field: "userTrueName",
            required: true,
            type: "text"
          }
        ],
        [
          {
            columnType: "string",
            title: "地址",
            field: "address",
            type: "text"
          }
        ],
        [
          {
            columnType: "bool",
            dataKey: "gender",
            title: "性别",
            field: "gender",
            data: {
              dicNo: "gender",
              data: [{ key: "1", value: "男" }, { key: "0", value: "女" }]
            },
            type: "drop"
          }
        ],
        [
          {
            columnType: "string",
            title: "备注",
            field: "remark",
            colSize: 12,
            type: "textarea"
          }
        ]
      ]
    };
  }
};
</script>
<style scoped>
.binding-group {
  width: 100%;
  padding-bottom: 20px;
}
.binding-group >>> .ivu-cell-link {
  text-align: left;
}
.binding-group >>> .ivu-card-body {
  padding: 0 16px;
}
.binding-group >>> .ivu-cell-title {
  line-height: 24px;
  font-size: 12px;
}
</style>

<style lang="less" scoped>
img[src=""],
img:not([src]) {
  opacity: 0;
}
.user-info {
  box-shadow: rgb(214, 214, 214) 0px 4px 21px;
  position: absolute;
  transform: translateY(-40%);
  top: 40%;
  position: absolute;
  margin: 0 auto;
  left: 0;
  width: 895px;
  right: 0;
  text-align: center;
  padding: 0px;
  //display: flex;
  .text {
    padding: 5px;
    .name {
      font-weight: bolder;
      font-size: 15px;
      font-weight: 900;
    }
    > p {
      padding-top: 5px;
    }
  }
  .header-img {
    height: 150px;
    width: 150px;
    border-radius: 50%;
    margin-right: 0px;
    top: 4px;
    position: relative;
    border: 3px solid #dfdfdf;
  }
  > div {
    float: left;
    // height: 480px;
    padding-top: 10px;
  }
  .left {
    width: 320px;
    border-right: 1px solid #eee;
    // box-shadow: #d6d6d6 7px 4px 20px;
    // flex: 1;
  }
  .right {
    padding-left: 30px;
    width: 570px;
    // background: #fefefe;
    // flex: 3;
  }
}
</style>


