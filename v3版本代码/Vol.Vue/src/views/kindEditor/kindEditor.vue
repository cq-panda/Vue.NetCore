<template>
  <div class="content">
    <el-alert
      type="info"
      show-icon
      style="margin-bottom: 15px"
      :closable="false"
      title="编辑器使用"
    >
      <p>编辑器集成的是wangeditor,框架只做了一个基本功能集成</p>
      框架代码生成器默认集成了编辑器,代码生成器里面编辑类型选择editor即可自动生成,更多功能：<a
        href="https://www.wangeditor.com/"
        target="_blank"
        >查看wangeditor文档</a
      >
    </el-alert>
    <div style="padding-top: 15px">
      <VolForm
        ref="myform"
        :label-width="90"
        :formFileds="formFileds1"
        :formRules="formRules1"
      ></VolForm>
      <div class="v-kind">
        <label class="ivu-form-item-label" style="width: 90px"
          >发布内容：</label
        >
        <div>
          <vol-wang-editor
            v-model="content"
            :height="310"
            url="api/App_Expert/Upload"
          ></vol-wang-editor>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import VolBox from "@/components/basic/VolBox.vue";
import VolHeader from "@/components/basic/VolHeader.vue";
import VolForm from "@/components/basic/VolForm.vue";
import VolWangEditor from "@/components/basic/VolWangEditor.vue";
export default {
  components: {
    VolBox,
    VolForm,
    VolHeader,
    "vol-wang-editor": VolWangEditor,
  },
  methods: {
    getContent() {
      return this.$refs.editor.getContent();
    },
    setContent(content) {
      if (this.$refs.editor) {
        this.content = content;
        this.$refs.editor.setContent(content);
      }
    },
  },
  mounted() {},
  data() {
    return {
      content: `<span style="display:none;"></span><span style="line-height:2;font-size:18px;">&nbsp; &nbsp; &nbsp; 今日上午震荡下行，小幅下跌，创指表现疲软，弱势下行，高送转概念股美联新材4连板，网络直播强势上涨，领涨两市，奥飞娱乐等4股涨停，手机游戏表现活跃，涨幅居前，中文在线等5股涨停，前期大涨的消费电子今日大跌，领跌两市，芯片概念也表现疲软，次新股跌幅居前，银行、证券、保险等权重股也未能持续带头上涨。截至中午收盘：沪指跌0.20%，报3010.86点；深指跌0.27%，报10267.24点；创业板指数跌0.50%，报1783.53点。</span><span style="display:none;"></span><span style="line-height:2;font-size:18px;">板块方面：高送转、网络直播、手机游戏等板块涨幅居前，无线耳机、消费电子、半导体等板块跌幅居前。</span>
<p>
	<span style="line-height:2;font-size:18px;">&nbsp; &nbsp; &nbsp; 外围情况：美三大股指涨跌不一，纳指再创收盘历史新高。截至收盘：道指跌0.1%，报28239.28点；标普500跌0.04%，报3191.14点；纳指涨0.1%，报8831.92点。特斯拉涨超3%，市值超过700亿美元。联邦快递盘中跌超10%，公司2020财年Q2营收及净利润双双下滑，且年内第四次下调盈利目标。值得一提的是，美国众议院周三将表决针对特朗普的弹劾条款。</span> 
</p>
<br />
<span style="line-height:1.5;font-size:18px;">&nbsp; &nbsp; &nbsp;&nbsp;</span><br />`, //文本编辑器内容
      formFileds1: {
        title1: "创业板指走低跌0.5% 手机游戏板块逆势大涨",
        title2:
          "今日上午震荡下行，小幅下跌，创指表现疲软，弱势下行，高送转概念股美联新材4连板，网络直播强势上涨，领涨两市，奥飞娱乐等4股涨停，手机游戏表现活跃，涨幅居前，中文在线等5股涨停，前期大涨的消费电子今日大跌，领跌两市，芯片概念也表现疲软，次新股跌幅居前，银行、证券、保险等权重股也未能持续带头上涨",
      },
      formRules1: [
        [
          {
            title: "一级标题",
            required: true,
            field: "title1",
            type: "text",
          },
        ],
        [
          {
            title: "二级标题",
            required: true,
            field: "title2",
            type: "textarea",
          },
        ],
      ],
    };
  },
};
</script>
<style lang="less" scoped>
.content {
  padding: 15px;
  min-height: 400px;
  background: white;
}
.v-kind {
  > label {
    color: #939394;
    padding: 10px 12px 10px 0;
    text-align: right;
    width: 90px;
    line-height: 300px;
  }
  display: flex;
  > div {
    flex: 1;
  }
}
</style>