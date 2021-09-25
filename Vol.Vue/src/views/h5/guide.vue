<template>
  <div class="app-guide">
    <Divider>
      <icon type="md-phone-portrait" />
      <span>移动app/H5开发</span>
    </Divider>
    <br> <br>
    <div class="guide"
         style="    padding: 0 17%;">
      <div>
        <h3>安卓扫描下载(使用的HBuilder打包)</h3>
        <img src="https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/qrapk.png" />
      </div>
      <div style="margin-left: 30px;">
        <h3>手机浏览器访问</h3>
        <img src="https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/qrcode.png" />
      </div>
    </div>
    <br>
    <Divider>
      <icon type="md-phone-portrait" />
      <span>移动打包APK后截图H5-UI</span>
    </Divider>
    <div class="img-item">
      <img src="https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/h521.png" />
      <img src="https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/h520.png" />
    </div>
    <div class="img-item">
      <img src="https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/h01.png" />
      <img src="https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/h02.png" />
    </div>
    <div class="img-item">
      <img src="https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/h03.png" />
      <img src="https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/h04.png" />
    </div>
    <div class="img-item">
      <img src="https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/screen/s01.jpg" />
      <img src="https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/screen/s02.jpg" />
    </div>
    <div class="img-item">
      <img src="https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/screen/s03.jpg" />
      <img src="https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/screen/s04.jpg" />
    </div>
    <div class="img-item">
      <img src="https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/screen/s05x.png" />
      <img src="https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/screen/s06.jpg" />
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style lang="less" scoped>
.app-guide {
  position: absolute;
  width: 900px;
  left: 0;
  right: 0;
  margin: 0 auto;
  padding: 20px;
  .img-item {
    display: inline-block;
    margin-top: 25px;
    background: #fbfbfb;
    display: inline-block;
    padding: 28px;
    border: 1px solid #eee;
    border-radius: 5px;
    > img:first-child {
      margin-right: 3%;
    }
    img {
      width: 48.5%;
      float: left;
    }
  }
  .guide {
    display: flex;
    h3 {
      text-align: center;
    }
    .desc {
      flex: 1;
      margin-left: 56px;
      .content {
        letter-spacing: 1.8px;
      }
    }
  }
}
</style>