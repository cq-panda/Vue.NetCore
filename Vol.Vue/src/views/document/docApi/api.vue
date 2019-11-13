<template>
  <div class="i-container">
    <div class="nav">
      <ul>
        <li class="n-item" v-for="(item,index) in data" :key="index">
          <a :class="{active:active==index}" @click="toggleCom(index)">{{item.title}}</a>
        </li>
      </ul>
    </div>
    <div class="list">
      <Alert type="success" show-icon>
        关于组件
        <span slot="desc">所有组件都是基于iviewui组件、table表使用element-ui进行的二次封装，目前使用只需要配置好JSON格式即可使用..</span>
      </Alert>
      <component v-bind:is="currentComponent"></component>
    </div>
  </div>
</template>
<script>
import "./doc.less";
export default {
  components: {
    Icons: () => import("./doc_icons"),
    DocForm: () => import("./doc_volform")
  }, //
  methods: {
    toggleCom(index) {
      this.currentComponent = this.data[index].com_name;
    }
  },
  data() {
    return {
      active: -1,
      data: [
        {
          com_name: "Icons",
          title: "图标组件"
        },
        {
          com_name: "DocForm",
          title: "表单组件"
        }
      ],
      currentComponent: "Icons"
    };
  }
};
</script>
<style scoped>
</style>
<style lang="less" scoped>
.i-container {
  display: flex;
  > .nav {
    border-right: 1px solid #ccc3c3;
    margin-right: 10px;
    width: 120px;
    position: fixed;
    .n-item {
      text-align: right;
      padding-right: 29px;
      list-style: none;
      a {
        font-size: 15px;
        color: #737070;
        line-height: 40px;
        height: 40px;
        margin: 0;
        padding: 0;
        text-decoration: none;
        display: block;
        position: relative;
        -webkit-transition: 0.15s ease-out;
        transition: 0.15s ease-out;
      }
    }
  }
  > .list {
    flex: 1;
    margin-left: 140px;
  }
}
.active {
  color: #409eff !important;
}
.i-item {
  padding-bottom: 10px;
  border-bottom: 1px solid #eee;
  margin-bottom: 15px;
  h3 {
    font-size: 22px;
    font-weight: 400;
    margin: 0 0 10px;
    color: #1f2d3d;
  }
}
.i-item:hover {
  cursor: pointer;
}
.desc {
  //   padding-left: 50px;
}
.desc li {
  font-size: 14px;
  margin-bottom: 10px;
  color: #5e6d82;
  list-style: none;
}
.desc li:before {
  content: "";
  display: inline-block;
  width: 4px;
  height: 4px;
  border-radius: 50%;
  vertical-align: middle;
  background-color: #5e6d82;
  margin-right: 5px;
}
</style>