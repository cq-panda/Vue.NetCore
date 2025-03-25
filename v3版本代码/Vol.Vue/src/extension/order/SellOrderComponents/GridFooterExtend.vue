<template>
  <div style="margin-top:5px;">
    <Alert type="warning">
      <h5>SellOrder.js文件中的扩展SellOrder表的Footer信息,你可以在此处定义需要显示的信息,如果需要获取界面的Vue对象属性,参照此扩展组件GridHeaderExtend.vue的说明</h5>
    </Alert>
  </div>
</template>
<script>
export default {
  components: {
    VolBox: () => import("@/components/basic/VolBox.vue")
  },
  data() {
    return {
      model: false
    };
  },
  methods: {
    testxxxx() {
      //获取ViewGrid的Vue对象
      this.$emit("parentCall", $vue => {
        let rows = $vue.$refs.table.rowData;
        this.$message.error(
          rows.length == 0 ? "表格没有数据" : JSON.stringify(rows[0])
        );
        //此于拿到的$vue你可以操作其中的任何对象，如:
        //props.js中的属性，this.columns/this.editFormFileds
        //或者操作其他动态扩展的组件如:$vue.$refs.gridBody/$vue.$refs.gridFooter
        //$vue.$refs.table获取表格信息
        //$vue.refresh()刷新表格等操作
        //能操作的所有对象可参照props.js与ViewGird.uve的属性
        //能操作的方法methods.js/detailMethods.js
      });
    }
  }
};
</script>