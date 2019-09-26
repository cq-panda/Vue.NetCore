<template>
  <div class="app-guide">
    <Divider>
      <icon type="md-phone-portrait" />
      <span>移动H5开发及打包</span>
    </Divider>
  <br>  <br> 
    <div class="guide">
      <div>
        <h3>安卓扫描下载</h3>
        <img src="https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5/QRCode.png" />
      </div>
      <div class="desc">
        <Timeline>
          <TimelineItem>
            <p class="time"></p>
            <p class="time content">当前项目可直接进行纯页面H5开发移动App应用。如果对原生硬件接口要求不高,可使用HBuilder打包成Apk。
              使用HBuilder打包时,在HBuilder中使用Iframe标签指向当前H5的Url即可。
            </p>
          </TimelineItem>
          <TimelineItem>
            <p class="time content">H5前端开发建议使用Vux或Muse-UI作为组件。</p>
          </TimelineItem>
          <TimelineItem>
            <p class="time content">本地H5开发时建议使用谷歌浏览器切换至手机模式,在当前项目Views->H5文件夹开发。</p>
          </TimelineItem>
          <TimelineItem>
            <p class="time content">手机浏览器输入http://132.232.2.109/app/或http://localhost:8080/app/home/查看。</p>
            <p class="content content">PC使用谷歌浏览器按F12进入开发者模式,选择左边设备工具,切换至手机模式。</p>
          </TimelineItem>
          <TimelineItem>
            <p class="time content">安卓直接扫描下左边二维码下载Apk安装</p>
          </TimelineItem>
        </Timeline>
      </div>
    </div>
      <br>
    <Divider>
      <icon type="md-phone-portrait" />
      <span>移动打包APK后截图H5-UI</span>
    </Divider>
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
      .content{
          letter-spacing: 1.8px;
      }
    }
  }
}
</style>