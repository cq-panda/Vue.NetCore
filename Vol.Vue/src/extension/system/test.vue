<template>
  <Alert type="error">此处维护的数据用于界面下拉框或多选框的数据源,维护完成后即可在代码生成器选中此处维护的字典编号作为界面的数据源,具体配置参照现有配置</Alert>
</template>
<script>
export default {
  methods: {},
  created() {
    this.$emit("parentCall", $vue => {
        //$vue对象为ViewGrid.vue的对象，能操作所有组件及子组件
    });
  }
};
</script>