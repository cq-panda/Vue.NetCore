<template>
  <div>
    <Divider>你也可在未尾添加组件等业务</Divider>
    <Collapse v-model="value1">
      <Panel name="1">
        其他属性
        <div slot="content">
          <h4>如果需要获整个ViewGrid的Vue对象,请在方法中使用 this.$emit("parentCall", $vue => {})</h4>
          <div>
            <Button type="success" @click="getUpdateRow">点击获取当前弹出框的数据</Button>
          </div>
          <div>{{text}}</div>
        </div>
      </Panel>
    </Collapse>
  </div>
</template>
<script>
export default {
  data() {
    return {
      text: "测试。。。。。",
      value1: "1"
    };
  },
  methods: {
    getUpdateRow() {
      this.$emit("parentCall", $vue => {
        let message = "当前弹出框为";
        if ($vue.currentAction == $vue.const.ADD) {
          message += "新建状态;";
        } else {
          message += "编辑状态;";
        }
        message += "表单数据是：" + JSON.stringify($vue.editFormFileds);
        this.text = message;
      });
    }
  },created(){
      console.log('model-created');
  }
};
</script>