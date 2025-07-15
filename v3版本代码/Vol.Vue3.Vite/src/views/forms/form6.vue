<template>
  <div>
    <div class="layout-content">
      <div class="layout-right">
        <h5>其他组件</h5>
        <el-alert show-icon
          >table+表单数据/测试完整示例/表单布局/其他组件，都是对element-plus二次封装，
          只需要按现的方式进行配置json数据及实现方法即可使用</el-alert
        >
        <div class="com">
          <div>
            <h3>手动打开tabs,详细使用见：框架文档->前端开发->手动打开tabs</h3>
            <el-button type="info" size="small" @click="openUserInfo"
              >打开个人中心</el-button
            >
            <el-button
              type="error"
              size="small"
              @click="$tabs.close('/userinfo')"
              >关闭个人中心</el-button
            >
          </div>
          <div>
            <h3>弹出框/post/get请求(http请求代码位置:api->http.js)</h3>
            <el-button type="error" size="small" @click="httpTest1"
              >post/get请求不带提示</el-button
            >
            <el-button type="success" size="small" @click="httpTest2"
              >post/get请求带默认提示</el-button
            >
            <el-button type="info" size="small" @click="httpTest3"
              >post/get请求带自定义提示</el-button
            >
          </div>
          <div>
            <h3>vuex状态管理,vuex代码路径：store->index.js</h3>
            <div style="padding: 10px; max-width: 800px; word-break: break-all">
              {{ userText }}
            </div>
            <el-button type="info" size="small" @click="getUserInfo"
              >获取本地用户信息</el-button
            >
            <el-button type="info" size="small" @click="getPermission"
              >获取本地用户菜单及权限</el-button
            >
            <el-button type="info" size="small" @click="getToken"
              >获取本地用户Token</el-button
            >
          </div>

          <!-- 文件操作 -->
          <div class="d-group" style="margin-top: 30px">
            <div>
              <h3>上传excel文件</h3>
              <UploadExcel
                @importExcelAfter="importAfter"
                :url="url"
              ></UploadExcel>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import UploadExcel from "@/components/basic/UploadExcel.vue";
import Icons from "@/components/basic/Icons.vue";
export default {
  components: { UploadExcel, Icons },
  methods: {
    openUserInfo() {
      this.$tabs.open({
        text: "个人中心",
        path: "/userinfo",
        query: { x: 2221 },
      });
    },
    //每次刷新页面后会重新加载用户的最新信息
    getUserInfo() {
      let userInfo = this.$store.getters.getUserInfo();
      this.userText = JSON.stringify(userInfo);
    },
    getPermission() {
      let permission = this.$store.state.permission;
      this.userText = JSON.stringify(permission);
    },
    getToken() {
      let token = this.$store.getters.getToken();
      this.userText = token;
    },
    importAfter() {
      //上传完成后处理
    },
    onOpenChange(id) {
      this.$essage.error("打开菜单" + id);
    },
    onSelect(id) {
      this.$message.error("菜单点击" + id);
    },
    httpTest1() {
      //不带提示
      let url = "/api/test2019/GetMsg",
        param = {};
      this.http.post(url, param).then((result) => {
        this.$message.error(result);
      });
    },
    httpTest2() {
      //带默认提示
      let url = "/api/test2019/delay",
        param = {};
      this.http.post(url, param, true).then((result) => {
        this.$message.error(result);
      });
    },
    httpTest3() {
      //自定义提示
      //第三个参数loadText为是否显示加载提示，默认为false,不显示任何提示，如果设置为true默认加载提示文字为[正在处理中]，也可以自下定义显示的文字,http请求的代码位置:src->api->http.js
      //demo上
      let url = "/api/test2019/delay",
        param = {},
        loadText = "这里参数可以自定文字";
      this.http.post(url, param, loadText).then((result) => {
        this.$message.error(result);
      });
    },
  },
  created() {},
  data() {
    return {
      userText: "",
      viewModel: false,
      iconModel: false,
      icon: "ivu-icon ivu-icon-logo-android",
      url: "", //上传的url
      template: {
        //下载模板的路径及模板的文件名，如果url为空，则不会显示下载模板
        url: "/api/App_TransactionAvgPrice/DownLoadTemplate",
        fileName: "测试模板下载",
      },
      comSrc1: "",
      comSrc:
        "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x2.jpg",
    };
  },
};
</script>
<style lang="less" scoped>
.layout-content {
  position: relative;
  width: 1000px;
  left: 0;
  margin: 0;
  margin: auto;
  display: flex;
  .layout-left {
    width: 200px;
    margin-right: 10px;
  }
  .layout-right {
    flex: 1;
  }
}
.com > div {
  margin-top: 30px;
}
.d-group {
  display: inline-block;
  width: 100%;
  > div {
    float: left;
    width: 49%;
  }
  > div:first-child {
    margin-right: 2%;
  }
}
.on-icon {
  line-height: 20px;
  position: relative;
  .remove {
    display: none;
    color: red;
    right: 7px;
    position: absolute;
    top: -14px;
    font-size: 13px;
  }
}
</style>
