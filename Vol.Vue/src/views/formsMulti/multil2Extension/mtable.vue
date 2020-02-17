<template>
  <div class="m-container">
    <div class="m-step">
      <Steps :current="1">
        <Step title="已完成" content="这里是该步骤的描述信息"></Step>
        <Step title="进行中" content="这里是该步骤的描述信息"></Step>
        <Step title="待进行" content="这里是该步骤的描述信息"></Step>
        <Step title="待进行" content="这里是该步骤的描述信息"></Step>
      </Steps>
    </div>
    <div class="m-form">

    </div>
    <div class="m-tabs">
      <Tabs>
        <TabPane label="一对多表1" icon="ios-aperture">
          <table1></table1>
        </TabPane>
        <TabPane label="Form表单只读" icon="ios-apps"><form7></form7></TabPane>
        <TabPane class="tb-3" label="Form表单" icon="md-apps"><form3></form3></TabPane>
      </Tabs>
    </div>
    <br />
    <br />
    <br />
    <br />
  
  </div>
</template>
<script>
import table1 from "../multil1Extension/table1.vue";
import form3 from "@/views/forms/form3.vue";
import form7 from "@/views/forms/form7.vue";
export default {
  components: {
    table1,
    form3,
    form7
  }
};
</script>
<style lang="less" scoped>
.m-step {
  padding: 20px 112px;
  background: white;
  margin: 20px 0px;
}
.m-tabs {
  padding: 12px 15px;
  margin: 20px 0px;
  background: white;
}
</style>
<style scoped>
.m-tabs >>> .container {
  padding: 0px;
  border: 0px;
      margin: 0;
}
.tb-3 >>> .container {
    padding-top:0 !important
}
</style>