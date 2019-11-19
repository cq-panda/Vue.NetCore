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
  form: `<div class="cnblogs_code">
  <pre>&lt;template&gt;
    &lt;div&gt;
      &lt;<span style="color: #000000;">VolForm
        ref</span>="myform"<span style="color: #000000;">
        :label</span>-width="150"<span style="color: #000000;">
        :loadKey</span>="true"<span style="color: #000000;">
        :formFileds</span>="formFileds1"<span style="color: #000000;">
        :formRules</span>="formRules1"
      &gt;&lt;/VolForm&gt;
      &lt;div&gt;
        &lt;Button type="info" <span style="color: #0000ff;">long</span> @click="reset"&gt;重置表单&lt;/Button&gt;
      &lt;/div&gt;
    &lt;/div&gt;
  &lt;/template&gt;
  &lt;script&gt;<span style="color: #000000;">
  import VolForm from </span>"@/components/basic/VolForm.vue"<span style="color: #000000;">;
  export </span><span style="color: #0000ff;">default</span><span style="color: #000000;"> {
    components: { VolForm },
    methods: {
      reset() {
        </span><span style="color: #0000ff;">this</span><span style="color: #000000;">.$refs.myform.reset();
        </span><span style="color: #0000ff;">this</span>.$Message.error("表单已重置"<span style="color: #000000;">);
      }
    },
    data() {
      </span><span style="color: #0000ff;">return</span><span style="color: #000000;"> {
        formFileds1: {
          Variety: </span>1<span style="color: #000000;">,
          AgeRange: </span>""<span style="color: #000000;">,
          DateRange: [],
          City: </span>"北京市"<span style="color: #000000;">,
          AvgPrice: </span>8.88<span style="color: #000000;">,
          number1: </span>20<span style="color: #000000;">,
          mail: </span>""<span style="color: #000000;">,
          Date: </span>""<span style="color: #000000;">,
          IsTop: </span>""<span style="color: #000000;">,
          Fruits: [],
          Other: </span>""<span style="color: #000000;">,
          Switch: </span>1<span style="color: #000000;">,
          readonlyText: </span>"还没想好...."<span style="color: #000000;">,
          readonlyImg:
            </span>"https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x2.jpg"<span style="color: #000000;">,
          ProImg:
            </span>"https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x3.jpg"<span style="color: #000000;">
        },
        formRules1: [
          </span><span style="color: #008000;">//</span><span style="color: #008000;">两列的表单，formRules数据格式为:[[{},{}]]</span>
  <span style="color: #000000;">        [
            {
              dataKey: </span>"city"<span style="color: #000000;">,
              title: </span>"自动绑定数据源"<span style="color: #000000;">,
              required: </span><span style="color: #0000ff;">true</span><span style="color: #000000;">,
              field: </span>"City"<span style="color: #000000;">,
              data: [],
              type: </span>"select"<span style="color: #000000;">
            },
            {
              title: </span>"手动绑定数据源"<span style="color: #000000;">,
              dataKey: </span>"age"<span style="color: #000000;">,
              placeholder: </span>"在这里可设置提示描述"<span style="color: #000000;">,
              </span><span style="color: #008000;">//</span><span style="color: #008000;">如果这里绑定了data数据，后台不会加载此数据源</span>
              data: [{ key: 1, value: "是" }, { key: 0, value: "否"<span style="color: #000000;"> }],
              required: </span><span style="color: #0000ff;">false</span><span style="color: #000000;">,
              field: </span>"Variety"<span style="color: #000000;">,
              type: </span>"select"<span style="color: #000000;">
            }
          ],
          [
            {
              title: </span>"手机号"<span style="color: #000000;">,
              required: </span><span style="color: #0000ff;">true</span>, <span style="color: #008000;">//</span><span style="color: #008000;">设置为必选项</span>
              field: "AgeRange"<span style="color: #000000;">,
              type: </span>"phone"<span style="color: #000000;">,
              onKeyPress: $event </span>=&gt;<span style="color: #000000;"> {
                </span><span style="color: #0000ff;">if</span> ($event.keyCode == 13<span style="color: #000000;">) {
                  </span><span style="color: #0000ff;">this</span>.$Message.error(<span style="color: #0000ff;">this</span>.formFileds1.AgeRange + ""<span style="color: #000000;">);
                }
              }
            },
            {
              title: </span>"date日期"<span style="color: #000000;">,
              field: </span>"Date"<span style="color: #000000;">,
              type: </span>"datetime"<span style="color: #000000;">
            }
          ],
          [
            {
              title: </span>"多选日期"<span style="color: #000000;">,
              range: </span><span style="color: #0000ff;">true</span>, <span style="color: #008000;">//</span><span style="color: #008000;">设置为true可以选择开始与结束日期</span>
              required: <span style="color: #0000ff;">false</span><span style="color: #000000;">,
              field: </span>"DateRange"<span style="color: #000000;">,
              type: </span>"date"<span style="color: #000000;">
            },
            {
              type: </span>"number"<span style="color: #000000;">,
              title: </span>"数字"<span style="color: #000000;">,
              required: </span><span style="color: #0000ff;">true</span><span style="color: #000000;">,
              placeholder: </span>"你可以自己定义placeholder显示的文字"<span style="color: #000000;">,
              field: </span>"number1"<span style="color: #000000;">
            }
          ],
          [
            {
              type: </span>"decimal"<span style="color: #000000;">,
              title: </span>"最大最小decimal值"<span style="color: #000000;">,
              max: </span>10<span style="color: #000000;">,
              min: </span>2<span style="color: #000000;">,
              required: </span><span style="color: #0000ff;">true</span><span style="color: #000000;">,
              field: </span>"AvgPrice"<span style="color: #000000;">
            },
            {
              title: </span>"邮箱"<span style="color: #000000;">,
              field: </span>"mail"<span style="color: #000000;">,
              range: </span><span style="color: #0000ff;">true</span>, <span style="color: #008000;">//</span><span style="color: #008000;">设置为true可以选择开始与结束日期</span>
              required: <span style="color: #0000ff;">false</span><span style="color: #000000;">,
              type: </span>"mail"<span style="color: #000000;">
            }
          ],
          [
            {
              title: </span>"自定义验证"<span style="color: #000000;">,
              required: </span><span style="color: #0000ff;">true</span><span style="color: #000000;">,
              field: </span>"Other"<span style="color: #000000;">,
              validator: (rule, val) </span>=&gt;<span style="color: #000000;"> {
                </span><span style="color: #0000ff;">if</span> (val != "234"<span style="color: #000000;">) {
                  </span><span style="color: #0000ff;">return</span> "必须输入【234】"<span style="color: #000000;">;
                }
                </span><span style="color: #0000ff;">return</span> ""<span style="color: #000000;">;
              }
            },
            {
              title: </span>"Switch"<span style="color: #000000;">,
              field: </span>"Switch"<span style="color: #000000;">,
              dataKey: </span>"enable", <span style="color: #008000;">//</span><span style="color: #008000;">这里会从后台自动绑定数据源</span>
  <span style="color: #000000;">            data: [],
              required: </span><span style="color: #0000ff;">false</span><span style="color: #000000;">,
              type: </span>"switch"<span style="color: #000000;">
            }
          ],
          [
            </span><span style="color: #008000;">//</span><span style="color: #008000;">readonlyImg</span>
  <span style="color: #000000;">          {
              title: </span>"checkbox"<span style="color: #000000;">,
              </span><span style="color: #008000;">//</span><span style="color: #008000;">如果这里绑定了data数据，后台不会加载此数据源</span>
  <span style="color: #000000;">            data: [
                { key: </span>0, value: "冬瓜"<span style="color: #000000;"> },
                { key: </span>1, value: "西瓜"<span style="color: #000000;"> },
                { key: </span>2, value: "南瓜"<span style="color: #000000;"> },
                { key: </span>3, value: "哈密瓜"<span style="color: #000000;"> }
              ],
              field: </span>"Fruits"<span style="color: #000000;">,
              type: </span>"checkbox"<span style="color: #000000;">
            },
            {
              title: </span>"字段只读"<span style="color: #000000;">,
              readonly: </span><span style="color: #0000ff;">true</span>, <span style="color: #008000;">//</span><span style="color: #008000;">设置readonly或disabled都行</span>
              field: "readonlyText"<span style="color: #000000;">,
              type: </span>"text"<span style="color: #000000;">
            }
          ],
          [
            {
              title: </span>"备注"<span style="color: #000000;">,
              required: </span><span style="color: #0000ff;">true</span><span style="color: #000000;">,
              field: </span>"IsTop"<span style="color: #000000;">,
              min: </span>3<span style="color: #000000;">,
              max: </span>5<span style="color: #000000;">,
              placeholder: </span>"至少输入3个字符,最多只能输入5个字符"<span style="color: #000000;">,
              colSize: </span>12, <span style="color: #008000;">//</span><span style="color: #008000;">设置12，此列占100%宽度</span>
              type: "textarea"<span style="color: #000000;">
            }
          ],
          [
            {
              title: </span>"图片只读"<span style="color: #000000;">,
              readonly: </span><span style="color: #0000ff;">true</span>, <span style="color: #008000;">//</span><span style="color: #008000;">设置readonly或disabled都行</span>
              field: "readonlyImg"<span style="color: #000000;">,
              type: </span>"img"<span style="color: #000000;">
            },
            {
              title: </span>"可修改图片"<span style="color: #000000;">,
              field: </span>"ProImg"<span style="color: #000000;">,
              type: </span>"img"<span style="color: #000000;">
            }
          ]
        ]
      };
    }
  };
  </span>&lt;/script&gt;</pre>
  </div>
  <p>&nbsp;</p> `,
  header: `<div class="cnblogs_code">
  <pre>&lt;template&gt;
    &lt;div&gt;
      &lt;VolHeader style="margin: 30px 0;" :icon="icon" :text="text"&gt;
        &lt;div slot="content"&gt;VolHeader这里可以定义显示内容&lt;/div&gt;
        &lt;div style="text-align: right;padding-top: 4px;"&gt;
          &lt;Button type="text" icon="ios-search" size="small" @click="()=&gt;{this.$Message.error('1')}"&gt;buttons1&lt;/Button&gt;
          &lt;Button type="text" icon="ios-search" size="small" @click="()=&gt;{this.$Message.error('2')}"&gt;buttons2&lt;/Button&gt;
        &lt;/div&gt;
      &lt;/VolHeader&gt;
    &lt;/div&gt;
  &lt;/template&gt;
  &lt;script&gt;<span style="color: #000000;">
  import VolHeader from </span>"@/components/basic/VolHeader.vue"<span style="color: #000000;">;
  export </span><span style="color: #0000ff;">default</span><span style="color: #000000;"> {
    data() {
      </span><span style="color: #0000ff;">return</span><span style="color: #000000;"> {
        icon: </span>"md-male"<span style="color: #000000;">,
        text: </span>"主题名称"<span style="color: #000000;">
      };
    },
    components: { VolHeader},
    methods: {
    }
  };
  </span>&lt;/script&gt;</pre>
  </div>
  <p>&nbsp;</p>`,
  box: `<div class="cnblogs_code">
  <pre>&lt;template&gt;
    &lt;div&gt;
      &lt;Button type="info" @click="model=!model"&gt;弹出框&lt;/Button&gt;
      &lt;VolBox :model.sync="model" title="弹出框标题" :height="400" :width="700" :padding="15"&gt;
        &lt;div&gt;弹出框内容&lt;/div&gt;
        &lt;!-- footer 这里不写，默认有一个关闭按钮 --&gt;
        &lt;div slot="footer"&gt;
          &lt;Button type="default" @click="()=&gt;{this.$Message.error('点击确认')}"&gt;确认&lt;/Button&gt;
          &lt;Button type="default" @click="()=&gt;{model=false}"&gt;点击关闭弹出框&lt;/Button&gt;
        &lt;/div&gt;
      &lt;/VolBox&gt;
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
  <p>&nbsp;</p>`,
  uploadExcel: ``, uploadImg: ``, volmenu: ``, voltable: ``, viewGrid: ``
}
export default codeString