<template>
  <div>
    <div class="vol-header">
      <div class="project">vol移动端(uni-app)接口文档1.0</div>
      <div class="vol-doc-search">
        <input type="text" v-model="value" placeholder="搜索文档..." />
        <!-- <van-field v-model="value" placeholder="搜索文档..." /> -->
      </div>
      <div
        @click="toApp()"
        class="vol-api"
        :class="{ apiActived: apiActived == 0 }"
      >
        组件API
      </div>
    </div>
    <div class="vol-doc-nav" :style="{ top: navTop }">
      <div
        v-for="(item, index) in api"
        :class="{ 't-actived': index === tIndex }"
        :key="index"
        @click="to(index, index)"
      >
        <div class="title">
          <div class="nav-first">{{ cnIndex[index] + item.title }}</div>
          <div class="nav-children">
            <div
              v-for="(citem, cindex) in item.children"
              :class="{ 't-actived': index + '-' + cindex == tIndex }"
              :key="cindex"
            >
              <div>{{ cindex + 1 }}. {{ citem.title }}</div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="vol-doc-content">
      <h1>vue-在线接口文档1.0</h1>
      <div class="vol-doc-api-list">
        <div class="imgs">
          <div data-v-89fedde6="" class="imgs">
            <div data-v-89fedde6="">
              <h3 data-v-89fedde6="">微信小程序</h3>
              <img
                data-v-89fedde6=""
                src="https://app-1256993465.cos.ap-nanjing.myqcloud.com/wechat.jpg"
              />
            </div>
            <div data-v-89fedde6="">
              <h3 data-v-89fedde6="">安卓扫描下载</h3>
              <img
                data-v-89fedde6=""
                src="https://app-1256993465.cos.ap-nanjing.myqcloud.com/Android.png"
              />
            </div>
            <div data-v-89fedde6="" style="margin-left: 30px">
              <h3 data-v-89fedde6="">手机浏览器访问</h3>
              <img
                data-v-89fedde6=""
                src="https://app-1256993465.cos.ap-nanjing.myqcloud.com/H5.png"
              />
            </div>
          </div>
        </div>
        <div v-for="(item, index) in api" :key="index">
          <div class="title">
            <div class="api-list-first">{{ cnIndex[index] + item.title }}</div>
            <div class="api-list-children">
              <div
                class="children-item"
                :class="{
                  'event-item-actived': tIndex == index + '-' + cindex,
                }"
                v-for="(citem, cindex) in item.tables"
                :key="cindex"
              >
                <div :id="index" class="api-list-title">
                  {{ cindex + 1 }}. {{ citem.title }}
                </div>
                <!-- <div class="doc-html" v-if="citem.html" v-html="citem.html"></div> -->
                <div class="doc-parms">
                  <div>{{ citem.title }}</div>
                  <table border="1">
                    <tr>
                      <td>属性</td>
                      <td>说明</td>
                      <td>类型</td>
                      <td>默认值</td>
                    </tr>
                    <tr v-for="(pitem, tbindex) in citem.data" :key="tbindex">
                      <td>{{ pitem.attr }}</td>
                      <td>{{ pitem.desc }}</td>
                      <td>{{ pitem.type }}</td>
                      <td>{{ pitem.value }}</td>
                    </tr>
                  </table>
                </div>
                <div class="doc-parms" v-if="citem.response">
                  <div>返回对象data：</div>
                  <div class="response-html" v-html="citem.response"></div>
                </div>
              </div>
              <div v-if="item.html" style="margin-bottom: 40px">
                <a @click="item.show = !item.show">查看代码</a>
                <div v-show="item.show" v-html="item.html"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      cnIndex: ["1、", "2、", "3、", "4、", "5、"],
      apiActived: 0,
      tIndex: "0-0",
      value: "",
      navTop: "60px",
      api: [
        {
          title: "volform表单组件",
          show: false,
          html: `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;">
							<div>
								<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">template</span><span style="color:#808080;">&gt;</span> 
							</div>
							<div>
								&nbsp; <span style="color:#808080;">&lt;</span><span style="color:#569cd6;">view</span> <span style="color:#9cdcfe;">class</span>=<span style="color:#ce9178;">"form-test"</span><span style="color:#808080;">&gt;</span> 
							</div>
							<div>
								&nbsp; &nbsp; <span style="color:#6a9955;">&lt;!-- 表单配置--&gt;</span> 
							</div>
							<div>
								&nbsp; &nbsp; <span style="color:#6a9955;">&lt;!--onChange: 下拉框、日期选择时会调用此方法--&gt;</span> 
							</div>
							<div>
								&nbsp; &nbsp; <span style="color:#808080;">&lt;</span><span style="color:#569cd6;">vol-form</span> 
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; @<span style="color:#9cdcfe;">onChange</span>="<span style="color:#9cdcfe;">onChange</span>"
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; :<span style="color:#9cdcfe;">load-key</span>="<span style="color:#569cd6;">true</span>"
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">ref</span>=<span style="color:#ce9178;">"form"</span> 
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; :<span style="color:#9cdcfe;">form-options</span>.<span style="color:#9cdcfe;">sync</span>="<span style="color:#9cdcfe;">editFormOptions</span>"
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; :<span style="color:#9cdcfe;">formFields</span>.<span style="color:#9cdcfe;">sync</span>="<span style="color:#9cdcfe;">editFormFields</span>"
							</div>
							<div>
								&nbsp; &nbsp; <span style="color:#808080;">&gt;</span> 
							</div>
							<div>
								&nbsp; &nbsp; <span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">vol-form</span><span style="color:#808080;">&gt;</span> 
							</div>
						<br />
							<div>
								&nbsp; &nbsp; <span style="color:#808080;">&lt;</span><span style="color:#569cd6;">view</span> <span style="color:#9cdcfe;">class</span>=<span style="color:#ce9178;">"btns"</span><span style="color:#808080;">&gt;</span> 
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; <span style="color:#808080;">&lt;</span><span style="color:#569cd6;">view</span> <span style="color:#9cdcfe;">class</span>=<span style="color:#ce9178;">"btn"</span><span style="color:#808080;">&gt;</span> 
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#808080;">&lt;</span><span style="color:#569cd6;">u</span><span style="color:#9cdcfe;">-button</span> 
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">type</span>=<span style="color:#ce9178;">"primary"</span> 
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; @<span style="color:#9cdcfe;">click</span>="<span style="color:#9cdcfe;">reset</span>"
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">shape</span>=<span style="color:#ce9178;">"circle"</span> 
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">text</span>=<span style="color:#ce9178;">"重置表单"</span> 
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#808080;">&gt;&lt;/</span><span style="color:#569cd6;">u</span><span style="color:#9cdcfe;">-button</span><span style="color:#808080;">&gt;</span> 
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; <span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">view</span><span style="color:#808080;">&gt;</span> 
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; <span style="color:#808080;">&lt;</span><span style="color:#569cd6;">view</span> <span style="color:#9cdcfe;">class</span>=<span style="color:#ce9178;">"btn"</span><span style="color:#808080;">&gt;</span> 
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#808080;">&lt;</span><span style="color:#569cd6;">u</span><span style="color:#9cdcfe;">-button</span> 
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">type</span>=<span style="color:#ce9178;">"success"</span> 
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; @<span style="color:#9cdcfe;">click</span>="<span style="color:#9cdcfe;">vailForm</span>"
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">shape</span>=<span style="color:#ce9178;">"circle"</span> 
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">text</span>=<span style="color:#ce9178;">"校验表单"</span> 
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#808080;">&gt;&lt;/</span><span style="color:#569cd6;">u</span><span style="color:#9cdcfe;">-button</span><span style="color:#808080;">&gt;</span> 
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; <span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">view</span><span style="color:#808080;">&gt;</span> 
							</div>
							<div>
								&nbsp; &nbsp; <span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">view</span><span style="color:#808080;">&gt;</span> 
							</div>
							<div>
								&nbsp; <span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">view</span><span style="color:#808080;">&gt;</span> 
							</div>
							<div>
								<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">template</span><span style="color:#808080;">&gt;</span> 
							</div>
						<br />
							<div>
								<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">script</span><span style="color:#808080;">&gt;</span> 
							</div>
							<div>
								<span style="color:#c586c0;">export</span> <span style="color:#c586c0;">default</span> {
							</div>
							<div>
								&nbsp; <span style="color:#dcdcaa;">data</span>() {
							</div>
							<div>
								&nbsp; &nbsp; <span style="color:#c586c0;">return</span> {
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">editFormFields:</span> {
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">inputText:</span> <span style="color:#ce9178;">'这是必填输入框'</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">textarea:</span> <span style="color:#ce9178;">'这里的文字有点长这里的文字有点长这里的文字有点长。。'</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">pwd:</span> <span style="color:#ce9178;">'12345'</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">readonlyText:</span> <span style="color:#ce9178;">'只读输入框'</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">selectVal:</span> <span style="color:#ce9178;">''</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">selectListVal:</span> [], <span style="color:#6a9955;">//多选这里的值是数组</span> 
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">dateValue:</span> <span style="color:#ce9178;">'2022-03-27'</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">datetimeValue:</span> <span style="color:#ce9178;">'2022-03-27 20:15'</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">dateRange:</span> [<span style="color:#ce9178;">'2022-03-10'</span>, <span style="color:#ce9178;">'2022-06-20'</span>], <span style="color:#6a9955;">//数组</span> 
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">switchValue:</span> <span style="color:#b5cea8;">1</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">selectClickValue:</span> <span style="color:#ce9178;">''</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">dateClickValue:</span> <span style="color:#569cd6;">null</span> 
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; },
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">editFormOptions:</span> [
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; {
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">title:</span> <span style="color:#ce9178;">'输入框'</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">required:</span> <span style="color:#569cd6;">true</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">field:</span> <span style="color:#ce9178;">'inputText'</span> 
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; },
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; {
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">title:</span> <span style="color:#ce9178;">'多文本'</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">field:</span> <span style="color:#ce9178;">'textarea'</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">type:</span> <span style="color:#ce9178;">'textarea'</span> 
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; },
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; {
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">title:</span> <span style="color:#ce9178;">'密码框'</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">field:</span> <span style="color:#ce9178;">'pwd'</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">type:</span> <span style="color:#ce9178;">'password'</span> 
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; },
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; {
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">title:</span> <span style="color:#ce9178;">'只读框'</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">field:</span> <span style="color:#ce9178;">'readonlyText'</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">type:</span> <span style="color:#ce9178;">'text'</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">readonly:</span> <span style="color:#569cd6;">true</span> 
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; },
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; {
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">type:</span> <span style="color:#ce9178;">'group'</span> <span style="color:#6a9955;">//表单分组</span> 
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; },
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; {
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">title:</span> <span style="color:#ce9178;">'下拉框'</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">field:</span> <span style="color:#ce9178;">'selectVal'</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">type:</span> <span style="color:#ce9178;">'select'</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">required:</span> <span style="color:#569cd6;">true</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">data:</span> [],
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">key:</span> <span style="color:#ce9178;">'pn'</span> 
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; },
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; {
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">title:</span> <span style="color:#ce9178;">'多选框'</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">field:</span> <span style="color:#ce9178;">'selectListVal'</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">type:</span> <span style="color:#ce9178;">'selectList'</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">required:</span> <span style="color:#569cd6;">true</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">data:</span> [],
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">key:</span> <span style="color:#ce9178;">'pn'</span> 
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; },
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; {
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">type:</span> <span style="color:#ce9178;">'group'</span> <span style="color:#6a9955;">//表单分组</span> 
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; },
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; {
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">title:</span> <span style="color:#ce9178;">'日期'</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">required:</span> <span style="color:#569cd6;">true</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">type:</span> <span style="color:#ce9178;">'date'</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">field:</span> <span style="color:#ce9178;">'dateValue'</span> 
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; },
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; {
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">title:</span> <span style="color:#ce9178;">'日期时分秒'</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">type:</span> <span style="color:#ce9178;">'datetime'</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">field:</span> <span style="color:#ce9178;">'datetimeValue'</span> 
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; },
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; {
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">title:</span> <span style="color:#ce9178;">'日期范围'</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">type:</span> <span style="color:#ce9178;">'date'</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">range:</span> <span style="color:#569cd6;">true</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">field:</span> <span style="color:#ce9178;">'dateRange'</span> 
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; },
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; {
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">type:</span> <span style="color:#ce9178;">'group'</span> <span style="color:#6a9955;">//表单分组</span> 
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; },
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; {
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">title:</span> <span style="color:#ce9178;">'单选'</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">type:</span> <span style="color:#ce9178;">'switch'</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">field:</span> <span style="color:#ce9178;">'switchValue'</span> 
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; },
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; {
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">type:</span> <span style="color:#ce9178;">'group'</span>, <span style="color:#6a9955;">//表单分组</span> 
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">title:</span> <span style="color:#ce9178;">'注册选择事件,见onChange方法说明'</span> 
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; },
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; {
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">title:</span> <span style="color:#ce9178;">'下拉框事件'</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">type:</span> <span style="color:#ce9178;">'select'</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">field:</span> <span style="color:#ce9178;">'selectClickValue'</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">data:</span> [],
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">key:</span> <span style="color:#ce9178;">'pn'</span> 
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; },
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; {
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">title:</span> <span style="color:#ce9178;">'日期事件'</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">type:</span> <span style="color:#ce9178;">'date'</span>,
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">field:</span> <span style="color:#ce9178;">'dateClickValue'</span> 
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; }
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; ]
							</div>
							<div>
								&nbsp; &nbsp; };
							</div>
							<div>
								&nbsp; },
							</div>
							<div>
								&nbsp; <span style="color:#9cdcfe;">methods:</span> {
							</div>
							<div>
								&nbsp; &nbsp; <span style="color:#dcdcaa;">onChange</span>(<span style="color:#9cdcfe;">field</span>, <span style="color:#9cdcfe;">value</span>) {
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//日期与下拉框选择事件</span> 
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">if</span> (<span style="color:#9cdcfe;">field</span> == <span style="color:#ce9178;">'selectClickValue'</span> || <span style="color:#9cdcfe;">field</span> == <span style="color:#ce9178;">'dateClickValue'</span>) {
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#569cd6;">this</span>.<span style="color:#dcdcaa;">$toast</span>(<span style="color:#ce9178;">"选择字段"</span>+<span style="color:#9cdcfe;">field</span>+<span style="color:#ce9178;">"值+"</span><span style="color:#9cdcfe;">value</span>);
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; }
							</div>
							<div>
								&nbsp; &nbsp; },
							</div>
							<div>
								&nbsp; &nbsp; <span style="color:#dcdcaa;">vailForm</span>() {
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">if</span> (<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">form</span>.<span style="color:#dcdcaa;">validate</span>()) {
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#569cd6;">this</span>.<span style="color:#dcdcaa;">$toast</span>(<span style="color:#ce9178;">'表单校验成功'</span>);
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; }
							</div>
							<div>
								&nbsp; &nbsp; },
							</div>
							<div>
								&nbsp; &nbsp; <span style="color:#dcdcaa;">reset</span>() {
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; <span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">form</span>.<span style="color:#dcdcaa;">reset</span>();
							</div>
							<div>
								&nbsp; &nbsp; &nbsp; <span style="color:#569cd6;">this</span>.<span style="color:#dcdcaa;">$toast</span>(<span style="color:#ce9178;">'表单已重置'</span>);
							</div>
							<div>
								&nbsp; &nbsp; }
							</div>
							<div>
								&nbsp; },
							</div>
							<div>
								&nbsp; <span style="color:#dcdcaa;">onShow</span>() {}
							</div>
							<div>
								};
							</div>
							<div>
								<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">script</span><span style="color:#808080;">&gt;</span> 
							</div>
						<br />
							<div>
								<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">style</span> <span style="color:#9cdcfe;">lang</span>=<span style="color:#ce9178;">"less"</span> <span style="color:#9cdcfe;">scoped</span><span style="color:#808080;">&gt;</span> 
							</div>
							<div>
								<span style="color:#d7ba7d;">.form-test</span> {
							</div>
							<div>
								&nbsp; <span style="color:#9cdcfe;">margin-top</span>: <span style="color:#b5cea8;">-20</span>rpx;
							</div>
							<div>
								&nbsp; <span style="color:#9cdcfe;">background</span>: <span style="color:#ce9178;">#fbfbfb</span>;
							</div>
							<div>
								&nbsp; <span style="color:#9cdcfe;">padding-top</span>: <span style="color:#b5cea8;">20</span>rpx;
							</div>
							<div>
								}
							</div>
						<br />
							<div>
								<span style="color:#d7ba7d;">.btns</span> {
							</div>
							<div>
								&nbsp; <span style="color:#9cdcfe;">display</span>: <span style="color:#ce9178;">flex</span>;
							</div>
							<div>
								&nbsp; <span style="color:#9cdcfe;">padding</span>: <span style="color:#b5cea8;">0</span>rpx <span style="color:#b5cea8;">20</span>rpx;
							</div>
						<br />
							<div>
								&nbsp; <span style="color:#d7ba7d;">.btn</span> {
							</div>
							<div>
								&nbsp; &nbsp; <span style="color:#9cdcfe;">flex</span>: <span style="color:#b5cea8;">1</span>;
							</div>
							<div>
								&nbsp; &nbsp; <span style="color:#9cdcfe;">padding</span>: <span style="color:#b5cea8;">20</span>rpx;
							</div>
							<div>
								&nbsp; }
							</div>
							<div>
								}
							</div>
							<div>
								<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">style</span><span style="color:#808080;">&gt;</span> 
							</div>
						<br />
						</div>
						<!-- 表单配置-->
							<!--onChange: 下拉框、日期选择时会调用此方法-->
							<vol-form @onchange="onChange" :load-key="true" ref="form" :form-options.sync="editFormOptions" :formfields.sync="editFormFields"><u-button type="primary" @click="reset" shape="circle" text="重置表单"><u-button type="success" @click="vailForm" shape="circle" text="校验表单"> `,
          tables: [
            {
              title: "props",
              data: [
                {
                  attr: "formOptions",
                  desc: "字段配置信息(见下面formOptions说明或查看代码editFormOptions属性)",
                  type: "Array",
                  value: "[]",
                },
                {
                  attr: "formFields",
                  desc: "字段(见下面的查看代码editFormFields属性)",
                  type: "{}",
                  value: "{}",
                },
                {
                  attr: "padding",
                  desc: "表单padding",
                  type: "Number",
                  value: "30",
                },
                {
                  attr: "labelPosition",
                  desc: "字段名称显示位置:left/top",
                  type: "String",
                  value: "left",
                },
                {
                  attr: "loadKey",
                  desc: "是否默认加载数据源",
                  type: "bool",
                  value: "true",
                },
              ],
            },
            {
              title: "formOptions",
              data: [
                {
                  attr: "title",
                  desc: "字段名字",
                  type: "String",
                  value: "",
                },
                {
                  attr: "required",
                  desc: "是否必填",
                  type: "bool",
                  value: "false",
                },
                {
                  attr: "field",
                  desc: "字段(与上面formFields的属性对应,或者见下面的查看代码editFormFields属性)",
                  type: "String",
                  value: "",
                },
                {
                  attr: "type",
                  desc: "显示类型：text、password、group(分组显示见下面的查看代码中的group)、select、selectList(下拉框多选)、date(年月日)、datetime(年月日时分秒)、switch(单选)",
                  type: "String",
                  value: "left",
                },
                {
                  attr: "focus",
                  desc: "是否获取焦点",
                  type: "bool",
                  value: "false",
                },
              ],
            },
            {
              title: "methods",
              data: [
                {
                  attr: "onChange",
                  desc: "日期、下拉框选中事件，见下面的查看代码onChange使用",
                  type: "",
                  value: "",
                },
                {
                  attr: "validate",
                  desc: "校验表单,this.$refs.名字.validate()，见下面的查看代码validate使用",
                  type: "",
                  value: "",
                },
                {
                  attr: "reset",
                  desc: "重置表单,this.$refs.名字.reset()，见下面的查看代码validate使用",
                  type: "",
                  value: "",
                },
              ],
            },
          ],
        },
        {
          title: "voltable",
          show: false,
          html: `<p>
							<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;">
								<br />
								<div>
									<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">template</span><span style="color:#808080;">&gt;</span>
								</div>
								<div>
									&nbsp; <span style="color:#808080;">&lt;</span><span style="color:#f44747;">view</span> <span style="color:#9cdcfe;">style</span>="<span style="color:#9cdcfe;">overflow</span>: <span style="color:#ce9178;">hidden</span>"<span style="color:#808080;">&gt;</span>
								</div>
								<div>
									&nbsp; &nbsp; <span style="color:#808080;">&lt;</span><span style="color:#569cd6;">vol-table</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; :<span style="color:#9cdcfe;">url</span>="<span style="color:#9cdcfe;">tableUrl</span>"
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; @<span style="color:#9cdcfe;">rowClick</span>="<span style="color:#9cdcfe;">rowClick</span>"
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; :<span style="color:#9cdcfe;">defaultLoadPage</span>="<span style="color:#9cdcfe;">load</span>"
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; @<span style="color:#9cdcfe;">loadBefore</span>="<span style="color:#9cdcfe;">loadBefore</span>"
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; :<span style="color:#9cdcfe;">height</span>="<span style="color:#9cdcfe;">height</span>"
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; :<span style="color:#9cdcfe;">index</span>="<span style="color:#9cdcfe;">rowIndex</span>"
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; @<span style="color:#9cdcfe;">loadAfter</span>="<span style="color:#9cdcfe;">loadAfter</span>"
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">ref</span>=<span style="color:#ce9178;">"table"</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; :<span style="color:#9cdcfe;">direction</span>="<span style="color:#9cdcfe;">direction</span>"
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; @<span style="color:#9cdcfe;">formatter</span>="<span style="color:#9cdcfe;">formatter</span>"
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; :<span style="color:#9cdcfe;">columns</span>.<span style="color:#9cdcfe;">sync</span>="<span style="color:#9cdcfe;">columns</span>"
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; :<span style="color:#9cdcfe;">textInline</span>="<span style="color:#9cdcfe;">textInline</span>"
								</div>
								<div>
									&nbsp; &nbsp; <span style="color:#808080;">&gt;</span>
								</div>
								<div>
									&nbsp; &nbsp; <span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">vol-table</span><span style="color:#808080;">&gt;</span>
								</div>
								<div>
									&nbsp; <span style="color:#808080;">&lt;/</span><span style="color:#f44747;">view</span><span style="color:#808080;">&gt;</span>
								</div>
								<div>
									<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">template</span><span style="color:#808080;">&gt;</span>
								</div>
						<br />
								<div>
									<span style="color:#808080;">&lt;</span><span style="color:#569cd6;">script</span><span style="color:#808080;">&gt;</span>
								</div>
								<div>
									<span style="color:#c586c0;">export</span> <span style="color:#c586c0;">default</span> {
								</div>
								<div>
									&nbsp; <span style="color:#dcdcaa;">data</span>() {
								</div>
								<div>
									&nbsp; &nbsp; <span style="color:#c586c0;">return</span> {
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">rowIndex</span><span style="color:#9cdcfe;">:</span> <span style="color:#569cd6;">true</span>, <span style="color:#6a9955;">//显示行号</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">load</span><span style="color:#9cdcfe;">:</span> <span style="color:#569cd6;">true</span>, <span style="color:#6a9955;">//默认是否加载数据(设置了url才生效)</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">tableUrl</span><span style="color:#9cdcfe;">:</span> <span style="color:#ce9178;">'api/app_expert/getPageData'</span>,
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">direction</span><span style="color:#9cdcfe;">:</span> <span style="color:#ce9178;">'horizontal'</span>, &nbsp; <span style="color:#6a9955;">//设置table为水平显示或者list列表显示'horizontal'//list</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">height</span><span style="color:#9cdcfe;">:</span> <span style="color:#b5cea8;">0</span>, <span style="color:#6a9955;">//表格高度，默认100%高度</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">textInline</span><span style="color:#9cdcfe;">:</span> <span style="color:#569cd6;">false</span>, <span style="color:#6a9955;">//表格内容超出是否换行</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">columns</span><span style="color:#9cdcfe;">:</span> [
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; {
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">field</span><span style="color:#9cdcfe;">:</span> <span style="color:#ce9178;">'ExpertId'</span>,
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span> <span style="color:#ce9178;">'主键ID'</span>,
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">hidden</span><span style="color:#9cdcfe;">:</span> <span style="color:#569cd6;">true</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; },
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; {
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">field</span><span style="color:#9cdcfe;">:</span> <span style="color:#ce9178;">'HeadImageUrl'</span>,
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span> <span style="color:#ce9178;">'头像'</span>,
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">type</span><span style="color:#9cdcfe;">:</span> <span style="color:#ce9178;">'img'</span>,
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">width</span><span style="color:#9cdcfe;">:</span> <span style="color:#b5cea8;">50</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; },
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; {
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">field</span><span style="color:#9cdcfe;">:</span> <span style="color:#ce9178;">'ExpertName'</span>,
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span> <span style="color:#ce9178;">'名称'</span>,
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">formatter</span><span style="color:#9cdcfe;">:</span> <span style="color:#569cd6;">true</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; },
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; {
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">field</span><span style="color:#9cdcfe;">:</span> <span style="color:#ce9178;">'UserName'</span>,
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span> <span style="color:#ce9178;">'帐号'</span>,
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">click</span><span style="color:#9cdcfe;">:</span><span style="color:#569cd6;">true</span>,<span style="color:#6a9955;">//添加单元格点击事件</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">formatter</span><span style="color:#9cdcfe;">:</span><span style="color:#569cd6;">true</span><span style="color:#6a9955;">//添加格式化处理</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; },
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; {
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">field</span><span style="color:#9cdcfe;">:</span> <span style="color:#ce9178;">'AuditStatus'</span>,
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span> <span style="color:#ce9178;">'状态'</span>,
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">type</span><span style="color:#9cdcfe;">:</span> <span style="color:#ce9178;">'select'</span>,
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">bind</span><span style="color:#9cdcfe;">:</span> {
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">key</span><span style="color:#9cdcfe;">:</span> <span style="color:#ce9178;">'audit'</span>,
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">data</span><span style="color:#9cdcfe;">:</span> []
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; },
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; {
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">field</span><span style="color:#9cdcfe;">:</span> <span style="color:#ce9178;">'Resume'</span>,
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span> <span style="color:#ce9178;">'简介'</span>,
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">width</span><span style="color:#9cdcfe;">:</span> <span style="color:#b5cea8;">80</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; }
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; ]
								</div>
								<div>
									&nbsp; &nbsp; };
								</div>
								<div>
									&nbsp; },
								</div>
								<div>
									&nbsp; <span style="color:#dcdcaa;">onLoad</span>() {
								</div>
								<div>
									&nbsp; &nbsp; <span style="color:#569cd6;">let</span> <span style="color:#9cdcfe;">_this</span> = <span style="color:#569cd6;">this</span>;
								</div>
								<div>
									&nbsp; &nbsp; <span style="color:#6a9955;">//设置表格高度</span>
								</div>
								<div>
									&nbsp; &nbsp; <span style="color:#9cdcfe;">uni</span>.<span style="color:#dcdcaa;">getSystemInfo</span>({
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; <span style="color:#dcdcaa;">success</span><span style="color:#9cdcfe;">:</span> <span style="color:#569cd6;">function</span> (<span style="color:#9cdcfe;">res</span>) {
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#9cdcfe;">_this</span>.<span style="color:#9cdcfe;">height</span> = <span style="color:#9cdcfe;">res</span>.<span style="color:#9cdcfe;">windowHeight</span> - <span style="color:#b5cea8;">125</span>;
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; }
								</div>
								<div>
									&nbsp; &nbsp; });
								</div>
								<div>
									&nbsp; },
								</div>
								<div>
									&nbsp; <span style="color:#9cdcfe;">methods</span><span style="color:#9cdcfe;">:</span> {
								</div>
								<div>
									&nbsp; &nbsp; <span style="color:#dcdcaa;">formatter</span>(<span style="color:#9cdcfe;">row</span>, <span style="color:#9cdcfe;">column</span>, <span style="color:#9cdcfe;">index</span>, <span style="color:#9cdcfe;">callback</span>) {
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//格式化单元格数据</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">if</span> (<span style="color:#9cdcfe;">column</span>.<span style="color:#9cdcfe;">field</span> == <span style="color:#ce9178;">'ExpertName'</span>||<span style="color:#9cdcfe;">column</span>.<span style="color:#9cdcfe;">field</span>==<span style="color:#ce9178;">'UserName'</span>) {
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#dcdcaa;">callback</span>(<span style="color:#ce9178;">'&lt;a style="color:red;"&gt;'</span> + <span style="color:#9cdcfe;">row</span>.<span style="color:#9cdcfe;">ExpertName</span> + <span style="color:#ce9178;">'&lt;/a&gt;'</span>);
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; }
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#dcdcaa;">callback</span>(<span style="color:#9cdcfe;">row</span>[<span style="color:#9cdcfe;">column</span>.<span style="color:#9cdcfe;">field</span>]);
								</div>
								<div>
									&nbsp; &nbsp; },
								</div>
								<div>
									&nbsp; &nbsp; <span style="color:#dcdcaa;">cellClick</span>(<span style="color:#9cdcfe;">index</span>, <span style="color:#9cdcfe;">row</span>,<span style="color:#9cdcfe;">column</span>) { <span style="color:#6a9955;">//判断单元格点击事件</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">if</span> (<span style="color:#9cdcfe;">column</span>.<span style="color:#9cdcfe;">field</span>==<span style="color:#ce9178;">'UserName'</span>) {
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//点击了单元格</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#dcdcaa;">$toast</span>(<span style="color:#ce9178;">"点击了单元格"</span>+<span style="color:#9cdcfe;">row</span>.<span style="color:#9cdcfe;">UserName</span>);
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; }
								</div>
								<div>
									&nbsp; &nbsp; },
								</div>
								<div>
									&nbsp; &nbsp; <span style="color:#dcdcaa;">rowClick</span>(<span style="color:#9cdcfe;">index</span>, <span style="color:#9cdcfe;">row</span>,<span style="color:#9cdcfe;">column</span>) {
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//行点击事件</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; <span style="color:#569cd6;">this</span>.<span style="color:#dcdcaa;">$toast</span>(<span style="color:#ce9178;">"点击了第"</span>+<span style="color:#9cdcfe;">index</span>+<span style="color:#ce9178;">"行"</span>);
								</div>
								<div>
									&nbsp; &nbsp; },
								</div>
								<div>
									&nbsp; &nbsp; <span style="color:#dcdcaa;">loadAfter</span>(<span style="color:#9cdcfe;">data</span>, <span style="color:#9cdcfe;">callback</span>) {
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//api数据加载后的方法</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; <span style="color:#dcdcaa;">callback</span>(<span style="color:#569cd6;">true</span>);
								</div>
								<div>
									&nbsp; &nbsp; },
								</div>
								<div>
									&nbsp; &nbsp; <span style="color:#dcdcaa;">loadBefore</span>(<span style="color:#9cdcfe;">params</span>, <span style="color:#9cdcfe;">callback</span>) {
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//数据加载前方法,可以自己设置查询条件</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// params.wheres.push({ name: '字段', value: '值' });</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp;
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// params.value='设置一些其他值'</span>
								</div>
						<br />
								<div>
									&nbsp; &nbsp; &nbsp; <span style="color:#dcdcaa;">callback</span>(<span style="color:#569cd6;">true</span>);
								</div>
								<div>
									&nbsp; &nbsp; },
								</div>
								<div>
									&nbsp; &nbsp; <span style="color:#dcdcaa;">reload</span>(){ <span style="color:#6a9955;">//刷新表格数据</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; <span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">table</span>.<span style="color:#dcdcaa;">load</span>(<span style="color:#569cd6;">null</span>,<span style="color:#569cd6;">true</span>)<span style="color:#6a9955;">//</span>
								</div>
								<div>
									&nbsp; &nbsp; }
								</div>
								<div>
									&nbsp; }
								</div>
								<div>
									};
								</div>
								<div>
									<span style="color:#808080;">&lt;/</span><span style="color:#569cd6;">script</span><span style="color:#808080;">&gt;</span>
								</div>
						<br />
								<div>
									<span style="color:#808080;">&lt;</span>
								</div>
							</div>
						</p>
						<p>
							<br />
						</p>`,
          tables: [
            {
              title: "props",
              data: [
                {
                  attr: "url",
                  desc: "加载数据的接口地址，如：api/xx/xx",
                  type: "string",
                  value: "",
                },
                {
                  attr: "defaultLoadPage",
                  desc: "设置了url，是否默认加载表格数据",
                  type: "bool",
                  value: "true",
                },
                {
                  attr: "loadKey",
                  desc: "是否加载数据源",
                  type: "bool",
                  value: "true",
                },
                {
                  attr: "direction",
                  desc: "显示方向:horizontal(表格显示)/list(列表显示)",
                  type: "string",
                  value: "",
                },
                {
                  attr: "textInline",
                  desc: "horizontal(表格显示)时文本超出是否显示省略号",
                  type: "Number",
                  value: "false",
                },
                {
                  attr: "index",
                  desc: "是否显示行号,direction=horizontal生效",
                  type: "bool",
                  value: "false",
                },
                {
                  attr: "columns",
                  desc: "表格配置,下面columns属性，或者查看代码中的columns配置",
                  type: "Array",
                  value: "[]",
                },
                {
                  attr: "tableData",
                  desc: "表格数据,不设置url属性，手动设置表格数据,具体可以见演示环境uniapp中的示例",
                  type: "Array",
                  value: "[]",
                },
              ],
            },
            {
              title: "columns",
              data: [
                {
                  attr: "title",
                  desc: "字段名字",
                  type: "String",
                  value: "",
                },
                {
                  attr: "hidden",
                  desc: "是否显示",
                  type: "bool",
                  value: "true",
                },
                { attr: "field", desc: "字段", type: "String", value: "" },
                {
                  attr: "click",
                  desc: "是否开启点击事件(见下面查看代码中的使用)",
                  type: "bool",
                  value: "false",
                },
                {
                  attr: "formatter",
                  desc: "是否开启自定义格式化(见下面查看代码中的使用)",
                  type: "bool",
                  value: "false",
                },
                {
                  attr: "type",
                  desc: "显示类型：select、selectList(下拉框多选)、date(年月日)、datetime(年月日时分秒)",
                  type: "String",
                  value: "left",
                },
                {
                  attr: "bind",
                  desc: "数据源绑定配置，bind:{key:'字典编号',data:[]},见下面查看代码中的columns配置",
                  type: "{}",
                  value: "",
                },
              ],
            },
            {
              title: "methods",
              data: [
                {
                  attr: "formatter",
                  desc: "自定义格式化显示,见下面查看代码中的formatter配置",
                  type: "",
                  value: "",
                },
                {
                  attr: "rowClick",
                  desc: "行点击事件,见下面查看代码中配置",
                  type: "",
                  value: "",
                },
                {
                  attr: "cellClick",
                  desc: "单元格点击事件(仅对table显示有效),见下面查看代码中配置",
                  type: "",
                  value: "",
                },
                {
                  attr: "loadAfter",
                  desc: " api数据加载后的方法,见下面查看代码中的loadAfter配置",
                  type: "",
                  value: "",
                },
                {
                  attr: "loadBefore",
                  desc: "重数据加载前方法,见下面查看代码中的loadBefore配置",
                  type: "",
                  value: "",
                },
              ],
            },
          ],
        },
        {
          title: "viewgrid生成页面",
          show: false,
          html: `<p>
							<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;">
								<div>
									<span style="color:#6a9955;">// &nbsp;*自定义业务逻辑扩展</span>
								</div>
								<div>
									<span style="color:#6a9955;">//************************************************</span>
								</div>
								<div>
									export default <span style="color:#dcdcaa;">function</span>() {
								</div>
								<div>
									&nbsp; <span style="color:#c586c0;">return</span> {
								</div>
								<div>
									&nbsp; &nbsp; <span style="color:#9cdcfe;">methods</span><span style="color:#9cdcfe;">:</span> {
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; <span style="color:#dcdcaa;">onInited</span>() { <span style="color:#6a9955;">//页面参数初始化</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//设置table超出换行显示</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//this.textInline = false;</span>
								</div>
						<br />
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//设置列宽度</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//this.columns[1].width = 70;</span>
								</div>
						<br />
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//设置table为水平显示或者list列表显示</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//this.direction = 'horizontal'//list</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//如果为list列表显示，指定list的标题列</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">titleField</span>=<span style="color:#ce9178;">"CreateDate"</span>;
								</div>
								<div>
									&nbsp; &nbsp;
								</div>
								<div>
									&nbsp; &nbsp; <span style="color:#9cdcfe;">//手动设置页面列表</span>/<span style="color:#9cdcfe;">table高度</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//this.height=this.height-65;</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//设置自定义格式显示</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//this.columns.forEach(column=&gt;{</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// &nbsp;if(column.field=='字段'){</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//自定义格式化显示,在下面的formatter实现具体逻辑</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//column.formatter=true;</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp;
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//单元格添加点击件,仅对table显示有效,事件执行见下面cellClick方法</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//column.cellClick=true</span>
								</div>
						<br />
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//指定字段为date类型不显示时分秒</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//column.type="date";</span>
								</div>
						<br />
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//设置列宽度</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//column.width = 70;</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// &nbsp;}</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp;
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// })</span>
								</div>
						<br />
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//页面打开时禁用加载数据</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">load</span>=<span style="color:#569cd6;">false</span>;
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//页面打开时默认弹出查询框</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">searchModel</span> = <span style="color:#569cd6;">true</span>;
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; },
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; <span style="color:#dcdcaa;">formatter</span>(<span style="color:#9cdcfe;">row</span>, <span style="color:#9cdcfe;">column</span>) { <span style="color:#6a9955;">//自定义格式化</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">if</span>(<span style="color:#9cdcfe;">column</span>.<span style="color:#9cdcfe;">field</span>==<span style="color:#ce9178;">'字段'</span>){
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span style="color:#c586c0;">return</span> <span style="color:#ce9178;">'&lt;a style="color:red;"&gt;'</span> + <span style="color:#9cdcfe;">row</span>[<span style="color:#9cdcfe;">column</span>.<span style="color:#9cdcfe;">field</span>] + <span style="color:#ce9178;">'&lt;/a&gt;'</span>;
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; }
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#9cdcfe;">row</span>[<span style="color:#9cdcfe;">column</span>.<span style="color:#9cdcfe;">field</span>]
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; },
								</div>
								<div>
									&nbsp; &nbsp; <span style="color:#dcdcaa;">cellClick</span>(<span style="color:#9cdcfe;">index</span>, <span style="color:#9cdcfe;">row</span>, <span style="color:#9cdcfe;">column</span>){ <span style="color:#6a9955;">//单元格点击事件，仅对table显示有效，配置见上面onInited中的配置</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">if</span>(<span style="color:#9cdcfe;">column</span>.<span style="color:#9cdcfe;">field</span>==<span style="color:#ce9178;">'字段'</span>){
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//字段的点击事件</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; }
								</div>
								<div>
									&nbsp; &nbsp; },
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; <span style="color:#dcdcaa;">rowClick</span>(<span style="color:#9cdcfe;">index</span>, <span style="color:#9cdcfe;">row</span>, <span style="color:#9cdcfe;">column</span>) { <span style="color:#6a9955;">//行点击事件(默认触发编辑)</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//index当前点击的行</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//row当前行数据</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//column当前行配置信息</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#569cd6;">true</span>;
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; },
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; <span style="color:#dcdcaa;">searchBefore</span>(<span style="color:#9cdcfe;">params</span>){ <span style="color:#6a9955;">//查询前</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// params.wheres.push(</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// &nbsp; {</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// &nbsp; &nbsp; name:"字段名",//查询的字段</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// &nbsp; &nbsp; value:"值", //查询的字段的值</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// &nbsp; &nbsp; displayType:"" //text/selectList/like &nbsp;--查询类型：selectList为多选，like为模糊查询</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// &nbsp; }</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// )</span>
								</div>
						<br />
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// &nbsp;params.value='xx'//还可以自定义一些其他值，后台的查询方法中loadData.vlue取值</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#569cd6;">true</span>;
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; },
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; <span style="color:#dcdcaa;">updateBefore</span>(<span style="color:#9cdcfe;">formData</span>) { <span style="color:#6a9955;">//更新保存前操作</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//formData格式：(自己调试出输看)</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// {</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// &nbsp; &nbsp; mainData: { 主表字段1: 'x1', 主表字段2: 'x2' },</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// &nbsp; &nbsp; detailData: [{ 明细表字段1: d1 }],</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// &nbsp; &nbsp; delKeys: null //删除明细表行数据的id</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// }</span>
								</div>
						<br />
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//formData.mainData.xxx="xxxx";//还可以继续手动添加值</span>
								</div>
						<br />
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//如果需要同时提交其他数据到后台，请设置formData.extra=xxxx</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//后台在表xxxxService.cs中重写Update方法即可从saveDataModel参数中拿到extra提交的对象</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#569cd6;">true</span>;
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; },
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; <span style="color:#dcdcaa;">addBefore</span>(<span style="color:#9cdcfe;">formData</span>) {<span style="color:#6a9955;">//新建保存前操作</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//formData格式：</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// {</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// &nbsp; &nbsp; mainData: { 主表字段1: 'x1', 主表字段2: 'x2' },</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// &nbsp; &nbsp; detailData: [{ 明细表字段1: d1 }],</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// &nbsp; &nbsp; delKeys: null //删除明细表行数据的id</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// }</span>
								</div>
						<br />
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//formData.mainData.xxx="xxxx";//还可以继续手动添加值</span>
								</div>
						<br />
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//如果需要同时提交其他数据到后台，请设置formData.extra=xxxx</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//后台在表xxxxService.cs中重写Add方法即可从saveDataModel参数中拿到extra提交的对象</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#569cd6;">true</span>;
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; },
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; <span style="color:#dcdcaa;">modelOpenAfter</span>(){ <span style="color:#6a9955;">//弹出框打开的方法</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">// this.currentAction=='Add'//判断是新建还是编辑操作</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span style="color:#c586c0;">return</span> <span style="color:#569cd6;">true</span>;<span style="color:#6a9955;">//返回false不会弹出框</span>
								</div>
								<div>
									&nbsp; &nbsp; &nbsp; }
								</div>
								<div>
									&nbsp; &nbsp; }
								</div>
								<div>
									&nbsp; }
								</div>
								<div>
									}
								</div>
							</div>
						</p>
						<p>
							<br />
						</p>`,
          tables: [
            {
              title: "data",
              data: [
                {
                  attr: "rowIndex",
                  desc: "是否显示行号,direction=horizontal生效",
                  type: "bool",
                  value: "false",
                },
                {
                  attr: "load",
                  desc: "是否默认加载table表格数据",
                  type: "bool",
                  value: "true",
                },
                {
                  attr: "height",
                  desc: "table高度(默认自动计算)",
                  type: "Number",
                  value: "",
                },
                {
                  attr: "direction",
                  desc: "显示方向:horizontal(表格显示)/list(列表显示)",
                  type: "string",
                  value: "",
                },
                {
                  attr: "textInline",
                  desc: "horizontal(表格显示)时文本超出是否显示省略号",
                  type: "Number",
                  value: "false",
                },
                {
                  attr: "titleField",
                  desc: "如果table表格属性direction是以list显示，可以指定标题字段",
                  type: "String",
                  value: "false",
                },
                {
                  attr: "fabButtons",
                  desc: "右下角的浮动按钮,格式[{icon:'图标',value:'自定义',hidden:false,onClick:()=>{ this.xx() }}]",
                  type: "Arrar",
                  value: "false",
                },
                {
                  attr: "buttons",
                  desc: "新建编辑弹出框中的按钮,格式[{name:'按钮名',icon:'图标',value:'自定义',hidden:false,onClick:()=>{ this.xx() }}]",
                  type: "Arrar",
                  value: "false",
                },
                {
                  attr: "currentAction",
                  desc: "前操作状态是编辑还是建新,Add/Update",
                  type: "bool",
                  value: "false",
                },
                {
                  attr: "maxHeight",
                  desc: "新建编辑、查询弹出框的最大高度(默认自动计算)",
                  type: "Number",
                  value: "0",
                },

                {
                  attr: "showButtons",
                  desc: "是否显示右下角的浮动按钮",
                  type: "bool",
                  value: "true",
                },

                {
                  attr: "columns",
                  desc: "表格配置,见上面的voltable的columns配置",
                  type: "Array",
                  value: "[]",
                },
                {
                  attr: "editFormOptions",
                  desc: "编辑表单配置见上面的volform的formOptions配置",
                  type: "Array",
                  value: "[]",
                },
                {
                  attr: "editFormFields",
                  desc: "编辑表单字段见上面的volform的formFields",
                  type: "{}",
                  value: "{}",
                },
                {
                  attr: "searchFormOptions",
                  desc: "查询表单配,同上",
                  type: "Array",
                  value: "[]",
                },
                {
                  attr: "searchFormFields",
                  desc: "查询表单字段,同上",
                  type: "{}",
                  value: "{}",
                },
                {
                  attr: "hasEditpermission",
                  desc: "是否有编辑、新建权限",
                  type: "bool",
                  value: "false",
                },

                {
                  attr: "searchModel",
                  desc: "查询弹出框",
                  type: "bool",
                  value: "false",
                },
                {
                  attr: "model",
                  desc: "新建编辑弹出框",
                  type: "bool",
                  value: "false",
                },
                {
                  attr: "hasEditpermission",
                  desc: "是否有编辑、新建权限",
                  type: "bool",
                  value: "false",
                },
              ],
            },
            {
              title: "methods",
              data: [
                {
                  attr: "search",
                  desc: "调用刷新方法this.search()",
                  type: "",
                  value: "",
                },
                {
                  attr: "rowClick",
                  desc: "行点击事件,见下面查看代码中的onInited配置",
                  type: "",
                  value: "",
                },
                {
                  attr: "cellClick",
                  desc: "单元格点击事件,见下面查看代码中的onInited配置",
                  type: "",
                  value: "",
                },
                {
                  attr: "loadAfter",
                  desc: " api数据加载后的方法,见下面查看代码中的loadAfter配置",
                  type: "",
                  value: "",
                },
                {
                  attr: "loadBefore",
                  desc: "重数据加载前方法,见下面查看代码中的loadBefore配置",
                  type: "",
                  value: "",
                },
              ],
            },
            {
              title: "slot(可在生成的vue页面中自定义slot来显示自定义内容)",
              data: [
                {
                  attr: "gridHeader",
                  desc: "页面上最顶部位置",
                  type: "",
                  value: "",
                },
                {
                  attr: "gridFooter",
                  desc: "页面上最底部位置",
                  type: "",
                  value: "",
                },
                {
                  attr: "modelHeader",
                  desc: "新建编辑弹出框最顶部位置",
                  type: "",
                  value: "",
                },
                {
                  attr: "modelFooter",
                  desc: "新建编辑弹出框最底部位置",
                  type: "",
                  value: "",
                },
                {
                  attr: "searchHeader",
                  desc: "查询弹出框最顶部位置",
                  type: "",
                  value: "",
                },
                {
                  attr: "searchFooter",
                  desc: "查询弹出框最底部位置",
                  type: "",
                  value: "",
                },
              ],
            },
          ],
        },
      ],
    };
  },
  methods: {
    toApp() {
      this.apiActived = 0;
    },
    toWeChart() {
      this.apiActived = 1;
    },
    to(index, cindex) {
      if (index == 0 && cindex === 0) {
        this.navTop = "60px";
      } else {
        this.navTop = 0;
      }
      this.tIndex = index;
      let top = document.getElementById(this.tIndex).offsetTop - 84;
      // if (index == 0 && cindex <= 2) {
      //     top = top - 10;
      // }
      window.scrollTo(0, top);
      //document.getElementById(this.tIndex).scrollIntoView(false);
    },
  },
  created() {
    let $this = this;
    //api搜索
    document.onkeydown = function (e) {
      if ($this.value == "") {
        return;
      }
      var theEvent = window.event || e;
      var code = theEvent.keyCode || theEvent.which || theEvent.charCode;
      if (code != 13) return;
      for (let index = 0; index < $this.api.length; index++) {
        const element = $this.api[index];
        if (element.title.indexOf($this.value) != -1) {
          $this.to(index, 0);
          return;
        }
        for (let cdindex = 0; cdindex < element.children.length; cdindex++) {
          const cdelement = element.children[cdindex];
          if (cdelement.title.indexOf($this.value) != -1) {
            $this.to(index, cdindex);
            return;
          }
        }
      }
    };
    document.onscroll = function () {
      if (document.documentElement.scrollTop <= 70) {
        $this.navTop = "60px";
      } else {
        $this.navTop = 0;
      }
    };
  },
};
</script>
 <style scoped>
