<template>
  <div style="height:100%;">
    <redirect-error :text="text" :errorNumber="errorNumber">
      <div slot>
        <router-link to="SellOrder">
          <Button>点击查看[测试完整示例]</Button>
        </router-link>
      </div>
    </redirect-error>
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
      errorNumber: "用例正在整理中",
      text: "详细用例在正准备中,目前可参考[测试完整示例]的使用方法"
    };
  }
};
</script>
