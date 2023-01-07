<template>
  <div class="log" style="padding: 1rem">
    <!-- <div class="nav">
      <ul>
        <li class="n-item" v-for="(item,index) in log" :key="index">
          <a :class="{active:active==index}" @click="scrollIntoView(index)">{{item.title}}</a>
        </li>
      </ul>
    </div>-->
    <div class="item">
      <!-- <div :id="'i-'+index" class="time-line-item" v-for="(item,index) in log" :key="index">
      <h3>{{item.title}}</h3>-->
      <div class="time-line-item">
        <h3>更新记录</h3>
      </div>
      <h5
        style="
          padding-bottom: 12px;
          font-size: 15px;
          font-weight: 100;
          margin-left: 24px;
        "
      >
        累计：{{ log.length }}次提交
      </h5>
      <ul>
        <li
          v-for="(list, index1) in log"
          :class="{ month: !!list.type }"
          :key="index1"
        >
          <span class="date">{{ list.date }}</span>
          <div :style="list.style" v-if="list.style" v-html="list.desc"></div>
          <span v-else>{{ list.desc }}</span>
        </li>
      </ul>
    </div>
  </div>
</template>
<script>
export default {
  methods: {
    scrollIntoView(index) {
      this.active = index;
      document.getElementById("i-" + index).scrollIntoView(false);
    },
  },
  data() {
    return {
      active: 0,
      log: [
        { date: "2023.01", type: "month" },
        {
          date: "2023-01-04 11:00:37",
          desc: "增加vue3版本volform编辑器只读时以标签显示(by @ying)",
        },
        {
          date: "2023-01-04 10:53:43",
          desc: "修复vue3版本volform下拉框搜索后不能还原的问题",
        },
        {
          date: "2023-01-04 10:33:10",
          desc: "优化vue3版本viewgrid明细表按钮颜色可能异常的问题",
        },
        {
          date: "2023-01-04 10:26:39",
          desc: "增加vue3版本voltable动态限定单元格只方法getDisabled",
        },
        { date: "2023-01-04 10:14:45", desc: "优化上传示例" },
        {
          date: "2023-01-04 10:14:17",
          desc: "增加vue3版本图片上传(jpg、jpeg格式)自动压缩功能",
        },
        {
          date: "2023-01-04 10:06:23",
          desc: "修复审批流程只有一个节点时审批异常的问题",
        },
        { date: "2022.12", type: "month" },
        {
          date: "2022-12-27 21:17:16",
          desc: "vol-table 添加isdisabled，传入参数row, column ，返回true表示禁用",
        },
        {
          date: "2022-12-26 22:38:41",
          desc: "修复vue3版本voltable二级表头formatter与click无效的问题",
        },
        {
          date: "2022-12-26 03:29:39",
          desc: "修复vue3版本编辑类型为switch时会影响查询类型的问题",
        },
        {
          date: "2022-12-26 02:37:20",
          desc: "修复vue3版本volform密码输框异常的问题",
        },
        { date: "2022-12-26 02:36:01", desc: "增加数据源bigint类型的支持" },
        {
          date: "2022-12-26 02:33:25",
          desc: "增加vue3版本voltable组件数据源加载完成后的方法dicInited",
        },
        {
          date: "2022-12-26 02:32:59",
          desc: "增加vue3版本volform组件数据源加载完成后的方法dicInited",
        },
        {
          date: "2022-12-26 02:24:42",
          desc: "修复审批流程下一个审批人参数错误的问题",
        },
        { date: "2022-12-17 16:54:51", desc: "优化移动端首页" },
        {
          date: "2022-12-17 16:52:38",
          desc: "优化移动端vol-table组件自定义按钮",
        },
        {
          date: "2022-12-15 16:25:30",
          desc: "修复vue3版本vol-table time组件无效的问题",
        },
        {
          date: "2022-12-13 20:22:14",
          desc: "修改mysql批量写入可能异常的问题(by @bulog )",
        },
        {
          date: "2022-12-12 21:24:22",
          desc: "fix(Database): 修复MySQL批量插入只能插入一条数据的Bug(by @Ady)",
        },
        {
          date: "2022-12-02 00:09:36",
          desc: "修复vue3版本级联组件超过500个选项时value转换的问题",
        },

        { date: "2022.11", type: "month" },
        {
          date: "2022-11-22 12:03:21",
          desc: "修复volform表单验证回调方法异常没有提示信息的问题",
        },
        { date: "2022-11-21 01:50:38", desc: "完善文档" },
        {
          date: "2022-11-21 01:39:25",
          desc: "增加dapper同时连接多个数据库(更新DBServerProvider.cs,具体见说明：partial->DBServerProvider.cs)",
        },
        {
          date: "2022-11-21 01:08:04",
          desc: "增加导入下拉多选值的支持(更新EPPlusHelper.cs)",
        },
        {
          date: "2022-11-21 00:54:42",
          desc: "优化后台默认导出数量限制规则(更新ServiceFunFilter.cs、ServiceBase.cs)",
        },
        {
          date: "2022-11-21 00:49:31",
          desc: "优化vue3版本voltable、volform组件time类型",
        },
        { date: "2022-11-21 00:29:43", desc: "移除voltable中的tag无效属性" },
        { date: "2022-11-21 00:26:45", desc: "增加审核时审核状态选择判断" },
        { date: "2022-11-21 00:21:32", desc: "增加node版本18以上启动异常说明" },
        { date: "2022-11-19 11:35:49", desc: "优化.net6版本启动命令" },
        { date: "2022-11-17 15:08:32", desc: "移除H5项目，使用vol.uniapp开发" },
        { date: "2022-11-08 19:14:11", desc: "优化移动端底部图标" },
        {
          date: "2022-11-08 15:42:50",
          desc: "修复移动端volform下拉框选择部分苹果手机不兼容的问题,重新开放下拉框搜索功能",
        },
        {
          date: "2022-11-07 14:08:25",
          desc: "修复vue3版本base64图片可能不显示的问题",
        },
        {
          date: "2022-11-04 14:18:37",
          desc: "重写部份vue3版本自定义表单与table示例",
        },
        { date: "2022-11-04 10:26:56", desc: "优化vue3版本示例页面" },
        {
          date: "2022-11-03 09:51:21",
          desc: "增加移动端vol-table列表显示时formatter与click方法",
        },
        { date: "2022-11-03 09:49:46", desc: "修复移动端删除按钮无效的问题" },
        {
          date: "2022-11-02 14:26:27",
          desc: "修复vue3版本select2组件属性读取错误的问题",
        },
        { date: "2022.10", type: "month" },
        {
          date: "2022-10-31 02:00:12",
          desc: "集成el-select-v2组件解决下拉框数据源多过时卡顿的问题",
        },
        {
          date: "2022-10-31 00:42:15",
          desc: "增加vue3版本volform下拉框选中事件返回第二个参数",
        },
        {
          date: "2022-10-31 00:38:04",
          desc: "优化vue3版本volform组件图片与其他标签的样式",
        },
        {
          date: "2022-10-31 00:30:01",
          desc: "修复vue3版本VolElementMenuChild.vue组件三级菜单启用不显示功能无效的问题",
        },
        { date: "2022-10-31 00:18:25", desc: "移除sqldapper中不用属性" },
        { date: "2022-10-31 00:16:17", desc: "优化后台登陆方法异常提示信息" },
        {
          date: "2022-10-31 00:01:41",
          desc: "修复linux下验证码字体可能不显示的问题(by @adminoryuan )",
        },
        { date: "2022-10-24 22:44:08", desc: "调整.net6输出目录路径" },
        {
          date: "2022-10-24 03:01:24",
          desc: "修复vue3版本下拉框多选二次打开异常的问题",
        },
        {
          date: "2022-10-24 02:58:57",
          desc: "修复导出列某些情况可能与表格界面顺序不一致的问题",
        },
        {
          date: "2022-10-23 03:34:47",
          desc: "[update] 关于ubantu20.0 环境下，验证码字体失效的改进",
        },
        { date: "2022-10-19 17:20:05", desc: "优化移动端voltable高度值判断" },
        {
          date: "2022-10-19 17:07:48",
          desc: "Merge branch 'master' of https://github.com/cq-panda/Vue.NetCore",
        },
        {
          date: "2022-10-19 17:01:13",
          desc: "修复viewgrid事件rowclick异常的问题",
        },
        { date: "2022-10-18 17:26:28", desc: "增加移动端表单按钮示例" },
        {
          date: "2022-10-18 00:59:48",
          desc: "优化移动端volform表单属性extra与图标",
        },
        { date: "2022-10-18 00:58:54", desc: "完善文档" },
        {
          date: "2022-10-18 00:52:11",
          desc: "Merge branch 'master' of https://github.com/cq-panda/Vue.NetCore",
        },
        {
          date: "2022-10-18 00:47:25",
          desc: "优化移动端volform表单extra属性与图标",
        },
        {
          date: "2022-10-17 04:17:28",
          desc: "增加移动端vol-table、生成页面viewgrid合计功能(目前只对配置属性this.direction='horizontal'表格显示生效)",
        },
        { date: "2022-10-17 02:57:28", desc: "优化移动端高度计算规则" },
        {
          date: "2022-10-17 02:01:17",
          desc: "优化移动端volform下拉框选择样式与暂时屏蔽搜索功能",
        },
        {
          date: "2022-10-17 01:55:04",
          desc: "增加移动端volform富文本编辑器内容显示",
        },
        {
          date: "2022-10-17 01:54:46",
          desc: "增加移动端voltable富文本编辑器内容显示",
        },
        {
          date: "2022-10-17 01:49:01",
          desc: "修复代码生成器mysql8.x版本默认字段顺序显示与数据库表不一致的问题",
        },
        {
          date: "2022-10-17 01:39:21",
          desc: "移除代码生成器表名首字母强制大写",
        },
        {
          date: "2022-10-11 15:10:11",
          desc: "修复vue3版本voltable属性extra无效的问题",
        },
        { date: "2022-10-11 12:00:22", desc: "优化异常信息提示" },
        { date: "2022-10-07 22:34:01", desc: "完善文档" },
        { date: "2022-10-07 22:33:17", desc: "增加移动端base64图片的支持" },
        {
          date: "2022-10-07 21:46:16",
          desc: "Merge branch 'master' of https://github.com/cq-panda/Vue.NetCore",
        },
        {
          date: "2022-10-07 21:43:52",
          desc: "优化vue3版本volform年月默认选中的格式",
        },
        {
          date: "2022-10-07 21:36:49",
          desc: "集成vue3版本voltable选中行高亮显示属性 highlight-current-row",
        },
        {
          date: "2022-10-07 21:31:02",
          desc: "增加vue3版本明细表添加行自动结束编辑状态",
        },
        { date: "2022-10-07 21:26:34", desc: "增加开发环境中间件异常信息返回" },
        {
          date: "2022-10-07 21:01:36",
          desc: "增加自定义上传文件路径UploadFolder",
        },
        { date: "2022-10-07 20:49:04", desc: "优化批量获取model实体" },
        {
          date: "2022-10-07 20:41:57",
          desc: "修复自定义列显示与代码生成器不同步的问题",
        },
        { date: "2022.09", type: "month" },
        {
          date: "2022-09-30 16:14:48",
          desc: "修复移动端view-grid不能复用的问题",
        },
        { date: "2022-09-28 18:39:08", desc: "1" },
        { date: "2022-09-28 18:35:36", desc: "优化移动端组件" },
        {
          date: "2022-09-28 17:42:35",
          desc: "修复移动端异步权限与组件渲染不同步的问题",
        },
        { date: "2022-09-26 22:04:30", desc: "完善文档" },
        { date: "2022-09-26 22:01:38", desc: "增加移动端示例审批权限判断" },
        {
          date: "2022-09-26 02:34:34",
          desc: "增加移动端审批操作(见小程序演示环境：主从表页面，代码见SellOrder文件夹)",
        },
        { date: "2022-09-26 01:07:17", desc: "调整移动端vol-form字段居右显示" },
        { date: "2022-09-26 00:28:16", desc: "修复定时任务点执行无效的问题" },
        { date: "2022-09-26 00:15:05", desc: "增加vue3版本自定义导出文件名" },
        {
          date: "2022-09-12 20:39:32",
          desc: "优化vue3版本voltable合计小数位数(默认两次)",
        },
        { date: "2022-09-12 20:32:37", desc: "优化vue3版本下拉框选择" },
        { date: "2022-09-12 20:14:35", desc: "vue3版本volform组件增加ref属性" },
        {
          date: "2022-09-12 19:14:50",
          desc: "集成vue3版本弹出框拖拽功能draggable",
        },
        { date: "2022-09-12 19:02:54", desc: "修复vue3版本单词拼写错误的问题" },
        { date: "2022-09-12 18:24:26", desc: "优化vue3版本弹出框标题显示" },
        {
          date: "2022-09-12 02:16:05",
          desc: "修复移动端小程序上自定义格式无效的问题",
        },
        {
          date: "2022-09-12 00:13:06",
          desc: "优化移动端vol-table高度计算与列表显示样式",
        },
        { date: "2022-09-09 18:00:01", desc: "修复审批提示数据变化的问题" },
        { date: "2022-09-09 17:58:41", desc: "重写vue3版本权限页面" },
        { date: "2022-09-08 19:28:30", desc: "更新数据库脚本" },
        { date: "2022-09-07 17:15:59", desc: "Update DateTimeHelper.cs" },
        { date: "2022-09-07 14:30:57", desc: "增加定时任务Quartz.Net" },
        { date: "2022-09-07 09:51:26", desc: "更新数据库脚本" },
        {
          date: "2022-09-07 02:10:02",
          style: "color:red",
          desc: `
   <div style="margin-top:20px;font-weight:600;">  集成定时任务Quartz，更新文件：</div>

      <div style="margin-top:20px;">1、数据库表(db文件夹中找)Sys_QuartzLog、Sys_QuartzOptions</div>
        <div style="margin-left:20px;">  将两张表生成代码(生成代码时类库选择system,文件夹输入Quartz) ;</div>

       <div style="margin-left:20px;">   配置文件：appsettings.json中增加QuartzAccessKey属性    </div>   

  <div style="margin-top:20px;">   2、后台：Vol.Core 类型下Filters、Quartz文件夹、Startup.cs、</div>
     <div style="margin-left:20px;"> System 类库下Quartz文件夹；</div>
             <div style="margin-left:20px;">            VOL.WebApi 类库下System->Partial->Sys_QuartzOptionsController.cs；</div>
    
    <div style="margin-top:20px;">  3、前端：extension->system文件夹下quartz;</div>
    
    <div style="margin-top:20px;">  4、增加菜单页面菜单</div>

   <div style="margin-top:20px;">   5、增加数据字典：下拉框绑定设置中添加数据字典：参照现有字典配置：请求方式</div>

`,
        },
        { date: "2022-09-07 02:01:31", desc: "优化代码生成器默认编辑行" },
        { date: "2022-09-03 10:14:23", desc: "完善移动端vol-table示例" },
        { date: "2022.08", type: "month" },
        {
          date: "2022-08-29 04:32:06",
          desc: "增加审批流程回退功能,更新文件:ServiceBase.cs、WorkFlowManager.cs、Sys_WorkFlowController.cs、前端viewgrid文件夹(回退使用方法见后台开发文档上审批方法)",
        },
        {
          date: "2022-08-29 02:11:03",
          desc: "优化vue3版本table编辑时数据源类型判断",
        },
        {
          date: "2022-08-29 01:45:31",
          desc: "优化vue3版本审批时隐藏弹出框其他按钮",
        },
        {
          date: "2022-08-29 01:35:33",
          desc: "优化vue3版本表单编辑为函数时提交自动计算结果",
        },
        {
          date: "2022-08-29 01:29:53",
          desc: "修复vue3版本升级后白色与黑色主题颜色显示异常的问题",
        },
        { date: "2022-08-29 01:09:52", desc: "优化登陆页字体大小" },
        {
          date: "2022-08-29 01:07:11",
          desc: "修复vue3版本升级后更多按钮图标不显示的问题",
        },
        {
          date: "2022-08-24 21:33:53",
          desc: "Merge branch 'master' of https://github.com/cq-panda/Vue.NetCore",
        },
        { date: "2022-08-24 21:32:19", desc: "优化移动端权限加载顺序" },
        {
          date: "2022-08-22 21:33:00",
          desc: "优化vue3版本表单类型为number时的默认值",
        },
        { date: "2022-08-22 21:23:07", desc: "优化vue3版本select多选显示" },
        { date: "2022-08-22 21:09:40", desc: "优化用户表新建或修改提示信息" },
        {
          date: "2022-08-22 21:00:23",
          desc: "优化vue3版本voltable默认显示滚动条",
        },
        {
          date: "2022-08-22 20:46:55",
          desc: "优化vue3版本菜单与上传组件图标显示",
        },
        { date: "2022-08-22 20:43:34", desc: "优化弹出框高度自适应" },
        { date: "2022-08-22 20:35:02", desc: "优化文件上传默认大小" },
        {
          date: "2022-08-22 01:35:31",
          style: "color:red",
          desc: `
          <div style="font-weight:600;"> 升级element plus正式版本2.2.14及vue版本3.2.37，更新方式(先升级2022.08.15的更新说明,不更新会影响审批功能)：</div>
           <div style="margin-top:20px;">1、使用cmd命令切换到Vol.Vue3版本目录下,分别执行这4个命令</div>
            <div style="margin-left:20px;">npm install vue@3.2.37 --force</div>
            <div style="margin-left:20px;">npm uninstall element-plus</div>
            <div style="margin-left:20px;">npm install element-plus --save</div>
            <div style="margin-left:20px;">npm cache clear --force</div>

            <div style="margin-top:20px;">2、前端更新文件</div>
            <div style="margin-left:20px;">public->index.html</div>
            <div style="margin-left:20px;">App.vue</div>
            <div style="margin-left:20px;">QuickSearch.vue</div>
            <div style="margin-left:20px;">ViewGrid.vue</div>
            <div style="margin-left:20px;">VolElementMenu.vue</div>
            <div style="margin-left:20px;">VolElementMenuChild.vue</div>
            <div style="margin-left:20px;">VolTable.vue</div>
            <div style="margin-left:20px;">VolForm.vue</div>
            <div style="margin-left:20px;">main.js</div>
            <div style="margin-left:20px;">vue.config.js</div>
            <div style="margin-left:20px;">index.vue 第388行代码位置： const selectNav = (item) => {</div>
            <div style="margin-left:20px;">assets->element-icon文件夹，(新增加的字段文件)</div>


</div>
        `,
        },
        { date: "2022-08-22 01:33:45", desc: "优化用户新建与删除提示" },
        { date: "2022-08-22 01:33:07", desc: "增加.net6版本审批流程" },
        { date: "2022-08-19 16:35:08", desc: "更新mysql脚本" },
        { date: "2022-08-18 02:38:58", desc: "更新sqlserver脚本" },
        { date: "2022-08-18 02:17:52", desc: "调整审核类型显示" },
        { date: "2022-08-18 01:43:35", desc: "优化审批人显示" },
        {
          date: "2022-08-17 22:53:15",
          desc: "增加发邮件功能：更新MailHelper.cs、appsettings.json(最后面的Mail配置)",
        },
        {
          date: "2022-08-17 00:16:20",
          desc: "增加点击我的审批时自动跳转弹出审批信息页面",
        },
        {
          date: "2022-08-16 23:26:38",
          desc: "优化vue3版本http.js文件强制url地址以/结尾",
        },
        {
          date: "2022-08-16 23:22:53",
          desc: "增加vue3版本明细表内容超出换行显示属性",
        },
        {
          date: "2022-08-16 23:14:37",
          desc: "优化vue3版本table事件点击上下文指向",
        },
        {
          date: "2022-08-16 23:13:52",
          desc: "修复vue3版本首页index.vue导航右键功能浏览器兼容的问题",
        },
        { date: "2022-08-16 23:12:28", desc: "完善文档" },
        { date: "2022-08-16 23:11:19", desc: "优化代码生成器模板" },
        {
          date: "2022-08-16 22:44:39",
          desc: "集成vue3版本voltable组件列属性showOverflowTooltip(当内容过长被隐藏时显示 tooltip)",
        },
        {
          date: "2022-08-16 22:39:11",
          desc: "增加vue3版本主表在线表格编辑前方法拦截",
        },
        { date: "2022-08-16 02:07:44", desc: "增加mysql审批流程表结构" },
        {
          date: "2022-08-16 01:56:59",
          desc: "完善审批流程，增加角色、部门审批功能",
        },
        {
          date: "2022-08-16 01:52:47",
          desc: "优化sqldapper批量写入mysql数据库",
        },
        { date: "2022-08-15 05:17:49", desc: "增加流程示例" },
        {
          date: "2022-08-15 04:08:46",
          desc: "修复移动端安卓真机类型错误的问题",
        },
        {
          date: "2022-08-15 04:06:17",
          desc: "修复移动端图片上传权限异常的问题",
        },
        {
          date: "2022-08-15 04:03:46",
          style: "color:red",
          desc: `增加审批流程功能,更新代码：
             <p>1、  数据库更新：更新db文件夹中表结构Sys_WorkFlow、Sys_WorkFlowStep、Sys_WorkFlowTable、Sys_WorkFlowTableStep这4张表;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;同时生成代码(代码生成时类库选择system，文件夹名flow)</p>
             <p style="margin-left:25px;font-size:13px;color:#579fea">数据库脚本地址<a href="https://gitee.com/x_discoverer/Vue.NetCore/tree/master/DB">https://gitee.com/x_discoverer/Vue.NetCore/tree/master/DB</a></p>
             <p>2、VOL.Core类库全部更新替换覆盖</p>
            <p>3、后台：UserInfo.cs、Sys_WorkFlowController.cs、Sys_WorkFlowService.cs</p>
            <p>4、流程注入见后台代码：Startup.cs中ConfigureContainer方法说明</p>
                      <p>5、前端更新文件夹：components、extension->system->flow文件夹</p>
                 <p>6、其他遗漏或详细补充见视频</p>
              `,
        },
        { date: "2022.07", type: "month" },

        { date: "2022-07-30 11:16:55", desc: "移除.net6版本过时代码" },
        { date: "2022-07-25 02:45:15", desc: "增加审批流程(审批逻辑待完)" },
        { date: "2022-07-20 00:17:15", desc: "优化移动端下拉框默认值显示" },
        { date: "2022-07-18 02:55:25", desc: "完善文档" },
        {
          date: "2022-07-18 02:01:05",
          desc: "修复vue3版本voltable组件编辑格式为年月日时格式显示不正确的问题",
        },
        {
          date: "2022-07-18 01:44:37",
          desc: "增加vue3版本代码生成器排序字段说明",
        },
        {
          date: "2022-07-18 01:40:23",
          desc: "修复自定义权限判断大小写判断错误的问题",
        },
        {
          date: "2022-07-18 01:39:47",
          desc: "增加默认多字段排序功能(多个字段逗号隔开),更新文件ServiceBase.cs",
        },
        {
          date: "2022-07-18 01:18:19",
          desc: "修复vue3版本volform邮箱类型验证不正确的问题",
        },
        {
          date: "2022-07-18 00:57:40",
          desc: "修复vue3版本volform密码输入框类型错误的问题",
        },
        {
          date: "2022-07-13 00:14:34",
          desc: "优化主从表不再要求主从表的主键字段类型一致",
        },
        {
          date: "2022-07-13 00:11:49",
          desc: "修复vue3版本vol-table编辑时下拉框多选key、value不一致没有正确转换的问题",
        },
        {
          date: "2022-07-13 00:10:18",
          desc: "修复明细表修改时修改人信息没有更新的问题",
        },
        { date: "2022-07-12 23:23:06", desc: "同步mysql与pgsql数据库脚本" },
        {
          date: "2022-07-12 23:19:19",
          desc: "修复pgsql数据库批量写入异常的问题",
        },
        { date: "2022-07-12 23:16:45", desc: "优化反射代码注入" },
        { date: "2022-07-05 01:36:39", desc: "优化通用excel导出方法" },
        { date: "2022-07-05 00:11:00", desc: "移除vue3版本中的错误代码" },
        { date: "2022.06", type: "month" },
        {
          date: "2022-06-28 22:26:55",
          desc: "修复vue3版本vol-table数据源某些条件下类型判断错误的问题",
        },
        { date: "2022-06-27 01:02:05", desc: "完善文档" },

        {
          date: "2022-06-27 00:53:54",
          desc: "增加vue3版本vol-table表格编辑多选的支持",
        },
        {
          date: "2022-06-27 00:36:21",
          desc: "修复vue3版本this.$tabs打开选择卡后二次切换参数可能丢失的问题",
        },
        { date: "2022-06-27 00:25:06", desc: "增加移动端示例" },
        {
          date: "2022-06-27 00:13:07",
          desc: "增加通用下载文件(excel)方法this.http.download()说明",
        },
        {
          date: "2022-06-27 00:07:44",
          desc: "增加移动端vol-table图片预览功能",
        },
        {
          date: "2022-06-26 23:54:14",
          desc: "修复移动端在安卓上传图片某些情况不能解析的问题",
        },
        {
          date: "2022-06-26 23:28:59",
          desc: "修复vue3版本vol-table组件表格内容切换后行数不一致时不能编辑的问题",
        },
        {
          date: "2022-06-26 23:24:45",
          desc: "修复sqldapper异步执行时没有区分数据库类型的问题",
        },
        { date: "2022-06-26 23:19:31", desc: "屏蔽kafka代码" },
        { date: "2022-06-20 02:51:15", desc: "增加vue3版本通用导出方法" },
        { date: "2022-06-20 02:12:42", desc: "优化vue3版本time选择日期格式" },
        {
          date: "2022-06-20 02:11:57",
          desc: "增加vue3版本保存明细表时处理多选下拉框的值",
        },
        {
          date: "2022-06-20 01:53:16",
          desc: "增加导入时读取原生excel方法(可以自定义读取excel内容)",
        },
        {
          date: "2022-06-20 01:51:15",
          desc: "修复日志文件在小程序上异常的问题",
        },
        {
          date: "2022-06-20 01:36:10",
          desc: "修复移动端volform日期组件日期第一次默认值不能自动选中的问题",
        },
        {
          date: "2022-06-20 01:31:52",
          desc: "增加移动端vol-form获取焦点focus属性",
        },
        {
          date: "2022-06-12 23:28:26",
          desc: "增加vue2版本vol-table字段必填时显示红色*号",
        },
        {
          date: "2022-06-12 23:27:42",
          desc: "增加vue2版本固定查询条件时显示重置按钮",
        },
        {
          date: "2022-06-12 23:06:35",
          desc: "增加vue3版本vol-table表格必填时显示红色*号",
        },
        {
          date: "2022-06-12 23:05:53",
          desc: "修复vue3版本主从表第一次打开时执行两次查询的问题",
        },
        {
          date: "2022-06-12 22:39:39",
          desc: "增加vue3版本vol-form集成日期组件：年月选择",
        },
        {
          date: "2022-06-12 22:30:07",
          desc: "修复vue3版本自定义列点击取消时没有关闭的问题",
        },
        { date: "2022-06-12 22:23:15", desc: "增加dockfile配置(by @3ddbz)" },
        {
          date: "2022-06-12 22:21:40",
          desc: "增加跨平台验证码SkiaSharp(by @3ddbz)",
        },
        {
          date: "2022-06-11 00:43:48",
          desc: "修复移动端vol-table不能同时使用多个组件的问题",
        },
        {
          date: "2022-06-10 10:37:55",
          desc: "修复vue3版本destroyed无效的问题",
        },

        { date: "2022.05", type: "month" },
        {
          date: "2022-05-31 21:28:46",
          desc: "调整生成验证码的代码以支持linux",
        },
        { date: "2022-05-31 21:27:05", desc: "添加docker支持" },
        { date: "2022-05-31 11:00:36", desc: "移除开发版帐号登陆限制" },
        {
          date: "2022-05-29 23:22:15",
          desc: "增加vue3版本顶部菜单选项卡切换时联动左侧菜单",
        },
        {
          date: "2022-05-29 21:51:26",
          desc: "增加通用获取递归获取所有子节点的方法",
        },
        { date: "2022-05-28 02:38:17", desc: "增加vue3版本自定义列显示与顺序" },
        {
          date: "2022-05-28 02:27:33",
          desc: "增加vue3版本自定义列是否显示与列显示顺序",
        },
        { date: "2022-05-24 12:52:29", desc: "完善文档" },
        { date: "2022-05-23 23:01:51", desc: "升级.net6 entity类库版本" },
        {
          date: "2022-05-23 21:53:37",
          desc: "增加删除菜单时刷新缓存与修改菜单按钮时同步刷新角色权限缓存",
        },
        {
          date: "2022-05-23 16:48:50",
          desc: "修复vue3版本快捷查询日期无法清除的问题",
        },
        {
          date: "2022-05-23 12:03:24",
          desc: "增加扩展方法手机号验证支持199开头",
        },
        {
          date: "2022-05-23 12:02:37",
          desc: "修复dapper 更新方法update事务参数无效的问题",
        },
        {
          date: "2022-05-23 12:01:33",
          desc: "修改RepositoryBase.cs中SqlParameter引用",
        },
        { date: "2022-05-21 22:04:24", desc: "移除无效引用" },
        { date: "2022-05-20 19:42:21", desc: "补全vue3与移动端文档" },
        {
          date: "2022-05-20 16:29:35",
          desc: "修复vue3版本快捷查询为日期多选时，查询按钮被挡住的问题",
        },
        {
          date: "2022-05-20 15:47:00",
          desc: "优化vue3版本index.vue中tabs右键关闭操作",
        },
        { date: "2022-05-20 11:09:43", desc: "Update http.js" },
        {
          date: "2022-05-20 09:50:18",
          desc: "增加vue3版本导航菜单tab右键关闭功能,更新文件index.less,Index.vue,VolElementMenu.vue(by p1j123456 )",
        },
        {
          date: "2022-05-20 09:34:27",
          desc: "Merge pull request #251 from p1j123456/master",
        },
        { date: "2022-05-19 22:46:41", desc: "追加tab标签右键" },
        {
          date: "2022-05-11 17:58:11",
          desc: "修复vue2版本结束编辑前方法行数据不正确的问题",
        },
        { date: "2022-05-11 17:20:21", desc: "Update Detail.vue" },
        { date: "2022-05-11 00:54:04", desc: "完善文档" },
        {
          date: "2022-05-11 00:53:32",
          desc: "增加vue3版本快捷查询支持级联、日期组件，查询只有一选项时强制隐藏高级查询",
        },
        {
          date: "2022-05-11 00:09:51",
          desc: "增加移动端列表数据可自定义多个按钮",
        },
        { date: "2022-05-11 00:08:17", desc: "增加移动端多按钮配置模板" },
        {
          date: "202-05-08 22:51:55",
          desc: "增加vue3版本voltable下拉框选择只读disabled与是否显示hidden属性",
        },
        {
          date: "202-05-08 22:50:45",
          desc: "增加vue3版本下拉框选项只读readonly与是否显示hidden属性",
        },
        {
          date: "202-05-08 22:49:55",
          desc: "增加vue3版本明细表按钮默认hidden属性",
        },
        {
          date: "202-05-08 22:24:47",
          desc: "移动端voltable组件增加单元格点击事件",
        },
        {
          date: "202-05-08 21:58:06",
          desc: "修复移动端生成的页面点击跳转后不能再次点击的问题",
        },
        { date: "202-05-08 21:56:54", desc: "修改移动端搜索功能图标" },
        { date: "202-05-07 00:43:40", desc: "增加移动端下拉框搜索功能" },
        {
          date: "202-05-06 23:58:06",
          desc: "增加vue3版本获取当前时间的通用方法",
        },
        { date: "202-05-06 23:30:05", desc: "优化示例与示例" },
        { date: "202-05-06 23:29:20", desc: "修复vue3版本错误信息重复的问题" },
        { date: "202-05-06 23:28:45", desc: "优化vue3表单动态列宽度计算" },
        { date: "202-05-06 00:28:59", desc: "优化移动端组件" },
        { date: "202-05-05 23:34:53", desc: "优化列表数据显示" },
        { date: "202-05-05 23:07:56", desc: "修改移动端级联为下拉框操作" },
        {
          date: "202-05-05 21:54:25",
          desc: "增加vue3版本弹出框按钮默认属性disabled值",
        },
        { date: "202-05-05 15:03:45", desc: "增加swagger null判断" },
        { date: "202-05-05 14:30:21", desc: "Update mysql表结构与表数据.sql" },
        {
          date: "202-05-05 11:30:32",
          desc: "设置signalR不开启，如果需要启用，在main.js中设置",
        },
        {
          date: "202-05-05 11:26:02",
          desc: "增加vue3版本是否开启消息推送signalR属性配置",
        },

        { date: "202-05-04 12:14:59", desc: "优化登陆密码判断方式" },
        { date: "202-05-03 11:42:38", desc: "完善文档" },
        {
          date: "202-05-03 11:41:43",
          desc: "优化vue3版本权限分配页面区分app菜单",
        },
        {
          date: "202-05-03 11:41:03",
          desc: "优化vue2版本权限分配页面区分app菜单",
        },
        {
          date: "202-05-03 11:13:08",
          desc: "增加vue3版本volform输入框inputStyle属性",
        },
        {
          date: "202-05-03 10:56:33",
          desc: "增加vue3版本voltable组件textarea编辑类型",
        },
        { date: "202-05-03 10:46:14", desc: "移除多余设置默认值的操作" },
        { date: "202-05-03 10:36:37", desc: "优化移动端权限名不区分大小写" },
        { date: "202-05-03 10:33:18", desc: "优化移动端保存前方法" },
        { date: "202-05-03 10:31:50", desc: "增加移动端表单组件ref属性" },
        { date: "202-05-03 10:29:44", desc: "屏蔽代码生成器生成dto功能" },
        {
          date: "202-05-03 03:50:26",
          style: "font-size:14px;color:red;",
          desc: "vue3版本集成signalR(消息推送)",
          desc: `<p>vue3版本集成signalR(消息推送),更新文件:</p>
<p>package.json、router/index.js、views/index.vue、views/Home.vue、views/index/index.less、Startup.cs、appsettings.json、</p>Hubs/HomePageMessageHub.cs、views/index文件夹、views/signalR/Index.vue`,
        },

        { date: "2022.04", type: "month" },
        { date: "202-04-25 01:27:35", desc: "优化vol-table组件null显示" },
        {
          date: "202-04-25 01:11:12",
          desc: "修复vol-form组件日期在小程序真机上默认值异常的问题，集成日期最大值与最小值",
        },
        { date: "202-04-22 20:09:21", desc: "提供sqlserver开发版最新脚本" },
        {
          date: "202-04-22 15:58:45",
          desc: "调整kafka注入方式 解决生产者在控制器或Service里面无法调用问题",
        },
        {
          date: "202-04-21 00:20:36",
          desc: "修复表单小程序上获取不到不文件名的问题",
        },
        { date: "202-04-20 23:20:53", desc: "完善uniapp组件" },
        { date: "202-04-20 01:31:55", desc: "增加uniapp示例" },
        {
          date: "202-04-22 10:45:10",
          desc: "修改swaggerUI界面，查看方式更直观，同时接口可复制为MD文档格式",
        },
        { date: "202-04-18 21:12:48", desc: "设置级联组件为下拉框展示" },
        {
          date: "202-04-18 01:29:07",
          desc: "设置uniapp http.js默认开发请求信息",
        },
        { date: "202-04-18 01:24:03", desc: "增加菜单区分uniapp与PC显示" },
        {
          date: "2022-04-17 22:28:14",
          desc: "增加uniapp表单自定义placeholder属性",
        },
        {
          date: "2022-04-17 22:27:37",
          desc: "修复uniapp表单字段为图片时没有初始化上传地址的问题",
        },
        {
          date: "2022-04-17 21:58:21",
          desc: "增加代码生器partial实体生成，需要更新DomainModel.html、Sys_TableInfoService.cs",
        },
        {
          date: "2022-04-17 21:26:58",
          desc: "增加vue3版本设置textInline属性后表头也可以自动换行",
        },
        {
          date: "2022-04-17 21:05:48",
          desc: "增加vue3版本voltable中tag属性effect",
        },
        {
          date: "2022-04-17 20:56:30",
          desc: "优化vue2版本volform表单onChange判断",
        },
        {
          date: "2022-04-17 20:27:12",
          desc: "增加vue3版本动态控制明细表是否显示",
        },
        {
          date: "2022-04-17 20:26:55",
          desc: "增加vue2版本动态控制明细表是否显示",
        },
        { date: "2022-04-17 20:15:29", desc: "优化vue3版本重新加载数据源" },
        { date: "2022-04-17 20:15:10", desc: "优化vue2版本重新加载数据源" },
        { date: "2022-04-13 21:33:20", desc: "优化vue3版本voltable样式" },
        { date: "2022-04-13 00:01:32", desc: "优化vue3版本表单只读验证" },
        {
          date: "2022-04-11 21:31:54",
          desc: "增加vue3版本编辑器自定义上传的实现",
        },
        { date: "2022-04-11 21:26:59", desc: "移除后台上传文件大小限制" },
        {
          date: "2022-04-10 23:30:11",
          desc: "优化vue3版本菜单收缩后文字颜色显示",
        },
        { date: "2022-04-07 01:10:10", desc: "完善文档" },
        {
          date: "2022-04-06 23:57:53",
          desc: "优化vue3版本table合计固定列显示",
        },
        {
          date: "2022-04-06 13:47:35",
          desc: "修复移动端searchAfter参数错误的问题",
        },
        {
          date: "2022-04-06 00:27:13",
          desc: "优化vue3版本volform只读字段不验证必填",
        },
        { date: "20222-04-05 20:59:48", desc: "完善文档" },
        { date: "20222-04-05 20:53:15", desc: "优化vue3版本表单textarea字体" },
        {
          date: "20222-04-04 14:44:44",
          desc: "增加vue3版本字典加载完成后的方法dicInited",
        },
        {
          date: "20222-04-04 14:44:31",
          desc: "增加vue2版本字典加载完成后的方法dicInited",
        },
        {
          date: "20222-04-04 14:36:27",
          desc: "修复vue3版本级联刷新数据源后table的数据源没有刷新的问题",
        },
        {
          date: "20222-04-04 14:35:29",
          desc: "修复vue2版本级联刷新数据源后table的数据源没有刷新的问题",
        },
        { date: "20222-04-01 23:27:54", desc: "完善文档" },
        { date: "2022.03", type: "month" },
        { date: "20222-03-31 22:49:49", desc: "优化代码生成器路径保存方式" },
        { date: "2022-03-27 13:36:10", desc: "完善文档" },
        { date: "2022-03-27 12:05:16", desc: "初始化uniapp项目" },
        {
          date: "2022-03-27 12:01:50",
          style: "font-size:14px;color:red;",
          desc: `<p>增加移动端支持、安卓、ios、h5、微信小程序(uniapp)，更新文件：</p>
        <p>1、数据库：ALTER TABLE Sys_Menu  ADD MenuType INT </p>
          <p> 2、前端：Sys_Menu.vue、 builder文件夹   </p>
          <p>3、后台：Sys_Menu.cs、Sys_TableInfoController.cs、Sys_TableInfoService.cs、ISys_TableInfoService.cs、 <p>
          <p>ApiAuthorizeFilter.cs、UserContext.cs、JwtHelper.cs、Permissions.cs、Sys_MenuService.cs、BuilderController.cs、Startup.cs、Template文件夹  </p>`,
        },
        { date: "2022-03-26 17:11:36", desc: "修复编辑器不能换行的问题" },
        { date: "2022-03-26 00:35:06", desc: "增加vue3版本title修改" },
        {
          date: "2022-03-24 22:16:13",
          desc: "修复vue3版本表单字段为number时+-默认不生效的问题",
        },
        { date: "2022-03-24 21:49:27", desc: "优化vue2版本登录页面" },
        {
          date: "2022-03-24 21:49:10",
          desc: "修复vue2版本编辑器某些情况不能设置值的问题",
        },
        {
          date: "2022-03-24 21:48:45",
          desc: "修复vue3版本编辑器某些情况不能设置值的问题",
        },
        {
          date: "2022-03-20 20:47:06",
          desc: "优化vue3版本编辑时限制只能选择一行数据提示",
        },
        {
          date: "2022-03-20 20:46:56",
          desc: "优化vue2版本编辑时限制只能选择一行数据提示",
        },
        {
          date: "2022-03-20 20:42:50",
          desc: "增加vue2版本volform表单swithc、checbox的onChange事件",
        },
        { date: "2022-03-20 20:37:28", desc: "优化vue2版本首页头像加载判断" },
        { date: "2022-03-20 20:35:13", desc: "优化vue3版本首页头像加载判断" },
        {
          date: "2022-03-20 20:29:21",
          desc: "修复vue2版本表单编辑器的图片不能自定义高度的问题",
        },
        { date: "2022-03-20 20:28:12", desc: "完善vue3版本volform只读功能" },
        { date: "2022-03-20 20:24:59", desc: "优化vue2版本登陆页面" },
        {
          date: "2022-03-20 20:24:12",
          desc: "修复vue2版本表单编辑器的图片不能自定义高度的问题",
        },
        { date: "2022-03-15 23:56:31", desc: "增加扩展js模板默认方法" },
        { date: "2022-03-14 01:40:12", desc: "优化日志文件" },
        { date: "2022-03-14 01:39:11", desc: "优化表单示例" },
        {
          date: "2022-03-14 01:38:54",
          desc: "修复vue3版本http.js中get方法自定义header无效的问题",
        },
        {
          date: "2022-03-14 01:38:32",
          desc: "修复vue2版本http.js中get方法自定义header无效的问题",
        },
        {
          date: "2022-03-14 01:37:45",
          desc: "增加vue3版本表单级联数据源自动转换功能",
        },
        {
          date: "2022-03-14 01:37:29",
          desc: "增加vue2版本表单级联数据源自动转换功能",
        },
        { date: "2022-03-08 22:56:35", desc: "增加vue2版本npm install.bat" },
        {
          date: "2022-03-03 00:28:42",
          desc: "优化代码生成器sqlserver数据库nvarchar长度判断",
        },
        { date: "2022-03-03 00:28:06", desc: "添加vs警告配置" },
        { date: "2022.02", type: "month" },

        { date: "2022-02-27 01:45:01", desc: "优化vue3版本treetable示例" },
        { date: "2022-02-27 01:44:10", desc: "优化vue3版本treetable示例" },
        { date: "2022-02-27 01:30:55", desc: "重写vue3版本一对多的示例代码" },
        { date: "2022-02-27 01:30:42", desc: "重写vue2版本一对多的示例代码" },
        {
          date: "2022-02-27 00:14:27",
          desc: "优化vue3版本volform组件switch字段默认为0(否)",
        },
        {
          date: "2022-02-26 23:47:04",
          desc: "增加vue2版本voltable只读readonly属性(设置后表格不能编辑),增加非编辑列点击时不再开启编辑操作",
        },
        {
          date: "2022-02-26 19:21:12",
          desc: "优化vue2版本表单中的编辑器为懒加载(建议更新volform组件、更新后打包体积会减少3/5、打包时间会提升3倍)",
        },
        {
          date: "2022-02-20 02:39:56",
          desc: "移除vue3版本voltable快捷编辑a标签下划线",
        },
        { date: "2022-02-20 02:35:46", desc: "优化vue3版本voltable滚动条样式" },
        {
          date: "2022-02-20 02:32:32",
          desc: "增加ApiBaseController方法JsonNormal默认日期格式处理",
        },
        {
          date: "2022-02-20 01:59:01",
          desc: "增加vue3版本table双击行事件参数判断",
        },
        { date: "2022-02-20 01:48:00", desc: "增加登陆异常排除文档说明" },
        {
          date: "2022-02-20 01:40:06",
          desc: "优化ApiBaseController中GetPageData方法",
        },
        {
          date: "2022-02-20 01:35:33",
          desc: "启用vue3版本代码生成器的表别名功能",
        },
        {
          date: "2022-02-20 01:26:24",
          desc: "优化vue版本voltable属性placeholder",
        },
        {
          date: "2022-02-20 01:20:18",
          desc: "完善代码生器、前后端发布及更新文档说明",
        },
        {
          date: "2022-02-20 01:13:34",
          desc: "强制开启vue3版本联级可以选择任意节点",
        },
        {
          date: "2022-02-20 01:13:21",
          desc: "强制开启vue2版本联级可以选择任意节点",
        },
        {
          date: "2022-02-20 01:05:40",
          desc: "优化vue3版本placeholder属性显示",
        },
        { date: "2022-02-20 01:01:39", desc: "优化vue3登陆页面" },
        { date: "2022.01", type: "month" },
        { date: "2022-01-26 10:58:07", desc: "Update 表结构与数据.sql" },

        { date: "2022-01-23 12:14:41", desc: "完善文档" },
        { date: "2022-01-15 18:57:29", desc: "移除vue3重复代码" },
        { date: "2022-01-11 22:59:47", desc: "提交vue2版本导出遗漏方法" },
        { date: "2022-01-08 17:27:19", desc: "更新菜单脚本" },
        {
          date: "2022-01-08 16:57:10",
          desc: "集成vue2、3 voltable多级表头示例",
        },
        {
          date: "2022-01-08 16:56:19",
          desc: "集成vue2版本voltable多级表头功能",
        },
        {
          date: "2022-01-08 16:55:30",
          desc: "集成vue3版本voltable多级表头功能",
        },
        {
          date: "2022-01-08 16:05:39",
          desc: "增加明细表导入、导出、自定义导出文件名、优化导出方式(更新文件：后台Template文件夹、ApiBaseController.cs、ServiceBase.cs、Sys_TableInfoService.cs前端：methods.js、ViewGrid.vue)",
        },
        {
          date: "2022-01-08 16:00:56",
          desc: "增加vue3版本明细表导入导出功能",
        },
        {
          date: "2022-01-08 15:59:54",
          desc: "增加代码生成器对明细表导入导出的支持",
        },
        {
          date: "2022-01-08 15:58:23",
          desc: "增加vue2版本明细表自动导入、导出",
        },
        {
          date: "2022-01-08 15:56:19",
          desc: "增加vue2版本明细表自动导入、导出",
        },
        {
          date: "2022-01-08 14:06:03",
          desc: "增加vue2版本多表tabs多页签显示示例",
        },
        {
          date: "2022-01-08 14:05:49",
          desc: "增加vue3版本多表tabs多页签显示示例",
        },
        {
          date: "2022-01-08 14:05:40",
          desc: "增加vue3版本多表tabs多页签显示示例",
        },
        { date: "2022-01-08 12:55:40", desc: "添加Swagger发布配置" },
        { date: "2022-01-06 22:59:32", desc: "更新mysql脚本" },
        { date: "2022-01-03 20:24:56", desc: "完善文件" },
        {
          date: "2022-01-03 20:20:44",
          desc: "暂时屏蔽vue3版本的快捷查询的日期类型",
        },
        { date: "2022-01-03 20:12:31", desc: "优化vue2版本快捷查询显示方式" },
        { date: "2022-01-03 20:11:39", desc: "优化vue3版本快捷查询显示方式" },
        {
          date: "2022-01-03 20:01:23",
          desc: "完善演示vue3版本表单设置设计器下载及使用功能",
        },
        { date: "2022-01-03 19:58:38", desc: "更新最新开发版数据库脚本" },
        {
          date: "2022-01-03 18:10:14",
          desc: "增加通过List对象导出excel方法：EPPlusHelper.ExportGeneralExcel",
        },

        { date: "2021.12", type: "month" },
        {
          date: "20211-12-30 13:50:50",
          desc: "Merge pull request #214 from cd-linxi/master",
        },
        {
          date: "20211-12-28 16:05:17",
          desc: "1.显示控制器xml注释内容 2.添加过滤器 可自定义添加对控制器的注释描述",
        },
        {
          date: "20211-12-28 15:21:01",
          desc: "swagger文档分组显示，swagger对控制器描述",
        },
        {
          date: "20211-12-20 22:29:48",
          desc: "Merge pull request #213 from cd-linxi/master",
        },
        { date: "20211-12-20 17:16:05", desc: "增加批量点阅发布的方法" },
        { date: "20211-12-20 15:36:35", desc: "kafka异常日志记录" },
        { date: "20211-12-17 18:13:19", desc: "kafka" },
        { date: "2021-12-12 20:58:55", desc: "增加[前后台发布在一起]文档" },
        {
          date: "2021-12-12 20:44:23",
          desc: "优化Startup.cs 中swagger启动方式",
        },
        {
          date: "2021-12-12 20:34:21",
          desc: "优化vue2版本明细表强制刷新合计时判断",
        },
        {
          date: "2021-12-12 20:32:45",
          desc: "优化vue3版本明细表强制刷新合计时判断",
        },
        {
          date: "2021-12-01 09:27:58",
          desc: "(Cookie Tang)添加一个GetRealDetailType的函数用来获取从表的类型，如果从表使用的是view直接重载这个函数即可",
        },
        { date: "2021.11", type: "month" },
        {
          date: "2021-11-30 00:33:23",
          desc: "(Cookie Tang)Table Select 添加value参数",
        },
        { date: "2021-11-29 22:56:26", desc: "优化vue3版本home页面" },
        {
          date: "2021-11-29 00:41:54",
          desc: "(Cookie Tang)table字段设置Select时readonly无效",
        },
        { date: "2021-11-27 23:45:51", desc: "优化vue2版本volheader样式" },
        { date: "2021-11-27 23:44:10", desc: "增加vue3版本文档" },
        { date: "2021-11-27 23:27:15", desc: "增加取消跨域文档" },
        { date: "2021-11-27 23:07:52", desc: "修复多选没有提示的问题" },
        {
          date: "2021-11-27 22:40:24",
          desc: "修复vue3版本表单多选校验没有提示的问题",
        },
        {
          date: "2021-11-27 22:32:41",
          desc: "升级element plus到1.0.2-beta.71(更新package.json文件后执行npm install)",
        },
        {
          date: "2021-11-21 21:45:39",
          desc: "修复vue3版本vol-table编辑日期时前缀被挡住的问题",
        },
        {
          date: "2021-11-21 21:37:12",
          desc: "修复vue3版本input回车执行两次的问题",
        },
        {
          date: "2021-11-21 21:17:24",
          desc: "调整viewgrid表单组件同步引用(避免首次加载闪动的问题)",
        },
        {
          date: "2021-11-21 21:16:34",
          desc: "修复vue2版本快捷查询字段为日期时二次查询日期格式没有转换的问题",
        },
        { date: "2021-11-18 22:37:02", desc: "完善文档" },
        { date: "2021-11-18 22:32:16", desc: "增加sqldapper异步操作" },
        { date: "2021-11-18 21:52:29", desc: "提交vue2版本遗漏更新" },
        {
          date: "2021-11-18 21:50:28",
          desc: "移除vue2版本表单中moment组件引入",
        },
        {
          date: "2021-11-18 21:49:14",
          desc: "增加vue2版本voltable编辑时阻止无效事件触发",
        },
        {
          date: "2021-11-18 21:36:50",
          desc: "弃用vue3版本voltable方法@cell-mouse-leave='rowEndEdit'",
        },
        {
          date: "2021-11-18 21:36:14",
          desc: "修复vue3版本el-input没有默认enter事件时回车异常",
        },
        {
          date: "2021-11-18 21:35:22",
          desc: "调整首页文档跳转地址与默认主题蓝色",
        },
        { date: "2021.10", type: "month" },
        { date: "2021-10-17 20:24:41", desc: "优化示例页面" },
        {
          date: "2021-10-17 20:23:50",
          desc: "修复vue3版本弹出框关闭后不能打开的问题",
        },
        {
          date: "2021-10-17 19:49:11",
          desc: "修复vue3版本查询级联不能绑定数据源、级联不能二级刷新的问题",
        },
        { date: "2021-10-17 19:48:26", desc: "增加表单实时方法计算" },
        { date: "2021-10-12 21:04:13", desc: "增加属性校验long类型的支持" },

        { date: "2021.09", type: "month" },
        {
          date: "2021-09-27 00:34:03",
          desc: "增加vue3版本文件上传组件自动获取文件名",
        },
        {
          date: "2021-09-27 00:33:54",
          desc: "增加vue2版本文件上传组件自动获取文件名",
        },
        { date: "2021-09-27 00:26:29", desc: "移除vue3版本中的vue2语法" },
        {
          date: "2021-09-27 00:21:22",
          desc: "增加vue2版本明细表从弹出框中选择数据示例",
        },
        {
          date: "2021-09-27 00:05:11",
          desc: "增加vue3版本明细表从弹出框中选择数据(见菜单：主从一对一(2))",
        },
        {
          date: "2021-09-26 23:30:02",
          desc: "重写vue3版本编辑弹出框选择数据示例",
        },
        {
          date: "2021-09-26 23:02:34",
          desc: "重写vue2版本编辑弹出框从table选择数据示例",
        },
        { date: "2021-09-26 22:40:10", desc: "优化vue3版本编辑组件属性" },
        { date: "2021-09-26 22:39:53", desc: "优化vue2版本编辑组件属性" },
        { date: "2021-09-26 22:33:16", desc: "集成vue3版本time组件" },
        { date: "2021-09-25 17:12:21", desc: "完善文档" },
        { date: "2021-09-25 16:58:25", desc: "增加代码生成器保存时提示信息" },
        {
          date: "2021-09-25 16:19:48",
          desc: "model验证时启动是否移除不存在字段判断",
        },
        { date: "2021-09-25 16:14:57", desc: "调整代码生成器默认列宽度" },
        {
          date: "2021-09-25 16:12:32",
          desc: "修复vue3版本文件上传后不能同时下载的问题(VolUpload.vue)",
        },
        {
          date: "2021-09-25 16:12:04",
          desc: "修复vue2版本文件上传后不能同时下载的问题(VolUpload.vue)",
        },
        {
          date: "2021-09-25 15:57:58",
          desc: "增加vue2版本明细表删除、修改时重新计算行数与汇总(更新detailMethods.js)",
        },
        {
          date: "2021-09-25 15:56:55",
          desc: "增加vue3版本明细表删除、修改时重新计算行数与汇总(更新detailMethods.js)",
        },
        { date: "2021-09-25 15:36:55", desc: "优化vue3版本隐藏按钮操作" },
        {
          date: "2021-09-25 15:24:32",
          desc: "修复vue2/3上传文件示例路径逻辑处理错误的问题(示例错误不涉及组件更新)",
        },
        {
          date: "2021-09-25 14:36:00",
          desc: "移除获取字典Sys_Dictionary异步方法中的同步调用",
        },
        { date: "2021-09-21 23:40:19", desc: "完善文档" },
        {
          date: "2021-09-21 23:11:37",
          desc: "修复vue3版本table合计不能实时计算的问题，优化table点击编辑事件",
        },
        { date: "2021-09-21 22:57:06", desc: "增加编辑时对readonly属性判断" },
        { date: "2021-09-21 22:40:24", desc: "移除table强制固定第一列" },
        {
          date: "2021-09-17 00:23:46",
          desc: "修复vue3版本编辑器输入时跳转到末尾的问题",
        },
        {
          date: "2021-09-17 00:00:15",
          desc: "修复vue2版本编辑器输入时跳转到末尾的问题",
        },
        {
          date: "2021-09-16 23:42:10",
          desc: "修复table组件编辑时edge浏览器可能报错的问题",
        },
        {
          date: "2021-09-10 09:31:26",
          desc: "增加GetDbConnection函数，默认行为和指定数据库类型的判断",
        },
        {
          date: "2021-09-09 22:04:01",
          desc: "增加EF动态查询条件扩展(使用方式见后台开发文档)",
        },
        {
          date: "2021-09-09 19:14:42",
          desc: "Dapper 连接其他数据库数可指定类型 //MySql/MsSql/PgSql,见DBServerProvider.cs",
        },
        { date: "2021-09-06 21:28:49", desc: "提交编辑器遗漏文件" },
        { date: "2021-09-05 23:53:21", desc: "简化vue2编辑器内容发布代码" },
        {
          date: "2021-09-05 22:51:11",
          desc: "替换kindeditor为wangEditor编辑器(更新VolForm.vue、VolWangEditor.vue再执行npm i wangeditor --save安装编辑器)",
        },
        {
          date: "2021-09-05 22:48:37",
          desc: "移除vue2版本强制排序改为代码生成器控制",
        },
        {
          date: "2021-09-05 22:39:03",
          desc: "增加vue3版本代码生成器配置排序功能",
        },
        {
          date: "2021-09-05 22:05:41",
          desc: "修复vue3版本同一个页面使用多个编辑器异常的问题",
        },
        {
          date: "2021-09-05 21:41:16",
          desc: "移除vue2/3版本查询界面强制排序改为代码生成控制(更新文件methods.js、Sys_TableInfoService.cs)",
        },
        { date: "2021-09-05 21:29:18", desc: "vue3版本移除文件上传默认必填" },
        { date: "2021-09-05 21:22:43", desc: "增加vue3版本按回车快捷查询" },
        { date: "2021.08", type: "month" },
        {
          date: "2021-08-30 02:29:02",
          desc: "增加vue3版本低代码设计器(需要更新formDraggable、VolFormDraggable文件夹、package.json,更新后执行npm install)",
        },
        { date: "2021-08-30 02:26:00", desc: "优化vue3版本表单宽度计算" },
        { date: "2021-08-30 02:25:24", desc: "增加vue3手动调用菜单收缩方法" },
        {
          date: "2021-08-22 23:06:29",
          desc: "完善vue3版本个人中心修改密码功能",
        },
        {
          date: "2021-08-22 22:55:55",
          desc: "优化vue2版本查询界面级联表单只读时判断",
        },
        {
          date: "2021-08-22 22:49:58",
          desc: "修复vue版本级联表单只读时字典没有转换的问题",
        },
        { date: "2021-08-22 22:36:28", desc: "完善其他文档" },
        {
          date: "2021-08-22 22:32:12",
          desc: "增加判断页面是否有某个按钮权限文档",
        },
        {
          date: "2021-08-22 21:54:39",
          desc: "增加手动取消实体跟踪方法(更新RepositoryBase.cs,IRepositoryBase.cs)",
        },
        { date: "2021-08-22 21:47:48", desc: "增加多表关联生成代码文档" },
        { date: "2021-08-22 21:45:14", desc: "增加后台重写权限示例及文档" },
        {
          date: "2021-08-22 21:18:59",
          desc: "移除数据隔离(租房管理)对超级管理员的判断",
        },
        { date: "2021-08-17 18:48:49", desc: "移除从表更新时的数据库查询" },
        { date: "2021-08-17 18:45:30", desc: "优化vue3版本登陆页面" },
        { date: "2021-08-16 02:20:38", desc: "完善voltable文档" },
        {
          date: "2021-08-16 02:12:19",
          desc: "调整vue2/3版本表单数字字段最小值为0",
        },
        { date: "2021-08-16 02:09:00", desc: "优化vue3树形table示例" },
        {
          date: "2021-08-16 01:48:46",
          desc: "修复vue3版本改变分页大小后实际分页大小没有变化的问题",
        },
        {
          date: "2021-08-16 01:46:34",
          desc: "修复vue3版同一页面使用多个table时，不能正确获取选中行数据的问题",
        },
        {
          date: "2021-08-16 01:44:17",
          desc: "修复vue3版table双击事件无效的问题",
        },
        {
          date: "2021-08-16 01:43:20",
          desc: "修复vue3版个人中心表单不能输入的问题",
        },
        {
          date: "2021-08-16 01:39:19",
          desc: "修复vue2/3保存前异步语法写错的问题",
        },
        { date: "2021-08-05 00:22:39", desc: "优化vue2版本render渲染表单文档" },
        { date: "2021-08-05 00:22:39", desc: "优化vue2版本render渲染表单文档" },
        {
          date: "2021-08-04 23:06:32",
          desc: "修复vue3版本首页头像加载失败的问题",
        },
        {
          date: "2021-08-04 22:58:45",
          desc: "优化vue3版本代码生成器views路径保存功能",
        },
        { date: "2021-08-04 22:52:38", desc: "优化vue3版本路由加载异常的提示" },
        { date: "2021-08-04 22:52:04", desc: "优化vue3版本新建用户名只读功能" },
        { date: "2021-08-04 22:51:36", desc: "优化Vue3版本表单只读验证规则" },
        { date: "2021-08-03 23:11:54", desc: "优化vue3版本一对一主从页面" },
        { date: "2021-08-03 23:09:30", desc: "优化vue3版本table表格高度显示" },
        { date: "2021-08-03 22:39:57", desc: "增加配置文件跨域vue3地址" },
        { date: "2021-08-03 22:37:25", desc: "修复Vue3版本不能删除配置的问题" },
        { date: "2021-08-03 19:32:44", desc: "优化Vue3版本静态页面示例" },
        { date: "2021-08-03 19:32:11", desc: "优化Vue3版本一对一示例代码" },
        { date: "2021-08-03 19:31:30", desc: "优化Vue3版本登陆页面外链跳转" },
        { date: "2021-08-03 19:30:50", desc: "优化Vue3版本首页高度适应" },
        { date: "2021-08-03 19:29:33", desc: "README.md" },
        { date: "2021-08-03 19:29:10", desc: "优化vue3版本http.js提示信息" },
        { date: "2021-08-02 02:41:37", desc: "上传vue3版本图片及使用说明" },
        { date: "2021-08-02 02:37:46", desc: "初始化框架vue3项目" },
        {
          date: "2021-08-02 02:37:20",
          desc: "增加码生成器对框架vue3版本的支持",
        },
        { date: "2021-08-02 02:31:08", desc: "优化菜单组件图标判断" },

        { date: "2021.07", type: "month" },
        {
          date: "2021-07-28 00:30:19",
          desc: "Merge branch 'master' of https://github.com/cq-panda/Vue.NetCore",
        },
        {
          date: "2021-07-27 23:11:07",
          desc: "增加代码生成器table列显示类型date(自动格式化)",
        },
        {
          date: "2021-07-27 21:48:12",
          desc: "修复代码生成器明细表中文名不能二次修改的问题",
        },
        { date: "2021-07-27 12:36:50", desc: "同步mysql脚本字典" },
        {
          date: "2021-07-17 12:45:01",
          desc: "修复扩展组件在某些情况下不能复用的问题(更新 ViewGird.vue组件)",
        },
        {
          date: "2021-07-17 12:25:06",
          desc: "移除对表单只读取时空值验证(更新 VolForm.vue组件)",
        },
        {
          date: "2021-07-17 03:18:05",
          desc: "增加编辑框(明细)从表select下拉框选择事件示例文档",
        },
        {
          date: "2021-07-17 03:17:29",
          desc: "调整voltable点击其他行结束编辑(原先默认为鼠标离开结束编辑)",
        },
        {
          date: "2021-07-17 03:00:13",
          desc: "设置element的弹出框层zIndex高度(解决与其他组件可能弹出层冲突的问题)",
        },
        {
          date: "2021-07-17 02:58:11",
          desc: "增加编辑表单文字超长、编辑表单输回车事件、输入事件使用文档",
        },
        {
          date: "2021-07-17 02:43:01",
          desc: "增加日期范围选择示例及其他文档补充",
        },
        {
          date: "2021-07-17 02:40:54",
          desc: "集成iview日期可选范围(更新 VolForm.vue组件)",
        },
        { date: "2021-07-17 01:10:02", desc: "升级echarts到5.0.2版本" },
        { date: "2021-07-16 01:12:48", desc: "准备升级vue3.0" },
        {
          date: "2021-07-12 00:03:33",
          desc: "增加弹出框关闭、表格双击事件使用文档",
        },
        {
          date: "2021-07-11 23:12:47",
          desc: "增加弹出框关闭点击事件(更新文件VolBox.vue、ViewGrid.vue、serviceFilter.js,使用方法见：前端开发文档(弹出框关闭事件)、组件api:onModelClose方法)",
        },
        { date: "2021-07-11 22:52:03", desc: "修复不能获取三级以下角色的问题" },
        {
          date: "2021-07-11 16:15:14",
          desc: "移除sqlserver初始化数据库脚本重复表名",
        },
        {
          date: "2021-07-04 23:15:20",
          desc: "增加后台强制返回、明细自定义查询、自定义编辑字段、自定义查询排序表达式文档",
        },
        {
          date: "2021-07-04 23:13:54",
          desc: "增加删除、修改、新增时可以设置Code='-1'强制返回执行结果(具体见【后台基础代码扩展实现】文档)",
        },
        { date: "2021-07-04 22:58:32", desc: "增加自定排序按条件表达式" },

        { date: "2021.06", type: "month" },
        {
          date: "2021-06-27 23:01:26",
          desc: "增加Statrtup.cs启动默认创建upload文件夹及禁用跨域说明",
        },
        {
          date: "2021-06-27 22:50:26",
          desc: "修复AddRangeAsync方法参数错误的问题",
        },
        { date: "2021-06-20 01:04:21", desc: "调整voltable默认固定列规则" },
        {
          date: "2021-06-19 23:58:52",
          desc: "增加谷歌内核浏览判断,重新计算table高度",
        },
        {
          date: "2021-06-19 23:52:40",
          desc: "修复treetable删除后刷新无效的问题",
        },
        { date: "2021-06-06 14:59:21", desc: "调用明细表单元格高度" },
        { date: "2021-06-06 14:35:43", desc: "增加table tree后台使用说明" },
        { date: "2021-06-06 14:31:53", desc: "优化tabletree错位的问题" },
        { date: "2021-06-05 01:42:36", desc: "优化查询界面样式" },
        { date: "2021-06-05 01:09:31", desc: "更新文档" },
        {
          date: "2021-06-05 00:45:07",
          desc: "优化显示所有固定查询样式(修改文件viewgrid.less,viewgrid.vue,methods.js)",
        },
        {
          date: "2021-06-04 23:31:45",
          desc: "修复element table tree不刷新的问题",
        },
        { date: "2021-06-04 23:31:09", desc: "移除刷新按钮" },
        {
          date: "2021-06-04 22:49:37",
          desc: "增加导入excel时对5位数字日期格式处理",
        },
        { date: "2021.05", type: "month" },
        {
          date: "2021-05-30 19:43:59",
          desc: "修复下拉框清除数据后台接收不到空值的问题",
        },
        { date: "2021-05-30 18:49:29", desc: "优化sqldapper多对象查询" },
        { date: "2021-05-26 15:42:51", desc: "优化kindeditor编辑器404错误" },
        { date: "2021-05-23 15:58:41", desc: "集成table双击行事件" },
        { date: "2021-05-23 15:34:04", desc: "加深查询界面标题颜色" },
        {
          date: "2021-05-23 15:21:01",
          desc: "设置查询界面table默认开启排序功能",
        },
        { date: "2021-05-23 15:04:12", desc: "集成vue-count-to" },
        {
          date: "2021-05-23 03:38:27",
          desc: "修复sqldapper事务未实例化的问题，移除sqldapper mysql批量插入双引号的替换",
        },
        { date: "2021-05-17 23:07:13", desc: "优化H5" },
        {
          date: "2021-05-17 22:16:17",
          desc: "修复SqlDapper在mysql中使用异常的问题",
        },
        {
          date: "2021-05-16 21:50:11",
          desc: "增加dapper连接其他数据库使用说明",
        },
        {
          date: "2021-05-16 21:49:45",
          desc: "增加表单select动态显示、隐藏下拉框选项",
        },
        { date: "2021-05-16 21:20:24", desc: "集成代码生成iview radio组件" },
        {
          date: "2021-05-16 13:41:47",
          desc: "修复SqlDapper逻辑处理错误的问题(建议更新,更新文档SqlDapper.cs,ISqlDapper.cs)",
        },
        { date: "2021-05-14 00:05:40", desc: "重写菜单、权限分配页面样式" },
        {
          date: "2021-05-12 20:03:30",
          desc: "修复repository删除时实际表名获取错误的问题",
        },
        { date: "2021-05-08 20:02:28", desc: "修复token续期刷新失败的问题" },
        { date: "2021-05-07 21:04:55", desc: "修复H5表单拼写错误的问题" },
        { date: "2021-05-07 21:03:38", desc: "移除http.get无用的错误代码" },
        {
          date: "2021-05-07 09:32:03",
          desc: "修复element升级后表格错位的问题",
        },
        { date: "2021-05-05 21:02:10", desc: "增加Oracle版" },
        { date: "2021-05-05 14:10:12", desc: "封装dapper类型SetTimeout方法" },
        { date: "2021-05-02 23:43:53", desc: "更新基础数据库脚本" },
        { date: "2021-05-02 18:43:08", desc: "增加最新菜单数据库脚本" },
        {
          date: "2021-05-02 18:24:33",
          desc: "优化element升级2.14.1版本后表格错位的问题",
        },
        {
          date: "2021-05-02 15:38:41",
          desc: "增加treetable使用文档及完善其他文档使用",
        },
        {
          date: "2021-05-02 15:27:19",
          desc: "集成treetable，需要更新(package-lock.json,ViewGrid.vue,methods.js,VolTable.vue);注意更新后需要在前端vol.vue文件夹下重新执行下npm install命令",
        },
        { date: "2021-05-02 14:11:26", desc: "升级element版本2.4.11" },
        {
          date: "2021-05-02 00:32:29",
          desc: "增加代码生成器区间查询(需要更新文件Sys_TableInfoService.cs,methods.js,VolForm.vue,builderData.js)",
        },
        {
          date: "2021-05-01 23:59:28",
          desc: "增加table事件版本兼容处理(freesaber)",
        },
        {
          date: "2021-05-01 14:36:42",
          desc: "完善前端http请求文档(现在可以设置请求超时时间，自定义请求头等信息)",
        },
        {
          date: "2021-05-01 14:26:57",
          desc: "重写http.js、token过期自动刷新机制(需要更新前端http.js,后台Sys_UserController.cs,ApiAuthorizeFilter.cs,HttpRequestMiddleware.cs)",
        },
        { date: "2021-05-01 14:22:58", desc: "优化文档" },
        { date: "2021-05-01 14:22:34", desc: "优化dapper" },
        { date: "2021.04", type: "month" },
        {
          date: "2021-04-24 23:30:47",
          desc: "修复多文件分批上传url路径指向错误的问题(freesaber)",
        },
        {
          date: "2021-04-23 00:13:50",
          desc: "修复mysql数据库MySqlBulkLoader批量插入在linux上数据丢失的问题",
        },
        { date: "2021-04-20 23:10:40", desc: "封装Dapper dynamic查询" },
        { date: "2021-04-20 23:10:01", desc: "增加EF AddAsync封装" },
        { date: "2021-04-19 21:42:37", desc: "优化连续添加对返的状态的判断" },
        {
          date: "2021-04-18 20:05:49",
          desc: "增加新建时设置表单select下拉框默认选中值文档及其他文档",
        },
        {
          date: "2021-04-18 19:32:59",
          desc: "增加EF多表关联、获取用户所有子角色文档",
        },
        { date: "2021-04-18 19:19:35", desc: "加深table表头字段颜色" },
        { date: "2021-04-18 19:19:05", desc: "加深表单label字体颜色" },
        { date: "2021-04-18 19:13:29", desc: "调整登陆页面样式" },
        { date: "2021-04-18 19:11:29", desc: "重写volupload文件上传组件" },
        { date: "2021-04-11 17:41:10", desc: "完善开发文档" },
        { date: "2021-04-11 17:38:43", desc: "增加建新时，连续添加功能" },
        {
          date: "2021-04-11 16:56:32",
          desc: "代码生成页面增加destroyed页面销毁方法",
        },
        {
          date: "2021-04-11 16:32:53",
          desc: "隐藏框架swagger默认接口(只保留GetPageData)",
        },
        { date: "2021-04-05 11:16:31", desc: "完整数据库访问文档" },
        { date: "2021-04-05 10:56:49", desc: "优化导出excel时数字类型的转换" },
        {
          date: "2021-04-05 10:49:36",
          desc: "修复递归获取所有子角色可能无限循环的问题",
        },
        { date: "2021-04-05 10:48:47", desc: "更正字符拼写问题" },
        { date: "2021.03", type: "month" },
        {
          date: "2021-03-31 23:07:45",
          desc: "修复表单switch只读时没有转换值的问题",
        },
        { date: "2021-03-20 23:01:58", desc: "增加H5图片上数量限制" },
        {
          date: "2021-03-20 15:54:34",
          desc: "更新演示环境mysql与sqlserver菜单脚本",
        },
        { date: "2021-03-20 15:11:30", desc: "增加主题颜色" },
        { date: "2021-03-20 14:37:51", desc: "优化编辑弹出框明细表样式" },
        { date: "2021-03-20 14:30:02", desc: "修复明细表格错位" },
        { date: "2021-03-20 14:22:12", desc: "优化主从明细加载demo" },
        { date: "2021-03-20 14:07:32", desc: "替换默认图片" },
        {
          date: "2021-03-20 13:50:18",
          desc: "修复自定义二次打开$tabs时参数丢失的问题",
        },
        { date: "2021-03-20 13:49:53", desc: "缩进用户管理页面宽度" },
        { date: "2021-03-20 13:35:47", desc: "增加table使用示例及文档" },
        { date: "2021-03-20 12:39:06", desc: "优化表单demo" },
        { date: "2021-03-20 00:02:39", desc: "增加查询界面table表格编辑demo" },
        {
          date: "2021-03-20 00:02:05",
          desc: "增加查询界面table可以直接对表格编辑功能",
        },
        { date: "2021-03-19 22:22:20", desc: "增加H5下拉框只读字典翻译" },
        { date: "2021-03-14 23:41:43", desc: "增加一对一、一对多详细使用demo" },
        {
          date: "2021-03-06 17:39:37",
          desc: "增加生成前端页面生成到指定文件夹下(原来生成到项目类库名下,原有文件不受影响)",
        },
        { date: "2021-03-06 17:37:56", desc: "重命名删除方法" },
        { date: "2021-03-06 17:36:42", desc: "增加表单只读时日期格式化处理" },
        { date: "2021-03-06 17:36:07", desc: "增加table多列合并显示demo" },
        { date: "2021.02", type: "month" },
        { date: "2021-02-28 22:11:26", desc: "优化table示例样式" },
        { date: "2021-02-28 21:53:55", desc: "简化多租户配置及文档" },
        { date: "2021-02-28 18:59:57", desc: "完善voltable从后台加载demo" },
        { date: "2021-02-01 20:12:23", desc: "增加表单年月查询" },
        {
          date: "2021-02-01 18:23:19",
          desc: "设置表单多图上传时默认累开启追加功能(以前多图上传重新选择时会移除原来的图片)",
        },
        {
          date: "2021-02-01 18:21:15",
          desc: "修复table表格文件下载路径指向错误的问题",
        },
        { date: "2021.01", type: "month" },
        {
          date: "2021-01-31 16:00:04",
          desc: "增加http.js post方法第4个参数(可以设置自定义响应类型，请求头等，更多参数具体参照axios文档或源码)",
        },
        {
          date: "2021-01-30 23:56:59",
          desc: "增加指定默认排序字段与排序方式文档",
        },
        {
          date: "2021-01-30 22:22:47",
          desc: "增加代码生成器日期组件年月类型，查询/编辑类型选择year_month",
        },
        {
          date: "2021-01-30 22:21:48",
          desc: "增加iview表单日期年月选择及自定义格式",
        },
        {
          date: "2021-01-30 22:20:54",
          desc: "修复火狐table组件checkbox错位问题",
        },
        {
          date: "2021-01-24 22:05:35",
          desc: "修复多选类型，导出excel文件没有转换数据源的问题",
        },
        { date: "2021-01-23 13:48:48", desc: "移除无用文件" },
        {
          date: "2021-01-22 19:39:06",
          desc: "修复一对一从表点击编辑按钮时没有加载从表数据(点击快捷编辑的不受影响)",
        },
        {
          date: "2021-01-16 12:11:41",
          desc: "添加代生成页面表单编辑器图片上传配置",
        },
        { date: "2021-01-16 11:51:48", desc: "完善文档" },
        {
          date: "2021-01-16 11:46:12",
          desc: "增加表格内容超出后是否自动换行属性text-inline（默认不换行）",
        },
        {
          date: "2021-01-16 11:24:21",
          desc: "增加viewgrid、volform集成编辑器功能",
        },
        { date: "2021-01-16 11:23:14", desc: "代码生成器集成编辑器生成功能" },
        {
          date: "2021-01-16 09:30:52",
          desc: "修复http请示loading状态消失问题",
        },
        { date: "2021-01-10 00:55:17", desc: "完善文档" },
        {
          date: "2021-01-10 00:12:57",
          desc: "增加新建、编辑前可以阻止弹出框弹出(使用方法见：组件api->viewgrid文档)",
        },
        {
          date: "2021-01-09 23:48:05",
          desc: "增加代码生成器设置table排序功能",
        },
        { date: "2021-01-09 23:12:56", desc: "优化table显示td单元格大小" },
        {
          date: "2021-01-09 22:35:18",
          desc: "修复mysql使用dapper批量插入乱码的问题(由Flyash提供)",
        },
        { date: "2021-01-09 22:21:01", desc: "增加H5 table加载后的方法" },
        { date: "2021-01-09 22:13:38", desc: "调整文件点击下载方式" },
        { date: "2021-01-01 17:50:42", desc: "优化页面加载" },
        { date: "2021-01-01 17:49:06", desc: "优化登陆页面" },
        {
          date: "2021-01-01 17:07:42",
          desc: "修改页面加载样式，修改文件index.html,App.vue",
        },
        {
          date: "2021-01-01 16:59:59",
          desc: "优选代码生成器提示只能选择一个主键字段",
        },
        {
          date: "2021-01-01 16:44:54",
          desc: "优化导入excel时字典数据确实时提示信息",
        },
        {
          date: "2021-01-01 16:40:45",
          desc: "优化基础控制器(现在可以重写基础控制器方法)",
        },
        { date: "2020.12", type: "month" },
        { date: "2020-12-29 22:05:51", desc: "提供最新sqlserver数据库脚本" },
        { date: "2020-12-29 12:25:21", desc: "优化首页菜单组件" },
        { date: "2020-12-28 23:00:23", desc: "优化首页白色主题背景颜色" },
        {
          date: "2020-12-28 22:59:52",
          desc: "优化首页菜单只显示根据节点为0的数据",
        },
        { date: "2020-12-27 19:04:44", desc: "完善文档" },
        { date: "2020-12-27 19:03:00", desc: "增加上传组件默认base64的支持" },
        {
          date: "2020-12-27 18:26:35",
          desc: "增加菜单不显示也可以分配仅限功能，需要更新文件VolElementMenu.vue  VolElementMenuChild.vue  Sys_Menu.vue   Sys_MenuService.cs  UserContext.cs",
        },
        {
          date: "2020-12-27 13:38:48",
          desc: "增加编辑保存后不重置分页页数(停留在当前页的数据)",
        },
        { date: "2020-12-27 13:12:54", desc: "增加表单render渲染额外属性" },
        { date: "2020-12-26 23:29:07", desc: "增加主从表demo" },
        { date: "2020-12-26 19:21:44", desc: "移除模板多余引用" },
        {
          date: "2020-12-21 19:40:45",
          desc: "增加菜单收缩功能更新文件：更新文件VolElementMenuChild.vue 、VolElementMenu.vue 、Index.vue",
        },
        {
          date: "2020-12-19 13:36:32",
          desc: "优化角色上级角色字段界面编辑或者新建时可以选择任意节点",
        },
        { date: "2020-12-19 13:29:06", desc: "增加前端禁止缓存与完善其他文档" },
        {
          date: "2020-12-19 13:09:50",
          desc: "增加table单元格为img时，可以自定义formatter及对base64图片的默认支持",
        },
        {
          date: "2020-12-19 12:47:06",
          desc: "设置编辑器demo禁用缓存keepAlive",
        },
        {
          date: "2020-12-19 12:37:09",
          desc: "修复自定义导出列配置属性为不显示时导出表头没有转换的问题",
        },
        { date: "2020-12-16 20:53:25", desc: "优化日志文件" },
        { date: "2020-12-16 20:52:39", desc: "优化代码生成器命名空间" },
        { date: "2020-12-13 15:29:34", desc: "增加自定义按钮权限控制操作文档" },
        {
          date: "2020-12-13 14:44:12",
          desc: "设置表单只读时也可以设置额外属性",
        },
        { date: "2020-12-13 14:30:15", desc: "添加table背景颜色文档" },
        { date: "2020-12-13 14:00:14", desc: "增加table单元格颜色" },
        {
          date: "2020-12-13 12:45:16",
          desc: "增加查询页面模板默认ref=grid属性",
        },
        {
          date: "2020-12-13 12:36:26",
          desc: "修复表单select/checkbox为只读时字典没有转换的问题",
        },
        {
          date: "2020-12-13 12:24:34",
          desc: "增加查询界面更多按钮项目hidden属性",
        },
        { date: "2020-12-13 12:41:11", desc: "修复H5图片上传路径错误的问题" },
        { date: "2020-12-13 12:40:41", desc: "优化白色主题" },
        { date: "2020-12-13 09:50:39", desc: "提交遗漏文件" },
        { date: "2020-12-06 17:26:31", desc: "添加自定义多个弹出框及其他文档" },
        {
          date: "2020-12-06 16:13:31",
          desc: "导入、审核、数据结构弹出框开启默认延迟加载",
        },
        { date: "2020-12-06 16:12:49", desc: "弹出框增加lazy延迟加载功能" },
        {
          date: "2020-12-06 15:49:28",
          desc: "增加viewgrid组件新建与编辑前异步方法同步处理",
        },
        { date: "2020-12-06 15:34:33", desc: "优化白色与黑色主题" },
        { date: "2020-12-06 15:24:01", desc: "增加h5图片上传示例" },
        { date: "2020-12-06 15:20:36", desc: "增加H5图片上传功能" },
        { date: "2020-12-06 10:36:58", desc: "优化H5标题栏在app上适配" },
        {
          date: "2020-12-02 12:39:48",
          desc: "修复前端tree转换三级节点为空的问题",
        },
        { date: "2020.11", type: "month" },
        { date: "2020-11-29 16:45:20", desc: "更新图片" },
        { date: "2020-11-29 16:45:07", desc: "更新图片" },
        { date: "2020-11-29 16:34:26", desc: "更新demo" },
        { date: "2020-11-29 16:07:58", desc: "补充其他文档" },
        { date: "2020-11-29 16:06:12", desc: "增加查询界面hidden属性" },
        {
          date: "2020-11-29 16:00:41",
          desc: "修复tree节点转换排序可能错乱的问题",
        },
        { date: "2020-11-29 15:43:51", desc: "增加动态隐藏查询页面按钮文档" },
        { date: "2020-11-29 15:23:18", desc: "增加table编辑结束方法" },
        { date: "2020-11-29 15:00:52", desc: "优化登陆页面input标签样式" },
        { date: "2020-11-29 14:58:09", desc: "添加开发忽略文件" },
        { date: "2020-11-22 22:14:38", desc: "清理无用文件" },
        { date: "2020-11-22 18:13:05", desc: "替换logo" },
        { date: "2020-11-22 18:07:02", desc: "更换favicon" },
        {
          date: "2020-11-21 20:54:26",
          desc: "增加controller返回json原格式方法JsonNormal(默认是驼峰格式)",
        },
        { date: "2020-11-21 16:10:30", desc: "优化h5提示信息" },
        { date: "2020-11-21 15:57:15", desc: "优化首页白色主题" },
        {
          date: "2020-11-21 15:38:29",
          desc: "增加表单动态显示与隐藏文档及日志",
        },
        {
          date: "2020-11-21 15:27:32",
          desc: "增加表单动态控制标签显示、隐藏属性hidden",
        },
        { date: "2020-11-21 14:43:46", desc: "增加EF执行原生sql文档" },
        {
          date: "2020-11-21 14:36:18",
          desc: "修复sqlserver使用dapper操作AddRange批量写入主键类型判断错误",
        },
        { date: "2020-11-21 14:34:33", desc: "增加代码生成器使用说明" },
        {
          date: "2020-11-21 14:22:09",
          desc: "增加Controller、Service中构造方法获取实例文档，补充代码生成器文档",
        },
        { date: "2020-11-20 23:12:01", desc: "更新sqlserver字典数据库脚本" },
        { date: "2020-11-17 20:26:25", desc: "优化H5表单与http.js" },
        { date: "2020-11-14 15:04:01", desc: "增加快捷查询时日期单选操作" },
        { date: "2020-11-14 15:02:18", desc: "清理mysql开发版脚本" },
        { date: "2020-11-14 14:22:09", desc: "替换刷新token接口" },
        { date: "2020-11-14 14:19:36", desc: "增加h5文档" },
        { date: "2020-11-08 22:06:35", desc: "清理开发版不用数据库脚本" },
        { date: "2020-11-08 21:31:28", desc: "完善首页、菜单功能" },
        {
          date: "2020-11-08 19:47:08",
          desc: "优化table对selectList数据源的绑定",
        },
        { date: "2020-11-08 19:32:21", desc: "增加菜单列表渲染(与PC菜单同步)" },
        { date: "2020-11-08 17:58:16", desc: "优化H5表单多选功能" },
        {
          date: "2020-11-07 15:10:26",
          desc: "增加table点击行选中当前demo及其他文档",
        },
        {
          date: "2020-11-07 15:06:52",
          desc: "增加el-table的点击行事件添加到扩展方法中",
        },
        { date: "2020-11-07 14:01:35", desc: "增加编辑表单自定义验证demo" },
        {
          date: "2020-11-07 13:21:47",
          desc: "修复model验证不能识别负数的问题",
        },
        {
          date: "2020-11-02 18:49:46",
          desc: "修复表单只有一个input时按回车自动提交的问题，修复级联类型判断错误的问题",
        },
        {
          date: "2020-11-01 18:09:26",
          desc: "增加框架自动生成iview级联组件及文档",
        },
        {
          date: "2020-11-01 12:43:23",
          desc: "增加table显示、隐藏序号、checkbox属性",
        },
        { date: "2020.10", type: "month" },
        {
          date: "2020-10-31 19:00:01",
          desc: "增加编辑表单第4种render渲染demo",
        },
        { date: "2020-10-31 18:40:17", desc: "优化H5表单编辑与查询" },
        {
          date: "2020-10-30 19:38:50",
          desc: "增加动态显示隐藏table列功能及demo、文档",
        },
        {
          date: "2020-10-25 15:47:55",
          desc: "添加iview级联组件中 change-on-select属性到volform表单中",
        },
        {
          date: "2020-10-25 15:45:44",
          desc: "移植后台页管理面到H5(见H5第4个菜单)",
        },
        {
          date: "2020-10-25 15:43:29",
          desc: "移植后台页管理面到H5(见H5第4个菜单)",
        },
        { date: "2020-10-20 12:45:46", desc: "优化自定义sql执行判断条件" },
        {
          date: "2020-10-18 11:06:57",
          desc: "element table编辑时增加iview input组件on-keypress事件",
        },
        {
          date: "2020-10-17 01:01:13",
          desc: "增加代码生成器编辑与查询类型time",
        },
        { date: "2020-10-17 00:56:49", desc: "表单组件增加iview time组件" },
        { date: "2020-10-17 00:43:26", desc: "增加区间查询demo" },
        { date: "2020-10-17 00:35:07", desc: "增加查询表单重置后方法" },
        {
          date: "2020-10-17 00:05:12",
          desc: "增加excel导入时可以添加其他参数",
        },
        {
          date: "2020-10-16 23:13:57",
          desc: "增加上传excel组件时可添加其他参数同时提交到后台",
        },
        {
          date: "2020-10-16 23:11:44",
          desc: "修复结束编辑时，element table高版本属性获取不到的问题",
        },
        {
          date: "2020-10-11 18:03:41",
          desc: "增加table编辑时点击其他行结束编辑状态(默认鼠标离开结束编辑，)",
        },
        { date: "2020-10-11 18:01:13", desc: "增加文档" },
        { date: "2020-10-11 16:59:57", desc: "优化代码生成器table编辑方式" },
        { date: "2020-10-11 15:00:55", desc: "移除table第一行强制排序" },
        {
          date: "2020-10-09 19:03:06",
          desc: "增加路由keepAlive属性设置不缓存组件(默认缓存组件)",
        },
        { date: "2020.09", type: "month" },
        {
          date: "2020-09-26 11:49:08",
          desc: "修复table编辑时表格验证最大值取值错误的问题",
        },
        {
          date: "2020-09-26 11:34:59",
          desc: "修复远程搜索自定义url不生效的问题",
        },
        {
          date: "2020-09-20 16:33:31",
          desc: "移除未实现的EF调用存储过程的方法,增加EF调用原生sql参数化查询FromSqlInterpolated",
        },
        { date: "2020-09-20 16:21:01", desc: "增加排序表达式的null判断" },
        { date: "2020-09-20 16:18:36", desc: "修复dapper事务嵌套异常的问题" },
        {
          date: "2020-09-20 16:14:08",
          desc: "增加导入excel时，后台对非空数据源的值判断",
        },
        { date: "2020-09-20 16:11:22", desc: "优化导入excel文件提示" },
        { date: "2020-09-20 16:10:26", desc: "增加级联@on-change事件" },
        { date: "2020-09-20 15:17:52", desc: "完善文档" },
        {
          date: "2020-09-13 18:28:00",
          desc: "增加表单[FormFields]拼写错误兼容",
        },
        { date: "2020-09-12 00:12:24", desc: "同步数据库mysql/pgsql脚本" },
        { date: "2020-09-12 00:10:49", desc: "完善第二种布局文档及其他文档" },
        { date: "2020-09-11 23:37:07", desc: "增加第二种查询布局方式" },
        { date: "2020-09-06 02:21:01", desc: "完善文档" },
        {
          date: "2020-09-06 01:26:30",
          desc: "增加table有数据源的列可以移除或自定义显示背景颜色及点击事件；增加添加行方法时设置默认字段(解决编辑状态下编辑值可能不刷新的问题)",
        },
        {
          date: "2020-09-05 23:57:42",
          desc: "增加textarea标签的最小高度item.minRows属性",
        },
        {
          date: "2020-09-03 14:25:44",
          desc: "修复voltable编辑类型为input时onChange不触发的问题",
        },
        {
          date: "2020-09-02 09:28:18",
          desc: "增加table数据字典key为数字类型时的二次判断",
        },
        { date: "2020.08", type: "month" },
        { date: "2020-08-30 19:20:14", desc: "修改开发版说明" },
        { date: "2020-08-30 19:18:24", desc: "修复首页日期星期天不显示的问题" },
        {
          date: "2020-08-30 18:36:07",
          desc: "增加从编辑框中再弹出框选择数据文档及其他文档完善",
        },
        { date: "2020-08-30 15:42:49", desc: "优化导入成功后的提示信息" },
        {
          date: "2020-08-29 01:29:33",
          desc: "添加table设置分页条大小、获取table所有行、获取table选中的行文档",
        },
        {
          date: "2020-08-29 00:42:04",
          desc: "增加table组件设置默认分页条大小",
        },
        { date: "2020-08-29 00:40:25", desc: "增加table组件设置分页条大小" },
        {
          date: "2020-08-29 00:10:36",
          desc: "优化数据源配置自定义sql提示信息",
        },
        {
          date: "2020-08-28 23:58:09",
          desc: "修复个人中心性别字段数据源配置错误的问题",
        },
        {
          date: "2020-08-28 23:49:31",
          desc: "优化用户管理页面新建用户后提示信息",
        },
        {
          date: "2020-08-26 19:17:34",
          desc: "增加编辑表动态设置只读，select事件触发文档",
        },
        { date: "2020-08-25 19:30:28", desc: "完善文档" },
        { date: "2020-08-22 04:04:42", desc: "添加多数据库访问、分库文档" },
        { date: "2020-08-18 18:55:12", desc: "完善文档" },
        {
          date: "2020-08-16 23:01:30",
          desc: "增加表单、table输入值后实时计算文档。增加项目启动异常处理方法文档",
        },
        { date: "2020-08-15 03:20:56", desc: "完善文档" },
        {
          date: "2020-08-15 03:19:28",
          desc: "增加多租户过滤，增加自定义原生sql查询",
        },
        {
          date: "2020-08-12 15:16:58",
          desc: "增加pgsql代码生成器timestamp字段类型",
        },
        {
          date: "2020-08-08 10:39:04",
          desc: "修复退出登陆切换帐号后权限缓存没刷新的问题",
        },
        {
          date: "2020-08-07 21:08:18",
          desc: "增加删除菜单功能，增加新建菜单时默认选中查询按钮权限",
        },
        { date: "2020-08-07 20:15:33", desc: "提供pgsql最新数据库脚本" },
        { date: "2020-08-07 20:05:45", desc: "完善对PGSQL数据库的支持" },
        { date: "2020-08-05 09:59:52", desc: "添加从表编辑时添加行的文档说明" },
        { date: "2020-08-05 09:58:17", desc: "修正pgsql表结构大小写问题" },
        { date: "2020-08-03 00:48:52", desc: "增加H5项目" },
        { date: "2020-08-01 20:57:07", desc: "移除无用代码" },
        { date: "2020-08-01 19:43:49", desc: "统一mysql脚本表名大写" },
        {
          date: "2020-08-01 19:22:38",
          desc: "修复Dapper删除方法执行错误的问题",
        },
        { date: "2020.07", type: "month" },
        {
          date: "2020-07-31 20:18:18",
          desc: "增加手动打开与关闭tabs导航功能及文档",
        },
        { date: "2020-07-31 20:16:24", desc: "增加用户管理页面修改密码功能" },
        { date: "2020-07-31 20:12:06", desc: "修复权限枚举值遍历错误的问题" },
        { date: "2020-07-24 19:05:22", desc: "修改项目说明" },
        {
          date: "2020-07-24 19:01:09",
          desc: "增加form与table中日期onChange事件及文档",
        },
        { date: "2020-07-21 13:55:20", desc: "完善一对多保存Demo" },
        { date: "2020-07-19 01:31:54", desc: "替换redis组件CSReidsCore" },
        {
          date: "2020-07-19 00:56:59",
          desc: "回滚表单验证方法，修正表单验证方法文档",
        },
        {
          date: "2020-07-17 13:19:45",
          desc: "修复表单日期提示不消失的问题,增加表单强制同步验证",
        },
        {
          date: "2020-07-10 16:33:03",
          desc: "修复登陆页IE底部显示问题、优化首页菜单border、修改代码生成器字段描述",
        },
        { date: "2020.06", type: "month" },
        { date: "2020-06-26 18:43:14", desc: "添加首页大屏显示" },
        {
          date: "2020-06-25 23:41:03",
          desc: "添加代码生成器对mysql字段smallint类型的支持",
        },
        { date: "2020-06-25 23:13:04", desc: "添加导出前方法处理及文档" },
        {
          date: "2020-06-25 23:03:24",
          desc: "增加onActivated方法(vue原生activated方法)",
        },
        { date: "2020-06-25 22:40:58", desc: "修复查询条件非法字段null过滤" },
        { date: "2020-06-24 17:15:51", desc: "优化登陆按钮操作(禁止重复点击)" },
        {
          date: "2020-06-24 12:02:24",
          desc: "修复select/selectList手动绑定数据源时key为数字0时的异常",
        },
        {
          date: "2020-06-20 02:17:52",
          desc: "增加volform、voltable对原生render的支持(现可任意扩展其他组件到form与table)",
        },
        { date: "2020-06-20 00:44:33", desc: "优化首页、首页皮肤" },
        {
          date: "2020-06-17 16:19:18",
          desc: "修复增加pgsql后，代码生成器判断类型错误的问题",
        },
        { date: "2020-06-16 09:50:17", desc: "增加登陆自动验证验证、UUID参数" },
        {
          date: "2020-06-16 09:45:54",
          desc: "重写登陆页面样式、增加登陆验证码、回车登陆",
        },
        { date: "2020-06-15 18:59:30", desc: "增加Dapper事务封装及文档" },
        {
          date: "2020-06-15 13:30:41",
          desc: "修复Dapper使用DbTransaction后没有释放的问题",
        },
        { date: "2020-06-14 21:53:33", desc: "增加pgsql脚本" },
        {
          date: "2020-06-14 21:52:17",
          desc: "增pgsql支持(生成代码获取表结构，同步表结构待完)",
        },
        { date: "2020-06-14 17:30:48", desc: "Update appsettings.json" },
        { date: "2020-06-14 16:38:58", desc: "增加对mysql数据类型double区分" },
        {
          date: "2020-06-14 16:12:12",
          desc: "增加代码生成器pgsql实体直实表名使用小写,dapper获取pgsql的NpgsqlConnection",
        },
        { date: "2020-06-14 15:28:33", desc: "增加pgsql数据库配置" },
        {
          date: "2020-06-14 15:20:50",
          desc: "Merge pull request #81 from xuegaoge/master",
        },
        { date: "2020-06-07 14:49:00", desc: "修复级联操作文档描述错误的问题" },
        {
          date: "2020-06-06 22:51:34",
          desc: "编辑表单类型selectList数据源为自定义sql并且key是数字时，强制转换成字符串",
        },
        {
          date: "2020-06-06 22:47:43",
          desc: "修改select编辑时手动级联文档说明",
        },
        {
          date: "2020-06-06 21:54:42",
          desc: "增加代码生成器文档，对select/selectList自定义sql数据源，在编辑时无法绑定默认值的问题说明",
        },
        {
          date: "2020-06-06 20:36:16",
          desc: "修复数据源为selectList时,key为数字0时不能转换文本的问题",
        },
        {
          date: "2020-06-06 20:02:51",
          desc: "修复单独使用table组件时,key为数字0时转换成文本失败的问题",
        },
        {
          date: "2020-06-03 14:03:18",
          desc: "增加voltabl文字对齐方式align（原生element table align属性）",
        },
        {
          date: "2020-06-03 13:43:26",
          desc: "优化路由切换加载状态，增加select手动级联文档",
        },
        {
          date: "2020-06-03 11:57:49",
          desc: "增加切换时路由加载提示(以前路由切换有明细卡顿现象)",
        },
        { date: "2020-06-03 10:27:26", desc: "优化权限分配左侧tree固定宽度" },
        {
          date: "2020-06-02 14:52:55",
          desc: "修复首页关闭tabs时，可能关闭两个tabs的问题",
        },
        {
          date: "2020-06-02 14:39:17",
          desc: "修复使用表别名时读取不到配置信息",
        },
        { date: "2020-06-01 13:22:21", desc: "增加http请求使用文档" },
        {
          date: "2020-06-01 13:16:58",
          desc: "增加[前端开发]级联文档与对象转换tree结构文档",
        },
        { date: "2020-06-01 12:57:20", desc: "增加顶部导tabs超出后滚动" },
        {
          date: "2020-06-01 12:55:50",
          desc: "增加功能将普通对象转换为tree结构",
        },
        { date: "2020.05", type: "month" },
        {
          date: "2020-05-31 23:15:20",
          desc: "集成iview级联组件cascader到框架volform、viewgrid组件中；增加级联操作文档",
        },
        { date: "2020-05-31 21:15:33", desc: "移除无用文件夹test" },
        {
          date: "2020-05-31 15:45:37",
          desc: "优化角色管理页面及角色service代码",
        },
        { date: "2020-05-30 20:13:09", desc: "mysql最新脚本" },
        { date: "2020-05-29 14:57:23", desc: "修复mysql异常说明" },
        {
          date: "2020-05-25 00:43:43",
          desc: "角色权限分配，权限列表改为树形菜单",
        },
        {
          date: "2020-05-25 00:16:10",
          desc: "修复http同时发起多个请求时，遮罩层不能正确关闭的问题",
        },
        { date: "2020-05-24 20:35:15", desc: "增加代码生成器常用问题描述" },
        { date: "2020-05-17 15:17:01", desc: "优化首页tab选项卡border样式" },
        {
          date: "2020-05-17 15:04:17",
          desc: "修复代码生成器mysql获取表结构没有区分数据库的问题(感谢jerry指正)",
        },
        { date: "2020-05-12 10:08:23", desc: "优化手动上传组件图片选择器" },
        {
          date: "2020-05-08 11:16:44",
          desc: "添加mysql写入日志异常提示解决办法",
        },
        { date: "2020-05-08 11:13:09", desc: "补全mysql数据库字典编号" },
        {
          date: "2020-05-07 18:43:31",
          desc: "修改菜单与角色的父级id出现循环依赖时，给出提示并禁止修改",
        },
        {
          date: "2020-05-07 14:46:08",
          desc: "增加(导入、下载导入模板、导出表数据)时可以指定导入与导出字段(默认为界面上可以看到的字段)",
        },
        {
          date: "2020-05-03 12:12:08",
          desc: "增加代码生成页面对checkbox编辑时多选的支持",
        },
        {
          date: "2020-05-02 20:03:49",
          desc: "完善编辑器静态页面发布上传图片功能",
        },
        { date: "2020-05-01 21:43:26", desc: "增加可根据用户信息自定义数据源" },
        { date: "2020.04", type: "month" },
        { date: "2020-04-27 11:00:50", desc: "更新数据库最新菜单表的脚本" },
        { date: "2020-04-27 10:36:55", desc: "添加全局缓存与读写分离文档" },
        { date: "2020-04-27 10:02:28", desc: "优化用户保存" },
        { date: "2020-04-26 20:08:41", desc: "增加树形菜单与table" },
        { date: "2020-04-25 20:36:49", desc: "文档整理" },
        {
          date: "2020-04-25 20:00:56",
          desc: "预留非对称主外键关系配置功能，待开发",
        },
        { date: "2020-04-25 11:16:57", desc: "优化白色主题菜单颜色" },
        { date: "2020-04-25 10:18:45", desc: "添加获取用户权限的重载方法" },
        {
          date: "2020-04-25 10:09:10",
          desc: "优化上传组件图片选择器默认大小图",
        },
        { date: "2020-04-24 18:10:44", desc: "增加EF更新时并发重试处理" },
        {
          date: "2020-04-24 11:45:29",
          desc: "修复导出数据源为自定义sql,类型转换异常的问题",
        },
        {
          date: "2020-04-21 23:00:06",
          desc: "增加没有编辑或新建权限时，也可以通过buttons属性添加自定义弹出框按钮",
        },
        { date: "2020-04-21 20:17:25", desc: "修复首页字符拼写错误" },
        { date: "2020-04-21 10:58:15", desc: "将默认皮肤黑色改为蓝色" },
        {
          date: "2020-04-20 14:43:39",
          desc: "修复动态刷新数据源文档描述错误的问题",
        },
        {
          date: "2020-04-14 19:55:14",
          desc: "增加Mysql数据库使用Dapper批量修改实体功能",
        },
        { date: "2020-04-11 21:20:04", desc: "增加项目部署及部署错误处理文档" },
        { date: "2020-04-11 18:49:33", desc: "移除使用了C#8.0语法的代码" },
        {
          date: "2020-04-10 13:05:23",
          desc: "修复自定义sql数据源key为数字时，表单查询时条件不起作用的问题",
        },
        {
          date: "2020-04-10 10:01:43",
          desc: "添加table列为编辑列时可formatter操作",
        },
        { date: "2020-04-07 23:43:16", desc: "完善文档" },
        { date: "2020-04-07 22:02:49", desc: "增加数字排版" },
        {
          date: "2020-04-07 21:41:24",
          desc: "增加主从表，可单独对从表上传图片(文件)功能",
        },
        { date: "2020-04-05 21:21:18", desc: "优化菜单保存后提示信息" },
        { date: "2020-04-05 20:48:02", desc: "优化排序字段" },
        {
          date: "2020-04-05 11:29:36",
          desc: "修复实体全属性校验判断错误的问题",
        },
        {
          date: "2020-04-04 12:44:56",
          desc: "优化voltable组件单独使用时数据绑定select的key类型",
        },
        {
          date: "2020-04-03 23:13:05",
          desc: "移除无用代码，增加一对多(不限从表数量)实战开发",
        },
        { date: "2020-04-03 23:07:04", desc: "添加最新菜单脚本" },
        { date: "2020-04-02 18:26:41", desc: "优化皮肤样式" },
        { date: "2020-04-02 17:47:23", desc: "增加换皮肤功能" },
        {
          date: "2020-04-02 17:43:59",
          desc: "修复点击非标准菜单可以重复显示的问题",
        },
        { date: "2020-04-02 17:36:23", desc: "增加皮肤切换功能" },
        { date: "2020.03", type: "month" },
        {
          date: "2020-03-31 18:37:56",
          desc: "增加Dapper对mysql数据库Guid映射",
        },
        { date: "2020-03-31 13:47:14", desc: "增加查询按钮组非递归深拷贝" },
        {
          date: "2020-03-30 20:42:58",
          desc: "添加一对一从表编辑或新建时，可设置hidden属性控制按钮显示/隐藏",
        },
        { date: "2020-03-29 09:56:00", desc: "优化菜单保存验证" },
        { date: "2020-03-28 19:30:39", desc: "增加文件上传时可选择追加文件" },
        { date: "2020-03-27 20:17:57", desc: "优化axios请求失败提示" },
        { date: "2020-03-25 17:10:01", desc: "优化扩展排序" },
        {
          date: "2020-03-24 10:10:30",
          desc: "移除mysql连接字符串AllowLoadLocalInfile属性",
        },
        { date: "2020-03-23 19:10:26", desc: "修改代码生成器文档参数描述" },
        { date: "2020-03-19 23:28:22", desc: "文档整理" },
        {
          date: "2020-03-19 21:50:16",
          desc: "修复table表格属性为img多图片时不能预览大图的问题",
        },
        {
          date: "2020-03-18 22:10:29",
          desc: "导出数据时，默认导出table上可见的列",
        },
        { date: "2020-03-18 22:07:11", desc: "修改备注说明" },
        { date: "2020-03-17 13:00:17", desc: "优化菜单自定义按权限按钮显示" },
        { date: "2020-03-15 21:55:10", desc: "添加预请求过期时间" },
        { date: "2020-03-15 20:42:55", desc: "移除后台校验日期限制" },
        { date: "2020-03-15 20:42:13", desc: "优化多值in查询" },
        { date: "2020-03-15 20:41:41", desc: "优化table图片显示" },
        {
          date: "2020-03-14 14:32:50",
          desc: "添加table编辑demo，增加文档说明",
        },
        {
          date: "2020-03-14 13:29:14",
          desc: "增加table组件可始终开启编辑状态，增加单元格编辑类型switch组件onChange事件",
        },
        {
          date: "2020-03-12 19:41:52",
          desc: "增加viewgird组件可手动刷新字典数据源方法reloadDicSource",
        },
        { date: "2020-03-12 10:44:59", desc: "优化select自动开启查询" },
        { date: "2020-03-10 17:26:21", desc: "优化多字段排序" },
        { date: "2020-03-10 11:13:55", desc: "优化查询排序" },
        { date: "2020-03-09 13:26:01", desc: "优化快速查询字段数据源绑定" },
        { date: "2020-03-09 09:42:51", desc: "移除对map文件的打包" },
        {
          date: "2020-03-09 09:42:10",
          desc: "修复快速查询字段数据源无法绑定的问题绑定",
        },
        { date: "2020-03-03 16:55:22", desc: "优化代码生成器" },
        { date: "2020-03-03 15:44:52", desc: "添加文档说明" },
        { date: "2020-03-03 12:20:45", desc: "优化配置文件与demo" },
        { date: "2020-03-02 22:37:43", desc: "优化加载提示" },
        { date: "2020-03-02 20:15:26", desc: "优化表单验证及代码生成器" },
        { date: "2020.02", type: "month" },
        { date: "2020-02-23 18:37:32", desc: "文档整理" },
        { date: "2020-02-14 21:45:38", desc: "优化单选事件触发" },
        { date: "2020-02-12 23:13:29", desc: "修改表单验证不能同步的问题" },
        {
          date: "2020-02-08 14:43:21",
          desc: "修复element table表格缩放后错行的问题",
        },
        { date: "2020-02-07 17:38:42", desc: "增加table选中行事件及demo" },
        { date: "2020-02-06 14:08:52", desc: "移除未使用旧项目vol.web" },
        {
          date: "2020-02-06 11:26:09",
          desc: "移除未使用的未分离旧项目vol.web",
        },
        {
          date: "2020-02-04 14:11:38",
          desc: "修复代码生成器项目命名空间加载无效的的问题",
        },
        {
          date: "2020-02-04 10:58:01",
          desc: "修复select远程搜索数组分割错误的问题及select清空时同时清空数据源",
        },
        { date: "2020-02-02 21:19:20", desc: "表单优化" },
        {
          date: "2020-02-02 20:42:19",
          desc: "优化el-scrollbar滚动条z-index属性",
        },
        { date: "2020-02-02 19:47:31", desc: "修改model样式z-index" },
        { date: "2020-02-02 17:25:46", desc: "增加可复用的后台通用参数校验" },
        { date: "2020-02-02 14:47:51", desc: "更新版本" },
        { date: "2020-02-01 23:09:10", desc: "优化远程搜索" },
        { date: "2020-02-01 12:31:59", desc: "基础组件优化" },
        {
          date: "2020-02-01 01:16:09",
          desc: "升级.netcore 3.1更新配置(位置已标注)",
        },
        { date: "2020-02-01 01:13:50", desc: "框架更新至.netcore 3.1" },
        { date: "2020-02-01 01:07:12", desc: "整理文档" },
        { date: "2020-02-01 00:58:43", desc: "优化远程搜索" },
        { date: "2020.01", type: "month" },
        { date: "2020-01-21 21:50:39", desc: "增加table表单求和实时计算" },
        { date: "2020-01-06 12:02:50", desc: "优化代码生成器table高度适应" },
        { date: "2020-01-06 11:55:53", desc: "消息提示时间延长到5秒" },
        { date: "2020-01-05 23:19:43", desc: "优化表单远程搜索" },
        { date: "2020-01-05 22:45:17", desc: "优化table显示select多选编辑" },
        { date: "2020-01-05 22:10:43", desc: "添加字典远程搜索与文档" },
        {
          date: "2020-01-05 19:33:19",
          desc: "增加编辑时支持key.value对应的多选",
        },
        { date: "2020-01-02 16:43:02", desc: "最新mysql表" },
        {
          date: "2020-01-02 12:52:51",
          desc: "添加编辑、新建时支持使用多选框操作",
        },
        { date: "2019.12", type: "month" },
        { date: "2019-12-31 17:13:23", desc: "添加upload文件夹" },
        { date: "2019-12-23 19:04:43", desc: "添加登陆页面工信部网站备案号" },
        { date: "2019-12-23 19:04:37", desc: "无" },
        { date: "2019-12-23 11:01:14", desc: "添加最新菜单脚本" },
        { date: "2019-12-23 10:22:27", desc: "增加静态页面提示" },
        { date: "2019-12-22 14:47:20", desc: "增加静态页面发布描述" },
        { date: "2019-12-22 14:19:27", desc: "优化代码生成器页面" },
        {
          date: "2019-12-22 01:14:09",
          desc: "增加静态页面发布App_News功能，优化代码生成器",
        },
        { date: "2019-12-22 01:10:33", desc: "增加静态页面发布模板" },
        {
          date: "2019-12-22 01:09:48",
          desc: "增加文档编辑器，增加静态页面发布功能，优化基础组件",
        },
        {
          date: "2019-12-21 22:42:51",
          desc: "修复代码生成器页面没有设置父级Id默认值的问题",
        },
        {
          date: "2019-12-19 17:47:42",
          desc: "添加actived触发时，是否刷新页面属性activatedLoad",
        },
        { date: "2019-12-19 17:36:37", desc: "优化代生成模板" },
        {
          date: "2019-12-19 17:34:38",
          desc: "增加Dapper调用批量删除、更新(mysql未实现)、写入的实现，优化Dapper使用",
        },
        { date: "2019-12-19 11:30:40", desc: "优化表单只读时提示" },
        {
          date: "2019-12-18 13:33:09",
          desc: "修复votable编辑i-switch标签bool类型判断",
        },
        {
          date: "2019-12-17 18:08:56",
          desc: "增加代码生成后的页面对从表编辑的扩展",
        },
        {
          date: "2019-12-17 17:48:43",
          desc: "增加voltable可使用button操作进行编辑、编辑select标签事件触发，编辑开始与编辑完成事件扩展、增加td单元格额外选项标签",
        },
        {
          date: "2019-12-17 11:45:21",
          desc: "增加代码生成的表单是否默认加载数据属性，增加table编辑的select可筛选，增加selectList校验",
        },
        { date: "2019-12-17 10:36:11", desc: "优化加载提示" },
        { date: "2019-12-14 11:17:28", desc: "优化头像默认显示" },
        {
          date: "2019-12-14 00:00:27",
          desc: "voltable自定义排序参数及组件文档。。。",
        },
        { date: "2019-12-13 23:58:56", desc: "增加明细表自定义排序" },
        { date: "2019-12-13 23:06:14", desc: "增加表单、table图片预览功能" },
        { date: "2019-12-12 09:48:18", desc: "增加table编辑bool属性显示" },
        { date: "2019-12-11 15:47:57", desc: "优化只读表单字段显示" },
        {
          date: "2019-12-11 11:31:43",
          desc: "修复获取当前用户所有下级角色字段传入错误的问题",
        },
        { date: "2019-12-10 14:15:12", desc: "优化表单数字验证" },
        {
          date: "2019-12-10 11:12:18",
          desc: "增加表单列只读时，可将字段设置为方法进行值计算",
        },
        { date: "2019-12-08 22:42:13", desc: "优化上传组件选择器显示" },
        {
          date: "2019-12-08 22:28:30",
          desc: "新建用户时将默认头像改为自己选择头像",
        },
        {
          date: "2019-12-08 22:02:57",
          desc: "优化角色新建或修改时，禁止相同的角色名",
        },
        { date: "2019-12-08 22:01:41", desc: "优化角色页面上级角色选择" },
        { date: "2019-12-08 22:01:00", desc: "优化switch默认值设置" },
        {
          date: "2019-12-08 20:55:00",
          desc: "添加表单switch对boolean值的处理",
        },
        {
          date: "2019-12-08 20:42:26",
          desc: "修复表单不能重置switch标签默认值的问题",
        },
        {
          date: "2019-12-08 20:25:05",
          desc: "增加数据源绑定设置默认值时对number与字符串的区分",
        },
        { date: "2019-12-07 13:03:11", desc: "添加table可单选属性" },
        { date: "2019-12-07 12:49:09", desc: "移除不用代码" },
        {
          date: "2019-12-07 11:57:34",
          desc: "修改代码生成器对mysql字段bool类型判断",
        },
        {
          date: "2019-12-06 20:54:09",
          desc: "增加代码生成器可生成模糊查询功能",
        },
        {
          date: "2019-12-06 20:06:30",
          desc: "table添加行时，如果是可编辑的switch类型没有初始值时，设置默认值为0",
        },
        { date: "2019-12-06 19:50:00", desc: "增加页面刷新加载效果" },
        {
          date: "2019-12-06 19:46:09",
          desc: "添加表单支持额外标签显示及事件处理，增加table表单元格可下载文件",
        },
        {
          date: "2019-12-06 18:38:26",
          desc: "修复编辑权限大小写判断错误的问题",
        },
        {
          date: "2019-12-05 13:12:05",
          desc: "修复代码生成器bigint识别错误的问题，优化代码生成器同步表结构的功能",
        },
        { date: "2019-12-02 17:34:42", desc: "优化代码生成器排序规则" },
        { date: "2019-12-02 15:26:38", desc: "添加可自定义编辑框大小" },
        {
          date: "2019-12-02 14:35:30",
          desc: "修复代码生成器不能手动同步表别名的数据结构",
        },
        { date: "2019-12-02 10:38:35", desc: "添加文件上传前，上传后扩展处理" },
        {
          date: "2019-12-01 19:59:37",
          desc: "添加用户只能操作自己创建的数据(及当前用户下角色)Demo",
        },
        { date: "2019.11", type: "month" },
        {
          date: "2019-11-28 18:37:56",
          desc: "修复表单图片属性只读时，图片相对路径没有正确解析的问题",
        },
        {
          date: "2019-11-28 13:13:44",
          desc: "修复代码生成器对sqlserver数据非主键GUID生成的model错误的问题，修复从表别名后删除时未获取到真实表名的问题",
        },
        { date: "2019-11-28 11:50:47", desc: "优化登陆界面" },
        { date: "2019-11-27 15:02:22", desc: "优化表单组件对password的提示" },
        { date: "2019-11-27 13:50:36", desc: "添加分配菜单图标显示" },
        {
          date: "2019-11-27 13:13:22",
          desc: "增加编辑功能可上传文件(图片、excel及其他附件)",
        },
        {
          date: "2019-11-26 18:36:51",
          desc: "添加代码生成器对编辑功能可上传excel及附件",
        },
        { date: "2019-11-25 19:10:25", desc: "增加webapi文件wwwroot" },
        {
          date: "2019-11-25 19:08:27",
          desc: "修复代码生成器对mysql数据库表结构tinyint类型识别错误的问题",
        },
        {
          date: "2019-11-25 18:32:52",
          desc: "增加表单文件上传功能(table多图片显示待完)",
        },
        { date: "2019-11-25 18:31:28", desc: "添加对文件上传功能的支持" },
        { date: "2019-11-25 16:11:06", desc: "调整修改密码弹出框大小" },
        { date: "2019-11-24 15:00:26", desc: "修改字典异常记录" },
        {
          date: "2019-11-24 14:49:38",
          desc: "增加获取字典时对执行自定义sql异常的信息的记录",
        },
        {
          date: "2019-11-24 13:32:27",
          desc: "修复编辑页面从表分页后再打开其他页面，分页信息没有重置的问题",
        },
        {
          date: "2019-11-24 12:08:43",
          desc: "修复删除功能没有接收返回值的问题",
        },
        { date: "2019-11-24 08:45:35", desc: "增加本地服务器访问静态文件" },
        {
          date: "2019-11-23 23:13:14",
          desc: "增加上传组件，可自定义上传任意文件",
        },
        { date: "2019-11-23 23:09:45", desc: "增加本地文件上传功能" },
        {
          date: "2019-11-22 17:52:43",
          desc: "增加ViewGrid组件获取选中行数据的组件",
        },
        {
          date: "2019-11-22 10:44:30",
          desc: "修复代码生成器没有生成表描述属性的问题",
        },
        { date: "2019-11-22 10:14:10", desc: "优化查询按钮显示" },
        { date: "2019-11-21 18:02:15", desc: "整理文档" },
        { date: "2019-11-21 18:01:50", desc: "Demo优化" },
        { date: "2019-11-21 17:59:22", desc: "解除代码生成器对类库开头限制" },
        { date: "2019-11-21 09:47:45", desc: "增加Mysql最新数据库脚本" },
        { date: "2019-11-20 17:14:58", desc: "调整表单demo适应" },
        { date: "2019-11-20 15:53:18", desc: "优化代码生成器" },
        {
          date: "2019-11-20 15:14:07",
          desc: "修复自动刷新Token后可能存在登陆不跳转的问题",
        },
        {
          date: "2019-11-20 12:02:01",
          desc: "增加封装组件对table属性MaxHeight的支持",
        },
        { date: "2019-11-19 11:49:11", desc: "增加transition动画显示页面" },
        { date: "2019-11-19 11:32:20", desc: "移除多余属性hasKeyField" },
        { date: "2019-11-19 11:08:23", desc: "优化Demo" },
        {
          date: "2019-11-19 10:53:04",
          desc: "优化表单对int.bigint.decimal数据类型的验证",
        },
        {
          date: "2019-11-18 18:45:28",
          desc: "修复select字典数据类型与绑定值的数据类型不一致时不能绑定默认值的问题",
        },
        { date: "2019-11-18 18:44:13", desc: "优化代码生成器" },
        {
          date: "2019-11-18 16:18:46",
          desc: "优化IE浏览器高级查询不起作用的问题",
        },
        { date: "2019-11-18 15:13:22", desc: "重新生成角色页面" },
        { date: "2019-11-18 14:44:32", desc: "修复表单验证提示错误" },
        { date: "2019-11-17 19:27:47", desc: "增加数据库菜单脚本" },
        { date: "2019-11-17 19:15:48", desc: "开发文档1.0" },
        { date: "2019-11-17 18:53:12", desc: "增加代码生成器对表别名的支持" },
        { date: "2019-11-17 18:52:30", desc: "增加代码生成器对表别名的支持" },
        { date: "2019-11-17 15:49:19", desc: "优化代码生成器" },
        { date: "2019-11-17 15:48:05", desc: "代码生成器优化" },
        {
          date: "2019-11-17 13:49:37",
          desc: "优化webapi构造方法及代码生成器模块",
        },
        { date: "2019-11-16 10:25:13", desc: "框架文档1.0" },
        { date: "2019-11-16 08:40:20", desc: "添加input标签  onKeyPress事件" },
        {
          date: "2019-11-15 23:34:10",
          desc: "增加表单类型为数字时，默认值为0",
        },
        {
          date: "2019-11-15 23:17:59",
          desc: "修复文档表单Demo自定义验证错误的问题",
        },
        {
          date: "2019-11-14 23:17:38",
          desc: "增加可自定义有数据库的table单元格td的背景颜色",
        },
        {
          date: "2019-11-14 23:05:44",
          desc: "增加快速查询字段为input标签时，可按回车键直接查询",
        },
        {
          date: "2019-11-14 22:50:52",
          desc: "添加table表可自定义有数据源单元格的背景颜色",
        },
        {
          date: "2019-11-14 22:36:28",
          desc: "增加HttpContext.Request<T>直接获取对象",
        },
        {
          date: "2019-11-13 23:46:01",
          desc: "增加代码生成器页面手动同步表结构的功能",
        },
        {
          date: "2019-11-13 23:38:35",
          desc: "增加代码生成器手动同步表结构功能(表字段发生变化)",
        },
        {
          date: "2019-11-13 21:38:00",
          desc: "修复mysql外键Guid识别错误的问题",
        },
        { date: "2019-11-12 14:27:37", desc: "优化表单对数字的验证" },
        { date: "2019-11-12 12:06:30", desc: "优化基础组件" },
        {
          date: "2019-11-12 12:01:39",
          desc: "增加可设置FixedToken属性标识方法的token永不过期",
        },
        { date: "2019-11-12 11:55:19", desc: "增加文档" },
        {
          date: "2019-11-12 11:50:04",
          desc: "增加可设置FixedTokenAttribute属性标识Token是否永远不过期,修复获取用户信息存在异常的问题",
        },
        {
          date: "2019-11-11 13:50:39",
          desc: "增加表单组件可设置lable宽度labelWidth属性",
        },
        { date: "2019-11-11 13:19:57", desc: "优化表单select验证" },
        {
          date: "2019-11-11 12:41:56",
          desc: "修复IE弹出框没有居中的问题，优化菜单保存功能",
        },
        {
          date: "2019-11-11 11:16:56",
          desc: "修复SaveChanges方法拼写错误的问题，增加菜单保存对表名重复性验证",
        },
        {
          date: "2019-11-08 15:19:02",
          desc: "修改菜单时限定菜单父ID不能是当前菜单的ID",
        },
        {
          date: "2019-11-07 11:13:20",
          desc: "增加导入excel时验证自定义sql的数据源",
        },
        {
          date: "2019-11-07 11:03:53",
          desc: "增加导入excel时验证自定义sql的数据源",
        },
        {
          date: "2019-11-06 18:27:57",
          desc: "table列的宽度超出时自动设置第一列为固定列",
        },
        { date: "2019-11-06 16:07:02", desc: "优化VolForm表单验证" },
        {
          date: "2019-11-04 15:00:59",
          desc: "修复table有查询条件时，第1页以后的数据没有带上查询条件的问题",
        },
        {
          date: "2019-11-04 13:25:54",
          desc: "固定菜单页面中其他权限弹出框的大小",
        },
        {
          date: "2019-11-04 09:53:00",
          desc: "添加Demo的扩展js中，扩展按钮使用描述",
        },
        {
          date: "2019-11-01 10:14:38",
          desc: "增加新建或编辑成功后可设置是否关闭弹出框",
        },
        { date: "2019.10", type: "month" },
        {
          date: "2019-10-31 13:09:19",
          desc: "修复页面刷新后顶部导航状态消失的问题",
        },
        {
          date: "2019-10-31 12:56:43",
          desc: "增加代码生成器对应表单渲染邮箱与手机号码类型",
        },
        {
          date: "2019-10-31 12:52:46",
          desc: "增加表单邮箱格式、手机号码格式、自定义验证方法",
        },
        {
          date: "2019-10-31 10:42:37",
          desc: "优化编辑弹出框自适应功能，增加编辑弹出框可以自行设置高度与宽度",
        },
        { date: "2019-10-29 17:13:42", desc: "增加代码生成器非空判断" },
        { date: "2019-10-29 09:51:24", desc: "修改日志处理" },
        { date: "2019-10-25 17:30:40", desc: "添加编辑基础扩展方法" },
        {
          date: "2019-10-25 13:51:57",
          desc: "添加编辑按钮可自定义设置hidden与disabled属性",
        },
        {
          date: "2019-10-25 13:02:42",
          desc: "添加代码生成器对mysql数据库的兼容处理",
        },
        { date: "2019-10-24 13:36:15", desc: "优化首页获取菜单权限验证规则" },
        {
          date: "2019-10-24 13:34:42",
          desc: "修复表单select组件为只读的属性时没有绑定数据源",
        },
        {
          date: "2019-10-24 13:16:56",
          desc: "增加mysql数据库日志批量写入失败解决说明",
        },
        {
          date: "2019-10-23 18:44:17",
          desc: "添加select组件默认超过10个item开启搜索功能",
        },
        {
          date: "2019-10-22 18:55:00",
          desc: "修复第一次弹出框时获取不到子组件的问题,增加记录当前编辑行的属性",
        },
        {
          date: "2019-10-22 15:41:27",
          desc: "修改sqlserver表SellOrderList外键Order_Id字段类型错误的问题",
        },
        { date: "2019-10-22 10:28:45", desc: "修改项目启动介绍说明" },
        {
          date: "2019-10-21 19:02:19",
          desc: "添加IE9以上版本的支持,添加打包后文件后缀加上时间戳解决缓存问题",
        },
        { date: "2019-10-18 15:47:00", desc: "增加textarea标签可自行设定高度" },
        {
          date: "2019-10-16 18:35:55",
          desc: "修复sqlserver字段guid小写的问题",
        },
        {
          date: "2019-10-16 18:30:15",
          desc: "修复sqlserver字段guid小写的问题",
        },
        { date: "2019-10-15 14:23:59", desc: "修改dapper查询异常" },
        {
          date: "2019-10-14 14:43:39",
          desc: "增加sqlserver2012以下版本使用说明",
        },
        {
          date: "2019-10-12 12:36:29",
          desc: "屏蔽select组件max-tag-count属性",
        },
        {
          date: "2019-10-12 09:48:40",
          desc: "增加表单查询/刷新时重置table分页信息",
        },
        { date: "2019-10-11 14:24:44", desc: "增加其他组件菜单->选择图标功能" },
        { date: "2019-10-10 10:44:54", desc: "增加Demo常用功能介绍" },
        { date: "2019-10-09 16:21:25", desc: "增加发布前端项目运行命令" },
        { date: "2019-10-09 16:19:21", desc: "增加demo接口" },
        {
          date: "2019-10-09 15:41:04",
          desc: "增加其他组件菜单下http请求Api的Demo",
        },
        {
          date: "2019-10-09 15:33:10",
          desc: "增加其他组件菜单下http请求，vuex状态管理等Demo",
        },
        { date: "2019.09", type: "month" },
        { date: "2019-09-29 17:29:41", desc: "修改Demo描述" },
      ],
    };
  },
};
</script>

<style scoped lang="less">
.time-line-item {
  margin-top: 40px;
}
.time-line-item h3 {
  font-size: 22px;
  font-weight: 400;
  margin: 0 0 15px;
  color: #1f2d3d;
}
.date {
  border-right: 1px solid #009688;
  margin-right: 30px;
  padding-right: 30px;
}
li {
  list-style: none;
  font-size: 15px;
  padding: 5px;
}
li:before {
  content: "";
  display: inline-block;
  width: 9px;
  height: 9px;
  background-color: #40ad44;
  border-radius: 50%;
  margin-right: 10px;
  top: -1px;
  position: relative;
}
.month {
  font-size: 26px;
  font-weight: bold;
  margin-top: 20px;
  .date {
    border-right: 0;
  }
}
.month:before {
  display: none;
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
.content {
  max-width: 800px;
  padding-top: 40px;
}
</style>
