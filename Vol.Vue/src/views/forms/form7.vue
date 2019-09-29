<template>
  <div style="padding: 30px 100px;">
    <Divider>设置部分属性字段只读</Divider>
    <VolForm ref="myform" :loadKey="loadKey" :formFileds="formFileds" :formRules="formRules"></VolForm>
    <Button type="success" style="margin-bottom:20px;" long @click="getForm">获取表单</Button>
  </div>
</template>
<script>
import VolForm from "@/components/basic/VolForm.vue";
export default {
  components: { VolForm },
  methods: {
    getForm() {
      if (!this.$refs.myform.validate()) {
        return;
      }
      this.$message.error(JSON.stringify(this.formFileds));
    },
    reset() {
    }
  },
  mounted() {},
  data() {
    return {
      loadKey: true,
      formFileds: {
        Variety: "",
        DateRange: '2019-09-01',
        City: "北京市",
        AvgPrice: 8.88,
        Date: "",
        IsTop: "1"
      },
      formRules: [
        //两列的表单，formRules数据格式为:[[{},{}]]
        [
          {
            columnType: "string",
            title: "品种", 
            dataKey: "age",
            //如果这里绑定了data数据，后台不会加载此数据源
            data: [{ key: "1", value: "1" }, { key: "2", value: "2" }],
            required: false,
            field: "Variety",
            disabled: true,
            type: "select"
          },
          {
            columnType: "string",
            dataKey: "city",
            title: "城市",
            required: true,
            field: "City",
            disabled: true,
            type: "select",
            data: []
          },
          {
            columnType: "decimal",
            title: "成交均价",
            required: true,
            field: "AvgPrice",
            disabled: true
          },
          {
            columnType: "datetime",
            title: "开始结束日期",
            range: true, //设置为true可以选择开始与结束日期
            required: false,
            field: "DateRange",
            type: "date",
            disabled: true
          }
        ],
        [
          {
            columnType: "int",
            dataKey: "top",
            title: "是否推荐价格",
            required: true,
            field: "IsTop",
            colSize: 12, //设置12，此列占100%宽度
            type: "select",
            data: []
          }
        ]
      ]
    };
  }
};
</script>