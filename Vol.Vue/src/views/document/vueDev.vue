<template>
  <div class="doc">
    <div class="doc-left">
      <el-scrollbar style="height:100%;">
        <ul>
          <li class="n-item"
              v-for="(item,index) in items"
              :key="index">
            <a :class="{active:active==index}"
               :style="item.style"
               @click="scrollIntoView(index)">{{index+1}}. {{index==0?'添加动态按钮':item.title}}</a>
          </li>
        </ul>
      </el-scrollbar>
    </div>
    <div class="doc-right">
      <Alert type="info"
             show-icon>
        <span style="color: red;"> [FormFields]拼写错误兼容更新提示2020.09.13</span>
        <div slot="desc"
             style="line-height: 2;font-size: 15px;margin-top: 20px;">
          <p>如果是2020.09.13之后下载的项目或者2020.09.13后有更新过代码并且重新生成过vue页面,请忽略此提示</p>
          <p>由于框架FormFileds字段拼写错误，文档中editFormFileds已变修正editFormFields，searchFormFileds已变修正为searchFormFields</p>
          <p>更新文件：<a href="https://github.com/cq-panda/Vue.NetCore/releases/tag/v2.1.2"
               target="_blank">https://github.com/cq-panda/Vue.NetCore/releases/tag/v2.1.2</a></p>
          <p style="color: red;">如果没有更新过项目,使用文档中searchFormFields、editFormFields对象时，修改拼写为searchFormFileds、editFormFileds，或者更新代码后再重新生成vue页面</p>
        </div>
      </Alert>
      <div class="title">
        <h2>前端开发</h2>
      </div>
      <div class="top-content">
        <div>
          <p class="desc">此处是代码生成器生成的页面进行扩展，全部实现的是viewGrid组件扩展,参照viewGrid的api介绍</p>
        </div>
        <div>
          <p class="desc"
             style="font-size: 20px;">更多具体扩展代码实现参照：extension->order->SellOrder.js或viewgird组件demo</p>
        </div>
      </div>
      <Alert type="success"
             show-icon>
        提示
        <template slot="desc">
          <p>每个表生成的vue页面，都会有一个与表名相同扩展的.js文件，如表名：SellOrder,扩展文件SellOrder.js</p>
          <p>所有业务代码在扩展js中编写，二次生成代码时，vue页面会被覆盖，扩展js则不会</p>
        </template>
      </Alert>
      <div style=" color: #4c403b;padding: 10px 0;">
        <h4 style="color:red;">下面都是对表App_Expert.js进行的扩展操作,将下面代码复制到App_Expert.js文件methods下即可直接运行</h4>
        <h4 style="color:red;font-size: 20px; padding: 20px 0">没有特别标明的，都是实现的App_Expert.js扩展,也适用其它所有代码生成的页面</h4>
        <h3>所有图片点击即可查看大图</h3>
      </div>
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
                 style="line-height: 1.7;"
                 class="desc"
                 v-html="line"></p>
              <Button type="info"
                      v-if="item.buttonClick"
                      @click="item.buttonClick">查看</Button>
            </div>
            <template v-if="item.drawer">
              <Drawer v-model="doc_model"
                      :width="900">

                <img style="width:100%"
                     v-for="(img,i) in item.img"
                     :key="i"
                     :src="img"
                     @click="()=>{base.previewImg((img||'').replace('?imageMogr2/thumbnail/!50p',''))}" />
                <br>
              </Drawer>
            </template>
            <div class="img"
                 v-else
                 :class="{'full-code':!item.img}">
              <template v-if="(item.img instanceof Array)">
                <img v-for="(img,i) in item.img"
                     :key="i"
                     :src="img"
                     @click="()=>{base.previewImg((img||'').replace('?imageMogr2/thumbnail/!50p',''))}" />
              </template>
              <img v-else
                   :src="item.img"
                   @click="()=>{base.previewImg((item.img||'').replace('?imageMogr2/thumbnail/!50p',''))}" />

            </div>

          </div>
          <Alert type="success"
                 v-if="item.tips"
                 show-icon>{{item.tips}}</Alert>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  methods: {
    scrollIntoView (index) {
      let top = document.getElementById("i-" + index).offsetTop - 100;
      // if (index == 0) {
      //   top = 0;
      // }
      window.scrollTo(0, top);
      this.active = index;
    },
  },
  data () {
    return {
      doc_model: false,
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
          title: "自定义按钮权限控制",
          content: [
            `<p>1、菜单上点击[其他权限]</p>
            <p>2、分配按钮权限</p>
            <p>3、在buttons.js中添加按钮配置</p>`,
          ],
          buttonClick: () => {
            this.doc_model = true;
          },
          tips: ` `,
          drawer: true,
          img: ["https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/20201213btn01.jpg?imageMogr2/thumbnail/!50p",
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/20201213btn02.jpg?imageMogr2/thumbnail/!50p",
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/20201213btn03.jpg?imageMogr2/thumbnail/!50p",
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/20201213btn04.jpg?imageMogr2/thumbnail/!50p",]
        },
        {
          title: "禁用页面缓存keepAlive",
          content: [`所有页面默认开启了缓存，即所有页面只会执行一次created与onInit<br />
<br />
解决方法1：在router文件夹下找到路由配置里加上:&nbsp; (具体见router-&gt;form.js中的/kindEditor配置)<br />
&nbsp; &nbsp;meta: {<br />
&nbsp; &nbsp; &nbsp; keepAlive: false<br />
&nbsp; &nbsp;}&nbsp;<br />
<br />
解决方法2：如果需要每次进入页面查询数据，在[表名.js]文件中添加:<br />
&nbsp; &nbsp;onActivated(){<br />
&nbsp; &nbsp;}<br />
&nbsp;<br />`],
          tips: "",
          img: ""
        },
        {
          title: "前端断点调试",
          content: [`见右边截图`],
          tips: "",
          img: "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/2020121302.png?imageMogr2/thumbnail/!50p"
        },
        {
          title: "查询界面动态添加按钮",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:1.2;white-space:pre;">
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
          img:
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/01.png?imageMogr2/thumbnail/!50p",
        },
        {
          title: "查询界面--第二种布局",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<span style="display:none;"></span><span style="font-size:12px;color:#99BB00;">&nbsp; &nbsp;//调用</span><span style="color:#DCDCAA;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:normal;background-color:#1E1E1E;"><span style="font-size:12px;color:#99BB00;">setFiexdSearchForm方法后，即可开启第二种查询布局</span><span style="display:none;"></span></span><br />
	<div>
		<span style="font-size:14px;color:#009900;"><span style="font-size:12px;color:#99BB00;">&nbsp; &nbsp;/*注意：必须是2020.09.11后</span><span style="font-size:12px;color:#99BB00;">更新代码的才会生效；如果之前已经生成过vue页面，需要</span></span><span style="font-size:12px;color:#99BB00;">重新生成页面才会生效</span><span style="font-size:12px;color:#99BB00;">*/</span><span style="display:none;"></span> 
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onInit</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//开启固定显示查询功能，true=页面加载时查询表单也显示出来，false=点击查询时才会显示表单</span> 
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#dcdcaa;">setFiexdSearchForm</span>(<span style="color:#569cd6;">true</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div>`,
          ],
          tips: `还没想好`,
          img:
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/35.png?imageMogr2/thumbnail/!50p",
        },
        {
          title: "查询界面--默认查询值",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;&nbsp;<span style="color:#dcdcaa;">onInit</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//代码生成器中可以设置字段的查询类型为like进行模糊查询</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//d页面初始化时，设置默认的查值</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">searchFormFields</span>.<span style="color:#9cdcfe;">Name</span>&nbsp;=&nbsp;<span style="color:#ce9178;">"林"</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div>`,
          ],
          tips: ` 还没想好`,
          img:
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/36.png?imageMogr2/thumbnail/!50p",
        },

        {
          title: "查询界面--区间查询",
          content: [`<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		<span style="color:#6a9955;">//声明一个组件</span>
	</div>
	<div>
		<span style="color:#569cd6;">var</span>&nbsp;<span style="color:#9cdcfe;">$rangeCom</span>;
	</div>
	<div>
		<span style="color:#569cd6;">var</span>&nbsp;<span style="color:#9cdcfe;">MyComponent</span>&nbsp;=&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#dcdcaa;">data</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">qty1</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">""</span>,&nbsp;<span style="color:#9cdcfe;">qty2</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">""</span>&nbsp;};
	</div>
	<div>
		&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#dcdcaa;">created</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">$rangeCom</span>=&nbsp;<span style="color:#569cd6;">this</span>;
	</div>
	<div>
		&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#9cdcfe;">methods</span><span style="color:#9cdcfe;">:</span>&nbsp;{},
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#6a9955;">//创建自定义组件模板</span>
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#9cdcfe;">template</span><span style="color:#9cdcfe;">:</span>&nbsp;'<span style="color:#ce9178;">&nbsp;&lt;div&nbsp;style="display:&nbsp;flex;margin-bottom:&nbsp;17px;"&gt;</span>
	</div>
	<div>
		<span style="color:#ce9178;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;label&nbsp;style="text-align:&nbsp;right;width:&nbsp;100px;padding:&nbsp;7px&nbsp;12px&nbsp;10px&nbsp;0;color:red;"&gt;</span>
	</div>
	<div>
		<span style="color:#ce9178;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数量：</span>
	</div>
	<div>
		<span style="color:#ce9178;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/label&gt;</span>
	</div>
	<div>
		<span style="color:#ce9178;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;Input&nbsp;style="flex:1"&nbsp;&nbsp;v-model="qty1"&nbsp;/&gt;</span>
	</div>
	<div>
		<span style="color:#ce9178;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;span&nbsp;style="line-height:&nbsp;30px;&nbsp;margin:&nbsp;0&nbsp;7px;"&gt;--&lt;/span&gt;</span>
	</div>
	<div>
		<span style="color:#ce9178;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;Input&nbsp;style="flex:1"&nbsp;&nbsp;v-model="qty2"&nbsp;/&gt;</span>
	</div>
	<div>
		<span style="color:#ce9178;">&nbsp;&nbsp;&nbsp;&lt;/div&gt;'</span>
	</div>
	<div>
		};
	</div>
<br />
	<div>
		<span style="color:#6a9955;">//声明vue对象</span>
	</div>
	<div>
		<span style="color:#569cd6;">let</span>&nbsp;<span style="color:#9cdcfe;">$this</span>;
	</div>
	<div>
		<span style="color:#569cd6;">let</span>&nbsp;<span style="color:#9cdcfe;">extension</span>&nbsp;=&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#9cdcfe;">components</span><span style="color:#9cdcfe;">:</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">gridHeader</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">""</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">gridBody</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">""</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">gridFooter</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">""</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">modelHeader</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">""</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">modelBody</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">""</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">modelFooter</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">""</span>
	</div>
	<div>
		&nbsp;&nbsp;},&nbsp;<span style="color:#6a9955;">//动态扩充组件或组件路径</span>
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#9cdcfe;">buttons</span><span style="color:#9cdcfe;">:</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">box</span><span style="color:#9cdcfe;">:</span>&nbsp;[]&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#9cdcfe;">methods</span><span style="color:#9cdcfe;">:</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//事件扩展</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onInit</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//必须</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">$this</span>&nbsp;=&nbsp;<span style="color:#569cd6;">this</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//动态挂载自己加的MyComponent组件</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$options</span>.<span style="color:#9cdcfe;">components</span>[<span style="color:#ce9178;">"my-Component"</span>]&nbsp;=&nbsp;<span style="color:#9cdcfe;">MyComponent</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//找到需要做区间查询的字段，通过render渲染</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">searchFormOptions</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">item</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">field</span>&nbsp;==&nbsp;<span style="color:#ce9178;">"Qty"</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">console</span>.<span style="color:#dcdcaa;">log</span>(<span style="color:#ce9178;">"qty"</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#dcdcaa;">render</span>&nbsp;=&nbsp;<span style="color:#569cd6;">function</span>(<span style="color:#9cdcfe;">createElement</span>,&nbsp;<span style="color:#9cdcfe;">ctx</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//挂载组件</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#dcdcaa;">createElement</span>(<span style="color:#9cdcfe;">$this</span>.<span style="color:#9cdcfe;">$options</span>.<span style="color:#9cdcfe;">components</span>[<span style="color:#ce9178;">"my-Component"</span>]);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;});
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;});
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">searchBefore</span>(<span style="color:#9cdcfe;">param</span>)&nbsp;{&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//查询ViewGird表数据前,将区间查询的值提交到后台</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//页面初始化加载时区间查询组件还没渲染</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">$rangeCom</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">let</span>&nbsp;<span style="color:#9cdcfe;">wheres</span>&nbsp;=&nbsp;[
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">name</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"Qty"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">value</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#9cdcfe;">$rangeCom</span>.<span style="color:#9cdcfe;">qty1</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">displayType</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"thanorequal"</span><span style="color:#6a9955;">//&gt;=</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">name</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"Qty"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">value</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#9cdcfe;">$rangeCom</span>.<span style="color:#9cdcfe;">qty2</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">displayType</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"lessorequal"</span><span style="color:#6a9955;">//&lt;=</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;];
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//也可以提交一些其他参数，后台在GetPageData()方法读取options.value</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">param</span>.<span style="color:#9cdcfe;">value</span>&nbsp;=&nbsp;<span style="color:#ce9178;">"xxx"</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">param</span>.<span style="color:#9cdcfe;">wheres</span>.<span style="color:#dcdcaa;">push</span>(...<span style="color:#9cdcfe;">wheres</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//返回false，则不会执行查询</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">true</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">resetSearchFormAfter</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//点击重置按钮时，同时清空区间查询的值</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//(需要2020.10.17更新basic组件才能使用此方法)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">$rangeCom</span>.<span style="color:#9cdcfe;">qty1</span>&nbsp;=&nbsp;<span style="color:#ce9178;">""</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">$rangeCom</span>.<span style="color:#9cdcfe;">qty2</span>&nbsp;=&nbsp;<span style="color:#ce9178;">""</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;}
	</div>
	<div>
		};
	</div>
	<div>
		<span style="color:#c586c0;">export</span>&nbsp;<span style="color:#c586c0;">default</span>&nbsp;<span style="color:#9cdcfe;">extension</span>;
	</div>
<br />
</div>`],
          tips: `还没想好`,
          img:
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/41.png?imageMogr2/thumbnail/!50p",
        },

        {
          title: "查询界面--单个日期查询",
          content: [`<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onInited</span>&nbsp;()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">searchFormOptions</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">item</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">field</span>&nbsp;==&nbsp;<span style="color:#ce9178;">"BeginDate"</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设置单个日期查询</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">range</span>&nbsp;=&nbsp;<span style="color:#569cd6;">false</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设置查询类型为date(默认为datetime)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">type</span>&nbsp;=&nbsp;<span style="color:#ce9178;">"date"</span>;
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//也可以通过配置信息所在位置直接设置</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//this.searchFormOptions[1][0].range&nbsp;=&nbsp;false;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div>`],
          tips: ` 还没想好`,
          img:
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/2020112101.png?imageMogr2/thumbnail/!50p",
        },

        {
          title: "查询界面-移除快捷查询",
          content: [`<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onInited</span>&nbsp;()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">singleSearch</span>&nbsp;=&nbsp;<span style="color:#569cd6;">null</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div>` ],
          tips: ` 还没想好`,
          img:
            ["https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/2020112102.png?imageMogr2/thumbnail/!50p",
              "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/2020112103.png?imageMogr2/thumbnail/!50p"],
        },

        {
          title: "查询界面-隐藏查询按钮",
          content: [`<div style="color:red">2020.11.29更新viewgrid.vue组件才能使用</div><div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//事件扩展</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onInit</span>&nbsp;()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//隐藏查询界面按钮</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">buttons</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">name</span>&nbsp;==&nbsp;<span style="color:#ce9178;">"刷&nbsp;新"</span>&nbsp;||&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">name</span>&nbsp;==&nbsp;<span style="color:#ce9178;">"新&nbsp;建"</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#dcdcaa;">$set</span>(<span style="color:#9cdcfe;">x</span>,&nbsp;<span style="color:#ce9178;">"hidden"</span>,&nbsp;<span style="color:#569cd6;">true</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设置页面上显示的按钮个数(不是必须的)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">maxBtnLength</span>&nbsp;=&nbsp;<span style="color:#b5cea8;">6</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//this.boxButtons弹出框的按钮,this.detailOptions.buttons弹出框明细表操作按钮，同样适用上面上方法</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div>` ],
          tips: ` 还没想好`,
          img:
            ["https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/2020112901.png?imageMogr2/thumbnail/!50p",
              "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/2020112902.png?imageMogr2/thumbnail/!50p"],
        },
        {
          title: "查询界面-自定义弹出框",
          content: [
            `<div style="color:red;font-size:20px">扩展子组件的内容App_ExpertGridHeader.vue</div>
            <div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">template</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">div</span><span style="color:#808080;">&gt;</span>
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">&lt;!--&nbsp;弹出框1&nbsp;--&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">vol-box</span>&nbsp;:<span style="color:#9cdcfe;">lazy</span>="<span style="color:#569cd6;">true</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">model</span>.<span style="color:#9cdcfe;">sync</span>="<span style="color:#9cdcfe;">model</span>.<span style="color:#9cdcfe;">box1</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title</span>=<span style="color:#ce9178;">"弹出框1"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">height</span>="<span style="color:#b5cea8;">400</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">width</span>="<span style="color:#b5cea8;">700</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">padding</span>="<span style="color:#b5cea8;">15</span>"<span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">div</span><span style="color:#808080;">&gt;</span>弹出框1
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#4ec9b0;">Button</span>&nbsp;<span style="color:#9cdcfe;">type</span>=<span style="color:#ce9178;">"info"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@<span style="color:#9cdcfe;">click</span>="<span style="color:#9cdcfe;">getParent</span>"<span style="color:#808080;">&gt;</span>获取父组件对象<span style="color:#808080;">&lt;/</span><span style="color:#4ec9b0;">Button</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">p</span><span style="color:#808080;">&gt;</span>通过&nbsp;this.$emit("parentCall",&nbsp;$vue&nbsp;=&gt;&nbsp;{})可以访问父组件ViewGird中的任何属性、对象、方法<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">p</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">p</span><span style="color:#808080;">&gt;</span>{{<span style="color:#9cdcfe;">model</span>.<span style="color:#9cdcfe;">box1Text</span>}}<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">p</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">div</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">vol-box</span><span style="color:#808080;">&gt;</span>
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">&lt;!--&nbsp;弹出框2&nbsp;--&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">vol-box</span>&nbsp;:<span style="color:#9cdcfe;">lazy</span>="<span style="color:#569cd6;">true</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">model</span>.<span style="color:#9cdcfe;">sync</span>="<span style="color:#9cdcfe;">model</span>.<span style="color:#9cdcfe;">box2</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title</span>=<span style="color:#ce9178;">"弹出框3"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">height</span>="<span style="color:#b5cea8;">400</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">width</span>="<span style="color:#b5cea8;">700</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">padding</span>="<span style="color:#b5cea8;">15</span>"<span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">div</span><span style="color:#808080;">&gt;</span>弹出框2
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">el-tabs</span>&nbsp;<span style="color:#9cdcfe;">type</span>=<span style="color:#ce9178;">"border-card"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">style</span>=<span style="color:#ce9178;">"height:&nbsp;350px;"</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">el-tab-pane</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">span</span>&nbsp;<span style="color:#9cdcfe;">slot</span>=<span style="color:#ce9178;">"label"</span><span style="color:#808080;">&gt;&lt;</span><span style="color:#569cd6;">i</span>&nbsp;<span style="color:#9cdcfe;">class</span>=<span style="color:#ce9178;">"el-icon-date"</span><span style="color:#808080;">&gt;&lt;/</span><span style="color:#569cd6;">i</span><span style="color:#808080;">&gt;</span>&nbsp;我的行程<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">span</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我的行程
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">el-tab-pane</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">el-tab-pane</span>&nbsp;:<span style="color:#9cdcfe;">lazy</span>="<span style="color:#569cd6;">true</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">label</span>=<span style="color:#ce9178;">"消息中心"</span><span style="color:#808080;">&gt;</span>消息中心<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">el-tab-pane</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">el-tab-pane</span>&nbsp;:<span style="color:#9cdcfe;">lazy</span>="<span style="color:#569cd6;">true</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">label</span>=<span style="color:#ce9178;">"角色管理"</span><span style="color:#808080;">&gt;</span>角色管理<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">el-tab-pane</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">el-tab-pane</span>&nbsp;:<span style="color:#9cdcfe;">lazy</span>="<span style="color:#569cd6;">true</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">label</span>=<span style="color:#ce9178;">"定时任务补偿"</span><span style="color:#808080;">&gt;</span>定时任务补偿<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">el-tab-pane</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">el-tabs</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">div</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">vol-box</span><span style="color:#808080;">&gt;</span>
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">&lt;!--&nbsp;弹出框3&nbsp;--&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">vol-box</span>&nbsp;:<span style="color:#9cdcfe;">lazy</span>="<span style="color:#569cd6;">true</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">model</span>.<span style="color:#9cdcfe;">sync</span>="<span style="color:#9cdcfe;">model</span>.<span style="color:#9cdcfe;">box3</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title</span>=<span style="color:#ce9178;">"弹出框3"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">height</span>="<span style="color:#b5cea8;">400</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">width</span>="<span style="color:#b5cea8;">700</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">padding</span>="<span style="color:#b5cea8;">15</span>"<span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">div</span><span style="color:#808080;">&gt;</span>当前操作的行数据{{<span style="color:#4ec9b0;">JSON</span>.<span style="color:#dcdcaa;">stringify</span>(<span style="color:#9cdcfe;">model</span>.<span style="color:#9cdcfe;">box3Row</span>)}}<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">div</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">div</span>&nbsp;<span style="color:#9cdcfe;">slot</span>=<span style="color:#ce9178;">"footer"</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#4ec9b0;">Button</span>&nbsp;<span style="color:#9cdcfe;">type</span>=<span style="color:#ce9178;">"default"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@<span style="color:#9cdcfe;">click</span>="()<span style="color:#569cd6;">=&gt;</span>{<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$Message</span>.<span style="color:#dcdcaa;">error</span>(<span style="color:#ce9178;">'点击确认'</span>)}"<span style="color:#808080;">&gt;</span>确认<span style="color:#808080;">&lt;/</span><span style="color:#4ec9b0;">Button</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#4ec9b0;">Button</span>&nbsp;<span style="color:#9cdcfe;">type</span>=<span style="color:#ce9178;">"default"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@<span style="color:#9cdcfe;">click</span>="()<span style="color:#569cd6;">=&gt;</span>{<span style="color:#9cdcfe;">model</span>.<span style="color:#9cdcfe;">box3</span>=<span style="color:#569cd6;">false</span>}"<span style="color:#808080;">&gt;</span>点击关闭弹出框<span style="color:#808080;">&lt;/</span><span style="color:#4ec9b0;">Button</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">div</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">vol-box</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">div</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">template</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">script</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		<span style="color:#c586c0;">import</span>&nbsp;<span style="color:#9cdcfe;">VolBox</span>&nbsp;<span style="color:#c586c0;">from</span>&nbsp;<span style="color:#ce9178;">"@/components/basic/VolBox.vue"</span>;
	</div>
	<div>
		<span style="color:#c586c0;">export</span>&nbsp;<span style="color:#c586c0;">default</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#9cdcfe;">components:</span>&nbsp;{&nbsp;<span style="color:#ce9178;">"vol-box"</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#9cdcfe;">VolBox</span>&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#9cdcfe;">methods:</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#dcdcaa;">data</span>&nbsp;()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">model:</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">box1Text:</span>&nbsp;<span style="color:#ce9178;">""</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">box1:</span>&nbsp;<span style="color:#569cd6;">false</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">box1Text:</span>&nbsp;<span style="color:#ce9178;">""</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">box2:</span>&nbsp;<span style="color:#569cd6;">false</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">box3:</span>&nbsp;<span style="color:#569cd6;">false</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">box3Row:</span>&nbsp;{}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#9cdcfe;">methods:</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">getParent</span>&nbsp;()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#dcdcaa;">$emit</span>(<span style="color:#ce9178;">"parentCall"</span>,&nbsp;<span style="color:#9cdcfe;">$vue</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">model</span>.<span style="color:#9cdcfe;">box1Text</span>&nbsp;=&nbsp;<span style="color:#4ec9b0;">JSON</span>.<span style="color:#dcdcaa;">stringify</span>(<span style="color:#9cdcfe;">$vue</span>.<span style="color:#9cdcfe;">buttons</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">getTestData</span>&nbsp;()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#ce9178;">"这里是获取到的子组件对象"</span>&nbsp;+&nbsp;<span style="color:#4ec9b0;">JSON</span>.<span style="color:#dcdcaa;">stringify</span>(<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">model</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//弹出框1</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">open1</span>&nbsp;()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">model</span>.<span style="color:#9cdcfe;">box1</span>&nbsp;=&nbsp;<span style="color:#569cd6;">true</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//弹出框2</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">open2</span>&nbsp;()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">model</span>.<span style="color:#9cdcfe;">box2</span>&nbsp;=&nbsp;<span style="color:#569cd6;">true</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//弹出框3</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">open3</span>&nbsp;(<span style="color:#9cdcfe;">row</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">model</span>.<span style="color:#9cdcfe;">box3Row</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">row</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">model</span>.<span style="color:#9cdcfe;">box3</span>&nbsp;=&nbsp;<span style="color:#569cd6;">true</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;}
	</div>
	<div>
		};
	</div>
	<div>
		<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">script</span><span style="color:#808080;">&gt;</span>
	</div>
</div>
<div style="color:red;font-size:20px;margin-top:15px">表的扩展文件App_Expert.js</div>
<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<br />
	<div>
		<span style="color:#c586c0;">import</span>&nbsp;<span style="color:#9cdcfe;">gridHeader</span>&nbsp;<span style="color:#c586c0;">from</span>&nbsp;<span style="color:#ce9178;">'./App_Expert/App_ExpertGridHeader'</span>
	</div>
	<div>
		<span style="color:#6a9955;">//声明vue对象</span>
	</div>
	<div>
		<span style="color:#569cd6;">let</span>&nbsp;<span style="color:#9cdcfe;">$this</span>;
	</div>
	<div>
		<span style="color:#569cd6;">let</span>&nbsp;<span style="color:#9cdcfe;">extension</span>&nbsp;=&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#9cdcfe;">components</span><span style="color:#9cdcfe;">:</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">gridHeader</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#9cdcfe;">gridHeader</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">gridBody</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">''</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">gridFooter</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">''</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">modelHeader</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">''</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">modelBody</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">''</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">modelFooter</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">''</span>
	</div>
	<div>
		&nbsp;&nbsp;},&nbsp;<span style="color:#6a9955;">//动态扩充组件或组件路径</span>
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#9cdcfe;">buttons</span><span style="color:#9cdcfe;">:</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">view</span><span style="color:#9cdcfe;">:</span>&nbsp;[{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">name</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"弹出框1"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">icon</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'md-add'</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">index</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">1</span>,<span style="color:#6a9955;">//添加到第一个按钮后面</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'error'</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onClick</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">function</span>&nbsp;()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">gridHeader</span>.<span style="color:#dcdcaa;">open1</span>()
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;}]
	</div>
	<div>
		&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#9cdcfe;">methods</span><span style="color:#9cdcfe;">:</span>&nbsp;{&nbsp;<span style="color:#6a9955;">//事件扩展</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onInit</span>&nbsp;()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设置界面上最多可显示的按钮数量&nbsp;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">maxBtnLength</span>&nbsp;=&nbsp;<span style="color:#b5cea8;">6</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;第2个弹出框操作</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">buttons</span>.<span style="color:#dcdcaa;">splice</span>(<span style="color:#b5cea8;">2</span>,&nbsp;<span style="color:#b5cea8;">0</span>,&nbsp;...[{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">name</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"弹出框2"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">icon</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'md-add'</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'info'</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onClick</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">function</span>&nbsp;()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">gridHeader</span>.<span style="color:#dcdcaa;">open2</span>()
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">name</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"获取子组件对象"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">icon</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'md-add'</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'info'</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onClick</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">function</span>&nbsp;()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$Message</span>.<span style="color:#dcdcaa;">info</span>(<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">gridHeader</span>.<span style="color:#dcdcaa;">getTestData</span>())
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}])
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;第3个弹出框操作</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">columns</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">field</span>&nbsp;==&nbsp;<span style="color:#ce9178;">"Resume"</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#dcdcaa;">formatter</span>&nbsp;=&nbsp;(<span style="color:#9cdcfe;">row</span>,&nbsp;<span style="color:#9cdcfe;">column</span>,&nbsp;<span style="color:#9cdcfe;">event</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#ce9178;">'&lt;a&gt;(弹出框3)'</span>&nbsp;+&nbsp;<span style="color:#9cdcfe;">row</span>.<span style="color:#9cdcfe;">Resume</span>&nbsp;+&nbsp;<span style="color:#ce9178;">'&lt;/a&gt;'</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//绑定点击事件</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#dcdcaa;">click</span>&nbsp;=&nbsp;(<span style="color:#9cdcfe;">row</span>,&nbsp;<span style="color:#9cdcfe;">column</span>,&nbsp;<span style="color:#9cdcfe;">event</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">gridHeader</span>.<span style="color:#dcdcaa;">open3</span>(<span style="color:#9cdcfe;">row</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;}
	</div>
	<div>
		};
	</div>
	<div>
		<span style="color:#c586c0;">export</span>&nbsp;<span style="color:#c586c0;">default</span>&nbsp;<span style="color:#9cdcfe;">extension</span>;
	</div>
</div>
`
          ],
          tips: ` 还没想好`,
          img:
            ["https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/2020120601.png?imageMogr2/thumbnail/!50p",
              "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/2020120602.png?imageMogr2/thumbnail/!50p",
              "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/2020120603.png?imageMogr2/thumbnail/!50p",
              "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/2020120604.png?imageMogr2/thumbnail/!50p"],
        },
        {
          title: "查询界面-多个弹出框",
          content: ["见上面【自定义弹出框】"],
          tips: ` 见上面【自定义弹出框】`
        },
        {
          title: "弹出框界面动态按钮",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:1.2;white-space:pre;">
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
          img:
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/19.png?imageMogr2/thumbnail/!50p",
        },
        {
          title: "设置按钮显示个数",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:1.2;white-space:pre;">
	<div>
		<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:1.2;white-space:pre;">
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
          img:
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/02.png?imageMogr2/thumbnail/!50p",
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
          img:
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/06.png?imageMogr2/thumbnail/!50p",
        },
        {
          title: "手动打开/关闭tabs",
          content: [
            `<div style='color:red;'>2020.08.01(需要更新文件：index.vue 、main.js标注了更新位置)</div>
			<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:1.2;white-space:pre;">
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
          img:
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/07.png?imageMogr2/thumbnail/!50p",
        },
        {
          title: "render渲染table对象",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:1.2;white-space:pre;">
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
          img:
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/16.png?imageMogr2/thumbnail/!50p",
        },

        {
          title: "render渲染form对象1",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:1.2;white-space:pre;">
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">desc</span><span style="color:#9cdcfe;">:</span>&nbsp;(<span style="color:#9cdcfe;">JSON</span>.<span style="color:#dcdcaa;">stringify</span>(<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormFields</span>))
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
          img:
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/17.png?imageMogr2/thumbnail/!50p",
        },
        {
          title: "render渲染form对象2",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:1.2;white-space:pre;">
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$Message</span>.<span style="color:#dcdcaa;">info</span>(<span style="color:#9cdcfe;">JSON</span>.<span style="color:#dcdcaa;">stringify</span>(<span style="color:#9cdcfe;">$this</span>.<span style="color:#9cdcfe;">editFormFields</span>));
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
          img:
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/18.png?imageMogr2/thumbnail/!50p",
        },
        {
          title: "render渲染form对象3",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:1.2;white-space:pre;">
	<div>
		<span style="color:#569cd6;">
		<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:1.2;white-space:pre;">
		    <div>
				<span style="color:white;">//如果嫌render双向绑定麻烦或内容太多，建议使用这种自定义组件模板的方式</span>
			</div>
			<div>
				<span style="color:#569cd6;">var</span>&nbsp;<span style="color:#9cdcfe;">$com</span>;
			</div>
			<div>
				<span style="color:#6a9955;">//声明一个组件，用于render渲染到表单中</span>
			</div>
			<div>
				<span style="color:#6a9955;">//这里为了方便写文档，直接在js中声明的组件，</span>
			</div>
			<div>
				<span style="color:#6a9955;">//实际可以创建一个vue文件，然后在import进来，onInit中指向这个组件</span>
			</div>
			<div>
				<span style="color:#569cd6;">var</span>&nbsp;<span style="color:#9cdcfe;">MyComponent</span>&nbsp;=&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">data</span>()&nbsp;{&nbsp;<span style="color:#c586c0;">return</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">time</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">""</span>&nbsp;}&nbsp;},
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">created</span>()&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">$com</span>&nbsp;=&nbsp;<span style="color:#569cd6;">this</span>;
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;},
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">methods</span><span style="color:#9cdcfe;">:</span>&nbsp;{},
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//创建自定义组件模板</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">template</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'&nbsp;&lt;div&nbsp;style="display:&nbsp;flex;margin-bottom:&nbsp;17px;"&gt;</span><span style="color:#d7ba7d;">\</span>
			</div>
			<div>
				<span style="color:#ce9178;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;label&nbsp;style="text-align:&nbsp;right;width:&nbsp;100px;padding:&nbsp;7px&nbsp;12px&nbsp;10px&nbsp;0;color:red;"&gt;</span><span style="color:#d7ba7d;">\</span>
			</div>
			<div>
				<span style="color:#ce9178;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;选择时间：</span><span style="color:#d7ba7d;">\</span>
			</div>
			<div>
				<span style="color:#ce9178;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/label&gt;</span><span style="color:#d7ba7d;">\</span>
			</div>
			<div>
				<span style="color:#ce9178;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;TimePicker&nbsp;style="flex:1"&nbsp;type="time"&nbsp;:value="time"&nbsp;placeholder="Select&nbsp;time"&gt;</span><span style="color:#d7ba7d;">\</span>
			</div>
			<div>
				<span style="color:#ce9178;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/TimePicker&gt;</span><span style="color:#d7ba7d;">\</span>
			</div>
			<div>
				<span style="color:#ce9178;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;div&nbsp;style="line-height:&nbsp;33px;padding-left:&nbsp;15px;color:red;"&gt;</span><span style="color:#d7ba7d;">\</span>
			</div>
			<div>
				<span style="color:#ce9178;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;这里是render直接使用的html代码渲染的</span><span style="color:#d7ba7d;">\</span>
			</div>
			<div>
				<span style="color:#ce9178;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/div&gt;</span><span style="color:#d7ba7d;">\</span>
			</div>
			<div>
				<span style="color:#ce9178;">&nbsp;&nbsp;&nbsp;&lt;/div&gt;'</span>
			</div>
			<div>
				};
			</div>
			<div>
				<span style="color:#6a9955;">//声明vue对象</span>
			</div>
			<div>
				<span style="color:#569cd6;">let</span>&nbsp;<span style="color:#9cdcfe;">$this</span>;
			</div>
			<div>
				<span style="color:#569cd6;">let</span>&nbsp;<span style="color:#9cdcfe;">extension</span>&nbsp;=&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">components</span><span style="color:#9cdcfe;">:</span>&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">gridHeader</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">''</span>,
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">gridBody</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">''</span>,
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">gridFooter</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">''</span>,
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">modelHeader</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">''</span>,
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">modelBody</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">''</span>,
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">modelFooter</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">''</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;},&nbsp;<span style="color:#6a9955;">//动态扩充组件或组件路径</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">buttons</span><span style="color:#9cdcfe;">:</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">box</span><span style="color:#9cdcfe;">:</span>&nbsp;[]&nbsp;},
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">methods</span><span style="color:#9cdcfe;">:</span>&nbsp;{&nbsp;<span style="color:#6a9955;">//事件扩展</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onInit</span>()&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//必须</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">$this</span>&nbsp;=&nbsp;<span style="color:#569cd6;">this</span>;
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//动态挂载自己加的MyComponent组件</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$options</span>.<span style="color:#9cdcfe;">components</span>[<span style="color:#ce9178;">'my-Component'</span>]&nbsp;=&nbsp;<span style="color:#9cdcfe;">MyComponent</span>;
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//在表单配置的第二行后，将MyComponent组件添加到表单中</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormOptions</span>.<span style="color:#dcdcaa;">splice</span>(<span style="color:#b5cea8;">2</span>,&nbsp;<span style="color:#b5cea8;">0</span>,&nbsp;[{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">colSize</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">12</span>,&nbsp;<span style="color:#6a9955;">//设置为当前组件100%宽度</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">render</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">function</span>(<span style="color:#9cdcfe;">createElement</span>,&nbsp;<span style="color:#9cdcfe;">ctx</span>)&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//挂载组件</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#dcdcaa;">createElement</span>(<span style="color:#9cdcfe;">$this</span>.<span style="color:#9cdcfe;">$options</span>.<span style="color:#9cdcfe;">components</span>[<span style="color:#ce9178;">'my-Component'</span>])
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}])
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">modelOpenAfter</span>(<span style="color:#9cdcfe;">row</span>)&nbsp;{&nbsp;<span style="color:#6a9955;">//打开弹出框后给组件设置不同的值</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//新建</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">currentAction</span>&nbsp;==&nbsp;<span style="color:#ce9178;">"Add"</span>)&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">$com</span>.<span style="color:#9cdcfe;">time</span>&nbsp;=&nbsp;<span style="color:#ce9178;">"09:41:00"</span>;
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;<span style="color:#c586c0;">else</span>&nbsp;{&nbsp;<span style="color:#6a9955;">//编辑</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">$com</span>.<span style="color:#9cdcfe;">time</span>&nbsp;=&nbsp;<span style="color:#ce9178;">"23:22:00"</span>;
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;}
			</div>
			<div>
				};
			</div>
			<div>
				<span style="color:#c586c0;">export</span>&nbsp;<span style="color:#c586c0;">default</span>&nbsp;<span style="color:#9cdcfe;">extension</span>;
			</div>
		</div>
</span>
	</div>
	<div>
		<span style="color:#c586c0;"></span><span style="color:#c586c0;"></span><span style="color:#9cdcfe;"></span>
	</div>
</div>`,
          ],
          tips: `render操作form组件，可以在表单中添加任意组件，包括chart图表，具体render参数见vue官方文档`,
          img:
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/22.png?imageMogr2/thumbnail/!50p",
        },


        {
          title: "render渲染form对象4",
          content: [`<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;&nbsp;<span style="color:#dcdcaa;">onInit</span>&nbsp;()&nbsp;{
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//在第一行后面添加一个render渲染自定义内容</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//代码生成配置页面，设置编辑行第二行开始，每个编辑行只设置一个字段</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormOptions</span>[<span style="color:#b5cea8;">1</span>].<span style="color:#dcdcaa;">push</span>(
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">render</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#9cdcfe;">h</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#dcdcaa;">h</span>(
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">"div"</span>,
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">'margin-left'</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'20px'</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">'background-color'</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'rgb(240,&nbsp;250,&nbsp;255)'</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">'margin-top'</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'-14px'</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">position</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'absolute'</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">right</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">0</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">left</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">0</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">top</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'15px'</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">height</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'167px'</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">'border-radius'</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'4px'</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">border</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'1px&nbsp;solid&nbsp;#abdcff'</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">padding</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'16px'</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">on</span><span style="color:#9cdcfe;">:</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">click</span><span style="color:#9cdcfe;">:</span>&nbsp;()&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$Notice</span>.<span style="color:#dcdcaa;">open</span>({
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'Notification&nbsp;title'</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">desc</span><span style="color:#9cdcfe;">:</span>&nbsp;(<span style="color:#ce9178;">"click"</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">h</span>(
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">"p"</span>,
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">style</span><span style="color:#9cdcfe;">:</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">'font-size'</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'16px'</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">color</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'#17233d'</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">display</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'block'</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">'margin-bottom'</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'4px'</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},&nbsp;<span style="color:#9cdcfe;">on</span><span style="color:#9cdcfe;">:</span>&nbsp;{&nbsp;<span style="color:#dcdcaa;">click</span><span style="color:#9cdcfe;">:</span>&nbsp;()&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{&nbsp;}&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">"这是一些不可描述的内容"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;),
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">style</span><span style="color:#9cdcfe;">:</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">padding</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"4px&nbsp;0"</span>&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">"昨天，我老丈人给我打电话问我是不是基金赚了60多W…&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;),
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">style</span><span style="color:#9cdcfe;">:</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">padding</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"4px&nbsp;0"</span>&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">"我很诧异，他怎么知道……他说过年的时候听我们聊天知道我投基金，现在电视上天天在说股市涨了，估计我收益要翻几倍了。"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;),
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">style</span><span style="color:#9cdcfe;">:</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">padding:</span>&nbsp;<span style="color:#ce9178;">"4px&nbsp;0"</span>&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">"然后他很认真的和我说，估计后面还要涨，先不急着卖…"</span>
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
</div>`      ],
          tips: `render操作form组件，可以在表单中添加任意组件，包括chart图表，具体render参数见vue官方文档`,
          img:
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/42.png?imageMogr2/thumbnail/!50p",
        },
        {
          title: "table自定义显示图片及base64格式",
          content: [`<div style="color:red;">2020.12.19更新basic组件才能使用</div><div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;&nbsp;<span style="color:#dcdcaa;">onInit</span>(){
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">columns</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">item</span><span style="color:#569cd6;">=&gt;</span>{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>(<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">field</span>==<span style="color:#ce9178;">"xxx"</span>){
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//1.通过formatter自定返回图片</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;var&nbsp;_imgs=[];</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;item.formatter=(imgs)=&gt;{</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;//&nbsp;imgs.split(",")</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;_imgs.push({name:"文件名",path:"127.0.0.1/xxxx.jpg"})</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;}</span>
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//2.&nbsp;如果图片是base64格式的,请将属性设置为base64=true;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;item.base64=true;</span>
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
</div>`], tips: ``,
          img:
            "",
        },
        {
          title: "table格式化数据",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:1.2;white-space:pre;">
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
          img:
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/08.png?imageMogr2/thumbnail/!50p",
        },
        {
          title: "table动态添加一列按钮",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:1.2;white-space:pre;">
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
          img:
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/05.png?imageMogr2/thumbnail/!50p",
        },
        {
          title: "table行点击事件",
          content: [`<div style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:0px;color:#D4D4D4;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:normal;">
	<div style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:0px;color:#D4D4D4;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:normal;">
		<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
			<div>
				<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
					<div>
						&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">rowClick</span>&nbsp;({&nbsp;<span style="color:#9cdcfe;">row</span>,&nbsp;<span style="color:#9cdcfe;">column</span>,&nbsp;<span style="color:#9cdcfe;">event</span>&nbsp;})&nbsp;{&nbsp;
					</div>
					<div>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//table点击行时同时选中当前行</span>
					</div>
					<div>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;this.$refs.table.$refs.table.toggleRowSelection(row);</span>
					</div>
					<div>
						&nbsp;&nbsp;&nbsp;&nbsp;}
					</div>
				</div>
			</div>
		</div>
	</div>
<br />
</div>`  ],
          tips: "",
          img: ""
        },
        {
          title: "table单元格点击事件",
          content: [`<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onInit</span>&nbsp;()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">columns</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">field</span>&nbsp;==&nbsp;<span style="color:#ce9178;">"PhoneNo"</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//将要点击的单元格格式化突出出来</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#dcdcaa;">formatter</span>&nbsp;=&nbsp;(<span style="color:#9cdcfe;">row</span>,&nbsp;<span style="color:#9cdcfe;">column</span>,&nbsp;<span style="color:#9cdcfe;">event</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#ce9178;">'&lt;a&gt;'</span>&nbsp;+&nbsp;<span style="color:#9cdcfe;">row</span>.<span style="color:#9cdcfe;">PhoneNo</span>&nbsp;+&nbsp;<span style="color:#ce9178;">'&lt;/a&gt;'</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//绑定点击事件</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#dcdcaa;">click</span>&nbsp;=&nbsp;(<span style="color:#9cdcfe;">row</span>,&nbsp;<span style="color:#9cdcfe;">column</span>,&nbsp;<span style="color:#9cdcfe;">event</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$Message</span>.<span style="color:#dcdcaa;">info</span>(<span style="color:#9cdcfe;">row</span>.<span style="color:#9cdcfe;">PhoneNo</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
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
</div>`  ],
          tips: "",
          img: ""
        },
        {
          title: "table单元格td背景颜色",
          content: [`<div style="color:red">2020.12.13需要更新前端voltable组件</div><div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onInit</span>&nbsp;()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设置表的最大高度</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;this.tableMaxHeight&nbsp;=&nbsp;300;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">columns</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">field</span>&nbsp;==&nbsp;<span style="color:#ce9178;">"PhoneNo"</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#dcdcaa;">cellStyle</span>&nbsp;=&nbsp;(<span style="color:#9cdcfe;">row</span>,&nbsp;<span style="color:#9cdcfe;">rowIndex</span>,&nbsp;<span style="color:#9cdcfe;">columnIndex</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">row</span>.<span style="color:#9cdcfe;">PhoneNo</span>&nbsp;==&nbsp;<span style="color:#ce9178;">"138888887698"</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">background</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"#2196F3"</span>,&nbsp;<span style="color:#9cdcfe;">color</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"#ffff"</span>&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">field</span>&nbsp;==&nbsp;<span style="color:#ce9178;">"Creator"</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#dcdcaa;">cellStyle</span>&nbsp;=&nbsp;(<span style="color:#9cdcfe;">row</span>,&nbsp;<span style="color:#9cdcfe;">rowIndex</span>,&nbsp;<span style="color:#9cdcfe;">columnIndex</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">row</span>.<span style="color:#9cdcfe;">Creator</span>&nbsp;==&nbsp;<span style="color:#ce9178;">"超级管理员"</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">background</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"#f3f3f3"</span>&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
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
</div>`],
          tips: "",
          img: "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/2020121301.png?imageMogr2/thumbnail/!50p"
        },
        {
          title: "table设置/移除列颜色",
          content: [
            `<div style="color:red">2020.09.06需要更新前端voltable组件(与上面设置颜色的区别，此处操作是对于有数据源的操作，上面的是对于整个td设置背景颜色)</div><div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;<span style="color:#dcdcaa;">onInit</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">columns</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;if&nbsp;(x.field&nbsp;==&nbsp;"Variety")&nbsp;{</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设置table有数据源的列为正常显示(不显示背景颜色)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;x.normal&nbsp;=&nbsp;true;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;}</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">field</span>&nbsp;==&nbsp;<span style="color:#ce9178;">"City"</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设置table有数据源的列为正常显示(并设置自定义文字颜色)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">normal</span>&nbsp;=&nbsp;<span style="color:#569cd6;">true</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//根据不同的值，定义不同的样式(如：文字颜色)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#dcdcaa;">getStyle</span>&nbsp;=&nbsp;(<span style="color:#9cdcfe;">row</span>,&nbsp;<span style="color:#9cdcfe;">column</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">row</span>.<span style="color:#9cdcfe;">City</span>&nbsp;==&nbsp;<span style="color:#ce9178;">"北京市"</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">color</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"red"</span>,&nbsp;<span style="color:#9cdcfe;">cursor</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"pointer"</span>&nbsp;};
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">color</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"blue"</span>,&nbsp;<span style="color:#9cdcfe;">cursor</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"pointer"</span>&nbsp;};
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//绑定点击事件</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#dcdcaa;">click</span>&nbsp;=&nbsp;(<span style="color:#9cdcfe;">row</span>,&nbsp;<span style="color:#9cdcfe;">column</span>,&nbsp;<span style="color:#9cdcfe;">event</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$Message</span>.<span style="color:#dcdcaa;">info</span>(<span style="color:#9cdcfe;">row</span>.<span style="color:#9cdcfe;">City</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;});
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div>`,
          ],
          tips: `还没想好`,
          img:
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/37.png?imageMogr2/thumbnail/!50p",
        },
        {
          title: "table手动设置排序列",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:1.2;white-space:pre;">
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
          img:
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/03.png?imageMogr2/thumbnail/!50p",
        },
        {
          title: "table触发switch",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:1.2;white-space:pre;">
	<div>
		<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:1.2;white-space:pre;">
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
          img:
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/04.png?imageMogr2/thumbnail/!50p",
        },
        {
          title: "table查询界面编辑",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:1.2;white-space:pre;">
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
          img:
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/13.png?imageMogr2/thumbnail/!50p",
        },

        {
          title: "table显示合计",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:1.2;white-space:pre;">
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
          img:
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/09.png?imageMogr2/thumbnail/!50p",
        },
        {
          title: "table动态隐藏列",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:1.2;white-space:pre;">
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
          title: "table设置分页条大小",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onInit</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设置分页条大小</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">pagination</span>.<span style="color:#9cdcfe;">sizes</span>&nbsp;=&nbsp;[<span style="color:#b5cea8;">20</span>,&nbsp;<span style="color:#b5cea8;">30</span>,&nbsp;<span style="color:#b5cea8;">40</span>,&nbsp;<span style="color:#b5cea8;">60</span>,<span style="color:#b5cea8;">90</span>]
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设置默认分页数</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">pagination</span>.<span style="color:#9cdcfe;">size</span>&nbsp;=&nbsp;<span style="color:#b5cea8;">20</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div>`,
          ],
          tips: ``,
          img:
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/28.png?imageMogr2/thumbnail/!100p",
        },
        {
          title: "table获取所有行数据",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<span style="color:#6a9955;">//获取查询界面的所有行数据</span> 
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">table</span>.<span style="color:#9cdcfe;">rowData</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//获取明细表所有行数据</span> 
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">detail</span>.<span style="color:#9cdcfe;">rowData</span>;
	</div>
</div>`,
          ],
          tips: ``,
          img: "",
        },
        {
          title: "table获取选中的行",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<span style="color:#6a9955;">//获取查询界面的所有选中的行数据</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">table</span>.<span style="color:#dcdcaa;">getSelected</span>();
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//获取明细表所有选中的行数据</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">detail</span>.<span style="color:#dcdcaa;">getSelected</span>();
	</div>
</div>`,
          ],
          tips: ``,
          img: "",
        },

        {
          title: "table从表编辑实时计算",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:1.2;white-space:pre;">
	<div>
		&nbsp;<span style="color:#6a9955;">//2020.08.16</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onInited</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//onInited方法设置从表编辑时实时计算值</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">detailOptions</span>.<span style="color:#9cdcfe;">columns</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">field</span>&nbsp;==&nbsp;<span style="color:#ce9178;">'Qty'</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//强烈建议此处将eidt设置为null不开启编辑</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">edit</span>&nbsp;=&nbsp;<span style="color:#569cd6;">null</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#dcdcaa;">formatter</span>&nbsp;=&nbsp;(<span style="color:#9cdcfe;">row</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//可以设置计算规则&nbsp;，如：</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//return&nbsp;row.x1&nbsp;*&nbsp;&nbsp;row.x2</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#9cdcfe;">row</span>.<span style="color:#4fc1ff;">MO</span>&nbsp;*&nbsp;<span style="color:#b5cea8;">2</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div>`,
          ],
          tips: `如果是单独引用的voltable组件，同样适用上面的方法`,
          img:
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/21.png?imageMogr2/thumbnail/!50p",
        },


        {
          title: "table动态列",
          content: [`<div style="color:red;font-size:18px;">需要更新前端Basic下的组件2020.10.30</div>
          <div style="color:red;font-size:18px;">1、后台代码</div>
          <p><div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;&nbsp;<span style="color:#9cdcfe;">public</span>&nbsp;<span style="color:#9cdcfe;">override</span>&nbsp;<span style="color:#dcdcaa;">PageGridData</span>&lt;<span style="color:#4ec9b0;">App_Transaction</span>&gt;&nbsp;<span style="color:#dcdcaa;">GetPageData</span>(<span style="color:#9cdcfe;">PageDataOptions</span>&nbsp;<span style="color:#9cdcfe;">options</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">////方式1.直接从框架的查询里返回的数据，过滤字段返回</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//PageGridData&lt;App_Transaction&gt;&nbsp;gridData&nbsp;=&nbsp;base.GetPageData(options);</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//gridData.extra&nbsp;=&nbsp;gridData.rows.Select(s&nbsp;=&gt;&nbsp;new&nbsp;{&nbsp;s.Id,s.CreateDate&nbsp;}).ToList();</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//gridData.rows&nbsp;=&nbsp;new&nbsp;List&lt;App_Transaction&gt;();</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//return&nbsp;gridData;</span>
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//方式2、自己写实现，例如：从自定义sql或者存储过程中返回数据</span>
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//分页大小&nbsp;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">int</span>&nbsp;<span style="color:#9cdcfe;">page</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">options</span>.<span style="color:#9cdcfe;">Page</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//获取查询条件</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">SearchParameters</span>&gt;&nbsp;<span style="color:#9cdcfe;">searchParametersList</span>&nbsp;=&nbsp;<span style="color:#569cd6;">new</span>&nbsp;<span style="color:#4ec9b0;">List</span>&lt;<span style="color:#4ec9b0;">SearchParameters</span>&gt;();
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(!<span style="color:#9cdcfe;">string</span>.<span style="color:#dcdcaa;">IsNullOrEmpty</span>(<span style="color:#9cdcfe;">options</span>.<span style="color:#9cdcfe;">Wheres</span>))
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">try</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">searchParametersList</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">options</span>.<span style="color:#9cdcfe;">Wheres</span>.<span style="color:#dcdcaa;">DeserializeObject</span>&lt;<span style="color:#4ec9b0;">List</span>&lt;<span style="color:#4ec9b0;">SearchParameters</span>&gt;&gt;();
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">catch</span>&nbsp;{&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//这段代码不要被注释了</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">PageGridData</span>&lt;<span style="color:#9cdcfe;">App_Transaction</span>&gt;&nbsp;<span style="color:#9cdcfe;">gridData</span>&nbsp;=&nbsp;<span style="color:#569cd6;">new</span>&nbsp;<span style="color:#4ec9b0;">PageGridData</span>&lt;<span style="color:#4ec9b0;">App_Transaction</span>&gt;();
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//返回table数据</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">var</span>&nbsp;<span style="color:#9cdcfe;">list</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">repository</span>.<span style="color:#9cdcfe;">DapperContext</span>.<span style="color:#dcdcaa;">QueryList</span>&lt;<span style="color:#4ec9b0;">object</span>&gt;(<span style="color:#ce9178;">"select&nbsp;*&nbsp;from&nbsp;App_Transaction"</span>,&nbsp;<span style="color:#569cd6;">null</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">gridData</span>.<span style="color:#9cdcfe;">extra</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">list</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//返回查询到的总行数</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">gridData</span>.<span style="color:#9cdcfe;">total</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">repository</span>.<span style="color:#9cdcfe;">DapperContext</span>.<span style="color:#dcdcaa;">ExecuteScalar</span>(<span style="color:#ce9178;">"select&nbsp;count(1)&nbsp;from&nbsp;App_Transaction"</span>,&nbsp;<span style="color:#569cd6;">null</span>).<span style="color:#dcdcaa;">GetInt</span>();
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">gridData</span>.<span style="color:#9cdcfe;">rows</span>&nbsp;=&nbsp;<span style="color:#569cd6;">new</span>&nbsp;<span style="color:#4ec9b0;">List</span>&lt;<span style="color:#4ec9b0;">App_Transaction</span>&gt;();
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#9cdcfe;">gridData</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div></p>
        <div style="color:red;font-size:18px;">2、前端代码(在表名xxx.js中methods里)</div>
        <div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">searchAfter</span>&nbsp;(<span style="color:#9cdcfe;">rows</span>,&nbsp;<span style="color:#9cdcfe;">result</span>)&nbsp;{&nbsp;<span style="color:#6a9955;">//查询ViewGird表数据后param查询参数,result回返查询的结果</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//将后台动态返回的列添加到table行数据中</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">rows</span>.<span style="color:#dcdcaa;">push</span>(...<span style="color:#9cdcfe;">result</span>.<span style="color:#9cdcfe;">extra</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//方式1：&nbsp;设置列动态显示与隐藏</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;this.columns.forEach(x&nbsp;=&gt;&nbsp;{</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;if&nbsp;(x.field&nbsp;==&nbsp;"PhoneNo")&nbsp;{</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;x.hidden&nbsp;=&nbsp;true;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;}&nbsp;else&nbsp;{</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;x.hidden&nbsp;=&nbsp;false;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;}</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;})</span>
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//方式2：或者动态添加一些列</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;this.columns.push(&nbsp;{field:"字段",title:'标题'})</span>
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//方式3：再或者用splice添加或删除一些列</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;this.columns.splice(1,&nbsp;0,&nbsp;{&nbsp;field:&nbsp;"字段",&nbsp;title:&nbsp;'标题'&nbsp;})</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">true</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
</div>`],
          tips: ``,
          img: "",
        },
        {
          title: "table点击行选中当前行",
          content: [`
         <div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
 <div style="color:red;font-size:18px">需要更新Basic文件夹下的组件2020.11.07</div>	<div>
		&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//事件扩展</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onInit</span>&nbsp;()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">rowClick</span>&nbsp;({&nbsp;<span style="color:#9cdcfe;">row</span>,&nbsp;<span style="color:#9cdcfe;">column</span>,&nbsp;<span style="color:#9cdcfe;">event</span>&nbsp;})&nbsp;{&nbsp;<span style="color:#6a9955;">//查询界面table点击行选中当前行</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">table</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">table</span>.<span style="color:#dcdcaa;">toggleRowSelection</span>(<span style="color:#9cdcfe;">row</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">detailRowClick</span>&nbsp;({&nbsp;<span style="color:#9cdcfe;">row</span>,&nbsp;<span style="color:#9cdcfe;">column</span>,&nbsp;<span style="color:#9cdcfe;">event</span>&nbsp;})&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//编辑弹出框从表table点击行选中当前行，没有从表的不用管</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">detail</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">table</span>.<span style="color:#dcdcaa;">toggleRowSelection</span>(<span style="color:#9cdcfe;">row</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div>
<br />`],
          tips: ` --`,
          img:
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/48.png?45geMogr2/thumbnail/!50p",
        },
        {
          title: "table显示序号checkbox",
          content: [`<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onInit</span>&nbsp;()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//需要更新前端组件2020.11.01</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//隐藏checkbox列(默认是显示的)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">ck</span>&nbsp;=&nbsp;<span style="color:#569cd6;">false</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//显示序号(默认隐藏)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">columnIndex</span>&nbsp;=&nbsp;<span style="color:#569cd6;">true</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//从表配置同上</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;this.detailOptions.ck&nbsp;=&nbsp;false;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;this.detailOptions.columnIndex&nbsp;=&nbsp;true;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div>`],
          tips: `如果是单独引用的voltable组件，同样适用上面的方法`,
          img:
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/43.png?imageMogr2/thumbnail/!50p",
        },


        {
          title: "编辑表单实时计算",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:1.2;white-space:pre;">
	<div>
		&nbsp;&nbsp;<span style="color:#6a9955;">//步骤1   2020.08.16</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onInit</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//将计算字段设置为只读（必须）,代码生成器页面不要勾选只读</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormOptions</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">item</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">field</span>&nbsp;==&nbsp;<span style="color:#ce9178;">'Creator'</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">readonly</span>&nbsp;=&nbsp;<span style="color:#569cd6;">true</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//步骤2</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">modelOpenAfter</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设置只读计算，Creator必须是只读的，见onInit上面设置</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormFields</span>.<span style="color:#dcdcaa;">Creator</span>&nbsp;=&nbsp;()&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设置计算，例如</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//this.editFormFields.x1&nbsp;*&nbsp;this.editFormFields.x2</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;(<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormFields</span>.<span style="color:#9cdcfe;">AvgPrice</span>&nbsp;||&nbsp;<span style="color:#b5cea8;">0</span>)&nbsp;*&nbsp;<span style="color:#b5cea8;">2</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div>`,
          ],
          tips: `如果是单独引用的volfrom组件，同样适用上面的方法`,
          img:
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/20.png?imageMogr2/thumbnail/!50p",
        },

        {
          title: "编辑表单动态显示隐藏",
          content: [`<div style='color:red'>2020-11-21后更新的才可以使用</div><div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;&nbsp;<span style="color:#dcdcaa;">getFormOption</span>&nbsp;(<span style="color:#9cdcfe;">field</span>)&nbsp;{
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
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//方式1,通过select选择触发显示与隐藏</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onInit</span>&nbsp;()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//获取订单类型select配置，当前订单类型select改变值时，动态设置Remark,SellNo两个字段是否显示&nbsp;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">var</span>&nbsp;<span style="color:#9cdcfe;">orderTypeOption</span>&nbsp;=&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#dcdcaa;">getFormOption</span>(<span style="color:#ce9178;">"OrderType"</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">orderTypeOption</span>.<span style="color:#dcdcaa;">onChange</span>&nbsp;=&nbsp;(<span style="color:#9cdcfe;">val</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//当订单类型select改变值时，如果选中的是发货(对应字典编号为2)，emark,SellNo隐藏，否则显示出来</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">var</span>&nbsp;<span style="color:#9cdcfe;">remarkOption</span>&nbsp;=&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#dcdcaa;">getFormOption</span>(<span style="color:#ce9178;">"Remark"</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#dcdcaa;">$set</span>(<span style="color:#9cdcfe;">remarkOption</span>,&nbsp;<span style="color:#ce9178;">"hidden"</span>,&nbsp;<span style="color:#9cdcfe;">val</span>&nbsp;==&nbsp;<span style="color:#ce9178;">"2"</span>)
	</div>
<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">var</span>&nbsp;<span style="color:#9cdcfe;">sellNoOption</span>&nbsp;=&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#dcdcaa;">getFormOption</span>(<span style="color:#ce9178;">"SellNo"</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#dcdcaa;">$set</span>(<span style="color:#9cdcfe;">sellNoOption</span>,&nbsp;<span style="color:#ce9178;">"hidden"</span>,&nbsp;<span style="color:#9cdcfe;">val</span>&nbsp;==&nbsp;<span style="color:#ce9178;">"2"</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//方式2,通过打开弹出框时触发显示与隐藏</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">modelOpenAfter</span>&nbsp;(<span style="color:#9cdcfe;">row</span>)&nbsp;{&nbsp;&nbsp;<span style="color:#6a9955;">//编辑或新建时，根据不同的情况控制字段是否显示&nbsp;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;this.editFormOptions.forEach(x&nbsp;=&gt;&nbsp;{</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;x.forEach(item&nbsp;=&gt;&nbsp;{</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(item.field&nbsp;==&nbsp;"Remark"&nbsp;||&nbsp;item.field&nbsp;==&nbsp;"SellNo")&nbsp;{</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//如果不是新建，则隐藏Remark,SellNo两个字段是否显示&nbsp;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//也可以根据row当前编辑行的值来处理</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;this.$set(item,&nbsp;"hidden",&nbsp;this.currentAction&nbsp;!=&nbsp;"Add")</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;})</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
</div>`  ],
          tips: `如果是单独引用的volfrom组件，同样适用上面的方法`,
          img:
            ["https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/2020112104.png?imageMogr2/thumbnail/!50p",
              "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/2020112105.png?imageMogr2/thumbnail/!50p",
              "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/2020112106.png?imageMogr2/thumbnail/!50p"]
        },
        {
          title: "编辑表单只读/默认值",
          content: [
            `<span style="display:none;"></span><span style="line-height:2;font-size:18px;">
<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">modelOpenAfter</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//获取当前弹出框是新建还是编辑状态</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">let</span>&nbsp;<span style="color:#9cdcfe;">isEDIT</span>&nbsp;=&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">currentAction</span>&nbsp;==&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">const</span>.<span style="color:#4fc1ff;">EDIT</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//点击弹出框后，如果是编辑状态，禁止编辑帐号，如果新建状态，将帐号字段设置为可编辑</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormOptions</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">item</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//如果是编辑帐号设置为只读</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">field</span>&nbsp;==&nbsp;<span style="color:#ce9178;">"UserName"</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//disabled是editFormOptions的动态属性，这里只能通过this.$set修改值</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#dcdcaa;">$set</span>(<span style="color:#9cdcfe;">x</span>,&nbsp;<span style="color:#ce9178;">"disabled"</span>,&nbsp;<span style="color:#9cdcfe;">isEDIT</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//不是新建，性别默认值设置为男</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(!<span style="color:#9cdcfe;">isEDIT</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormFields</span>.<span style="color:#9cdcfe;">Gender</span>&nbsp;=&nbsp;<span style="color:#ce9178;">"0"</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div>
</span><span style="line-height:1.5;font-size:18px;"></span><br />`,
          ],
          tips: ``,
          img:
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/26.png?imageMogr2/thumbnail/!50p",
        },
        {
          title: "编辑表单添加额外属性",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;<span style="color:#dcdcaa;">onInit</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">let</span>&nbsp;<span style="color:#9cdcfe;">$this</span>=<span style="color:#569cd6;">this</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">boxOptions</span>.<span style="color:#9cdcfe;">height</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">document</span>.<span style="color:#4fc1ff;">documentElement</span>.<span style="color:#4fc1ff;">clientHeight</span>&nbsp;*&nbsp;<span style="color:#b5cea8;">0.6</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormOptions</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">item</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">field</span>&nbsp;==&nbsp;<span style="color:#ce9178;">'ExpertName'</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//editFormOptions更多配置见volform组件api</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">extra</span>&nbsp;=&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">icon</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"ios-search"</span>,&nbsp;<span style="color:#6a9955;">//显示图标</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">text</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"点击可触发事件"</span>,<span style="color:#6a9955;">//显示文本</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">style</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"color:red;"</span>,<span style="color:#6a9955;">//指定样式</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">click</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#9cdcfe;">item</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{<span style="color:#6a9955;">//触发事件</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">$this</span>.<span style="color:#9cdcfe;">$Message</span>.<span style="color:#dcdcaa;">info</span>(<span style="color:#ce9178;">"额外点击事件"</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//在此处可做其他操作，如：弹出框(自己新建一个vue页面，然后点击此处，弹出页面)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//$this.$refs.gridHeader.model&nbsp;=&nbsp;true;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//具体实现参照上面[点击按钮弹出框],实现方式一样</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div>`,
          ],
          tips: ` 可给编辑表单添加描述或触发事件，更多属性配置参照volform组件api`,
          img:
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/12.png?imageMogr2/thumbnail/!50p",
        },
        {
          title: "编辑弹出框选择数据1",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		<span style="color:#6a9955;">//前端文件1,Sys_DictionaryBody.vue</span>
	</div>
<br />
	<div>
		<span style="color:#6a9955;">//导入弹出框的组件App_ExpertModelBody，这个组件是自己定义写的vue页面</span>
	</div>
	<div>
		<span style="color:#c586c0;">import</span>&nbsp;<span style="color:#9cdcfe;">App_ExpertModelBody</span>&nbsp;<span style="color:#c586c0;">from</span>&nbsp;<span style="color:#ce9178;">"./App_Expert/App_ExpertModelBody.vue"</span>;
	</div>
	<div>
		<span style="color:#569cd6;">let</span>&nbsp;<span style="color:#9cdcfe;">extension</span>&nbsp;=&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">components</span><span style="color:#9cdcfe;">:</span>&nbsp;{&nbsp;<span style="color:#6a9955;">//动态扩充组件或组件路径</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">gridHeader</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">''</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">gridBody</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">''</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">gridFooter</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">''</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">modelHeader</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">""</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">modelBody</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#9cdcfe;">App_ExpertModelBody</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">modelFooter</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">''</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">text</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"代码生成器中，如果字段是图片地址或文件，选择[table列显示类型]即可"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">buttons</span><span style="color:#9cdcfe;">:</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">box</span><span style="color:#9cdcfe;">:</span>&nbsp;[]&nbsp;<span style="color:#6a9955;">//新建、编辑弹出框按钮</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;},&nbsp;<span style="color:#6a9955;">//扩展的按钮</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">methods</span><span style="color:#9cdcfe;">:</span>&nbsp;{&nbsp;<span style="color:#6a9955;">//事件扩展</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onInit</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">boxOptions</span>.<span style="color:#9cdcfe;">height</span>&nbsp;=&nbsp;<span style="color:#b5cea8;">400</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormOptions</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">item</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">field</span>&nbsp;==&nbsp;<span style="color:#ce9178;">'ExpertName'</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//给编辑表单设置[选择数据]操作,extra具体配置见volform组件api</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">extra</span>&nbsp;=&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">icon</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"ios-search"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">text</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"选择数据"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">click</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#9cdcfe;">item</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">modelBody</span>.<span style="color:#dcdcaa;">openDemo</span>();
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		};
	</div>
	<div>
		<span style="color:#c586c0;">export</span>&nbsp;<span style="color:#c586c0;">default</span>&nbsp;<span style="color:#9cdcfe;">extension</span>;
	</div>
