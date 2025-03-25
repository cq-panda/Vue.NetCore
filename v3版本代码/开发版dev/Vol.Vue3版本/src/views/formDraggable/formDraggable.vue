<template>

  <VolFormDraggable @save="save" :userComponents="userComponents"></VolFormDraggable>
</template>

<script>
// 
import VolFormDraggable from "@/components/basic/VolFormDraggable/index.js";
export default {
  components: {
    VolFormDraggable,
  },
  methods: {
    save(options) {
      this.$Message.success("可以将当前配置保存到数据库中用于二次维护");
      console.log(JSON.stringify(options))
    },
  },
  data(){
      return{
          userComponents:[]
      }
  },
  created() {
    //收起左侧菜单
    this.menu.hide();
  },
};
</script>
<style lang="less" scoped>
</style>