<template>
  <div class="message-container">
    <div style="padding: 0 0 20px 10px">
      <el-alert title="关于signalR使用" type="success" show-icon
        ><p>
          1、目前只是用来处理首页消息发送,可参照Index.vue与HomePageMessageHub.cs
        </p>
        <p>
          2、文档见：https://docs.microsoft.com/zh-cn/aspnet/core/signalr/introduction?view=aspnetcore-3.1
        </p></el-alert
      >
    </div>

    <vol-form
      ref="form"
      :formRules="formOptions"
      :labelWidth="90"
      :formFields="formFields"
    >
    </vol-form>
    <div class="btns">
      <el-button
        type="primary"
        @click="sendMessage"
        ><i class="el-icon-chat-line-round"></i>发送消息</el-button
      >
    </div>
  </div>
</template>

<script>
//默认不会自动重连，需手动调用withAutomaticReconnect
let connection;
import * as signalR from '@microsoft/signalr';
import VolForm from '@/components/basic/VolForm.vue';
export default {
  components: {
    'vol-form': VolForm
  },
  data() {
    return {
      message: '',
      size: {
        minRows: 8,
        maxRows: 30
      },
      formOptions: [
        [{ title: '登陆账号', required: true, field: 'userName' }],
        [{ title: '消息标题', required: true, field: 'title' }],
        [
          {
            title: '消息内容',
            required: true,
            field: 'message',
            type: 'textarea',
            minRows: 10
          }
        ]
      ],
      formFields: {
        userName: 'admin666',
        title: '发送标题',
        message: ''
      }
    };
  },
  methods: {
    sendMessage() {
      connection.invoke(
        'sendHomeMessage',
        this.formFields.userName,
        this.formFields.title,
        this.formFields.message || '无'
      );
      this.$message.success('消息发送成功');
    }
  },
  created() {},
  mounted() {
    //获取当前登陆的用户信息
    this.http.post('api/user/GetCurrentUserInfo').then((result) => {
      connection = new signalR.HubConnectionBuilder()
        .withAutomaticReconnect()
        .withUrl(
          `${this.http.ipAddress}message?userName=${result.data.userName}`
        )
        .build();
      connection.qs = { test: 123 };
      connection.start().catch((err) => alert(err.message));
      //自动重连成功后的处理
      connection.onreconnected((connectionId) => {
        console.log(connectionId);
      });
      let _this = this;
      connection.on('ReceiveHomePageMessage', function (message) {
        _this.$notify.info({
          title: '消息',
          message: message + ''
        });
      });
    });
  }
};
</script>
<style scoped lang="less">
.message-container {
  margin: 20px;
  .btns {
    text-align: center;
    padding: 10px;
  }
}
</style>
