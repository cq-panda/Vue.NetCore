<template>
  <div class="doc">
    <div class="doc-left">
      <el-scrollbar style="height:100%;">
        <ul>
          <li class="n-item"
              v-for="(item,index) in items"
              :key="index">
            <a :class="{active:active==index}"
               @click="scrollIntoView(index)">{{index+1}}. {{item.title}}</a>
          </li>
        </ul>
      </el-scrollbar>
    </div>
    <div class="doc-right">
      <div class="doc-nav">
        <a @click="()=>{this.b_moel=true;}">多租户(数据隔离)</a>
        <a @click="openRole()">多角色</a>
        <a @click="opendb()">分库/多数据库</a>
		  <a @click="open_oracle()">Oracle版本</a>
        <a @click="()=>{this.$Message.error('需要的进群或单独联系我')}">国际化</a>
        <a @click="scrollIntoView('extend')">后台基础代码扩展实现</a>

      </div>
      <div class="title">
        <h2>后台开发</h2>
      </div>
      <div class="top-content">
        <div>
          <p class="desc">后台开发都是代码生成器生成后的类进行扩展及常用功能使用</p>
        </div>
        <div>
          <p class="desc"
             style="font-size: 20px;">后台完整扩展实现：VOL.Order->Services->Sell->Partial->SellOrderService.cs文件</p>
        </div>
      </div>
      <Alert type="success"
             show-icon>
        提示
        <template slot="desc">
          <div style="line-height: 2;">
            <p>每个表由代码生成器生后的文件名都包括表名,直接在vs中搜索表名就可以看到所有生成相关表的文件</p>
            <p>所有自定义接口与业务实现都统一在Partial文件夹下实现</p>
            <p>表xxRepository.Instance用于调用仓储方法，如SellOrderRepository.Instance</p>
            <p>表xxService.Instance用于调用或编写业务，如SellOrderService.Instance，建议接口注入IxxService</p>
          </div>
        </template>
      </Alert>

      <div :id="'i-'+index"
           class="doc-wrapper"
           v-for="(item,index) in items"
           :key="index">
        <div class="title">
          <h2>{{item.title}}</h2>
        </div>
        <div style=" box-shadow: 0 8px 12px #ebedf0;">
          <div class="d-content">
            <div class="code">
              <p v-for="(line,key) in item.content"
                 :key="key"
                 class="desc"
                 v-html="line"></p>
            </div>
          </div>
          <Alert type="success"
                 show-icon>{{item.tips}}</Alert>
        </div>
      </div>
    </div>

    <Drawer :width="700"
            class="q-drawer"
            title="多租户"
            :closable="false"
            v-model="b_moel">
      <Alert type="success"
             show-icon>
        关于多租户（2020.08.15）
        <template slot="desc">
          <p style="    color: red;
    font-size: 16px;">多租户2020.08.15更新，只需要更新后台文件：ServiceBase.cs、ServiceFunFilter.cs、Tenancy文件夹(2021.02.28)</p>
        </template>
      </Alert>
      <el-collapse v-model="activeName"
                   accordion>
        <div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;">
          <div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span style="color:#6a9955;">//以SellOrderService为例，在类中重写Init方法，设置IsMultiTenancy=true开启多租户功能</span>
          </div>
          <div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span style="color:#9cdcfe;">protected</span>&nbsp;
            <span style="color:#9cdcfe;">override</span>&nbsp;
            <span style="color:#569cd6;">void</span>&nbsp;
            <span style="color:#dcdcaa;">Init</span>(
            <span style="color:#9cdcfe;">IRepository</span>&lt;
            <span style="color:#9cdcfe;">SellOrder</span>&gt;&nbsp;
            <span style="color:#9cdcfe;">repository</span>)
          </div>
          <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</div>
          <div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span style="color:#6a9955;">//2020.08.15</span>
          </div>
          <div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span style="color:#6a9955;">//开启多租户功能,开启后会对查询、导出、删除、编辑功能同时生效</span>
          </div>
          <div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span style="color:#6a9955;">//如果只需要对某个功能生效，如编辑，则在重写编辑方法中设置&nbsp;IsMultiTenancy&nbsp;=&nbsp;true;</span>
          </div>
          <div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span style="color:#9cdcfe;">IsMultiTenancy</span>&nbsp;=&nbsp;
            <span style="color:#569cd6;">true</span>;
          </div>
          <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}</div>
        </div>
        <div style="padding: 10px 0;
    font-size: 22px;
    color: red;">多租户面向数据库数据隔离，开启租户功能后默认只隔离用户自己创建的数据，可以根据需要自行设置数据隔离逻辑（具体见TenancyManager.cs）</div>
      </el-collapse>
    </Drawer>
  </div>
</template>
<script>
export default {
  methods: {
    opendb () {
      window.open("http://api.volcore.xyz/doc/index.html");
    },
    openRole () {
      window.open("https://gitee.com/x_discoverer/multi-role");
    },
	open_oracle(){
		  window.open("https://gitee.com/x_discoverer/oracle");
	},
    scrollIntoView (index) {
      if (typeof index == "string") {
        index = this.items.findIndex((x) => {
          return x.name == index;
        });
      }

      let top = document.getElementById("i-" + index).offsetTop - 100;
      if (index == 0) {
        top = 0;
      }
      window.scrollTo(0, top);
      this.active = index;
    },
  },
  data () {
    return {
      activeName: "",
      b_moel: false,
      active: 0,
      items: [
        {
          title: "调试",
          content: [
            `运行dev_run.bat，调试->附加到进程->进程里选择vol.webapi.exe`,
          ],
          tips: ` 还没想好`,
          img: "",
        },
        {
          title: "访问数据库",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#b5cea8;">1</span>、<span style="color:#9cdcfe;">repository</span>.
	</div>
		<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#b5cea8;">2</span>、<span style="color:#9cdcfe;">repository.DapperContext.xx</span>.
	</div>
			<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#b5cea8;">3</span>、<span style="color:#9cdcfe;">repository.DbContext.xx</span>.
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#b5cea8;">4</span>、<span style="color:#9cdcfe;">repository</span>.<span style="color:#9cdcfe;">FindAsIQueryable</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#b5cea8;">5</span>、<span style="color:#9cdcfe;">repository</span>.<span style="color:#9cdcfe;">DbContext</span>.<span style="color:#dcdcaa;">Set</span>&lt;<span style="color:#4ec9b0;">Sys_User</span>&gt;().<span style="color:#dcdcaa;">Find</span>()
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//repository.仅限在表xxx.Service.cs中使用</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#b5cea8;">6</span>、<span style="color:#9cdcfe;">SellOrderRepository</span>.<span style="color:#9cdcfe;">Instance</span>.<span style="color:#dcdcaa;">Find</span>()&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#b5cea8;">7</span>、<span style="color:#9cdcfe;">SellOrderListRepository</span>.<span style="color:#9cdcfe;">Instance</span>.<span style="color:#dcdcaa;">Find</span>()
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#b5cea8;">8</span>、<span style="color:#9cdcfe;">DBServerProvider</span>.<span style="color:#9cdcfe;">SqlDapper</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#b5cea8;">9</span>、<span style="color:#9cdcfe;">DBServerProvider</span>.<span style="color:#9cdcfe;">DbContext</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//以上方式都能访问数据库</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;font-size:20px;">//框架使用EF时，默认开启了NoTracking，如果要更新操作调用repository.Update</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
<br />
</div>`,
          ],
          tips: ` repository.DapperContext或DBServerProvider.SqlDapper可直接使用dapper，内部已封装好常用功能`,
        },
        {
          title: "接口禁用驼峰规则",
          content: [
            `框架接口数据默认都使用的小驼峰规则，如果需要原样返回数据（2020-11-21更新vol.core->controller下的文件夹才可以使用），请在控制器方法使用 return JsonNormal();`,
          ],
          tips: ` 还没想好`,
          img: "",
        },
		     {
          title: "定时任务接口配置",
          content: [
            `
			<p>
	<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;">
	定时任务调用本框架的接口地址，需要在接口上添加[ApiTask]属性,具体见Sys_QuartzOptionsController.cs->test方法<br>
		<div>
			&nbsp; &nbsp; &nbsp;<span style="color:#6a9955;">/// &lt;summary&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">/// api加上属性 [ApiTask]</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">/// &lt;/summary&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">/// &lt;returns&gt;&lt;/returns&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; [<span style="color:#9cdcfe;">ApiTask</span>]
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; [<span style="color:#9cdcfe;">HttpGet</span>, <span style="color:#9cdcfe;">HttpPost</span>, <span style="color:#dcdcaa;">Route</span>(<span style="color:#ce9178;">"test"</span>)]
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">public</span> <span style="color:#9cdcfe;">IActionResult</span> <span style="color:#dcdcaa;">Test</span>()
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#dcdcaa;">Content</span>(<span style="color:#9cdcfe;">DateTime</span>.<span style="color:#9cdcfe;">Now</span>.<span style="color:#dcdcaa;">ToString</span>(<span style="color:#ce9178;">"yyyy-MM-dd HH:mm:sss"</span>));
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; }
		</div>
<br />
	</div>
</p>`,
          ],
          tips: ` 还没想好`,
          img: "",
        },
		  {
          title: "取消跨域",
		  content:[`<p>
	<br />
</p>
<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;">
	<p>
		<p>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
		</p>
		<p>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; //在后台项目Startup.cs第103行中找到&nbsp;options.AddDefaultPolicy替换为下面的代码
		</p>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9CDCFE;">options</span>.<span style="color:#DCDCAA;">AddDefaultPolicy</span>(
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<span style="color:#9CDCFE;">builder</span>&nbsp;<span style="color:#569CD6;">=&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<span style="color:#9CDCFE;">builder</span>.<span style="color:#DCDCAA;">AllowAnyOrigin</span>()
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.<span style="color:#DCDCAA;">SetPreflightMaxAge</span>(<span style="color:#9CDCFE;">TimeSpan</span>.<span style="color:#DCDCAA;">FromSeconds</span>(<span style="color:#B5CEA8;">2520</span>))
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .<span style="color:#DCDCAA;">AllowAnyHeader</span>().<span style="color:#DCDCAA;">AllowAnyMethod</span>();
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; });
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; });
		</div>
	</p>
	<div>
		<span style="color:#569cd6;"></span><span style="color:#dcdcaa;"></span>
	</div>
</div>
<p>
	<br />
</p>
<p>
	<br />
</p>
<div>
	&nbsp; &nbsp; &nbsp; &nbsp;
</div>`],
          tips: ` 还没想好`,
          img: "",
        },
        {
          title: "不显示的菜单权限分配",
          content: [
            `<div style="line-height: 2;"><p>菜单不显示，但又需要对菜单进行权限分配，请更新下面文件，文件里修改的地方标注了日期2020.12.27（2020.12.27后获取的项目不用更新）</p>
            <p>2020.12.27更新后才能使用，更新文件VolElementMenu.vue 、 VolElementMenuChild.vue、  Sys_Menu.vue 、  Sys_MenuService.cs 、  UserContext.cs</p>
            <p style="color:red">如果2020.12.20之后没有更新过项目，请同时更新 