<br />
<br />
</div><div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<br />
<br />
<br />
	<div>
		<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">template</span><span style="color:#808080;">&gt;</span>
	</div>
<br />
	<div>
		&nbsp;&nbsp;<span style="color:#6a9955;">&lt;!--&nbsp;前端文件2,弹出框选择内容的部份App_Expert.js&nbsp;--&gt;</span>
	</div>
<br />
	<div>
		&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">VolBox</span>&nbsp;:<span style="color:#9cdcfe;">model</span>.<span style="color:#9cdcfe;">sync</span>="<span style="color:#9cdcfe;">model</span>"&nbsp;<span style="color:#9cdcfe;">title</span>=<span style="color:#ce9178;">"选择数据"</span>&nbsp;:<span style="color:#9cdcfe;">height</span>="<span style="color:#b5cea8;">450</span>"&nbsp;:<span style="color:#9cdcfe;">width</span>="<span style="color:#b5cea8;">750</span>"&nbsp;:<span style="color:#9cdcfe;">padding</span>="<span style="color:#b5cea8;">15</span>"<span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">&lt;!--&nbsp;设置查询条件&nbsp;--&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">div</span>&nbsp;<span style="color:#9cdcfe;">style</span>=<span style="color:#ce9178;">"padding-bottom:&nbsp;10px;"</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">span</span>&nbsp;<span style="color:#9cdcfe;">style</span>=<span style="color:#ce9178;">"margin-right:20px;"</span><span style="color:#808080;">&gt;</span>请选择数据<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">span</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">Input</span>&nbsp;<span style="color:#9cdcfe;">placeholder</span>=<span style="color:#ce9178;">"名称"</span>&nbsp;<span style="color:#9cdcfe;">style</span>=<span style="color:#ce9178;">"width:300px;"</span>&nbsp;<span style="color:#9cdcfe;">v-model</span>="<span style="color:#9cdcfe;">expertName</span>"&nbsp;/<span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">Button</span>&nbsp;<span style="color:#9cdcfe;">type</span>=<span style="color:#ce9178;">"info"</span>&nbsp;<span style="color:#9cdcfe;">icon</span>=<span style="color:#ce9178;">"ios-search"</span>&nbsp;@<span style="color:#9cdcfe;">click</span>="<span style="color:#dcdcaa;">search</span>()"<span style="color:#808080;">&gt;</span>搜索<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">Button</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">div</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">&lt;!--&nbsp;vol-table配置的这些属性见VolTable组件api文件&nbsp;--&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">vol-table</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">ref</span>=<span style="color:#ce9178;">"mytable"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">loadKey</span>="<span style="color:#569cd6;">true</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">columns</span>="<span style="color:#9cdcfe;">columns</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">pagination</span>="<span style="color:#9cdcfe;">pagination</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">pagination-hide</span>="<span style="color:#569cd6;">false</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">max-height</span>="<span style="color:#b5cea8;">380</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">url</span>="<span style="color:#9cdcfe;">url</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">index</span>="<span style="color:#569cd6;">true</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">single</span>="<span style="color:#569cd6;">true</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">defaultLoadPage</span>="<span style="color:#569cd6;">false</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@<span style="color:#9cdcfe;">loadBefore</span>="<span style="color:#9cdcfe;">loadTableBefore</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@<span style="color:#9cdcfe;">loadAfter</span>="<span style="color:#9cdcfe;">loadTableAfter</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&gt;&lt;/</span><span style="color:#569cd6;">vol-table</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">&lt;!--&nbsp;设置弹出框的操作按钮&nbsp;--&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">div</span>&nbsp;<span style="color:#9cdcfe;">slot</span>=<span style="color:#ce9178;">"footer"</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">Button</span>&nbsp;<span style="color:#9cdcfe;">type</span>=<span style="color:#ce9178;">"info"</span>&nbsp;<span style="color:#9cdcfe;">icon</span>=<span style="color:#ce9178;">"ios-add"</span>&nbsp;@<span style="color:#9cdcfe;">click</span>="<span style="color:#dcdcaa;">addRow</span>()"<span style="color:#808080;">&gt;</span>添加选择的数据<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">Button</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">Button</span>&nbsp;<span style="color:#9cdcfe;">type</span>=<span style="color:#ce9178;">"success"</span>&nbsp;<span style="color:#9cdcfe;">icon</span>=<span style="color:#ce9178;">"ios-remove"</span>&nbsp;@<span style="color:#9cdcfe;">click</span>="<span style="color:#9cdcfe;">model</span>=<span style="color:#569cd6;">false</span>"<span style="color:#808080;">&gt;</span>关闭<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">Button</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">div</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">VolBox</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">template</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">script</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		<span style="color:#c586c0;">export</span>&nbsp;<span style="color:#c586c0;">default</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#9cdcfe;">components:</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">VolBox</span><span style="color:#9cdcfe;">:</span>&nbsp;()&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;<span style="color:#569cd6;">import</span>(<span style="color:#ce9178;">"@/components/basic/VolBox.vue"</span>),
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">VolTable</span><span style="color:#9cdcfe;">:</span>&nbsp;()&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;<span style="color:#569cd6;">import</span>(<span style="color:#ce9178;">"@/components/basic/VolTable.vue"</span>),
	</div>
	<div>
		&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#dcdcaa;">data</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">model:</span>&nbsp;<span style="color:#569cd6;">false</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">expertName:</span>&nbsp;<span style="color:#ce9178;">""</span>,<span style="color:#6a9955;">//查询条件字段</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">url:</span>&nbsp;<span style="color:#ce9178;">"api/App_Expert/getSelectorDemo"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">columns:</span>&nbsp;[
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"expertId"</span>,&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"主键id"</span>,&nbsp;<span style="color:#9cdcfe;">width:</span>&nbsp;<span style="color:#b5cea8;">90</span>,&nbsp;<span style="color:#9cdcfe;">hidden:</span>&nbsp;<span style="color:#569cd6;">true</span>&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"expertName"</span>,&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"名称"</span>,&nbsp;<span style="color:#9cdcfe;">width:</span>&nbsp;<span style="color:#b5cea8;">120</span>&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"headImageUrl"</span>,&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"img"</span>,&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"头像"</span>,&nbsp;<span style="color:#9cdcfe;">width:</span>&nbsp;<span style="color:#b5cea8;">120</span>&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"resume"</span>,&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"个人简介"</span>,&nbsp;<span style="color:#9cdcfe;">width:</span>&nbsp;<span style="color:#b5cea8;">90</span>&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"enable"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"是否启用"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">bind:</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">key:</span>&nbsp;<span style="color:#ce9178;">"enable"</span>,&nbsp;<span style="color:#9cdcfe;">data:</span>&nbsp;[]&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">width:</span>&nbsp;<span style="color:#b5cea8;">110</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;],
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">pagination:</span>&nbsp;{}<span style="color:#6a9955;">//分页配置，见voltable组件api</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;};
	</div>
	<div>
		&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#9cdcfe;">methods:</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">openDemo</span>(<span style="color:#9cdcfe;">row</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">model</span>&nbsp;=&nbsp;<span style="color:#569cd6;">true</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//打开弹出框时，加载table数据</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">mytable</span>.<span style="color:#dcdcaa;">load</span>();
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">search</span>()&nbsp;{&nbsp;<span style="color:#6a9955;">//搜索</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">mytable</span>.<span style="color:#dcdcaa;">load</span>();
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">addRow</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">var</span>&nbsp;<span style="color:#9cdcfe;">rows</span>&nbsp;=&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">mytable</span>.<span style="color:#dcdcaa;">getSelected</span>();
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(!<span style="color:#9cdcfe;">rows</span>&nbsp;||&nbsp;<span style="color:#9cdcfe;">rows</span>.<span style="color:#9cdcfe;">length</span>&nbsp;==&nbsp;<span style="color:#b5cea8;">0</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$Message</span>.<span style="color:#dcdcaa;">error</span>(<span style="color:#ce9178;">"请选择行数据"</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//获取父组件viewgrid明细表的所有行数据，并且替换数据</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#dcdcaa;">$emit</span>(<span style="color:#ce9178;">"parentCall"</span>,&nbsp;(<span style="color:#9cdcfe;">$vue</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//将选择的数据合并到表单中(注意框架生成的代码都是大写，后台自己写的接口是小写的)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">var</span>&nbsp;<span style="color:#9cdcfe;">_row</span>&nbsp;=&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">ExpertId:</span>&nbsp;<span style="color:#9cdcfe;">rows</span>[<span style="color:#b5cea8;">0</span>].<span style="color:#9cdcfe;">expertId</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">ExpertName:</span>&nbsp;<span style="color:#9cdcfe;">rows</span>[<span style="color:#b5cea8;">0</span>].<span style="color:#9cdcfe;">expertName</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">HeadImageUrl:</span>&nbsp;<span style="color:#9cdcfe;">rows</span>[<span style="color:#b5cea8;">0</span>].<span style="color:#9cdcfe;">headImageUrl</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">Resume:</span>&nbsp;<span style="color:#9cdcfe;">rows</span>[<span style="color:#b5cea8;">0</span>].<span style="color:#9cdcfe;">resume</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">Enable:</span>&nbsp;<span style="color:#9cdcfe;">rows</span>[<span style="color:#b5cea8;">0</span>].<span style="color:#9cdcfe;">enable</span>+<span style="color:#ce9178;">""</span>,&nbsp;<span style="color:#6a9955;">//enable是数字类型，框架绑定下拉框的时候要转换成字符串</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#4ec9b0;">Object</span>.<span style="color:#dcdcaa;">assign</span>(<span style="color:#9cdcfe;">$vue</span>.<span style="color:#9cdcfe;">editFormFields</span>,&nbsp;<span style="color:#9cdcfe;">_row</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;});
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//关闭当前窗口</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">model</span>&nbsp;=&nbsp;<span style="color:#569cd6;">false</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//这里是从api查询后返回数据的方法</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">loadTableAfter</span>(<span style="color:#9cdcfe;">row</span>)&nbsp;{},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">loadTableBefore</span>(<span style="color:#9cdcfe;">params</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//查询前，设置查询条件</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">expertName</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">params</span>.<span style="color:#9cdcfe;">wheres</span>&nbsp;=&nbsp;[{&nbsp;<span style="color:#9cdcfe;">name:</span>&nbsp;<span style="color:#ce9178;">"expertName"</span>,&nbsp;<span style="color:#9cdcfe;">value:</span>&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">expertName</span>&nbsp;}];
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">true</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;},
	</div>
	<div>
		};
	</div>
	<div>
		<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">script</span><span style="color:#808080;">&gt;</span>
	</div>
<br />
<br />
</div><div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//后台App_ExpertController中添加代码，返回table数据</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[<span style="color:#9cdcfe;">HttpPost</span>,&nbsp;<span style="color:#dcdcaa;">Route</span>(<span style="color:#ce9178;">"getSelectorDemo"</span>)]
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">public</span>&nbsp;<span style="color:#9cdcfe;">IActionResult</span>&nbsp;<span style="color:#dcdcaa;">GetSelectorDemo</span>([<span style="color:#9cdcfe;">FromBody</span>]&nbsp;<span style="color:#9cdcfe;">PageDataOptions</span>&nbsp;<span style="color:#9cdcfe;">options</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//解析查询条件，查询条件都放在Wheres中，也可以在前端自定义wheres格式</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">SearchParameters</span>&gt;&nbsp;<span style="color:#9cdcfe;">wheres</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">options</span>?.<span style="color:#9cdcfe;">Wheres</span>?.<span style="color:#dcdcaa;">DeserializeObject</span>&lt;<span style="color:#4ec9b0;">List</span>&lt;<span style="color:#4ec9b0;">SearchParameters</span>&gt;&gt;();
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//生成查询条件(这里可以不用EF，自己写原生sql)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">IQueryable</span>&lt;<span style="color:#9cdcfe;">App_Expert</span>&gt;&nbsp;<span style="color:#9cdcfe;">query</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">App_ExpertRepository</span>.<span style="color:#9cdcfe;">Instance</span>.<span style="color:#dcdcaa;">FindAsIQueryable</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;<span style="color:#569cd6;">true</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">wheres</span>&nbsp;!=&nbsp;<span style="color:#569cd6;">null</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">string</span>&nbsp;<span style="color:#9cdcfe;">searchKey</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">wheres</span>.<span style="color:#dcdcaa;">Where</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">Name</span>&nbsp;==&nbsp;<span style="color:#ce9178;">"expertName"</span>).<span style="color:#dcdcaa;">Select</span>(<span style="color:#9cdcfe;">s</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;<span style="color:#9cdcfe;">s</span>.<span style="color:#9cdcfe;">Value</span>).<span style="color:#dcdcaa;">FirstOrDefault</span>();
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(!<span style="color:#9cdcfe;">string</span>.<span style="color:#dcdcaa;">IsNullOrEmpty</span>(<span style="color:#9cdcfe;">searchKey</span>))
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">query</span>.<span style="color:#dcdcaa;">Where</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">ExpertName</span>.<span style="color:#dcdcaa;">Contains</span>(<span style="color:#9cdcfe;">searchKey</span>));
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">var</span>&nbsp;<span style="color:#9cdcfe;">data</span>&nbsp;=&nbsp;<span style="color:#569cd6;">new</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">total</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">query</span>.<span style="color:#dcdcaa;">Count</span>(),&nbsp;<span style="color:#6a9955;">//查询到的总行数</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">rows</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">query</span>.<span style="color:#dcdcaa;">OrderByDescending</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">CreateDate</span>)<span style="color:#6a9955;">//返回table列表</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.<span style="color:#dcdcaa;">Select</span>(<span style="color:#9cdcfe;">s</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;<span style="color:#569cd6;">new</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;s.<span style="color:#9cdcfe;">ExpertId</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;s.<span style="color:#9cdcfe;">ExpertName</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;s.<span style="color:#9cdcfe;">HeadImageUrl</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;s.<span style="color:#9cdcfe;">Resume</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;s.<span style="color:#9cdcfe;">Enable</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.<span style="color:#dcdcaa;">Skip</span>(<span style="color:#9cdcfe;">options</span>.<span style="color:#9cdcfe;">Page</span>&nbsp;*&nbsp;(<span style="color:#9cdcfe;">options</span>.<span style="color:#9cdcfe;">Page</span>&nbsp;-&nbsp;<span style="color:#b5cea8;">1</span>))
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.<span style="color:#dcdcaa;">Take</span>(<span style="color:#9cdcfe;">options</span>.<span style="color:#9cdcfe;">Rows</span>).<span style="color:#dcdcaa;">ToList</span>()
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//也可以直接调用框架的GetPageData查询</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;PageGridData&lt;App_Expert&gt;&nbsp;data&nbsp;=&nbsp;App_ExpertService.Instance.GetPageData(options);</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#dcdcaa;">Json</span>(<span style="color:#9cdcfe;">data</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
<br />
<br />
</div>`,
          ],
          tips: `给编辑表单设置一个【选择数据】操作,见volfrom组件api配置，选择后回写到编辑框了`,
          img: [
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/31.png?imageMogr2/thumbnail/!50p",
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/29.png?imageMogr2/thumbnail/!50p",
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/30.png?imageMogr2/thumbnail/!50p",
          ],
        },
        {
          title: "编辑弹出框选择数据2",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:1.2;white-space:pre;">
	<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:1.2;white-space:pre;">
		<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
			<br />
			<div>
				//js代码&nbsp;Sys_Dictionary.js文件
			</div>
			<div>
				let&nbsp;extension&nbsp;=&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;components:&nbsp;{&nbsp;//动态扩充组件或组件路径
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gridHeader:&nbsp;'',
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gridBody:&nbsp;'',
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gridFooter:&nbsp;'',
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;modelHeader:&nbsp;'',
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;modelBody:&nbsp;()&nbsp;=&gt;
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;import&nbsp;("./Sys_Dictionary/Sys_DictionaryBody.vue"),
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;modelFooter:&nbsp;''
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;},
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;buttons:&nbsp;[],&nbsp;//扩展的按钮
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;methods:&nbsp;{&nbsp;//事件扩展
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;onInit()&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;this.editFormOptions.forEach(x&nbsp;=&gt;&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;x.forEach(item&nbsp;=&gt;&nbsp;{&nbsp;if&nbsp;(item.field&nbsp;==&nbsp;'ParentId')&nbsp;{&nbsp;item.min&nbsp;=&nbsp;0;&nbsp;}&nbsp;})
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;onInited()&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;columnIndex&nbsp;=&nbsp;this.detailOptions.columns.findIndex(x&nbsp;=&gt;&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;x.field&nbsp;==&nbsp;'Enable'
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//在指定的Enable列后面手动增加一列
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;this.detailOptions.columns.splice(columnIndex&nbsp;+&nbsp;1,&nbsp;0,&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;field:&nbsp;'oper',
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;title:&nbsp;'操作',
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;type:&nbsp;'text',
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;width:&nbsp;100,
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//返回一个标签
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;formatter:&nbsp;(row)&nbsp;=&gt;&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;'&lt;a&gt;选择数据&lt;/a&gt;'
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//触发事件,可以在此事件再打开一个弹出框等操作
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;click:&nbsp;(row,&nbsp;column,&nbsp;event)&nbsp;=&gt;&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;this.$refs.modelBody.open(row);
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;}
			</div>
			<div>
				};
			</div>
			<div>
				export&nbsp;default&nbsp;extension;
			</div>
<br />
<br />
			<div>
				//&nbsp;弹出框组件代码Sys_DictionaryBody.vue
			</div>
			<div>
				<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">template</span><span style="color:#808080;">&gt;</span>
			</div>
			<div>
				&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#4ec9b0;">VolBox</span>&nbsp;:<span style="color:#9cdcfe;">model</span>.<span style="color:#9cdcfe;">sync</span>="<span style="color:#9cdcfe;">model</span>"&nbsp;<span style="color:#9cdcfe;">title</span>=<span style="color:#ce9178;">"选择数据"</span>&nbsp;:<span style="color:#9cdcfe;">height</span>="<span style="color:#b5cea8;">500</span>"&nbsp;:<span style="color:#9cdcfe;">width</span>="<span style="color:#b5cea8;">900</span>"&nbsp;:<span style="color:#9cdcfe;">padding</span>="<span style="color:#b5cea8;">15</span>"<span style="color:#808080;">&gt;</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">div</span>&nbsp;<span style="color:#9cdcfe;">style</span>=<span style="color:#ce9178;">"padding-bottom:&nbsp;10px;"</span><span style="color:#808080;">&gt;</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">span</span>&nbsp;<span style="color:#9cdcfe;">style</span>=<span style="color:#ce9178;">"margin-right:20px;"</span><span style="color:#808080;">&gt;</span>请选择数据<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">span</span><span style="color:#808080;">&gt;</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#4ec9b0;">Input</span>&nbsp;<span style="color:#9cdcfe;">placeholder</span>=<span style="color:#ce9178;">"数据源Value"</span>&nbsp;<span style="color:#9cdcfe;">style</span>=<span style="color:#ce9178;">"width:300px;"</span>&nbsp;<span style="color:#9cdcfe;">v-model</span>="<span style="color:#9cdcfe;">text</span>"&nbsp;/<span style="color:#808080;">&gt;</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#4ec9b0;">Button</span>&nbsp;<span style="color:#9cdcfe;">type</span>=<span style="color:#ce9178;">"info"</span>&nbsp;<span style="color:#9cdcfe;">icon</span>=<span style="color:#ce9178;">"ios-search"</span>&nbsp;@<span style="color:#9cdcfe;">click</span>="<span style="color:#dcdcaa;">search</span>()"<span style="color:#808080;">&gt;</span>搜索<span style="color:#808080;">&lt;/</span><span style="color:#4ec9b0;">Button</span><span style="color:#808080;">&gt;</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">div</span><span style="color:#808080;">&gt;</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">&lt;!--&nbsp;vol-table配置的这些属性见VolTable组件api文件&nbsp;--&gt;</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">vol-table</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">ref</span>=<span style="color:#ce9178;">"mytable"</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">loadKey</span>="<span style="color:#569cd6;">true</span>"
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">columns</span>="<span style="color:#9cdcfe;">columns</span>"
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">pagination</span>="<span style="color:#9cdcfe;">pagination</span>"
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">pagination-hide</span>="<span style="color:#569cd6;">false</span>"
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">max-height</span>="<span style="color:#b5cea8;">380</span>"
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">url</span>="<span style="color:#9cdcfe;">url</span>"
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">index</span>="<span style="color:#569cd6;">true</span>"
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">single</span>="<span style="color:#569cd6;">true</span>"
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">defaultLoadPage</span>="<span style="color:#569cd6;">false</span>"
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@<span style="color:#9cdcfe;">loadBefore</span>="<span style="color:#9cdcfe;">loadTableBefore</span>"
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&gt;&lt;/</span><span style="color:#569cd6;">vol-table</span><span style="color:#808080;">&gt;</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">div</span>&nbsp;<span style="color:#9cdcfe;">slot</span>=<span style="color:#ce9178;">"footer"</span><span style="color:#808080;">&gt;</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#4ec9b0;">Button</span>&nbsp;<span style="color:#9cdcfe;">type</span>=<span style="color:#ce9178;">"info"</span>&nbsp;<span style="color:#9cdcfe;">icon</span>=<span style="color:#ce9178;">"ios-add"</span>&nbsp;@<span style="color:#9cdcfe;">click</span>="<span style="color:#dcdcaa;">addRow</span>()"<span style="color:#808080;">&gt;</span>添加选择的数据<span style="color:#808080;">&lt;/</span><span style="color:#4ec9b0;">Button</span><span style="color:#808080;">&gt;</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#4ec9b0;">Button</span>&nbsp;<span style="color:#9cdcfe;">type</span>=<span style="color:#ce9178;">"success"</span>&nbsp;<span style="color:#9cdcfe;">icon</span>=<span style="color:#ce9178;">"ios-remove"</span>&nbsp;@<span style="color:#9cdcfe;">click</span>="<span style="color:#9cdcfe;">model</span>=<span style="color:#569cd6;">false</span>"<span style="color:#808080;">&gt;</span>关闭<span style="color:#808080;">&lt;/</span><span style="color:#4ec9b0;">Button</span><span style="color:#808080;">&gt;</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">div</span><span style="color:#808080;">&gt;</span>
			</div>
			<div>
				&nbsp;&nbsp;<span style="color:#808080;">&lt;/</span><span style="color:#4ec9b0;">VolBox</span><span style="color:#808080;">&gt;</span>
			</div>
			<div>
				<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">template</span><span style="color:#808080;">&gt;</span>
			</div>
			<div>
				<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">script</span><span style="color:#808080;">&gt;</span>
			</div>
			<div>
				<span style="color:#c586c0;">export</span>&nbsp;<span style="color:#c586c0;">default</span>&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;<span style="color:#9cdcfe;">components:</span>&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">VolBox</span><span style="color:#9cdcfe;">:</span>&nbsp;()&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;<span style="color:#569cd6;">import</span>(<span style="color:#ce9178;">"@/components/basic/VolBox.vue"</span>),
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">VolTable</span><span style="color:#9cdcfe;">:</span>&nbsp;()&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;<span style="color:#569cd6;">import</span>(<span style="color:#ce9178;">"@/components/basic/VolTable.vue"</span>),
			</div>
			<div>
				&nbsp;&nbsp;},
			</div>
			<div>
				&nbsp;&nbsp;<span style="color:#dcdcaa;">data</span>()&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">model:</span>&nbsp;<span style="color:#569cd6;">false</span>,
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">text:</span>&nbsp;<span style="color:#ce9178;">""</span>,
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">url:</span>&nbsp;<span style="color:#ce9178;">"api/Sys_Dictionary/getSelectorDemo"</span>,
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">columns:</span>&nbsp;[
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"dicList_ID"</span>,&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"DicList_ID"</span>,&nbsp;<span style="color:#9cdcfe;">width:</span>&nbsp;<span style="color:#b5cea8;">90</span>,&nbsp;<span style="color:#9cdcfe;">hidden:</span>&nbsp;<span style="color:#569cd6;">true</span>&nbsp;},
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"dic_ID"</span>,&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"数据源ID"</span>,&nbsp;<span style="color:#9cdcfe;">width:</span>&nbsp;<span style="color:#b5cea8;">90</span>,&nbsp;<span style="color:#9cdcfe;">readonly:</span>&nbsp;<span style="color:#569cd6;">true</span>&nbsp;},
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"dicValue"</span>,&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"数据源Value"</span>,&nbsp;<span style="color:#9cdcfe;">width:</span>&nbsp;<span style="color:#b5cea8;">120</span>&nbsp;},
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"dicName"</span>,&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"数据源Text"</span>,&nbsp;<span style="color:#9cdcfe;">width:</span>&nbsp;<span style="color:#b5cea8;">140</span>&nbsp;},
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"orderNo"</span>,&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"排序号"</span>,&nbsp;<span style="color:#9cdcfe;">width:</span>&nbsp;<span style="color:#b5cea8;">90</span>&nbsp;},
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"remark"</span>,&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"备注"</span>,&nbsp;<span style="color:#9cdcfe;">width:</span>&nbsp;<span style="color:#b5cea8;">90</span>&nbsp;},
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"enable"</span>,
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"是否可用"</span>,
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">bind:</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">key:</span>&nbsp;<span style="color:#ce9178;">"enable"</span>,&nbsp;<span style="color:#9cdcfe;">data:</span>&nbsp;[]&nbsp;},
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">width:</span>&nbsp;<span style="color:#b5cea8;">110</span>,
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;],
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">pagination:</span>&nbsp;{},
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">row:</span>&nbsp;{},&nbsp;<span style="color:#6a9955;">//明细表选择的行</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;};
			</div>
			<div>
				&nbsp;&nbsp;},
			</div>
			<div>
				&nbsp;&nbsp;<span style="color:#9cdcfe;">methods:</span>&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">open</span>(<span style="color:#9cdcfe;">row</span>)&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">row</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">row</span>;
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">model</span>&nbsp;=&nbsp;<span style="color:#569cd6;">true</span>;
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//打开弹出框时，加载table数据</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">mytable</span>.<span style="color:#dcdcaa;">load</span>();
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;},
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">search</span>()&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">mytable</span>.<span style="color:#dcdcaa;">load</span>();
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;},
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">addRow</span>()&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">var</span>&nbsp;<span style="color:#9cdcfe;">rows</span>&nbsp;=&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">mytable</span>.<span style="color:#dcdcaa;">getSelected</span>();
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(!<span style="color:#9cdcfe;">rows</span>&nbsp;||&nbsp;<span style="color:#9cdcfe;">rows</span>.<span style="color:#9cdcfe;">length</span>&nbsp;==&nbsp;<span style="color:#b5cea8;">0</span>)&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$Message</span>.<span style="color:#dcdcaa;">error</span>(<span style="color:#ce9178;">"请选择行数据"</span>);
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//替换明细表的数据(注意大小写问题，代码生成的明细表都是大写开头的，自己添加的table是小写开头的)</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">row</span>.<span style="color:#9cdcfe;">DicValue</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">rows</span>[<span style="color:#b5cea8;">0</span>].<span style="color:#9cdcfe;">dicValue</span>;
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">row</span>.<span style="color:#9cdcfe;">DicName</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">rows</span>[<span style="color:#b5cea8;">0</span>].<span style="color:#9cdcfe;">dicName</span>;
			</div>
<br />
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">/*如果在2020.09.06后更新过voltable组件，下面this.$emit("parentCall",&nbsp;($vue)=&gt;{})这段代码就不用了*/</span>
			</div>
<br />
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//获取父组件viewgrid明细表的所有行数据，并且替换数据</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#dcdcaa;">$emit</span>(<span style="color:#ce9178;">"parentCall"</span>,&nbsp;(<span style="color:#9cdcfe;">$vue</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//重新生成明细表的行数据</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">let</span>&nbsp;<span style="color:#9cdcfe;">_rows</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">$vue</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">detail</span>.<span style="color:#9cdcfe;">rowData</span>.<span style="color:#dcdcaa;">splice</span>(<span style="color:#b5cea8;">0</span>);
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//刷新明细表行数据</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">$vue</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">detail</span>.<span style="color:#9cdcfe;">rowData</span>.<span style="color:#dcdcaa;">push</span>(...<span style="color:#9cdcfe;">_rows</span>);
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;});
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//关闭当前窗口</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">model</span>&nbsp;=&nbsp;<span style="color:#569cd6;">false</span>;
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;},
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">loadTableBefore</span>(<span style="color:#9cdcfe;">params</span>)&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//查询前，设置查询条件</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">text</span>)&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">params</span>.<span style="color:#9cdcfe;">wheres</span>&nbsp;=&nbsp;[{&nbsp;<span style="color:#9cdcfe;">name:</span>&nbsp;<span style="color:#ce9178;">"DicValue"</span>,&nbsp;<span style="color:#9cdcfe;">value:</span>&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">text</span>&nbsp;}];
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">true</span>;
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;}
			</div>
			<div>
				&nbsp;&nbsp;},
			</div>
			<div>
				};
			</div>
<br />
			<div>
				<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">script</span><span style="color:#808080;">&gt;</span>
			</div>
<br />
			<div>
				//Sys_DictionaryController中添加代码，返回table数据
			</div>
			<div>
				&nbsp;&nbsp;[HttpPost,&nbsp;Route("getSelectorDemo")]
			</div>
			<div>
				&nbsp;&nbsp;public&nbsp;IActionResult&nbsp;GetSelectorDemo([FromBody]&nbsp;PageDataOptions&nbsp;options)
			</div>
			<div>
				&nbsp;&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//如果是自己写的代码，返回结果必须是
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//var&nbsp;data&nbsp;=&nbsp;new
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;&nbsp;&nbsp;&nbsp;rows&nbsp;=&nbsp;new&nbsp;List&lt;Sys_DictionaryList&gt;(),&nbsp;//返回的数据列表
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;&nbsp;&nbsp;&nbsp;total&nbsp;=&nbsp;1000&nbsp;&nbsp;//查询到的总行数
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//};
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PageGridData&lt;Sys_DictionaryList&gt;&nbsp;gridData=&nbsp;Sys_DictionaryListService.Instance.GetPageData(options);
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;Json(gridData);
			</div>
			<div>
				&nbsp;&nbsp;}
			</div>
<br />
<br />
<br />
<br />
		</div>
<br />
	</div>
</div> `,
          ],
          tips: ` 点击自定的义按钮后，再弹弹出自定义的这个vue页面`,
          img: [
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/32.png?imageMogr2/thumbnail/!50p",
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/33.png?imageMogr2/thumbnail/!50p",
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/34.png?imageMogr2/thumbnail/!50p",
          ],
        },
        {
          title: "编辑多图/文件上传",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:1.2;white-space:pre;">
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
          img:
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/11.png?imageMogr2/thumbnail/!50p",
        },

        {
          title: "编辑框级联操作(1)",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:1.2;white-space:pre;">
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormFields</span>.<span style="color:#9cdcfe;">ExpertName</span>&nbsp;=&nbsp;[];&nbsp;<span style="color:#6a9955;">//["北京","天坛"]</span>
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
          img:
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/14.png?imageMogr2/thumbnail/!50p",
        },
        {
          title: "编辑框级联操作(2)",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:1.2;white-space:pre;">
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormFields</span>.<span style="color:#9cdcfe;">ExpertName</span>&nbsp;=&nbsp;[];
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
          title: "编辑select触发只读",
          content: [
            `<span style="display:none;"></span><span style="line-height:2;font-size:18px;">
<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">getFormOption</span>(<span style="color:#9cdcfe;">field</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">let</span>&nbsp;<span style="color:#9cdcfe;">option</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormOptions</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">item</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">field</span>&nbsp;==&nbsp;<span style="color:#9cdcfe;">field</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">option</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">item</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#9cdcfe;">option</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onInit</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//获取[城市]字段下拉框的配置，并绑定onChange事件</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">var</span>&nbsp;<span style="color:#9cdcfe;">selectOption</span>&nbsp;=&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#dcdcaa;">getFormOption</span>(<span style="color:#ce9178;">'City'</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">selectOption</span>.<span style="color:#dcdcaa;">onChange</span>&nbsp;=&nbsp;(<span style="color:#9cdcfe;">val</span>,&nbsp;<span style="color:#9cdcfe;">item</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//触发onChange事件时，价格字段设置为只读</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">var</span>&nbsp;<span style="color:#9cdcfe;">priceOption</span>&nbsp;=&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#dcdcaa;">getFormOption</span>(<span style="color:#ce9178;">"AvgPrice"</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//如果select选中的值是[北京市]，将价格字段设置为只读,日期字段设置为'2020-08-26'</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">val</span>&nbsp;==&nbsp;<span style="color:#ce9178;">"北京市"</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#dcdcaa;">$set</span>(<span style="color:#9cdcfe;">priceOption</span>,&nbsp;<span style="color:#ce9178;">"disabled"</span>,&nbsp;<span style="color:#569cd6;">true</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormFields</span>.<span style="color:#9cdcfe;">Date</span>&nbsp;=&nbsp;<span style="color:#ce9178;">'2020-08-26'</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;<span style="color:#c586c0;">else</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#dcdcaa;">$set</span>(<span style="color:#9cdcfe;">priceOption</span>,&nbsp;<span style="color:#ce9178;">"disabled"</span>,&nbsp;<span style="color:#569cd6;">false</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormFields</span>.<span style="color:#9cdcfe;">Date</span>&nbsp;=&nbsp;<span style="color:#ce9178;">'2030-12-11'</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div>
</span><span style="line-height:1.5;font-size:18px;"></span><br />`,
          ],
          tips: ``,
          img:
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/27.png?imageMogr2/thumbnail/!50p",
        },
        {
          title: "编辑select触发级联",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:1.2;white-space:pre;">
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
	<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">/*如果是2020.09.11之后获取的代码，则不用此操作*/</span></div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormFields</span>[<span style="color:#9cdcfe;">select2</span>.<span style="color:#9cdcfe;">field</span>]&nbsp;=&nbsp;<span style="color:#9cdcfe;">source</span>.<span style="color:#9cdcfe;">length</span>&nbsp;&gt;&nbsp;<span style="color:#b5cea8;">0</span>&nbsp;?&nbsp;<span style="color:#9cdcfe;">source</span>[<span style="color:#b5cea8;">0</span>].<span style="color:#9cdcfe;">key</span>&nbsp;:&nbsp;<span style="color:#ce9178;">""</span>;
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
          img:
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/15.png?imageMogr2/thumbnail/!50p",
        },
        {
          title: "编辑框从表上传图片",
          content: [
            `点击从表列即可完成对从表图片或文件上传，参照菜单:【一对一与一对多】->【从表图片上传】`,
          ],
          tips: ` 从表图片上传，是对代码生成进行的扩展实现.按此方法可自行实现任意功能`,
          img:
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/10.png?imageMogr2/thumbnail/!50p",
        },
        {
          title: "编辑框从表第二种编辑",
          content: [
            `<div style="color:red;font-size:20px;">默认为单击行开启编辑，鼠标离开结束编辑,现支持点击表头或其他行结束编辑</div><div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onInit</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">detailOptions</span>.<span style="color:#9cdcfe;">clickEdit</span>=<span style="color:#569cd6;">true</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//下面的面代码不是必须项，自己根据需要实现</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">detailOptions</span>.<span style="color:#dcdcaa;">beginEdit</span>=(<span style="color:#9cdcfe;">row</span>,&nbsp;<span style="color:#9cdcfe;">column</span>,&nbsp;<span style="color:#9cdcfe;">index</span>)<span style="color:#569cd6;">=&gt;</span>{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">console</span>.<span style="color:#dcdcaa;">log</span>(<span style="color:#ce9178;">"开始编辑"</span>+<span style="color:#9cdcfe;">JSON</span>.<span style="color:#dcdcaa;">stringify</span>(<span style="color:#9cdcfe;">row</span>))
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">true</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">detailOptions</span>.<span style="color:#dcdcaa;">endEditBefore</span>=(<span style="color:#9cdcfe;">row</span>,&nbsp;<span style="color:#9cdcfe;">column</span>,&nbsp;<span style="color:#9cdcfe;">index</span>)<span style="color:#569cd6;">=&gt;</span>{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">console</span>.<span style="color:#dcdcaa;">log</span>(<span style="color:#ce9178;">"结束编辑前"</span>+<span style="color:#9cdcfe;">JSON</span>.<span style="color:#dcdcaa;">stringify</span>(<span style="color:#9cdcfe;">row</span>))
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">true</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">detailOptions</span>.<span style="color:#dcdcaa;">endEditAfter</span>=(<span style="color:#9cdcfe;">row</span>,&nbsp;<span style="color:#9cdcfe;">column</span>,&nbsp;<span style="color:#9cdcfe;">index</span>)<span style="color:#569cd6;">=&gt;</span>{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">console</span>.<span style="color:#dcdcaa;">log</span>(<span style="color:#ce9178;">"结束编辑后,这里会进行row字段验证"</span>+<span style="color:#9cdcfe;">JSON</span>.<span style="color:#dcdcaa;">stringify</span>(<span style="color:#9cdcfe;">row</span>))
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">true</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
</div>`,
          ],
          tips: ` 默认为单击行开启编辑，鼠标离开结束编辑,现支持点击表头或其他行结束编辑`,
          img:
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/38.png?imageMogr2/thumbnail/!50p",
        }, {
          title: "编辑表单数字最大/小值,字符串长度限制",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//事件扩展</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onInit</span>&nbsp;()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormOptions</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">item</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设置最大值与最小值</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">/*如果当前类型是字符串类型，min/max则为字符串的长度*/</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">field</span>&nbsp;==&nbsp;<span style="color:#ce9178;">"AvgPrice"</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">min</span>&nbsp;=&nbsp;-<span style="color:#b5cea8;">999</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">max</span>&nbsp;=&nbsp;<span style="color:#b5cea8;">100</span>;
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
          tips: ` --`,
          img:
            "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/46.png?45geMogr2/thumbnail/!50p",
        },

        {
          title: "编辑表单自定义验证",
          content: [`<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//事件扩展</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onInit</span>&nbsp;()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormOptions</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">item</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//自定义验证,适用所有类型的字段,同应适用查询表单searchFormOptions</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">field</span>&nbsp;==&nbsp;<span style="color:#ce9178;">"AvgPrice"</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#dcdcaa;">validator</span>&nbsp;=&nbsp;(<span style="color:#9cdcfe;">rule</span>,&nbsp;<span style="color:#9cdcfe;">val</span>,&nbsp;<span style="color:#9cdcfe;">callback</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">val</span>&nbsp;!=&nbsp;<span style="color:#ce9178;">'369'</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#ce9178;">'必须输入【369】'</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#ce9178;">""</span>;
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
</div>` ],
          tips: ` `,
          img: "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/47.png?45geMogr2/thumbnail/!50p"

        },


        {
          title: "数组对象转换为tree",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:1.2;white-space:pre;">
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
          title: "级联(后台加载数据源)",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:1.2;white-space:pre;">
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormFields</span>.<span style="color:#9cdcfe;">ExpertName</span>&nbsp;=&nbsp;[];&nbsp;<span style="color:#6a9955;">//["北京","天坛"]</span>
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
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:1.2;white-space:pre;">
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormFields</span>.<span style="color:#9cdcfe;">ExpertName</span>&nbsp;=&nbsp;[];&nbsp;<span style="color:#6a9955;">//["北京","天坛"]</span>
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
</div><div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:1.2;white-space:pre;">
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormFields</span>.<span style="color:#9cdcfe;">ExpertName</span>&nbsp;=&nbsp;[];&nbsp;<span style="color:#6a9955;">//["北京","天坛"]</span>
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
        }, {
          title: "级联终极版(代码生成)",
          content: [`<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<p>
		<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
      <br />
      <div style="color:red;">2020.11.01更新后的才可以使用</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;代码生成级联操作,除了自定sql数据源，其他全部用框架完成：</span>
			</div>
<br />
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;1、配置下拉框数据源(必须是自定义sql),格式SELECT&nbsp;Role_Id&nbsp;AS&nbsp;id,parentId,Role_Id&nbsp;AS&nbsp;[key],RoleName&nbsp;AS&nbsp;value&nbsp;FROM&nbsp;dbo.Sys_Role</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">/*注意上面的sql字段id,parentId,key,value是必须的&nbsp;*/</span>&nbsp;
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//2、代码生成器页面查询与编辑类型选择【级联】,数据源选刚刚定义的sql</span>
			</div>
<br />
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">/*必须更新代码才能使用:前端basic文件夹、builder->builderData.js、utilities->common.js，后台Sys_TableInfoService.cs*/</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">/*如果没有修改过框架源码，直接覆盖文件*/</span>
			</div>
<br />
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onInit</span>&nbsp;()&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//这些配置不是必须的</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormOptions</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">item</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">field</span>&nbsp;==&nbsp;<span style="color:#ce9178;">'ParentId'</span>)&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">title</span>&nbsp;=&nbsp;<span style="color:#ce9178;">"上级角色"</span>;
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设置任意节点都能选中(默认只能选中最后一个节点)</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//item.changeOnSelect&nbsp;=&nbsp;true;</span>
			</div>
<br />
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//格式化数据显示(只显示当前选中的最后一个节点)，默认会显示所有节点的数据</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;item.formatter&nbsp;=&nbsp;nodeArr&nbsp;=&gt;&nbsp;{</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;if&nbsp;(!nodeArr.length)&nbsp;{</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;"";</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;}</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;return&nbsp;nodeArr[nodeArr.length&nbsp;-&nbsp;1];</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;};</span>
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
		</div>
	</p>
</div>
<span style="display:none;"></span>`],
          tips: ``,
          img: "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/44.png?imageMogr2/thumbnail/!50p",
        },

        {
          title: "http请求",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:1.2;white-space:pre;">
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
          title: "子父组件传值(vuex)",
          content: [
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:1.2;white-space:pre;">
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
            `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:1.2;white-space:pre;">
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
          title: "excel导入增加参数",
          content: [`<div style="color:red;">excel导入时添加其他参数到后台需要2020.10.16更新前端basic组件</div>`,
            `<div style="color:red;">此处以App_Transaction.js为例</div>`,
            `<div  style="font-size:20px;    background: #171717;
    color: white;">//App_Transaction.js文件</div><div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		<span style="color:#569cd6;">var</span>&nbsp;<span style="color:#9cdcfe;">extension</span>&nbsp;=&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#9cdcfe;">components</span><span style="color:#9cdcfe;">:</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//动态扩充组件或组件路径</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//表单header、content、footer对应位置扩充的组件</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">gridHeader</span><span style="color:#9cdcfe;">:</span>&nbsp;()&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;<span style="color:#569cd6;">import</span>(<span style="color:#ce9178;">"./App_TransactionGridHeader.vue"</span>),&nbsp;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">gridBody</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">""</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">gridFooter</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">""</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//弹出框(修改、编辑、查看)header、content、footer对应位置扩充的组件</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">modelHeader</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">""</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">modelBody</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">""</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">modelFooter</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">""</span>
	</div>
	<div>
		&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#9cdcfe;">buttons</span><span style="color:#9cdcfe;">:</span>&nbsp;[],&nbsp;<span style="color:#6a9955;">//扩展的按钮</span>
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#9cdcfe;">methods</span><span style="color:#9cdcfe;">:</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//事件扩展</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">import</span>()&nbsp;{<span style="color:#6a9955;">//覆盖导入事件</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">gridHeader</span>.<span style="color:#dcdcaa;">openModel</span>();
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;}
	</div>
	<div>
		};
	</div>
	<div>
		<span style="color:#c586c0;">export</span>&nbsp;<span style="color:#c586c0;">default</span>&nbsp;<span style="color:#9cdcfe;">extension</span>;
	</div>
