<template>
  <div class="com-tree">
    <div class="left-tree">
      <tree-demo :onChange="onChange2"></tree-demo>
    </div>
    <div class="right-table">
      <table-demo ref="table2"></table-demo>
    </div>
  </div>
</template>
<script>
import TableDemo from "./demo2/Table2.vue";
import treeDemo from "./demo2/Tree2.vue";
export default {
  components: {
    treeDemo,
    TableDemo
  },
  created() {
    //初始化一个对象全局缓存起来，当点击左边树形菜单时，把点击菜单的treeId(角色id)存到treeDemo1里
    this.$store.getters.data().treeDemo2 = { treeId: undefined };
  },
  methods: {
    onChange2(treeId) {
      if (!this.$refs.table2) {
        this.$nextTick(() => {
          this.$store.getters.data().tableDemo2.refresh();
        });
      } else {
        this.$store.getters.data().tableDemo2.refresh();
      }
    }
  }
};
</script>

<style lang="less" scoped>
.com-tree {
  display: flex;
  > .left-tree {
    width: 215px;
  }
  > .right-table {
    flex: 1;
  }
}
</style>
