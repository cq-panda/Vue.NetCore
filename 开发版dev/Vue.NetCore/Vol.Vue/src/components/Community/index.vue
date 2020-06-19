<template>
  <div class="com-container">
    <!-- <div class="com-head">
   
      <span class="title">社区专题</span>
    </div> -->
    <div class="com-body">
      <div>
        <Tabs value="推荐">
          <TabPane v-for="(item, index) in list2" :key="index" :label="item" name="推荐">
            <div>
              <!-- <div style="height:540px;"> -->
              <!-- <el-scrollbar style="height:100%;"> -->
              <div class="tab-swiper vux-center">
                <div v-if="index==0">
                  <div
                    class="info-item"
                    @click="openUrl(ritem)"
                    v-for="(ritem,rindex) in recommend"
                    :key="rindex"
                  >
                    <div class="info-title">
                      <div
                        :class="{'info-text':true,'info-img':ritem.imgs&&ritem.imgs.length==1}"
                      >{{ritem.title}}</div>
                      <div v-if="ritem.imgs&&ritem.imgs.length==1" class="single-img">
                        <img v-bind:src="ritem.imgs[0]" />
                      </div>
                    </div>
                    <div
                      v-if="ritem.imgs&&(ritem.imgs.length>=3||ritem.imgs.length==2)"
                      class="img-group"
                    >
                      <img
                        v-for="(img,imageIndex) in ritem.imgs"
                        :key="imageIndex"
                        v-bind:src="img"
                      />
                    </div>
                    <div class="info-foot">
                      <img v-bind:src="ritem.header" />
                      <span class="author">{{ritem.author}}</span>
                      <span :class="{flag:ritem.flag||false}">{{ritem.flag||""}}</span>
                      <span class="date">{{ritem.date}}</span>
                    </div>
                  </div>
                </div>
              </div>
              <!-- </el-scrollbar> -->
            </div>
          </TabPane>
        </Tabs>
      </div>
    </div>
  </div>
</template>

<script>
import topic from "./topic.vue";
import cow from "./cow.vue";
import question from "./question.vue";

export default {
  components: {
    topic: topic,
    cow: cow,
    question: question
  },
  data() {
    return {
      recommend: [
        {
          title: "当往事已成回忆，我从千万家产到非洲当雇佣兵的日子",
          header:
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/head3.jpg",
          author: "路边社非洲分社",
          date: "5天前",
          flag: "探险",
          imgs: [
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/tj01.jpg",
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/tj02.jpg",
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/tj03.jpg"
          ]
        },
        {
          title: "刚刚老板向我借计算器，我说你算什么东西，然后老板让我发个红包给他道...",
          header: "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/head3.jpg",
          author: "路边社消息",
          date: "1分钟前",
          flag: "置顶",
          link: "",
          imgs: [
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/tj04.jpg",
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/tj05.jpg",
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/tj04.jpg"
          ]
        },
        {
          title:
            "零點糗事的糗事：谁能拥有这样的逗比女朋友，一定是休了八百辈子的福了",
          header: "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/head3.jpg",
          author: "路边社消息",
          date: "5分钟前",
          flag: "置顶",
          link: "",
          imgs: [
           "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/tj04.jpg",
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/tj05.jpg",
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/tj04.jpg"
          ]
        },
        {
          title:
            "广西柳州市融水苗族自治县杆洞乡摩天岭附近出现云海景观，美如仙境",
          header:"https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/head3.jpg",
          author: "路边社消息",
          date: "1分钟前",
          imgs: [
               "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/tj04.jpg",
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/tj05.jpg",
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/tj04.jpg"
          ]
        },
        {
          title: "奶牛养殖的关键技术要点是什么?奶牛发展前景如何?",
          header: "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/head1.jpg",
          author: "路边社北京分社",
          date: "1天前",
          imgs: [
             "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/tj05.jpg"
          ]
        }
      ],
      index: 0,
      demo2: "推荐",
      list2: ["推荐", "经典话题", "分享", "专区"],
      active: 0
    };
  },
  methods: {
    openUrl(item) {
      this.$message.error("功能开发中....");
      //  window.open( "http://118.190.209.59:9910/App/App_TechnicalClassify/20181129/091953.html?token=3AaJlrI2p4tfeDKLdp1q9bAa630QtA3umjuIWHROVss-&rand_t=091953", "_self");
    }
  }
};
</script>
<style scoped >
.com-container {
  border: 1px solid #eee;
  overflow: hidden;
  height: 100%;
}
.com-body {
  width: 100%;
  height: calc(100% - 3rem);
  background: white;
  position: relative;
}
.com-body > div {
  height: 100%;
  display: inline-block;
  width: 100%;
}
.com-body >>> .vux-slider {
  height: 100%;
  width: 100%;
  background: #f4f4f4;
  /* overflow-y: scroll; */
}
.com-body >>> .vux-swiper {
  height: calc(100% - 44px) !important;
  overflow-y: scroll;
}
.mu-tabs {
  background: white;
  border-bottom: 1px solid #e2dfdf;
}
.com-head {
  background: #12cce4;
  padding: 8px;
  color: white;
  height: 3rem;
}
.com-head i {
  top: 4px;
  position: relative;
  margin-right: 24px;
}
.com-head span {
  font-size: 1.4rem;
}

/* .com-content {
  padding: 16px;
  background: #fff;
  p {
    margin: 8px 0;
  }
} */
.info-item {
  padding: 15px 17px;
  background: white;
  border-bottom: 1px solid #eee;
}
.info-item:hover {
  cursor: pointer;
}
.info-item .info-title {
  text-align: left;
  font-size: 1rem;
  color: #828282;
  display: inline-block;
  width: 100%;
}

.info-item .info-foot {
  /* padding: 8px 2px 8px; */
  /* padding-top: 2px; */
  color: #b5b5b5;
  text-align: left;
}
.info-item .info-foot img {
  position: relative;
  height: 24px;
  width: 24px;
  top: 5px;
  border-radius: 50%;
}
.info-item .info-foot .date {
  position: relative;
  float: right;
  top: 7px;
}
.info-img {
  padding-right: 5px;
  float: left;
  width: calc(100% - 100px);
}
/* .info-text {

} */
.single-img {
  max-width: 100px;
  float: left;
}
.single-img > img {
  height: 65px;
  border-radius: 4px;
}
.img-group {
  padding-top: 10px;
}
.img-group img {
  height: 65px;
  width: 32%;
  border-radius: 4px;
}
.img-group img:first-child {
  margin-right: 2%;
}
.img-group img:last-child {
  margin-left: 2%;
}
.flag {
  background: #e43700;
  padding: 4px 14px 3px;
  /* width: 200px; */
  color: white;
  border-radius: 3px;
  font-size: 12px;
  margin-left: 80px;
}
</style>