<template>
  <div calss="com-container">
    <div class="com-list">
      <div class="com-item"
           v-for="(item,index) in cowList"
           :key="index">
        <div class="item-head">
          <img v-bind:src="item.header" />
          <span class="author">{{item.author}}</span>
          <span class="focus">关注</span>
        </div>
        <div class="item-content"
             @click="link(item)">
          <span class="title">【{{item.title}}】</span>
          {{splitContent(item)}}
          <span v-show="item.show"
                class="all-text">全文</span>
        </div>
        <div class="item-imgs">
          <img :class="item.class"
               v-for="(imgItem,imgIndex) in item.imgs"
               v-bind:src="imgItem"
               :key="imgIndex" />
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
      cowList: [
        {
          title: "暗恋一个女生,昨天请她出来看电影..",
          author: "路边观察社北京一分社",
          header:
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/head3.jpg",
          content:
            " 暗恋一个女生很久了，昨天请她出来看电影，当我准时到影院时，才发现自己没带钱。值得庆幸的是，她像往常一样，并没有赴约,这终究是人生的大幸还是不幸，点了支烟，我茫然深思",
          imgs: [
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x2.jpg"
          ]
        },
        {
          title: "听说女人和男人在床上说得最多的一句是",
          author: "路边观察社北京二分社",

          header:
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/head1.jpg",
          content:
            " “你压着我头发了。”现在看电视剧终于明白为什么男二号总对男一号说：“你要敢动她根头发我和你没完！.....................",
          imgs: [
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/xx.jpg",
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x3.jpg"
          ]
        },
        {
          title: "2019年7月26日早 灰暗的云彩笼罩了天空",
          author: "路边观察社北京三分社",
          header:
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/head3.jpg",
          content:
            "  显得那样阴霾 我蹒跚着走到了那个地方 一切还是那么熟悉 强颜欢笑的和熟悉的熟人打着招呼 看得出 他们也在强颜欢笑 走到了那个非常熟悉的人的面前 深深的吸了一口气 还是那熟悉的问道 无语凝视着 我缓缓的递过去带着体温的八元钱 淡淡的说道 ：“老样子” 他苦笑着摇摇头，说：“不够” “不够？”内心不禁起波澜，难道涨的这么快吗，安抚住心内的汹涌澎湃，我试探着问道：“那来一个？”他依然苦笑着摇头。“纳尼，以前四块钱一个的肉夹馍，肿么现在八元钱一个都不够了哇，告诉我，这是为什么，到底是为什么？”此刻我有些抓狂，肾上腺激素飙高，显然我有些失控了。“亲，我也没办法，猪肉都22一斤了。。。。。。”看着他那也是万般无奈的表情，我颓然的放下那拿着带着体温的钱的手，默默的低下来头，惆怅的转身而去，拉长的身影，显得那么的黑暗无助。。。。。。",
          imgs: [
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/xx.jpg",
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x1.jpg",
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x2.jpg"
          ]
        }
      ]
    };
  },
  methods: {
    link (item) {
      this.$toast(item.title);
    },
    imgClass () {
      return "a2";
    },
    splitContent (item) {
      if (item.imgs && item.imgs.length > 0) {
        item.class = "img" + item.imgs.length;
      }
      if (item.content.length < 80) {
        item.show = false;
        return item.content;
      }
      item.show = true;
      return item.content.substring(0, 80) + "...";
    }
  }
};
</script>
<style scoped>
.com-container {
  height: 100%;
}
.item-head {
  border-bottom: 1px solid #eee;
  margin-bottom: 12px;
  text-align: left;
}
.item-head img {
  height: 25px;
  width: 25px;
  border-radius: 50%;
  margin-right: 10px;
}
.item-head span {
  position: relative;
  top: -5px;
  font-size: 15px;
}
.item-head .focus {
  position: relative;
  top: 0;
  font-size: 15px;
  float: right;
  padding: 0px 10px;
  border-radius: 15px;
  border: 1px solid #f9d9d9;
  color: #f44336;
}
.item-imgs {
  max-height: 180px;
  /* width: 300px; */
  /* height: 50px; */
  line-height: 25px;
  overflow: hidden;
}
.item-imgs .img1 {
  width: 100%;
  /* max-height: 180px; */
}
.item-imgs .img2 {
  width: 49%;
  height: 120px;
}

.item-imgs .img3 {
  width: 32%;
  height: 75px;
}
.item-imgs .img3:first-child,
.item-imgs .img2:first-child {
  margin-right: 2%;
}
.item-imgs .img3:last-child {
  margin-left: 2%;
}
.com-item {
  background: white;
  padding: 10px;
  margin-bottom: 8px;
}
.com-item:hover {
  cursor: pointer;
}
.item-imgs {
  margin-top: 9px;
}
.item-content {
  letter-spacing: 1.2px;
  text-align: left;
  color: #8b8787;
}
.item-content .title {
  font-size: 15px;
  color: #353535;
}
.item-content .all-text {
  color: blue;
}
.com-list {
  border: 1px solid #eee;
}
</style>

