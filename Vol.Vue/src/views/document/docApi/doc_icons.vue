<template>
  <div style="text-align: center;padding:50px">
  <a href="https://element.eleme.cn/#/zh-CN/component/icon" target="_blank" style="font-size: 20px;">查看Element ui图标</a>
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