<template>
  <div class="app-guide" >
    <br />
    <br />
    <div class="title" style="padding: 0 17%">
      <div>
        <h3>微信小程序</h3>
        <img
          style="width:120px;" src="https://app-1256993465.cos.ap-nanjing.myqcloud.com/wechat.jpg"
        />
      </div>
      <div>
        <h3>安卓扫描下载</h3>
        <img
          style="width:120px;" src="https://app-1256993465.cos.ap-nanjing.myqcloud.com/Android.png"
        />
      </div>
      <div style="margin-left: 30px">
        <h3>手机浏览器访问</h3>
        <img style="width:120px;" src="https://app-1256993465.cos.ap-nanjing.myqcloud.com/H5.png" />
      </div>
    </div>
    <br />
    <div class="imgs">
      <img v-for="(img, index) in imgs" :key="index" :src="img" />
    </div>
    <br />
    <br />
  </div>
</template>

<script>
export default {
  data() {
    return {
      imgs: [
        'https://app-1256993465.cos.ap-nanjing.myqcloud.com/IMG_2069.jpg',
        'https://app-1256993465.cos.ap-nanjing.myqcloud.com/IMG_2074.jpg',
        'https://app-1256993465.cos.ap-nanjing.myqcloud.com/IMG_2075.jpg',
        'https://app-1256993465.cos.ap-nanjing.myqcloud.com/IMG_2071.jpg',
        'https://app-1256993465.cos.ap-nanjing.myqcloud.com/IMG_2070.jpg',
        'https://app-1256993465.cos.ap-nanjing.myqcloud.com/IMG_2072.jpg',
        'https://app-1256993465.cos.ap-nanjing.myqcloud.com/IMG_2073.jpg',
        'https://app-1256993465.cos.ap-nanjing.myqcloud.com/IMG_2076.jpg'
      ]
    };
  }
};
</script>

<style lang="less" scoped>
.imgs {
  width: 1200px;
  position: relative;
  margin: 0 auto;
  left: 0;
  right: 0;
  img {
    width: 23%;
    margin: 10px;
    float: left;
  }
}
.title {
  display: flex;
  > div {
    flex: 1;
    text-align: center;
  }
  h3 {
    padding: 10px;
  }
  img {
    height: 120px;
  }
}
</style>
