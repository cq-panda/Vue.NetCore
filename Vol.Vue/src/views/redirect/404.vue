<template>
  <div style="height:100%;">
    <redirect-error :text="text" :errorNumber="errorNumber"></redirect-error>
  </div>
</template>
  <script>
import RedirectError from "@/components/basic/redirectError.vue";
export default {
  components: {
    RedirectError
  },
  data() {
    return {
      errorNumber:'404',
      text: "抱歉，页面好像去火星了~"
    };
  }
};
</script>


