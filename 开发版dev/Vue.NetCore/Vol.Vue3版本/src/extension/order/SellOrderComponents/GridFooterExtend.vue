<template>
  <div style="margin-top: 10px;">
    <el-alert type="info" title="gridFooter扩展位置" show-icon>
      <div>
        此代码位置gridFooter.vue扩展组件被SellOrder.js的属性gridFooter引用,你可以在此弹出框定义其他业务。
        <a style="color: #409eff; cursor: pointer"
          >使用方式与上面gridHeader一致</a
        >
      </div>
    </el-alert>
  </div>
</template>
<script>
import { ref, defineComponent } from "vue";
export default defineComponent({
  setup(props, context) {
    return {}
  },
});
</script>