VolElementMenuChild.vue(新增) 、VolElementMenu.vue(新增) 、Index.vue 、common.js文件</p></div>`,
          ],
          tips: ` 还没想好`,
          img: "",
        },
        {
          title: "获取表依赖注入service实例",
          content: [
            `表名xxxService.Instance；如:Sys_UserService.Instance(仅限在同一个类库中使用)`,
          ],
          tips: ` 还没想好`,
          img: "",
        },
        {
          title: "获取表依赖注入Repository实例",
          content: [
            `表名xxxRepository.Instance；如:Sys_UserRepository.Instance(仅限在同一个类库中使用)`,
          ],
          tips: ` 还没想好`,
          img: "",
        },
        {
          title: "Controller中构造方法获取实例",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp; &nbsp;&nbsp;<span style="display:none;"></span><span style="color:#6a9955;">//通过partial类构造方法获取对象</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;[<span style="color:#dcdcaa;">Route</span>(<span style="color:#ce9178;">"api/User"</span>)]
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">public</span>&nbsp;<span style="color:#9cdcfe;">partial</span>&nbsp;<span style="color:#569cd6;">class</span>&nbsp;<span style="color:#4ec9b0;">Sys_UserController</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">private</span>&nbsp;<span style="color:#569cd6;">readonly</span>&nbsp;<span style="color:#9cdcfe;">ISys_UserService</span>&nbsp;<span style="color:#9cdcfe;">_userService</span>;<span style="color:#6a9955;">//访问业务代码</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">private</span>&nbsp;<span style="color:#569cd6;">readonly</span>&nbsp;<span style="color:#9cdcfe;">IHttpContextAccessor</span>&nbsp;<span style="color:#9cdcfe;">_httpContextAccessor</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">private</span>&nbsp;<span style="color:#569cd6;">readonly</span>&nbsp;<span style="color:#9cdcfe;">ISys_UserRepository</span>&nbsp;<span style="color:#9cdcfe;">_userRepository</span>;<span style="color:#6a9955;">//访问数据库</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">private</span>&nbsp;<span style="color:#569cd6;">readonly</span>&nbsp;<span style="color:#9cdcfe;">ICacheService</span>&nbsp;<span style="color:#9cdcfe;">_cacheService</span>;
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;summary&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;Controller中使用构造方法注入</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&nbsp;:&nbsp;base(userService)给父类传递当前service必须要有</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;/summary&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;param&nbsp;name="userService"&gt;&lt;/param&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;param&nbsp;name="httpContextAccessor"&gt;&lt;/param&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;param&nbsp;name="userRepository"&gt;&lt;/param&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;param&nbsp;name="cacheService"&gt;&lt;/param&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[<span style="color:#9cdcfe;">ActivatorUtilitiesConstructor</span>]
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">public</span>&nbsp;<span style="color:#dcdcaa;">Sys_UserController</span>(
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">ISys_UserService</span>&nbsp;<span style="color:#9cdcfe;">userService</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">IHttpContextAccessor</span>&nbsp;<span style="color:#9cdcfe;">httpContextAccessor</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">ISys_UserRepository</span>&nbsp;<span style="color:#9cdcfe;">userRepository</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">ICacheService</span>&nbsp;<span style="color:#9cdcfe;">cacheService</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;<span style="color:#4ec9b0;">base</span>(<span style="color:#4ec9b0;">userService</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">_userService</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">userService</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">_httpContextAccessor</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">httpContextAccessor</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">_userRepository</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">userRepository</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">_cacheService</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">cacheService</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div>
<br />`,
          ],
          tips: ` 还没想好`,
          img: "",
        },
        {
          title: "Service中构造方法获取实例",
          content: [`<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;summary&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;在partial中&nbsp;Sys_UserService使用构造方法获取对象</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;/summary&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">public</span>&nbsp;<span style="color:#9cdcfe;">partial</span>&nbsp;<span style="color:#569cd6;">class</span>&nbsp;<span style="color:#4ec9b0;">Sys_UserService</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">private</span>&nbsp;<span style="color:#569cd6;">readonly</span>&nbsp;<span style="color:#9cdcfe;">IHttpContextAccessor</span>&nbsp;<span style="color:#9cdcfe;">_httpContextAccessor</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">private</span>&nbsp;<span style="color:#569cd6;">readonly</span>&nbsp;<span style="color:#9cdcfe;">ISys_UserRepository</span>&nbsp;<span style="color:#9cdcfe;">_userRepository</span>;<span style="color:#6a9955;">//访问数据库</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">private</span>&nbsp;<span style="color:#569cd6;">readonly</span>&nbsp;<span style="color:#9cdcfe;">ICacheService</span>&nbsp;<span style="color:#9cdcfe;">_cacheService</span>;
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;summary&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;Controller中使用构造方法注入</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&nbsp;:&nbsp;base(userRepository)给父类传递当前Repository必须要有</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;/summary&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;param&nbsp;name="userService"&gt;&lt;/param&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;param&nbsp;name="httpContextAccessor"&gt;&lt;/param&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;param&nbsp;name="userRepository"&gt;&lt;/param&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;param&nbsp;name="cacheService"&gt;&lt;/param&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[<span style="color:#9cdcfe;">ActivatorUtilitiesConstructor</span>]
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">public</span>&nbsp;<span style="color:#dcdcaa;">Sys_UserService</span>(
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">ISys_UserRepository</span>&nbsp;<span style="color:#9cdcfe;">userRepository</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">IHttpContextAccessor</span>&nbsp;<span style="color:#9cdcfe;">httpContextAccessor</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">ICacheService</span>&nbsp;<span style="color:#9cdcfe;">cacheService</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;<span style="color:#4ec9b0;">base</span>(<span style="color:#4ec9b0;">userRepository</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">_httpContextAccessor</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">httpContextAccessor</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">_userRepository</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">userRepository</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">_cacheService</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">cacheService</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//多租户会用到这init代码，其他情况可以不用</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//base.Init(userRepository);</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div>`
          ],
          tips: ` 还没想好`,
          img: "",
        },
        {
          title: "使用EF执行原生sql",
          content: [`<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">public</span>&nbsp;<span style="color:#9cdcfe;">partial</span>&nbsp;<span style="color:#569cd6;">class</span>&nbsp;<span style="color:#4ec9b0;">Sys_UserService</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">public</span>&nbsp;<span style="color:#569cd6;">async</span>&nbsp;<span style="color:#9cdcfe;">Task</span>&lt;<span style="color:#9cdcfe;">object</span>&gt;&nbsp;<span style="color:#dcdcaa;">Test</span>()
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">string</span>&nbsp;<span style="color:#9cdcfe;">userName</span>&nbsp;=&nbsp;<span style="color:#ce9178;">"admin"</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//FromSqlInterpolated方法参数化查询，具体参照EF文档</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">FormattableString</span>&nbsp;<span style="color:#9cdcfe;">formattableString</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">$</span><span style="color:#ce9178;">"select&nbsp;*&nbsp;from&nbsp;Sys_User&nbsp;where&nbsp;UserName={userName}"</span>;
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">var</span>&nbsp;<span style="color:#9cdcfe;">user</span>&nbsp;=&nbsp;<span style="color:#c586c0;">await</span>&nbsp;<span style="color:#9cdcfe;">repository</span>.<span style="color:#dcdcaa;">FromSqlInterpolated</span>(<span style="color:#9cdcfe;">formattableString</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.<span style="color:#dcdcaa;">Where</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;<span style="color:#b5cea8;">1</span>&nbsp;==&nbsp;<span style="color:#b5cea8;">1</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.<span style="color:#dcdcaa;">Select</span>(<span style="color:#9cdcfe;">s</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;<span style="color:#569cd6;">new</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;s.<span style="color:#9cdcfe;">User_Id</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;s.<span style="color:#9cdcfe;">UserPwd</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}).<span style="color:#dcdcaa;">FirstOrDefaultAsync</span>();
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#9cdcfe;">user</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div>`],
          tips: ''
        },
        {
          title: "使用EF事务",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//repository.DbContextBeginTransaction或&nbsp;SellOrderRepository.Instance.DbContextBeginTransaction</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">WebResponseContent</span>&nbsp;<span style="color:#9cdcfe;">webResponse</span>=&nbsp;<span style="color:#9cdcfe;">repository</span>.<span style="color:#dcdcaa;">DbContextBeginTransaction</span>(()&nbsp;<span style="color:#569cd6;">=&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//如果想要回滚，返回new&nbsp;WebResponseContent().Error("返回消息")</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">new</span>&nbsp;<span style="color:#4ec9b0;">WebResponseContent</span>().<span style="color:#dcdcaa;">OK</span>();
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;});
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//判断事务是否执行成功</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">webResponse</span>.<span style="color:#9cdcfe;">Status</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
<br />
</div>`,
          ],
          tips: ` 在表的业务类,xxxService.cs中文件直接可调用EF事务,或使用SellOrderRepository.Instance.DbContextBeginTransaction(()=> { })`,
        },
        {
          title: "使用Dapper事务",
          content: [
            `<span style="display:none;"></span>
<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">DBServerProvider</span>.<span style="color:#9cdcfe;">SqlDapper</span>.<span style="color:#dcdcaa;">BeginTransaction</span>((<span style="color:#9cdcfe;">ISqlDapper</span>&nbsp;<span style="color:#9cdcfe;">dapper</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">string</span>&nbsp;<span style="color:#9cdcfe;">sql</span>&nbsp;=&nbsp;<span style="color:#ce9178;">"UPDATE&nbsp;App_Expert&nbsp;SET&nbsp;CreateDate=GETDATE()"</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//return&nbsp;false;回滚事务</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">dapper</span>.<span style="color:#dcdcaa;">ExcuteNonQuery</span>(<span style="color:#9cdcfe;">sql</span>,&nbsp;<span style="color:#569cd6;">null</span>)&nbsp;==&nbsp;<span style="color:#b5cea8;">0</span>)&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">false</span>;
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//do&nbsp;something&nbsp;.....</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">sql</span>&nbsp;=&nbsp;<span style="color:#ce9178;">"UPDATE&nbsp;App_ReportPrice&nbsp;SET&nbsp;CreateDate=GETDATE()"</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">dapper</span>.<span style="color:#dcdcaa;">ExcuteNonQuery</span>(<span style="color:#9cdcfe;">sql</span>,&nbsp;<span style="color:#569cd6;">null</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//返回true才会提交事务</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">true</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},&nbsp;(<span style="color:#9cdcfe;">Exception</span>&nbsp;<span style="color:#9cdcfe;">ex</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//上面不需要处理异常，请在此处处理异常</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//DBServerProvider.SqlDapper.xxx</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">Console</span>.<span style="color:#dcdcaa;">WriteLine</span>(<span style="color:#9cdcfe;">ex</span>.<span style="color:#9cdcfe;">Message</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;});
	</div>
