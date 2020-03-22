<template>
  <div class="doc">
    <div class="doc-left">
      <el-scrollbar style="height:100%;">
        <ul>
          <li class="n-item" v-for="(item,index) in items" :key="index">
            <a>{{index==0?'添加动态按钮':item.title}}</a>
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
          <p class="desc">更多具体扩展代码实现参照：extension->order->SellOrder.js或viewgird组件demo</p>
        </div>
      </div>
      <div style=" color: #4c403b;padding: 10px 0;">
        <h4>下面都是对表App_Expert.js进行的扩展操作,将下面代码复制到App_Expert.js文件methods下即可直接运行</h4>
        <h3>所有图片点击即可查看大图</h3>
      </div>
      <Alert type="success" show-icon>
        提示
        <template slot="desc">
          <p>每个表生成的vue页面，都会有一个与表名相同扩展的.js文件，如表名：SellOrder,扩展文件SellOrder.js</p>
          <p>所有业务代码在扩展js中编写，二次生成代码时，vue页面会被覆盖，扩展js则不会</p>
        </template>
      </Alert>
      <div class="doc-wrapper" v-for="(item,index) in items" :key="index">
        <div class="title">
          <h2>{{item.title}}</h2>
        </div>
        <div class="d-content">
          <div class="code">
            <p v-for="(line,key) in item.content" :key="key" class="desc" v-html="line"></p>
          </div>
          <div class="img">
            <img :src="item.img" @click="()=>{base.previewImg(item.img)}" />
          </div>
        </div>
        <Alert type="success" show-icon>{{item.tips}}</Alert>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      items: [
        {
          title: "第一个扩展：动态添加按钮",
          content: [
            `&nbsp; &nbsp;&nbsp;onInit() {<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; this.buttons.splice(2, 0, {&nbsp;//在第二个按钮后添加一个新的按钮<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; name: "测试按钮",<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; icon: 'md-refresh',<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; type: 'info',<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; onClick: function () {<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; this.$Message.info("测试按钮");<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; })<br />
&nbsp; &nbsp; &nbsp; }<br />
<span style="display:none;"></span><br />`
          ],
          tips: ` this.buttons来源：ViewGrid.vue组件data->buttons属性`,
          img: "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/01.png"
        },
        {
          title: "设置按钮显示个数",
          content: [
            `&nbsp; &nbsp; &nbsp; &nbsp; onInit() {<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; this.maxBtnLength=6;//设置查询页面显示6个按钮(默认3个)<br />
&nbsp; &nbsp; &nbsp; &nbsp; }<br />
<span style="display:none;"></span><br />`
          ],
          tips: ` this.maxBtnLength来源：ViewGrid.vue组件data->maxBtnLength属性`,
          img: "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/02.png"
        },
        {
          title: "手动设置排序列",
          content: [
            ` &nbsp; &nbsp; onInit() {<br />
              &nbsp; &nbsp; &nbsp; this.columns.forEach(row =&gt; {<br />
              &nbsp; &nbsp; &nbsp; &nbsp; if (row.field == "AuditStatus") {<br />
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; row.sort = true;<br />
              &nbsp; &nbsp; &nbsp; &nbsp; }<br />
              &nbsp; &nbsp; &nbsp; })<br />
              &nbsp; &nbsp; }<br />`
          ],
          tips: ` this.columns数据源来源ViewGrid组件props.js属性(实际为App_Expert.Vue里columns)，具体参数配置见VolTable组件文档`,
          img: "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/03.png"
        },
        {
          title: "触发switch",
          content: [
            `&nbsp; &nbsp; onInit() {<br />
            &nbsp; &nbsp; &nbsp; this.columns.forEach(row =&gt; {<br />
            &nbsp; &nbsp; &nbsp; &nbsp; if (row.field == "Enable") {<br />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; //强制设置为编辑列，类型为switch<br />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; row.edit = { type: "switch", keep: true };<br />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; //手动绑定数据源<br />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; //如果设置key的字典编号，data设置空数组会自动绑定数据源<br />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; row.bind = { key: "enable", data: [{ key: 0, value: '禁用' }, { key: 1, value: '启用' }] };<br />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; //绑定switch切换事件<br />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; let $this=this;<br />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; row.onChange = function (options, row,_columns,status) {<br />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; //在此处可以将数据提到后台处理<br />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; $this.$Message.info(status?"true":"false");<br />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br />
            &nbsp; &nbsp; &nbsp; &nbsp; }<br />
            &nbsp; &nbsp; &nbsp; })<br />
            &nbsp; &nbsp; }<br />`
          ],
          tips: ` this.columns数据源来源ViewGrid组件props.js属性(实际为App_Expert.Vue里columns)，具体参数配置见VolTable组件文档`,
          img: "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/04.png"
        },
         {
          title: "动态添加一列按钮",
          content: [
            `&nbsp; onInit() {<br />
&nbsp; &nbsp; &nbsp; //在指定的列后面手动增加一列<br />
&nbsp; &nbsp; &nbsp; for (let index = 0; index &lt; this.columns.length; index++) {<br />
&nbsp; &nbsp; &nbsp; &nbsp; const row = this.columns[index];<br />
&nbsp; &nbsp; &nbsp; &nbsp; if (row.field != 'City') { continue; }<br />
<br />
&nbsp; &nbsp; &nbsp; &nbsp; //参数配置为组件文档VolTable中columns的属性<br />
&nbsp; &nbsp; &nbsp; &nbsp; let options = {<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; field: 'oper', title: '操作',<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; type: 'text', width: 100,<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; //返回一个标签<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; formatter: (row) =&gt; {<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return '&lt;div style="cursor: pointer; \<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; background: #9C27B0; color: white;\<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; padding: 3px 7px;width: 81px;\<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; text-align: center;\<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; border-radius: 4px;"&gt;测试按钮&lt;/div&gt;'<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; },<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; //触发事件,可以在此事件再打开一个弹出框等操作<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; click: (row, column, event) =&gt; {<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; this.$Message.info("触发事件");<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br />
&nbsp; &nbsp; &nbsp; &nbsp; };<br />
&nbsp; &nbsp; &nbsp; &nbsp; //在city(地区)列后添加一行<br />
&nbsp; &nbsp; &nbsp; &nbsp; this.columns.splice(index + 1, 0, options)<br />
&nbsp; &nbsp; &nbsp; }<br />
&nbsp; &nbsp; }<br />`
          ],
          tips: ` this.columns数据源来源ViewGrid组件props.js属性(实际为App_Expert.Vue里columns)，具体参数配置见VolTable组件文档`,
          img: "https://doc-vue-1256993465.cos.ap-chengdu.myqcloud.com/05.png"
        },
        {
          title: "编写中--待完",
          content: [`编写中`],
          tips: ` 编写中`,
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
    width: 160px;
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
  color: #00bcd4;
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
</style>