<br />
</div>
<span style="display:none;"></span>
<div  style="font-size:20px;background: #171717;
	color: white;">//App_TransactionGridHeader.vue文件</div>
	<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		<span style="display:none;"></span>
		<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
			<div>
				<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">template</span><span style="color:#808080;">&gt;</span>
			</div>
			<div>
				&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#4ec9b0;">VolBox</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">model</span>.<span style="color:#9cdcfe;">sync</span>="<span style="color:#9cdcfe;">model</span>"
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title</span>=<span style="color:#ce9178;">"弹出框标题"</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">height</span>="<span style="color:#b5cea8;">325</span>"
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">width</span>="<span style="color:#b5cea8;">600</span>"
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">padding</span>="<span style="color:#b5cea8;">15</span>"
			</div>
			<div>
				&nbsp;&nbsp;<span style="color:#808080;">&gt;</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">div</span>&nbsp;<span style="color:#9cdcfe;">style</span>=<span style="color:#ce9178;">"display:&nbsp;flex"</span><span style="color:#808080;">&gt;</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#4ec9b0;">Input</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">style</span>=<span style="color:#ce9178;">"padding-bottom:&nbsp;10px;&nbsp;margin-right:&nbsp;10px"</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">v-model</span>="<span style="color:#9cdcfe;">value1</span>"
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">placeholder</span>=<span style="color:#ce9178;">"参数1"</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/<span style="color:#808080;">&gt;</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#4ec9b0;">Input</span>&nbsp;<span style="color:#9cdcfe;">v-model</span>="<span style="color:#9cdcfe;">value2</span>"&nbsp;<span style="color:#9cdcfe;">placeholder</span>=<span style="color:#ce9178;">"参数2"</span>&nbsp;/<span style="color:#808080;">&gt;</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">div</span><span style="color:#808080;">&gt;</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#4ec9b0;">UploadExcel</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">url</span>="<span style="color:#9cdcfe;">url</span>"
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">template</span>="<span style="color:#9cdcfe;">template</span>"
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">importExcelBefore</span>="<span style="color:#9cdcfe;">importExcelBefore</span>"
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&gt;&lt;/</span><span style="color:#4ec9b0;">UploadExcel</span><span style="color:#808080;">&gt;</span>
			</div>
			<div>
				&nbsp;&nbsp;<span style="color:#808080;">&lt;/</span><span style="color:#4ec9b0;">VolBox</span><span style="color:#808080;">&gt;</span>
			</div>
			<div>
				<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">template</span><span style="color:#808080;">&gt;</span>
			</div>
			<div>
				<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">script</span><span style="color:#808080;">&gt;</span>
			</div>
			<div>
				<span style="color:#c586c0;">export</span>&nbsp;<span style="color:#c586c0;">default</span>&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;<span style="color:#9cdcfe;">components:</span>&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">VolBox</span><span style="color:#9cdcfe;">:</span>&nbsp;()&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;<span style="color:#569cd6;">import</span>(<span style="color:#ce9178;">"@/components/basic/VolBox.vue"</span>),
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">UploadExcel</span><span style="color:#9cdcfe;">:</span>&nbsp;()&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;<span style="color:#569cd6;">import</span>(<span style="color:#ce9178;">"@/components/basic/UploadExcel.vue"</span>),
			</div>
			<div>
				&nbsp;&nbsp;},
			</div>
			<div>
				&nbsp;&nbsp;<span style="color:#dcdcaa;">data</span>()&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">url:</span>&nbsp;<span style="color:#ce9178;">"api/App_Transaction/import1"</span>,&nbsp;<span style="color:#6a9955;">//导入的路径&nbsp;</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">template:</span>&nbsp;{&nbsp;<span style="color:#6a9955;">//下载模板的配置</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">url:</span>&nbsp;<span style="color:#ce9178;">"api/App_Transaction/DownLoadTemplate"</span>,<span style="color:#6a9955;">//下载模板的路径&nbsp;</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">fileName:</span>&nbsp;<span style="color:#ce9178;">"测试参数"</span>,&nbsp;<span style="color:#6a9955;">//模板的文件名</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">model:</span>&nbsp;<span style="color:#569cd6;">false</span>,
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">value1:</span>&nbsp;<span style="color:#ce9178;">""</span>,&nbsp;<span style="color:#6a9955;">//参数1</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">value2:</span>&nbsp;<span style="color:#ce9178;">""</span>,<span style="color:#6a9955;">//参数2</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;};
			</div>
			<div>
				&nbsp;&nbsp;},
			</div>
			<div>
				&nbsp;&nbsp;<span style="color:#9cdcfe;">methods:</span>&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">openModel</span>()&nbsp;{
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">model</span>&nbsp;=&nbsp;<span style="color:#569cd6;">true</span>;
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;},
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">importExcelBefore</span>(<span style="color:#9cdcfe;">formData</span>)&nbsp;{&nbsp;<span style="color:#6a9955;">//点击上传时，将其他参数提交到后台</span>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">formData</span>.<span style="color:#dcdcaa;">append</span>(<span style="color:#ce9178;">"val1"</span>,&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">value1</span>);
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">formData</span>.<span style="color:#dcdcaa;">append</span>(<span style="color:#ce9178;">"val2"</span>,&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">value2</span>);
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">true</span>;
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;},
			</div>
			<div>
				&nbsp;&nbsp;},
			</div>
			<div>
				};
			</div>
			<div>
				<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">script</span><span style="color:#808080;">&gt;</span>
			</div>
		</div>
