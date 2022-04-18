<template>
  <div>
    <div
      v-if="!loading"
      :labelWidth="300"
      class="submit-form"
      :style="{ width: formWidth + 'px' }"
    >
      <h3>{{ title }}</h3>
      <vol-form
        ref="form"
        labelPosition="top"
        :labelWidth="0"
        :load-key="true"
        :formFields="options.fields"
        :formRules="options.formOptions"
      >
      </vol-form>
      <div
        style="margin: 20px 0"
        v-for="(item, index) in options.tables"
        :key="index"
      >
        <h4 style="margin-bottom: 10px">{{ item.name }}</h4>
        <vol-table
          :url="item.url"
          :load-key="false"
          :index="true"
          :ref="'table' + index"
          :tableData="item.tableData"
          :columns="item.columns"
          :max-height="250"
          :pagination-hide="item.pagination"
          :column-index="true"
          :ck="true"
        ></vol-table>
      </div>
      <div style="text-align: center" v-if="hasId">
        <el-button type="primary" @click="submit">提交</el-button>
      </div>
      <div v-else style="font-size: 16px; color: #939292">未获取到参数</div>
    </div>
    <div class="f-loading" v-show="loading">正在加载中...</div>
  </div>
</template>

<script>
import VolForm from "@/components/basic/VolForm";
import VolTable from "@/components/basic/VolTable";
export default {
  components: {
    "vol-form": VolForm,
    "vol-table": VolTable,
  },
  data() {
    return {
      hasId: false,
      loading: true,
      formWidth: 300,
      title: "",
      options: {
        fields: { FormId: undefined },
        formOptions: [],
        tables: [],
        tabs: [],
      },
    };
  },
  methods: {
    submit() {
      this.$refs.form.validate(() => {
        let _obj = {};
        for (const key in this.options.fields) {
          _obj[key] =
            this.options.fields[key] &&
            typeof this.options.fields[key] == "object"
              ? this.options.fields[key].join(",")
              : this.options.fields[key];
        }
        this.http
          .post(
            "api/formDesignOptions/submit",
            {
              mainData: {
                FormData: JSON.stringify(_obj),
                FormId: this.options.fields.FormId,
              },
            },
            true
          )
          .then((result) => {
            if (!result.status) {
              return this.$message.error(result.message);
            }
            this.$Message.success("提交成功");
            this.$router.push({ path: "/message", text: "提交成功" });
          });
      });
    },
    initIndex() {
      let maxColumns = 1; // 最大列数，根据列计算弹框的宽度
      this.options.formOptions.forEach((x) => {
        x.forEach((item) => {
          if (item.data) {
            item.data = [];
          }
        });
        if (x.length > maxColumns) maxColumns = x.length;
      });
      //设置宽度
      if (this.options.tables.length) {
        this.formWidth = 800;
      } else {
        this.formWidth = maxColumns === 1 ? 450 : maxColumns * 300;
      }
      if (maxColumns == 1) {
        this.options.formOptions.forEach((options, index) => {
          options[0].placeholder = options[0].title;
          options[0].title = index + 1 + "、" + options[0].title;
        });
      }
    },
  },
  created() {
    //加载后台保存的配置
    this.options.fields.FormId = this.$route.query.id;
    this.hasId = !!this.options.fields.FormId;
    let url = "api/formDesignOptions/getFormOptions?id=" + this.$route.query.id;
    this.http.get(url, {}, true).then((result) => {
      if (!result.data.formOptions) {
        return this.$message.error("未获取到配置信息");
      }
      var formOptions = JSON.parse(result.data.formOptions);
      this.options.formOptions = formOptions.formOptions;

      Object.assign(this.options.fields, formOptions.fields);
      this.options.tables = formOptions.tables;
      this.initIndex();
      this.title = result.data.title;
      this.loading = false;
    });
  },
};
</script>

<style lang="less" scoped>
.f-loading {
  position: absolute;
  left: 0;
  top: 0;
  bottom: 0;
  right: 0;
  margin: auto 0;
  background: white;
  z-index: 999;
  font-size: 21px;
  text-align: center;
  padding-top: 200px;
  color: #a3a3a3;
  letter-spacing: 2px;
}
.submit-form {
  position: relative;
  left: 0;
  right: 0;
  margin: auto;
  padding-top: 25px;
  h3 {
    padding-bottom: 15px;
    text-align: center;
  }
}
</style>