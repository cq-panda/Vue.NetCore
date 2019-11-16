<template>
  <div>
    <div class="i-text">
      <h2>组件引入方式</h2>
    </div>
    <pre class="bg-ms">
        <code>
        import Icons from "@/components/basic/VolHeader.vue";
        </code>
    </pre>
    <VolHeader style="margin: 30px 0;" :icon="icon" :text="text">
      <div slot="content">VolHeader这里可以定义显示内容</div>
      <div style="text-align: right;padding-top: 4px;">
        <Button type="text" icon="ios-search" size="small" @click="()=>{this.$Message.error('1')}">buttons1</Button>
        <Button type="text" icon="ios-search" size="small" @click="()=>{this.$Message.error('2')}">buttons2</Button>
      </div>
    </VolHeader>
    <div>
      <docParamTable name="header"></docParamTable>
    </div>
  </div>
</template>
<script>
import VolHeader from "@/components/basic/VolHeader.vue";
import docParamTable from "./doc_ParamTable.vue";
export default {
  data() {
    return {
      icon: "md-male",
      text: "主题名称"
    };
  },
  components: { VolHeader, docParamTable },
  methods: {
    onSelect(icon) {
      this.$Message.error(icon);
    }
  }
};
</script>