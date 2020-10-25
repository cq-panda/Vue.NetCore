<template>
  <vol-form :url="url"
            :options="options"
            :fields="fields"
            :show-reset="false"
            ref="form"
            :submitBefore="submitBefore"
            :title="title"></vol-form>
</template>
<script>
export default {
  props: {
    title: {
      type: String,
      default: ""
    },
    fields: {
      type: Object,
      default: () => {
        return {};
      },
    },
    options: {
      type: Array,
      default: () => {
        return [];
      },
    },
    submitClick: {
      type: Function,
      default: () => {
        return ""
      }
    },
    url: "", //保存的url地址
  },
  components: {
    "vol-form": () => import("@/components/VolForm")
  }, methods: {
    submitBefore () {
      this.submitClick();
      return false;
    },
    reset () {
      this.$refs.form.reset();
    }
  }

}
</script>