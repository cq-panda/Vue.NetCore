<template>
  <div style="border-bottom: 10px solid rgb(228 228 228)">
    <el-alert type="success" title="gridHeader扩展位置" show-icon>
      <div>
       1、此代码位置GridHeaderExtend.vue扩展组件被SellOrder.js的属性gridHeader引用,你可以在此弹出框定义其他业务。
        <a style="color: #409eff; cursor: pointer" @click="search"
          >点击调用父组件查询方法</a
        >
        <a
          style="color: #409eff; cursor: pointer; margin-left: 20px"
          @click="add"
          >点击调用父组件新建方法</a
        >
      </div>
      <div>
        2、使用 this.$emit('parentCall', ($vue) => {})可以访问整个界面上的所有属性(页面具体对象与属性，见 <a target="_blank" href="http://www.volcore.xyz/document/api">viewgrid文档</a>)
      </div>
    </el-alert>
  </div>
</template>
<script>
import { ref, defineComponent } from "vue";
export default defineComponent({
    emits: ["parentCall"],
  setup(props, context) {
    const search = () => {
      context.emit("parentCall", ($parent) => {
        $parent.search();
      });
    };
    const add = () => {
      context.emit("parentCall", ($parent) => {
        $parent.add();
      });
    };
    return { search, add };
  },
});
</script>
