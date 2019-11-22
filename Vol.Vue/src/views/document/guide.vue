<template>
  <div id="cnblogs_post_body">
    <div
      style="line-height: 50px;
    text-align: center;
    font-size: 20px;
    border-radius: 5px;
    margin-bottom: 20px;"
    >
        <a
        target="_blank"
        style="border-bottom: 1px solid;margin: 0 10px"
        href="https://github.com/cq-panda/Vue.NetCore"
      >GitHub</a>
      <a
        target="_blank"
        style="border-bottom: 1px solid;margin: 0 10px"
        href="https://www.cnblogs.com/-clouds/p/11633786.html"
      >博客园介绍</a>
      <a
        target="_blank"
        style="border-bottom: 1px solid;margin: 0 10px"
        href="http://132.232.2.109"
      >演示环境</a>
      <a
        target="_blank"
        style="border-bottom: 1px solid;margin: 0 10px"
        href="http://132.232.2.109/app/guide"
      >H5开发</a>
      <a
        target="_blank"
        style="border-bottom: 1px solid;margin: 0 10px"
        @click="()=>{ this.$router.push({ path: '/document/coder' });}"
      >代码生成</a>
      <a
        target="_blank"
        style="border-bottom: 1px solid;margin: 0 10px"
        @click="()=>{ this.$router.push({ path: '/document/api' });}"
      >组件Api</a>
      <a
        target="_blank"
        style="border-bottom: 1px solid;margin: 0 10px"
        @click="()=>{ this.$router.push({ path: '/document/issue' });}"
      >常见问题</a>
    </div>
    <h2>开发及依赖环境</h2>
    <p class="desc">
      S2017 、.NetCore2.1 、EFCore2.1、JWT、Dapper、Autofac、SqlServer/MySql、Redis(可选，没有redis的在appsetting.json中不用配置，默认使用内置IMemory)、
      <br />VsCode、Vue2.0（webpack、node.js,如果没有此环境自行搜索:vue webpack npm)、Vuex、axios、promise、IView、Element-ui
    </p>
    <h2>启动项目</h2>
    <div class="desc">
      <ul style="padding: 5px 30px;">
        <li>如果你没有前端环境，请先安装node,前端开发建议使用VsCode</li>
        <li>
          如果你没有dotnetcore2.1及以上版本环境，
          <a
            target="_blank"
            href="https://dotnet.microsoft.com/download/dotnet-core"
          >点击此处下载</a>
        </li>
        <li>
          1、运行后端项目：后端项目路径../VOL.WebApi/运行dev_run.bat
          <span>端口设置的是9991</span>,运行前先看appsettings.josn配置属性说明
        </li>
        <li>2、运行前端项目：前端Vue项目路径../VOL.Vue/运行run.bat,注意：如从没执行过npm install命令，使用cmd命令切换至前端Vue项目../VOL.Vue路径下,执行npm install命令</li>
        <li>3、输入http://localhost:8080访问（本地超级管理员帐号：admin 密码:123456）</li>
      </ul>
    </div>
    <h2>功能介绍</h2>
    <table>
      <tr>
        <td style=" min-width: 170px;">功能</td>
        <td>描述</td>
        <td style=" min-width: 90px;">完成情况</td>
      </tr>
      <tr>
        <td>用户管理(登陆、密码修改)</td>
        <td>登陆、密码修改</td>
        <td>√</td>
      </tr>
      <tr>
        <td>角色管理</td>
        <td>角色管理</td>
        <td>√</td>
      </tr>
      <tr>
        <td>权限分配</td>
        <td>用户基础权限分配，后台支持多种权限控制方式,也可自行定义</td>
        <td>√</td>
      </tr>
      <tr>
        <td>用户权限/菜单静态化处理</td>
        <td>为减少Redis读取数据传输量,对用户权限/菜单在本地服务器作静态化处理,只有在用户权限/菜单变化时才刷新redis缓存</td>
        <td>√</td>
      </tr>
      <tr>
        <td>JWT认证</td>
        <td>采用前台端分离JWT认证，并且支持JWT过期动态刷新</td>
        <td>√</td>
      </tr>
      <tr>
        <td>异步队列批量写日志</td>
        <td>框架封装了一个异步队列写日志,此前项目每天PV约150W左右，采用异步队列的方式批量写入日志非常顺畅</td>
        <td>√</td>
      </tr>
      <tr>
        <td>Repository</td>
        <td>Repository作为数据提供，提供了常用EF方法封装</td>
        <td>√</td>
      </tr>
      <tr>
        <td>前端常用组件封装</td>
        <td>此框架主要围绕表单组件进行开发，并且封装的组件都支持扩展</td>
        <td>√</td>
      </tr>
      <tr>
        <td>基础业务实现</td>
        <td>已实现(表/主从表)的增、删、改、查、导入、导出、审核基础功能(前提建一张带主键的mysql/sqlserver表),这些基础业务不要写任何代码，直接用代码生成器生成即可，并且生成的代码支持其他业务代码扩展</td>
        <td>√</td>
      </tr>
      <tr>
        <td>代码生成器</td>
        <td>代码生成器为可视化配置，提供了可配置属性的20多种，所有基础功能只需要勾选确认，生成的代码包括Vue/Vue扩展文件/路由,后台表相关的类(控制器/扩展控制器,业务接口/扩展业务接口,接口实现/扩展接口实现类)，支持单表表单、主从表单的代码生成</td>
        <td>√</td>
      </tr>
      <tr>
        <td>数据源预先配置</td>
        <td>数据源作为前端下拉框/多选框的字典项源，支持key/value配置及sql从数据源加载配置</td>
        <td>√</td>
      </tr>
      <tr>
        <td>表单数据源自动绑定</td>
        <td>如果一个表单带有多个下拉框，这里只需要配置数据源编号即可自动绑定</td>
        <td>√</td>
      </tr>
      <tr>
        <td>Redis/Memory缓存</td>
        <td>已对Redis/Memory封装直接使用即可</td>
        <td>√</td>
      </tr>
      <tr>
        <td>Dapper</td>
        <td>已对Dapper封装直接使用即可</td>
        <td>√</td>
      </tr>
      <tr>
        <td>扩展方法</td>
        <td>框架封装了大量的扩展方法,如：通用实体校验(框架所有实现校验全部依赖于此扩展)扩展、string扩展、object扩展、表达式生成/解析扩展、文件操作扩展等</td>
        <td>√</td>
      </tr>
      <tr>
        <td>H5开发</td>
        <td>
          可支持直接开发并部署H5页面
          <a
            title="H5开发看这里"
            href="http://132.232.2.109/app/guide"
            target="_blank"
          >H5开发看这里</a>
        </td>
        <td>√</td>
      </tr>
      <tr>
        <td>分库分表</td>
        <td>分库分表操作</td>
        <td>x</td>
      </tr>
      <tr>
        <td>静态页面发布</td>
        <td></td>
        <td>x</td>
      </tr>
      <tr>
        <td>消息推送</td>
        <td></td>
        <td>x</td>
      </tr>
    </table>
  </div>
