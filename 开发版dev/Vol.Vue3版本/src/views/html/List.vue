<template>
  <div style="overflow: auto; position: absolute;
    background: rgb(245, 245, 245);
    height: 100%;
    width: 100%;">
    <div class="com-container">
      <div class="list"
           v-for="(item, index) in list2"
           :key="index">
        <div class="tab-swiper vux-center">
          <div>
            <div class="info-item"
                 v-for="(ritem,rindex) in item.data"
                 :key="rindex">
              <div class="info-title"
                   @click="openUrl(ritem)">
                <div :class="{'info-text':true,'info-img':ritem.imgs&&ritem.imgs.length==1}">{{ritem.title}}</div>
                <div v-if="ritem.imgs&&ritem.imgs.length==1"
                     class="single-img">
                  <img v-bind:src="getImg(ritem.imgs[0])"
                       :onerror="errorImg" />
                </div>
              </div>
              <div v-if="ritem.imgs&&(ritem.imgs.length>=3||ritem.imgs.length==2)"
                   class="img-group">
                <img :onerror="errorImg"
                     v-for="(img,imageIndex) in ritem.imgs"
                     :key="imageIndex"
                     v-bind:src="getImg(img)" />
              </div>
              <div class="info-foot">
                <img v-bind:src="header"
                     :onerror="errorImg" />
                <span class="author">{{ritem.creator}}</span>
                <el-tag>{{ritem.type||""}}</el-tag>
                <span class="date">{{ritem.createDate}}</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  components: {},
  created () {
    this.http.post("api/news/GetDemoPageList").then(result => {
      result.data.forEach(x => {
        x.createDate = (x.createDate || "").replace("T", " ");
        x.imgs = (x.imageUrl || "").split(",");
        x.type = x.newsType == 1 ? "置顶" : "快讯";
        if (x.newsType == 1) {
          this.list2[0].data.push(x);
        } else {
          this.list2[1].data.push(x);
        }
      });
    });
  },
  data () {
    return {
      header:
        "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/head1.jpg",
      errorImg: 'this.src="' + require("@/assets/imgs/error-img.png") + '"',
      recommend: [],
      index: 0,
      demo2: "推荐",
      list2: [{ name: "推荐", data: [] }, { name: "分享", data: [] }],
      active: 0
    };
  },
  methods: {
    getImg (img) {
      if (!img) return;
      if (!this.base.isUrl(img) && img.indexOf(".") != -1) {
        return this.http.ipAddress + img;
      }
      return img;
    },
    openUrl (row) {
      if (
        !row.detailUrl ||
        row.detailUrl.indexOf(".html") == -1 ||
        !this.base.isUrl(this.http.ipAddress + row.detailUrl)
      ) {
        return this.$Message.error("未发布页面");
      }
      window.open(this.http.ipAddress + row.detailUrl);
    }
  }
};
</script>
<style scoped >
.com-container {
  overflow: visible;
  left: 0;
  margin: 0 auto;
  right: 0;
  display: flex;
  max-width: 1000px;
  height: 100%;
  position: relative;
  padding: 20px;
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

.info-item {
  margin-bottom: 20px;
  padding: 15px 20px;
  background: white;
  border-bottom: 1px solid #eee;
}
.info-item .info-title:hover {
  color: #0776ce;
  cursor: pointer;
}
.info-item .info-title {
  text-align: left;
  font-size: 1rem;
  color: #404040;
  display: inline-block;
  width: 100%;
}

.info-item .info-foot {
  line-height: 30px;
  color: #9c9b9b;
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
  width: calc(100% - 150px);
}
/* .info-text {

} */
.single-img {
  float: left;
}
.single-img > img {
  object-fit: cover;
  width: 150px;
  height: 80px;
  border-radius: 4px;
}
.img-group {
  padding-top: 10px;
}
.img-group img {
  height: 90px;
  width: 32%;
  border-radius: 4px;
  margin: 0;
  padding: 0;
  object-fit: cover;
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
.author {
  margin-left: 10px;
  margin-right: 20px;
}
.list {
  background: white;
  margin: 0px 30px;
  flex: 1;
  padding-top: 15px;
  border-radius: 5px;
  border-left: 1px solid #e2dfdf;
  border-right: 1px solid #e2dfdf;
}
</style>