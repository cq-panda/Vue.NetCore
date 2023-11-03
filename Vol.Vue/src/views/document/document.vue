<template>
  <div class="view-model-content" style="width: 100%; display: inline-block; height: 99%">
    <!-- <el-scrollbar style="height:100%;"> -->
    <div class="links">
      <div class="item" :color="activedIndex == index ? 'red' : '#2d8cf0'" :class="{ actived: index == activedIndex }"
        v-for="(item, index) in timeline" :key="index">
        <span @click="change(item, index)" :class="{ new: item.new }">{{
          item.text
        }}</span>
      </div>
    </div>
    <div style="display: none" class="doc-menu">
      <div @click="drawerModel = true">
        <Icon type="ios-list" /> Vol.Vue
      </div>
      <Drawer title="文档" placement="left" :closable="false" v-model="drawerModel">
        <div class="item" style="padding: 0.5rem; font-size: 1rem" :color="activedIndex == index ? 'red' : '#2d8cf0'"
          :class="{ actived: index == activedIndex }" v-show="index > 0" v-for="(item, index) in timeline" :key="index">
          <span @click="() => {
            drawerModel = false;
            change(item, index);
          }
            " :class="{ new: item.new }">{{ item.text }}</span>
        </div>
      </Drawer>
    </div>
    <div>
      <div class="content" :class="{
        'doc-api':
          activedIndex > 0 && timeline[activedIndex].text == '组件api'
      }">
        <!-- <Divider>{{text}}</Divider> -->
        <router-view></router-view>
      </div>
    </div>
    <el-dialog @close="close" title="提示" :visible.sync="centerDialogVisible" width="450px" center>
      <p style="color: #8a8686;letter-spacing: 1px;">框架2023.10月已全面支持SqlSugar(增加后台新版本)</p>
      <p style="color: #8a8686;letter-spacing: 1px;margin-top: 5px;">开源不易,帮忙点个Star,非常感谢</p>
      <p style="margin-top: 5px;"> <a href="https://gitee.com/x_discoverer/Vue.NetCore" target="blank"><span
            style="margin-right: 3px;    font-size: 15px;"
            class="ivu-icon ivu-icon-logo-github"></span>https://gitee.com/x_discoverer/Vue.NetCore</a></p>
      <span slot="footer" class="dialog-footer">
        <!-- <el-button size="small" @click="close">取 消</el-button> -->
        <el-button size="small" type="primary" @click="close">确 定</el-button>
      </span>
    </el-dialog>
    <!-- </el-scrollbar> -->
  </div>
</template>
<script>
import './doc.less';
export default {
  methods: {
    change(item, index) {
      if (!item.path) {
        window.open('https://api.volcore.xyz/doc/app.html', 'blank');
        return;
      }
      if (item.text == '框架介绍') {
        window.open('https://www.cnblogs.com/-clouds/p/11633786.html');
        return;
      }
      if (item.path == '#') {
        return this.$Message.error('框架1.0文档正在整理中...');
      }
      this.activedIndex = index;
      this.text = item.text;
      this.$router.push({ path: item.path });
    },
    close() {
      localStorage.setItem('doc:dt', ~~(new Date() / 1000))
      this.centerDialogVisible = false;
      window.open('https://gitee.com/x_discoverer/Vue.NetCore', 'blank');

    },
    getDaysBetween(timestamp1, timestamp2) {
      const date1 = new Date(timestamp1 * 1000); // JavaScript的Date对象使用毫秒时间戳，因此需要将秒时间戳乘以1000  
      const date2 = new Date(timestamp2 * 1000);
      const timeDiff = Math.abs(date1.getTime() - date2.getTime()); // 计算两个日期之间的时间差，返回毫秒  
      const daysDiff = Math.ceil(timeDiff / (1000 * 60 * 60 * 24)); // 将毫秒转换为天，并向上取整  

      return ~~daysDiff;
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
    // this.$Notice.success({
    //               title: '文档更新提示',
    //               desc: '文档已在持续更新中,见[前端开发]',
    //               duration: 0
    //           });
    // this.$Message.error("开发文档已在整理中。。。");
  },
  mounted() {
    try {
      let dt = localStorage.getItem('doc:dt') * 1;
      if (!dt) {
        this.centerDialogVisible = true;
        return;
      }
      console.log('11')
      if (this.getDaysBetween(dt,~~(new Date()/1000)) > 30) {
        this.centerDialogVisible = true;
      }
    } catch (error) {

    }

  },
  data() {
    return {
      centerDialogVisible: false,
      drawerModel: false,
      text: '',
      activedIndex: 0,
      timeline: [
        {
          text: '返回首页',
          path: '/home',
          actived: false
        },
        {
          text: '项目启动与发布',
          path: '/document/guide',
          actived: false
        },
        {
          text: '代码生成',
          path: '/document/coder',
          actived: false
        },
        {
          text: '组件api(生成页面api)',
          path: '/document/api',
          actived: false
        },
        {
          text: '前端开发',
          path: '/document/vueDev',
          actived: false,
          new: true
        },
        {
          text: '后台开发',
          path: '/document/netCoreDev',
          actived: false
        },
        {
          text: '移动端(uni-app)',
          path: '/app/home',
          actived: false
        },
        {
          text: '常见问题',
          path: '/document/issue',
          actived: false
        },
        {
          text: '更新记录',
          path: '/document/log',
          actived: false
        }
      ]
    };
  },
  watch: {
    '$route.path': function (newVal, oldVal) {
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
  z-index: 999;
  width: 100%;
  background: black;
  box-shadow: 0px 0px 10px #524747;

  >.item {
    position: relative;
    text-align: center;
    line-height: 55px;
    // padding: 10px;
    /* float: right; */
    flex: 1;
    color: #b1b0b0;
  }

  >.item:hover {
    cursor: pointer;
    color: white;
  }

  .actived {
    color: white;
    font-weight: bold;

    span {
      border-bottom: 2px solid #fff;
    }
  }

  span {
    height: 100%;
    position: relative;
    padding: 17px 0;
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

  height: 100%;
  // max-width: 1350px;
  left: 0;
  right: 0;
  margin: 0 auto;
  padding: 10px 30px;
  padding-top: 80px;
}

.doc-api {
  max-width: 100%;
  padding: 80px 40px;
}

.new:after {
  content: '.';
  position: absolute;
  width: 8px;
  height: 8px;
  background: #ececea;
  top: 11px;
  border-radius: 50%;
}
</style>
<style scoped>
.view-model-content>>>.el-scrollbar>.el-scrollbar__wrap {
  overflow-x: hidden;
}
</style>