</template>
<script>
export default {};
</script>
<style>
#cnblogs_post_body {
  color: black;
  font: 0.875em/1.5em "微软雅黑", "PTSans", "Arial", sans-serif;
  font-size: 15px;
}
#各个等级标题的颜色样式 #cnblogs_post_body h1 {
  background: #2b6695;
  border-radius: 6px 6px 6px 6px;
  box-shadow: 0 0 0 1px #5f5a4b, 1px 1px 6px 1px rgba(10, 10, 0, 0.5);
  color: #ffffff;
  font-family: "微软雅黑", "宋体", "黑体", Arial;
  font-size: 23px;
  font-weight: bold;
  height: 25px;
  line-height: 25px;
  margin: 18px 0 !important;
  padding: 8px 0 5px 5px;
  text-shadow: 2px 2px 3px #222222;
}
#cnblogs_post_body h2 {
  background: #00bcd4;
  border-radius: 6px 6px 6px 6px;
  box-shadow: 0 0 0 1px #a3a3a3, 1px 1px 6px 1px rgba(10, 10, 0, 0.5);
  color: #ffffff;
  font-family: "微软雅黑", "宋体", "黑体", Arial;
  font-size: 20px;
  font-weight: bold;
  /* height: 25px; */
  line-height: 37px;
  margin: 18px 0 !important;
  /* padding: 8px 0 5px 5px; */
  padding: 2px 20px;
  text-shadow: 2px 2px 3px #635555;
}

