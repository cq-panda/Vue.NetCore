<template>
  <div class="user-info">
    <div class="left">
      <div>
        <img class="header-img" :src="userInfo.img" :onerror="errorImg" />
        <div class="text">
          <p class="name">
            <span>{{ userInfo.userName }}</span>
          </p>
          <p class="date">
            <span>注册日期：{{ userInfo.createDate }}</span>
          </p>
          <p>
            <el-button
              style="padding: 3px 16px"
              @click="modifyImg"
              type="primary"
              size="mini"
              ghost
              >修改头像</el-button
            >
          </p>
        </div>
      </div>

      <div style="padding: 17px">
        <el-button
          type="error"
          @click="modifyPwd"
          size="small"
          icon="md-lock"
          long
          >修改密码</el-button
        >
      </div>
    </div>
    <div class="right">
      <vol-form
        ref="form"
        :load-key="true"
        :width="500"
        :formRules="editFormOptions"
        :formFileds="editFormFields"
      >
        <div class="footer">
          <el-button
            style="margin-top: 2px"
            type="primary"
            size="small"
            icon="md-checkmark-circle"
            long
            @click="modifyInfo"
            >保存</el-button
          >
        </div>
      </vol-form>
    </div>
    <VolBox
      :width="500"
      :height="260"

      v-model="modifyOptions.model"
      title="修改密码"
    >
      <div style="padding:10px;20px;">
        <VolForm
          ref="pwd"
          :formRules="modifyOptions.data"
          :formFileds="modifyOptions.fileds"
        ></VolForm>
        <el-button
          type="info"
          size="large"
          icon="md-checkmark-circle"
          long
          @click="savePwd"
          >保存</el-button
        >
      </div>
    </VolBox>
  </div>
</template>
<script>
import VolForm from "@/components/basic/VolForm.vue";
export default {
  components: {
    VolForm: VolForm,
    VolBox: () => import("@/components/basic/VolBox.vue"),
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
      this.http.post(url, {}, true).then((x) => {
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
    },
  },
  created() {
    this.http.post("/api/user/getCurrentUserInfo", {}, true).then((x) => {
      if (!x.status) {
        return this.$message(x.message);
      }
      x.data.createDate = (x.data.createDate || "").replace("T", " ");
      x.data.gender = x.data.gender + "";
      this.$refs.form.reset(x.data);
      this.userInfo.img = this.base.getImgSrc(
        x.data.headImageUrl,
        this.http.ipAddress
      );
      this.userInfo.createDate = x.data.createDate;
      this.userInfo.userName = x.data.userTrueName;
      this.userInfo.phoneNo = x.data.phoneNo;
      this.userInfo.email = x.data.email;
      //   this.editFormFields = x.data;
    });
  },
  data() {
    return {
      errorImg: 'this.src="' + require("@/assets/imgs/error-img.png") + '"',
      modifyOptions: {
        model: false,
        fileds: { oldPwd: "", newPwd: "", newPwd1: "" },
        data: [
          [
            {
              columnType: "string",
              required: true,
              title: "旧密码",
              field: "oldPwd",
            },
          ],
          [
            {
              type: "password",
              required: true,
              title: "新密码",
              field: "newPwd",
            },
          ],
          [
            {
              type: "password",
              required: true,
              title: "确认密码",
              field: "newPwd1",
            },
          ],
        ],
      },
      binging: [{}],
      userInfo: {
        img: "",
        createDate: "--",
        userName: "--",
        email: "",
        phoneNo: "",
      },
      editFormFields: {
        roleName: "",
        userName: "",
        userTrueName: "",
        address: "",
        gender: "",
        remark: "",
      },
      editFormOptions: [
        [
          {
            columnType: "string",
            title: "用户名",
            field: "userName",
            disabled: true,
          },
        ],
        [
          {
            columnType: "string",
            title: "角色",
            field: "roleName",
            disabled: true,
            type: "text",
          },
        ],
        [
          {
            columnType: "string",
            title: "真实姓名",
            field: "userTrueName",
            required: true,
            type: "text",
          },
        ],
        [
          {
            columnType: "string",
            title: "地址",
            field: "address",
            type: "text",
          },
        ],
        [
          {
            dataKey: "gender",
            title: "性别",
            field: "gender",
            data: [],
            type: "select",
          },
        ],
        [
          {
            columnType: "string",
            title: "备注",
            field: "remark",
            colSize: 12,
            type: "textarea",
          },
        ],
      ],
    };
  },
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
    box-shadow: #d6d6d6 0px 4px 21px;
    position: absolute;
    transform: translateY(-40%);
    top: 40%;
    /* position: relative; */
    margin: 0 auto;
    left: 0;
    width: 950px;
    right: 0;
    text-align: center;
    padding: 0px;
    padding: 20px;
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


