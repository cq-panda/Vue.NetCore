<template>
  <vol-box v-model="model" :padding="30" title="修改密码" :width="400" :height="180">
    <el-alert type="success" :closable="false">
      <h3>
        <span>{{ $ts("帐号") }}：{{ row.UserName }}</span>
      </h3>
    </el-alert>
    <div>
      <el-input
        :placeholder="$ts('密码')"
        v-model="password"
        size="large"
        style="width: 100%; margin-top: 15px"
      />
    </div>
    <template #footer>
      <div style="text-align: center">
        <el-button @click="model = false">{{ $ts("关闭") }}</el-button>
        <el-button color="#626aef" plain @click="savePwd()">{{
          $ts("修改密码")
        }}</el-button>
      </div>
    </template>
  </vol-box>

</template>

<script setup>

import {  ref, reactive,  getCurrentInstance } from "vue";

const row = ref({});
const password = ref("");
const model = ref(false);
const modelAuth = ref(false);

const modelUser = ref(false);

const userName = ref("");

const userTrueName = ref("");

const open = (_row) => {
  password.value = "";
  row.value = _row;
  model.value = true;
};


const { proxy } = getCurrentInstance();
const savePwd = () => {
  if (!password.value) return proxy.$Message.error(proxy.$ts("请输入密码"));
  if (password.value.length < 6)
    return proxy.$Message.error(proxy.$ts('"密码长度至少6位"'));
  let url = "api/user/modifyUserPwd";
  proxy.http
    .post(url, { password: password.value, userName: row.value.UserName }, true)
    .then((x) => {
      if (!x.status) {
        return proxy.$message.error(proxy.$ts(x.message));
      }
      model.value = false;
      proxy.$Message.success(proxy.$ts(x.message));
    });
};


defineExpose({ open });
</script>

<style lang="less" scoped>
h3 {
  font-weight: 500;

  > span:last-child {
    margin-left: 10px;
  }
}
</style>

<style lang="less" scoped>
::v-deep(.el-table_2_column_12) {
  // align-items: center;
  // display: flex;
  .cell {
    align-items: center;
    display: flex;
  }
}

.user-list {
  display: inline-block;
  width: 100%;
  margin: 0;
  padding: 0;

  // padding: 5px;
  .user-item {
    float: left;
    list-style: none;
    padding: 2px 10px;
    position: relative;
    margin-right: 10px;

    i {
      position: absolute;
      right: 0;
      top: 0;
      right: -5px;
    }
  }

  .user-item:hover {
    cursor: pointer;
    color: #898585;

    i {
      display: inline-block !important;
    }
  }
}

.user-search {
  cursor: pointer;
  width: 90px;
  text-align: center;
  // color: #898585;
}

::v-deep(.el-table__header th) {
  background: #f6f6f6;
  color: #595959;
  font-size: 13px;
}

.search-form {
  padding: 10px 3px;
  display: flex;
  align-items: center;

  .label {
    margin-left: 20px;
  }

  button {
    margin-left: 15px;
  }
}
</style>