.vol-doc-nav::-webkit-scrollbar {
  /*滚动条整体样式*/
  width: 6px !important;
  /*高宽分别对应横竖滚动条的尺寸*/
  height: 6px !important;
  background: #ffffff !important;
  cursor: pointer !important;
}

.vol-doc-nav::-webkit-scrollbar-thumb {
  /*滚动条里面小方块*/
  border-radius: 5px !important;
  background: rgba(211, 216, 222, 0.8) !important;
  cursor: pointer !important;
}

.vol-doc-nav::-webkit-scrollbar-track {
  /*滚动条里面轨道*/
  border-radius: 0 !important;
  background: rgba(240, 240, 240, 0.5) !important;
  cursor: pointer !important;
}

.vol-header {
  display: flex;
  align-items: center;
  height: 60px;
  padding: 0 30px;
  line-height: 60px;
  background-color: #001938;
  box-shadow: 0 4px 12px #e6e6e6;
}

.project {
  letter-spacing: 2px;
  color: #e4e2e2;
  font-size: 17px;
}

.van-field {
  background: none;
}

.vol-doc-search {
  margin-left: 150px;
  margin-right: 200px;
}

.vol-doc-search input {
  color: white;
  background: none;
  border: 0px;
}

.van-field input {
  color: #b7b7b7;
}

