<template>
  <div class="vol-empty">
    <el-icon size="30" style="color: #8f8f8f"><MessageBox /> </el-icon>
    <div style="color: #8f8f8f">{{ text }}</div>
  </div>
</template>

<script setup>
import { reactive, ref,  getCurrentInstance } from "vue";
const props = defineProps({
  list: {
    type: Array,
    default: () => {
      return [];
    },
  },
  text: {
    type: String,
    default: "无数据",
  },
});
const activeName = ref("sys");
const handleClick = (e) => {};
const msgCount = ref(3);
</script>
<style scoped lang="less">
.vol-empty {
  padding-top: 30px;
  text-align: center;
}
</style>
