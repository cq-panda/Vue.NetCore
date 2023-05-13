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
        2、使用 this.$emit('parentCall', ($vue) =>
        {})可以访问整个界面上的所有属性(页面具体对象与属性，见
        <a target="_blank" href="http://www.volcore.xyz/document/api"
          >viewgrid文档</a
        >)
      </div>
    </el-alert>
  </div>
  <vol-box
    :lazy="true"
    v-model="model1"
    title="弹出框2"
    :width="500"
    :padding="5"
    :onModelClose="onModelClose"
  >
    <div style="height: 150px;">按钮点击的弹出框</div>
  </vol-box>


  <vol-box
    :lazy="true"
    v-model="model2"
    title="弹出框2"
    :width="700"
    :padding="5"
    :onModelClose="onModelClose"
  >
    <div style="height: 400px;">表格当前行数据:{{ JSON.stringify(row2) }}</div>
    <template #footer>
      <el-button type="primary" size="small" @click="model2 = false"
        >确认</el-button
      >
      <el-button type="default" size="small" @click="model2 = false"
        >关闭弹</el-button
      >
    </template>
  </vol-box>
</template>
<script>
import VolBox from '@/components/basic/VolBox.vue';

import { ref, defineComponent } from 'vue';
export default defineComponent({
  components: {
    VolBox
  },
  setup(props, context) {
    const search = () => {
      context.emit('parentCall', ($parent) => {
        $parent.search();
      });
    };
    const add = () => {
      context.emit('parentCall', ($parent) => {
        $parent.add();
      });
    };
    const model1 = ref(false);
    const model2 = ref(false);
    const open1 = () => {
      model1.value = true;
    };
    const row2 = ref(null);
    const open2 = (row) => {
      model2.value = true;
      row2.value = row;
    };
    return { search, add, open1, open2, model1, model2, row2 };
  }
});
</script>
