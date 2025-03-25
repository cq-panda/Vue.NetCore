<template>
  <div
    class="qk-search"
    :class="[formLen == 1 ? 'form-1' : '', hasDate ? 'date-form' : 'qk-form']"
  >
    <vol-form
      ref="searchForm"
      labelPosition="left"
      :load-key="false"
      :label-width="labelWidth"
      :formRules="formOptions"
      :formFields="searchFormFields"
      :select2Count="select2Count"
    >
    </vol-form>
  </div>
</template>
<script>
import VolForm from "@/components/basic/VolForm.vue";
export default {
  components: {
    VolForm,
  },
  props: {
    select2Count: {
      type: Number,
      default: 2000,
    },
    labelWidth: {
      type: Number,
      default: 100,
    },
    searchFormOptions: {
      type: Array,
      default: () => {
        return [];
      },
    },
    searchFormFields: {
      type: Object,
      default: () => {
        return {};
      },
    },
    tiggerPress: {
      type: Function,
      default: () => {},
    },
    queryFields: {
      //快捷查询的字段
      type: Array,
      default: () => {
        return [];
      },
    },
  },
  data() {
    return {
      formLen: 1,
      formOptions: [],
      hasDate: false,
    };
  },
  created() {
    this.initForm();
  },
  methods: {
    initForm() {
      this.formOptions.splice(0);
      let ops = [];
      if (this.queryFields.length) {
        for (let index = 0; index < this.queryFields.length; index++) {
          const field = this.queryFields[index];
          this.searchFormOptions.forEach((options) => {
            options.forEach((x) => {
              if (field == x.field) {
                ops.push(x);
              }
            });
          });
        }
        // this.formOptions.push(ops);
        this.formLen = ops.length;
      }

      if (!ops.length && this.searchFormOptions.length) {
        ops.push(this.searchFormOptions[0][0]);
        //  this.formOptions.push([this.searchFormOptions[0][0]]);
      }
      ops.forEach((x) => {
        if (!x.onKeyPress) {
          x.onKeyPress = ($event) => {
            if ($event && $event.keyCode == 13) {
              this.$emit("tiggerPress", $event);
            }
          };
        }
      });
      this.formOptions.push(ops);
      //tiggerPress
      this.hasDate = ops.some((x) => {
        return (x.type == "date" || x.type == "datetime") && x.range == true;
      });
    },
  },
};
</script>
<style lang="less" scoped>
.qk-search ::v-deep(.el-form-item__label) {
  // display: none;
  width: auto !important;
  margin-left: 10px;
}

.form-1::v-deep(.el-form-item__label) {
  display: none;
}

.qk-search {
  overflow: hidden;
  height: 38px;
  position: relative;
  top: -6px;
  // right: -21px;
}

.qk-search ::v-deep(.el-form-item) {
  width: auto !important;
  min-width: 180px;
}

.qk-form ::v-deep(.el-form-item__content) {
  width: 140px;
}

.date-form ::v-deep(.v-date-range) {
  width: 205px;
  margin-top: 1px;
}
</style>
