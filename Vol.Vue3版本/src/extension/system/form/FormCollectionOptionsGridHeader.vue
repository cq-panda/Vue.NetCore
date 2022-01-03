<template>
  <div>
    <VolBox
      :on-model-close="onModelClose"
      :lazy="true"
      v-model="model"
      title="表单设计"
      :height="height"
      :width="width"
      :padding="0"
    >
      <VolFormDraggable
        ref="form"
        :showTips="false"
        :style="{ height: height + 'px' }"
        @save="save"
        :userComponents="userComponents"
      ></VolFormDraggable>
      <template #footer>
        <el-button type="default" size="small" @click="model = false"
          >关闭</el-button
        >
      </template>
    </VolBox>
  </div>
</template>
    <script>
import VolFormDraggable from "@/components/basic/VolFormDraggable/index.js";
import VolBox from "@/components/basic/VolBox.vue";
export default {
  components: {
    VolBox,
    VolFormDraggable,
  },
  data() {
    return {
      height: 0,
      width: 0,
      model: false,
      userComponents: [],
      row: {},
    };
  },
  created() {
    this.width = document.body.clientWidth * 0.96;
    this.height = document.body.clientHeight * 0.9;
  },
  methods: {
    open(row) {
      if (row.DaraggeOptions && row.DaraggeOptions != "[]") {
        this.userComponents = JSON.parse(row.DaraggeOptions);
      } else {
        this.userComponents = [];
      }
      this.row = row;
      this.model = true;
    },
    onModelClose() {},
    save(options) {
      if (!options) {
        options = this.$refs.form.save();
      }
      this.row.DaraggeOptions = JSON.stringify(options.daraggeOptions);
      this.row.FormOptions = JSON.stringify(options.formOptions);
      let formConfig = [];
      options.formOptions.formOptions.forEach((item) => {
        formConfig.push(...item);
      });
      this.row.FormConfig = JSON.stringify(formConfig);
      this.row.TableConfig=JSON.stringify(options.formOptions.tables);
      this.http
        .post("api/FormDesignOptions/update", { mainData: this.row }, true)
        .then((x) => {
          if (!x.status) {
            this.$Message.error(x.message);
            return;
          }
          this.model = false;
        });
    },
  },
};
</script>