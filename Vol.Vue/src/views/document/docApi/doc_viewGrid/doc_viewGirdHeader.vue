
<template>
  <div>
    <Alert type="info">此处是对ViewGird组件Header扩展的doc_viewGirdHeader.vue组件，你可以在此处写任何你想写的代码</Alert>
    <VolBox :model.sync="model" title="扩展子组件header中的弹出框" :height="400" :width="700" :padding="15">
      <div>
        <div>通过 this.$emit("parentCall", $vue => {})可以访问父组件ViewGird中的任何属性、对象、方法</div>
        <div>当前选中的行：</div>
        <div>{{text}}</div>
      </div>
      <div slot="footer">
        <Button type="error" @click="getParentEl()">获取父组件GridView选中的行数据</Button>
        <Button type="info" @click="()=>{model=false}">点击关闭弹出框</Button>
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
      model: false
    };
  },
  methods: {
    getParentEl() {
      this.$emit("parentCall", $vue => {
        //获取明细表$vue.getDetailSelectRows()选中的行;
        let rows = $vue.getSelectRows();
        if (rows.length == 0) {
          return this.$Message.error("请先请选中查询界面的行数据");
        }
        this.text = JSON.stringify(rows);
      });
    }
  }
};
</script>
