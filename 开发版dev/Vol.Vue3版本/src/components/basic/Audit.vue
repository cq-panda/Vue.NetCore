<template>
  <el-alert
    :title="'当前选中' + auditParam.rows + '条记录待审核..'"
    type="success"
    :closable="false"
  >
  </el-alert>
  <div class="item">
    <label>审核结果：</label>
    <el-radio-group v-model="auditParam.status">
      <el-radio
        v-for="item in auditParam.data"
        :key="item.status"
        :label="item.status"
      >
        <span>{{ item.text }}</span>
      </el-radio>
    </el-radio-group>
  </div>
  <div class="item">
    <label style="margin-right: 13px;">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 注：</label>
    <el-input
      v-model="auditParam.reason"
      type="textarea"
      style="margin-right: 13px;"
      :autosize="{ minRows: 4, maxRows: 10 }"
      placeholder="审核备注..."
    ></el-input>
  </div>
</template>
<script>
export default {
  props: {
    auditParam: {
      type: Object,
      default: () => {
        return {
          auditParam: {
            rows: 0,
            model: false,
            status: -1,
            reason: "",
            data: [], //[{ text: "通过", status: 1 }, { text: "拒绝", status: 2 }]
          },
        };
      },
    },
  },
};
</script>
<style lang="less" scoped>
.item{
  margin-top: 20px;
  display: flex;
  > label{
    width: 86px;
  }
}
</style>