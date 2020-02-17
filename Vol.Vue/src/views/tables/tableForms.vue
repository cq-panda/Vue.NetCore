<template>
  <div class="tb-container">
    <div class="v-top">
      <div class="v-left">
        <VolHeader icon="md-apps" text="基础表单" style="margin-bottom: 20px;">
          <div style="text-align: right;padding-top: 5px; margin-right: 32px;">
            <Button type="default" size="small" @click="resetForm">重置表单</Button>
          </div>
        </VolHeader>
        <VolForm
          style="padding-right: 35px;"
          ref="myform1"
          :loadKey="true"
          :formFileds="options.formFileds1"
          :formRules="options.formRules1"
        ></VolForm>
      </div>
      <div class="v-right">
        <div class="v-left">
          <VolHeader icon="md-apps" text="table表数据" style="margin-bottom: 20px;"></VolHeader>
          <vol-table
            ref="tablex"
            :linkView="_linkView"
            :columns="options.table.columns"
            :height="220"
            :index="true"
            :tableData="options.table.data"
            :paginationHide="true"
          ></vol-table>
        </div>
      </div>
    </div>
    <div class="t-bottom">
      <Alert type="success" show-icon>
        使用完整操作的table
        <div slot="desc">如果需要使用带增删改查导入导出的完整组件，可参照代码生成的vue页面进行配置或使用ViewGird.vue组件,使用ViewGird.vue组件配置完整操作参照下面【table基础配置】</div>
      </Alert>
      <view-grid
        :columns="viewGridOptions.columns"
        :editFormFileds="viewGridOptions.editFormFileds"
        :editFormOptions="viewGridOptions.editFormOptions"
        :searchFormFileds="viewGridOptions.searchFormFileds"
        :searchFormOptions="viewGridOptions.searchFormOptions"
        :table="viewGridOptions.table"
        :extend="viewGridOptions.extend"
      ></view-grid>
    </div>
  </div>
</template>
<script>
import options from "./tableForms.js";
import viewGridOptions from "./tableFormsViewGrid.js";
import VolTable from "@/components/basic/VolTable.vue";
import VolBox from "@/components/basic/VolBox.vue";
import VolHeader from "@/components/basic/VolHeader.vue";
import VolForm from "@/components/basic/VolForm.vue";
import ViewGrid from "@/components/basic/ViewGrid.vue";
export default {
  components: { VolTable, VolBox, VolHeader, VolForm, ViewGrid },
  methods: {
    _linkView(row) {
      this.$Message.error(JSON.stringify(row));
    },
    resetForm() {
      this.$Message.error("表单已重置");
      this.$refs.myform1.reset();
    }
  },
  data() {
    return {
      options: options,
      viewGridOptions: viewGridOptions
    };
  }
};
</script>
<style lang="less" scoped>
.tb-container {
  background: #eee;
  padding: 6px;
  .v-top {
    display: flex;
    > div {
      background: white;
      margin: 10px;
      flex: 1;
      height: 300px;
    }
  }
}
</style>