</div>
<br />`,
          ],
          tips: "",
        },
		 {
          title: "Dapper连接其他数据库",
          content: [  `1、使用dapper连接sqlserver、mysql、pgsql、oracle数据库，或者同时连接多个同类型但地址不同的数据库<p>
		               2、具体使用见说明:vol.core类库下DBManager->Partial->DBServerProvider.cs<p>
					   3、注意：需要2022.11.21更新DBServerProvider.cs与Partial下的文件才能使用
					   4、更新时如果是用的.net6后台，也只能使用.net6版本里面的代码更新
		  `   ],
          tips: "",
        },
		  {
          title: "Dapper访问数据库/存储过程",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	&nbsp; &nbsp; &nbsp; &nbsp; public void Test()<br />
&nbsp; &nbsp; &nbsp; &nbsp; {<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; string tranNo = "T20001000100001";<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int orderType = 1;<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; string sql = "select * from SellOrder where TranNo=@tranNo and OrderType=@orderType";<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; //与原生dapper使用方式基本一致，更多使用方法参照dapper文档<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; DBServerProvider.SqlDapper.QueryList&lt;SellOrder&gt;(sql, new { tranNo, orderType });&nbsp; &nbsp; &nbsp;&nbsp;<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; DBServerProvider.SqlDapper.QueryFirst&lt;dynamic&gt;(sql, new { tranNo, orderType });<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; DBServerProvider.SqlDapper.QueryFirst&lt;object&gt;(sql, new { tranNo, orderType });<br />
<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; DBServerProvider.SqlDapper.ExecuteScalar(sql, new { tranNo, orderType });<br />
<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; //调用存储过程<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; DBServerProvider.SqlDapper.ExecuteScalar("存储过程名", new {参数 },System.Data.CommandType.StoredProcedure);<br />
<br />
&nbsp; &nbsp; &nbsp; &nbsp; }<br />
</div>`,
          ],
          tips: `还没想好`,
          img: "",
        },

		{
          title: "多表关联生成代码",
          content: [
         `<p>方法1、直接创建一个多表关联的视图,然后生成代码(如果需要进行新增、删除、修改,参照下面【视图操作】,请同时将原表生成代码(只需要生成model与业务类))</p>
		 <p>方法2、如果多表关联逻辑比较简单，见下面【后台基础代码扩展实现】中的GetPageData方法自定义sql属性QuerySql</p> `
		  ]
		  },
		     {
          title: "重写后台权限",
          content: [`<div style="color:#D4D4D4;background-color:#1E1E1E;line-height:1.2;">
	<div>
		<br />
	</div>
	<div>
		<div style="color:#D4D4D4;background-color:#1E1E1E;">
			<div>
				&nbsp;<span style="color:#6a9955;">//此处以SellOrderController.cs为例,更多可重写的权限见ApiBaseController</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//在某些情况下需要手动调用框架的方法，但又没有给用户分配权限，或者不想分配权限，可以直接重写框架方法的权限</span>
			</div>
		
	<div>
		&nbsp;&nbsp;<span style="color:#9cdcfe;">public</span>&nbsp;<span style="color:#9cdcfe;">partial</span>&nbsp;<span style="color:#9cdcfe;">class</span>&nbsp;<span style="color:#4ec9b0;">SellOrderController</span>
	</div>
	<div>
		&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">private</span>&nbsp;<span style="color:#569cd6;">readonly</span>&nbsp;<span style="color:#9cdcfe;">ISellOrderRepository</span>&nbsp;<span style="color:#9cdcfe;">_orderRepository</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[<span style="color:#9cdcfe;">ActivatorUtilitiesConstructor</span>]
	</div>
	<div>
		&nbsp;&nbsp;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">public</span>&nbsp;<span style="color:#dcdcaa;">SellOrderController</span>(<span style="color:#9cdcfe;">ISellOrderRepository</span>&nbsp;<span style="color:#9cdcfe;">orderRepository</span>,&nbsp;<span style="color:#9cdcfe;">ISellOrderService</span>&nbsp;<span style="color:#9cdcfe;">service</span>):<span style="color:#4ec9b0;">base</span>(<span style="color:#4ec9b0;">service</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//数据库访问，更多操作见后台开发：数据库访问</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">_orderRepository</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">orderRepository</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//http://localhost:8081/document/netCoreDev</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">/************重写权限************/</span>
	</div>
	<div>
		&nbsp;&nbsp;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;summary&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;页面数据查询</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;/summary&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;param&nbsp;name="loadData"&gt;&lt;/param&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;returns&gt;&lt;/returns&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;ApiActionPermission中的内容清空后，只会验证用户是否登陆，不会验证用户查询权限</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//[ApiActionPermission()]</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//第一个参数可以输入表名，指定某张表的权限</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//[ApiActionPermission("SellOrder",ActionPermissionOptions.Search)]</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[<span style="color:#9cdcfe;">HttpPost</span>,&nbsp;<span style="color:#dcdcaa;">Route</span>(<span style="color:#ce9178;">"GetPageData"</span>)]
	</div>
	<div>	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ApiActionPermission()]	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">public</span>&nbsp;<span style="color:#569cd6;">override</span>&nbsp;<span style="color:#9cdcfe;">ActionResult</span>&nbsp;<span style="color:#dcdcaa;">GetPageData</span>([<span style="color:#9cdcfe;">FromBody</span>]&nbsp;<span style="color:#9cdcfe;">PageDataOptions</span>&nbsp;<span style="color:#9cdcfe;">loadData</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#9cdcfe;">base</span>.<span style="color:#dcdcaa;">GetPageData</span>(<span style="color:#9cdcfe;">loadData</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;summary&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;新增操作（权限重写同上）</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;/summary&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;param&nbsp;name="saveModel"&gt;&lt;/param&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;returns&gt;&lt;/returns&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//[ApiActionPermission("SellOrder",&nbsp;ActionPermissionOptions.Add)]</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[<span style="color:#9cdcfe;">HttpPost</span>,&nbsp;<span style="color:#dcdcaa;">Route</span>(<span style="color:#ce9178;">"Add"</span>)]
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">public</span>&nbsp;<span style="color:#569cd6;">override</span>&nbsp;<span style="color:#9cdcfe;">ActionResult</span>&nbsp;<span style="color:#dcdcaa;">Add</span>([<span style="color:#9cdcfe;">FromBody</span>]&nbsp;<span style="color:#9cdcfe;">SaveModel</span>&nbsp;<span style="color:#9cdcfe;">saveModel</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#9cdcfe;">base</span>.<span style="color:#dcdcaa;">Add</span>(<span style="color:#9cdcfe;">saveModel</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;summary&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///编译操作（权限重写同上）</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;/summary&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;param&nbsp;name="saveModel"&gt;&lt;/param&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;returns&gt;&lt;/returns&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;[ApiActionPermission(ActionPermissionOptions.Update)]</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[<span style="color:#9cdcfe;">HttpPost</span>,&nbsp;<span style="color:#dcdcaa;">Route</span>(<span style="color:#ce9178;">"Update"</span>)]
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">public</span>&nbsp;<span style="color:#569cd6;">override</span>&nbsp;<span style="color:#9cdcfe;">ActionResult</span>&nbsp;<span style="color:#dcdcaa;">Update</span>([<span style="color:#9cdcfe;">FromBody</span>]&nbsp;<span style="color:#9cdcfe;">SaveModel</span>&nbsp;<span style="color:#9cdcfe;">saveModel</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#9cdcfe;">base</span>.<span style="color:#dcdcaa;">Update</span>(<span style="color:#9cdcfe;">saveModel</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;summary&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;通过key删除文件（权限重写同上）</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;/summary&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;param&nbsp;name="keys"&gt;&lt;/param&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;returns&gt;&lt;/returns&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;[ApiActionPermission(ActionPermissionOptions.Delete)]</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[<span style="color:#9cdcfe;">HttpPost</span>,&nbsp;<span style="color:#dcdcaa;">Route</span>(<span style="color:#ce9178;">"Del"</span>)]
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">public</span>&nbsp;<span style="color:#569cd6;">override</span>&nbsp;<span style="color:#9cdcfe;">ActionResult</span>&nbsp;<span style="color:#dcdcaa;">Del</span>([<span style="color:#9cdcfe;">FromBody</span>]&nbsp;<span style="color:#9cdcfe;">object</span>[]&nbsp;<span style="color:#9cdcfe;">keys</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#9cdcfe;">base</span>.<span style="color:#dcdcaa;">Del</span>(<span style="color:#9cdcfe;">keys</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///更多可重写的权限见ApiBaseController</span>
	</div>
	<div>
		&nbsp;&nbsp;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div>
<span style="display:none;"></span>
		
		` ],
          tips: `还没想好`,
          img: "",
        },
		 {
          title: "EF更新报错",
          content: [`例：使用EF更新SellOrder表时报下面的错误,更新前请调用SellOrderRepository.Instance.Detached()方法，取消当前表跟踪(2021.08.22需要更新IRepository.cs,Repository.cs)
		 <p>The instance of entity type 'XXX' cannot be tracked because another instance with the same key value for {'XX'} is already being tracked.</p> 
		  `   ],
		  tips: `还没想好`,
          img: "",
        },
		 {
          title: "EF多表关联",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
		<div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//EF多表关联查询,除了&nbsp;dbContext.Set&lt;Sys_Menu&gt;()这里获取dbcontext的区别，其他与原生EF操作一样</span>
		</div>
		<div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//注：如果需要多表关联并且需要在页面显示，请创建视图，再生成代码，如果还需要操作增加、删除、修改等，见最下面视图操作</span>
		</div>
<br />
		<div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//其他多表关联操作，可以写原生sql，使用&nbsp;&nbsp;DBServerProvider.SqlDapper.QueryList调用，见上面dapper操作</span>
		</div>
		<div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">Permissions</span>&gt;&nbsp;<span style="color:#9cdcfe;">_permissions</span>&nbsp;=&nbsp;(<span style="color:#9cdcfe;">from</span>&nbsp;<span style="color:#9cdcfe;">a</span>&nbsp;<span style="color:#569cd6;">in</span>&nbsp;<span style="color:#9cdcfe;">dbContext</span>.<span style="color:#dcdcaa;">Set</span>&lt;<span style="color:#4ec9b0;">Sys_Menu</span>&gt;()
		</div>
		<div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">join</span>&nbsp;<span style="color:#9cdcfe;">b</span>&nbsp;<span style="color:#569cd6;">in</span>&nbsp;<span style="color:#9cdcfe;">dbContext</span>.<span style="color:#dcdcaa;">Set</span>&lt;<span style="color:#4ec9b0;">Sys_RoleAuth</span>&gt;()
		</div>
		<div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">on</span>&nbsp;<span style="color:#9cdcfe;">a</span>.<span style="color:#9cdcfe;">Menu_Id</span>&nbsp;<span style="color:#9cdcfe;">equals</span>&nbsp;<span style="color:#9cdcfe;">b</span>.<span style="color:#9cdcfe;">Menu_Id</span>
		</div>
		<div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">where</span>&nbsp;<span style="color:#9cdcfe;">b</span>.<span style="color:#9cdcfe;">Role_Id</span>&nbsp;==&nbsp;<span style="color:#9cdcfe;">roleId</span>&nbsp;&nbsp;&amp;&amp;&nbsp;<span style="color:#9cdcfe;">b</span>.<span style="color:#9cdcfe;">AuthValue</span>&nbsp;!=&nbsp;<span style="color:#ce9178;">""</span>
		</div>
		<div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">orderby</span>&nbsp;<span style="color:#9cdcfe;">a</span>.<span style="color:#9cdcfe;">ParentId</span>
		</div>
		<div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">select</span>&nbsp;<span style="color:#569cd6;">new</span>&nbsp;<span style="color:#9cdcfe;">Permissions</span>
		</div>
		<div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
		</div>
		<div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">Menu_Id</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">a</span>.<span style="color:#9cdcfe;">Menu_Id</span>,
		</div>
		<div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">ParentId</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">a</span>.<span style="color:#9cdcfe;">ParentId</span>,
		</div>
		<div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">TableName</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">a</span>.<span style="color:#9cdcfe;">TableName</span>,
		</div>
		<div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">MenuAuth</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">a</span>.<span style="color:#9cdcfe;">Auth</span>,
		</div>
		<div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">UserAuth</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">b</span>.<span style="color:#9cdcfe;">AuthValue</span>
		</div>
		<div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}).<span style="color:#dcdcaa;">ToList</span>();
		</div>
