<template>
  <div>
    <div class="i-text">
      <h2>组件引入方式</h2>
    </div>
    <pre class="bg-ms">
        <code>
        import Icons from "@/components/basic/Icons.vue";
        </code>
      </pre>
    <div>
      <docParamTable name="icons"></docParamTable>
    </div>
    <Icons :on-select="onSelect"></Icons>
  </div>
</template>
<script>
import Icons from "@/components/basic/Icons.vue";
import docParamTable from "./doc_ParamTable.vue";
export default {
  data() {
    return {};
  },
  components: { Icons, docParamTable },
  methods: {
    onSelect(icon) {
      this.$Message.error(icon);
    }
  }
};
</script>