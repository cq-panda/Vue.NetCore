<template>
  <div class="doc">
    <div class="doc-left">
      <el-scrollbar style="height:100%;">
        <ul>
          <li class="n-item" v-for="(item,index) in items" :key="index">
            <a :class="{active:active==index}" @click="scrollIntoView(index)">{{item.title}}</a>
          </li>
        </ul>
      </el-scrollbar>
    </div>
    <div class="doc-right">
      <div class="title">
        <h2>后台开发</h2>
      </div>
      <div class="top-content">
        <div>
          <p class="desc">后台开发都是代码生成器生成后的类进行扩展及常用功能使用</p>
        </div>
        <div>
          <p
            class="desc"
            style="font-size: 20px;"
          >后台完整扩展实现：VOL.Order->Services->Sell->Partial->SellOrderService.cs文件</p>
        </div>
      </div>
      <Alert type="success" show-icon>
        提示
        <template slot="desc">
          <p>每个表由代码生成器生后的文件名都包括表名,直接在vs中搜索表名就可以看到所有生成相关表的文件</p>
          <p>所有自定义接口与业务实现都统一在Partial文件夹下实现</p>
          <p>表xxRepository.Instance用于调用仓储方法，如SellOrderRepository.Instance</p>
          <p>表xxService.Instance用于调用或编写业务，如SellOrderService.Instance，建议接口注入IxxService</p>
        </template>
      </Alert>

      <div :id="'i-'+index" class="doc-wrapper" v-for="(item,index) in items" :key="index">
        <div class="title">
          <h2>{{item.title}}</h2>
        </div>
        <div style=" box-shadow: 0 8px 12px #ebedf0;">
          <div class="d-content">
            <div class="code">
              <p v-for="(line,key) in item.content" :key="key" class="desc" v-html="line"></p>
            </div>
          </div>
          <Alert type="success" show-icon>{{item.tips}}</Alert>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  methods: {
    scrollIntoView(index) {
      let top = document.getElementById("i-" + index).offsetTop - 100;
      if (index == 0) {
        top = 0;
      }
      window.scrollTo(0, top);
      this.active = index;
    }
  },
  data() {
    return {
      active: 0,
      items: [
        {
          title: "调试",
          content: [
            `运行dev_run.bat，调试->附加到进程->进程里选择vol.webapi.exe`
          ],
          tips: ` 还没想好`,
          img: ""
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
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#b5cea8;">2</span>、<span style="color:#9cdcfe;">repository</span>.<span style="color:#9cdcfe;">FindAsIQueryable</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#b5cea8;">3</span>、<span style="color:#9cdcfe;">repository</span>.<span style="color:#9cdcfe;">DbContext</span>.<span style="color:#dcdcaa;">Set</span>&lt;<span style="color:#4ec9b0;">Sys_User</span>&gt;().<span style="color:#dcdcaa;">Find</span>()
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//repository.仅限在表xxx.Service.cs中使用</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#b5cea8;">5</span>、<span style="color:#9cdcfe;">SellOrderRepository</span>.<span style="color:#9cdcfe;">Instance</span>.<span style="color:#dcdcaa;">Find</span>()&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#b5cea8;">6</span>、<span style="color:#9cdcfe;">SellOrderListRepository</span>.<span style="color:#9cdcfe;">Instance</span>.<span style="color:#dcdcaa;">Find</span>()
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#b5cea8;">7</span>、<span style="color:#9cdcfe;">DBServerProvider</span>.<span style="color:#9cdcfe;">SqlDapper</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#b5cea8;">8</span>、<span style="color:#9cdcfe;">DBServerProvider</span>.<span style="color:#9cdcfe;">DbContext</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//以上方式都能访问数据库</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
<br />
</div>`
          ],
          tips: ` repository.DapperContext或DBServerProvider.SqlDapper可直接使用dapper，内部已封装好常用功能`
        },
        {
          title: "获取表依赖注入service实例",
          content: [
            `表名xxxService.Instance；如:Sys_UserService.Instance(仅限在同一个类库中使用)`
          ],
          tips: ` 还没想好`,
          img: ""
        },
        {
          title: "获取表依赖注入Repository实例",
          content: [
            `表名xxxRepository.Instance；如:Sys_UserRepository.Instance(仅限在同一个类库中使用)`
          ],
          tips: ` 还没想好`,
          img: ""
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
</div>`
          ],
          tips: ` 在表的业务类,xxxService.cs中文件直接可调用EF事务,或使用SellOrderRepository.Instance.DbContextBeginTransaction(()=> { })`
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
<br />`
          ],
          tips: ""
        },
        {
          title: "Memory/Redis对象",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
		<br />
		<div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//4、获取Memory/Redis对象</span>
		</div>
		<div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;base.CacheContext&nbsp;(仅限表xxx.Serivce.cs)</span>
		</div>
		<div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;例：SellOrderService.Instance.CacheContext</span>
		</div>
		<div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;AutofacContainerModule.GetService&lt;ICacheService&gt;()</span>
		</div>
		<div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;VOL.Core.Utilities.HttpContext.Current.RequestServices</span>
		</div>
		<div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;VOL.Core.Utilities.HttpContext.Current.RequestServices.GetService(typeof(ICacheService))</span>
		</div>
		<div>
			<br />
		</div>
	</div>
</div>`
          ],
          tips: `还没想好`,
          img: ""
        },
        {
          title: "读写分离与分库",
          content: [
            `<p style="line-height: 34px;">读写分离与分库，不同的业务实现细节区别很大，可以根据自己实际情况修改框架</p>
          <p style="line-height: 34px;">1、将所有数据库连接配置缓存到DBServerProvider.ConnectionPool中</p>
          <p style="line-height: 34px;">2、根据登陆用户操作所属数据库：EF修改DBServerProvider.GetDbContextConnection()，如果是读写分离，可以考虑增加ToList扩展方法</p>
          <p style="line-height: 34px;">3、使用Dapper读写分离或分库:DBServerProvider.GetSqlDapper('数据库连接key),key为ConnectionPool中的key'</p>
          <p style="line-height: 34px;">4、全自动操作读写分离或分库，可以考虑在model上使用Attribute(需要改代码生成器，将model对应数据库生成上去),使用EF或Dapper时，从model上获取Attribute里的数据库配置信息</p>`
          ],
          tips: `还没想好`,
          img: ""
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
</div>`
          ],
          tips: ` 必须指定要校验的字段`,
          img: ""
        },
        {
          title: "获取当前用户信息",
          content: [
            `
            UserContext.Current.xxx`
          ],
          tips: ` 还没想好`,
          img: ""
        },
        {
          title: "获取当前用户权限",
          content: [
            `<p>UserContext.Current.Permissions</p>
             <p>UserContext.Current.GetPermissions("菜单上配置的表名")</p>
             <p>UserContext.Current.GetPermissions(x => x.TableName.ToLower()=="xxx")</p>
             <p>获取更多用户信息：UserContext.Current.xxx</p>
             `
          ],
          tips: ` 还没想好`,
          img: ""
        },
        {
          title: "接口(控制器方法)添加权限过滤",
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
</div>`
          ],
          tips: ` 还没想好`,
          img: ""
        },
        {
          title: "手动获取HttpContext参数",
          content: [
            `<p>VOL.Core.Utilities.HttpContext.Current.Request<T>("参数名")</p>
             <p>VOL.Core.Utilities.HttpContext.Current.RequestString("参数名")</p>`
          ],
          tips: ` 还没想好`,
          img: ""
        },
        {
          title: "手动获取依赖注入的对象",
          content: [
            `<p>VOL.Core.Utilities.HttpContext.Current.GetService<T>("如：IxxService")</p>`
          ],
          tips: ` 还没想好`,
          img: ""
        },
        {
          title: "接口不验证是否登陆",
          content: [
            `
            在控制器的方法上加属性[AllowAnonymous]`
          ],
          tips: ` 还没想好`,
          img: ""
        },
        {
          title: "接口token永不过期",
          content: [
            `
            在控制器的方法上加属性[FixedToken]`
          ],
          tips: ` 还没想好`,
          img: ""
        },
        {
          title: "写入日志",
          content: [
            `
             VOL.Core.Services.Logger.Info()/Error()`
          ],
          tips: ` 还没想好`,
          img: ""
        },
        {
          title: "获取字典数据源",
          content: [
            ` <p> DictionaryManager.Dictionaries</p>
            <p> DictionaryManager.GetDictionary("字典编号")</p>`
          ],
          tips: ` 还没想好`,
          img: ""
        },
        {
          title: "SqlBulkInsert批量插入",
          content: [
            ` <p> DBServerProvider.SqlDapper.BulkInsert()</p>
              <p>sqlserver与mysql都可以使用</p>`
          ],
          tips: ` 还没想好`,
          img: ""
        },
        {
          title: "其他常用工具",
          content: [
            `<p>扩展方法：Vol.Core->Extensions</p><p>工具类：Vol.Core->Utilities </p>`
          ],
          tips: ` 还没想好`,
          img: ""
        },
        {
          title: "接口参数验证",
          content: [`参照菜单[可复用后台校验]`],
          tips: ` 可复用后台校验，一次性配置好参数，不再需要在方法中写if else判断参数合法性`,
          img: ""
        },

        {
          title: "后台基础代码扩展实现",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp; &nbsp; <span style="color:#6a9955;">//后台代码扩展实现，如果代码生成的增加改查，满足不了业务，请根据需要实现以下代码</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//下面代码以SellOrderService为例</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">public</span>&nbsp;<span style="color:#9cdcfe;">partial</span>&nbsp;<span style="color:#569cd6;">class</span>&nbsp;<span style="color:#4ec9b0;">SellOrderService</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">public</span>&nbsp;<span style="color:#9cdcfe;">string</span>&nbsp;<span style="color:#dcdcaa;">GetServiceDate</span>()
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#9cdcfe;">DateTime</span>.<span style="color:#9cdcfe;">Now</span>.<span style="color:#dcdcaa;">ToString</span>(<span style="color:#ce9178;">"yyyy-MM-dd&nbsp;HH:mm:sss"</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">public</span>&nbsp;<span style="color:#9cdcfe;">override</span>&nbsp;<span style="color:#dcdcaa;">PageGridData</span>&lt;<span style="color:#4ec9b0;">SellOrder</span>&gt;&nbsp;<span style="color:#dcdcaa;">GetPageData</span>(<span style="color:#9cdcfe;">PageDataOptions</span>&nbsp;<span style="color:#9cdcfe;">options</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//查询前可以自已设定查询表达式的条件</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">QueryRelativeExpression</span>&nbsp;=&nbsp;(<span style="color:#9cdcfe;">IQueryable</span>&lt;<span style="color:#9cdcfe;">SellOrder</span>&gt;&nbsp;<span style="color:#9cdcfe;">queryable</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//当前用户只能操作自己(与下级角色)创建的数据,如:查询、删除、修改等操作</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">IQueryable</span>&lt;<span style="color:#9cdcfe;">int</span>&gt;&nbsp;<span style="color:#9cdcfe;">userQuery</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">RoleContext</span>.<span style="color:#dcdcaa;">GetCurrentAllChildUser</span>();
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">queryable</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">queryable</span>.<span style="color:#dcdcaa;">Where</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">CreateID</span>&nbsp;==&nbsp;<span style="color:#9cdcfe;">UserContext</span>.<span style="color:#9cdcfe;">Current</span>.<span style="color:#9cdcfe;">UserId</span>&nbsp;||&nbsp;<span style="color:#9cdcfe;">userQuery</span>.<span style="color:#dcdcaa;">Contains</span>(<span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">CreateID</span>&nbsp;??&nbsp;<span style="color:#b5cea8;">0</span>));
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#9cdcfe;">queryable</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//此处是从前台提交的原生的查询条件，这里可以自己过滤</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">QueryRelativeList</span>&nbsp;=&nbsp;(<span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">SearchParameters</span>&gt;&nbsp;<span style="color:#9cdcfe;">parameters</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//指定多个字段进行排序</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">OrderByExpression</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;<span style="color:#569cd6;">new</span>&nbsp;<span style="color:#4ec9b0;">Dictionary</span>&lt;<span style="color:#4ec9b0;">object</span>,&nbsp;<span style="color:#4ec9b0;">QueryOrderBy</span>&gt;()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">CreateDate</span>,<span style="color:#9cdcfe;">QueryOrderBy</span>.<span style="color:#9cdcfe;">Desc</span>&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">SellNo</span>,<span style="color:#9cdcfe;">QueryOrderBy</span>.<span style="color:#9cdcfe;">Desc</span>}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//查询完成后，在返回页面前可对查询的数据进行操作</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">GetPageDataOnExecuted</span>&nbsp;=&nbsp;(<span style="color:#9cdcfe;">PageGridData</span>&lt;<span style="color:#9cdcfe;">SellOrder</span>&gt;&nbsp;<span style="color:#9cdcfe;">grid</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//可对查询的结果的数据操作</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">SellOrder</span>&gt;&nbsp;<span style="color:#9cdcfe;">sellOrders</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">grid</span>.<span style="color:#9cdcfe;">rows</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//查询table界面显示求和</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">SummaryExpress</span>&nbsp;=&nbsp;(<span style="color:#9cdcfe;">IQueryable</span>&lt;<span style="color:#9cdcfe;">SellOrder</span>&gt;&nbsp;<span style="color:#9cdcfe;">queryable</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#9cdcfe;">queryable</span>.<span style="color:#dcdcaa;">GroupBy</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;<span style="color:#b5cea8;">1</span>).<span style="color:#dcdcaa;">Select</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;<span style="color:#569cd6;">new</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//AvgPrice注意大小写和数据库字段大小写一样</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">Qty</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#dcdcaa;">Sum</span>(<span style="color:#9cdcfe;">o</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;<span style="color:#9cdcfe;">o</span>.<span style="color:#9cdcfe;">Qty</span>).<span style="color:#dcdcaa;">ToString</span>(<span style="color:#ce9178;">"f2"</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.<span style="color:#dcdcaa;">FirstOrDefault</span>();
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#9cdcfe;">base</span>.<span style="color:#dcdcaa;">GetPageData</span>(<span style="color:#9cdcfe;">options</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;summary&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;设置弹出框明细表的合计信息</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;/summary&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;typeparam&nbsp;name="detail"&gt;&lt;/typeparam&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;param&nbsp;name="queryeable"&gt;&lt;/param&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;returns&gt;&lt;/returns&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">protected</span>&nbsp;<span style="color:#9cdcfe;">override</span>&nbsp;<span style="color:#9cdcfe;">object</span>&nbsp;<span style="color:#dcdcaa;">GetDetailSummary</span>&lt;<span style="color:#4ec9b0;">detail</span>&gt;(<span style="color:#9cdcfe;">IQueryable</span>&lt;<span style="color:#9cdcfe;">detail</span>&gt;&nbsp;<span style="color:#9cdcfe;">queryeable</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;(<span style="color:#9cdcfe;">queryeable</span>&nbsp;<span style="color:#c586c0;">as</span>&nbsp;<span style="color:#4ec9b0;">IQueryable</span>&lt;<span style="color:#4ec9b0;">SellOrderList</span>&gt;).<span style="color:#dcdcaa;">GroupBy</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;<span style="color:#b5cea8;">1</span>).<span style="color:#dcdcaa;">Select</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;<span style="color:#569cd6;">new</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//Weight/Qty注意大小写和数据库字段大小写一样</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">Weight</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#dcdcaa;">Sum</span>(<span style="color:#9cdcfe;">o</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;<span style="color:#9cdcfe;">o</span>.<span style="color:#9cdcfe;">Weight</span>),
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">Qty</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#dcdcaa;">Sum</span>(<span style="color:#9cdcfe;">o</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;<span style="color:#9cdcfe;">o</span>.<span style="color:#9cdcfe;">Qty</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}).<span style="color:#dcdcaa;">FirstOrDefault</span>();
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;summary&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;查询业务代码编写</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;/summary&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;param&nbsp;name="pageData"&gt;&lt;/param&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;returns&gt;&lt;/returns&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">public</span>&nbsp;<span style="color:#9cdcfe;">override</span>&nbsp;<span style="color:#9cdcfe;">object</span>&nbsp;<span style="color:#dcdcaa;">GetDetailPage</span>(<span style="color:#9cdcfe;">PageDataOptions</span>&nbsp;<span style="color:#9cdcfe;">pageData</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#9cdcfe;">base</span>.<span style="color:#dcdcaa;">GetDetailPage</span>(<span style="color:#9cdcfe;">pageData</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;summary&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;新建</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;/summary&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;param&nbsp;name="saveDataModel"&gt;&lt;/param&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;returns&gt;&lt;/returns&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">public</span>&nbsp;<span style="color:#9cdcfe;">override</span>&nbsp;<span style="color:#9cdcfe;">WebResponseContent</span>&nbsp;<span style="color:#dcdcaa;">Add</span>(<span style="color:#9cdcfe;">SaveModel</span>&nbsp;<span style="color:#9cdcfe;">saveDataModel</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">WebResponseContent</span>&nbsp;<span style="color:#9cdcfe;">responseContent</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">WebResponseContent</span>.<span style="color:#9cdcfe;">Instance</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//此处saveModel是从前台提交的原生数据，可对数据进修改过滤</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">AddOnExecute</span>&nbsp;=&nbsp;(<span style="color:#9cdcfe;">SaveModel</span>&nbsp;<span style="color:#9cdcfe;">saveModel</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//如果返回false,后面代码不会再执行</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#9cdcfe;">responseContent</span>.<span style="color:#dcdcaa;">OK</span>();
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;在保存数据库前的操作，所有数据都验证通过了，这一步执行完就执行数据库保存</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">AddOnExecuting</span>&nbsp;=&nbsp;(<span style="color:#9cdcfe;">SellOrder</span>&nbsp;<span style="color:#9cdcfe;">order</span>,&nbsp;<span style="color:#9cdcfe;">object</span>&nbsp;<span style="color:#9cdcfe;">list</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">SellOrderList</span>&gt;&nbsp;<span style="color:#9cdcfe;">orderLists</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">list</span>&nbsp;<span style="color:#c586c0;">as</span>&nbsp;<span style="color:#4ec9b0;">List</span>&lt;<span style="color:#4ec9b0;">SellOrderList</span>&gt;;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">orderLists</span>&nbsp;==&nbsp;<span style="color:#569cd6;">null</span>&nbsp;||&nbsp;<span style="color:#9cdcfe;">orderLists</span>.<span style="color:#9cdcfe;">Count</span>&nbsp;==&nbsp;<span style="color:#b5cea8;">0</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<span style="color:#6a9955;">//如果没有界面上没有填写明细，则中断执行</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#9cdcfe;">responseContent</span>.<span style="color:#dcdcaa;">Error</span>(<span style="color:#ce9178;">"必须填写明细数据"</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">orderLists</span>.<span style="color:#dcdcaa;">Exists</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">Qty</span>&nbsp;&lt;=&nbsp;<span style="color:#b5cea8;">20</span>))
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#9cdcfe;">responseContent</span>.<span style="color:#dcdcaa;">Error</span>(<span style="color:#ce9178;">"明细数量必须大于20"</span>);
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#9cdcfe;">responseContent</span>.<span style="color:#dcdcaa;">OK</span>();
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//此方法中已开启了事务，如果在此方法中做其他数据库操作，请不要再开启事务</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;在保存数据库后的操作，此时已进行数据提交，但未提交事务，如果返回false，则会回滚提交</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">AddOnExecuted</span>&nbsp;=&nbsp;(<span style="color:#9cdcfe;">SellOrder</span>&nbsp;<span style="color:#9cdcfe;">order</span>,&nbsp;<span style="color:#9cdcfe;">object</span>&nbsp;<span style="color:#9cdcfe;">list</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">order</span>.<span style="color:#9cdcfe;">Qty</span>&nbsp;&lt;&nbsp;<span style="color:#b5cea8;">10</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;&nbsp;<span style="color:#6a9955;">//如果输入的销售数量&lt;10，会回滚数据库</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#9cdcfe;">responseContent</span>.<span style="color:#dcdcaa;">Error</span>(<span style="color:#ce9178;">"销售数量必须大于1000"</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#9cdcfe;">responseContent</span>.<span style="color:#dcdcaa;">OK</span>(<span style="color:#ce9178;">"已新建成功,台AddOnExecuted方法返回的消息"</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#9cdcfe;">base</span>.<span style="color:#dcdcaa;">Add</span>(<span style="color:#9cdcfe;">saveDataModel</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//此处saveModel是从前台提交的原生数据，可对数据进修改过滤</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">UpdateOnExecute</span>&nbsp;=&nbsp;(<span style="color:#9cdcfe;">SaveModel</span>&nbsp;<span style="color:#9cdcfe;">model</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//如果返回false,后面代码不会再执行</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">new</span>&nbsp;<span style="color:#4ec9b0;">WebResponseContent</span>().<span style="color:#dcdcaa;">OK</span>();
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//编辑方法保存数据库前处理</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">UpdateOnExecuting</span>&nbsp;=&nbsp;(<span style="color:#9cdcfe;">SellOrder</span>&nbsp;<span style="color:#9cdcfe;">order</span>,&nbsp;<span style="color:#9cdcfe;">object</span>&nbsp;<span style="color:#9cdcfe;">addList</span>,&nbsp;<span style="color:#9cdcfe;">object</span>&nbsp;<span style="color:#9cdcfe;">updateList</span>,&nbsp;<span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">object</span>&gt;&nbsp;<span style="color:#9cdcfe;">delKeys</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">order</span>.<span style="color:#9cdcfe;">TranNo</span>&nbsp;==&nbsp;<span style="color:#ce9178;">"2019000001810001"</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">new</span>&nbsp;<span style="color:#4ec9b0;">WebResponseContent</span>().<span style="color:#dcdcaa;">Error</span>(<span style="color:#ce9178;">"不能更新此["</span>&nbsp;+&nbsp;<span style="color:#9cdcfe;">order</span>.<span style="color:#9cdcfe;">TranNo</span>&nbsp;+&nbsp;<span style="color:#ce9178;">"]单号"</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//新增的明细</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">SellOrderList</span>&gt;&nbsp;<span style="color:#9cdcfe;">add</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">addList</span>&nbsp;<span style="color:#c586c0;">as</span>&nbsp;<span style="color:#4ec9b0;">List</span>&lt;<span style="color:#4ec9b0;">SellOrderList</span>&gt;;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//修改的明细</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">SellOrderList</span>&gt;&nbsp;<span style="color:#9cdcfe;">update</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">updateList</span>&nbsp;<span style="color:#c586c0;">as</span>&nbsp;<span style="color:#4ec9b0;">List</span>&lt;<span style="color:#4ec9b0;">SellOrderList</span>&gt;;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//删除的行的Id</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">var</span>&nbsp;<span style="color:#9cdcfe;">guids</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">delKeys</span>?.<span style="color:#dcdcaa;">Select</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;(<span style="color:#9cdcfe;">Guid</span>)<span style="color:#9cdcfe;">x</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">new</span>&nbsp;<span style="color:#4ec9b0;">WebResponseContent</span>().<span style="color:#dcdcaa;">OK</span>();
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//编辑方法保存数据库后处理</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//此方法中已开启了事务，如果在此方法中做其他数据库操作，请不要再开启事务</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;在保存数据库后的操作，此时已进行数据提交，但未提交事务，如果返回false，则会回滚提交</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">UpdateOnExecuted</span>&nbsp;=&nbsp;(<span style="color:#9cdcfe;">SellOrder</span>&nbsp;<span style="color:#9cdcfe;">order</span>,&nbsp;<span style="color:#9cdcfe;">object</span>&nbsp;<span style="color:#9cdcfe;">addList</span>,&nbsp;<span style="color:#9cdcfe;">object</span>&nbsp;<span style="color:#9cdcfe;">updateList</span>,&nbsp;<span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">object</span>&gt;&nbsp;<span style="color:#9cdcfe;">delKeys</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//新增的明细</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">SellOrderList</span>&gt;&nbsp;<span style="color:#9cdcfe;">add</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">addList</span>&nbsp;<span style="color:#c586c0;">as</span>&nbsp;<span style="color:#4ec9b0;">List</span>&lt;<span style="color:#4ec9b0;">SellOrderList</span>&gt;;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//修改的明细</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">SellOrderList</span>&gt;&nbsp;<span style="color:#9cdcfe;">update</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">updateList</span>&nbsp;<span style="color:#c586c0;">as</span>&nbsp;<span style="color:#4ec9b0;">List</span>&lt;<span style="color:#4ec9b0;">SellOrderList</span>&gt;;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//删除的行的主键</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">var</span>&nbsp;<span style="color:#9cdcfe;">guids</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">delKeys</span>?.<span style="color:#dcdcaa;">Select</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;(<span style="color:#9cdcfe;">Guid</span>)<span style="color:#9cdcfe;">x</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">new</span>&nbsp;<span style="color:#4ec9b0;">WebResponseContent</span>().<span style="color:#dcdcaa;">OK</span>();
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#9cdcfe;">base</span>.<span style="color:#dcdcaa;">Update</span>(<span style="color:#9cdcfe;">saveModel</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;summary&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;删除</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;/summary&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;param&nbsp;name="keys"&gt;删除的行的主键&lt;/param&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;param&nbsp;name="delList"&gt;删除时是否将明细也删除&lt;/param&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;returns&gt;&lt;/returns&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">public</span>&nbsp;<span style="color:#9cdcfe;">override</span>&nbsp;<span style="color:#9cdcfe;">WebResponseContent</span>&nbsp;<span style="color:#dcdcaa;">Del</span>(<span style="color:#9cdcfe;">object</span>[]&nbsp;<span style="color:#9cdcfe;">keys</span>,&nbsp;<span style="color:#9cdcfe;">bool</span>&nbsp;<span style="color:#9cdcfe;">delList</span>&nbsp;=&nbsp;<span style="color:#569cd6;">true</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//删除前处理</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//删除的行的主键</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">DelOnExecuting</span>&nbsp;=&nbsp;(<span style="color:#9cdcfe;">object</span>[]&nbsp;<span style="color:#9cdcfe;">_keys</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">new</span>&nbsp;<span style="color:#4ec9b0;">WebResponseContent</span>(<span style="color:#569cd6;">true</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//删除后处理</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//删除的行的主键</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">DelOnExecuted</span>&nbsp;=&nbsp;(<span style="color:#9cdcfe;">object</span>[]&nbsp;<span style="color:#9cdcfe;">_keys</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">new</span>&nbsp;<span style="color:#4ec9b0;">WebResponseContent</span>(<span style="color:#569cd6;">true</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#9cdcfe;">base</span>.<span style="color:#dcdcaa;">Del</span>(<span style="color:#9cdcfe;">keys</span>,&nbsp;<span style="color:#9cdcfe;">delList</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">public</span>&nbsp;<span style="color:#9cdcfe;">override</span>&nbsp;<span style="color:#9cdcfe;">WebResponseContent</span>&nbsp;<span style="color:#dcdcaa;">Audit</span>(<span style="color:#9cdcfe;">object</span>[]&nbsp;<span style="color:#9cdcfe;">keys</span>,&nbsp;<span style="color:#9cdcfe;">int</span>?&nbsp;<span style="color:#9cdcfe;">auditStatus</span>,&nbsp;<span style="color:#9cdcfe;">string</span>&nbsp;<span style="color:#9cdcfe;">auditReason</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//审核保存前处理</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">AuditOnExecuting</span>&nbsp;=&nbsp;(<span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">SellOrder</span>&gt;&nbsp;<span style="color:#9cdcfe;">order</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">new</span>&nbsp;<span style="color:#4ec9b0;">WebResponseContent</span>().<span style="color:#dcdcaa;">OK</span>();
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">AuditOnExecuted</span>&nbsp;=&nbsp;(<span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">SellOrder</span>&gt;&nbsp;<span style="color:#9cdcfe;">order</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">new</span>&nbsp;<span style="color:#4ec9b0;">WebResponseContent</span>().<span style="color:#dcdcaa;">OK</span>();
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#9cdcfe;">base</span>.<span style="color:#dcdcaa;">Audit</span>(<span style="color:#9cdcfe;">keys</span>,&nbsp;<span style="color:#9cdcfe;">auditStatus</span>,&nbsp;<span style="color:#9cdcfe;">auditReason</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;summary&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;导出</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;/summary&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;param&nbsp;name="pageData"&gt;&lt;/param&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;returns&gt;&lt;/returns&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">public</span>&nbsp;<span style="color:#9cdcfe;">override</span>&nbsp;<span style="color:#9cdcfe;">WebResponseContent</span>&nbsp;<span style="color:#dcdcaa;">Export</span>(<span style="color:#9cdcfe;">PageDataOptions</span>&nbsp;<span style="color:#9cdcfe;">pageData</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设置最大导出的数量</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">Limit</span>&nbsp;=&nbsp;<span style="color:#b5cea8;">1000</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//指定导出的字段(2020.05.07)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">ExportColumns</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;<span style="color:#569cd6;">new</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">SellNo</span>,&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">TranNo</span>,&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">CreateDate</span>&nbsp;};
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//查询要导出的数据后，在生成excel文件前处理</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//list导出的实体，ignore过滤不导出的字段</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">ExportOnExecuting</span>&nbsp;=&nbsp;(<span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">SellOrder</span>&gt;&nbsp;<span style="color:#9cdcfe;">list</span>,&nbsp;<span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">string</span>&gt;&nbsp;<span style="color:#9cdcfe;">ignore</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">new</span>&nbsp;<span style="color:#4ec9b0;">WebResponseContent</span>().<span style="color:#dcdcaa;">OK</span>();
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#9cdcfe;">base</span>.<span style="color:#dcdcaa;">Export</span>(<span style="color:#9cdcfe;">pageData</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;summary&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;下载模板(导入时弹出框中的下载模板)(2020.05.07)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;/summary&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;returns&gt;&lt;/returns&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">public</span>&nbsp;<span style="color:#9cdcfe;">override</span>&nbsp;<span style="color:#9cdcfe;">WebResponseContent</span>&nbsp;<span style="color:#dcdcaa;">DownLoadTemplate</span>()
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//指定导出模板的字段,如果不设置DownLoadTemplateColumns，默认导出查所有页面上能看到的列(2020.05.07)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">DownLoadTemplateColumns</span>&nbsp;=&nbsp;&nbsp;<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;<span style="color:#569cd6;">new</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">SellNo</span>,&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">TranNo</span>,<span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">Remark</span>,&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">CreateDate</span>&nbsp;};
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#9cdcfe;">base</span>.<span style="color:#dcdcaa;">DownLoadTemplate</span>();
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;summary&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;导入</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;/summary&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;param&nbsp;name="files"&gt;&lt;/param&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">///&nbsp;&lt;returns&gt;&lt;/returns&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">public</span>&nbsp;<span style="color:#9cdcfe;">override</span>&nbsp;<span style="color:#9cdcfe;">WebResponseContent</span>&nbsp;<span style="color:#dcdcaa;">Import</span>(<span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">IFormFile</span>&gt;&nbsp;<span style="color:#9cdcfe;">files</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//(2020.05.07)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设置导入的字段(如果指定了上面导出模板的字段，这里配置应该与上面DownLoadTemplate方法里配置一样)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//如果不设置导入的字段DownLoadTemplateColumns,默认显示所有界面上所有可以看到的字段</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">DownLoadTemplateColumns</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;<span style="color:#569cd6;">new</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">SellNo</span>,&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">TranNo</span>,&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">Remark</span>,&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">CreateDate</span>&nbsp;};
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//导入保存前处理(可以对list设置新的值)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">ImportOnExecuting</span>&nbsp;=&nbsp;(<span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">SellOrder</span>&gt;&nbsp;<span style="color:#9cdcfe;">list</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">new</span>&nbsp;<span style="color:#4ec9b0;">WebResponseContent</span>(<span style="color:#569cd6;">true</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//导入后处理</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">ImportOnExecuted</span>&nbsp;=&nbsp;(<span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">SellOrder</span>&gt;&nbsp;<span style="color:#9cdcfe;">list</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">new</span>&nbsp;<span style="color:#4ec9b0;">WebResponseContent</span>().<span style="color:#dcdcaa;">OK</span>();
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#9cdcfe;">base</span>.<span style="color:#dcdcaa;">Import</span>(<span style="color:#9cdcfe;">files</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div>
<span style="display:none;"></span><br />`
          ],
          tips: `后面扩展实现覆盖了常用业务，请根据需要实现对应方法`
        },
        {
          title: "绑定数据源及自定义sql数据源",
          content: [
            `<p>前端数据源绑定在菜单：系统->下拉框绑定设置中配置</p>
          <p>同时可以配置成自定义成sql语句,参照现有的配置</p>`
          ],
          tips: `前端数据源绑定及导出，都在菜单:下拉框绑定设置中配置好，代码生成器中选择数据源后，其他都全部由框架自动完成`,
          img: ""
        },
        {
          title: "根据用户绑定数据源",
          content: [
            `根据用户信息动态绑定前端数据源:实现后台：在DictionaryHandler.GetCustomDBSql方法中添加`
          ],
          tips: `某些情况可能用户只需要看到自己权限内的数据，可按此方法实现`,
          img: ""
        },
        {
          title: "视图操作",
          content: [
            `如果查询过于复杂或不想多表关联，请创建视图，再将视图生成代码`
          ],
          tips: `使用视图某些情况能减下操作的复杂性`,
          img: ""
        },
        {
          title: "视图新增/删除/修改",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//视图不能直接新增/删除/修改操作</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//以视图为例：VAppOrderWxPaid</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">public</span>&nbsp;<span style="color:#9cdcfe;">partial</span>&nbsp;<span style="color:#569cd6;">class</span>&nbsp;<span style="color:#4ec9b0;">VAppOrderWxPaidService</span>
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//VAppOrderWxPaid为视图</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//直接操作原表App_OrderWxPaid的编辑功能</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//saveModel为视图编辑字段信息，如果当前视图提交的saveModel字段与原表App_OrderWxPaid不一致，</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//可以直接修改视图提交saveModel里面的字段信息</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#9cdcfe;">App_OrderWxPaidService</span>.<span style="color:#9cdcfe;">Instance</span>.<span style="color:#dcdcaa;">Update</span>(<span style="color:#9cdcfe;">saveModel</span>);
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
</div>`
          ],
          tips: `使用视图某些情况能减下操作的复杂性`,
          img: ""
        }
      ]
    };
  }
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
      padding: 5px 10px;
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
</style>
