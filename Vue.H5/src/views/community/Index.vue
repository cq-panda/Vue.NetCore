<template>
  <div class="com-container">
    <div class="tab-swiper vux-center">
      <div v-if="index==0">
        <div class="info-item"
             @click="openUrl(ritem)"
             v-for="(ritem,rindex) in recommend"
             :key="rindex">
          <div class="info-title">
            <div :class="{'info-text':true,'info-img':ritem.imgs&&ritem.imgs.length==1}">{{ritem.title}}</div>
            <div v-if="ritem.imgs&&ritem.imgs.length==1"
                 class="single-img">
              <img v-bind:src="ritem.imgs[0]" />
            </div>
          </div>
          <div v-if="ritem.imgs&&(ritem.imgs.length>=3||ritem.imgs.length==2)"
               class="img-group">
            <img v-for="(img,imageIndex) in ritem.imgs"
                 :key="imageIndex"
                 v-bind:src="img" />
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
  </div>
</template>

<script>
import { Icon } from 'vant';
export default {
  components: {
    "van-icon": Icon
  },
  data () {
    return {
      index: 0,
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
          header: "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/head3.jpg",
          author: "路边社消息",
          date: "1分钟前",
          imgs: [
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/tj04.jpg",
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/tj05.jpg",
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/tj04.jpg"
          ]
        },
        {
          title: "做程序员关键技术要点是什么??程序员发展前景如何?",
          header: "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/head1.jpg",
          author: "路边社北京分社",
          date: "1天前",
          imgs: [
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/tj05.jpg"
          ]
        }
      ],
    };
  },
  methods: {
    openUrl (item) {
      this.$toast("功能开发中....");
    }
  }
};
</script>
<style scoped >
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
  color: #0e0e0e;
  display: inline-block;
  width: 100%;
}

.info-item .info-foot {
  font-size: 12px;
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
  top: 11px;
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
  padding: 2px 5px 2px;
  color: white;
  border-radius: 3px;
  font-size: 12px;
  margin-left: 80px;
}
</style>