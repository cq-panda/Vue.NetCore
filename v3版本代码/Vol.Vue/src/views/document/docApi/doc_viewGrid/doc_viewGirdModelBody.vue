
<template>
  <div>
    <Alert type="error">
      <Button type="info" @click="getDetailSelectRow()">获取明细选中的行</Button>
      <div class="desc">1、此处是对ViewGird组件modelBody扩展的doc_viewGirdModelBody.vue组件，你可以在此处写任何你想写的代码</div>
      <div class="desc">2、通过 this.$emit("parentCall", $vue => {})可以访问父组件ViewGird中的任何属性、对象、方法</div>
      <div class="desc">
        3、当前编辑的行数据：
        <div>{{text}}</div>
      </div>
    </Alert>
    <VolBox
      :model.sync="bodyModel"
      title="扩展子组件modelBody中的弹出框"
      :height="280"
      :width="450"
      :padding="15"
    >
      <div>
        <div>这里点击弹出框中的按钮触发的弹出框</div>
      </div>
    </VolBox>
  </div>
</template>
<script>
import VolBox from "@/components/basic/VolBox.vue";

export default {
  components: { VolBox },
  data() {
    return {
      text: "无",
      bodyModel: false
    };
  },
  created() {
    this.$emit("parentCall", $vue => {
      //获取当前编辑的行;
      this.text = JSON.stringify($vue.currentRow);
    });
  },
  methods: {
    getDetailSelectRow() {
      this.$emit("parentCall", $vue => {
        //获取当前编辑的行;
        let rows = $vue.getDetailSelectRows();
        if (rows.length == 0) {
          return this.$Message.error("请选中订单明细的行");
        }
        this.$Message.error(JSON.stringify(rows));
      });
    }
  }
};
</script>
<style scoped>
.desc {
  padding: 3px 5px;
}
</style>