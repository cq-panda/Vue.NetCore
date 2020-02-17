<template>
  <div class="log">
    <div class="nav">
      <ul>
        <li class="n-item" v-for="(item,index) in log" :key="index">
          <a :class="{active:active==index}" @click="scrollIntoView(index)">{{item.title}}</a>
        </li>
      </ul>
    </div>
    <div class="item">
      <div :id="'i-'+index" class="time-line-item" v-for="(item,index) in log" :key="index">
        <h3>{{item.title}}</h3>
        <Timeline>
          <TimelineItem v-for="(list,index1) in item.data" color="blue" :key="index1">{{list.text}}</TimelineItem>
        </Timeline>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  methods: {
    scrollIntoView(index) {
      this.active = index;
      document.getElementById("i-" + index).scrollIntoView(false);
    }
  },
  data() {
    return {
      active: 0,
      log: [
        {
          title: "增加功能",
          data: [
            { text: "增加导入excel时验证自定义sql的数据源" },
            { text: "增加table列的宽度计算,超出时自动设置第一列为固定列" },
            { text: "增加新建或编辑成功后，可设置是否关闭弹出框的属性" },
            { text: "增加代码生成器设置表单标签类型(邮箱/手机号码类型)" },
            { text: "增加表单可验证：邮箱格式、手机号码格式、自定义验证方法" },
            { text: "增加编辑弹出框可以自行设置高度与宽度" },
            { text: "添加编辑弹出框前的扩展方法modelOpenBefore" },
            { text: "添加编辑按钮可自定义设置hidden与disabled属性" },
            { text: "增加mysql数据库日志批量写入失败解决说明" },
            { text: "添加select组件item数据长度超过10个默认开启搜索功能" },
            { text: "增加记录当前编辑行的属性currentRow" },
            { text: "添加Vue页面对IE9以上浏览器版本的支持" },
            { text: "添加打包前端文件后缀加上时间戳解" },
            { text: "增加textarea标签可自行设定高度属性maxRows" },
            { text: "增加sqlserver2012以下版本使用说明" }
          ]
        },
        {
          title: "bug修复",
          data: [
            {
              text:
                "修复table有查询条件时，第1页以后的数据没有带上查询条件的问题"
            },
            {
              text:
                "修复table有查询条件时，第1页以后的数据没有带上查询条件的问题"
            },
            { text: "修复页面刷新后顶部导航状态消失的问题" },
            { text: "修改代码生成器非空判断无效的问题" },
            { text: "修复表单select组件为只读的属性时没有绑定数据源的问题" },
            { text: "修复第一次弹出框时获取不到子组件的问题" },
            { text: "修复sqlserver数据库代码生成的model字段guid小写的问题" },
            { text: "修复dapper查询异常的问题" },
            { text: "修复select组件max-tag-count属性使用错误的问题" },
            { text: "修复表单查询/刷新时table分页信息重置错误的问题" }
          ]
        },
        {
          title: "优化功能",
          data: [
            { text: "优化编辑表单布局样式，增加demo可读性" },
            { text: "优化VolForm表单验证" },
            { text: "优化定菜单页面中其他权限弹出框的大小" },
            { text: "添加Demo的扩展js中，扩展按钮使用描述" },
            { text: "优化编辑弹出框自适应功能" },
            { text: "优化日志处理" },
            { text: "优化代码生成器对mysql数据库的兼容处理" },
            { text: "优化首页获取菜单权限验证规则" }
          ]
        }
      ]
    };
  }
};
</script>

<style scoped  lang="less" >
.time-line-item {
  margin-top: 40px;
}
.time-line-item h3 {
  font-size: 22px;
  font-weight: 400;
  margin: 0 0 15px;
  color: #1f2d3d;
}

.log {
  display: flex;
  .active {
    color: #409eff !important;
  }
  .nav {
    width: 300px;
    ul {
      z-index: 999999;
      top: 90px;
      position: fixed;
    }
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
  .item {
    flex: 1;
  }
}
</style>