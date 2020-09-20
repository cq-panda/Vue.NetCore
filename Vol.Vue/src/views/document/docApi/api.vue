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
        <span slot="desc" >所有组件都是基于iviewui组件、table表使用element-ui进行的二次封装，目前使用只需要配置好JSON格式即可使用..</span>
      </Alert>
      <Alert type="info" show-icon>
           <span style="color: red;">   [FormFields]拼写错误兼容更新提示2020.09.13</span>
        <div slot="desc" style="line-height: 2;font-size: 15px;margin-top: 20px;">
          <p>如果是2020.09.13之后下载的项目或者2020.09.13后有更新过代码并且重新生成过vue页面,请忽略此提示</p>
          <p
          >由于框架FormFileds字段拼写错误，文档中editFormFileds已变修正editFormFields，searchFormFileds已变修正为searchFormFields</p>
          <p >更新文件：<a  href="https://github.com/cq-panda/Vue.NetCore/releases/tag/v2.1.2" target="_blank">https://github.com/cq-panda/Vue.NetCore/releases/tag/v2.1.2</a></p>
          <p style="color: red;">如果没有更新过项目,使用文档中searchFormFields、editFormFields对象时，修改拼写为searchFormFileds、editFormFileds，或者更新代码后再重新生成vue页面</p>
        </div>
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
    DocForm: () => import("./doc_volform"),
    VolHeader: () => import("./doc_header"),
    box: () => import("./doc_box"),
    uploadExcel: () => import("./doc_uploadExcel"),
    uploadImg: () => import("./doc_uploadImg"),
    volmenu: () => import("./doc_menu"),
    voltable: () => import("./doc_table"),
    viewGrid: () => import("./doc_viewGridApi"),
    volupload: () => import("./doc_volupload"),
    other: () => import("./doc_other"),
  }, //
  methods: {
    toggleCom(index) {
      this.currentComponent = this.data[index].com_name;
      this.active = index;
    },
  },
  created() {},
  data() {
    return {
      active: 0,
      data: [
        {
          com_name: "Icons",
          title: "图标组件",
        },
        {
          com_name: "box",
          title: "弹出框组件",
        },
        {
          com_name: "DocForm",
          title: "VolForm表单组件",
        }, //
        {
          com_name: "VolHeader",
          title: "VolHeader",
        },
        {
          com_name: "voltable",
          title: "VolTable组件",
        },
        {
          com_name: "viewGrid",
          title: "代码生成页面ViewGrid",
        },
        {
          com_name: "volupload",
          title: "volupload上传组件",
        },
        // {
        //   com_name: "volmenu",
        //   title: "菜单组件"
        // },
        // {
        //   com_name: "uploadExcel",
        //   title: "excel上传"
        // },
        // {
        //   com_name: "uploadImg",
        //   title: "图片上传"
        // },
        // {
        //   com_name: "other",
        //   title: "其它组件"
        // }
      ],
      currentComponent: "Icons",
    };
  },
};
</script>
<style>
</style>
<style lang="less" scoped>
.i-container {
  display: flex;
  > .nav {
    border-right: 1px solid #ccc3c3;
    margin-right: 10px;
    width: 180px;
    position: fixed;
    .n-item {
      text-align: left;
      padding-right: 15px;
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
    width: 1000px;
    flex: 1;
    margin-left: 195px;
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