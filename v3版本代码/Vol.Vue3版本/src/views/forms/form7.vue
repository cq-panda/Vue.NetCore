<template>
  <div class="t-dis1">
    <VolHeader
      icon="el-icon-warning-outline"
      text="表单属性(显示纯文本)"
      style="margin-bottom: 20px"
    >
   <template #content>
         <div style="color: #909090;">设置type='label'以纯文本方式显示(只读表单默认对下拉框字典转换,不需要手动处理下拉框数据源)</div>
   </template>
    </VolHeader>
    <VolForm
      ref="myform1"
      :label-width="75"
      :formFields="formFields"
      :formRules="formRules2"
    ></VolForm>
  </div>
  <el-alert style="margin: 0 20px;width: auto;" type="success" :closable="false">
    <p>设置type='label'以纯文本方式显示,设置readonly=true以组件只读方式显示。具体使用见：框架文档->组件api->VolForm。<a
          href="http://v2.volcore.xyz/document/api"
          target="_blank"
          >点击查看文档
        </a></p>
  </el-alert>
  <div class="t-dis2">
    <VolHeader
      icon="el-icon-warning-outline"
      text="表单属性(显示原组件)"
      style="margin-bottom: 20px"
    >
       <template #content>
         <div style="color: #909090;">设置readonly=true以组件只读方式显示</div>
   </template>
    </VolHeader>
    <VolForm
      ref="myform2"
      :label-width="75"
      :formFields="formFields"
      :formRules="formRules"
    ></VolForm>
  </div>
</template>
<script>
import VolForm from "@/components/basic/VolForm.vue";
import VolHeader from "@/components/basic/VolHeader.vue";
export default {
  components: { VolForm, VolHeader },
  methods: {
    getForm() {
      this.$message.error(JSON.stringify(this.formFields));
    },
    reset() {},
  },
  mounted() {},
  data() {
    return {
      loadKey: true,
      formFields: {
        Variety: "日用品",
        DateRange: "2019-09-01",
        City: "北京市",
        AvgPrice: 1238000,
        Variety1: "",
        DateRange1: "2019-09-02",
        City1: "上海市",
        AvgPrice1: 7.72,
        DateRange2: "2019-09-03",
        City2: "广州市",
        AvgPrice2: 6.66,
        IsTop: "1",
      },
      formRules: [
        // 两列的表单，formRules数据格式为:[[{},{}]]
        [
          {
            title: "商品类型",
            dataKey: "age",
            // 如果这里绑定了data数据，后台不会加载此数据源
            data: [],
            field: "Variety",
            readonly: true,
            type: "select",
          },
          {
            dataKey: "city",
            title: "所在城市",
            field: "City",
            readonly: true,
            type: "select",
            data: [],
          },
          {
            title: "成交均价",
            field: "AvgPrice",
          },
        ],
        [
          {
            dataKey: "city",
            title: "所在地区",
            field: "City1",
            readonly: true,
            type: "select",
            data: [],
          },
          {
            title: "生产价格",
            field: "AvgPrice1",
            readonly: true,
          },
          {
            title: "审核日期",
            field: "DateRange",
            type: "date",
            readonly: true,
          },
        ],
        [
          {
            dataKey: "city",
            title: "详细地址",
            field: "City2",
            readonly: true,
            type: "select",
            data: [],
          },
          {
            title: "平均重量",
            field: "AvgPrice2",
            type: "number",
            readonly: true,
          },
          {
            type: "date",
            title: "生产日期",
            field: "DateRange2",
            readonly: true,
          },
        ],
      ],
      formRules2: [
        [
          {
            title: "商品类型",
            dataKey: "age",
            data: [],
            field: "Variety",
            type: "label",
          },
          {
            dataKey: "city",
            title: "所在城市",
            field: "City",
            type: "label",
            data: [],
            type: "label",
          },
          {
            title: "成交均价",
            field: "AvgPrice",
            type: "label",
          },
        ],
        [
          {
            dataKey: "city",
            title: "所在地区",
            field: "City1",
            type: "label",
            data: [],
          },
          {
            title: "生产价格",
            field: "AvgPrice1",
            type: "label",
          },
          {
            title: "审核日期",
            field: "DateRange",
            type: "label",
          },
        ],
        [
          {
            title: "详细地址",
            field: "City2",
            type: "label",
          },
          {
            title: "平均重量",
            field: "AvgPrice2",
            type: "label",
          },
          {
            type: "label",
            title: "生产日期",
            field: "DateRange2",
          },
        ],
      ],
    };
  },
};
</script>
<style lang="less" scoped>
.t-dis1,.t-dis2 {
  margin-bottom: 15px;
  background: white;
  border: 1px solid #f5f5f5;
  padding: 5px;
  border-radius: 5px;
  margin: 15px 20px 0 20px;
}
.t-dis1 ::v-deep(.el-form-item){
  margin-bottom: 5px;
}
</style>
