<template>
  <div class="view-model-content" style="width: 100%;
    display: inline-block;
    height: 99%;">
    <!-- <div class="affix">
      <Timeline>
        <TimelineItem
          class="item"
          :color="activedIndex==index?'red':'#2d8cf0'"
          :class="{actived:index==activedIndex}"
          v-for="(item,index) in timeline"
          :key="index"
        >
          <span @click="change(item,index)">{{item.text}}</span>
        </TimelineItem>
      </Timeline>
    </div>-->
    <el-scrollbar style="height:100%;">
      <div class="links">
        <div class="item"></div>
        <div class="item"></div>
        <div
          class="item"
          :color="activedIndex==index?'red':'#2d8cf0'"
          :class="{actived:index==activedIndex}"
          v-for="(item,index) in timeline"
          :key="index"
        >
          <span @click="change(item,index)">{{item.text}}</span>
        </div>
      </div>
      <div>
        <div class="content">
          <Divider>{{text}}</Divider>
          <router-view></router-view>
        </div>
      </div>
    </el-scrollbar>
  </div>
</template>
<script>
export default {
  methods: {
    change(item, index) {
      this.activedIndex = index;
      this.text = item.text;
      this.$router.push({ path: item.path });
    }
  },
  created() {
    let path = this.$route.path;
    for (let index = 0; index < this.timeline.length; index++) {
      if (this.timeline[index].path == path) {
        this.activedIndex = index;
      }
    }
    this.text = this.timeline[this.activedIndex].text;
  },
  data() {
    return {
      text: "",
      activedIndex: 0,
      timeline: [
        {
          text: "框架介绍",
          path: "/document/guide",
          actived: true
        },
        // {
        //   text: "操作手册",
        //   path: "/document/guide",
        //   actived: false
        // },
        {
          text: "代码生成器",
          path: "/document/coder",
          actived: false
        },
        {
          text: "前端开发",
          path: "/document/vueDev",
          actived: false
        },
        {
          text: "后台开发",
          path: "/document/netCoreDev",
          actived: false
        }
      ]
    };
  },
  watch: {
    "$route.path": function(newVal, oldVal) {
      //  var navItem = this.getNavigation(this.selectId);
      // this.activedIndex=2;
    //  console.log(navItem.name);
    }
  }
};
</script>
<style lang="less" scoped>
.links {
  display: flex;
  font-size: 15px;
  position: fixed;
  z-index: 9999;
  width: 100%;
  background: black;
  > .item {
    line-height: 60px;
    padding: 10px;
    /* float: right; */
    text-align: center;
    flex: 1;
    color: #b1b0b0;
  }
    .actived {
    color: white;
    font-weight: bold;
  }
}

.affix {
  left: 50px;
  position: fixed;
  top: 50px;
  padding: 20px;
  border-right: 1px solid #d6d3d3;
  .actived {
    color: #ed4014;
    font-weight: bold;
  }
  li:hover {
    cursor: pointer;
  }
}
.content {
  position: relative;
  margin-top: 80px;
  height: 100%;
  max-width: 1200px;
  left: 0;
  right: 0;
  margin: 0 auto;
  padding: 30px;
  top: 80px;
}
</style>
<style scoped>
.view-model-content >>> .el-scrollbar > .el-scrollbar__wrap {
  overflow-x: hidden;
}
</style>