.vol-api {
  padding: 0 35px;
  text-align: center;
  cursor: pointer;
  color: #fff;
}

.vol-api:hover,
.apiActived {
  background: #03a9f4;
}

.vol-doc-nav {
  position: fixed;
  top: 60px;
  bottom: 0;
  left: 0;
  z-index: 1;
  min-width: 220px;
  max-width: 220px;
  padding: 0px 0 22px;
  overflow-y: scroll;
  background-color: #fff;
  box-shadow: 0 8px 12px #ebedf0;
}

.vol-doc-nav .title {
  font-family: PingFang SC, "Helvetica Neue", Arial, sans-serif;
  padding: 1px 4px 5px 16px;
  color: #455a64;
  font-weight: 500;
  font-size: 15px;
  line-height: 28px;
}

.vol-doc-nav .title:hover {
  cursor: pointer;
}

.t-actived .title {
  color: #4fc08d;
}

.nav-children {
  padding-left: 15px;
}

.nav-first {
  font-weight: bold;
  margin-top: 20px;
}

.vol-doc-content {
  padding: 20px 30px 30px 250px;
  height: 100%;
}

h1 {
  font-weight: 500;
  margin: 0;
  padding: 0;
}

h3 {
  font-weight: 500;
}

.api-list-first {
  padding: 15px 0;
  font-size: 16px;
  font-weight: bold;
}

.api-list-children {
  padding: 0 28px;
}

.api-list-desc {
  padding-left: 18px;
  padding-top: 10px;
}

.api-list-desc > div {
  padding-top: 8px;
}

.api-list-desc > div:before {
  content: "●";
}

.children-item {
  border: 1px dotted #dcd3d3;
  border-radius: 6px;
  padding: 20px;
  background: white;
  font-size: 14px;
  margin-bottom: 30px;
  box-shadow: 0 8px 12px #ebedf0;
}

.api-list-title {
  font-weight: bold;
  color: #22a067;
}

table {
  margin: 15px 0px;
  border: none;
  border-collapse: collapse;
}

table tr:first-child {
  background: #f3f3f3;
}

table td {
  min-width: 120px;
  border-color: #bfbfbf;
  padding: 8px 15px;
}

.return-html {
  padding: 10px 0;
}

.doc-parms {
  padding-top: 20px;
  padding-bottom: 10px;
}

.event-item-actived {
  background: #ecf9ff;
}

.doc-html {
  padding: 15px 0;
}
.imgs {
  display: flex;
}
.imgs img {
  height: 150px;
}
.imgs > div {
  text-align: center;
  margin-right: 30px;
}
</style>
