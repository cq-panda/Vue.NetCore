<template>
  <div class="t-dis">
    <VolHeader icon="md-apps" text="表单属性字段只读" style="margin-bottom: 20px;">
      <div style="text-align: right;padding-top: 4px;">
        <Button type="text" icon="ios-search" size="small" @click="getForm">获取表单</Button>
        <Button type="text" icon="ios-search" size="small" @click="getForm">获取表单</Button>
      </div>
    </VolHeader>
    <VolForm ref="myform" :loadKey="loadKey" :formFileds="formFileds" :formRules="formRules"></VolForm>
  </div>
</template>
<script>
import VolForm from "@/components/basic/VolForm.vue";
import VolHeader from "@/components/basic/VolHeader.vue";
export default {
  components: { VolForm, VolHeader },
  methods: {
    getForm() {
      this.$message.error(JSON.stringify(this.formFileds));
    },
    reset() {}
  },
  mounted() {},
  data() {
    return {
      loadKey: true,
      formFileds: {
        Variety: "日用品",
        DateRange: "2019-09-01",
        City: "北京市",
        AvgPrice: 8.88,
        Variety1: "",
        DateRange1: "2019-09-02",
        City1: "上海市",
        AvgPrice1: 7.72,
        DateRange2: "2019-09-03",
        City2: "广州市",
        AvgPrice2: 6.66,
        IsTop: "1"
      },
      formRules: [
        //两列的表单，formRules数据格式为:[[{},{}]]
        [
          {
            title: "商品类型",
            dataKey: "age",
            //如果这里绑定了data数据，后台不会加载此数据源
            data: [{ key: "1", value: "1" }, { key: "2", value: "2" }],
            required: false,
            field: "Variety",
            disabled: true,
            type: "select"
          },
          {
            dataKey: "city",
            title: "所在城市",
            field: "City",
            disabled: true,
            type: "select",
            data: []
          },
          {
            title: "成交均价",
            type: "number",
            field: "AvgPrice",
            disabled: true
          }
        ],
        [
          {
            dataKey: "city",
            title: "所在地区",
            field: "City1",
            disabled: true,
            type: "select",
            data: []
          },
          {
            title: "销售价格",
            field: "AvgPrice1",
            type: "number",
            disabled: true
          },
          {
            title: "审核日期",
            range: true, //设置为true可以选择开始与结束日期
            required: false,
            field: "DateRange",
            type: "date",
            disabled: true
          }
        ],
        [
          {
            dataKey: "city",
            title: "详细地址",
            field: "City2",
            disabled: true,
            type: "select",
            data: []
          },
          {
            title: "平均重量",
            field: "AvgPrice2",
            type: "number",
            disabled: true
          },
          {
            type: "date",
            title: "生产日期",
            field: "DateRange2",
            disabled: true
          }
        ]
      ]
    };
  }
};
</script>
<style scoped>
.t-dis {
  box-shadow: #d6d6d6 0px 4px 21px;
  /* margin: 20px; */
  margin-bottom: 15px;
  background: white;
  /* padding: 10px 30px; */
  border: 1px solid #eaeaea;
  padding: 5px;
  border-radius: 5px;
}
</style>