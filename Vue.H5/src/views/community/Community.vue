<template>
  <div class="com-container">
    <vol-header :back="false"
                title="社圈"></vol-header>

    <van-tabs v-model="active">

      <van-tab title="推荐内容">
        <com-index class="com-body">
        </com-index>
      </van-tab>
      <van-tab title="经典话题">
        <com-index2 class="com-body">
        </com-index2>
      </van-tab>
      <van-tab title="内容分享">
        <com-index3 class="com-body">
        </com-index3>
      </van-tab>
      <van-tab title="灌水专区">内容 4</van-tab>
    </van-tabs>
  </div>
</template>

<script>
import comIndex from "./Index.vue";
import comIndex2 from "./Index2.vue";
import comIndex3 from "./Index3.vue";
import VolHeader from "@/components/VolHeader.vue";
import { Tab, Tabs } from 'vant';
export default {
  components: {
    VolHeader,
    "van-tabs": Tabs,
    "van-tab": Tab,
    "com-index": comIndex,
    "com-index2": comIndex2,
    "com-index3": comIndex3
  },
  data () {
    return {
      active: 0
    };
  },
  methods: {
  }
};
</script>
<style scoped >
.com-container {
  border: 1px solid #eee;
  overflow: hidden;
  height: 100%;
  box-sizing: border-box;
}
.com-container >>> .van-tabs__content {
  overflow: scroll;
  height: calc(100% - 145px);
}
.com-container >>> .van-tabs--line {
  height: 100%;
}
.com-body {
  width: 100%;

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