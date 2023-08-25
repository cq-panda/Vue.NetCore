<template>
  <input ref="input" type="file" accept=".png, .jpg, .jpeg" style="display: none" @change="handleChange"
    :multiple="false" />
  <VolBox :width="500" :height="270" v-model="modifyOptions.model" title="修改密码">
    <div style="padding:10px;20px;">
      <VolForm ref="pwd" :formRules="modifyOptions.data" :formFields="modifyOptions.fields"></VolForm>
    </div>
    <template #footer>
      <div style="text-align: center;">
        <el-button type="primary" plain size="mini" long @click="savePwd">保存</el-button>
      </div>
    </template>
  </VolBox>
  <div class="user-info">
    <div class="user-content">
      <div class="left">
        <div>
          <img class="header-img" @click="showUpload" :src="http.ipAddress + userInfo.headImageUrl" :onerror="errorImg" />
          <div class="text">
            <p class="name">
              <span style="font-size: 13px">{{ userInfo.userName }}</span>
            </p>
            <p class="date">
              <span>注册日期：{{ userInfo.createDate }}</span>
            </p>
            <p>
              <el-button type="error" @click="modifyPwd" size="small" plain long>修改密码</el-button>
              <el-button style="padding: 3px 16px" @click="showUpload" plain type="primary" size="mini"
                ghost>修改头像</el-button>
            </p>
          </div>
        </div>
      </div>
      <div class="right">
        <vol-form ref="form" :load-key="true" :width="500" :formRules="editFormOptions" :formFields="userInfo">
          <div class="footer">
            <el-button style="margin-top: 2px" type="primary" size="small" long @click="modifyInfo">保存</el-button>
          </div>
        </vol-form>
      </div>
    </div>

  </div>
</template>
<script>
import VolForm from "@/components/basic/VolForm.vue";
import VolBox from "@/components/basic/VolBox.vue";
export default {
  components: {
    VolForm,
    VolBox,
  },
  methods: {
    modifyPwd() {
      this.modifyOptions.model = true;
    },
    savePwd() {
      if (!this.$refs.pwd.validate()) return;
      if (
        this.modifyOptions.fields.newPwd != this.modifyOptions.fields.newPwd1
      ) {
        return this.$message.error("两次密码不一致");
      }
      let url =
        "/api/user/modifyPwd?oldPwd=" +
        this.modifyOptions.fields.oldPwd +
        "&newPwd=" +
        this.modifyOptions.fields.newPwd;
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
      this.$refs.form.validate(() => {
        this.http.post('api/user/updateUserInfo', this.userInfo).then(result => {
          this.$message.success(result);
          let userInfo = this.$store.getters.getUserInfo();
          userInfo.img = this.userInfo.headImageUrl;
          userInfo.userName = this.userInfo.userTrueName;
          this.$store.commit('setUserInfo', userInfo);
        })
      })

    },
    showUpload() {
      this.$refs.input.click();
    },
    handleChange(e) {
      var forms = new FormData();
      let file = e.target.files[0]
      forms.append('fileInput', file, file.name);
      const url = 'api/sys_user/upload'
      this.http
        .post(url, forms, true)
        .then(
          (x) => {
            this.userInfo.headImageUrl = x.data + file.name;
            this.modifyInfo();
          }
        );
    }
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
      Object.assign(this.userInfo, x.data);
    });
  },
  data() {
    return {
      errorImg: 'this.src="' + require("@/assets/imgs/error-img.png") + '"',
      modifyOptions: {
        model: false,
        fields: { oldPwd: "", newPwd: "", newPwd1: "" },
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
      userInfo: {
        headImageUrl: "",
        createDate: "--",
        userName: "--",
        userTrueName: "",
        remark: "",
        email: "",
        phoneNo: "",
      },
      editFormOptions: [
        [
          {
            columnType: "string",
            title: "账号",
            field: "userName",
            disabled: true,
          },
        ],
        [
          {
            columnType: "string",
            title: "姓名",
            field: "userTrueName",
            required: true,
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

<style lang="less" scoped>
img[src=""],
img:not([src]) {
  opacity: 0;
}

.user-content {
  display: flex;
}

.user-info {

  position: absolute;
  justify-content: center;
  align-items: center;
  display: flex;
  margin: 0 auto;
  left: 0;
  // width: 950px;
  right: 0;
  text-align: center;
  padding: 0px;

  height: 100%;

  .text {
    padding: 5px;

    .name {
      font-weight: bolder;
      font-size: 15px;
      font-weight: 900;
    }
  }

  .header-img {
    object-fit: cover;
    height: 150px;
    width: 150px;
    border-radius: 50%;
    margin-right: 0px;
    top: 4px;
    position: relative;
    border: 1px solid #dfdfdf;
    cursor: pointer;
  }

  .left {
    width: 320px;
    border-right: 1px solid #eee;
    // box-shadow: #d6d6d6 7px 4px 20px;
    // flex: 1;
  }

  .right {
    padding-left: 30px;
    width: 400px;
    // background: #fefefe;
    // flex: 3;
  }
}

.date {
  letter-spacing: 0px;
  font-size: 12px;
  color: #282828;
}
</style>


