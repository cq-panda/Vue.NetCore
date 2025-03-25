<template>
  <el-alert
    title="拖动列名可调整表格列显示顺序"
    type="success"
    :show-icon="false"
  >
  </el-alert>
  <div class="view-column view-column-title">
    <div class="view-column-index">#</div>
    <div class="view-column-left">列名</div>
    <div class="view-column-right">是否显示</div>
  </div>
  <draggable
    class="list-group"
    tag="transition-group"
    :component-data="componentData"
    :list="viewColumns"
    v-bind="dragOptions"
    item-key="order"
  >
    <transition-group class="drag-center-item">
      <div
        class="view-column"
        v-for="(column, index) in viewColumns"
        :key="index"
      >
        <div class="view-column-index">{{ index + 1 }}</div>
        <div class="view-column-left">{{ column.title }}</div>
        <div class="view-column-right">
          <el-checkbox v-model="column.show">
            <div style="height: 100%; width: 250px"></div
          ></el-checkbox>
        </div>
      </div>
    </transition-group>
  </draggable>
</template>
<script>
import { VueDraggableNext } from 'vue-draggable-next';
import { defineComponent, ref, reactive } from 'vue';

export default defineComponent({
  props: {
    viewColumns: {
      type: Array,
      default: () => {
        return [];
      }
    }
  },
  components: {
    draggable: VueDraggableNext
  },
  data() {
    return {};
  },
  setup(props, context) {
    const dragOptions = reactive({
      animation: 200,
      group: 'description',
      disabled: false,
      ghostClass: 'ghost'
    });
    const componentData = reactive({
      tag: 'ul',
      type: 'transition-group'
    });
    return { dragOptions, componentData };
  }
});
</script>
<style lang="less" scoped>
.view-column {
  cursor: pointer;
  display: flex;
  padding: 10px;
  border-bottom: 1px solid #f3f3f3;
  .view-column-index {
    width: 50px;
  }
  .view-column-left {
    width: 120px;
    padding: 0 10px;
  }
  .view-column-right {
    flex: 1;
  }
}
.view-column-title {
  font-weight: bold;
}
.view-column:last-child {
  border-bottom: 0;
}
</style>
