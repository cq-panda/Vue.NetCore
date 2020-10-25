<template>
  <vol-form :url="url"
            :options="options"
            :fields="fields"
            :submitBefore="submitBefore"
            title="查询"></vol-form>
</template>
<script>
export default {
  props: {
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
    searchClick: {
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

      this.searchClick();
      return false;
    }
  }

}
</script>