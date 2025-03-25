<template>
  <div class="v-table" style="padding: 30px 100px;">
    <Alert type="success" show-icon>Table+表单：由table.vue与form3.vue两个组件引用到此页面</Alert>
    <form3 ref="form3" :showBtn="false">
      <slot></slot>
    </form3>
    <vtable ref="table" style="margin-bottom:20px;"></vtable>
    <div>
      <Button type="success" style="margin-bottom:20px;" long @click="getForm">获取表单</Button>
      <Button type="error" long @click="getRow">获取选中的行</Button>
    </div>
  </div>
</template>
<script>
import form3 from "./form3"; 
import vtable from "./table";
export default {
  components: { form3, vtable },
  methods: {
    getForm() {
      this.$message.error(JSON.stringify(this.$refs.form3.formFields));
    },
    getRow() {
     let rows=this.$refs.table.getRows();
    }
  },
  data() {
    return {};
  }
};
</script>
<style scoped>
.v-table >>> .container {
  padding: 0 !important;
}
</style>