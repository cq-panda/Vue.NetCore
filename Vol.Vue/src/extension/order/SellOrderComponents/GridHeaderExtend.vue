<template>
  <div>
    <Alert type="error">
      <h5>SellOrder.js文件中的扩展SellOrder表的头部信息,你可以在此处定义需要显示的信息,如果需要获取界面的Vue对象属性,参照此扩展组件GridHeaderExtend.vue的说明</h5>
    </Alert>
    <!--点击扩展按钮对应的弹出框-->
    <vol-box :model.sync="model" title="动态扩展组件测试" :width="600" :height="450">
      <Alert type="error">
        <h4>此弹出框代码位置GridHeaderExtend.vue扩展组件被SellOrder.js的属性gridHeader引用,你可以在此弹出框定义其他业务。</h4>
      </Alert>
      <div>
        <h6>
          如获取GridView页面的对象：
          this.$emit('parentCall',($vue)=>{//$vue为整View对象})
        </h6>
      </div>
      <div style="padding:30px 0px;">
        <Button type="error" @click="getFirstRow" long>点击获取GirdView页面第一行数据</Button>
      </div>
      <!-- 添加slot槽覆盖footer的按钮，添加新的按钮 -->
      <div slot="footer">
        <Button type="success" @click="model=false">点我关闭</Button>
        <Button type="info" @click="model=false">关闭</Button>
      </div>
    </vol-box>
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
    getFirstRow() {
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
  },created(){
    console.log('header-created');
  }
};
</script>