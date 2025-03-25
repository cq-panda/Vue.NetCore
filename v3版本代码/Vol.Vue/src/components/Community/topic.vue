<template>
  <div calss="topic-container">
    <div class="topic-item" v-for="(item,index) in topicList" :key="index">
      <div class="t-head">
        <span class="t-title">{{item.title}}</span>
        <span class="t-date">{{item.date}}</span>
      </div>
      <div class="t-content">{{item.content}}</div>
      <div class="t-imgs t-img-group">
        <img v-for="(imgItem,imgIndex) in item.imgs" v-bind:src="imgItem" :key="imgIndex">
      </div>
      <div class="t-foot">
        <mu-icon value="favorite" color="red"></mu-icon>
        <!-- <mu-icon value="favorite_border" color="#9E9E9E"></mu-icon> -->
        <mu-icon value="comment" color="#FF9800"></mu-icon>
        <mu-icon value="thumb_down" color="#9a9696"></mu-icon>
        <mu-icon value="thumb_up" color="#717171"></mu-icon>
        <mu-icon value="share" color="#FF9800"></mu-icon>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      topicList: [
        {
          title: "简析奶牛养殖日常管理措施",
          date: "2019/01/02",
          content:
            "奶牛品种好的奶牛品种是养好奶牛的前提条件。奶牛品种较多，优良的品种会带来良好的经济效益",
          imgs: [
            "http://5b0988e595225.cdn.sohucs.com/images/20171222/05d3da057987447eadc086a9d5f73607.jpeg",
            "http://img2.imgtn.bdimg.com/it/u=1626432153,2187095201&fm=26&gp=0.jpg",
            "http://5b0988e595225.cdn.sohucs.com/images/20171222/05d3da057987447eadc086a9d5f73607.jpeg"
          ]
        },
        {
          title: "70年代和80年代的人做事想法有什么不同？",
          date: "2019/01/02",
          content:
            "做事想法不同不仅仅是年代的原因,更是同年代生活环境家教等因素",
          imgs: [
            "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=4163331685,2790113869&fm=26&gp=0.jpg",
            "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2904646390,4246516581&fm=26&gp=0.jpg",
            "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=291003056,1889578209&fm=26&gp=0.jpg"
          ]
        },
        {
          title: "简析奶牛养殖日常管理措施",
          date: "2019/01/02",
          content:
            "奶牛品种好的奶牛品种是养好奶牛的前提条件。奶牛品种较多，优良的品种会带来良好的经济效益",
          imgs: [
            "http://5b0988e595225.cdn.sohucs.com/images/20171222/05d3da057987447eadc086a9d5f73607.jpeg",
            "http://img2.imgtn.bdimg.com/it/u=1626432153,2187095201&fm=26&gp=0.jpg",
            "http://5b0988e595225.cdn.sohucs.com/images/20171222/05d3da057987447eadc086a9d5f73607.jpeg"
          ]
        },
        {
          title: "70年代和80年代的人做事想法有什么不同？",
          date: "2019/01/02",
          content:
            "做事想法不同不仅仅是年代的原因,更是同年代生活环境家教等因素",
          imgs: [
            "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=4163331685,2790113869&fm=26&gp=0.jpg",
            "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2904646390,4246516581&fm=26&gp=0.jpg",
            "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=291003056,1889578209&fm=26&gp=0.jpg"
          ]
        },
        {
          title: "简析奶牛养殖日常管理措施",
          date: "2019/01/02",
          content:
            "奶牛品种好的奶牛品种是养好奶牛的前提条件。奶牛品种较多，优良的品种会带来良好的经济效益",
          imgs: [
            "http://5b0988e595225.cdn.sohucs.com/images/20171222/05d3da057987447eadc086a9d5f73607.jpeg",
            "http://img2.imgtn.bdimg.com/it/u=1626432153,2187095201&fm=26&gp=0.jpg",
            "http://5b0988e595225.cdn.sohucs.com/images/20171222/05d3da057987447eadc086a9d5f73607.jpeg"
          ]
        },
        {
          title: "70年代和80年代的人做事想法有什么不同？",
          date: "2019/01/02",
          content:
            "做事想法不同不仅仅是年代的原因,更是同年代生活环境家教等因素",
          imgs: [
            "http://5b0988e595225.cdn.sohucs.com/images/20171222/05d3da057987447eadc086a9d5f73607.jpeg",
            "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2904646390,4246516581&fm=26&gp=0.jpg",
            "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=291003056,1889578209&fm=26&gp=0.jpg"
          ]
        }
      ]
    };
  }
};
</script>
<style scoped>
.topic-container {
  height: 100%;
}
.topic-item {
  background: white;
  margin: 10px;
  box-shadow: 2px 2px 10px #d0d0d0;
  /* margin-bottom: 10px; */
  border-radius: 5px;
  padding: 12px;
  padding-bottom: 9px;
}
.t-imgs img {
  height: 65px;
  width: 32%;
  border-radius: 4px;
}
.t-img-group img:first-child {
  margin-right: 2%;
}
.t-img-group img:last-child {
  margin-left: 2%;
}
.topic-item .t-head {
  padding: 5px;
}
.topic-item .t-title {
  font-size: 20px;
  color: #3c3c3c;
}
.topic-item .t-date {
  font-size: 12px;
  float: right;
  margin-top: 9px;
  color: #ff9800;
}
.topic-item .t-foot {
  padding-top: 5px;
}
.topic-item .t-content {
  padding: 0px 5px 8px 5px;
  font-size: 17px;
  color: #9e9e9e;
}
.topic-item .t-foot i {
  padding: 3px 2px 0 2px;
  font-size: 19px !important;
}
.topic-item .t-foot i:last-child {
  float: right;
}
</style>

