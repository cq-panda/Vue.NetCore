<template>
  <div class="question-container">
    <div class="best-user">
      <div class="title">
        <span>| 社区牛人排行榜</span>
      </div>
      <div class="user-list">
        <div class="user" v-for="(item,index) in userList" :key="index">
          <div class="header">
            <img v-bind:src="item.header" />
          </div>
          <div class="user-info">
            <div :class="'user-line'+(index+1)">
              <span class="user-index">{{index+1}}</span>
              <span class="user-name">{{item.userName}}</span>
            </div>
            <span class="user-text">回答数：{{item.replyQty}}</span>
            <br />
            <span class="user-text">提问数：{{item.askQty}}</span>
            <br />
          </div>
        </div>
      </div>
    </div>
    <!-- <div class="all-ask">
      <div class="title">
        <span>| 大家都在问</span>
      </div>
      <div class="ask-list">
       <div >
        <Card title="Options" icon="ios-options" :padding="0">
            <CellGroup>
                <Cell title="Open link in new window" to="#" target="_blank" />
            </CellGroup>
        </Card>
    </div>
      </div>
    </div>-->
    <div class="ask-split-title">最新提问</div>
    <div
      @click="link(qitem)"
      class="question-group"
      v-for="(qitem,qindex) in questionList"
      :key="qindex"
    >
      <div class="title">{{qitem.title}}</div>
      <div class="q-imgs">
        <img v-for="(img,imageIndex) in qitem.imgs" :key="imageIndex" v-bind:src="img" />
      </div>
      <div class="q-user-info">
        <img v-bind:src="qitem.header" />
        <span class="q-user-name">{{qitem.userName}}</span>
        <span class="q-date">{{qitem.date}}</span>
        <span class="q-reply">回复{{qitem.replyQty}}</span>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      questionList: [
        {
          title: "为什么别人媳妇看着比自己的漂亮?",
          header:
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/u%3D3040702465%2C3389653397%26fm%3D26%26gp%3D0.jpg",
          imgs: [
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/05.jpg",
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/u%3D3441742992%2C2765570575%26fm%3D26%26gp%3D0.jpg",
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/u%3D3040702465%2C3389653397%26fm%3D26%26gp%3D0.jpg"
          ],
          userName: "八戒",
          date: "2019-01-03 21:12",
          replyQty: 28
        },
        {
          title: "为什么坐下来就喜欢抖腿?",
          header:
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x3.jpg",
          imgs: [
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x3.jpg",
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/xx.jpg",
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x3.jpg"
          ],
          userName: "如果没有如果",
          date: "2019-01-03 21:12",
          replyQty: 28
        },
        {
          title: "为什么微信抢不到红包?",
          header:
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/05.jpg",
          imgs: [],
          userName: "如果没有如果",
          date: "2019-01-03 21:12",
          replyQty: 28
        },
        {
          title: "番茄为什么又叫西红柿?",
          header:
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/08.jpg",
          imgs: [
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/06.jpg",
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/07.jpg",
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/08.jpg"
          ],
          userName: "如果没有如果",
          date: "2019-01-03 21:12",
          replyQty: 28
        }
      ],
      userList: [
        {
          userName: "#浪里个浪",
          header:
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/head1.jpg",
          replyQty: 999,
          askQty: 780
        },
        {
          userName: "犀利哥",
          header:
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/head2.jpg",
          replyQty: 888,
          askQty: 323
        },
        {
          userName: "和尚用飘柔",
          header:
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/head3.jpg",
          replyQty: 666,
          askQty: 520
        }
      ]
    };
  },
  methods: {
    link(item) {
      this.$message.error(item.title);
    }
  }
};
</script>

<style scoped>
.question-container {
  height: 100%;
  border: 1px solid #eee;
  /* padding: 10px;
  background: white; */
}
.best-user {
  width: 100%;
  display: inline-block;
  background: white;
  padding: 10px;
}
.best-user .title {
  text-align: left;
  /* border-bottom: 1px solid #eee; */
  font-size: 15px;
  color: #2196f3;
}
.best-user .title span {
  border-bottom: 1px solid;
  padding-bottom: 4px;
}
.header img {
  height: 40px;
  width: 40px;
  border-radius: 50%;
}
.user-list {
  margin-top: 20px;
  width: 100%;
  display: inline-block;
}
.user-list .user {
  text-align: center;
  float: left;
  width: 33.333%;
}
.user-info {
  font-size: 12px;
}
.user-index {
  padding: 1px 5px;
  border: 0;
  border-radius: 50%;
  color: white;
  background: #ff9800;
  margin: 1px;
}
.user-info .user-name {
  font-size: 13px;
}
.user-info .user-text {
  letter-spacing: 1.5px;
  color: #8f8e8e;
}
.user-line1 {
  color: #f44336;
}
.user-line1 .user-index {
  background: #f44336;
  color: white;
}
.user-line2 {
  color: #ff9800;
}
.user-line2 .user-index {
  background: #ff9800;
  color: white;
}
.user-line3 {
  color: #2196f3;
}
.user-line3 .user-index {
  background: #2196f3;
  color: white;
}
.all-ask {
  margin-top: 10px;
  background: white;
  padding: 10px;
}
.all-ask .title {
  padding: 5px;
  font-size: 15px;
  color: #9c27b0;
}
.all-ask .title span {
  border-bottom: 1px solid;
  padding-bottom: 4px;
}
.ask-list li {
  color: #757474;
  list-style: none;
  padding: 7px;
  border-bottom: 1px solid #eee;
}
.ask-list li span {
  float: right;
  color: #454b4b;
  float: right;
  font-size: 18px;
  margin-top: -3px;
}
.question-group {
  border-bottom: 1px solid #eee;
  background: white;
  /* margin-top: 10px; */
  padding: 20px 10px;
}
.question-group .title {
  /* border-bottom: 1px solid #eee; */
  padding-bottom: 5px;
  font-size: 16px;
  text-align: left;
}
.question-group .q-imgs {
  margin-top: 10px;
}
.question-group .q-imgs img {
  width: 32%;
  height: 75px;
  margin-right: 1.333%;
}
.question-group .q-user-info {
  padding: 5px;
  color: #b6b4b4;
  text-align: left;
}
.question-group .q-user-info img {
  font-size: 12px;
  color: #757474;
  height: 25px;
  width: 25px;
  border-radius: 50%;
  position: relative;
  top: 7px;
}
.q-user-info .q-date {
  margin-left: 40px;
}
.q-user-info .q-reply {
  position: relative;
  float: right;
  /* margin-left: 55px; */
  top: 8px;
}
.ask-btn {
  position: fixed;
  right: 20px;
  /* top: 100px; */
  /* font-size: 55px; */
  color: #9e9e9e;
}
.ask-btn i {
  position: fixed;
  font-size: 30px;
  right: 20px;
  border: 1px solid;
  border-radius: 50%;
}
.ask-split-title {
  margin-top: 10px;
  text-align: left;
  background: #eee;
  padding: 10px 15px;
  color: #909399;
}
</style>
