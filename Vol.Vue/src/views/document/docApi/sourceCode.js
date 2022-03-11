var codeString = {
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
  header: `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">template</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">div</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#4ec9b0;">VolHeader</span>&nbsp;<span style="color:#9cdcfe;">style</span>=<span style="color:#ce9178;">"margin:&nbsp;30px&nbsp;0;"</span>&nbsp;:<span style="color:#9cdcfe;">icon</span>="<span style="color:#9cdcfe;">icon</span>"&nbsp;:<span style="color:#9cdcfe;">text</span>="<span style="color:#9cdcfe;">text</span>"<span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">div</span>&nbsp;<span style="color:#9cdcfe;">slot</span>=<span style="color:#ce9178;">"content"</span><span style="color:#808080;">&gt;</span>VolHeader这里可以定义显示内容<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">div</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">div</span>&nbsp;<span style="color:#9cdcfe;">style</span>=<span style="color:#ce9178;">"text-align:&nbsp;right;padding-top:&nbsp;4px;"</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#4ec9b0;">Button</span>&nbsp;<span style="color:#9cdcfe;">type</span>=<span style="color:#ce9178;">"text"</span>&nbsp;<span style="color:#9cdcfe;">icon</span>=<span style="color:#ce9178;">"ios-search"</span>&nbsp;<span style="color:#9cdcfe;">size</span>=<span style="color:#ce9178;">"small"</span>&nbsp;@<span style="color:#9cdcfe;">click</span>="()<span style="color:#569cd6;">=&gt;</span>{<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$Message</span>.<span style="color:#dcdcaa;">error</span>(<span style="color:#ce9178;">'1'</span>)}"<span style="color:#808080;">&gt;</span>buttons1<span style="color:#808080;">&lt;/</span><span style="color:#4ec9b0;">Button</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#4ec9b0;">Button</span>&nbsp;<span style="color:#9cdcfe;">type</span>=<span style="color:#ce9178;">"text"</span>&nbsp;<span style="color:#9cdcfe;">icon</span>=<span style="color:#ce9178;">"ios-search"</span>&nbsp;<span style="color:#9cdcfe;">size</span>=<span style="color:#ce9178;">"small"</span>&nbsp;@<span style="color:#9cdcfe;">click</span>="()<span style="color:#569cd6;">=&gt;</span>{<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$Message</span>.<span style="color:#dcdcaa;">error</span>(<span style="color:#ce9178;">'2'</span>)}"<span style="color:#808080;">&gt;</span>buttons2<span style="color:#808080;">&lt;/</span><span style="color:#4ec9b0;">Button</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">div</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;/</span><span style="color:#4ec9b0;">VolHeader</span><span style="color:#808080;">&gt;</span>
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
		<span style="color:#c586c0;">import</span>&nbsp;<span style="color:#9cdcfe;">VolHeader</span>&nbsp;<span style="color:#c586c0;">from</span>&nbsp;<span style="color:#ce9178;">"@/components/basic/VolHeader.vue"</span>;
	</div>
	<div>
		<span style="color:#c586c0;">export</span>&nbsp;<span style="color:#c586c0;">default</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#dcdcaa;">data</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">icon:</span>&nbsp;<span style="color:#ce9178;">"md-male"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">text:</span>&nbsp;<span style="color:#ce9178;">"主题名称"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;};
	</div>
	<div>
		&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#9cdcfe;">components:</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">VolHeader</span>&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#9cdcfe;">methods:</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onSelect</span>(<span style="color:#9cdcfe;">icon</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$Message</span>.<span style="color:#dcdcaa;">error</span>(<span style="color:#9cdcfe;">icon</span>);
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
</div>`,
  box: `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;white-space:pre;">
  <div>
	  <div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;white-space:pre;">
		  <div>
			  <span style="color:#808080;">&lt;</span><span style="color:#569cd6;">template</span><span style="color:#808080;">&gt;</span>
		  </div>
		  <div>
			  &nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">div</span><span style="color:#808080;">&gt;</span>
		  </div>
		  <div>
			  &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#4ec9b0;">Button</span>&nbsp;<span style="color:#9cdcfe;">type</span>=<span style="color:#ce9178;">"info"</span>&nbsp;@<span style="color:#9cdcfe;">click</span>="<span style="color:#9cdcfe;">model</span>&nbsp;=&nbsp;!<span style="color:#9cdcfe;">model</span>"<span style="color:#808080;">&gt;</span>弹出框<span style="color:#808080;">&lt;/</span><span style="color:#4ec9b0;">Button</span><span style="color:#808080;">&gt;</span>
		  </div>
		  <div>
			  &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#4ec9b0;">VolBox</span>
		  </div>
		  <div>
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">on-model-close</span>="<span style="color:#9cdcfe;">onModelClose</span>"
		  </div>
		  <div>
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">lazy</span>="<span style="color:#569cd6;">true</span>"
		  </div>
		  <div>
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">model</span>.<span style="color:#9cdcfe;">sync</span>="<span style="color:#9cdcfe;">model</span>  //vue3版本使用v-model="model""
		  </div>
		  <div>
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title</span>=<span style="color:#ce9178;">"标题"</span>
		  </div>
		  <div>
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">height</span>="<span style="color:#b5cea8;">400</span>"
		  </div>
		  <div>
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">width</span>="<span style="color:#b5cea8;">700</span>"
		  </div>
		  <div>
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">padding</span>="<span style="color:#b5cea8;">15</span>"
		  </div>
		  <div>
			  &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&gt;</span>
		  </div>
		  <div>
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">div</span><span style="color:#808080;">&gt;</span>弹出框内容<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">div</span><span style="color:#808080;">&gt;</span>
		  </div>
		  <div>
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">&lt;!--&nbsp;&lt;div&nbsp;slot="footer"&gt;&lt;/div&gt;&nbsp;这里不写，默认有一个关闭按钮&nbsp;--&gt;</span>
		  </div>
		  <div>
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">div</span>&nbsp;<span style="color:#9cdcfe;">slot</span>=<span style="color:#ce9178;">"footer"</span><span style="color:#808080;">&gt;</span>
		  </div>
		  <div>
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#4ec9b0;">Button</span>&nbsp;<span style="color:#9cdcfe;">type</span>=<span style="color:#ce9178;">"default"</span>&nbsp;@<span style="color:#9cdcfe;">click</span>="<span style="color:#9cdcfe;">$Message</span>.<span style="color:#dcdcaa;">error</span>(<span style="color:#ce9178;">'点击确认'</span>)"<span style="color:#808080;">&gt;</span>确认<span style="color:#808080;">&lt;/</span><span style="color:#4ec9b0;">Button</span><span style="color:#808080;">&gt;</span>
		  </div>
		  <div>
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#4ec9b0;">Button</span>&nbsp;<span style="color:#9cdcfe;">type</span>=<span style="color:#ce9178;">"default"</span>&nbsp;@<span style="color:#9cdcfe;">click</span>="<span style="color:#9cdcfe;">model</span>&nbsp;=&nbsp;<span style="color:#569cd6;">false</span>"<span style="color:#808080;">&gt;</span>点击关闭弹出框<span style="color:#808080;">&lt;/</span><span style="color:#4ec9b0;">Button</span><span style="color:#808080;">&gt;</span>
		  </div>
		  <div>
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">div</span><span style="color:#808080;">&gt;</span>
		  </div>
		  <div>
			  &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;/</span><span style="color:#4ec9b0;">VolBox</span><span style="color:#808080;">&gt;</span>
		  </div>
		  <div>
			  &nbsp;&nbsp;<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">div</span><span style="color:#808080;">&gt;</span>
		  </div>
		  <div>
			  <span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">template</span><span style="color:#808080;">&gt;</span>
		  </div>
		  <div>
			  &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">script</span><span style="color:#808080;">&gt;</span>
		  </div>
		  <div>
			  <span style="color:#c586c0;">import</span>&nbsp;<span style="color:#9cdcfe;">VolBox</span>&nbsp;<span style="color:#c586c0;">from</span>&nbsp;<span style="color:#ce9178;">"@/components/basic/VolBox.vue"</span>;
		  </div>
		  <div>
			  <span style="color:#c586c0;">export</span>&nbsp;<span style="color:#c586c0;">default</span>&nbsp;{
		  </div>
		  <div>
			  &nbsp;&nbsp;<span style="color:#dcdcaa;">data</span>()&nbsp;{
		  </div>
		  <div>
			  &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;{
		  </div>
		  <div>
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">model</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">false</span>,
		  </div>
		  <div>
			  &nbsp;&nbsp;&nbsp;&nbsp;};
		  </div>
		  <div>
			  &nbsp;&nbsp;},
		  </div>
		  <div>
			  &nbsp;&nbsp;<span style="color:#9cdcfe;">components</span><span style="color:#9cdcfe;">:</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">VolBox</span>&nbsp;},
		  </div>
		  <div>
			  &nbsp;&nbsp;<span style="color:#9cdcfe;">methods</span><span style="color:#9cdcfe;">:</span>&nbsp;{
		  </div>
		  <div>
			  &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onModelClose</span>(){
		  </div>
		  <div>
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$Message</span>.<span style="color:#dcdcaa;">error</span>(<span style="color:#ce9178;">'点击【X】触发的关闭事件'</span>);
		  </div>
		  <div>
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//如果return&nbsp;false则不会执行关闭</span>
		  </div>
		  <div>
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;return&nbsp;false</span>
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
		  <div>
			  <span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">script</span><span style="color:#808080;">&gt;</span>
		  </div>
	  </div>
<span style="line-height:1;"></span>
  </div>
  <div>
  </div>
</div></script>`,
  box3: `<p>
	<br />
</p>
<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;">
	<div>
		<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">template</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">el-button</span>&nbsp;<span style="color:#9cdcfe;">type</span>=<span style="color:#ce9178;">"default"</span>&nbsp;<span style="color:#9CDCFE;">size</span>=<span style="color:#CE9178;">"mini"</span>&nbsp;@<span style="color:#9CDCFE;">click</span>="<span style="color:#9CDCFE;">model</span>=<span style="color:#569CD6;">true</span>"<span style="color:#808080;">&gt;</span>打开弹出框<span style="color:#808080;">&lt;/</span><span style="color:#569CD6;">el-button</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">vol-box</span>&nbsp;:<span style="color:#9cdcfe;">lazy</span>="<span style="color:#569cd6;">true</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">v-model</span>="<span style="color:#9cdcfe;">model</span>"
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
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">div</span><span style="color:#808080;">&gt;</span>弹出框内容<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">div</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">template</span>&nbsp;#<span style="color:#9cdcfe;">footer</span><span style="color:#808080;">&gt;</span>&nbsp;
	</div>
	<div>
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">div</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">el-button</span>&nbsp;<span style="color:#9cdcfe;">type</span>=<span style="color:#ce9178;">"primary"</span>&nbsp;&nbsp;<span style="color:#9CDCFE;">size</span>=<span style="color:#CE9178;">"mini"</span>&nbsp; @<span style="color:#9CDCFE;">click</span>="<span style="color:#9CDCFE;">$Message</span>.<span style="color:#DCDCAA;">error</span>(<span style="color:#CE9178;">'点击确认'</span>)"<span style="color:#808080;">&gt;</span>确认<span style="color:#808080;">&lt;/</span><span style="color:#569CD6;">el-button</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">el-button</span>&nbsp;<span style="color:#9cdcfe;">type</span>=<span style="color:#ce9178;">"default"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">size</span>=<span style="color:#ce9178;">"mini"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@<span style="color:#9cdcfe;">click</span>="<span style="color:#9cdcfe;">model</span>=<span style="color:#569cd6;">false</span>"<span style="color:#808080;">&gt;</span>点击关闭弹出框<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">el-button</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">div</span><span style="color:#808080;">&gt;&lt;/</span><span style="color:#569cd6;">template</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">vol-box</span><span style="color:#808080;">&gt;</span>
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
		<span style="color:#6a9955;">//这里使用的vue2语法，也可以写成vue3语法</span>
	</div>
	<div>
		<span style="color:#c586c0;">export</span>&nbsp;<span style="color:#c586c0;">default</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#9cdcfe;">components</span><span style="color:#9cdcfe;">:</span>&nbsp;{&nbsp;<span style="color:#ce9178;">"vol-box"</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#9cdcfe;">VolBox</span>&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#9cdcfe;">methods</span><span style="color:#9cdcfe;">:</span>&nbsp;{},
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#dcdcaa;">data</span>()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">model</span><span style="color:#9cdcfe;">:</span><span style="color:#569cd6;">false</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;};
	</div>
	<div>
		&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#9cdcfe;">methods</span><span style="color:#9cdcfe;">:</span>&nbsp;{
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
</div>
<p>
	<br />
</p>
<p>
	<br />
</p>`,
  form: `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;">
  <div>
	  <span style="color:#808080;">&lt;</span><span style="color:#569cd6;">template</span><span style="color:#808080;">&gt;</span>
  </div>
  <div>
	  &nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">div</span><span style="color:#808080;">&gt;</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#4ec9b0;">VolForm</span>
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
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">formFields</span>="<span style="color:#9cdcfe;">formFields1</span>"
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">formRules</span>="<span style="color:#9cdcfe;">formRules1</span>"
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&gt;&lt;/</span><span style="color:#4ec9b0;">VolForm</span><span style="color:#808080;">&gt;</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">div</span>&nbsp;<span style="color:#9cdcfe;">style</span>=<span style="color:#ce9178;">"text-align:&nbsp;center"</span><span style="color:#808080;">&gt;</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#4ec9b0;">Button</span>&nbsp;<span style="color:#9cdcfe;">type</span>=<span style="color:#ce9178;">"info"</span>&nbsp;@<span style="color:#9cdcfe;">click</span>="<span style="color:#9cdcfe;">reset</span>"<span style="color:#808080;">&gt;</span>重置表单<span style="color:#808080;">&lt;/</span><span style="color:#4ec9b0;">Button</span><span style="color:#808080;">&gt;</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#4ec9b0;">Button</span>&nbsp;<span style="color:#9cdcfe;">type</span>=<span style="color:#ce9178;">"info"</span>&nbsp;@<span style="color:#9cdcfe;">click</span>="<span style="color:#9cdcfe;">validate</span>"<span style="color:#808080;">&gt;</span>验证表单&nbsp;<span style="color:#808080;">&lt;/</span><span style="color:#4ec9b0;">Button</span><span style="color:#808080;">&gt;</span>
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
	  &nbsp;&nbsp;<span style="color:#9cdcfe;">components</span><span style="color:#9cdcfe;">:</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">VolForm</span>&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;<span style="color:#9cdcfe;">methods</span><span style="color:#9cdcfe;">:</span>&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">reset</span>()&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#4fc1ff;">$refs</span>.<span style="color:#9cdcfe;">myform</span>.<span style="color:#dcdcaa;">reset</span>();
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$Message</span>.<span style="color:#dcdcaa;">error</span>(<span style="color:#ce9178;">"表单已重置"</span>);
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">validate</span>()&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#4fc1ff;">$refs</span>.<span style="color:#9cdcfe;">myform</span>.<span style="color:#dcdcaa;">validate</span>(()&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$Message</span>.<span style="color:#dcdcaa;">info</span>(<span style="color:#ce9178;">"验证通过"</span>);
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;});
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;},
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
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">formFields1</span><span style="color:#9cdcfe;">:</span>&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">Variety</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">1</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">AgeRange</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">""</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">DateRange</span><span style="color:#9cdcfe;">:</span>&nbsp;[],
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">City</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"北京市"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">AvgPrice</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">8.88</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">number1</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">20</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">mail</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">""</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">Date</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">""</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">IsTop</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">""</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">Fruits</span><span style="color:#9cdcfe;">:</span>&nbsp;[],
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">Other</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">""</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">extra1</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"添加其他标签"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">extra2</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"添加其他标签可点击"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">Switch</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">1</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">SelectList</span><span style="color:#9cdcfe;">:</span>&nbsp;[<span style="color:#ce9178;">"北京市"</span>,&nbsp;<span style="color:#ce9178;">"上海市"</span>],
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">remoteSearch</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">""</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">readonlyText</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"阿里巴巴...."</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//多个图片可以用逗号隔开</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">readonlyImg</span><span style="color:#9cdcfe;">:</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">"https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x2.jpg"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">ProImg</span><span style="color:#9cdcfe;">:</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">"https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x3.jpg"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">cascader1</span><span style="color:#9cdcfe;">:</span>&nbsp;[<span style="color:#ce9178;">"beijing"</span>,&nbsp;<span style="color:#ce9178;">"tiantan"</span>],&nbsp;<span style="color:#6a9955;">//级联默认值2020.05.31</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">cascader2</span><span style="color:#9cdcfe;">:</span>&nbsp;[],&nbsp;<span style="color:#6a9955;">//懒加载的级联默认值</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">formRules1</span><span style="color:#9cdcfe;">:</span>&nbsp;[
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
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">dataKey</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"city"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"自动绑定数据源"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">required</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">true</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"City"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">data</span><span style="color:#9cdcfe;">:</span>&nbsp;[],
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"select"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">extra</span><span style="color:#9cdcfe;">:</span>&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">render</span><span style="color:#9cdcfe;">:</span>&nbsp;(<span style="color:#9cdcfe;">h</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#dcdcaa;">h</span>(
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
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">style</span><span style="color:#9cdcfe;">:</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">color</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"#03A9F4"</span>,&nbsp;<span style="color:#9cdcfe;">cursor</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"pointer"</span>&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">on</span><span style="color:#9cdcfe;">:</span>&nbsp;{&nbsp;&nbsp;<span style="color:#dcdcaa;">click</span><span style="color:#9cdcfe;">:</span>&nbsp;()&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$Message</span>.<span style="color:#dcdcaa;">info</span>(<span style="color:#ce9178;">"点击事件"</span>);}&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">h</span>(
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">"Tooltip"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">props</span><span style="color:#9cdcfe;">:</span>&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">content</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"这里是提示的内容"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">placement</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"right-start"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">class</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"ivu-icon&nbsp;ivu-icon-ios-alert-outline"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">style</span><span style="color:#9cdcfe;">:</span>&nbsp;{},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[<span style="color:#dcdcaa;">h</span>(<span style="color:#ce9178;">"span"</span>,&nbsp;{},&nbsp;[<span style="color:#ce9178;">"提示"</span>])]
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;),
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;]
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;);
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"手动绑定数据源"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">dataKey</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"age"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">placeholder</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"在这里可设置提示描述"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//如果这里绑定了data数据，后台不会加载此数据源</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">data</span><span style="color:#9cdcfe;">:</span>&nbsp;[
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">key</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">1</span>,&nbsp;<span style="color:#9cdcfe;">value</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"是"</span>&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">key</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">0</span>,&nbsp;<span style="color:#9cdcfe;">value</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"否"</span>&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;],
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">required</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">false</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"Variety"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"select"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"手机号"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">required</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">true</span>,&nbsp;<span style="color:#6a9955;">//设置为必选项</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"AgeRange"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"phone"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onKeyPress</span><span style="color:#9cdcfe;">:</span>&nbsp;(<span style="color:#9cdcfe;">$event</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">$event</span>.<span style="color:#9cdcfe;">keyCode</span>&nbsp;==&nbsp;<span style="color:#b5cea8;">13</span>)&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$Message</span>.<span style="color:#dcdcaa;">error</span>(<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">formFields1</span>.<span style="color:#9cdcfe;">AgeRange</span>&nbsp;+&nbsp;<span style="color:#ce9178;">""</span>);
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
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
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"date日期"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"Date"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"datetime"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"日期可选范围"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"Date"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">min</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"2021-07-01&nbsp;00:00:000"</span>,&nbsp;<span style="color:#6a9955;">//设置只能选2021-07-01到今天的数据(注意后面的小时00:00:000)</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">max</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#4ec9b0;">Date</span>.<span style="color:#dcdcaa;">now</span>(),&nbsp;<span style="color:#6a9955;">//&nbsp;"2021-07-10",</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"date3"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">placeholder</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"只能选择2021-07-01到今天的日期"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"datetime"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"多选日期"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">range</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">true</span>,&nbsp;<span style="color:#6a9955;">//设置为true可以选择开始与结束日期</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">required</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">false</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"DateRange"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"date"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
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
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"number"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"数字"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">required</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">true</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">placeholder</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"你可以自己定义placeholder显示的文字"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"number1"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
<br />
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"decimal"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"最大最小decimal值"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">max</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">10</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">min</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">2</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">required</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">true</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"AvgPrice"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"邮箱"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"mail"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">required</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">false</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"mail"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
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
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"额外标签"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">required</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">true</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"text"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"extra1"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">extra</span><span style="color:#9cdcfe;">:</span>&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">icon</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"ios-search"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">style</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"color:red"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">text</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"这里可以显示额外标签"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"可点击额外标签"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"extra2"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"text"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">extra</span><span style="color:#9cdcfe;">:</span>&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">icon</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"ios-search"</span>,&nbsp;<span style="color:#6a9955;">//显示图标</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">text</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"点击可触发事件"</span>,&nbsp;<span style="color:#6a9955;">//显示文本</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//触发事件</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">click</span><span style="color:#9cdcfe;">:</span>&nbsp;(<span style="color:#9cdcfe;">item</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$Message</span>.<span style="color:#dcdcaa;">error</span>(<span style="color:#ce9178;">"点击标签触发的事件"</span>);
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">dataKey</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"city"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"多选"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">required</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">true</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"SelectList"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">data</span><span style="color:#9cdcfe;">:</span>&nbsp;[],
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"selectList"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
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
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">dataKey</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"city"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"远程搜索"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">required</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">true</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"remoteSearch"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">remote</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">true</span>,&nbsp;<span style="color:#6a9955;">//远程搜索(从后台字典搜索,只会搜索自定义sql,后台如果返回的数据量较大，请将字典维护的sql取top)</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//url:'api/xx/xx'从指定url搜索&nbsp;返回格式必须是[{key:'xxxx',value:'xxx'}]</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">data</span><span style="color:#9cdcfe;">:</span>&nbsp;[],
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">placeholder</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"输入省关键字段搜索"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"select"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
<br />
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"自定义验证"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">required</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">true</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"Other"</span>,
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
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"Switch"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"Switch"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">dataKey</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"enable"</span>,&nbsp;<span style="color:#6a9955;">//这里会从后台自动绑定数据源</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">data</span><span style="color:#9cdcfe;">:</span>&nbsp;[],
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">required</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">false</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"switch"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
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
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"checkbox"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//如果这里绑定了data数据，后台不会加载此数据源</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">data</span><span style="color:#9cdcfe;">:</span>&nbsp;[
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">key</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">0</span>,&nbsp;<span style="color:#9cdcfe;">value</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"冬瓜"</span>&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">key</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">1</span>,&nbsp;<span style="color:#9cdcfe;">value</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"西瓜"</span>&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">key</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">2</span>,&nbsp;<span style="color:#9cdcfe;">value</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"南瓜"</span>&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">key</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">3</span>,&nbsp;<span style="color:#9cdcfe;">value</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"哈密瓜"</span>&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;],
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"Fruits"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"checkbox"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"字段只读"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">readonly</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">true</span>,&nbsp;<span style="color:#6a9955;">//设置readonly或disabled都行</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"readonlyText"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"text"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
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
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"级联1"</span>,&nbsp;<span style="color:#6a9955;">//2020.05.31联级操作</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//如果这里绑定了data数据，后台不会加载此数据源</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">data</span><span style="color:#9cdcfe;">:</span>&nbsp;[
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">value</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"beijing"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">label</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"北京"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">loading</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">false</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">children</span><span style="color:#9cdcfe;">:</span>&nbsp;[
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">value</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"gugong"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">label</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"故宫"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">value</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"tiantan"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">label</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"天坛"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">value</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"wangfujing"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">label</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"王府井"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;],
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;],
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"cascader1"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"cascader"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">required</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">true</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//格式化显示(非必须)</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">formatter</span><span style="color:#9cdcfe;">:</span>&nbsp;(<span style="color:#9cdcfe;">labels</span>,&nbsp;<span style="color:#9cdcfe;">selectedData</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">const</span>&nbsp;<span style="color:#4fc1ff;">index</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">labels</span>.<span style="color:#9cdcfe;">length</span>&nbsp;-&nbsp;<span style="color:#b5cea8;">1</span>;
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">const</span>&nbsp;<span style="color:#4fc1ff;">data</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">selectedData</span>[<span style="color:#4fc1ff;">index</span>]&nbsp;||&nbsp;<span style="color:#569cd6;">false</span>;
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#4fc1ff;">data</span>&nbsp;&amp;&amp;&nbsp;<span style="color:#4fc1ff;">data</span>.<span style="color:#9cdcfe;">label</span>)&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#9cdcfe;">labels</span>[<span style="color:#4fc1ff;">index</span>]&nbsp;+&nbsp;<span style="color:#ce9178;">"&nbsp;-&nbsp;"</span>&nbsp;+&nbsp;<span style="color:#4fc1ff;">data</span>.<span style="color:#9cdcfe;">label</span>&nbsp;+&nbsp;<span style="color:#ce9178;">"&nbsp;-&nbsp;(格式化测试)"</span>;
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#9cdcfe;">labels</span>[<span style="color:#4fc1ff;">index</span>];
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"级联懒加载"</span>,&nbsp;<span style="color:#6a9955;">//2020.05.31联级操作</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//如果这里绑定了data数据，后台不会加载此数据源</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">data</span><span style="color:#9cdcfe;">:</span>&nbsp;[
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">value</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"zhejiang"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">label</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"浙江"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">loading</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">false</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">children</span><span style="color:#9cdcfe;">:</span>&nbsp;[],
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;],
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"cascader2"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">required</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">true</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"cascader"</span>,
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
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">setTimeout</span>(()&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">loading</span>&nbsp;=&nbsp;<span style="color:#569cd6;">false</span>;
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">children</span>&nbsp;=&nbsp;[
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">value</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"hangzhou"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">label</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"杭州"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">children</span><span style="color:#9cdcfe;">:</span>&nbsp;[
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">value</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"xihu"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">label</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"西湖"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">code</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">1000</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;],
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;];
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">callback</span>();
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},&nbsp;<span style="color:#b5cea8;">1000</span>);
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
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
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"备注"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">required</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">true</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"IsTop"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">min</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">3</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">max</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">5</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">placeholder</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"至少输入3个字符,最多只能输入5个字符"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">colSize</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">12</span>,&nbsp;<span style="color:#6a9955;">//设置12，此列占100%宽度</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"textarea"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
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
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"图片只读"</span>,<span style="color:#6a9955;">//量多上传参数可参照volupload组件</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">readonly</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">true</span>,&nbsp;<span style="color:#6a9955;">//设置readonly或disabled都行</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"readonlyImg"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"img"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"可上传图片"</span>,&nbsp;<span style="color:#6a9955;">//更多上传参数可参照volupload组件</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"ProImg"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"img"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">maxSize</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#b5cea8;">5</span>,&nbsp;<span style="color:#6a9955;">//最大0.2M图片</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">url</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"/api/App_Appointment/Upload"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;],
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;],
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;};
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
</div>`,
  editTable1: `
  <div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">template</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">div</span>&nbsp;<span style="color:#9cdcfe;">class</span>=<span style="color:#ce9178;">"vol-demo"</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#4ec9b0;">VolHeader</span>&nbsp;<span style="color:#9cdcfe;">icon</span>=<span style="color:#ce9178;">"md-podium"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">text</span>=<span style="color:#ce9178;">"双击编辑(1)"</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">div</span>&nbsp;<span style="color:#9cdcfe;">slot</span>=<span style="color:#ce9178;">"content"</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;双击编辑行数据，点击只读的单元格/其他行或者表头结束编辑
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">div</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;/</span><span style="color:#4ec9b0;">VolHeader</span><span style="color:#808080;">&gt;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">vol-table</span>&nbsp;<span style="color:#9cdcfe;">ref</span>=<span style="color:#ce9178;">"editTable1"</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">columns</span>="<span style="color:#9cdcfe;">options</span>.<span style="color:#9cdcfe;">columns</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">max-height</span>="<span style="color:#b5cea8;">270</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">index</span>="<span style="color:#569cd6;">true</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">tableData</span>="<span style="color:#9cdcfe;">options</span>.<span style="color:#9cdcfe;">data</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">pagination-hide</span>="<span style="color:#569cd6;">true</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">click-edit</span>="<span style="color:#569cd6;">true</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">endEditBefore</span>="<span style="color:#9cdcfe;">endEditBefore</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">endEditAfter</span>="<span style="color:#9cdcfe;">endEditAfter</span>"
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">beginEdit</span>="<span style="color:#9cdcfe;">beginEdit</span>"<span style="color:#808080;">&gt;&lt;/</span><span style="color:#569cd6;">vol-table</span><span style="color:#808080;">&gt;</span>
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
		<span style="color:#c586c0;">import</span>&nbsp;<span style="color:#9cdcfe;">VolTable</span>&nbsp;<span style="color:#c586c0;">from</span>&nbsp;<span style="color:#ce9178;">"@/components/basic/VolTable.vue"</span>;
	</div>
	<div>
		<span style="color:#c586c0;">import</span>&nbsp;<span style="color:#9cdcfe;">VolHeader</span>&nbsp;<span style="color:#c586c0;">from</span>&nbsp;<span style="color:#ce9178;">"@/components/basic/VolHeader.vue"</span>;
	</div>
	<div>
		<span style="color:#c586c0;">export</span>&nbsp;<span style="color:#c586c0;">default</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#9cdcfe;">components:</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">VolTable</span>,&nbsp;<span style="color:#9cdcfe;">VolHeader</span>&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#dcdcaa;">data</span>&nbsp;()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">options:</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">data:</span>&nbsp;[
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//表数据</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">ExpertId:</span>&nbsp;<span style="color:#b5cea8;">276</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">NotNull:</span>&nbsp;<span style="color:#ce9178;">"还没想好"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">LimitNumber:</span>&nbsp;<span style="color:#b5cea8;">5</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">EventClick:</span>&nbsp;<span style="color:#ce9178;">"不午休的猫"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">FormatString:</span>&nbsp;<span style="color:#ce9178;">"2019-11-08"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">Enable:</span>&nbsp;<span style="color:#b5cea8;">0</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">CreateDate:</span>&nbsp;<span style="color:#ce9178;">"2018-09-18&nbsp;17:45:54"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">ExpertId:</span>&nbsp;<span style="color:#b5cea8;">276</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">NotNull:</span>&nbsp;<span style="color:#ce9178;">"往事已成风"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">LimitNumber:</span>&nbsp;<span style="color:#b5cea8;">5</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">EventClick:</span>&nbsp;<span style="color:#ce9178;">"此单元格不能编辑"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">FormatString:</span>&nbsp;<span style="color:#ce9178;">"2019-11-09"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">Enable:</span>&nbsp;<span style="color:#b5cea8;">1</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">CreateDate:</span>&nbsp;<span style="color:#ce9178;">"2020-22-18&nbsp;17:45:54"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;],
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">columns:</span>&nbsp;[
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//表配置</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"ExpertId"</span>,&nbsp;<span style="color:#6a9955;">//数据库表字段,必须和数据库一样，并且大小写一样</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"主键ID"</span>,&nbsp;<span style="color:#6a9955;">//表头显示的名称</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">isKey:</span>&nbsp;<span style="color:#569cd6;">true</span>,&nbsp;<span style="color:#6a9955;">//是否为主键字段</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">hidden:</span>&nbsp;<span style="color:#569cd6;">true</span>,&nbsp;<span style="color:#6a9955;">//是否显示</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"NotNull"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"不可为空"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">width:</span>&nbsp;<span style="color:#b5cea8;">70</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">required:</span>&nbsp;<span style="color:#569cd6;">true</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">edit:</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"text"</span>&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">sortable:</span>&nbsp;<span style="color:#569cd6;">true</span>,&nbsp;<span style="color:#6a9955;">//是否排序(目前第一个字段为排序字段，其他字段排序开发中)</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"LimitNumber"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"数字大小"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">summary:</span>&nbsp;<span style="color:#569cd6;">true</span>,&nbsp;<span style="color:#6a9955;">//设置求和，并可以实时计算</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">width:</span>&nbsp;<span style="color:#b5cea8;">70</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">require:</span>&nbsp;<span style="color:#569cd6;">true</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">edit:</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"number"</span>,&nbsp;<span style="color:#9cdcfe;">min:</span>&nbsp;<span style="color:#b5cea8;">3</span>,&nbsp;<span style="color:#9cdcfe;">max:</span>&nbsp;<span style="color:#b5cea8;">5</span>&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"EventClick"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"不可编辑"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"string"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">width:</span>&nbsp;<span style="color:#b5cea8;">80</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">require:</span>&nbsp;<span style="color:#569cd6;">true</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">cellStyle</span><span style="color:#9cdcfe;">:</span>&nbsp;(<span style="color:#9cdcfe;">row</span>,&nbsp;<span style="color:#9cdcfe;">rowIndex</span>,&nbsp;<span style="color:#9cdcfe;">columnIndex</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">row</span>.<span style="color:#9cdcfe;">EventClick</span>&nbsp;==&nbsp;<span style="color:#ce9178;">"不午休的猫"</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">background:</span>&nbsp;<span style="color:#ce9178;">"#2196F3"</span>,&nbsp;<span style="color:#9cdcfe;">color:</span>&nbsp;<span style="color:#ce9178;">"#ffff"</span>&nbsp;}
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"FormatString"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"格式化日期"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">width:</span>&nbsp;<span style="color:#b5cea8;">90</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">require:</span>&nbsp;<span style="color:#569cd6;">true</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">formatter</span><span style="color:#9cdcfe;">:</span>&nbsp;(<span style="color:#9cdcfe;">row</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//对单元格的数据格式化处理</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(!<span style="color:#9cdcfe;">row</span>.<span style="color:#9cdcfe;">FormatString</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#9cdcfe;">row</span>.<span style="color:#9cdcfe;">FormatString</span>.<span style="color:#dcdcaa;">replace</span>(<span style="color:#d16969;">/-/</span><span style="color:#569cd6;">g</span>,&nbsp;<span style="color:#ce9178;">"."</span>);
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"Enable"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"自动绑定KeyValue"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"byte"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">bind:</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">key:</span>&nbsp;<span style="color:#ce9178;">"enable"</span>,&nbsp;<span style="color:#9cdcfe;">data:</span>&nbsp;[]&nbsp;},&nbsp;<span style="color:#6a9955;">//此处值为data空数据，自行从后台字典数据源加载</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">width:</span>&nbsp;<span style="color:#b5cea8;">110</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">edit:</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"switch"</span>&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"CreateDate"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"日期"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"datetime"</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">width:</span>&nbsp;<span style="color:#b5cea8;">110</span>,
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">edit:</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"datetime"</span>&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;],
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;};
	</div>
	<div>
		&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#dcdcaa;">created</span>&nbsp;()&nbsp;{&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#dcdcaa;">mounted</span>&nbsp;()&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设置求和默认值,手动输入值后会自动计算</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">editTable1</span>.<span style="color:#9cdcfe;">summaryData</span>[<span style="color:#b5cea8;">2</span>]&nbsp;=&nbsp;<span style="color:#b5cea8;">10</span>;
	</div>
	<div>
		&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#9cdcfe;">methods:</span>&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">beginEdit</span>&nbsp;(<span style="color:#9cdcfe;">row</span>,&nbsp;<span style="color:#9cdcfe;">column</span>,&nbsp;<span style="color:#9cdcfe;">index</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">console</span>.<span style="color:#dcdcaa;">log</span>(<span style="color:#ce9178;">"编辑开始前"</span>&nbsp;+&nbsp;<span style="color:#4ec9b0;">JSON</span>.<span style="color:#dcdcaa;">stringify</span>(<span style="color:#9cdcfe;">row</span>));
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">true</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">endEditBefore</span>&nbsp;(<span style="color:#9cdcfe;">row</span>,&nbsp;<span style="color:#9cdcfe;">column</span>,&nbsp;<span style="color:#9cdcfe;">index</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">console</span>.<span style="color:#dcdcaa;">log</span>(<span style="color:#ce9178;">"结束编辑前"</span>&nbsp;+&nbsp;<span style="color:#4ec9b0;">JSON</span>.<span style="color:#dcdcaa;">stringify</span>(<span style="color:#9cdcfe;">row</span>));
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">true</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">endEditAfter</span>&nbsp;(<span style="color:#9cdcfe;">row</span>,&nbsp;<span style="color:#9cdcfe;">column</span>,&nbsp;<span style="color:#9cdcfe;">index</span>)&nbsp;{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">console</span>.<span style="color:#dcdcaa;">log</span>(<span style="color:#ce9178;">"结束编辑后"</span>&nbsp;+&nbsp;<span style="color:#4ec9b0;">JSON</span>.<span style="color:#dcdcaa;">stringify</span>(<span style="color:#9cdcfe;">row</span>));
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
  `,
  editTableKeep: `&lt;template&gt;<br />
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
  &nbsp; &nbsp; &nbsp; :model.sync="model"//vue3版本请使用v-model="model"<br />
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
  voltable: `<<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
  <div>
	  <span style="color:#808080;">&lt;</span><span style="color:#569cd6;">template</span><span style="color:#808080;">&gt;</span>
  </div>
  <div>
	  &nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">div</span>&nbsp;<span style="color:#9cdcfe;">class</span>=<span style="color:#ce9178;">"container"</span><span style="color:#808080;">&gt;</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#4ec9b0;">Alert</span>&nbsp;<span style="color:#9cdcfe;">type</span>=<span style="color:#ce9178;">"success"</span>&nbsp;<span style="color:#9cdcfe;">show-icon</span><span style="color:#808080;">&gt;</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;table从api加载数据
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">div</span>&nbsp;<span style="color:#9cdcfe;">slot</span>=<span style="color:#ce9178;">"desc"</span><span style="color:#808080;">&gt;</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;根据组件api文档中voltable配置table显示与数据加载，更多功能参数配置见组件api-&gt;voltable
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">div</span><span style="color:#808080;">&gt;</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;/</span><span style="color:#4ec9b0;">Alert</span><span style="color:#808080;">&gt;</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">&lt;!--&nbsp;查询配置&nbsp;--&gt;</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">div</span>&nbsp;<span style="color:#9cdcfe;">style</span>=<span style="color:#ce9178;">"padding:&nbsp;0px&nbsp;20px"</span><span style="color:#808080;">&gt;</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#4ec9b0;">VolHeader</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">icon</span>=<span style="color:#ce9178;">"md-apps"</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">text</span>=<span style="color:#ce9178;">"从api加载数据"</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">style</span>=<span style="color:#ce9178;">"margin-bottom:&nbsp;10px;&nbsp;border:&nbsp;0px;&nbsp;margin-top:&nbsp;15px"</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&gt;</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">div</span>&nbsp;<span style="color:#9cdcfe;">slot</span>=<span style="color:#ce9178;">"content"</span><span style="color:#808080;">&gt;&lt;/</span><span style="color:#569cd6;">div</span><span style="color:#808080;">&gt;</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">slot</span><span style="color:#808080;">&gt;</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">div</span>&nbsp;<span style="color:#9cdcfe;">style</span>=<span style="color:#ce9178;">"text-align:&nbsp;right"</span><span style="color:#808080;">&gt;</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#4ec9b0;">Input</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">style</span>=<span style="color:#ce9178;">"width:&nbsp;200px;&nbsp;margin-right:&nbsp;10px"</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">v-model</span>.<span style="color:#9cdcfe;">number</span>="<span style="color:#9cdcfe;">searchFields</span>.<span style="color:#9cdcfe;">Name</span>"
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">placeholder</span>=<span style="color:#ce9178;">"姓名"</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/<span style="color:#808080;">&gt;</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#4ec9b0;">DatePicker</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">style</span>=<span style="color:#ce9178;">"width:&nbsp;200px"</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type</span>=<span style="color:#ce9178;">"datetime"</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">placeholder</span>=<span style="color:#ce9178;">"提交时间"</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">v-model</span>="<span style="color:#9cdcfe;">searchFields</span>.<span style="color:#9cdcfe;">CreateDate1</span>"
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&gt;&lt;/</span><span style="color:#4ec9b0;">DatePicker</span><span style="color:#808080;">&gt;</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#4ec9b0;">DatePicker</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">style</span>=<span style="color:#ce9178;">"width:&nbsp;200px"</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type</span>=<span style="color:#ce9178;">"datetime"</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">placeholder</span>=<span style="color:#ce9178;">"提交时间"</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">v-model</span>="<span style="color:#9cdcfe;">searchFields</span>.<span style="color:#9cdcfe;">CreateDate2</span>"
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&gt;&lt;/</span><span style="color:#4ec9b0;">DatePicker</span><span style="color:#808080;">&gt;</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#4ec9b0;">Button</span>&nbsp;<span style="color:#9cdcfe;">type</span>=<span style="color:#ce9178;">"info"</span>&nbsp;<span style="color:#9cdcfe;">ghost</span>&nbsp;@<span style="color:#9cdcfe;">click</span>="<span style="color:#9cdcfe;">load</span>"&nbsp;<span style="color:#9cdcfe;">style</span>=<span style="color:#ce9178;">"margin-left:&nbsp;20px"</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&gt;</span>查询<span style="color:#808080;">&lt;/</span><span style="color:#4ec9b0;">Button</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&gt;</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#4ec9b0;">Button</span>&nbsp;<span style="color:#9cdcfe;">type</span>=<span style="color:#ce9178;">"info"</span>&nbsp;<span style="color:#9cdcfe;">ghost</span>&nbsp;@<span style="color:#9cdcfe;">click</span>="<span style="color:#9cdcfe;">del</span>"<span style="color:#808080;">&gt;</span>删除行<span style="color:#808080;">&lt;/</span><span style="color:#4ec9b0;">Button</span><span style="color:#808080;">&gt;</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#4ec9b0;">Button</span>&nbsp;<span style="color:#9cdcfe;">type</span>=<span style="color:#ce9178;">"info"</span>&nbsp;<span style="color:#9cdcfe;">ghost</span>&nbsp;@<span style="color:#9cdcfe;">click</span>="<span style="color:#9cdcfe;">getRows</span>"<span style="color:#808080;">&gt;</span>获取选中的行<span style="color:#808080;">&lt;/</span><span style="color:#4ec9b0;">Button</span><span style="color:#808080;">&gt;</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">div</span><span style="color:#808080;">&gt;</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">slot</span><span style="color:#808080;">&gt;</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;/</span><span style="color:#4ec9b0;">VolHeader</span><span style="color:#808080;">&gt;</span>
  </div>
<br />
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">&lt;!--&nbsp;table数据&nbsp;--&gt;</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">&lt;!--&nbsp;:max-height="450"&nbsp;--&gt;</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">vol-table</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">ref</span>=<span style="color:#ce9178;">"table"</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">loadKey</span>="<span style="color:#569cd6;">true</span>"
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">columns</span>="<span style="color:#9cdcfe;">columns</span>"
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">pagination-hide</span>="<span style="color:#569cd6;">false</span>"
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">height</span>="<span style="color:#b5cea8;">200</span>"
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">url</span>="<span style="color:#9cdcfe;">url</span>"
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">index</span>="<span style="color:#569cd6;">true</span>"
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">click-edit</span>="<span style="color:#569cd6;">true</span>"
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@<span style="color:#9cdcfe;">endEditBefore</span>="<span style="color:#9cdcfe;">endEditBefore</span>"
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span style="color:#9cdcfe;">beginEdit</span>="<span style="color:#9cdcfe;">beginEdit</span>"
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@<span style="color:#9cdcfe;">loadBefore</span>="<span style="color:#9cdcfe;">loadTableBefore</span>"
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@<span style="color:#9cdcfe;">loadAfter</span>="<span style="color:#9cdcfe;">loadTableAfter</span>"
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#808080;">&gt;&lt;/</span><span style="color:#569cd6;">vol-table</span><span style="color:#808080;">&gt;</span>
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
	  <span style="color:#c586c0;">import</span>&nbsp;<span style="color:#9cdcfe;">VolTable</span>&nbsp;<span style="color:#c586c0;">from</span>&nbsp;<span style="color:#ce9178;">"@/components/basic/VolTable.vue"</span>;
  </div>
  <div>
	  <span style="color:#c586c0;">import</span>&nbsp;<span style="color:#9cdcfe;">VolHeader</span>&nbsp;<span style="color:#c586c0;">from</span>&nbsp;<span style="color:#ce9178;">"@/components/basic/VolHeader.vue"</span>;
  </div>
  <div>
	  <span style="color:#c586c0;">export</span>&nbsp;<span style="color:#c586c0;">default</span>&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;<span style="color:#9cdcfe;">components:</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">VolTable</span>,&nbsp;<span style="color:#9cdcfe;">VolHeader</span>&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;<span style="color:#dcdcaa;">created</span>()&nbsp;{},
  </div>
  <div>
	  &nbsp;&nbsp;<span style="color:#dcdcaa;">data</span>()&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//查询条件字段</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">searchFields:</span>&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">CreateDate1:</span>&nbsp;<span style="color:#ce9178;">""</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">CreateDate2:</span>&nbsp;<span style="color:#ce9178;">""</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">UserName:</span>&nbsp;<span style="color:#ce9178;">""</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">url:</span>&nbsp;<span style="color:#ce9178;">"api/App_Transaction/getPageData"</span>,&nbsp;<span style="color:#6a9955;">//后从加载数据的url</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">columns:</span>&nbsp;[
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"Id"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"主键ID"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"int"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">width:</span>&nbsp;<span style="color:#b5cea8;">90</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">hidden:</span>&nbsp;<span style="color:#569cd6;">true</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">readonly:</span>&nbsp;<span style="color:#569cd6;">true</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">require:</span>&nbsp;<span style="color:#569cd6;">true</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"Name"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"姓名"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"string"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">width:</span>&nbsp;<span style="color:#b5cea8;">90</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">require:</span>&nbsp;<span style="color:#569cd6;">true</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">edit:</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"text"</span>&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"PhoneNo"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"电话"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"string"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">link:</span>&nbsp;<span style="color:#569cd6;">true</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">width:</span>&nbsp;<span style="color:#b5cea8;">100</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">require:</span>&nbsp;<span style="color:#569cd6;">true</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"Quantity"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"数量"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"int"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">width:</span>&nbsp;<span style="color:#b5cea8;">80</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">require:</span>&nbsp;<span style="color:#569cd6;">true</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">edit:</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"text"</span>&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"TransactionType"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"是否买入"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"int"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">bind:</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">key:</span>&nbsp;<span style="color:#ce9178;">"cq"</span>,&nbsp;<span style="color:#9cdcfe;">data:</span>&nbsp;[]&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">width:</span>&nbsp;<span style="color:#b5cea8;">80</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">edit:</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"switch"</span>&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"CowType"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"购买类型"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"string"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">bind:</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">key:</span>&nbsp;<span style="color:#ce9178;">"nav"</span>,&nbsp;<span style="color:#9cdcfe;">data:</span>&nbsp;[]&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">width:</span>&nbsp;<span style="color:#b5cea8;">130</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">edit:</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"select"</span>&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"Describe"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"描述"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"string"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">width:</span>&nbsp;<span style="color:#b5cea8;">120</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">require:</span>&nbsp;<span style="color:#569cd6;">true</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"CreateDate"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"提交时间"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">"datetime"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">width:</span>&nbsp;<span style="color:#b5cea8;">130</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">field:</span>&nbsp;<span style="color:#ce9178;">"操作"</span>,&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"操作"</span>,&nbsp;<span style="color:#9cdcfe;">width:</span>&nbsp;<span style="color:#b5cea8;">120</span>,&nbsp;<span style="color:#9cdcfe;">render:</span>&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#dcdcaa;">getRender</span>()&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;],
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
	  &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//点击查询时生成查询条件</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">loadTableBefore</span>(<span style="color:#9cdcfe;">param</span>,&nbsp;<span style="color:#9cdcfe;">callBack</span>)&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//此处是从后台加数据前的处理，自己在此处自定义查询条件,查询数据格式自己定义或参考代码生成器查询页面请求的数据格式</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">console</span>.<span style="color:#dcdcaa;">log</span>(<span style="color:#ce9178;">"加载数据前"</span>&nbsp;+&nbsp;<span style="color:#9cdcfe;">param</span>);
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//生成查询条件</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">param</span>.<span style="color:#9cdcfe;">wheres</span>&nbsp;=&nbsp;[
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设置为like模糊查询</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span style="color:#9cdcfe;">name:</span>&nbsp;<span style="color:#ce9178;">"Name"</span>,&nbsp;<span style="color:#9cdcfe;">value:</span>&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">searchFields</span>.<span style="color:#9cdcfe;">Name</span>,&nbsp;<span style="color:#9cdcfe;">displayType:</span>&nbsp;<span style="color:#ce9178;">"like"</span>&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设置日期查询&gt;=、&lt;=</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">name:</span>&nbsp;<span style="color:#ce9178;">"CreateDate"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">value:</span>&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">searchFields</span>.<span style="color:#9cdcfe;">CreateDate1</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">displayType:</span>&nbsp;<span style="color:#ce9178;">"thanorequal"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">name:</span>&nbsp;<span style="color:#ce9178;">"CreateDate"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">value:</span>&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">searchFields</span>.<span style="color:#9cdcfe;">CreateDate2</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">displayType:</span>&nbsp;<span style="color:#ce9178;">"lessorequal"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;];
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">callBack</span>(<span style="color:#569cd6;">true</span>);&nbsp;<span style="color:#6a9955;">//此处必须进行回调，返回处理结果，如果是false，则不会执行后台查询</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">loadTableAfter</span>(<span style="color:#9cdcfe;">data</span>,&nbsp;<span style="color:#9cdcfe;">callBack</span>)&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//此处是从后台加数据后，你可以在渲染表格前，预先处理返回的数据</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">console</span>.<span style="color:#dcdcaa;">log</span>(<span style="color:#ce9178;">"加载数据后"</span>&nbsp;+&nbsp;<span style="color:#9cdcfe;">data</span>);
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">callBack</span>(<span style="color:#569cd6;">true</span>);&nbsp;<span style="color:#6a9955;">//同上</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">load</span>()&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//此处可以自定义查询条件,如果不调用的框架的查询，格式需要自己定义，</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//如果查询的是框架getPageData方法,需要指定格式,如:</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;let&nbsp;where={wheres:[{"name":"UserTrueName","value":"教兽",displayType:"text"}]};</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">let</span>&nbsp;<span style="color:#9cdcfe;">where</span>&nbsp;=&nbsp;{};
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">table</span>.<span style="color:#dcdcaa;">load</span>(<span style="color:#9cdcfe;">where</span>);
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">del</span>()&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">let</span>&nbsp;<span style="color:#9cdcfe;">rows</span>&nbsp;=&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">table</span>.<span style="color:#dcdcaa;">getSelected</span>();
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">rows</span>.<span style="color:#9cdcfe;">length</span>&nbsp;==&nbsp;<span style="color:#b5cea8;">0</span>)&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$message</span>.<span style="color:#dcdcaa;">error</span>(<span style="color:#ce9178;">"请先选中行"</span>);
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#dcdcaa;">delClick</span>();
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;this.$refs.table.delRow();</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//此处可以接着写删除后台的代码</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">getRows</span>()&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">let</span>&nbsp;<span style="color:#9cdcfe;">rows</span>&nbsp;=&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">table</span>.<span style="color:#dcdcaa;">getSelected</span>();
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">rows</span>.<span style="color:#9cdcfe;">length</span>&nbsp;==&nbsp;<span style="color:#b5cea8;">0</span>)&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$message</span>.<span style="color:#dcdcaa;">error</span>(<span style="color:#ce9178;">"请先选中行1"</span>);
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">let</span>&nbsp;<span style="color:#9cdcfe;">text</span>&nbsp;=&nbsp;<span style="color:#ce9178;">"当前选中的行数据："</span>&nbsp;+&nbsp;<span style="color:#4ec9b0;">JSON</span>.<span style="color:#dcdcaa;">stringify</span>(<span style="color:#9cdcfe;">rows</span>);
  </div>
<br />
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$Message</span>.<span style="color:#dcdcaa;">info</span>(<span style="color:#9cdcfe;">text</span>);
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">endEditBefore</span>(<span style="color:#9cdcfe;">row</span>,&nbsp;<span style="color:#9cdcfe;">column</span>,&nbsp;<span style="color:#9cdcfe;">index</span>)&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//可以自动结束编辑时，自动执行保存，下面getRender的保存按钮去掉</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;this.editSave();</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">true</span>;
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">beginEdit</span>(<span style="color:#9cdcfe;">row</span>,&nbsp;<span style="color:#9cdcfe;">column</span>,&nbsp;<span style="color:#9cdcfe;">index</span>){
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//编辑前将购买类型转换成数字，否则与字典的类型对应不上绑定不了默认值</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">row</span>.<span style="color:#9cdcfe;">CowType</span>=&nbsp;<span style="color:#9cdcfe;">row</span>.<span style="color:#9cdcfe;">CowType</span>*<span style="color:#b5cea8;">1</span>;
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">true</span>;
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;},&nbsp;
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">editSave</span>(<span style="color:#9cdcfe;">row</span>)&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//调用框架的默认保存方法</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">http</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.<span style="color:#dcdcaa;">post</span>(<span style="color:#ce9178;">"/api/App_Transaction/update"</span>,&nbsp;{&nbsp;<span style="color:#9cdcfe;">mainData:</span>&nbsp;<span style="color:#9cdcfe;">row</span>&nbsp;},&nbsp;<span style="color:#569cd6;">true</span>)
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.<span style="color:#dcdcaa;">then</span>((<span style="color:#9cdcfe;">x</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$Message</span>.<span style="color:#dcdcaa;">info</span>(<span style="color:#ce9178;">"保存成功"</span>);
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">console</span>.<span style="color:#dcdcaa;">log</span>(<span style="color:#ce9178;">"保存结果："</span>&nbsp;+&nbsp;<span style="color:#4ec9b0;">JSON</span>.<span style="color:#dcdcaa;">stringify</span>(<span style="color:#9cdcfe;">x</span>));
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;});
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">delClick</span>(<span style="color:#9cdcfe;">row</span>)&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//删除</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">let</span>&nbsp;<span style="color:#9cdcfe;">tigger</span>&nbsp;=&nbsp;<span style="color:#569cd6;">false</span>;
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$Modal</span>.<span style="color:#dcdcaa;">confirm</span>({
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">title:</span>&nbsp;<span style="color:#ce9178;">"删除警告!"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">content:</span>&nbsp;<span style="color:#ce9178;">"确认要删除选择的数据吗?"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onOk</span><span style="color:#9cdcfe;">:</span>&nbsp;()&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">tigger</span>)&nbsp;<span style="color:#c586c0;">return</span>;
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">tigger</span>&nbsp;=&nbsp;<span style="color:#569cd6;">true</span>;
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">let</span>&nbsp;<span style="color:#9cdcfe;">url</span>&nbsp;=&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#dcdcaa;">getUrl</span>(<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">const</span>.<span style="color:#4fc1ff;">DEL</span>);
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">http</span>.<span style="color:#dcdcaa;">post</span>(<span style="color:#9cdcfe;">url</span>,&nbsp;[<span style="color:#9cdcfe;">row</span>.<span style="color:#9cdcfe;">Id</span>],&nbsp;<span style="color:#ce9178;">"正在删除数据...."</span>).<span style="color:#dcdcaa;">then</span>((<span style="color:#9cdcfe;">x</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(!<span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">status</span>)&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#dcdcaa;">$error</span>(<span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">message</span>);
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#dcdcaa;">$success</span>(<span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">message</span>);
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#dcdcaa;">refresh</span>();
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;});
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},&nbsp;<span style="color:#6a9955;">//,&nbsp;onCancel:&nbsp;()&nbsp;=&gt;&nbsp;{}</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;});
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">getRender</span>()&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;(<span style="color:#9cdcfe;">h</span>,&nbsp;{&nbsp;<span style="color:#9cdcfe;">row</span>,&nbsp;<span style="color:#9cdcfe;">column</span>,&nbsp;<span style="color:#9cdcfe;">index</span>&nbsp;})&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#dcdcaa;">h</span>(<span style="color:#ce9178;">"div"</span>,&nbsp;{&nbsp;<span style="color:#9cdcfe;">style:</span>&nbsp;{}&nbsp;},&nbsp;[
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">h</span>(
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">"a"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">props:</span>&nbsp;{},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">style:</span>&nbsp;{&nbsp;<span style="color:#ce9178;">"border-bottom"</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"1px&nbsp;solid"</span>&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">on:</span>&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">click</span><span style="color:#9cdcfe;">:</span>&nbsp;(<span style="color:#9cdcfe;">e</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">e</span>.<span style="color:#dcdcaa;">stopPropagation</span>();
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#dcdcaa;">delClick</span>(<span style="color:#9cdcfe;">row</span>);
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">"删除"</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;),
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">h</span>(
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">"a"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">props:</span>&nbsp;{},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">style:</span>&nbsp;{&nbsp;<span style="color:#ce9178;">"margin-left"</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"9px"</span>,&nbsp;<span style="color:#ce9178;">"border-bottom"</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"1px&nbsp;solid"</span>&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">on:</span>&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">click</span><span style="color:#9cdcfe;">:</span>&nbsp;(<span style="color:#9cdcfe;">e</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">e</span>.<span style="color:#dcdcaa;">stopPropagation</span>();
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//将当前行设置为编辑行</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">table</span>.<span style="color:#9cdcfe;">edit</span>.<span style="color:#9cdcfe;">rowIndex</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">index</span>;
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">"编辑"</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;),
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">h</span>(
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">"a"</span>,
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">props:</span>&nbsp;{},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">style:</span>&nbsp;{&nbsp;<span style="color:#ce9178;">"margin-left"</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"9px"</span>,&nbsp;<span style="color:#ce9178;">"border-bottom"</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"1px&nbsp;solid"</span>&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">on:</span>&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">click</span><span style="color:#9cdcfe;">:</span>&nbsp;(<span style="color:#9cdcfe;">e</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">e</span>.<span style="color:#dcdcaa;">stopPropagation</span>();
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//强制结束编辑</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">table</span>.<span style="color:#9cdcfe;">edit</span>.<span style="color:#9cdcfe;">rowIndex</span>&nbsp;=&nbsp;-<span style="color:#b5cea8;">1</span>;
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//执行保存方法</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#dcdcaa;">editSave</span>(<span style="color:#9cdcfe;">row</span>);
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">"保存"</span>
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;),
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;]);
  </div>
  <div>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
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
</div>`,
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