#cnblogs_post_body h3 {
  background: #399ab2;
  border-radius: 6px 6px 6px 6px;
  box-shadow: 0 0 0 1px #5f5a4b, 1px 1px 6px 1px rgba(10, 10, 0, 0.5);
  color: #ffffff;
  font-family: "微软雅黑", "宋体", "黑体", Arial;
  font-size: 18px;
  font-weight: bold;
  height: 25px;
  line-height: 25px;
  margin: 18px 0 !important;
  padding: 8px 0 5px 5px;
  text-shadow: 2px 2px 3px #222222;
}
#cnblogs_post_body h4 {
  background: #2b6600;
  border-radius: 6px 6px 6px 6px;
  box-shadow: 0 0 0 1px #5f5a4b, 1px 1px 6px 1px rgba(10, 10, 0, 0.5);
  color: #ffffff;
  font-family: "微软雅黑", "宋体", "黑体", Arial;
  font-size: 16px;
  font-weight: bold;
  height: 24px;
  line-height: 23px;
  margin: 12px 0 !important;
  padding: 5px 0 5px 10px;
  text-shadow: 2px 2px 3px #222222;
}

#cnblogs_post_body table {
  border-collapse: collapse;
}
#cnblogs_post_body table td {
  color: rgba(111, 93, 93, 0.87);
  font-size: 13px;
  border-collapse: collapse;
  padding: 7px;
  min-width: 60px;
  border: 1px solid #d4d1d1;
  text-align: left;
}
#cnblogs_post_body img {
  width: 100%;
  margin-bottom: 30px;
  margin-top: 10px;
}
#页面中a标签鼠标位置 #cnblogs_post_body h2:a {
  color: rgb(235, 235, 235);
}
#cnblogs_post_body h2 a:hover {
  color: rgb(255, 102, 0);
}
#页面中标题位置 #cnblogs_post_body h1 {
  color: rgb(235, 235, 235);
}
#cnblogs_post_body h1:hover {
  color: rgb(255, 102, 0);
}
#cnblogs_post_body h2 {
  color: rgb(235, 235, 235);
}
#cnblogs_post_body h2:hover {
  color: rgb(255, 102, 0);
}
#cnblogs_post_body h3 {
  color: rgb(235, 235, 235);
}
#cnblogs_post_body h3:hover {
  color: rgb(255, 102, 0);
}
#cnblogs_post_body h4 {
  color: rgb(235, 235, 235);
}
#cnblogs_post_body h4:hover {
  color: rgb(255, 102, 0);
}
#cnblogs_post_body blockquote {
  margin: 20px 0;
  padding: 15px 20px 15px 60px;
  font-size: 15px;
  background: #f7ed91;
  font-family: "Microsoft Yahei";
  box-shadow: 0 0 8px #aaa;
  clear: both;
  line-height: 1.6em;
  color: #333;
}
#cnblogs_post_body blockquote li {
  padding: 15px 2px 5px 5px;
  /* line-height: 1.5; */
  /* color: #000; */
  border-bottom: 1px solid #ccc;
  /* list-style-type: disc; */
  margin-bottom: 0.5em;
}

#cnblogs_post_body .desc {
  background: rgb(230, 250, 250);
  padding: 10px 10px 10px 10px;
  border: 1px dashed rgb(224, 224, 224);
  font-family: 微软雅黑;
  font-size: 13px;
}

#cnblogs_post_body .desc-to {
  background: #4caf50;
  color: white;
}
#cnblogs_post_body .desc-to > div {
  padding: 10px 16px;
}
#cnblogs_post_body .desc-to a {
  color: yellow;
  font-weight: bold;
  margin-right: 25px;
}
</style>
