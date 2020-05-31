let codeString = {
  icons: `<div>
    <div class="cnblogs_code">
    <pre>   &lt;template&gt;
      &lt;div&gt;
        &lt;Icons :on-select="onSelect"&gt;&lt;/Icons&gt;
      &lt;/div&gt;
    &lt;/template&gt;
    &lt;script&gt;<span style="color: #000000;">
    import Icons from </span>"@/components/basic/Icons.vue"<span style="color: #000000;">;
    export </span><span style="color: #0000ff;">default</span><span style="color: #000000;"> {
      data() {},
      components: { Icons },
      methods: {
        onSelect(icon) {
          </span><span style="color: #0000ff;">this</span><span style="color: #000000;">.$Message.error(icon);
        }
      }
    };
    </span>&lt;/script&gt;</pre>
    </div>
    <p>&nbsp;</p>
    </div>
    <script type="text/javascript">// <![CDATA[
    import Icons from "@/components/basic/Icons.vue";
    export default {
      data() {},
      components: { Icons },
      methods: {
        onSelect(icon) {
          this.$Message.error(icon);
        }
      }
    };
    // ]]></script>`,
  box: `<div>
    <div>
    <div class="cnblogs_code">
    <pre>&lt;template&gt;
      &lt;div&gt;
        &lt;Button type="info" @click="model=!model"&gt;弹出框&lt;/Button&gt;
        &lt;<span style="color: #000000;">VolBox
          icon</span>="ios-chatbubbles"<span style="color: #000000;">
          :model.sync</span>="model"<span style="color: #000000;">
          title</span>="弹出框标题"<span style="color: #000000;">
          :height</span>="400"<span style="color: #000000;">
          :width</span>="700"<span style="color: #000000;">
          :padding</span>="15"
        &gt;
          &lt;div&gt;弹出框内容&lt;/div&gt;
          &lt;!-- footer 这里不写，默认有一个关闭按钮 --&gt;
          &lt;div slot="footer"&gt;
            &lt;Button type="default" @click="()=&gt;{this.$Message.error('点击确认')}"&gt;确认&lt;/Button&gt;
            &lt;Button type="default" @click="()=&gt;{model=false}"&gt;点击关闭弹出框&lt;/Button&gt;
          &lt;/div&gt;
        &lt;/VolBox&gt;
        &lt;div&gt;
          &lt;docParamTable name="box"&gt;&lt;/docParamTable&gt;
        &lt;/div&gt;
      &lt;/div&gt;
    &lt;/template&gt;
    &lt;script&gt;<span style="color: #000000;">
    import VolBox from </span>"@/components/basic/VolBox.vue"<span style="color: #000000;">;
    export </span><span style="color: #0000ff;">default</span><span style="color: #000000;"> {
      data() {
        </span><span style="color: #0000ff;">return</span><span style="color: #000000;"> {
          model: </span><span style="color: #0000ff;">false</span><span style="color: #000000;">
        };
      },
      components: { VolBox },
      methods: {}
    };
    </span>&lt;/script&gt;</pre>
    </div>
    <p>&nbsp;</p>
    </div>
    </div>
    <script type="text/javascript">// <![CDATA[
    import VolBox from "@/components/basic/VolBox.vue";
    export default {
      data() {
        return {
          model: false
        };
      },
      components: { VolBox },
      methods: {}
    };
    // ]]></script>`,
  form: `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">template</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">div</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">VolForm</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">ref</span>=<span style="color:#ce9178;">"myform"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">label-width</span>="<span style="color:#b5cea8;">150</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">loadKey</span>="<span style="color:#569cd6;">true</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">formFileds</span>="<span style="color:#9cdcfe;">formFileds1</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">formRules</span>="<span style="color:#9cdcfe;">formRules1</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&gt;&lt;/</span><span style="color:#569cd6;">VolForm</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">div</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">Button</span>&nbsp;<span style="color:#9cdcfe;">type</span>=<span style="color:#ce9178;">"info"</span>&nbsp;<span style="color:#9cdcfe;">long</span>&nbsp;@<span style="color:#9cdcfe;">click</span>="<span style="color:#9cdcfe;">reset</span>"<span style="color:#808080;">&gt;</span>重置表单<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">Button</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">div</span><span style="color:#808080;">&gt;</span>
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
		<span style="color:#c586c0;">import</span>&nbsp;<span style="color:#9cdcfe;">VolForm</span>&nbsp;<span style="color:#c586c0;">from</span>&nbsp;<span style="color:#ce9178;">"@/components/basic/VolForm.vue"</span>;
	</div>
	<div>
		<span style="color:#c586c0;">export</span>&nbsp;<span style="color:#c586c0;">default</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#9cdcfe;">components:</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">VolForm</span>&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#9cdcfe;">methods:</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">reset</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">myform</span>.<span style="color:#dcdcaa;">reset</span>();
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$Message</span>.<span style="color:#dcdcaa;">error</span>(<span style="color:#ce9178;">"表单已重置"</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;}
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">formFileds1:</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">Variety:</span>&nbsp;<span style="color:#b5cea8;">1</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">AgeRange:</span>&nbsp;<span style="color:#ce9178;">""</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">DateRange:</span>&nbsp;[],
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">City:</span>&nbsp;<span style="color:#ce9178;">"北京市"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">AvgPrice:</span>&nbsp;<span style="color:#b5cea8;">8.88</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">number1:</span>&nbsp;<span style="color:#b5cea8;">20</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">mail:</span>&nbsp;<span style="color:#ce9178;">""</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">Date:</span>&nbsp;<span style="color:#ce9178;">""</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">IsTop:</span>&nbsp;<span style="color:#ce9178;">""</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">Fruits:</span>&nbsp;[],
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">Other:</span>&nbsp;<span style="color:#ce9178;">""</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">extra1:</span>&nbsp;<span style="color:#ce9178;">"添加其他标签"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">extra2:</span>&nbsp;<span style="color:#ce9178;">"添加其他标签可点击"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">Switch:</span>&nbsp;<span style="color:#b5cea8;">1</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">SelectList:</span>&nbsp;[<span style="color:#ce9178;">"北京市"</span>,&nbsp;<span style="color:#ce9178;">"上海市"</span>,&nbsp;<span style="color:#ce9178;">"天津市"</span>,&nbsp;<span style="color:#ce9178;">"广州市"</span>,&nbsp;<span style="color:#ce9178;">"重庆市"</span>],
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">remoteSearch:</span>&nbsp;<span style="color:#ce9178;">""</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">readonlyText:</span>&nbsp;<span style="color:#ce9178;">"还没想好...."</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//多个图片可以用逗号隔开</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">readonlyImg:</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">"https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x2.jpg"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">ProImg:</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">"https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x3.jpg"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">cascader1:</span>&nbsp;[<span style="color:#ce9178;">"beijing"</span>,&nbsp;<span style="color:#ce9178;">"tiantan"</span>],&nbsp;<span style="color:#6a9955;">//级联默认值2020.05.31</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">cascader2:</span>&nbsp;[]&nbsp;<span style="color:#6a9955;">//懒加载的级联默认值</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">formRules1:</span>&nbsp;[
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//两列的表单，formRules数据格式为:[[{},{}]]</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">dataKey:</span>&nbsp;<span style="color:#ce9178;">"city"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"自动绑定数据源"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">required:</span>&nbsp;<span style="color:#569cd6;">true</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"City"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">data:</span>&nbsp;[],
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"select"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"手动绑定数据源"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">dataKey:</span>&nbsp;<span style="color:#ce9178;">"age"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">placeholder:</span>&nbsp;<span style="color:#ce9178;">"在这里可设置提示描述"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//如果这里绑定了data数据，后台不会加载此数据源</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">data:</span>&nbsp;[
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">key:</span>&nbsp;<span style="color:#b5cea8;">1</span>,&nbsp;<span style="color:#9cdcfe;">value:</span>&nbsp;<span style="color:#ce9178;">"是"</span>&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">key:</span>&nbsp;<span style="color:#b5cea8;">0</span>,&nbsp;<span style="color:#9cdcfe;">value:</span>&nbsp;<span style="color:#ce9178;">"否"</span>&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;],
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">required:</span>&nbsp;<span style="color:#569cd6;">false</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"Variety"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"select"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;],
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"手机号"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">required:</span>&nbsp;<span style="color:#569cd6;">true</span>,&nbsp;<span style="color:#6a9955;">//设置为必选项</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"AgeRange"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"phone"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onKeyPress</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#9cdcfe;">$event</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">$event</span>.<span style="color:#9cdcfe;">keyCode</span>&nbsp;==&nbsp;<span style="color:#b5cea8;">13</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$Message</span>.<span style="color:#dcdcaa;">error</span>(<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">formFileds1</span>.<span style="color:#9cdcfe;">AgeRange</span>&nbsp;+&nbsp;<span style="color:#ce9178;">""</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"date日期"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"Date"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"datetime"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;],
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"多选日期"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">range:</span>&nbsp;<span style="color:#569cd6;">true</span>,&nbsp;<span style="color:#6a9955;">//设置为true可以选择开始与结束日期</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">required:</span>&nbsp;<span style="color:#569cd6;">false</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"DateRange"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"date"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"number"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"数字"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">required:</span>&nbsp;<span style="color:#569cd6;">true</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">placeholder:</span>&nbsp;<span style="color:#ce9178;">"你可以自己定义placeholder显示的文字"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"number1"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;],
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"decimal"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"最大最小decimal值"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">max:</span>&nbsp;<span style="color:#b5cea8;">10</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">min:</span>&nbsp;<span style="color:#b5cea8;">2</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">required:</span>&nbsp;<span style="color:#569cd6;">true</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"AvgPrice"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"邮箱"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"mail"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">range:</span>&nbsp;<span style="color:#569cd6;">true</span>,&nbsp;<span style="color:#6a9955;">//设置为true可以选择开始与结束日期</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">required:</span>&nbsp;<span style="color:#569cd6;">false</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"mail"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;],
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"额外标签"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">required:</span>&nbsp;<span style="color:#569cd6;">true</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"text"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"extra1"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">extra:</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">icon:</span>&nbsp;<span style="color:#ce9178;">"ios-search"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">style:</span>&nbsp;<span style="color:#ce9178;">"color:red"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">text:</span>&nbsp;<span style="color:#ce9178;">"这里可以显示额外标签"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"可点击额外标签"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"extra2"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"text"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">extra:</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">icon:</span>&nbsp;<span style="color:#ce9178;">"ios-search"</span>,&nbsp;<span style="color:#6a9955;">//显示图标</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">text:</span>&nbsp;<span style="color:#ce9178;">"点击可触发事件"</span>,&nbsp;<span style="color:#6a9955;">//显示文本</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//触发事件</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">click</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#9cdcfe;">item</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$Message</span>.<span style="color:#dcdcaa;">error</span>(<span style="color:#ce9178;">"点击标签触发的事件"</span>);
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;],
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">dataKey:</span>&nbsp;<span style="color:#ce9178;">"city"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"多选"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">required:</span>&nbsp;<span style="color:#569cd6;">true</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"SelectList"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">data:</span>&nbsp;[],
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"selectList"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">dataKey:</span>&nbsp;<span style="color:#ce9178;">"city"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"远程搜索"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">required:</span>&nbsp;<span style="color:#569cd6;">true</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"remoteSearch"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">remote:</span>&nbsp;<span style="color:#569cd6;">true</span>,&nbsp;<span style="color:#6a9955;">//远程搜索(从后台字典搜索,只会搜索自定义sql,后台如果返回的数据量较大，请将字典维护的sql取top)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//url:'api/xx/xx'从指定url搜索&nbsp;返回格式必须是[{key:'xxxx',value:'xxx'}]</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">data:</span>&nbsp;[],
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"select"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;],
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"自定义验证"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">required:</span>&nbsp;<span style="color:#569cd6;">true</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"Other"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">validator</span><span style="color:#9cdcfe;">:</span>&nbsp;(<span style="color:#9cdcfe;">rule</span>,&nbsp;<span style="color:#9cdcfe;">val</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">val</span>&nbsp;!=&nbsp;<span style="color:#ce9178;">"234"</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#ce9178;">"必须输入【234】"</span>;
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"Switch"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"Switch"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">dataKey:</span>&nbsp;<span style="color:#ce9178;">"enable"</span>,&nbsp;<span style="color:#6a9955;">//这里会从后台自动绑定数据源</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">data:</span>&nbsp;[],
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">required:</span>&nbsp;<span style="color:#569cd6;">false</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"switch"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;],
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//readonlyImg</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"checkbox"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//如果这里绑定了data数据，后台不会加载此数据源</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">data:</span>&nbsp;[
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">key:</span>&nbsp;<span style="color:#b5cea8;">0</span>,&nbsp;<span style="color:#9cdcfe;">value:</span>&nbsp;<span style="color:#ce9178;">"冬瓜"</span>&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">key:</span>&nbsp;<span style="color:#b5cea8;">1</span>,&nbsp;<span style="color:#9cdcfe;">value:</span>&nbsp;<span style="color:#ce9178;">"西瓜"</span>&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">key:</span>&nbsp;<span style="color:#b5cea8;">2</span>,&nbsp;<span style="color:#9cdcfe;">value:</span>&nbsp;<span style="color:#ce9178;">"南瓜"</span>&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">key:</span>&nbsp;<span style="color:#b5cea8;">3</span>,&nbsp;<span style="color:#9cdcfe;">value:</span>&nbsp;<span style="color:#ce9178;">"哈密瓜"</span>&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;],
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"Fruits"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"checkbox"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"字段只读"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">readonly:</span>&nbsp;<span style="color:#569cd6;">true</span>,&nbsp;<span style="color:#6a9955;">//设置readonly或disabled都行</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"readonlyText"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"text"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;],
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//readonlyImg</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"级联1"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//如果这里绑定了data数据，后台不会加载此数据源</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">data:</span>&nbsp;[
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">value:</span>&nbsp;<span style="color:#ce9178;">"beijing"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">label:</span>&nbsp;<span style="color:#ce9178;">"北京"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">loading:</span>&nbsp;<span style="color:#569cd6;">false</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">children:</span>&nbsp;[
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">value:</span>&nbsp;<span style="color:#ce9178;">"gugong"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">label:</span>&nbsp;<span style="color:#ce9178;">"故宫"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">value:</span>&nbsp;<span style="color:#ce9178;">"tiantan"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">label:</span>&nbsp;<span style="color:#ce9178;">"天坛"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">value:</span>&nbsp;<span style="color:#ce9178;">"wangfujing"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">label:</span>&nbsp;<span style="color:#ce9178;">"王府井"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;]
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;],
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"cascader1"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"cascader"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">required:</span>&nbsp;<span style="color:#569cd6;">true</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//格式化显示(非必须)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">formatter</span><span style="color:#9cdcfe;">:</span>&nbsp;(<span style="color:#9cdcfe;">labels</span>,&nbsp;<span style="color:#9cdcfe;">selectedData</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">const</span>&nbsp;<span style="color:#51b6c4;">index</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">labels</span>.<span style="color:#9cdcfe;">length</span>&nbsp;-&nbsp;<span style="color:#b5cea8;">1</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">const</span>&nbsp;<span style="color:#51b6c4;">data</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">selectedData</span>[<span style="color:#9cdcfe;">index</span>]&nbsp;||&nbsp;<span style="color:#569cd6;">false</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">data</span>&nbsp;&amp;&amp;&nbsp;<span style="color:#9cdcfe;">data</span>.<span style="color:#9cdcfe;">label</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#9cdcfe;">labels</span>[<span style="color:#9cdcfe;">index</span>]&nbsp;+&nbsp;<span style="color:#ce9178;">"&nbsp;-&nbsp;"</span>&nbsp;+&nbsp;<span style="color:#9cdcfe;">data</span>.<span style="color:#9cdcfe;">label</span>&nbsp;+&nbsp;<span style="color:#ce9178;">"&nbsp;-&nbsp;(格式化测试)"</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#9cdcfe;">labels</span>[<span style="color:#9cdcfe;">index</span>];
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"级联懒加载"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//如果这里绑定了data数据，后台不会加载此数据源</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">data:</span>&nbsp;[
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">value:</span>&nbsp;<span style="color:#ce9178;">"zhejiang"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">label:</span>&nbsp;<span style="color:#ce9178;">"浙江"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">loading:</span>&nbsp;<span style="color:#569cd6;">false</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">children:</span>&nbsp;[]
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;],
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"cascader2"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">required:</span>&nbsp;<span style="color:#569cd6;">true</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"cascader"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//懒加载数据源</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">loadData</span><span style="color:#9cdcfe;">:</span>&nbsp;(<span style="color:#9cdcfe;">item</span>,&nbsp;<span style="color:#9cdcfe;">callback</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;item.children&nbsp;=&nbsp;[{</span>
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">callback</span>();
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;});
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;],
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"备注"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">required:</span>&nbsp;<span style="color:#569cd6;">true</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"IsTop"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">min:</span>&nbsp;<span style="color:#b5cea8;">3</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">max:</span>&nbsp;<span style="color:#b5cea8;">5</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">placeholder:</span>&nbsp;<span style="color:#ce9178;">"至少输入3个字符,最多只能输入5个字符"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">colSize:</span>&nbsp;<span style="color:#b5cea8;">12</span>,&nbsp;<span style="color:#6a9955;">//设置12，此列占100%宽度</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"textarea"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;],
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"图片只读"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">readonly:</span>&nbsp;<span style="color:#569cd6;">true</span>,&nbsp;<span style="color:#6a9955;">//设置readonly或disabled都行</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"readonlyImg"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"img"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"可上传图片"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"ProImg"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"img"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">maxSize:</span>&nbsp;<span style="color:#b5cea8;">0.2</span>,&nbsp;<span style="color:#6a9955;">//最大0.2M图片</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//上传参数可参照volupload组件</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">url:</span>&nbsp;<span style="color:#ce9178;">"/api/App_Appointment/Upload"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;]
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;]
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;};
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
<br />
</div>`,
  editTableKeep:`&lt;template&gt;<br />
  &nbsp; &lt;div&gt;<br />
  &nbsp; &nbsp; &lt;div class="vol-demo keep-edit"&gt;<br />
  &nbsp; &nbsp; &nbsp; &lt;VolHeader icon="md-podium" text="始终开启编辑"&gt;<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &lt;div slot="content"&gt;配置columns属性edit.keep=true即可始终开启编辑状态..&lt;/div&gt;<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &lt;div style="text-align: right;"&gt;<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Button type="info" size="small" ghost &gt;还没好想好&lt;/Button&gt;<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &lt;/div&gt;<br />
  &nbsp; &nbsp; &nbsp; &lt;/VolHeader&gt;<br />
  &nbsp; &nbsp; &nbsp; &lt;vol-table ref="table3" :columns="columns" :index="true" :tableData="tableData"&gt;&lt;/vol-table&gt;<br />
  &nbsp; &nbsp; &lt;/div&gt;<br />
  &nbsp; &nbsp; &lt;!-- 上传图片弹出框 --&gt;<br />
  &nbsp; &nbsp; &lt;VolBox<br />
  &nbsp; &nbsp; &nbsp; icon="ios-chatbubbles"<br />
  &nbsp; &nbsp; &nbsp; :model.sync="model"<br />
  &nbsp; &nbsp; &nbsp; title="选择图片"<br />
  &nbsp; &nbsp; &nbsp; :height="220"<br />
  &nbsp; &nbsp; &nbsp; :url="url"<br />
  &nbsp; &nbsp; &nbsp; :width="520"<br />
  &nbsp; &nbsp; &nbsp; :desc="true"<br />
  &nbsp; &nbsp; &nbsp; :padding="15"<br />
  &nbsp; &nbsp; &gt;<br />
  &nbsp; &nbsp; &nbsp; &lt;VolUpload<br />
  &nbsp; &nbsp; &nbsp; &nbsp; style="text-align: center; border: 1px dotted #FF9800;padding: 20px;"<br />
  &nbsp; &nbsp; &nbsp; &nbsp; :autoUpload="false"<br />
  &nbsp; &nbsp; &nbsp; &nbsp; :multiple="true"<br />
  &nbsp; &nbsp; &nbsp; &nbsp; :url="url"<br />
  &nbsp; &nbsp; &nbsp; &nbsp; :max-file="3"<br />
  &nbsp; &nbsp; &nbsp; &nbsp; :img="true"<br />
  &nbsp; &nbsp; &nbsp; &nbsp; :fileInfo="fileInfo"<br />
  &nbsp; &nbsp; &nbsp; &nbsp; :upload-after="uploadAfter"<br />
  &nbsp; &nbsp; &nbsp; &gt;<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &lt;div&gt;选择图片&lt;/div&gt;<br />
  &nbsp; &nbsp; &nbsp; &lt;/VolUpload&gt;<br />
  &nbsp; &nbsp; &lt;/VolBox&gt;<br />
  &nbsp; &lt;/div&gt;<br />
  &lt;/template&gt;<br />
  &lt;script&gt;<br />
  import VolBox from "@/components/basic/VolBox.vue";<br />
  import VolTable from "@/components/basic/VolTable.vue";<br />
  import VolUpload from "@/components/basic/VolUpload.vue";<br />
  import VolHeader from "@/components/basic/VolHeader.vue";<br />
  <br />
  export default {<br />
  &nbsp; components: { VolTable, VolBox, VolHeader, VolUpload },<br />
  &nbsp; data() {<br />
  &nbsp; &nbsp; return {<br />
  &nbsp; &nbsp; &nbsp; url: "/api/app_news/upload", //使用后台自带的上传文件方法，也可以自定义方法上传<br />
  &nbsp; &nbsp; &nbsp; uploadRow: {},<br />
  &nbsp; &nbsp; &nbsp; fileInfo: [],<br />
  &nbsp; &nbsp; &nbsp; model: false,<br />
  &nbsp; &nbsp; &nbsp; tableData: [<br />
  &nbsp; &nbsp; &nbsp; &nbsp; {<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; userName: "拉美西斯",<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; imgs:<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x2.jpg",<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; enable: 1,<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; date: "2020-03-18 17:45:54"<br />
  &nbsp; &nbsp; &nbsp; &nbsp; },<br />
  &nbsp; &nbsp; &nbsp; &nbsp; {<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; userName: "梁什么伟",<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; imgs:<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x2.jpg",<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; enable: 0,<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; date: "2020-03-20 12:20:30"<br />
  &nbsp; &nbsp; &nbsp; &nbsp; }<br />
  &nbsp; &nbsp; &nbsp; ],<br />
  &nbsp; &nbsp; &nbsp; columns: [<br />
  &nbsp; &nbsp; &nbsp; &nbsp; {<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; field: "userName",<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; title: "用户名",<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; require: true,<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; edit: { type: "text", keep: true },<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; width: 150<br />
  &nbsp; &nbsp; &nbsp; &nbsp; },<br />
  &nbsp; &nbsp; &nbsp; &nbsp; {<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; field: "imgs",<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; title: "图文介绍",<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; type: "img",<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; width: 200<br />
  &nbsp; &nbsp; &nbsp; &nbsp; },<br />
  &nbsp; &nbsp; &nbsp; &nbsp; {<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; field: "upload",<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; title: "上传头像",<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; width: 160,<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; formatter: () =&gt; {<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return "&lt;div class='img-btn'&gt;选择图片&lt;/div&gt;";<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; },<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; click: (row, column, event) =&gt; {<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; this.uploadRow = row; //记录当前上传图片的行<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; //清空上传组件的默认图片<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; this.fileInfo.splice(0);<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; //如果当前的row行有图片，直接将图片添加上传组件中<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (row.imgs) {<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; let _imgs = row.imgs.split(",");<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; for (let i = 0; i &lt; _imgs.length; i++) {<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; this.fileInfo.push({ path: _imgs[i], name: "11" });<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; this.model = true;<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br />
  &nbsp; &nbsp; &nbsp; &nbsp; },<br />
  &nbsp; &nbsp; &nbsp; &nbsp; {<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; field: "enable",<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; title: "是否可用",<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; require: true,<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; width: 130,<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; edit: { type: "switch", keep: true },<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bind: {<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; //如果后面返回的数据为数据源的数据，请配置此bind属性，可以从后台字典数据源加载，也只以直接写上<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; key: "audit",<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; data: [<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; { key: 0, value: "否" },<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; { key: 1, value: "是" }<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ]<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; },<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; onChange: (row, column, data, value) =&gt; {<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; this.$Message.info(value ? "是" : "否");<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br />
  &nbsp; &nbsp; &nbsp; &nbsp; },<br />
  &nbsp; &nbsp; &nbsp; &nbsp; {<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; field: "date",<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; title: "日期",<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; edit: { type: "datetime", keep: true },<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; width: 150<br />
  &nbsp; &nbsp; &nbsp; &nbsp; },<br />
  &nbsp; &nbsp; &nbsp; &nbsp; {<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; field: "save",<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; title: "操作",<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; width: 150,<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; formatter: () =&gt; {<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return "&lt;div&nbsp; class='oper-btn'&gt;保存&lt;/div&gt;";<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; },<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; click: (row, column, event) =&gt; {<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; this.$Message.info("当前保存的行数据：" + JSON.stringify(row));<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br />
  &nbsp; &nbsp; &nbsp; &nbsp; }<br />
  &nbsp; &nbsp; &nbsp; ]<br />
  &nbsp; &nbsp; };<br />
  &nbsp; },<br />
  &nbsp; created() {},<br />
  &nbsp; methods: {<br />
  &nbsp; &nbsp; //文件上传后<br />
  &nbsp; &nbsp; uploadAfter(result, files) {<br />
  &nbsp; &nbsp; &nbsp; if (!result.status) return true;<br />
  &nbsp; &nbsp; &nbsp; let imgs = [];<br />
  &nbsp; &nbsp; &nbsp; files.forEach(x =&gt; {<br />
  &nbsp; &nbsp; &nbsp; &nbsp; imgs.push(result.data + x.name);<br />
  &nbsp; &nbsp; &nbsp; });<br />
  &nbsp; &nbsp; &nbsp; // //将图片填写表格中<br />
  &nbsp; &nbsp; &nbsp; this.uploadRow.imgs = imgs.join(",");<br />
  &nbsp; &nbsp; &nbsp; //强制刷新表格数据<br />
  &nbsp; &nbsp; &nbsp; let _rows = this.tableData.splice(0);<br />
  &nbsp; &nbsp; &nbsp; this.tableData.push(..._rows);<br />
  &nbsp; &nbsp; &nbsp; this.model = false;<br />
  &nbsp; &nbsp; &nbsp; return true;<br />
  &nbsp; &nbsp; }<br />
  &nbsp; }<br />
  };<br />
  &lt;/script&gt;<br />
  <br />
  &lt;style lang="less" scoped&gt;<br />
  .vol-demo {<br />
  &nbsp; box-shadow: 0px 0px 10px #ccc9c9;<br />
  &nbsp; padding: 23px;<br />
  }<br />
  &lt;/style&gt;<br />
  <br />
  &lt;style scoped&gt;<br />
  .keep-edit &gt;&gt;&gt; .oper-btn,<br />
  .keep-edit &gt;&gt;&gt; .img-btn {<br />
  &nbsp; width: 75px;<br />
  &nbsp; border-radius: 4px;<br />
  &nbsp; padding: 2px 15px;<br />
  &nbsp; background: #eee;<br />
  &nbsp; color: #fff;<br />
  &nbsp; background-color: #03a9f4;<br />
  &nbsp; border-color: #19be6b;<br />
  &nbsp; text-align: center;<br />
  &nbsp; font-size: 12px;<br />
  &nbsp; line-height: 24px;<br />
  &nbsp; cursor: pointer;<br />
  }<br />
  .keep-edit &gt;&gt;&gt; .oper-btn {<br />
  &nbsp; background-color: #19be6b;<br />
  }<br />
  &lt;/style&gt;<br />
  <br />
  <span style="display:none;"></span>`
  ,
  edittable: `<div class="cnblogs_code">
  <pre>&lt;template&gt;
    &lt;div&gt;
      &lt;VolHeader icon="md-podium" text="双击编辑"&gt;
        &lt;div slot="content"&gt;还没想好..&lt;/div&gt;
        &lt;div style="text-align: right;"&gt;
          &lt;Button type="info" size="small" ghost @click="clear"&gt;清空表&lt;/Button&gt;
          &lt;Button type="info" size="small" ghost @click="del"&gt;删除行&lt;/Button&gt;
          &lt;Button type="info" size="small" ghost @click="add"&gt;添加行&lt;/Button&gt;
          &lt;Button type="info" size="small" ghost @click="getRows"&gt;获取选中的行&lt;/Button&gt;
        &lt;/div&gt;
      &lt;/VolHeader&gt;
      &lt;vol-<span style="color: #000000;">table
        ref</span>="editTable"<span style="color: #000000;">
        :columns</span>="editTableOptions.columns"<span style="color: #000000;">
        :height</span>="370"<span style="color: #000000;">
        :index</span>="true"<span style="color: #000000;">
        :tableData</span>="editTableOptions.data"<span style="color: #000000;">
        :pagination</span>-hide="true"
      &gt;&lt;/vol-table&gt;
    &lt;/div&gt;
  &lt;/template&gt;
  &lt;script&gt;<span style="color: #000000;">
  import VolTable from </span>"@/components/basic/VolTable.vue"<span style="color: #000000;">;
  import VolHeader from </span>"@/components/basic/VolHeader.vue"<span style="color: #000000;">;
  let $doc_vue;
  let doc_options </span>=<span style="color: #000000;"> {
    components: { VolTable, VolHeader },
    created() {
      $doc_vue </span>= <span style="color: #0000ff;">this</span><span style="color: #000000;">;
    },
    data() {
      </span><span style="color: #0000ff;">return</span><span style="color: #000000;"> {
        editTableOptions: {
          data: [
            </span><span style="color: #008000;">//</span><span style="color: #008000;">表数据</span>
  <span style="color: #000000;">          {
              ExpertId: </span>276<span style="color: #000000;">,
              NotNull: </span>"还没想好"<span style="color: #000000;">,
              LimitLenght: </span>"baba"<span style="color: #000000;">,
              UserImg:
                </span>"https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x1.jpg"<span style="color: #000000;">,
              LimitNumber: </span>3<span style="color: #000000;">,
              EventClick: </span>"七秒钟的记忆"<span style="color: #000000;">,
              FormatString: </span>"2019-11-20"<span style="color: #000000;">,
              BindKeyValue: </span>"1"<span style="color: #000000;">,
              Enable: </span>1<span style="color: #000000;">,
              ReallyName: </span>"七秒的记忆"<span style="color: #000000;">,
              CreateDate: </span>"2018-09-18 17:45:54"<span style="color: #000000;">
            },
            {
              ExpertId: </span>276<span style="color: #000000;">,
              NotNull: </span>"往事已成风"<span style="color: #000000;">,
              LimitLenght: </span>"冷风中"<span style="color: #000000;">,
              UserImg:
                </span>"https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x2.jpg"<span style="color: #000000;">,
              LimitNumber: </span>5<span style="color: #000000;">,
              EventClick: </span>"不午休的猫"<span style="color: #000000;">,
              FormatString: </span>"2019-11-08"<span style="color: #000000;">,
              BindKeyValue: </span>"2"<span style="color: #000000;">,
              Enable: </span>0<span style="color: #000000;">,
              ReallyName: </span>"月穿潭底水無痕"<span style="color: #000000;">,
              filetest:"https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/github/wordtest.docx" ,//也是设置为api服务器的文件，地址如：static/20191206/xx.xlsx,
              CreateDate: </span>"2018-09-18 17:45:54"<span style="color: #000000;">
            }
          ],
          columns: [
            </span><span style="color: #008000;">//</span><span style="color: #008000;">表配置</span>
  <span style="color: #000000;">          {
              field: </span>"ExpertId", <span style="color: #008000;">//</span><span style="color: #008000;">数据库表字段,必须和数据库一样，并且大小写一样</span>
              title: "主键ID", <span style="color: #008000;">//</span><span style="color: #008000;">表头显示的名称</span>
              isKey: <span style="color: #0000ff;">true</span>, <span style="color: #008000;">//</span><span style="color: #008000;">是否为主键字段</span>
              hidden: <span style="color: #0000ff;">true</span> <span style="color: #008000;">//</span><span style="color: #008000;">是否显示</span>
  <span style="color: #000000;">          },
            {
              field: </span>"NotNull"<span style="color: #000000;">,
              title: </span>"不可为空"<span style="color: #000000;">,
              width: </span>120<span style="color: #000000;">,
              required: </span><span style="color: #0000ff;">true</span><span style="color: #000000;">,
              edit: { type: </span>"text"<span style="color: #000000;"> }
            },
            {
              field: </span>"LimitLenght"<span style="color: #000000;">,
              title: </span>"限制字符长度"<span style="color: #000000;">,
              fixed: </span><span style="color: #0000ff;">true</span><span style="color: #000000;">,
              width: </span>150<span style="color: #000000;">,
              required: </span><span style="color: #0000ff;">true</span><span style="color: #000000;">,
              edit: { type: </span>"text", min: 2, max: 4<span style="color: #000000;"> }
            },
            {
              field: </span>"UserImg"<span style="color: #000000;">,
              title: </span>"图片"<span style="color: #000000;">,
              type: </span>"img"<span style="color: #000000;">,
              width: </span>150<span style="color: #000000;">
            },
            {
              field: "filetest",
              title: "点击文件下载",
              width: 190,
              type:'file'//指定为file与excel即可下载文件
          },
            {
              field: </span>"LimitNumber"<span style="color: #000000;">,
              title: </span>"数字限制大小"<span style="color: #000000;">,
              width: </span>110<span style="color: #000000;">,
              require: </span><span style="color: #0000ff;">true</span><span style="color: #000000;">,
              edit: { type: </span>"number", min: 3, max: 5<span style="color: #000000;"> }
            },
            {
              field: </span>"EventClick"<span style="color: #000000;">,
              title: </span>"点击自定义事件"<span style="color: #000000;">,
              type: </span>"string"<span style="color: #000000;">,
              width: </span>120<span style="color: #000000;">,
              require: </span><span style="color: #0000ff;">true</span><span style="color: #000000;">,
              formatter: (row, column) </span>=&gt;<span style="color: #000000;"> {
                </span><span style="color: #008000;">//</span><span style="color: #008000;">单元格点击事亻</span>
                <span style="color: #0000ff;">return</span> "&lt;a&gt;" + row[column.field] + "&lt;/a&gt;"<span style="color: #000000;">;
              },
              click: (row, column) </span>=&gt;<span style="color: #000000;"> {
                </span><span style="color: #008000;">//</span><span style="color: #008000;">单元格点击事亻</span>
                <span style="color: #0000ff;">this</span><span style="color: #000000;">.$Message.error(
                  </span>"此单元格没有设置编辑属性。如果columns写在配置js中，拿不到this，请在created方法动态添加click方法"<span style="color: #000000;">
                );
              }
            },
            {
              field: </span>"FormatString"<span style="color: #000000;">,
              title: </span>"格式化日期"<span style="color: #000000;">,
              width: </span>120<span style="color: #000000;">,
              require: </span><span style="color: #0000ff;">true</span><span style="color: #000000;">,
              formatter: row </span>=&gt;<span style="color: #000000;"> {
                </span><span style="color: #0000ff;">if</span> (!row.FormatString) <span style="color: #0000ff;">return</span><span style="color: #000000;">;
                </span><span style="color: #008000;">//</span><span style="color: #008000;">对单元格的数据格式化处理</span>
                <span style="color: #0000ff;">return</span> row.FormatString.replace(/-/g, "."<span style="color: #000000;">);
              }
            },
            {
              field: </span>"BindKeyValue"<span style="color: #000000;">,
              title: </span>"手动绑定数据源Key.Value"<span style="color: #000000;">,
              type: </span>"int"<span style="color: #000000;">,
              edit: { type: </span>"select"<span style="color: #000000;"> },
              bind: {
                </span><span style="color: #008000;">//</span><span style="color: #008000;">如果后面返回的数据为数据源的数据，请配置此bind属性，可以从后台字典数据源加载，也只以直接写上</span>
                key: "audit"<span style="color: #000000;">,
                data: [
                  { key: </span>"0", value: "审核中"<span style="color: #000000;"> },
                  { key: </span>"1", value: "审核通过"<span style="color: #000000;"> },
                  { key: </span>"2", value: "审核未通过"<span style="color: #000000;"> }
                ]
              },
              width: </span>180<span style="color: #000000;">
            },
            {
              field: </span>"Enable"<span style="color: #000000;">,
              title: </span>"自动绑定KeyValue"<span style="color: #000000;">,
              type: </span>"byte"<span style="color: #000000;">,
              bind: { key: </span>"enable", data: [] }, <span style="color: #008000;">//</span><span style="color: #008000;">此处值为data空数据，自行从后台字典数据源加载</span>
              width: 150<span style="color: #000000;">,
              edit: { type: </span>"switch"<span style="color: #000000;"> }
            },
            {
              field: </span>"CreateDate"<span style="color: #000000;">,
              title: </span>"日期"<span style="color: #000000;">,
              type: </span>"datetime"<span style="color: #000000;">,
              width: </span>150<span style="color: #000000;">,
              edit: { type: </span>"datetime"<span style="color: #000000;"> }
            }
          ]
        }
      };
    },
    methods: {
      del() {
        let rows </span>= <span style="color: #0000ff;">this</span><span style="color: #000000;">.$refs.editTable.getSelected();
        </span><span style="color: #0000ff;">if</span> (rows.length == 0<span style="color: #000000;">) {
          </span><span style="color: #0000ff;">return</span> <span style="color: #0000ff;">this</span>.$Message.error("请先选中行"<span style="color: #000000;">);
        }
        </span><span style="color: #0000ff;">this</span><span style="color: #000000;">.$refs.editTable.delRow();
      },
      clear() {
        </span><span style="color: #0000ff;">this</span>.editTableOptions.data.splice(0<span style="color: #000000;">);
      },
      add() {
        </span><span style="color: #0000ff;">this</span><span style="color: #000000;">.editTableOptions.data.push({});
      },
      getRows() {
        let rows </span>= <span style="color: #0000ff;">this</span><span style="color: #000000;">.$refs.editTable.getSelected();
        </span><span style="color: #0000ff;">if</span> (rows.length == 0<span style="color: #000000;">) {
          </span><span style="color: #0000ff;">return</span> <span style="color: #0000ff;">this</span>.$Message.error("请先选中行"<span style="color: #000000;">);
        }
        </span><span style="color: #0000ff;">this</span><span style="color: #000000;">.$Message.error(JSON.stringify(rows));
      },
      endEdit() {
        </span><span style="color: #008000;">//</span><span style="color: #008000;">手动结束编辑</span>
        <span style="color: #0000ff;">this</span>.$refs.editTable.edit.rowIndex = -1<span style="color: #000000;">;
      }
    }
  };
  export </span><span style="color: #0000ff;">default</span><span style="color: #000000;"> doc_options;
  </span>&lt;/script&gt;</pre>
  </div>
  <p>&nbsp;</p>`, btnedittable: `<div class="cnblogs_code">
  <pre>&lt;template&gt;
    &lt;div&gt;
      &lt;VolHeader icon="md-apps" text="使用button编辑"&gt;
        &lt;div slot="content"&gt;通过button编辑与额外标签事件&lt;/div&gt;
      &lt;/VolHeader&gt;
      &lt;vol-<span style="color: #000000;">table
        ref</span>="table1"<span style="color: #000000;">
        :doubleEdit</span>="false"<span style="color: #000000;">
        :columns</span>="eidtWithButton.columns"<span style="color: #000000;">
        :max</span>-height="500"<span style="color: #000000;">
        :index</span>="true"<span style="color: #000000;">
        :tableData</span>="eidtWithButton.data"<span style="color: #000000;">
        :paginationHide</span>="true"
      &gt;&lt;/vol-table&gt;
    &lt;/div&gt;
  &lt;/template&gt;
  &lt;script&gt;<span style="color: #000000;">
  import VolTable from </span>"@/components/basic/VolTable.vue"<span style="color: #000000;">;
  import VolHeader from </span>"@/components/basic/VolHeader.vue"<span style="color: #000000;">;

  export </span><span style="color: #0000ff;">default</span><span style="color: #000000;"> {
    components: { VolTable, VolHeader },
    created() {},
    methods: {},
    data() {
      </span><span style="color: #0000ff;">return</span><span style="color: #000000;"> {
        eidtWithButton: {
          data: [
            {
              test1: </span>"123"<span style="color: #000000;">,
              test2: </span>"1"<span style="color: #000000;">,
              test3: </span>"789"<span style="color: #000000;">,
              test4: </span>"2018-09-18 17:45:54"<span style="color: #000000;">,
              test5: </span>"123"<span style="color: #000000;">
            },
            {
              test1: </span>"123x"<span style="color: #000000;">,
              test2: </span>"0"<span style="color: #000000;">,
              test3: </span>"789x"<span style="color: #000000;">,
              test4: </span>"2020-01-18 13:24:26"<span style="color: #000000;">,
              test5: </span>"123x"<span style="color: #000000;">
            }
          ],
          columns: [
            {
              field: </span>"test1"<span style="color: #000000;">,
              title: </span>"测试1"<span style="color: #000000;">,
              require: </span><span style="color: #0000ff;">true</span><span style="color: #000000;">,
              edit: { type: </span>"text", min: 5, max: 7<span style="color: #000000;"> },
              extra: {
                icon: </span>"ios-search"<span style="color: #000000;">,
                text: </span>"点击可触发事件"<span style="color: #000000;">,
                style: </span>"line-height: 31px;margin-left: 11px;"<span style="color: #000000;">,
                click: (column, row, tableData) </span>=&gt;<span style="color: #000000;"> {
                  </span><span style="color: #008000;">//</span><span style="color: #008000;">  this.getRows();</span>
                  <span style="color: #0000ff;">this</span>.$Message.error("点击标签触发的事件"<span style="color: #000000;">);
                }
              },
              width: </span>250<span style="color: #000000;">
            },
            {
              field: </span>"test2"<span style="color: #000000;">,
              title: </span>"测试2"<span style="color: #000000;">,
              require: </span><span style="color: #0000ff;">true</span><span style="color: #000000;">,
              edit: { type: </span>"select"<span style="color: #000000;"> },
              onChange: (column, row, tableData) </span>=&gt;<span style="color: #000000;"> {
                </span><span style="color: #0000ff;">this</span>.$Message.error(row["test2"<span style="color: #000000;">]);
              },
              bind: {
                </span><span style="color: #008000;">//</span><span style="color: #008000;">如果后面返回的数据为数据源的数据，请配置此bind属性，可以从后台字典数据源加载，也只以直接写上</span>
                key: "audit"<span style="color: #000000;">,
                data: [{ key: </span>"0", value: "否" }, { key: "1", value: "是"<span style="color: #000000;"> }]
              },
              width: </span>130<span style="color: #000000;">
            },
            {
              field: </span>"test3"<span style="color: #000000;">,
              title: </span>"测试3"<span style="color: #000000;">,
              width: </span>160<span style="color: #000000;">
            },
            {
              field: </span>"test4"<span style="color: #000000;">,
              title: </span>"测试4"<span style="color: #000000;">,
              edit: { type: </span>"datetime"<span style="color: #000000;"> },
              width: </span>250<span style="color: #000000;">
            },
            {
              field: </span>"test5"<span style="color: #000000;">,
              title: </span>"测试5"<span style="color: #000000;">,
              width: </span>150<span style="color: #000000;">
            }
          ]
        }
      };
    }
  };
  </span>&lt;/script&gt;</pre>
  </div>
  <p>&nbsp;</p>`,
  voltable: `<div class="cnblogs_code">
  <pre>&lt;template&gt;
    &lt;div&gt;
      &lt;vol-<span style="color: #000000;">box
        :model.sync</span>="viewModel"<span style="color: #000000;">
        title</span>="远程加载table数据"<span style="color: #000000;">
        icon</span>="md-podium"<span style="color: #000000;">
        :height</span>="450"<span style="color: #000000;">
        :width</span>="600"
      &gt;
        &lt;<span style="color: #000000;">div
          style</span>="display: block;word-break: break-all;word-wrap: break-word;"<span style="color: #000000;">
          slot</span>="content"
        &gt;{{text}}&lt;/div&gt;
        &lt;div slot="footer"&gt;
          &lt;Button type="info" @click="viewModel=false"&gt;确认&lt;/Button&gt;
        &lt;/div&gt;
      &lt;/vol-box&gt;
      &lt;div&gt;
        &lt;VolHeader icon="md-apps" text="从api加载数据"&gt;
          &lt;div slot="content"&gt;还没想好..&lt;/div&gt;
          &lt;slot&gt;
            &lt;div style="text-align: right;"&gt;
              &lt;Button type="info" ghost @click="remoteLoad" size="small"&gt;刷新表数据&lt;/Button&gt;
            &lt;/div&gt;
          &lt;/slot&gt;
        &lt;/VolHeader&gt;
        &lt;vol-<span style="color: #000000;">table
          ref</span>="table"<span style="color: #000000;">
          :loadKey</span>="true"<span style="color: #000000;">
          :linkView</span>="viewRow"<span style="color: #000000;">
          :columns</span>="table.columns"<span style="color: #000000;">
          :pagination</span>="table.pagination"<span style="color: #000000;">
          :pagination</span>-hide="false"<span style="color: #000000;">
          :max</span>-height="450"<span style="color: #000000;">
          :url</span>="table.url"<span style="color: #000000;">
          :index</span>="true"<span style="color: #000000;">
          @loadBefore</span>="loadTableBefore"<span style="color: #000000;">
          @loadAfter</span>="loadTableAfter"
        &gt;&lt;/vol-table&gt;
      &lt;/div&gt;
    &lt;/div&gt;
  &lt;/template&gt;
  &lt;script&gt;<span style="color: #000000;">
  import VolBox from </span>"@/components/basic/VolBox.vue"<span style="color: #000000;">;
  import VolTable from </span>"@/components/basic/VolTable.vue"<span style="color: #000000;">;
  import VolHeader from </span>"@/components/basic/VolHeader.vue"<span style="color: #000000;">;
  let $doc_vue;
  let doc_options </span>=<span style="color: #000000;"> {
    data() {
      </span><span style="color: #0000ff;">return</span><span style="color: #000000;"> {
        viewModel: </span><span style="color: #0000ff;">false</span><span style="color: #000000;">,
        text: </span>""<span style="color: #000000;">,
        table: {
          url: </span>"api/App_Expert/getPageData"<span style="color: #000000;">,
          pagination: {
            total: </span>0, <span style="color: #008000;">//</span><span style="color: #008000;">分页总数量</span>
            size: 30, <span style="color: #008000;">//</span><span style="color: #008000;">分页大小,30,60,100.</span>
            sortName: "CreateDate" <span style="color: #008000;">//</span><span style="color: #008000;">从后加载数据分页时的排序字段</span>
  <span style="color: #000000;">        },
          columns: [
            </span><span style="color: #008000;">//</span><span style="color: #008000;">表配置</span>
  <span style="color: #000000;">          {
              field: </span>"ExpertId", <span style="color: #008000;">//</span><span style="color: #008000;">数据库表字段,必须和数据库一样，并且大小写一样</span>
              title: "主键ID", <span style="color: #008000;">//</span><span style="color: #008000;">表头显示的名称</span>
              isKey: <span style="color: #0000ff;">true</span>, <span style="color: #008000;">//</span><span style="color: #008000;">是否为主键字段</span>
              hidden: <span style="color: #0000ff;">true</span> <span style="color: #008000;">//</span><span style="color: #008000;">是否显示</span>
  <span style="color: #000000;">          },
            {
              field: </span>"HeadImageUrl"<span style="color: #000000;">,
              title: </span>"头像"<span style="color: #000000;">,
              type: </span>"img"<span style="color: #000000;">,
              width: </span>160<span style="color: #000000;">
            },
            {
              field: </span>"UserName"<span style="color: #000000;">,
              title: </span>"申请人帐号"<span style="color: #000000;">,
              link: </span><span style="color: #0000ff;">true</span>, <span style="color: #008000;">//</span><span style="color: #008000;">设置link=true后此单元格可以点击获取当前行的数据进行其他操作</span>
              width: 120<span style="color: #000000;">
            },
            {
              field: </span>"UserTrueName"<span style="color: #000000;">,
              title: </span>"申请人"<span style="color: #000000;">,
              width: </span>120<span style="color: #000000;">
            },
            {
              field: </span>"AuditStatus"<span style="color: #000000;">,
              title: </span>"审核状态"<span style="color: #000000;">,
              width: </span>120<span style="color: #000000;">,
              bind: {
                </span><span style="color: #008000;">//</span><span style="color: #008000;">如果后面返回的数据为数据源的数据，请配置此bind属性，可以从后台字典数据源加载，也只以直接写上</span>
                key: "audit"<span style="color: #000000;">,
                data: []
              }
            },
            {
              field: </span>"ReallyName"<span style="color: #000000;">,
              title: </span>"真实姓名"<span style="color: #000000;">,
              width: </span>120<span style="color: #000000;">,
              click: (row, column) </span>=&gt;<span style="color: #000000;"> {
                </span><span style="color: #008000;">//</span><span style="color: #008000;">单元格点击事亻</span>
                let msg =
                  "此处可以自己自定格式显示内容,此单元格原始值是:【" +<span style="color: #000000;">
                  row.ReallyName </span>+
                  "】"<span style="color: #000000;">;
                </span><span style="color: #0000ff;">this</span><span style="color: #000000;">.$Message.error(msg);
                </span><span style="color: #008000;">//</span><span style="color: #008000;"> $doc_vue.$Message.error(msg);</span>
  <span style="color: #000000;">            },
              formatter: () </span>=&gt;<span style="color: #000000;"> {
                </span><span style="color: #008000;">//</span><span style="color: #008000;">对单元格的数据格式化处理</span>
                <span style="color: #0000ff;">return</span> "&lt;a&gt;点我&lt;/a&gt;"<span style="color: #000000;">;
              }
            }
          ]
        }
      };
    },
    components: { VolTable, VolBox, VolHeader },
    created() {
      $doc_vue </span>= <span style="color: #0000ff;">this</span><span style="color: #000000;">;
    },
    methods: {
      viewRow(row, column) {
        </span><span style="color: #008000;">//</span><span style="color: #008000;">设置linkView属性后，可不用配置click与formatter方法，直接使用linkView处理点击事件</span>
        <span style="color: #0000ff;">this</span>.text =
          "点击单元格的弹出框，当前点击的行数据：" +<span style="color: #000000;"> JSON.stringify(row);
        </span><span style="color: #0000ff;">this</span>.viewModel = <span style="color: #0000ff;">true</span><span style="color: #000000;">;
        </span><span style="color: #008000;">//</span><span style="color: #008000;">  this.$message.error(JSON.stringify(row));</span>
  <span style="color: #000000;">    },
      loadTableBefore(param, callBack) {
        callBack(true);
        &nbsp; &nbsp; /*查询前处理(如果需要查询条件，实现组件方法loadBefore方法即可:<br />
          &nbsp; &nbsp; &nbsp; &nbsp; loadBefore=(param, callBack)=&gt;{<br />
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; param.wheres = [{ name: "PhoneNo", value: "13419098211" }];<br />
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; callBack(true);<br />
          &nbsp; &nbsp; &nbsp; &nbsp; })<br />
          &nbsp; &nbsp; &nbsp; */<br />   },
      loadTableAfter(data, callBack) {
        </span><span style="color: #008000;">//</span><span style="color: #008000;">此处是从后台加数据后，你可以在渲染表格前，预先处理返回的数据</span>
        console.log("加载数据后" +<span style="color: #000000;"> data);
        callBack(</span><span style="color: #0000ff;">true</span>); <span style="color: #008000;">//</span><span style="color: #008000;">同上</span>
  <span style="color: #000000;">    },
      remoteLoad() {
        </span><span style="color: #008000;">//</span><span style="color: #008000;">此处可以自定义查询条件,如果不调用的框架的查询，格式需要自己定义，</span>
        <span style="color: #008000;">//</span><span style="color: #008000;">如果查询的是框架getPageData方法,需要指定格式,如:</span>
        <span style="color: #008000;">//</span><span style="color: #008000;"> let where={wheres:[{"name":"UserTrueName","value":"教兽",displayType:"text"}]};</span>
        let where =<span style="color: #000000;"> {};
        </span><span style="color: #0000ff;">this</span><span style="color: #000000;">.$refs.table.load(where);
      }
    }
  };
  export </span><span style="color: #0000ff;">default</span><span style="color: #000000;"> doc_options;
  </span>&lt;/script&gt;</pre>
  </div>
  <p>&nbsp;</p>`,
  volupload: `<div class="cnblogs_code">
  <pre>&lt;template&gt;
    &lt;div&gt;
      &lt;div class="upload-container"&gt;
        &lt;div class="upload-item"&gt;
          &lt;<span style="color: #000000;">VolUpload
            :url</span>="url"<span style="color: #000000;">
            :upload</span>-before="uploadBefore"<span style="color: #000000;">
            :upload</span>-after="uploadAfter"<span style="color: #000000;">
            :on</span>-change="onChange"
          &gt;
            &lt;div&gt;单文件自动上传&lt;/div&gt;
          &lt;/VolUpload&gt;
        &lt;/div&gt;
        &lt;div class="upload-item"&gt;
          &lt;<span style="color: #000000;">VolUpload
            :autoUpload</span>="false"<span style="color: #000000;">
            :multiple</span>="true"<span style="color: #000000;">
            :max</span>-file="2"<span style="color: #000000;">
            :excel</span>="true"<span style="color: #000000;">
            :url</span>="url"<span style="color: #000000;">
            :upload</span>-before="uploadBefore"<span style="color: #000000;">
            :upload</span>-after="uploadAfter"<span style="color: #000000;">
            :on</span>-change="onChange"
          &gt;
            &lt;div&gt;多文件手动上传,最多2个excel文件&lt;/div&gt;
          &lt;/VolUpload&gt;
        &lt;/div&gt;
        &lt;div class="upload-item"&gt;
          &lt;a ref="downFile"&gt;&lt;/a&gt;
          &lt;<span style="color: #000000;">VolUpload
            :multiple</span>="true"<span style="color: #000000;">
            :url</span>="url"<span style="color: #000000;">
            :upload</span>-before="uploadBefore1"<span style="color: #000000;">
            :upload</span>-after="uploadAfter1"<span style="color: #000000;">
            :on</span>-change="onChange"<span style="color: #000000;">
            :fileInfo</span>="fileInfo"
          &gt;
            &lt;div&gt;下载已经上传过的文件&lt;/div&gt;
          &lt;/VolUpload&gt;
        &lt;/div&gt;
      &lt;/div&gt;

      &lt;div class="upload-container"&gt;
        &lt;div class="upload-item"&gt;
          &lt;<span style="color: #000000;">VolUpload
            :url</span>="url"<span style="color: #000000;">
            :img</span>="true"<span style="color: #000000;">
            :multiple</span>="true"<span style="color: #000000;">
            :max</span>-size="null"<span style="color: #000000;">
            :upload</span>-before="uploadBefore"<span style="color: #000000;">
            :upload</span>-after="uploadAfter"<span style="color: #000000;">
            :on</span>-change="onChange"
          &gt;
            &lt;div&gt;多图片自动上传,图片最大1M&lt;/div&gt;
          &lt;/VolUpload&gt;
        &lt;/div&gt;
      &lt;/div&gt;
      &lt;div class="upload-container"&gt;
        &lt;div class="upload-item"&gt;
          &lt;<span style="color: #000000;">VolUpload
            :autoUpload</span>="false"<span style="color: #000000;">
            :url</span>="url"<span style="color: #000000;">
            :img</span>="true"<span style="color: #000000;">
            :upload</span>-before="uploadBefore"<span style="color: #000000;">
            :upload</span>-after="uploadAfter"<span style="color: #000000;">
            :on</span>-change="onChange"
          &gt;
            &lt;div&gt;单文件手动上传,只能上传图片&lt;/div&gt;
          &lt;/VolUpload&gt;
        &lt;/div&gt;
      &lt;/div&gt;
    &lt;/div&gt;
  &lt;/template&gt;
  &lt;script&gt;<span style="color: #000000;">
  import docParamTable from </span>"./doc_ParamTable.vue"<span style="color: #000000;">;
  import VolUpload from </span>"@/components/basic/VolUpload.vue"<span style="color: #000000;">;
  export </span><span style="color: #0000ff;">default</span><span style="color: #000000;"> {
    components: { VolUpload, docParamTable },
    data() {
      </span><span style="color: #0000ff;">return</span><span style="color: #000000;"> {
        url: </span>"/api/App_Appointment/Upload"<span style="color: #000000;">,
        model: </span><span style="color: #0000ff;">true</span><span style="color: #000000;">,
        fileInfo: [
          {
            name: </span>"exceltest.xlsx"<span style="color: #000000;">,
            path:
              </span>"https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/github/exceltest.xlsx"<span style="color: #000000;">
          },
          {
            name: </span>"wordtest.docx"<span style="color: #000000;">,
            path:
              </span>"https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/github/wordtest.docx"<span style="color: #000000;">
          }
        ],
        loadingStatus: </span><span style="color: #0000ff;">false</span><span style="color: #000000;">
      };
    },
    methods: {
      removeFile(index) {
        </span><span style="color: #0000ff;">this</span>.fileInfo.splice(index, 1<span style="color: #000000;">);
      },
      uploadBefore1(files) {
        </span><span style="color: #0000ff;">this</span>.fileInfo.splice(0<span style="color: #000000;">);
        </span><span style="color: #0000ff;">for</span> (let index = 0; index &lt; files.length; index++<span style="color: #000000;">) {
          const element </span>=<span style="color: #000000;"> files[index];
          </span><span style="color: #0000ff;">this</span><span style="color: #000000;">.fileInfo.push({ name: element.name });
        }
        </span><span style="color: #0000ff;">return</span> <span style="color: #0000ff;">true</span><span style="color: #000000;">;
      },
      uploadAfter1(result, files) {
        </span><span style="color: #0000ff;">if</span> (!result.status) <span style="color: #0000ff;">return</span> <span style="color: #0000ff;">true</span><span style="color: #000000;">;
        </span><span style="color: #0000ff;">this</span>.fileInfo.forEach(x =&gt;<span style="color: #000000;"> {
          x.path </span>=<span style="color: #000000;"> result.data;
        });
      },
      getFileNames(files) {
        let arr </span>=<span style="color: #000000;"> [];
        </span><span style="color: #0000ff;">for</span> (let index = 0; index &lt; files.length; index++<span style="color: #000000;">) {
          const element </span>=<span style="color: #000000;"> files[index];
          arr.push(element.name);
        }
        </span><span style="color: #0000ff;">return</span> arr.join(","<span style="color: #000000;">);
      },
      uploadBefore(files) {
        console.log(</span>"上传前的文件:" + <span style="color: #0000ff;">this</span><span style="color: #000000;">.getFileNames(files));
        </span><span style="color: #0000ff;">return</span> <span style="color: #0000ff;">true</span><span style="color: #000000;">;
      },
      uploadAfter(result, files) {
        console.log(
          </span>"上传结果" +<span style="color: #000000;">
            JSON.stringify(result) </span>+
            "上传前的文件:" +
            <span style="color: #0000ff;">this</span><span style="color: #000000;">.getFileNames(files)
        );
        </span><span style="color: #0000ff;">return</span> <span style="color: #0000ff;">true</span><span style="color: #000000;">;
      },
      onChange(files) {
        console.log(</span>"选择的文件:" + +<span style="color: #0000ff;">this</span><span style="color: #000000;">.getFileNames(files));
        </span><span style="color: #0000ff;">return</span> <span style="color: #0000ff;">true</span><span style="color: #000000;">;
      }
    }
  };
  </span>&lt;/script&gt;
  &lt;style lang="less" scoped&gt;<span style="color: #000000;">
  .upload</span>-<span style="color: #000000;">container {
    max</span>-<span style="color: #000000;">height: 160px;
    display: flex;
    .upload</span>-<span style="color: #000000;">item {
      flex: </span>1<span style="color: #000000;">;
      padding: 20px;
    }
  }
  </span>&lt;/style&gt;</pre>
  </div>
  <p>&nbsp;</p>`,
  uploadExcel: ``, uploadImg: ``, volmenu: ``, viewGrid: ``
}
export default codeString
