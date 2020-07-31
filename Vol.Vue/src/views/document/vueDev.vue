<template>
  <div class="doc">
    <div class="doc-left">
      <el-scrollbar style="height:100%;">
        <ul>
          <li class="n-item" v-for="(item,index) in items" :key="index">
            <a
              :class="{active:active==index}"
              :style="item.style"
              @click="scrollIntoView(index)"
            >{{index==0?'添加动态按钮':item.title}}</a>
          </li>
        </ul>
      </el-scrollbar>
    </div>
    <div class="doc-right">
      <div class="title">
        <h2>前端开发</h2>
      </div>
      <div class="top-content">
        <div>
          <p class="desc">此处是代码生成器生成的页面进行扩展，全部实现的是viewGrid组件扩展,参照viewGrid的api介绍</p>
        </div>
        <div>
          <p
            class="desc"
            style="font-size: 20px;"
          >更多具体扩展代码实现参照：extension->order->SellOrder.js或viewgird组件demo</p>
        </div>
      </div>
      <Alert type="success" show-icon>
        提示
        <template slot="desc">
          <p>每个表生成的vue页面，都会有一个与表名相同扩展的.js文件，如表名：SellOrder,扩展文件SellOrder.js</p>
          <p>所有业务代码在扩展js中编写，二次生成代码时，vue页面会被覆盖，扩展js则不会</p>
        </template>
      </Alert>
      <div style=" color: #4c403b;padding: 10px 0;">
        <h4 style="color:red;">下面都是对表App_Expert.js进行的扩展操作,将下面代码复制到App_Expert.js文件methods下即可直接运行</h4>
        <h4
          style="color:red;font-size: 20px; padding: 20px 0"
        >没有特别标明的，都是实现的App_Expert.js扩展,也适用其它所有代码生成的页面(菜单:Table+单表数据->审核、启用图片支持)</h4>
        <h3>所有图片点击即可查看大图</h3>
      </div>
      <div :id="'i-'+index" class="doc-wrapper" v-for="(item,index) in items" :key="index">
        <div class="title">
          <h2>{{item.title}}</h2>
        </div>
        <div style=" box-shadow: 0 8px 12px #ebedf0;">
          <div class="d-content">
            <div class="code">
              <p v-for="(line,key) in item.content" :key="key" class="desc" v-html="line"></p>
            </div>
            <div class="img" :class="{'full-code':!item.img}">
              <img :src="item.img" @click="()=>{base.previewImg(item.img)}" />
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
    },
  },
  data() {
    return {
      active: 0,
      items: [
        {
          title: "完整前端功能扩展",
          content: [
            `其他功能扩展，如：查询前后，保存前后等，参照sellOrder.js或viewGrid组件api`,
          ],
          tips: ` 前端功能扩展覆盖了常用操作，可通过扩展实现任意功能`,
          img: "",
        },
        {
          title: "查询界面动态添加按钮",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onInit</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//在第二个按钮后添加一个新的按钮</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">buttons</span>.<span style="color:#dcdcaa;">splice</span>(<span style="color:#b5cea8;">2</span>,&nbsp;<span style="color:#b5cea8;">0</span>,&nbsp;{&nbsp;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">name</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"测试按钮"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">icon</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'md-refresh'</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'info'</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onClick</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">function</span>&nbsp;()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$Message</span>.<span style="color:#dcdcaa;">info</span>(<span style="color:#ce9178;">"测试按钮"</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div>`,
          ],
          tips: ` this.buttons来源：ViewGrid.vue组件data->buttons属性`,
          img: "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/01.png",
        },
        {
          title: "弹出框界面动态按钮",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;<span style="color:#dcdcaa;">onInit</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//在弹出框的第一个按钮后面动态添加一个按钮</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">boxButtons</span>.<span style="color:#dcdcaa;">splice</span>(<span style="color:#b5cea8;">1</span>,&nbsp;<span style="color:#b5cea8;">0</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">name</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"button"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">icon</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'md-create'</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">value</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'Edit'</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'info'</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">hidden</span><span style="color:#9cdcfe;">:</span><span style="color:#569cd6;">false</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onClick</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">function</span>&nbsp;()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$message</span>.<span style="color:#dcdcaa;">error</span>(<span style="color:#ce9178;">"动态添加的button"</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;});
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">modelOpenBefore</span>(<span style="color:#9cdcfe;">row</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//弹出框打开时，将第1个按钮隐藏，第2个按钮禁用</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#dcdcaa;">$set</span>(<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">boxButtons</span>[<span style="color:#b5cea8;">0</span>],&nbsp;<span style="color:#ce9178;">'hidden'</span>,&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">currentAction</span>&nbsp;==&nbsp;<span style="color:#ce9178;">'Add'</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#dcdcaa;">$set</span>(<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">boxButtons</span>[<span style="color:#b5cea8;">1</span>],&nbsp;<span style="color:#ce9178;">'disabled'</span>,&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">currentAction</span>&nbsp;==&nbsp;<span style="color:#ce9178;">'Add'</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div>`,
          ],
          tips: `可根据this.currentAction判断当前是新建还是编辑来动态设置弹出框按钮`,
          img: "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/19.png",
        },
        {
          title: "设置按钮显示个数",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onInit</span>()&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设置查询页面显示6个按钮(默认3个)</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">maxBtnLength</span>&nbsp;=&nbsp;<span style="color:#b5cea8;">6</span>;
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;}
			</div>
		</div>
	</div>
	<div>
	</div>
</div>`,
          ],
          tips: ` this.maxBtnLength来源：ViewGrid.vue组件data->maxBtnLength属性`,
          img: "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/02.png",
        },
        {
          title: "点击按钮弹出框",
          content: [
            `<p>点击按钮,弹出自定义弹出框(参照SellOrder.js实现)</p>
              <p>实现思路：</p>
             <p>&nbsp; &nbsp; &nbsp; 1、定义一个弹出框的vue页面,此页面可以写任意代码</p>
             <p>&nbsp; &nbsp; &nbsp; 2、gridHeader引入此vue页面</p>
             <p>&nbsp; &nbsp; &nbsp; 3、点击按钮触发 this.$refs.gridHeader.model</p> `,
          ],
          tips: ` SellOrder.js点击自定的义按钮后，再弹弹出自定义的这个vue页面`,
          img: "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/06.png",
        },
        {
          title: "手动打开/关闭tabs",
          content: [
			`<div style='color:red;'>2020.08.01(需要更新文件：index.vue 、main.js标注了更新位置)</div>
			<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">/*打开tabs实际也是执行的路由跳转，需要打开的tabs必须是一个路由页面*/<span style="display:none;"></span></span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//手动打开tabs,</span> 
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">/*</span> 
	</div>
	<div>
		<span style="color:#6a9955;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*&nbsp;text打开的tab显示的名称</span> 
	</div>
	<div>
		<span style="color:#6a9955;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*&nbsp;path路由path</span> 
	</div>
	<div>
		<span style="color:#6a9955;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*&nbsp;query跳转的参数，可选，如果需要建议使用query</span> 
	</div>
	<div>
		<span style="color:#6a9955;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*/</span> 
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$tabs</span>.<span style="color:#dcdcaa;">open</span>({
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">text:</span>&nbsp;<span style="color:#ce9178;">"个人中心"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">path:</span>&nbsp;<span style="color:#ce9178;">"/userinfo"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">query:</span>&nbsp;{},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;});
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//手动关闭tabs,参数为路由path</span> 
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$tabs</span>.<span style="color:#dcdcaa;">close</span>(<span style="color:#ce9178;">"/userinfo"</span>);
	</div>
</div>`,
          ],
          tips: `还没想好`,
          img: "",
        },
        {
          title: "页面显示扩展",
          content: [
            `<p>如果页面需要更多信息,可实现自下定义扩展</p>
             <p>可以对查询页面，弹出框进行扩展显示更多信息</p>
             <p>参照App_Appointment.js实现(SellOrder.js实现更全面)</p></p> `,
          ],
          tips: ` App_Appointment.js中将自己写的vue页面引用到gridHeader/gridBody/gridFooter属性上即可实现功能`,
          img: "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/07.png",
        },
        {
          title: "手动设置排序列",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onInit</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">columns</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">row</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设置sort=true进行排序</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">row</span>.<span style="color:#9cdcfe;">field</span>&nbsp;==&nbsp;<span style="color:#ce9178;">"AuditStatus"</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">row</span>.<span style="color:#9cdcfe;">sort</span>&nbsp;=&nbsp;<span style="color:#569cd6;">true</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div>`,
          ],
          tips: ` this.columns数据源来源ViewGrid组件props.js属性(实际为App_Expert.Vue里columns)，sort参数配置见VolTable组件文档`,
          img: "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/03.png",
        },
        {
          title: "触发table表switch",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onInit</span>()&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">columns</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">row</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">row</span>.<span style="color:#9cdcfe;">field</span>&nbsp;==&nbsp;<span style="color:#ce9178;">"Enable"</span>)&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//强制设置为编辑列，类型为switch</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">row</span>.<span style="color:#9cdcfe;">edit</span>&nbsp;=&nbsp;{&nbsp;<span style="color:#9cdcfe;">type</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"switch"</span>,&nbsp;<span style="color:#9cdcfe;">keep</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">true</span>&nbsp;};
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//手动绑定数据源</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//如果设置key的字典编号，data设置空数组会自动绑定数据源</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">row</span>.<span style="color:#9cdcfe;">bind</span>&nbsp;=&nbsp;{&nbsp;<span style="color:#9cdcfe;">key</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"enable"</span>,&nbsp;<span style="color:#9cdcfe;">data</span><span style="color:#9cdcfe;">:</span>&nbsp;[{&nbsp;<span style="color:#9cdcfe;">key</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">0</span>,&nbsp;<span style="color:#9cdcfe;">value</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'禁用'</span>&nbsp;},&nbsp;{&nbsp;<span style="color:#9cdcfe;">key</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">1</span>,&nbsp;<span style="color:#9cdcfe;">value</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'启用'</span>&nbsp;}]&nbsp;};
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//绑定switch切换事件</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">let</span>&nbsp;<span style="color:#9cdcfe;">$this</span>&nbsp;=&nbsp;<span style="color:#569cd6;">this</span>;
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">row</span>.<span style="color:#dcdcaa;">onChange</span>&nbsp;=&nbsp;<span style="color:#569cd6;">function</span>&nbsp;(<span style="color:#9cdcfe;">options</span>,&nbsp;<span style="color:#9cdcfe;">row</span>,&nbsp;<span style="color:#9cdcfe;">_columns</span>,&nbsp;<span style="color:#9cdcfe;">status</span>)&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//在此处可以将数据提到后台处理</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">$this</span>.<span style="color:#9cdcfe;">$Message</span>.<span style="color:#dcdcaa;">info</span>(<span style="color:#9cdcfe;">status</span>&nbsp;?&nbsp;<span style="color:#ce9178;">"true"</span>&nbsp;:&nbsp;<span style="color:#ce9178;">"false"</span>);
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;}
			</div>
		</div>
	</div>
	<div>
	</div>
</div>`,
          ],
          tips: ` this.columns数据源来源ViewGrid组件props.js属性(实际为App_Expert.Vue里columns)，edit/bind/onChange参数配置见VolTable组件文档`,
          img: "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/04.png",
        },
        {
          title: "编辑查询界面table",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;<span style="color:#dcdcaa;">onInit</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//在指定的个人简介Resume列后面手动增加一列</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">let</span>&nbsp;<span style="color:#9cdcfe;">_index</span>&nbsp;=&nbsp;-<span style="color:#b5cea8;">1</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">for</span>&nbsp;(<span style="color:#569cd6;">let</span>&nbsp;<span style="color:#9cdcfe;">index</span>&nbsp;=&nbsp;<span style="color:#b5cea8;">0</span>;&nbsp;<span style="color:#9cdcfe;">index</span>&nbsp;&lt;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">columns</span>.<span style="color:#9cdcfe;">length</span>;&nbsp;<span style="color:#9cdcfe;">index</span>++)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">const</span>&nbsp;<span style="color:#9cdcfe;">row</span>&nbsp;=&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">columns</span>[<span style="color:#9cdcfe;">index</span>];
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">row</span>.<span style="color:#9cdcfe;">field</span>&nbsp;==&nbsp;<span style="color:#ce9178;">"Resume"</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//强制设置为编辑列，类型为text</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">row</span>.<span style="color:#9cdcfe;">edit</span>&nbsp;=&nbsp;{&nbsp;<span style="color:#9cdcfe;">type</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"text"</span>,&nbsp;<span style="color:#9cdcfe;">keep</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">true</span>&nbsp;};
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//获取个人简介列的位置</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">_index</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">index</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//参数配置见文档VolTable组件中columns的属性</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">let</span>&nbsp;<span style="color:#9cdcfe;">options</span>&nbsp;=&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'oper'</span>,&nbsp;<span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'操作'</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'text'</span>,&nbsp;<span style="color:#9cdcfe;">width</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">100</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//返回一个标签</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">formatter</span><span style="color:#9cdcfe;">:</span>&nbsp;(<span style="color:#9cdcfe;">row</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#ce9178;">'&lt;a&gt;保存&lt;/a&gt;'</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//触发事件,可以在此事件再打开一个弹出框等操作</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">click</span><span style="color:#9cdcfe;">:</span>&nbsp;(<span style="color:#9cdcfe;">row</span>,&nbsp;<span style="color:#9cdcfe;">column</span>,&nbsp;<span style="color:#9cdcfe;">event</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$Message</span>.<span style="color:#dcdcaa;">info</span>(<span style="color:#ce9178;">"保存的数据:"</span>&nbsp;+&nbsp;<span style="color:#9cdcfe;">row</span>.<span style="color:#9cdcfe;">Resume</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//刷新表</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#dcdcaa;">refresh</span>();
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//在获取个人简介列的位置列后添加一行操作列</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">columns</span>.<span style="color:#dcdcaa;">splice</span>(<span style="color:#9cdcfe;">_index</span>&nbsp;+&nbsp;<span style="color:#b5cea8;">1</span>,&nbsp;<span style="color:#b5cea8;">0</span>,&nbsp;<span style="color:#9cdcfe;">options</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div>`,
          ],
          tips: ` this.columns数据源来源ViewGrid组件props.js属性(实际为App_Expert.Vue里columns)，edit/bind/onChange参数配置见VolTable组件文档`,
          img: "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/13.png",
        },
        {
          title: "render渲染table对象",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		<span style="color:#dcdcaa;">onInit</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//此处在table最后一列动态渲染组件，也可以在this.columns.splice(index,1,{})指定位置渲染</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;render操作table组件，可以在单元格中添加任意组件，包括chart图表，具体render参数见vue官方文档</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">columns</span>.<span style="color:#dcdcaa;">push</span>({
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'操作'</span>,&nbsp;<span style="color:#9cdcfe;">width</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">165</span>,&nbsp;<span style="color:#dcdcaa;">render</span><span style="color:#9cdcfe;">:</span>&nbsp;(<span style="color:#9cdcfe;">h</span>,&nbsp;{&nbsp;<span style="color:#9cdcfe;">row</span>,&nbsp;<span style="color:#9cdcfe;">column</span>,&nbsp;<span style="color:#9cdcfe;">index</span>&nbsp;})&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#dcdcaa;">h</span>(
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">"div"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">style</span><span style="color:#9cdcfe;">:</span>&nbsp;{}&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">h</span>(
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">"Button"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">props</span><span style="color:#9cdcfe;">:</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">type</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"success"</span>,&nbsp;<span style="color:#9cdcfe;">size</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"small"</span>&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">style</span><span style="color:#9cdcfe;">:</span>&nbsp;{},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">on</span><span style="color:#9cdcfe;">:</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">click</span><span style="color:#9cdcfe;">:</span>&nbsp;(<span style="color:#9cdcfe;">e</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">e</span>.<span style="color:#dcdcaa;">stopPropagation</span>()
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//弹出框编辑</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#dcdcaa;">linkData</span>(<span style="color:#9cdcfe;">row</span>,&nbsp;<span style="color:#9cdcfe;">column</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">"编辑"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;),
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">h</span>(
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">"Button"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">props</span><span style="color:#9cdcfe;">:</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">type</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"info"</span>,&nbsp;<span style="color:#9cdcfe;">size</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"small"</span>&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">style</span><span style="color:#9cdcfe;">:</span>&nbsp;{&nbsp;<span style="color:#ce9178;">"margin-left"</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"10px"</span>&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">on</span><span style="color:#9cdcfe;">:</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">click</span><span style="color:#9cdcfe;">:</span>&nbsp;(<span style="color:#9cdcfe;">e</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">e</span>.<span style="color:#dcdcaa;">stopPropagation</span>()
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$Notice</span>.<span style="color:#dcdcaa;">open</span>({
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'当前操作的行'</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">desc</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#9cdcfe;">JSON</span>.<span style="color:#dcdcaa;">stringify</span>(<span style="color:#9cdcfe;">row</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;});
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">"审核"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;),
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">h</span>(
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">"Dropdown"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">props</span><span style="color:#9cdcfe;">:</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">style</span><span style="color:#9cdcfe;">:</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">"margin-left"</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"10px"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">on</span><span style="color:#9cdcfe;">:</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">'on-click'</span><span style="color:#9cdcfe;">:</span>&nbsp;(<span style="color:#9cdcfe;">name</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$Message</span>.<span style="color:#dcdcaa;">info</span>(<span style="color:#9cdcfe;">name</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[<span style="color:#dcdcaa;">h</span>(<span style="color:#ce9178;">'a'</span>,&nbsp;{},&nbsp;[<span style="color:#ce9178;">'更多'</span>,&nbsp;<span style="color:#dcdcaa;">h</span>(<span style="color:#ce9178;">'Icon'</span>,&nbsp;{&nbsp;<span style="color:#9cdcfe;">props</span><span style="color:#9cdcfe;">:</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">type</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'ios-arrow-down'</span>&nbsp;}&nbsp;})]),
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">h</span>(<span style="color:#ce9178;">'DropdownMenu'</span>,&nbsp;{&nbsp;<span style="color:#9cdcfe;">slot</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"list"</span>&nbsp;},&nbsp;[<span style="color:#dcdcaa;">h</span>(<span style="color:#ce9178;">'DropdownItem'</span>,&nbsp;{&nbsp;<span style="color:#9cdcfe;">props</span><span style="color:#9cdcfe;">:</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">name</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'明细'</span>&nbsp;}&nbsp;},&nbsp;<span style="color:#ce9178;">'明细'</span>),&nbsp;<span style="color:#dcdcaa;">h</span>(<span style="color:#ce9178;">'DropdownItem'</span>,&nbsp;{&nbsp;<span style="color:#9cdcfe;">props</span><span style="color:#9cdcfe;">:</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">name</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'签收'</span>&nbsp;}&nbsp;},&nbsp;<span style="color:#ce9178;">'签收'</span>),&nbsp;<span style="color:#dcdcaa;">h</span>(<span style="color:#ce9178;">'DropdownItem'</span>,&nbsp;{&nbsp;<span style="color:#9cdcfe;">props</span><span style="color:#9cdcfe;">:</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">name</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'bubu..'</span>&nbsp;}&nbsp;},&nbsp;<span style="color:#ce9178;">'bubu..'</span>)])]
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;]
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div>`,
          ],
          tips: ` render操作table组件，可以在单元格中添加任意组件，包括chart图表，具体render参数见vue官方文档`,
          img: "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/16.png",
        },

        {
          title: "render渲染form对象1",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;<span style="color:#dcdcaa;">onInit</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//在编辑框第三行数据后动态加添其他组件</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//render操作form组件，可以在表单中添加任意组件，包括chart图表，具体render参数见vue官方文档</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormOptions</span>.<span style="color:#dcdcaa;">splice</span>(<span style="color:#b5cea8;">2</span>,&nbsp;<span style="color:#b5cea8;">0</span>,&nbsp;[
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">colSize</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">12</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">render</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#9cdcfe;">h</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#dcdcaa;">h</span>(
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">"Alert"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">props</span><span style="color:#9cdcfe;">:</span>&nbsp;{},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">style</span><span style="color:#9cdcfe;">:</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">"margin-left"</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"100px"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">"background-color"</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"#f0faff"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">"margin-top"</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"-14px"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">on</span><span style="color:#9cdcfe;">:</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">click</span><span style="color:#9cdcfe;">:</span>&nbsp;()&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">"Alert&nbsp;Content"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">h</span>(
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">"div"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">props</span><span style="color:#9cdcfe;">:</span>&nbsp;{},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">slot</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"desc"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">style</span><span style="color:#9cdcfe;">:</span>&nbsp;{},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">on</span><span style="color:#9cdcfe;">:</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">click</span><span style="color:#9cdcfe;">:</span>&nbsp;()&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$Notice</span>.<span style="color:#dcdcaa;">open</span>({
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'Notification&nbsp;title'</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">desc</span><span style="color:#9cdcfe;">:</span>&nbsp;(<span style="color:#9cdcfe;">JSON</span>.<span style="color:#dcdcaa;">stringify</span>(<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormFileds</span>))
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[<span style="color:#ce9178;">"这里是Alert内容(由render动态渲染)"</span>]
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;]
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;])
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div>`,
          ],
          tips: `render操作form组件，可以在表单中添加任意组件，包括chart图表，具体render参数见vue官方文档`,
          img: "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/17.png",
        },
        {
          title: "render渲染form对象2",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;<span style="color:#dcdcaa;">onInit</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">let</span>&nbsp;<span style="color:#9cdcfe;">$this</span>&nbsp;=&nbsp;<span style="color:#569cd6;">this</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//将编辑框第2行第2列替换成自定义组件，</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//也可以写成this.editFormOptions[index].push({})进行追加组件</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//render操作form组件，可以在表单中添加任意组件，包括chart图表，具体render参数见vue官方文档</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormOptions</span>[<span style="color:#b5cea8;">1</span>][<span style="color:#b5cea8;">1</span>]&nbsp;=&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">colSize</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">6</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">render</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#9cdcfe;">h</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#dcdcaa;">h</span>(
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">"div"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">style</span><span style="color:#9cdcfe;">:</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">"margin-left"</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"28px"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">"line-height"</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"34px"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">h</span>(
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">"Button"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">props</span><span style="color:#9cdcfe;">:</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"primary"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">style</span><span style="color:#9cdcfe;">:</span>&nbsp;{},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">on</span><span style="color:#9cdcfe;">:</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">click</span><span style="color:#9cdcfe;">:</span>&nbsp;()&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$Message</span>.<span style="color:#dcdcaa;">info</span>(<span style="color:#9cdcfe;">JSON</span>.<span style="color:#dcdcaa;">stringify</span>(<span style="color:#9cdcfe;">$this</span>.<span style="color:#9cdcfe;">editFormFileds</span>));
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">"render(获取表单值)"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;),
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">h</span>(
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">"Button"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">props</span><span style="color:#9cdcfe;">:</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"error"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">style</span><span style="color:#9cdcfe;">:</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">"margin-left"</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"10px"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">on</span><span style="color:#9cdcfe;">:</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">click</span><span style="color:#9cdcfe;">:</span>&nbsp;()&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">$this</span>.<span style="color:#dcdcaa;">resetEdit</span>();
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$Message</span>.<span style="color:#dcdcaa;">info</span>(<span style="color:#ce9178;">'表单已重置'</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">"render(重置表单)"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;]
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div>`,
          ],
          tips: `render操作form组件，可以在表单中添加任意组件，包括chart图表，具体render参数见vue官方文档`,
          img: "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/18.png",
        },
        {
          title: "格式化table的数据",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;<span style="color:#dcdcaa;">onInit</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">columns</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">column</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//修改颜色</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">column</span>.<span style="color:#9cdcfe;">field</span>&nbsp;==&nbsp;<span style="color:#ce9178;">'Modifier'</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">column</span>.<span style="color:#dcdcaa;">formatter</span>&nbsp;=&nbsp;(<span style="color:#9cdcfe;">row</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#ce9178;">'&lt;span&nbsp;style="color:&nbsp;#2d8cf0;"&gt;'</span>&nbsp;+&nbsp;<span style="color:#9cdcfe;">row</span>.<span style="color:#9cdcfe;">Modifier</span>&nbsp;+&nbsp;<span style="color:#ce9178;">'&lt;/span&gt;'</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//格式化日期</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">column</span>.<span style="color:#9cdcfe;">field</span>&nbsp;==&nbsp;<span style="color:#ce9178;">'CreateDate'</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">column</span>.<span style="color:#dcdcaa;">formatter</span>&nbsp;=&nbsp;(<span style="color:#9cdcfe;">row</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;(<span style="color:#9cdcfe;">row</span>.<span style="color:#9cdcfe;">CreateDate</span>&nbsp;||&nbsp;<span style="color:#ce9178;">''</span>).<span style="color:#dcdcaa;">split</span>(<span style="color:#ce9178;">'&nbsp;'</span>)[<span style="color:#b5cea8;">0</span>].<span style="color:#dcdcaa;">replace</span>(<span style="color:#d16969;">/-/</span><span style="color:#569cd6;">g</span>,&nbsp;<span style="color:#ce9178;">'.'</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div>`,
          ],
          tips: ` this.columns数据源来源ViewGrid组件props.js属性(实际为App_Expert.Vue里columns)，formatter 方法参数配置见VolTable组件文档`,
          img: "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/08.png",
        },
        {
          title: "动态添加一列按钮",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onInit</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//在指定的City列后面手动增加一列</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">for</span>&nbsp;(<span style="color:#569cd6;">let</span>&nbsp;<span style="color:#9cdcfe;">index</span>&nbsp;=&nbsp;<span style="color:#b5cea8;">0</span>;&nbsp;<span style="color:#9cdcfe;">index</span>&nbsp;&lt;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">columns</span>.<span style="color:#9cdcfe;">length</span>;&nbsp;<span style="color:#9cdcfe;">index</span>++)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">const</span>&nbsp;<span style="color:#9cdcfe;">row</span>&nbsp;=&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">columns</span>[<span style="color:#9cdcfe;">index</span>];
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">row</span>.<span style="color:#9cdcfe;">field</span>&nbsp;!=&nbsp;<span style="color:#ce9178;">'City'</span>)&nbsp;{&nbsp;<span style="color:#c586c0;">continue</span>;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//参数配置见文档VolTable组件中columns的属性</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">let</span>&nbsp;<span style="color:#9cdcfe;">options</span>&nbsp;=&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'oper'</span>,&nbsp;<span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'操作'</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'text'</span>,&nbsp;<span style="color:#9cdcfe;">width</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">100</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//返回一个标签</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">formatter</span><span style="color:#9cdcfe;">:</span>&nbsp;(<span style="color:#9cdcfe;">row</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#ce9178;">'&lt;div&nbsp;style="cursor:pointer;'</span>+
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">'background:#f815a8;color:white;'</span>+
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">'width:81px;text-align:center;border-radius:4px;"&gt;'</span>+
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">'测试按钮&lt;/div&gt;'</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//触发事件,可以在此事件再打开一个弹出框等操作</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">click</span><span style="color:#9cdcfe;">:</span>&nbsp;(<span style="color:#9cdcfe;">row</span>,&nbsp;<span style="color:#9cdcfe;">column</span>,&nbsp;<span style="color:#9cdcfe;">event</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$Message</span>.<span style="color:#dcdcaa;">info</span>(<span style="color:#ce9178;">"触发事件"</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//在city(地区)列后添加一行</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">columns</span>.<span style="color:#dcdcaa;">splice</span>(<span style="color:#9cdcfe;">index</span>&nbsp;+&nbsp;<span style="color:#b5cea8;">1</span>,&nbsp;<span style="color:#b5cea8;">0</span>,&nbsp;<span style="color:#9cdcfe;">options</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div>`,
          ],
          tips: ` this.columns数据源来源ViewGrid组件props.js属性(实际为App_Expert.Vue里columns)，options参数配置见VolTable组件中columns属性`,
          img: "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/05.png",
        },
        {
          title: "动态隐藏table列",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onInit</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">columns</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">column</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//隐藏日期列</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">column</span>.<span style="color:#9cdcfe;">field</span>&nbsp;==&nbsp;<span style="color:#ce9178;">'CreateDate'</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">column</span>.<span style="color:#9cdcfe;">hidden</span>=<span style="color:#569cd6;">true</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//如果有明细表，需要隐藏列，操作方法同上</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//this.detailOptions.columns.forEach()</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div>`,
          ],
          tips: ` this.columns数据源来源ViewGrid组件props.js属性(实际为App_Expert.Vue里columns)，options参数配置见VolTable组件中columns属性`,
        },
        {
          title: "显示表格统计信息",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onInit</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设置主表合计</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">summary</span>&nbsp;=&nbsp;<span style="color:#569cd6;">true</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//如果有明细表,设置明细表合计</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">detailOptions</span>.<span style="color:#9cdcfe;">summary</span>&nbsp;=&nbsp;<span style="color:#569cd6;">true</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onInited</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设置主表求字段，后台需要实现SummaryExpress方法</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">columns</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">field</span>&nbsp;==&nbsp;<span style="color:#ce9178;">'Qty'</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">summary</span>&nbsp;=&nbsp;<span style="color:#569cd6;">true</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//如果有明细表,遍历方法同上</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;this.detailOptions.columns</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div><p>
	<br />
</p>
<p>
	<br />
</p>
<p>
	//后台在xxxService.cs中重写查询方法，并实现要统计的字段&nbsp; &nbsp; &nbsp;&nbsp;
</p>
<p>
	&nbsp; public override PageGridData&lt;SellOrder&gt; GetPageData(PageDataOptions options)
</p>
&nbsp; &nbsp; &nbsp; &nbsp; {<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; //查询table界面显示求和<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; SummaryExpress = (IQueryable&lt;SellOrder&gt; queryable) =&gt;<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return queryable.GroupBy(x =&gt; 1).Select(x =&gt; new<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; //AvgPrice注意大小写和数据库字段大小写一样<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Qty = x.Sum(o =&gt; o.Qty).ToString("f2")<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; })<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .FirstOrDefault();<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; };<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return base.GetPageData(options);<br />
&nbsp; &nbsp; &nbsp; &nbsp; }<br />
<br />`,
          ],
          tips: `在前端表的扩展js中,onInit与onInited初始化要统计的字段，后台在xxxService.cs中重写查询方法，并实现要统计的字段即可完成表格统计，无需其他操作`,
          img: "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/09.png",
        },
        {
          title: "级联操作(1)",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">/*</span>
	</div>
	<div>
		<span style="color:#6a9955;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;详细配置数据源及格式见Iview组件</span>
	</div>
	<div>
		<span style="color:#6a9955;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;https://iviewui.com/components/cascader</span>
	</div>
	<div>
		<span style="color:#6a9955;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*/</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onInit</span>()&nbsp;{
	</div>
		<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//级联操作基于Iview组件cascader(数据源的格式见iview原生组件demo配置)span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设置表单的默认值,没有值就设置为空数组(必须)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//在数据库中保存后的多个值实际是以逗号的字符串</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormFileds</span>.<span style="color:#9cdcfe;">ExpertName</span>&nbsp;=&nbsp;[];&nbsp;<span style="color:#6a9955;">//["北京","天坛"]</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设置数据源(必须)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormOptions</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">item</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">field</span>&nbsp;==&nbsp;<span style="color:#ce9178;">'ExpertName'</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设置为级联类型(必须)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">type</span>&nbsp;=&nbsp;<span style="color:#ce9178;">"cascader"</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//初始数据源对象,格式见iview原生cascader组件(必须)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//注意：value与label不同时，保存后存储的就是value值，在table上显示的就是value</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//解决办法：需要在table(this.columns)中设置formatter处理(建议value与lable相同)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">data</span>&nbsp;=&nbsp;[{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">value</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"北京"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">label</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"北京"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">children</span><span style="color:#9cdcfe;">:</span>&nbsp;[
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">value</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"天坛"</span>,&nbsp;<span style="color:#9cdcfe;">label</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"天坛"</span>&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">value</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"王府井"</span>,&nbsp;<span style="color:#9cdcfe;">label</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"王府井"</span>&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;]
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}];
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//格式化显示(非必须)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;item.formatter=(labels,&nbsp;selectedData)=&gt;{</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;const&nbsp;index&nbsp;=&nbsp;labels.length&nbsp;-&nbsp;1;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;const&nbsp;data&nbsp;=&nbsp;selectedData[index]&nbsp;||&nbsp;false;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;if&nbsp;(data&nbsp;&amp;&amp;&nbsp;data.label)&nbsp;{</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;labels[index]&nbsp;+&nbsp;'&nbsp;-&nbsp;'&nbsp;+&nbsp;data.label+"888";</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;}</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;return&nbsp;labels[index];</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;}</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div>`,
          ],
          tips: `级联操作基于Iview组件cascader(数据源的格式见iview原生组件demo配置),数据量少的情况下建议直接把数据源加载出来绑定，数据量过多时使用懒加载`,
          img: "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/14.png",
        },
        {
          title: "级联操作(2)",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;<span style="color:#6a9955;">//如果代码报错缺少convertTree方法，请确认是否获取了utilities/common.js文件</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onInit</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;与上面级联操作(1)配置一样，</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//区别在于children配置直接用convertTree转换</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormFileds</span>.<span style="color:#9cdcfe;">ExpertName</span>&nbsp;=&nbsp;[];
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设置数据源(必须)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormOptions</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">item</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">field</span>&nbsp;==&nbsp;<span style="color:#ce9178;">'ExpertName'</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设置为级联类型(必须)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">type</span>&nbsp;=&nbsp;<span style="color:#ce9178;">"cascader"</span>;
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//初始化一个空数据源;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">data</span>&nbsp;=&nbsp;[];
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//数据源，可以从后台加载出来</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//注意:数据源中必须有id与parentId字段</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">let</span>&nbsp;<span style="color:#9cdcfe;">source</span>&nbsp;=&nbsp;[
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">name</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'tree1'</span>,&nbsp;<span style="color:#9cdcfe;">id</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">1</span>,&nbsp;<span style="color:#9cdcfe;">parentId</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">0</span>&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">name</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'tree2'</span>,&nbsp;<span style="color:#9cdcfe;">id</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">2</span>,&nbsp;<span style="color:#9cdcfe;">parentId</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">0</span>&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">name</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'tree3'</span>,&nbsp;<span style="color:#9cdcfe;">id</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">3</span>,&nbsp;<span style="color:#9cdcfe;">parentId</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">1</span>&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">name</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'tree4'</span>,&nbsp;<span style="color:#9cdcfe;">id</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">4</span>,&nbsp;<span style="color:#9cdcfe;">parentId</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">1</span>&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">name</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'tree5'</span>,&nbsp;<span style="color:#9cdcfe;">id</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">5</span>,&nbsp;<span style="color:#9cdcfe;">parentId</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">7</span>&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">name</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'tree6'</span>,&nbsp;<span style="color:#9cdcfe;">id</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">6</span>,&nbsp;<span style="color:#9cdcfe;">parentId</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">7</span>,&nbsp;<span style="color:#9cdcfe;">hidden</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">true</span>&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">name</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'tree8'</span>,&nbsp;<span style="color:#9cdcfe;">id</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">8</span>,&nbsp;<span style="color:#9cdcfe;">parentId</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">3</span>&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;]
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//从后台接口返回数据源</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//this.http.post("xxx").then(source&nbsp;=&gt;&nbsp;{</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//将数据源转换成cascader的格式</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">data</span>&nbsp;=&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">base</span>.<span style="color:#dcdcaa;">convertTree</span>(<span style="color:#9cdcfe;">source</span>,&nbsp;(<span style="color:#9cdcfe;">node</span>,&nbsp;<span style="color:#9cdcfe;">data</span>,&nbsp;<span style="color:#9cdcfe;">isRoot</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设定其他字段属性</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//node当前遍历的节点：{&nbsp;name:&nbsp;'tree1',&nbsp;id:&nbsp;1,&nbsp;parentId:&nbsp;0&nbsp;}</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//data整个数据源</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//isRoot是否为根节点，一级节点</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">console</span>.<span style="color:#dcdcaa;">log</span>(<span style="color:#9cdcfe;">node</span>.<span style="color:#9cdcfe;">name</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//手动指定cascader需要的字段</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">node</span>.<span style="color:#9cdcfe;">value</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">node</span>.<span style="color:#9cdcfe;">name</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">node</span>.<span style="color:#9cdcfe;">label</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">node</span>.<span style="color:#9cdcfe;">name</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;});
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;})</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
</div>`,
          ],
          tips: `从后台加载数据后，不用自己设置children，直接用this.base.convertTree()转换`,
          img: "",
        },
        {
          title: "级联(后台加载数据源)",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;&nbsp;<span style="color:#dcdcaa;">onInit</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设置表单的默认值,没有值就设置为空数组(必须)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//在数据库中保存后的多个值实际是以逗号的字符串</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormFileds</span>.<span style="color:#9cdcfe;">ExpertName</span>&nbsp;=&nbsp;[];&nbsp;<span style="color:#6a9955;">//["北京","天坛"]</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设置数据源(必须)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormOptions</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">item</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">field</span>&nbsp;==&nbsp;<span style="color:#ce9178;">'ExpertName'</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设置为级联类型(必须)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">type</span>&nbsp;=&nbsp;<span style="color:#ce9178;">"cascader"</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//初始一个空的数据源(必须)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">data</span>&nbsp;=&nbsp;[];
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//从后台接口返回数据源,格式见iview组件result(建议在modelOpenBefore方法中设置数据源)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">http</span>.<span style="color:#dcdcaa;">post</span>(<span style="color:#ce9178;">"xxx"</span>).<span style="color:#dcdcaa;">then</span>(<span style="color:#9cdcfe;">result</span><span style="color:#569cd6;">=&gt;</span>{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">data</span>.<span style="color:#dcdcaa;">push</span>(...<span style="color:#9cdcfe;">result</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//result数据格式或见iview组件cascader数据源配置格式</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;[{</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;value:&nbsp;"北京",</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;label:&nbsp;"北京",</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;children:&nbsp;[</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;value:&nbsp;"天坛",&nbsp;label:&nbsp;"天坛"&nbsp;},</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;value:&nbsp;"王府井",&nbsp;label:&nbsp;"王府井"&nbsp;}</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;]</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;}];</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">modelOpenBefore</span>(){<span style="color:#6a9955;">//打开弹出框时</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//如果考虑性能，建议在此处调用&nbsp;this.http.post设置级联数据源</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
</div>`,
          ],
          tips: `级联操作基于Iview组件cascader(数据源的格式见iview原生组件demo配置),数据量少的情况下建议直接把数据源加载出来绑定，数据量过多时使用懒加载`,
          img: "",
        },
        {
          title: "级联赖(动态)加载",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;<span style="color:#6a9955;">/*</span>
	</div>
	<div>
		<span style="color:#6a9955;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;详细配置数据源及格式见Iview组件</span>
	</div>
	<div>
		<span style="color:#6a9955;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;https://iviewui.com/components/cascader</span>
	</div>
	<div>
		<span style="color:#6a9955;">&nbsp;&nbsp;&nbsp;*/</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onInit</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormFileds</span>.<span style="color:#9cdcfe;">ExpertName</span>&nbsp;=&nbsp;[];&nbsp;<span style="color:#6a9955;">//["北京","天坛"]</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设置数据源(必须)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormOptions</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">option</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">option</span>.<span style="color:#9cdcfe;">field</span>&nbsp;==&nbsp;<span style="color:#ce9178;">'ExpertName'</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设置为级联类型(必须)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">option</span>.<span style="color:#9cdcfe;">type</span>&nbsp;=&nbsp;<span style="color:#ce9178;">"cascader"</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//初始数据源对象,格式见iview原生cascader组件(必须)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//懒加载必须初始化一级选择项(可以从后台加载出来data一级选项)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">option</span>.<span style="color:#9cdcfe;">data</span>&nbsp;=&nbsp;[{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">value</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"北京"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">loading</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">false</span>,&nbsp;<span style="color:#6a9955;">//懒加载此属性必须设置</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">label</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"北京"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">children</span><span style="color:#9cdcfe;">:</span>&nbsp;[]
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}];
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//触发懒加载</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">option</span>.<span style="color:#dcdcaa;">loadData</span>&nbsp;=&nbsp;(<span style="color:#9cdcfe;">item</span>,&nbsp;<span style="color:#9cdcfe;">callback</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">children</span>.<span style="color:#9cdcfe;">length</span>&nbsp;&gt;&nbsp;<span style="color:#b5cea8;">0</span>)&nbsp;<span style="color:#c586c0;">return</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">loading</span>&nbsp;=&nbsp;<span style="color:#569cd6;">true</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">http</span>.<span style="color:#dcdcaa;">post</span>(<span style="color:#ce9178;">"xxx"</span>).<span style="color:#dcdcaa;">then</span>(<span style="color:#9cdcfe;">children</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">loading</span>&nbsp;=&nbsp;<span style="color:#569cd6;">false</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">children</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">children</span>;
  </div>
  	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;callback();
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//children格式或参照iview组件cascader动态加载选项的配置</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;[{</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;value:&nbsp;'hangzhou',</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;label:&nbsp;'杭州',</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;children:&nbsp;[{</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;value:&nbsp;'xihu',</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;label:&nbsp;'西湖',</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;code:&nbsp;1000</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;}]</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;}]</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div><div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;<span style="color:#6a9955;">/*</span>
	</div>
	<div>
		<span style="color:#6a9955;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;详细配置数据源及格式见Iview组件</span>
	</div>
	<div>
		<span style="color:#6a9955;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;https://iviewui.com/components/cascader</span>
	</div>
	<div>
		<span style="color:#6a9955;">&nbsp;&nbsp;&nbsp;*/</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onInit</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormFileds</span>.<span style="color:#9cdcfe;">ExpertName</span>&nbsp;=&nbsp;[];&nbsp;<span style="color:#6a9955;">//["北京","天坛"]</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设置数据源(必须)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormOptions</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">option</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">option</span>.<span style="color:#9cdcfe;">field</span>&nbsp;==&nbsp;<span style="color:#ce9178;">'ExpertName'</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设置为级联类型(必须)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">option</span>.<span style="color:#9cdcfe;">type</span>&nbsp;=&nbsp;<span style="color:#ce9178;">"cascader"</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//初始数据源对象,格式见iview原生cascader组件(必须)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//懒加载必须初始化一级选择项(可以从后台加载出来data一级选项)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">option</span>.<span style="color:#9cdcfe;">data</span>&nbsp;=&nbsp;[{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">value</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"北京"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">loading</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">false</span>,&nbsp;<span style="color:#6a9955;">//懒加载此属性必须设置</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">label</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"北京"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">children</span><span style="color:#9cdcfe;">:</span>&nbsp;[]
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}];
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//触发懒加载</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">option</span>.<span style="color:#dcdcaa;">loadData</span>&nbsp;=&nbsp;(<span style="color:#9cdcfe;">item</span>,&nbsp;<span style="color:#9cdcfe;">callback</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">children</span>.<span style="color:#9cdcfe;">length</span>&nbsp;&gt;&nbsp;<span style="color:#b5cea8;">0</span>)&nbsp;<span style="color:#c586c0;">return</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">loading</span>&nbsp;=&nbsp;<span style="color:#569cd6;">true</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">http</span>.<span style="color:#dcdcaa;">post</span>(<span style="color:#ce9178;">"xxx"</span>).<span style="color:#dcdcaa;">then</span>(<span style="color:#9cdcfe;">children</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">loading</span>&nbsp;=&nbsp;<span style="color:#569cd6;">false</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">children</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">children</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//children格式或参照iview组件cascader动态加载选项的配置</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;[{</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;value:&nbsp;'hangzhou',</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;label:&nbsp;'杭州',</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;children:&nbsp;[{</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;value:&nbsp;'xihu',</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;label:&nbsp;'西湖',</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;code:&nbsp;1000</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;}]</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;}]</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div>`,
          ],
          tips: `级联操作基于Iview组件cascader(数据源的格式见iview原生组件demo配置),数据量少的情况下建议直接把数据源加载出来绑定，数据量过多时使用懒加载`,
          img: "",
        },
        {
          title: "select手动触发级联",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		<span style="color:#dcdcaa;">&nbsp; &nbsp; getOption</span>(<span style="color:#9cdcfe;">field</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">let</span>&nbsp;<span style="color:#9cdcfe;">option</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormOptions</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">item</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">field</span>&nbsp;==&nbsp;<span style="color:#9cdcfe;">field</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">option</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">item</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#9cdcfe;">option</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onInit</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">/*从editFormOptions获取代码生成的配置参数*/</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">/*getOption实际是获取volform的配置信息，详情配置看volform组件*/</span>
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//获取select【地区】配置</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">let</span>&nbsp;<span style="color:#9cdcfe;">select1</span>&nbsp;=&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#dcdcaa;">getOption</span>(<span style="color:#ce9178;">"City"</span>);
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//获取select【是否启用】配置</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">let</span>&nbsp;<span style="color:#9cdcfe;">select2</span>&nbsp;=&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#dcdcaa;">getOption</span>(<span style="color:#ce9178;">"Enable"</span>);
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//通过select1选择后，给select2重新绑定数据源与textare重新设置值</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">let</span>&nbsp;<span style="color:#9cdcfe;">source</span>&nbsp;=&nbsp;[];
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">select1</span>.<span style="color:#dcdcaa;">onChange</span>&nbsp;=&nbsp;(<span style="color:#9cdcfe;">val</span>,&nbsp;<span style="color:#9cdcfe;">option</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//通过http从后台加载数据源</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//this.http.post("/api/Sys_Dictionary/GetVueDictionary",&nbsp;{},&nbsp;true).then(source&nbsp;=&gt;&nbsp;{</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">source</span>&nbsp;=&nbsp;[
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">key</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"1"</span>,&nbsp;<span style="color:#9cdcfe;">value</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"text1"</span>&nbsp;+&nbsp;~(<span style="color:#9cdcfe;">Math</span>.<span style="color:#dcdcaa;">random</span>()&nbsp;*&nbsp;<span style="color:#b5cea8;">100</span>)&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">key</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"2"</span>,&nbsp;<span style="color:#9cdcfe;">value</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"text2"</span>&nbsp;+&nbsp;~(<span style="color:#9cdcfe;">Math</span>.<span style="color:#dcdcaa;">random</span>()&nbsp;*&nbsp;<span style="color:#b5cea8;">100</span>)&nbsp;}];
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//重新绑定数据源,select2.data.splice(0)会刷新所有相关的数据源(不建议使用)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">select2</span>.<span style="color:#9cdcfe;">data</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">source</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//给select2标签设置默认选中值</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">/*通过http重新绑定数据源,必须执行此操作，否则视图不会更新*/</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormFileds</span>[<span style="color:#9cdcfe;">select2</span>.<span style="color:#9cdcfe;">field</span>]&nbsp;=&nbsp;<span style="color:#9cdcfe;">source</span>.<span style="color:#9cdcfe;">length</span>&nbsp;&gt;&nbsp;<span style="color:#b5cea8;">0</span>&nbsp;?&nbsp;<span style="color:#9cdcfe;">source</span>[<span style="color:#b5cea8;">0</span>].<span style="color:#9cdcfe;">key</span>&nbsp;:&nbsp;<span style="color:#ce9178;">""</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;})</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div>`,
          ],
          tips: `select选择后给字段设置值或数据源，实现手动级联操作`,
          img: "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/15.png",
        },
        {
          title: "数组对象转换为tree",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;<span style="color:#6a9955;">//要转换的数据源</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//注意:数据源中必须有id与parentId字段</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//*树形tree需要注意Id与parentId循环依赖的问题&nbsp;*/</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">let</span>&nbsp;<span style="color:#9cdcfe;">source</span>&nbsp;=&nbsp;[
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">name</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'tree1'</span>,&nbsp;<span style="color:#9cdcfe;">id</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">1</span>,&nbsp;<span style="color:#9cdcfe;">parentId</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">0</span>&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">name</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'tree2'</span>,&nbsp;<span style="color:#9cdcfe;">id</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">2</span>,&nbsp;<span style="color:#9cdcfe;">parentId</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">0</span>&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">name</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'tree3'</span>,&nbsp;<span style="color:#9cdcfe;">id</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">3</span>,&nbsp;<span style="color:#9cdcfe;">parentId</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">1</span>&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">name</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'tree4'</span>,&nbsp;<span style="color:#9cdcfe;">id</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">4</span>,&nbsp;<span style="color:#9cdcfe;">parentId</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">1</span>&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">name</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'tree5'</span>,&nbsp;<span style="color:#9cdcfe;">id</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">5</span>,&nbsp;<span style="color:#9cdcfe;">parentId</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">7</span>&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">name</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'tree6'</span>,&nbsp;<span style="color:#9cdcfe;">id</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">6</span>,&nbsp;<span style="color:#9cdcfe;">parentId</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">7</span>,&nbsp;<span style="color:#9cdcfe;">hidden</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">true</span>&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">name</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'tree8'</span>,&nbsp;<span style="color:#9cdcfe;">id</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">8</span>,&nbsp;<span style="color:#9cdcfe;">parentId</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">3</span>&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;]
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//使用&nbsp;this.base.convertTree方法进行转换,</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//1、第一个参数为没有转换过的数据源</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//2、第二个参数callback：每次生成一新的节点的时回调的方法</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">let</span>&nbsp;<span style="color:#9cdcfe;">result</span>&nbsp;=&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">base</span>.<span style="color:#dcdcaa;">convertTree</span>(<span style="color:#9cdcfe;">source</span>,&nbsp;(<span style="color:#9cdcfe;">node</span>,&nbsp;<span style="color:#9cdcfe;">data</span>,&nbsp;<span style="color:#9cdcfe;">isRoot</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设定其他字段属性</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//node当前遍历的节点：{&nbsp;name:&nbsp;'tree1',&nbsp;id:&nbsp;1,&nbsp;parentId:&nbsp;0&nbsp;}</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//data整个数据源</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//isRoot是否为根节点，一级节点</span>
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//添加一些别的属性</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">node</span>.<span style="color:#9cdcfe;">value</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">node</span>.<span style="color:#9cdcfe;">name</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">node</span>.<span style="color:#9cdcfe;">label</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">node</span>.<span style="color:#9cdcfe;">name</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">node</span>.<span style="color:#9cdcfe;">text</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">node</span>.<span style="color:#9cdcfe;">name</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;});
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">console</span>.<span style="color:#dcdcaa;">log</span>(<span style="color:#9cdcfe;">JSON</span>.<span style="color:#dcdcaa;">stringify</span>(<span style="color:#9cdcfe;">result</span>))
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//转换后的格式</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;[{</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"name":&nbsp;"tree1",&nbsp;"id":&nbsp;1,&nbsp;"parentId":&nbsp;0,&nbsp;"isRoot":&nbsp;true,</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"lable":&nbsp;"tree1",&nbsp;"text":&nbsp;"tree1",</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"children":&nbsp;[</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"name":&nbsp;"tree3",&nbsp;"id":&nbsp;3,&nbsp;"parentId":&nbsp;1,&nbsp;"lable":&nbsp;"tree3",</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"children":&nbsp;[</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;"name":&nbsp;"tree8",&nbsp;"id":&nbsp;8,&nbsp;"parentId":&nbsp;3,&nbsp;"lable":&nbsp;"tree8"&nbsp;}</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;]</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"name":&nbsp;"tree4",&nbsp;"id":&nbsp;4,&nbsp;"parentId":&nbsp;1,&nbsp;"lable":&nbsp;"tree4",&nbsp;"text":&nbsp;"tree4"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;]</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;}]</span>
	</div>
</div>`,
          ],
          tips: `使用this.base.convertTree转换成tree结构，避免重复写递归生成tree的代码`,
          img: "",
        },
        {
          title: "http请求",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//第一个参数:url</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//第二个参数：请求的参数</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//第三个参数：是否显示发起请求时的提示信息(默认否)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">http</span>.<span style="color:#dcdcaa;">post</span>(<span style="color:#ce9178;">"url"</span>,{},<span style="color:#569cd6;">true</span>).<span style="color:#dcdcaa;">then</span>(<span style="color:#9cdcfe;">reslut</span><span style="color:#569cd6;">=&gt;</span>{})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">http</span>.<span style="color:#dcdcaa;">post</span>(<span style="color:#ce9178;">"url"</span>,{},<span style="color:#ce9178;">"自定义提示信息"</span>).<span style="color:#dcdcaa;">then</span>(<span style="color:#9cdcfe;">reslut</span><span style="color:#569cd6;">=&gt;</span>{})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//this.http.get同上</span>
	</div>
</div>`,
          ],
          tips: `无`,
          img: "",
        },
        {
          title: "编辑多图/文件上传",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;<span style="color:#dcdcaa;">onInit</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//动态设置弹出框的高度</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">boxOptions</span>.<span style="color:#9cdcfe;">height</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">document</span>.<span style="color:#9cdcfe;">documentElement</span>.<span style="color:#9cdcfe;">clientHeight</span>&nbsp;*&nbsp;<span style="color:#b5cea8;">0.8</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//启用多文件/图上传,其他上传参数设置，参照volupload组件api</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormOptions</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">item</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">field</span>&nbsp;==&nbsp;<span style="color:#ce9178;">'HeadImageUrl'</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">type</span>&nbsp;=&nbsp;<span style="color:#ce9178;">'file'</span>;<span style="color:#6a9955;">//可以指定上传文件类型img/file/excel</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设置上传图片字段100%宽度</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">colSize</span>&nbsp;=&nbsp;<span style="color:#b5cea8;">12</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//启用多图上传(默认单图)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">multiple</span>&nbsp;=&nbsp;<span style="color:#569cd6;">true</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//禁止自动上传(默认自动上传)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">autoUpload</span>=<span style="color:#569cd6;">false</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//最多可以上传3张照片</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">maxFile</span>&nbsp;=&nbsp;<span style="color:#b5cea8;">3</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//限制图片大小，默认3M</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">maxSize</span>&nbsp;=&nbsp;<span style="color:#b5cea8;">3</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//选择文件时</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#dcdcaa;">onChange</span>=(<span style="color:#9cdcfe;">files</span>)<span style="color:#569cd6;">=&gt;</span>{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">console</span>.<span style="color:#dcdcaa;">log</span>(<span style="color:#ce9178;">'选择文件事件'</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//此处不返回true，会中断代码执行</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">true</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//上传前</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#dcdcaa;">uploadBefore</span>=(<span style="color:#9cdcfe;">files</span>)<span style="color:#569cd6;">=&gt;</span>{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">console</span>.<span style="color:#dcdcaa;">log</span>(<span style="color:#ce9178;">'上传前'</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">true</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//上传后</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#dcdcaa;">uploadAfter</span>=(<span style="color:#9cdcfe;">files</span>)<span style="color:#569cd6;">=&gt;</span>{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">console</span>.<span style="color:#dcdcaa;">log</span>(<span style="color:#ce9178;">'上传后'</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">true</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
</div>`,
          ],
          tips: ` 代码生成默认使用的是单图上传，多图上传更多属性配置参照volupload组件`,
          img: "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/11.png",
        },
        {
          title: "编辑表单添加额外属性",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onInit</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">let</span>&nbsp;<span style="color:#9cdcfe;">$this</span>=<span style="color:#569cd6;">this</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">boxOptions</span>.<span style="color:#9cdcfe;">height</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">document</span>.<span style="color:#9cdcfe;">documentElement</span>.<span style="color:#9cdcfe;">clientHeight</span>&nbsp;*&nbsp;<span style="color:#b5cea8;">0.6</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormOptions</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">item</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">field</span>&nbsp;==&nbsp;<span style="color:#ce9178;">'ExpertName'</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//editFormOptions更多配置见volform组件api</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">extra</span>&nbsp;=&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">icon</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"ios-search"</span>,&nbsp;<span style="color:#6a9955;">//显示图标</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">text</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"点击可触发事件"</span>,<span style="color:#6a9955;">//显示文本</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">click</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#9cdcfe;">item</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{<span style="color:#6a9955;">//触发事件</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">$this</span>.<span style="color:#9cdcfe;">$Message</span>.<span style="color:#dcdcaa;">info</span>(<span style="color:#ce9178;">"额外点击事件"</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//在此处可做其他操作，如：弹出框(自己新建一个vue页面，然后点击此处，弹出页面)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//$this.$refs.gridHeader.model&nbsp;=&nbsp;true;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//具体实现参照上面[点击按钮弹出框],实现方式一样</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div>`,
          ],
          tips: ` 可给编辑表单添加描述或触发事件，更多属性配置参照volform组件api`,
          img: "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/12.png",
        },
        {
          title: "主从表一对一",
          content: [
            `<p>主从表一对一全部由代码生成器生成，无需写任何代码</p>
            <p>参照代码生成器文档</p>
            <p>菜单：主从表一对一</p>`,
          ],
          tips: ` 菜单：主从表一对一或系统->下拉框绑定设置,都是由代码生成器生成`,
          img: "",
        },
        {
          title: "主从表一对多",
          content: [
            `一对多从表,不限制从表类型与从表数理，但需要自己写从表的扩展,参照菜单：自定义扩展一对多`,
          ],
          tips: ` 一对多从表自定义实现，需要对照volgrid,volform,voltable组件api找需要的属性与方法`,
          img: "",
        },
        {
          title: "从表上传图片",
          content: [
            `点击从表列即可完成对从表图片或文件上传，参照菜单:【一对一与一对多】->【从表图片上传】`,
          ],
          tips: ` 从表图片上传，是对代码生成进行的扩展实现.按此方法可自行实现任意功能`,
          img: "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/10.png",
        },
        {
          title: "子父组件传值(vuex)",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		<span style="color:#6a9955;">//写入缓存对象(xxx为全局缓存的唯一key)</span>
	</div>
	<div>
		<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$store</span>.<span style="color:#9cdcfe;">getters</span>.<span style="color:#dcdcaa;">data</span>().<span style="color:#9cdcfe;">xxx</span>={<span style="color:#9cdcfe;">obj:</span><span style="color:#ce9178;">'123'</span>};
	</div>
	<div>
		<span style="color:#6a9955;">//读取缓存对象</span>
	</div>
	<div>
		<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$store</span>.<span style="color:#9cdcfe;">getters</span>.<span style="color:#dcdcaa;">data</span>().<span style="color:#9cdcfe;">xxx</span>.<span style="color:#9cdcfe;">obj</span>;
	</div>
	<div>
		<span style="color:#6a9955;">//修改缓存对象</span>
	</div>
	<div>
		<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$store</span>.<span style="color:#9cdcfe;">getters</span>.<span style="color:#dcdcaa;">data</span>().<span style="color:#9cdcfe;">xxx</span>.<span style="color:#9cdcfe;">obj</span>=<span style="color:#ce9178;">"456"</span>;
	</div>
<br />
	<div>
		<span style="color:#6a9955;">//代码生成页面使用全局缓存,在methods方法中：</span>
	</div>
	<div>
		<span style="color:#dcdcaa;">onInit</span>(){
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#6a9955;">//将整个查询页面的viewgrid组件全部缓存起来</span>
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$store</span>.<span style="color:#9cdcfe;">getters</span>.<span style="color:#dcdcaa;">data</span>().<span style="color:#9cdcfe;">viewPageTest</span>=<span style="color:#569cd6;">this</span>;
	</div>
	<div>
		&nbsp;<span style="color:#6a9955;">//在子组件中可以直接使用,如刷新查询页面:this.$store.getters.data().viewPageTest.refresh()</span>
	</div>
	<div>
		}
	</div>
</div>`,
          ],
          tips: `子父组件通过this.$store.getters.data().xxx缓存或读取数据(注意xxx作为key的唯一性)`,
          img: "",
        },
        {
          title: "自动绑定表单/表数据源",
          content: [
            `
            <p>只需要提前配置好数据源，其他全部由框架完成</p>
            <p>数据源需要提前在菜单：系统->下拉框绑定设置中配置</p>
            <p>在代码生成器中选择数据(字典编号)与编辑(查询)类型</p>
            <p>文档组件api中：viewgrid组件api、voltable组件api、voltable组件api都提供了demo</p>`,
          ],
          tips: `字典绑定数据还支持远程模糊查询与自动模糊查询,提前在菜单[下拉框绑定设置]配置好，不需要写任何代码`,
          img: "",
        },
        {
          title: "select远程搜索",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onInit</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//编辑时，设置City字段为远程搜索</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormOptions</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">item</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">field</span>&nbsp;==&nbsp;<span style="color:#ce9178;">'City'</span>)&nbsp;{<span style="color:#6a9955;">//指定City为远程搜索</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//代码生成器中页面配置编辑类型必须是select，并指定数据源字典编号</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//数据源必须是自定义sql</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">remote</span>&nbsp;=&nbsp;<span style="color:#569cd6;">true</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//如果代码生成器中选择的编辑类型是select，可以不用下面的配置</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//item.bind&nbsp;=&nbsp;{&nbsp;key:&nbsp;'roles',&nbsp;data:&nbsp;[]&nbsp;}</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">extra</span>&nbsp;=&nbsp;{&nbsp;<span style="color:#6a9955;">//添加一个额外提示信息(可以忽然此配置)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">icon</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"md-sad"</span>,<span style="color:#6a9955;">//显示图标</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">text</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"远程搜索,在App_TransactionAvgPrice.js中查看详细配置"</span>&nbsp;<span style="color:#6a9955;">//显示文本</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//触发事件&nbsp;click:&nbsp;item&nbsp;=&gt;&nbsp;{}</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div>`,
          ],
          tips: ` select远程搜索适用于数据源比较大的情况，开启远程搜索实时从后台返回数据绑定到select组件中`,
          img: "",
        },
        {
          title: "编写中--待完",
          content: [`编写中`],
          tips: ` 编写中`,
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
    width: 190px;
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
    margin-left: 210px;

    flex: 1;
    width: 1000px;
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
    line-height: 2.5;
  }
  .img {
    cursor: pointer;
    width: 500px;
    img {
      width: 100%;
    }
  }
  .full-code {
    display: none;
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
