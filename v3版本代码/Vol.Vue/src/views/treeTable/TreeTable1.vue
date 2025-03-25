<template>
  <div class="com-tree">
    <div class="left-tree">
      <tree-demo :onChange="onChange1"></tree-demo>
    </div>
    <div class="right-table">
      <table-demo></table-demo>
    </div>
  </div>
</template>
<script>
import treeDemo from "./demo1/Tree.vue";
import TableDemo from "./demo1/Table.vue";
export default {
  components: {
    treeDemo,
    TableDemo,
  },
  created() {
    //初始化一个对象全局缓存起来，当点击左边树形菜单时，把点击菜单的treeId(角色id)存到treeDemo1里
    this.$store.getters.data().treeDemo1 = { treeId: undefined };
  },
  methods: {
    onChange1(treeId) {
      //调用table(viewGird.vue)刷新方法
      this.$store.getters.data().viewGridDemo.nodeClick(treeId); //这里可以写任意参数
    },
  },
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
