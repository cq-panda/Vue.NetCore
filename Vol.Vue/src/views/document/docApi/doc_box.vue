<template>
  <div>
    <div class="i-text">
      <h2>组件引入方式</h2>
    </div>
    <pre class="bg-ms">
        <code>
        import Icons from "@/components/basic/VolBox.vue";
        </code>
    </pre>
    <Button type="info" @click="model=!model">弹出框</Button>
    <VolBox icon="ios-chatbubbles" :model.sync="model" title="弹出框标题" :height="400" :width="700" :padding="15">
      <div>弹出框内容</div>
      <!-- footer 这里不写，默认有一个关闭按钮 -->
      <div slot="footer">
        <Button type="default" @click="()=>{this.$Message.error('点击确认')}">确认</Button>
        <Button type="default" @click="()=>{model=false}">点击关闭弹出框</Button>
      </div>
    </VolBox>
    <div>
      <docParamTable name="box"></docParamTable>
    </div>
  </div>
</template>
<script>
import VolBox from "@/components/basic/VolBox.vue";
import docParamTable from "./doc_ParamTable.vue";
export default {
  data() {
    return {
      model: false
    };
  },
  components: { VolBox, docParamTable },
  methods: {}
};
</script>