<br />
	</div>
<br />
</div>`,
          ],
          tips: `还没想好`,
          img: "",
        },
		     {
          title: "获取用户所有子角色",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
		<div>
			<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
				<div>
					&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//获取所有子角色下面的所有用户，注意这里返回的是一个IQueryable，可以结合EF使用，或者tolist</span>
				</div>
				<div>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">RoleContext</span>.<span style="color:#dcdcaa;">GetCurrentAllChildUser</span>();
				</div>
				<div>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//获取当前用户的所有子角色信息</span>
				</div>
				<div>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">RoleContext</span>.<span style="color:#dcdcaa;">GetAllChildren</span>(<span style="color:#9cdcfe;">UserContext</span>.<span style="color:#9cdcfe;">Current</span>.<span style="color:#9cdcfe;">UserId</span>);
				</div>
				<div>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//获取当前用户的所有子角色id</span>
				</div>
				<div>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">RoleContext</span>.<span style="color:#dcdcaa;">GetAllChildrenIds</span>(<span style="color:#9cdcfe;">UserContext</span>.<span style="color:#9cdcfe;">Current</span>.<span style="color:#9cdcfe;">UserId</span>);
				</div>
			</div>
		</div>
	</div>
<br />
</div>`,
          ],
          tips: `还没想好`,
          img: "",
        },
        {
          title: "使用Memory/Redis缓存",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
<p>//以SellOrderService为例，在构造方法中获取对象</p>
	<span style="display:none;"></span>&nbsp; &nbsp; &nbsp; &nbsp; [ActivatorUtilitiesConstructor]<br />
&nbsp; &nbsp; &nbsp; &nbsp; private ICacheService _cacheService;<br />
&nbsp; &nbsp; &nbsp; &nbsp; public SellOrderService(ICacheService cacheService)<br />
&nbsp; &nbsp; &nbsp; &nbsp; {<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; //默认使用的内存缓存，如果需要使用redis将appsetting.json中设置UseRedis:"true"<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; _cacheService = cacheService;<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; //HttpContext.Current.GetService&lt;ICacheService&gt;()<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; //base.CacheContext (仅限表xxx.Serivce.cs)<br />
&nbsp; &nbsp; &nbsp; &nbsp; }<span style="display:none;"></span><br />
</div>`,
          ],
          tips: `还没想好`,
          img: "",
        },
        {
          title: "实体校验",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">SellOrder</span>&nbsp;<span style="color:#9cdcfe;">order</span>&nbsp;=&nbsp;<span style="color:#569cd6;">new</span>&nbsp;<span style="color:#4ec9b0;">SellOrder</span>();
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//校验指定字段x.TranNo,&nbsp;x.Auditor的类型、长度等合法性</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">order</span>.<span style="color:#dcdcaa;">ValidationEntity</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;<span style="color:#569cd6;">new</span>&nbsp;{&nbsp;<span style="color:#4ec9b0;">x</span>.<span style="color:#9cdcfe;">TranNo</span>,&nbsp;<span style="color:#4ec9b0;">x</span>.<span style="color:#9cdcfe;">Auditor</span>});
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//如果是list调用&nbsp;ValidationEntityList方法</span>
	</div>
<br />
</div>`,
          ],
          tips: ` 必须指定要校验的字段`,
          img: "",
        },
        {
          title: "获取当前用户信息",
          content: [
            `
            UserContext.Current.xxx`,
          ],
          tips: ` 还没想好`,
          img: "",
        },
        {
          title: "获取当前用户权限",
          content: [
            `<p>UserContext.Current.Permissions</p>
             <p>UserContext.Current.GetPermissions("菜单上配置的表名")</p>
             <p>UserContext.Current.GetPermissions(x => x.TableName.ToLower()=="xxx")</p>
             <p>获取更多用户信息：UserContext.Current.xxx</p>
             `,
          ],
          tips: ` 还没想好`,
          img: "",
        },
        {
          title: "接口(控制器)添加权限过滤",
          content: [
            `
            <div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<span style="color:#9cdcfe;">[HttpPost,&nbsp;</span><span style="color:#dcdcaa;">Route</span><span style="color:#9cdcfe;">(</span><span style="color:#ce9178;">"xxx"</span><span style="color:#9cdcfe;">)]</span>
	</div>
	<div>
		<span style="color:#9cdcfe;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[</span><span style="color:#dcdcaa;">ApiActionPermission</span><span style="color:#9cdcfe;">(</span><span style="color:#ce9178;">"Sys_Role"</span><span style="color:#9cdcfe;">,&nbsp;ActionPermissionOptions.Update)]</span>
	</div>
	<div>
		<span style="color:#9cdcfe;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="color:#6a9955;">//ApiActionPermission权限过滤,第一个参数为菜单上配置的表名，如果是代码生成的partial控制器中的方法，表名不用填写</span>
	</div>
	<div>
		<span style="color:#9cdcfe;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="color:#6a9955;">//更多参数见方法重载</span>
	</div>
	<div>
		<span style="color:#9cdcfe;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;async&nbsp;Task&lt;IActionResult&gt;&nbsp;xxx()</span>
	</div>
	<div>
		<span style="color:#9cdcfe;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</span>
	</div>
	<div>
		<span style="color:#9cdcfe;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;Json(await&nbsp;Task.FromResult(1));</span>
	</div>
	<div>
		<span style="color:#9cdcfe;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}</span>
	</div>
</div>`,
          ],
          tips: ` 还没想好`,
          img: "",
        },
        {
          title: "手动获取HttpContext参数",
          content: [
            `<p>VOL.Core.Utilities.HttpContext.Current.Request<T>("参数名")</p>
             <p>VOL.Core.Utilities.HttpContext.Current.RequestString("参数名")</p>`,
          ],
          tips: ` 还没想好`,
          img: "",
        },
        {
          title: "手动获取依赖注入的对象",
          content: [
            `<p>VOL.Core.Utilities.HttpContext.Current.GetService<T>("如：IxxService")</p>`,
          ],
          tips: ` 还没想好`,
          img: "",
        },
        {
          title: "自定义字典sql数据源",
          content: [
            `<p>1、在菜单：【系统】->【下拉框绑定设置】中设置sql语句，再刷新页面，代码生成器中选配置的字典编号，生成vue页面</p>
			<p>2、如果需要根据信息加载不同的数据源，先操作步骤1,后台文件：DictionaryHandler.GetCustomDBSql方法编写实际sql</p>`,
          ],
          tips: ` 还没想好`,
          img: "",
        },
        {
          title: "编写原生查询sql",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//某些情况代码生成的页面，需要关联更多的条件，又不想写linq,请参照编写sql（2020.08.15需要更新）</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//在表的service类中实现querysql，如SellOrderService类，编辑自定义sql</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">public</span>&nbsp;<span style="color:#9cdcfe;">override</span>&nbsp;<span style="color:#9cdcfe;">PageGridData</span>&lt;<span style="color:#9cdcfe;">SellOrder</span>&gt;&nbsp;<span style="color:#dcdcaa;">GetPageData</span>(<span style="color:#9cdcfe;">PageDataOptions</span>&nbsp;<span style="color:#9cdcfe;">options</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//2020.08.15</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设置原生查询的sql语句，这里必须返回select&nbsp;*&nbsp;表所有字段</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//（先内部过滤数据,内部调用EF方法FromSqlRaw,自己写的sql注意sql注入的问题），不会影响界面上提交的查询</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">string</span>&nbsp;<span style="color:#9cdcfe;">date</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">DateTime</span>.<span style="color:#9cdcfe;">Now</span>.<span style="color:#dcdcaa;">AddYears</span>(-<span style="color:#b5cea8;">10</span>).<span style="color:#dcdcaa;">ToString</span>(<span style="color:#ce9178;">"yyyy-MM-dd"</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">QuerySql</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">$</span>@<span style="color:#ce9178;">"select&nbsp;*&nbsp;from&nbsp;SellOrder&nbsp;</span><span style="color:#f44747;">&nbsp;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">where</span>&nbsp;<span style="color:#9cdcfe;">createdate</span>&gt;<span style="color:#ce9178;">'{date}'</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">and</span>&nbsp;&nbsp;<span style="color:#9cdcfe;">Order_Id</span>&nbsp;<span style="color:#569cd6;">in</span>&nbsp;(<span style="color:#9cdcfe;">select</span>&nbsp;<span style="color:#9cdcfe;">Order_Id</span>&nbsp;<span style="color:#9cdcfe;">from</span>&nbsp;<span style="color:#9cdcfe;">SellOrderList</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">and</span>&nbsp;<span style="color:#9cdcfe;">CreateID</span>={UserContext.Current.<span style="color:#9cdcfe;">UserId</span>}<span style="color:#ce9178;">"</span><span style="color:#f44747;">;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#9cdcfe;">base</span>.<span style="color:#dcdcaa;">GetPageData</span>(<span style="color:#9cdcfe;">options</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div>`,
          ],
          tips: ` 还没想好`,
          img: "",
        },
        {
          title: "接口不验证是否登陆",
          content: [
            `
            在控制器的方法上加属性[AllowAnonymous]`,
          ],
          tips: ` 还没想好`,
          img: "",
        },
        {
          title: "接口token永不过期",
          content: [
            `
            在控制器的方法上加属性[FixedToken]`,
          ],
          tips: ` 还没想好`,
          img: "",
        },
        {
          title: "写入日志",
          content: [
            `
             VOL.Core.Services.Logger.Info()/Error()`,
          ],
          tips: ` 还没想好`,
          img: "",
        },
        {
          title: "获取字典数据源",
          content: [
            ` <p> DictionaryManager.Dictionaries</p>
            <p> DictionaryManager.GetDictionary("字典编号")</p>`,
          ],
          tips: ` 还没想好`,
          img: "",
        },
        {
          title: "SqlBulkInsert批量插入",
          content: [
            ` <p> DBServerProvider.SqlDapper.BulkInsert()</p>
              <p>sqlserver与mysql都可以使用</p>`,
          ],
          tips: ` 还没想好`,
          img: "",
        },
        {
          title: "其他常用工具",
          content: [
            `<p>扩展方法：Vol.Core->Extensions</p><p>工具类：Vol.Core->Utilities </p>`,
          ],
          tips: ` 还没想好`,
          img: "",
        },
        {
          title: "接口参数验证",
          content: [`参照菜单[可复用后台校验]`],
          tips: ` 可复用后台校验，一次性配置好参数，不再需要在方法中写if else判断参数合法性`,
          img: "",
        },

        {
          title: "后台基础代码扩展实现",
          name: "extend",
          content: [
            `<p>
			<div style="font-size:25px;">这里只是示例，每张生成的表都有一个service类，按需复制下面的方法实现</div>
	<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;">
		<div>
			<span style="color:#9cdcfe;">public</span> <span style="color:#9cdcfe;">partial</span> <span style="color:#569cd6;">class</span> <span style="color:#4ec9b0;">SellOrderService</span>
		</div>
		<div>
			{
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#569cd6;">public</span> <span style="color:#9cdcfe;">string</span> <span style="color:#dcdcaa;">GetServiceDate</span>()
		</div>
		<div>
			&nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#9cdcfe;">DateTime</span>.<span style="color:#9cdcfe;">Now</span>.<span style="color:#dcdcaa;">ToString</span>(<span style="color:#ce9178;">"yyyy-MM-dd HH:mm:sss"</span>);
		</div>
		<div>
			&nbsp; &nbsp; }
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">//此SellOrderService.cs类由代码生成器生成，默认是没有任何代码，如果需要写业务代码，请在此类中实现</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">//如果默认的增、删、改、查、导入、导出、审核满足不了业务，请参考下面的方法进行业务代码扩展(扩展代码是对ServiceFunFilter.cs的实现)</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#9cdcfe;">WebResponseContent</span> <span style="color:#9cdcfe;">webResponse</span> = <span style="color:#569cd6;">new</span> <span style="color:#dcdcaa;">WebResponseContent</span>();
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#569cd6;">private</span> <span style="color:#9cdcfe;">IHttpContextAccessor</span> <span style="color:#9cdcfe;">_httpContextAccessor</span>;
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#569cd6;">private</span> <span style="color:#9cdcfe;">ISellOrderRepository</span> <span style="color:#9cdcfe;">_repository</span>;
		</div>
		<div>
			&nbsp; &nbsp; [<span style="color:#9cdcfe;">ActivatorUtilitiesConstructor</span>]
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#569cd6;">public</span> <span style="color:#dcdcaa;">SellOrderService</span>(<span style="color:#9cdcfe;">IHttpContextAccessor</span> <span style="color:#9cdcfe;">httpContextAccessor</span>, <span style="color:#9cdcfe;">ISellOrderRepository</span> <span style="color:#9cdcfe;">repository</span>)
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; : <span style="color:#4ec9b0;">base</span>(<span style="color:#4ec9b0;">repository</span>)
		</div>
		<div>
			&nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">_httpContextAccessor</span> = <span style="color:#9cdcfe;">httpContextAccessor</span>;
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">_repository</span> = <span style="color:#9cdcfe;">repository</span>;
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//2020.08.15</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//开启数据隔离功能,开启后会对查询、导出、删除、编辑功能同时生效</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//如果只需要对某个功能生效，如编辑，则在重写编辑方法中设置 IsMultiTenancy = true;</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// IsMultiTenancy = true;</span>
		</div>
		<div>
			&nbsp; &nbsp; }
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">//查询</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#569cd6;">public</span> <span style="color:#569cd6;">override</span> <span style="color:#9cdcfe;">PageGridData</span>&lt;<span style="color:#9cdcfe;">SellOrder</span>&gt; <span style="color:#dcdcaa;">GetPageData</span>(<span style="color:#9cdcfe;">PageDataOptions</span> <span style="color:#9cdcfe;">options</span>)
		</div>
		<div>
			&nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//options.Value可以从前台查询的方法提交一些其他参数放到value里面</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//前端提交方式，见文档：组件api-&gt;viewgrid组件里面的searchBefore方法</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">object</span> <span style="color:#9cdcfe;">extraValue</span> = <span style="color:#9cdcfe;">options</span>.<span style="color:#9cdcfe;">Value</span>;
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//此处是从前台提交的原生的查询条件，这里可以自己过滤</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#dcdcaa;">QueryRelativeList</span> = (<span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">SearchParameters</span>&gt; <span style="color:#9cdcfe;">parameters</span>) <span style="color:#569cd6;">=&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; {
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; };
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//2020.08.15</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//设置原生查询的sql语句，这里必须返回select * 表所有字段</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//（先内部过滤数据,内部调用EF方法FromSqlRaw,自己写的sql注意sql注入的问题），不会影响界面上提交的查询</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">/* &nbsp;</span>
		</div>
		<div>
			<span style="color:#6a9955;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* &nbsp;string date = DateTime.Now.AddYears(-10).ToString("yyyy-MM-dd");</span>
		</div>
		<div>
			<span style="color:#6a9955;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; QuerySql = $@"select * from SellOrder &nbsp;</span>
		</div>
		<div>
			<span style="color:#6a9955;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;where createdate&gt;'{date}'</span>
		</div>
		<div>
			<span style="color:#6a9955;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;and &nbsp;Order_Id in (select Order_Id from SellOrderList)</span>
		</div>
		<div>
			<span style="color:#6a9955;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;and CreateID={UserContext.Current.UserId}";</span>
		</div>
		<div>
			<span style="color:#6a9955;">&nbsp; &nbsp; &nbsp; &nbsp; */</span>
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//2020.08.15</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//此处与上面QuerySql只需要实现其中一个就可以了</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//查询前可以自已设定查询表达式的条件</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#dcdcaa;">QueryRelativeExpression</span> = (<span style="color:#9cdcfe;">IQueryable</span>&lt;<span style="color:#9cdcfe;">SellOrder</span>&gt; <span style="color:#9cdcfe;">queryable</span>) <span style="color:#569cd6;">=&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//当前用户只能操作自己(与下级角色)创建的数据,如:查询、删除、修改等操作</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//IQueryable&lt;int&gt; userQuery = RoleContext.GetCurrentAllChildUser();</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//queryable = queryable.Where(x =&gt; x.CreateID == UserContext.Current.UserId || userQuery.Contains(x.CreateID ?? 0));</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#9cdcfe;">queryable</span>;
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; };
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//指定多个字段进行排序</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#dcdcaa;">OrderByExpression</span> = <span style="color:#9cdcfe;">x</span> <span style="color:#569cd6;">=&gt;</span> <span style="color:#569cd6;">new</span> <span style="color:#dcdcaa;">Dictionary</span>&lt;<span style="color:#4ec9b0;">object</span>, <span style="color:#4ec9b0;">QueryOrderBy</span>&gt;() {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; { <span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">CreateDate</span>,<span style="color:#9cdcfe;">QueryOrderBy</span>.<span style="color:#9cdcfe;">Desc</span> },
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; { <span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">SellNo</span>,<span style="color:#9cdcfe;">QueryOrderBy</span>.<span style="color:#9cdcfe;">Asc</span>}
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; };
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//int a = 1;</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">////指定多个字段按条件进行排序（需要2021.07.04更新LambdaExtensions类后才能使用）</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//OrderByExpression = x =&gt; new Dictionary&lt;object, QueryOrderBy&gt;() {</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// &nbsp; &nbsp;{ x.CreateDate,QueryOrderBy.Desc },</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// &nbsp; &nbsp;{ x.SellNo,a==1?QueryOrderBy.Desc:QueryOrderBy.Asc}</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//};</span>
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//查询完成后，在返回页面前可对查询的数据进行操作</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#dcdcaa;">GetPageDataOnExecuted</span> = (<span style="color:#9cdcfe;">PageGridData</span>&lt;<span style="color:#9cdcfe;">SellOrder</span>&gt; <span style="color:#9cdcfe;">grid</span>) <span style="color:#569cd6;">=&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//可对查询的结果的数据操作</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">SellOrder</span>&gt; <span style="color:#9cdcfe;">sellOrders</span> = <span style="color:#9cdcfe;">grid</span>.<span style="color:#9cdcfe;">rows</span>;
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; };
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//查询table界面显示求和</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#dcdcaa;">SummaryExpress</span> = (<span style="color:#9cdcfe;">IQueryable</span>&lt;<span style="color:#9cdcfe;">SellOrder</span>&gt; <span style="color:#9cdcfe;">queryable</span>) <span style="color:#569cd6;">=&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#9cdcfe;">queryable</span>.<span style="color:#dcdcaa;">GroupBy</span>(<span style="color:#9cdcfe;">x</span> <span style="color:#569cd6;">=&gt;</span> <span style="color:#b5cea8;">1</span>).<span style="color:#dcdcaa;">Select</span>(<span style="color:#9cdcfe;">x</span> <span style="color:#569cd6;">=&gt;</span> <span style="color:#569cd6;">new</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//AvgPrice注意大小写和数据库字段大小写一样</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">Qty</span> = <span style="color:#9cdcfe;">x</span>.<span style="color:#dcdcaa;">Sum</span>(<span style="color:#9cdcfe;">o</span> <span style="color:#569cd6;">=&gt;</span> <span style="color:#9cdcfe;">o</span>.<span style="color:#9cdcfe;">Qty</span>).<span style="color:#dcdcaa;">ToString</span>(<span style="color:#ce9178;">"f2"</span>)
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; })
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .<span style="color:#dcdcaa;">FirstOrDefault</span>();
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; };
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#9cdcfe;">base</span>.<span style="color:#dcdcaa;">GetPageData</span>(<span style="color:#9cdcfe;">options</span>);
		</div>
		<div>
			&nbsp; &nbsp; }
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// &lt;summary&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// 设置弹出框明细表的合计信息</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// &lt;/summary&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// &lt;typeparam name="detail"&gt;&lt;/typeparam&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// &lt;param name="queryeable"&gt;&lt;/param&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// &lt;returns&gt;&lt;/returns&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#569cd6;">protected</span> <span style="color:#569cd6;">override</span> <span style="color:#9cdcfe;">object</span> <span style="color:#dcdcaa;">GetDetailSummary</span>&lt;<span style="color:#4ec9b0;">detail</span>&gt;(<span style="color:#9cdcfe;">IQueryable</span>&lt;<span style="color:#9cdcfe;">detail</span>&gt; <span style="color:#9cdcfe;">queryeable</span>)
		</div>
		<div>
			&nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> (<span style="color:#9cdcfe;">queryeable</span> <span style="color:#c586c0;">as</span> <span style="color:#4ec9b0;">IQueryable</span>&lt;<span style="color:#4ec9b0;">SellOrderList</span>&gt;).<span style="color:#dcdcaa;">GroupBy</span>(<span style="color:#9cdcfe;">x</span> <span style="color:#569cd6;">=&gt;</span> <span style="color:#b5cea8;">1</span>).<span style="color:#dcdcaa;">Select</span>(<span style="color:#9cdcfe;">x</span> <span style="color:#569cd6;">=&gt;</span> <span style="color:#569cd6;">new</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//Weight/Qty注意大小写和数据库字段大小写一样</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">Weight</span> = <span style="color:#9cdcfe;">x</span>.<span style="color:#dcdcaa;">Sum</span>(<span style="color:#9cdcfe;">o</span> <span style="color:#569cd6;">=&gt;</span> <span style="color:#9cdcfe;">o</span>.<span style="color:#9cdcfe;">Weight</span>),
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">Qty</span> = <span style="color:#9cdcfe;">x</span>.<span style="color:#dcdcaa;">Sum</span>(<span style="color:#9cdcfe;">o</span> <span style="color:#569cd6;">=&gt;</span> <span style="color:#9cdcfe;">o</span>.<span style="color:#9cdcfe;">Qty</span>)
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; }).<span style="color:#dcdcaa;">FirstOrDefault</span>();
		</div>
		<div>
			&nbsp; &nbsp; }
		</div>
<br />
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// &lt;summary&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// 查询业务代码编写(从表(明细表查询))</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// &lt;/summary&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// &lt;param name="pageData"&gt;&lt;/param&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// &lt;returns&gt;&lt;/returns&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#569cd6;">public</span> <span style="color:#569cd6;">override</span> <span style="color:#9cdcfe;">object</span> <span style="color:#dcdcaa;">GetDetailPage</span>(<span style="color:#9cdcfe;">PageDataOptions</span> <span style="color:#9cdcfe;">pageData</span>)
		</div>
		<div>
			&nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//自定义查询胆细表</span>
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">////明细表自定义查询方式一：EF</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//var query = SellOrderListRepository.Instance.IQueryablePage&lt;SellOrderList&gt;(</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// &nbsp; &nbsp; pageData.Page,</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// &nbsp; &nbsp; pageData.Rows,</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// &nbsp; &nbsp; out int count,</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// &nbsp; &nbsp; x =&gt; x.Order_Id == pageData.Value.GetGuid(),</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// &nbsp; &nbsp; &nbsp;orderBy: x =&gt; new Dictionary&lt;object, QueryOrderBy&gt;() { { x.CreateDate, QueryOrderBy.Desc } }</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// &nbsp; &nbsp;);</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//PageGridData&lt;SellOrderList&gt; detailGrid = new PageGridData&lt;SellOrderList&gt;();</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//detailGrid.rows = query.ToList();</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//detailGrid.total = count;</span>
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">////明细表自定义查询方式二：dapper</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//string sql = "select count(1) from SellOrderList where Order_Id=@orderId";</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//detailGrid.total = repository.DapperContext.ExecuteScalar(sql, new { orderId = pageData.Value }).GetInt();</span>
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//sql = @$"select * from (</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;select *,ROW_NUMBER()over(order by createdate desc) as rowId </span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; from SellOrderList where Order_Id=@orderId</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// &nbsp; &nbsp; &nbsp; &nbsp;) as s where s.rowId between {((pageData.Page - 1) * pageData.Rows + 1)} and {pageData.Page * pageData.Rows} ";</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//detailGrid.rows = repository.DapperContext.QueryList&lt;SellOrderList&gt;(sql, new { orderId = pageData.Value });</span>
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//return detailGrid;</span>
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#9cdcfe;">base</span>.<span style="color:#dcdcaa;">GetDetailPage</span>(<span style="color:#9cdcfe;">pageData</span>);
		</div>
		<div>
			&nbsp; &nbsp; }
		</div>
<br />
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// &lt;summary&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// 新建</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// &lt;/summary&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// &lt;param name="saveDataModel"&gt;&lt;/param&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// &lt;returns&gt;&lt;/returns&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#569cd6;">public</span> <span style="color:#569cd6;">override</span> <span style="color:#9cdcfe;">WebResponseContent</span> <span style="color:#dcdcaa;">Add</span>(<span style="color:#9cdcfe;">SaveModel</span> <span style="color:#9cdcfe;">saveDataModel</span>)
		</div>
		<div>
			&nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//此处saveModel是从前台提交的原生数据，可对数据进修改过滤</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#dcdcaa;">AddOnExecute</span> = (<span style="color:#9cdcfe;">SaveModel</span> <span style="color:#9cdcfe;">saveModel</span>) <span style="color:#569cd6;">=&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//如果返回false,后面代码不会再执行</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#9cdcfe;">webResponse</span>.<span style="color:#dcdcaa;">OK</span>();
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; };
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// 在保存数据库前的操作，所有数据都验证通过了，这一步执行完就执行数据库保存</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#dcdcaa;">AddOnExecuting</span> = (<span style="color:#9cdcfe;">SellOrder</span> <span style="color:#9cdcfe;">order</span>, <span style="color:#9cdcfe;">object</span> <span style="color:#9cdcfe;">list</span>) <span style="color:#569cd6;">=&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//明细表对象</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">SellOrderList</span>&gt; <span style="color:#9cdcfe;">orderLists</span> = <span style="color:#9cdcfe;">list</span> <span style="color:#c586c0;">as</span> <span style="color:#4ec9b0;">List</span>&lt;<span style="color:#4ec9b0;">SellOrderList</span>&gt;;
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//自定义逻辑</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">if</span> (<span style="color:#9cdcfe;">orderLists</span> == <span style="color:#569cd6;">null</span> || <span style="color:#9cdcfe;">orderLists</span>.<span style="color:#9cdcfe;">Count</span> == <span style="color:#b5cea8;">0</span>)
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {<span style="color:#6a9955;">//如果没有界面上没有填写明细，则中断执行</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#9cdcfe;">webResponse</span>.<span style="color:#dcdcaa;">Error</span>(<span style="color:#ce9178;">"必须填写明细数据"</span>);
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">if</span> (<span style="color:#9cdcfe;">orderLists</span>.<span style="color:#dcdcaa;">Exists</span>(<span style="color:#9cdcfe;">x</span> <span style="color:#569cd6;">=&gt;</span> <span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">Qty</span> &lt;= <span style="color:#b5cea8;">20</span>))
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#9cdcfe;">webResponse</span>.<span style="color:#dcdcaa;">Error</span>(<span style="color:#ce9178;">"明细数量必须大于20"</span>);
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//设置webResponse.Code = "-1"会中止后面代码执行，与返回 webResponse.Error()一样，区别在于前端提示的是成功或失败</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//webResponse.Code = "-1";</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// webResponse.Message = "测试强制返回";</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//return webResponse.OK("ok");</span>
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#9cdcfe;">webResponse</span>.<span style="color:#dcdcaa;">OK</span>();
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; };
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//此方法中已开启了事务，如果在此方法中做其他数据库操作，请不要再开启事务</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// 在保存数据库后的操作，此时已进行数据提交，但未提交事务，如果返回false，则会回滚提交</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#dcdcaa;">AddOnExecuted</span> = (<span style="color:#9cdcfe;">SellOrder</span> <span style="color:#9cdcfe;">order</span>, <span style="color:#9cdcfe;">object</span> <span style="color:#9cdcfe;">list</span>) <span style="color:#569cd6;">=&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//明细表对象</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// List&lt;SellOrderList&gt; orderLists = list as List&lt;SellOrderList&gt;;</span>
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">if</span> (<span style="color:#9cdcfe;">order</span>.<span style="color:#9cdcfe;">Qty</span> &lt; <span style="color:#b5cea8;">10</span>)
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; { &nbsp;<span style="color:#6a9955;">//如果输入的销售数量&lt;10，会回滚数据库</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#9cdcfe;">webResponse</span>.<span style="color:#dcdcaa;">Error</span>(<span style="color:#ce9178;">"销售数量必须大于1000"</span>);
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#9cdcfe;">webResponse</span>.<span style="color:#dcdcaa;">OK</span>(<span style="color:#ce9178;">"已新建成功,台AddOnExecuted方法返回的消息"</span>);
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; };
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//新建的数据进入审批流程前处理，</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#dcdcaa;">AddWorkFlowExecuting</span> = (<span style="color:#9cdcfe;">SellOrder</span> <span style="color:#9cdcfe;">order</span>) <span style="color:#569cd6;">=&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//返回false，当前数据不会进入审批流程</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#569cd6;">true</span>;
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; };
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//新建的数据写入审批流程后,第二个参数为审批人的用户id</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#dcdcaa;">AddWorkFlowExecuted</span> = (<span style="color:#9cdcfe;">SellOrder</span> <span style="color:#9cdcfe;">order</span>, <span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">int</span>&gt; <span style="color:#9cdcfe;">userIds</span>) <span style="color:#569cd6;">=&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//这里可以做发邮件通知</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//var userInfo = repository.DbContext.Set&lt;Sys_User&gt;()</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.Where(x =&gt; userIds.Contains(x.User_Id))</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.Select(s =&gt; new { s.User_Id, s.UserTrueName, s.Email, s.PhoneNo }).ToList();</span>
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//发送邮件方法</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//MailHelper.Send()</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; };
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#9cdcfe;">base</span>.<span style="color:#dcdcaa;">Add</span>(<span style="color:#9cdcfe;">saveDataModel</span>);
		</div>
		<div>
			&nbsp; &nbsp; }
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// &lt;summary&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// 编辑操作</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// &lt;/summary&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// &lt;param name="saveModel"&gt;&lt;/param&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// &lt;returns&gt;&lt;/returns&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#569cd6;">public</span> <span style="color:#569cd6;">override</span> <span style="color:#9cdcfe;">WebResponseContent</span> <span style="color:#dcdcaa;">Update</span>(<span style="color:#9cdcfe;">SaveModel</span> <span style="color:#9cdcfe;">saveModel</span>)
		</div>
		<div>
			&nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//注意：如果要给其他字段设置值，请在此处设置,如：（代码生成器上将字段编辑行设置为0，然后点生成model）</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//saveModel.MainData["字段"] = "值";</span>
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//此处saveModel是从前台提交的原生数据，可对数据进修改过滤</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#dcdcaa;">UpdateOnExecute</span> = (<span style="color:#9cdcfe;">SaveModel</span> <span style="color:#9cdcfe;">model</span>) <span style="color:#569cd6;">=&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">////这里的设置配合下面order.Remark = "888"代码位置使用</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// saveModel.MainData.TryAdd("Remark", "1231");</span>
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//如果不想前端提交某些可以编辑的字段的值,直接移除字段</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// saveModel.MainData.Remove("字段");</span>
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//如果返回false,后面代码不会再执行</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#9cdcfe;">webResponse</span>.<span style="color:#dcdcaa;">OK</span>();
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; };
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//编辑方法保存数据库前处理</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#dcdcaa;">UpdateOnExecuting</span> = (<span style="color:#9cdcfe;">SellOrder</span> <span style="color:#9cdcfe;">order</span>, <span style="color:#9cdcfe;">object</span> <span style="color:#9cdcfe;">addList</span>, <span style="color:#9cdcfe;">object</span> <span style="color:#9cdcfe;">updateList</span>, <span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">object</span>&gt; <span style="color:#9cdcfe;">delKeys</span>) <span style="color:#569cd6;">=&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">if</span> (<span style="color:#9cdcfe;">order</span>.<span style="color:#9cdcfe;">TranNo</span> == <span style="color:#ce9178;">"2019000001810001"</span>)
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//如果设置code=-1会强制返回，不再继续后面的操作,2021.07.04更新LambdaExtensions文件后才可以使用此属性</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//webResponse.Code = "-1";</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// webResponse.Message = "测试强制返回";</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//return webResponse.OK();</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#9cdcfe;">webResponse</span>.<span style="color:#dcdcaa;">Error</span>(<span style="color:#ce9178;">"不能更新此["</span> + <span style="color:#9cdcfe;">order</span>.<span style="color:#9cdcfe;">TranNo</span> + <span style="color:#ce9178;">"]单号"</span>);
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">////如果要手动设置某些字段的值,值不是前端提交的（代码生成器里面编辑行必须设置为0并生成model）,如Remark字段:</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">////注意必须设置上面saveModel.MainData.TryAdd("Remark", "1231")</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//order.Remark = "888";</span>
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//新增的明细表</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">SellOrderList</span>&gt; <span style="color:#9cdcfe;">add</span> = <span style="color:#9cdcfe;">addList</span> <span style="color:#c586c0;">as</span> <span style="color:#4ec9b0;">List</span>&lt;<span style="color:#4ec9b0;">SellOrderList</span>&gt;;
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//修改的明细表</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">SellOrderList</span>&gt; <span style="color:#9cdcfe;">update</span> = <span style="color:#9cdcfe;">updateList</span> <span style="color:#c586c0;">as</span> <span style="color:#4ec9b0;">List</span>&lt;<span style="color:#4ec9b0;">SellOrderList</span>&gt;;
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//删除明细表Id</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#569cd6;">var</span> <span style="color:#9cdcfe;">guids</span> = <span style="color:#9cdcfe;">delKeys</span>?.<span style="color:#dcdcaa;">Select</span>(<span style="color:#9cdcfe;">x</span> <span style="color:#569cd6;">=&gt;</span> (<span style="color:#9cdcfe;">Guid</span>)<span style="color:#9cdcfe;">x</span>);
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//设置webResponse.Code = "-1"会中止后面代码执行，与返回 webResponse.Error()一样，区别在于前端提示的是成功或失败</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//webResponse.Code = "-1";</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// webResponse.Message = "测试强制返回";</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//return webResponse.OK("ok");</span>
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#9cdcfe;">webResponse</span>.<span style="color:#dcdcaa;">OK</span>();
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; };
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//编辑方法保存数据库后处理</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//此方法中已开启了事务，如果在此方法中做其他数据库操作，请不要再开启事务</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// 在保存数据库后的操作，此时已进行数据提交，但未提交事务，如果返回false，则会回滚提交</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#dcdcaa;">UpdateOnExecuted</span> = (<span style="color:#9cdcfe;">SellOrder</span> <span style="color:#9cdcfe;">order</span>, <span style="color:#9cdcfe;">object</span> <span style="color:#9cdcfe;">addList</span>, <span style="color:#9cdcfe;">object</span> <span style="color:#9cdcfe;">updateList</span>, <span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">object</span>&gt; <span style="color:#9cdcfe;">delKeys</span>) <span style="color:#569cd6;">=&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//新增的明细</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">SellOrderList</span>&gt; <span style="color:#9cdcfe;">add</span> = <span style="color:#9cdcfe;">addList</span> <span style="color:#c586c0;">as</span> <span style="color:#4ec9b0;">List</span>&lt;<span style="color:#4ec9b0;">SellOrderList</span>&gt;;
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//修改的明细</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">SellOrderList</span>&gt; <span style="color:#9cdcfe;">update</span> = <span style="color:#9cdcfe;">updateList</span> <span style="color:#c586c0;">as</span> <span style="color:#4ec9b0;">List</span>&lt;<span style="color:#4ec9b0;">SellOrderList</span>&gt;;
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//删除的行的主键</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#569cd6;">var</span> <span style="color:#9cdcfe;">guids</span> = <span style="color:#9cdcfe;">delKeys</span>?.<span style="color:#dcdcaa;">Select</span>(<span style="color:#9cdcfe;">x</span> <span style="color:#569cd6;">=&gt;</span> (<span style="color:#9cdcfe;">Guid</span>)<span style="color:#9cdcfe;">x</span>);
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#9cdcfe;">webResponse</span>.<span style="color:#dcdcaa;">OK</span>();
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; };
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#9cdcfe;">base</span>.<span style="color:#dcdcaa;">Update</span>(<span style="color:#9cdcfe;">saveModel</span>);
		</div>
		<div>
			&nbsp; &nbsp; }
		</div>
<br />
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// &lt;summary&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// 删除</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// &lt;/summary&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// &lt;param name="keys"&gt;删除的行的主键&lt;/param&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// &lt;param name="delList"&gt;删除时是否将明细也删除&lt;/param&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// &lt;returns&gt;&lt;/returns&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#569cd6;">public</span> <span style="color:#569cd6;">override</span> <span style="color:#9cdcfe;">WebResponseContent</span> <span style="color:#dcdcaa;">Del</span>(<span style="color:#9cdcfe;">object</span>[] <span style="color:#9cdcfe;">keys</span>, <span style="color:#9cdcfe;">bool</span> <span style="color:#9cdcfe;">delList</span> = <span style="color:#569cd6;">true</span>)
		</div>
		<div>
			&nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//删除前处理</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//删除的行的主键</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#dcdcaa;">DelOnExecuting</span> = (<span style="color:#9cdcfe;">object</span>[] <span style="color:#9cdcfe;">_keys</span>) <span style="color:#569cd6;">=&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#9cdcfe;">webResponse</span>.<span style="color:#dcdcaa;">OK</span>();
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; };
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//删除后处理</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//删除的行的主键</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#dcdcaa;">DelOnExecuted</span> = (<span style="color:#9cdcfe;">object</span>[] <span style="color:#9cdcfe;">_keys</span>) <span style="color:#569cd6;">=&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span style="color:#c586c0;">return</span> <span style="color:#9cdcfe;">webResponse</span>.<span style="color:#dcdcaa;">OK</span>();
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;};
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#9cdcfe;">base</span>.<span style="color:#dcdcaa;">Del</span>(<span style="color:#9cdcfe;">keys</span>, <span style="color:#9cdcfe;">delList</span>);
		</div>
		<div>
			&nbsp; &nbsp; }
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#569cd6;">public</span> <span style="color:#569cd6;">override</span> <span style="color:#9cdcfe;">WebResponseContent</span> <span style="color:#dcdcaa;">Audit</span>(<span style="color:#9cdcfe;">object</span>[] <span style="color:#9cdcfe;">keys</span>, <span style="color:#9cdcfe;">int</span>? <span style="color:#9cdcfe;">auditStatus</span>, <span style="color:#9cdcfe;">string</span> <span style="color:#9cdcfe;">auditReason</span>)
		</div>
		<div>
			&nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//status当前审批状态,lastAudit是否最后一个审批节点</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#dcdcaa;">AuditWorkFlowExecuting</span> = (<span style="color:#9cdcfe;">SellOrder</span> <span style="color:#9cdcfe;">order</span>, <span style="color:#9cdcfe;">AuditStatus</span> <span style="color:#9cdcfe;">status</span>, <span style="color:#9cdcfe;">bool</span> <span style="color:#9cdcfe;">lastAudit</span>) <span style="color:#569cd6;">=&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#9cdcfe;">webResponse</span>.<span style="color:#dcdcaa;">OK</span>();
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; };
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//status当前审批状态,nextUserIds下一个节点审批人的帐号id(可以从sys_user表中查询用户具体信息),lastAudit是否最后一个审批节点</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#dcdcaa;">AuditWorkFlowExecuted</span> = (<span style="color:#9cdcfe;">SellOrder</span> <span style="color:#9cdcfe;">order</span>, <span style="color:#9cdcfe;">AuditStatus</span> <span style="color:#9cdcfe;">status</span>, <span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">int</span>&gt; <span style="color:#9cdcfe;">nextUserIds</span>, <span style="color:#9cdcfe;">bool</span> <span style="color:#9cdcfe;">lastAudit</span>) <span style="color:#569cd6;">=&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//lastAudit=true时，流程已经结束 </span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">if</span> (!<span style="color:#9cdcfe;">lastAudit</span>)
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//这里可以给下一批审批发送邮件通知</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//var userInfo = repository.DbContext.Set&lt;Sys_User&gt;()</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .Where(x =&gt; nextUserIds.Contains(x.User_Id))</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .Select(s =&gt; new { s.User_Id, s.UserTrueName, s.Email, s.PhoneNo }).ToList();</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//审批流程回退功能，回到第一个审批人重新审批(重新生成审批流程)</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//if (status==AuditStatus.审核未通过||status==AuditStatus.驳回)</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//{</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// &nbsp; &nbsp;base.RewriteFlow(order);</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//}</span>
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#9cdcfe;">webResponse</span>.<span style="color:#dcdcaa;">OK</span>();
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; };
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//审核保存前处理(不是审批流程)</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#dcdcaa;">AuditOnExecuting</span> = (<span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">SellOrder</span>&gt; <span style="color:#9cdcfe;">order</span>) <span style="color:#569cd6;">=&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#9cdcfe;">webResponse</span>.<span style="color:#dcdcaa;">OK</span>();
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; };
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//审核后处理(不是审批流程)</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#dcdcaa;">AuditOnExecuted</span> = (<span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">SellOrder</span>&gt; <span style="color:#9cdcfe;">order</span>) <span style="color:#569cd6;">=&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#9cdcfe;">webResponse</span>.<span style="color:#dcdcaa;">OK</span>();
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; };
		</div>
<br />
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#9cdcfe;">base</span>.<span style="color:#dcdcaa;">Audit</span>(<span style="color:#9cdcfe;">keys</span>, <span style="color:#9cdcfe;">auditStatus</span>, <span style="color:#9cdcfe;">auditReason</span>);
		</div>
		<div>
			&nbsp; &nbsp; }
		</div>
<br />
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// &lt;summary&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// 导出</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// &lt;/summary&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// &lt;param name="pageData"&gt;&lt;/param&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// &lt;returns&gt;&lt;/returns&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#569cd6;">public</span> <span style="color:#569cd6;">override</span> <span style="color:#9cdcfe;">WebResponseContent</span> <span style="color:#dcdcaa;">Export</span>(<span style="color:#9cdcfe;">PageDataOptions</span> <span style="color:#9cdcfe;">pageData</span>)
		</div>
		<div>
			&nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//设置最大导出的数量</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">Limit</span> = <span style="color:#b5cea8;">1000</span>;
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//指定导出的字段(2020.05.07)</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#dcdcaa;">ExportColumns</span> = <span style="color:#9cdcfe;">x</span> <span style="color:#569cd6;">=&gt;</span> <span style="color:#569cd6;">new</span> { x.<span style="color:#9cdcfe;">SellNo</span>, x.<span style="color:#9cdcfe;">TranNo</span>, x.<span style="color:#9cdcfe;">CreateDate</span> };
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//查询要导出的数据后，在生成excel文件前处理</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//list导出的实体，ignore过滤不导出的字段</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#dcdcaa;">ExportOnExecuting</span> = (<span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">SellOrder</span>&gt; <span style="color:#9cdcfe;">list</span>, <span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">string</span>&gt; <span style="color:#9cdcfe;">ignore</span>) <span style="color:#569cd6;">=&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#9cdcfe;">webResponse</span>.<span style="color:#dcdcaa;">OK</span>();
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; };
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#9cdcfe;">base</span>.<span style="color:#dcdcaa;">Export</span>(<span style="color:#9cdcfe;">pageData</span>);
		</div>
		<div>
			&nbsp; &nbsp; }
		</div>
<br />
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// &lt;summary&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// 下载模板(导入时弹出框中的下载模板)(2020.05.07)</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// &lt;/summary&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// &lt;returns&gt;&lt;/returns&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#569cd6;">public</span> <span style="color:#569cd6;">override</span> <span style="color:#9cdcfe;">WebResponseContent</span> <span style="color:#dcdcaa;">DownLoadTemplate</span>()
		</div>
		<div>
			&nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//指定导出模板的字段,如果不设置DownLoadTemplateColumns，默认导出查所有页面上能看到的列(2020.05.07)</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#dcdcaa;">DownLoadTemplateColumns</span> = <span style="color:#9cdcfe;">x</span> <span style="color:#569cd6;">=&gt;</span> <span style="color:#569cd6;">new</span> { <span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">SellNo</span>, <span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">TranNo</span>, <span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">Remark</span>, <span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">CreateDate</span> };
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#9cdcfe;">base</span>.<span style="color:#dcdcaa;">DownLoadTemplate</span>();
		</div>
		<div>
			&nbsp; &nbsp; }
		</div>
<br />
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// &lt;summary&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// 导入</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// &lt;/summary&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// &lt;param name="files"&gt;&lt;/param&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">/// &lt;returns&gt;&lt;/returns&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#569cd6;">public</span> <span style="color:#569cd6;">override</span> <span style="color:#9cdcfe;">WebResponseContent</span> <span style="color:#dcdcaa;">Import</span>(<span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">IFormFile</span>&gt; <span style="color:#9cdcfe;">files</span>)
		</div>
		<div>
			&nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//(2020.05.07)</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//设置导入的字段(如果指定了上面导出模板的字段，这里配置应该与上面DownLoadTemplate方法里配置一样)</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//如果不设置导入的字段DownLoadTemplateColumns,默认显示所有界面上所有可以看到的字段</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#dcdcaa;">DownLoadTemplateColumns</span> = <span style="color:#9cdcfe;">x</span> <span style="color:#569cd6;">=&gt;</span> <span style="color:#569cd6;">new</span> { <span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">SellNo</span>, <span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">TranNo</span>, <span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">Remark</span>, <span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">CreateDate</span> };
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">/// &lt;summary&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">/// 2022.06.20增加原生excel读取方法(导入时可以自定义读取excel内容)</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">/// string=当前读取的excel单元格的值</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">/// ExcelWorksheet=excel对象</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">/// ExcelRange当前excel单元格对象</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">/// int=当前读取的第几行</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">/// int=当前读取的第几列</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">/// string=返回的值</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">/// &lt;/summary&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#dcdcaa;">ImportOnReadCellValue</span> = (<span style="color:#9cdcfe;">string</span> <span style="color:#9cdcfe;">value</span>, <span style="color:#9cdcfe;">ExcelWorksheet</span> <span style="color:#9cdcfe;">worksheet</span>, <span style="color:#9cdcfe;">ExcelRange</span> <span style="color:#9cdcfe;">excelRange</span>, <span style="color:#9cdcfe;">int</span> <span style="color:#9cdcfe;">rowIndex</span>, <span style="color:#9cdcfe;">int</span> <span style="color:#9cdcfe;">columnIndex</span>) <span style="color:#569cd6;">=&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">string</span> <span style="color:#9cdcfe;">表头列名</span> = <span style="color:#9cdcfe;">worksheet</span>.<span style="color:#9cdcfe;">Cells</span>[<span style="color:#b5cea8;">1</span>, <span style="color:#9cdcfe;">columnIndex</span>].<span style="color:#9cdcfe;">Value</span>?.<span style="color:#dcdcaa;">ToString</span>();
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//这里可以返回处理后的值，值最终写入到model字段上</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#9cdcfe;">value</span>;
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; };
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//导入保存前处理(可以对list设置新的值)</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#dcdcaa;">ImportOnExecuting</span> = (<span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">SellOrder</span>&gt; <span style="color:#9cdcfe;">list</span>) <span style="color:#569cd6;">=&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//设置webResponse.Code = "-1"会中止后面代码执行，与返回 webResponse.Error()一样，区别在于前端提示的是成功或失败</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//webResponse.Code = "-1";</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//webResponse.Message = "测试强制返回";</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//return webResponse.OK("ok");</span>
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#9cdcfe;">webResponse</span>.<span style="color:#dcdcaa;">OK</span>();
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; };
		</div>
<br />
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//导入后处理(已经写入到数据库了)</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#dcdcaa;">ImportOnExecuted</span> = (<span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">SellOrder</span>&gt; <span style="color:#9cdcfe;">list</span>) <span style="color:#569cd6;">=&gt;</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#9cdcfe;">webResponse</span>.<span style="color:#dcdcaa;">OK</span>();
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; };
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#9cdcfe;">base</span>.<span style="color:#dcdcaa;">Import</span>(<span style="color:#9cdcfe;">files</span>);
		</div>
		<div>
			&nbsp; &nbsp; }
		</div>
<br />
		<div>
			&nbsp; &nbsp; <span style="color:#569cd6;">public</span> <span style="color:#569cd6;">override</span> <span style="color:#9cdcfe;">WebResponseContent</span> <span style="color:#dcdcaa;">Upload</span>(<span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">IFormFile</span>&gt; <span style="color:#9cdcfe;">files</span>)
		</div>
		<div>
			&nbsp; &nbsp; {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//自定义上传文件路径(目前只支持配置相对路径，默认上传到wwwwroot下)</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//2022.10.07更新ServiceBase.cs、ServiceFunFilter.cs后才能使用</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">UploadFolder</span> = <span style="color:#9cdcfe;">$</span><span style="color:#ce9178;">"test/{DateTime.Now.ToString("</span><span style="color:#9cdcfe;">yyyyMMdd</span><span style="color:#ce9178;">")}"</span>;
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#9cdcfe;">base</span>.<span style="color:#dcdcaa;">Upload</span>(<span style="color:#9cdcfe;">files</span>);
		</div>
		<div>
			&nbsp; &nbsp; }
		</div>
<br />
		<div>
			}
		</div>
	</div>
</p>
<p>
	<br />
</p>`,
          ],
          tips: `后面扩展实现覆盖了常用业务，请根据需要实现对应方法`,
        },
        {
          title: "绑定数据源及自定义sql源",
          content: [
            `<p>前端数据源绑定在菜单：系统->下拉框绑定设置中配置</p>
          <p>同时可以配置成自定义成sql语句,参照现有的配置</p>`,
          ],
          tips: `前端数据源绑定及导出，都在菜单:下拉框绑定设置中配置好，代码生成器中选择数据源后，其他都全部由框架自动完成`,
          img: "",
        },
        {
          title: "根据用户绑定数据源",
          content: [
            `根据用户信息动态绑定前端数据源:实现后台：在DictionaryHandler.GetCustomDBSql方法中添加`,
          ],
          tips: `某些情况可能用户只需要看到自己权限内的数据，可按此方法实现`,
          img: "",
        },
        {
          title: "视图操作",
          content: [
            `如果查询过于复杂或不想多表关联，请创建视图，再将视图生成代码`,
          ],
          tips: `使用视图某些情况能减下操作的复杂性`,
          img: "",
        },
        {
          title: "视图新增/删除/修改",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//视图不能直接新增/删除/修改操作</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//以视图为例：VSellOrderService</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">public</span>&nbsp;<span style="color:#9cdcfe;">partial</span>&nbsp;<span style="color:#569cd6;">class</span>&nbsp;<span style="color:#4ec9b0;">VSellOrderService</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;summary&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;编辑操作</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;/summary&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;param&nbsp;name="saveModel"&gt;&lt;/param&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;returns&gt;&lt;/returns&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">public</span>&nbsp;<span style="color:#9cdcfe;">override</span>&nbsp;<span style="color:#9cdcfe;">WebResponseContent</span>&nbsp;<span style="color:#dcdcaa;">Update</span>(<span style="color:#9cdcfe;">SaveModel</span>&nbsp;<span style="color:#9cdcfe;">saveModel</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//VSellOrder为视图</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//直接操作原表SellOrder的编辑功能</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//saveModel为视图编辑字段信息，如果当前视图提交的saveModel字段与原表SellOrder不一致，</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//可以直接修改视图提交saveModel里面的字段信息</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#9cdcfe;">SellOrderService</span>.<span style="color:#9cdcfe;">Instance</span>.<span style="color:#dcdcaa;">Update</span>(<span style="color:#9cdcfe;">saveModel</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;return&nbsp;base.Update(saveModel);</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//其他删除、新增处理方式同上</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div>`,
          ],
          tips: `使用视图某些情况能减下操作的复杂性`,
          img: "",
        },
      ],
    };
  },
};
</script>
<style lang="less" scoped>
.doc {
  .doc-left {
    border-right: 1px solid;
    margin-right: 30px;
    color: #d2d2d2;
    position: fixed;
    width: 250px;
    padding: 0 10px;
    bottom: 20px;
    top: 81px;
    li {
      padding: 10px 10px;
      font-size: 14px;
      a {
        color: #828282;
      }
    }
  }
  display: flex;
  .doc-right {
    margin-left: 270px;

    flex: 1;
    width: 900px;
  }
}
h2 {
  color: #171616;
  font-weight: 500;
}
.doc-wrapper {
  margin-bottom: 35px;
}
.top-content {
  color: #f44336;
  margin-top: 10px;
  border: 1px dotted #dcd3d3;
  border-radius: 6px;
  padding: 15px;
  background: white;
  font-size: 14px;
  margin-bottom: 10px;
  box-shadow: 0 8px 12px #ebedf0;
  > p {
    padding: 5px 0;
    padding-bottom: 10px;
  }
  > p:before {
    content: "";
    display: inline-block;
    width: 4px;
    height: 4px;
    border-radius: 50%;
    vertical-align: middle;
    background-color: #5e6d82;
    margin-right: 5px;
  }
}
.d-content {
  display: flex;
  margin-top: 10px;
  border: 1px dotted #dcd3d3;
  border-radius: 6px;
  padding: 15px;
  background: white;
  font-size: 14px;
  margin-bottom: 10px;
  box-shadow: 0 8px 12px #ebedf0;
  .code {
    margin-right: 15px;
    border-right: 1px solid #dbddde;
    flex: 1;
    // desc > div{

    // }
  }
  .img {
    cursor: pointer;
    width: 500px;
    img {
      width: 100%;
    }
  }
  > p {
    padding: 5px 0;
  }
  > p:before {
    content: "";
    display: inline-block;
    width: 4px;
    height: 4px;
    border-radius: 50%;
    vertical-align: middle;
    background-color: #5e6d82;
    margin-right: 5px;
  }
}
.title h2:before {
  content: "";
  display: inline-block;
  width: 4px;
  height: 4px;
  border-radius: 50%;
  vertical-align: middle;
  background-color: #5e6d82;
  margin-right: 5px;
}
.active {
  color: #409eff !important;
}
.doc-nav {
  margin: 15px;
  text-align: center;
  padding: 10px;
  a {
    font-size: 20px;
    margin: 0 10px;
    line-height: 30px;
    padding: 4px 0;
    border-bottom: 1px solid;
  }
}
</style>