<br />
	</div>
</div>
<span style="display:none;"></span>
<div style="font-size:20px;background: #171717;
	color: white;">//后台控制器方法App_TransactionController</div><div>
	<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; [<span style="color:#9cdcfe;">HttpPost</span>,&nbsp;<span style="color:#dcdcaa;">Route</span>(<span style="color:#ce9178;">"Import1"</span>)]
		</div>
		<div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[<span style="color:#dcdcaa;">ApiActionPermission</span>(<span style="color:#9cdcfe;">Core</span>.<span style="color:#9cdcfe;">Enums</span>.<span style="color:#9cdcfe;">ActionPermissionOptions</span>.<span style="color:#9cdcfe;">Import</span>)]
		</div>
		<div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">public</span>&nbsp;<span style="color:#9cdcfe;">ActionResult</span>&nbsp;<span style="color:#dcdcaa;">Import1</span>(<span style="color:#9cdcfe;">List</span>&lt;<span style="color:#9cdcfe;">IFormFile</span>&gt;&nbsp;<span style="color:#9cdcfe;">fileInput</span>,&nbsp;<span style="color:#9cdcfe;">string</span>&nbsp;<span style="color:#9cdcfe;">val1</span>,&nbsp;<span style="color:#9cdcfe;">string</span>&nbsp;<span style="color:#9cdcfe;">val2</span>)
		</div>
		<div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
		</div>
		<div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">Console</span>.<span style="color:#dcdcaa;">WriteLine</span>(<span style="color:#9cdcfe;">val1</span>);
		</div>
		<div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">Console</span>.<span style="color:#dcdcaa;">WriteLine</span>(<span style="color:#9cdcfe;">val2</span>);
		</div>
		<div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#dcdcaa;">Json</span>(<span style="color:#9cdcfe;">Service</span>.<span style="color:#dcdcaa;">Import</span>(<span style="color:#9cdcfe;">fileInput</span>));
		</div>
		<div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
		</div>
	</div>
<br />
</div>`],
          tips: ` excel导入时添加其他参数到后台需要2020.10.16更新前端basic组件`,
          img:
            ["https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/39.png?imageMogr2/thumbnail/!50p", "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/40.png?imageMogr2/thumbnail/!50p"]
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
    width: 200px;
    padding: 0 10px;
    bottom: 20px;
    top: 81px;
    li {
      padding: 10px 5px;
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
