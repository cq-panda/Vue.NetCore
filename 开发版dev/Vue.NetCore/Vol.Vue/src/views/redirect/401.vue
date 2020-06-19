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
      errorNumber:'401',
      text: "抱歉，您没有权限进行此操作~"
    };
  }
};
</script>
