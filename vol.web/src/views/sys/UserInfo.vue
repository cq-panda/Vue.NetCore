<template>
  <input
    ref="inputRef"
    type="file"
    accept=".png, .jpg, .jpeg"
    style="display: none"
    @change="handleChange"
    :multiple="false"
  />
  <VolBox :width="400" v-model="modifyOptions.model" title="修改密码">
    <vol-form
      ref="pwdFormRef"
      :formRules="modifyOptions.data"
      :formFields="modifyOptions.fields"
    ></vol-form>
    <template #footer>
      <div class="center">
        <el-button type="primary" plain size="small" long @click="savePwd"
          >保存</el-button
        >
      </div>
    </template>
  </VolBox>
  <div class="user-info">
    <div class="user-content">
      <div class="left">
        <img
          class="header-img"
          @click="showUpload"
          :src="http.ipAddress + userInfo.headImageUrl"
        />
        <div class="text">
          <p class="name center">
            <span style="font-size: 13px">{{ userInfo.userName }}</span>
          </p>
          <p class="date">
            <span>注册日期：{{ userInfo.createDate }}</span>
          </p>
          <p>
            <el-button plain @click="modifyPwd" size="small">修改密码</el-button>
            <el-button style="padding: 3px 16px" @click="showUpload" plain type="primary"
              >修改头像</el-button
            >
          </p>
        </div>
      </div>
      <div class="right">
        <vol-form
          ref="formRef"
          labelPosition="top"
          :load-key="true"
          :width="500"
          :formRules="editFormOptions"
          :formFields="userInfo"
        >
          <div class="footer center">
            <el-button
              style="margin-top: 2px"
              type="primary"
              size="small"
              @click="modifyInfo"
              >保存</el-button
            >
          </div>
        </vol-form>
      </div>
    </div>
  </div>
</template>
<script setup>
import { ref, reactive, getCurrentInstance, nextTick } from "vue";
const { proxy } = getCurrentInstance();
const modifyOptions = reactive({
  model: false,
  fields: { oldPwd: "", newPwd: "", newPwd1: "" },
  data: [
    [{ required: true, title: "旧密码", type: "password", field: "oldPwd" }],
    [{ type: "password", required: true, title: "新密码", field: "newPwd" }],
    [{ type: "password", required: true, title: "确认密码", field: "newPwd1" }],
  ],
});
const userInfo = reactive({
  headImageUrl: "",
  createDate: "--",
  userName: "--",
  userTrueName: "",
  remark: "",
  email: "",
  phoneNo: "",
});
const editFormOptions = reactive([
  [{ columnType: "string", title: "账号", field: "userName", disabled: true }],
  [{ columnType: "string", title: "姓名", field: "userTrueName", required: true }],
  [{ dataKey: "gender", title: "性别", field: "gender", data: [], type: "select" }],
  [{ columnType: "string", title: "备注", field: "remark", type: "textarea" }],
]);
const modifyPwd = () => {
  modifyOptions.model = true;
};

const pwdFormRef = ref();
const savePwd = () => {
  if (!pwdFormRef.value.validate()) return;
  if (modifyOptions.fields.newPwd != modifyOptions.fields.newPwd1) {
    return proxy.$message.error("两次密码不一致");
  }
  let url = "api/user/modifyPwd";
  const params = {
    newPwd: modifyOptions.fields.newPwd,
    oldPwd: modifyOptions.fields.oldPwd,
  };
  proxy.http.post(url, params, true).then((x) => {
    if (!x.status) {
      return proxy.$message.error(x.message);
    }
    modifyOptions.model = false;
    proxy.$message.success(x.message);
    pwdFormRef.value.reset();
  });
};

const formRef = ref();
const modifyInfo = () => {
  formRef.value.validate(() => {
    proxy.http.post("api/user/updateUserInfo", userInfo).then((result) => {
      proxy.$message.success(proxy.$ts(result));
      let user = proxy.$store.getters.getUserInfo();
      user.img = userInfo.headImageUrl;
      user.userName = userInfo.userTrueName;
      proxy.$store.commit("setUserInfo", user);
    });
  });
};
const inputRef = ref();
const showUpload = () => {
  inputRef.value.click();
};

const handleChange = (e) => {
  var forms = new FormData();
  let file = e.target.files[0];
  forms.append("fileInput", file, file.name);
  const url = "api/sys_user/upload";
  proxy.http
    .post(url, forms, true, {
      headers: { "Content-Type": "multipart/form-data" },
    })
    .then((x) => {
      userInfo.headImageUrl = x.data + file.name;
      modifyInfo();
    });
};
proxy.http.post("/api/user/getCurrentUserInfo", {}, true).then((x) => {
  if (!x.status) {
    return proxy.$message.error(x.message);
  }
  x.data.createDate = (x.data.createDate || "").replace("T", " ");
  x.data.gender = x.data.gender + "";
  nextTick(() => {
    formRef.value.reset(x.data);
  });
  userInfo.img = proxy.base.getImgSrc(x.data.headImageUrl, proxy.http.ipAddress);
  Object.assign(userInfo, x.data);
});
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
  right: 0;
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
    justify-content: center;
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 320px;
    border-right: 1px solid #eee;
  }
  .right {
    padding-left: 30px;
    width: 400px;
  }
}
.date {
  letter-spacing: 0px;
  font-size: 12px;
  color: #282828;
}
.footer {
  width: 100%;
}
.center {
  text-align: center;
}
</style>
