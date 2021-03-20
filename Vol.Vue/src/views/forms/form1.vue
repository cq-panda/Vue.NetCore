<template>
  <div class="single-form">
    <Divider>单列表单/数据源后台自动加载绑定(下拉框选择时可触发事件)</Divider>
    <VolForm
      ref="myform"
      :loadKey="loadKey"
      :formFields="formFields"
      :formRules="formRules"
    ></VolForm>

    <div style="text-align: center;">
      <Button type="success" @click="getForm">获取表单</Button>
      <Button type="error" @click="reset">重置表单</Button>
    </div>
  </div>
</template>
<script>
import VolForm from "@/components/basic/VolForm.vue";
let $vue;
export default {
  components: { VolForm },
  created() {
    $vue = this;
  },
  methods: {
    add() {
      //动态添加列
      this.formFields = {};
      this.index += 1;
      this.formFields["test" + this.index] = "";
      this.required = !this.required;
      this.formRules.splice(0);
      //如果有对列删除，必须重置表单，否则验证提示的标签显示位置会错措
      this.reset();
      this.formRules.push(
        ...[
          [
            {
              dataKey: "pz", //已经设置loadKey自动绑定数据源
              data: [],
              type: "datetime",
              title: "test" + this.index,
              required: this.required,
              field: "test" + this.index,
              colSize: 12,
            },
          ],
        ]
      );
    },
    getForm() {
      if (!this.$refs.myform.validate()) {
        return;
      }
      this.$message.error(JSON.stringify(this.formFields));
    },
    reset() {
      //重置表单，重置时可指定重置的值，如果没有指定重置的值，默认全部清空
      let data = { Variety: "1", AvgPrice: 888 };
      this.$refs.myform.reset(data);
      this.$message.error("表单已重置");
    },
  },
  data() {
    return {
      loadKey: true,
      index: 1,
      required: false,
      formFields: {
        Variety: "",
        AgeRange: "",
        DateRange: [],
        City: [],
        AvgPrice: null,
        Date: "",
      },
      formRules: [
        [
          {
            type: "decimal",
            title: "价格",
            required: true,
            placeholder: "你可以自己定义placeholder显示的文字", //显示自定义的信息
            field: "AvgPrice",
            colSize: 12,
          },
        ],
        [
          {
            dataKey: "age", //后台下拉框对应的数据字典编号
            data: [], //loadKey设置为true,会根据dataKey从后台的下拉框数据源中自动加载数据
            //data是须的参数，可以默认一个[]
            title: "年龄",
            required: false, //设置为必选项
            field: "AgeRange",
            colSize: 12,
            placeholder: "可触发事件的下拉框",
            type: "select",
            onChange(value, param) {
              //设置选择数据时触发的事件
              $vue.formFields.AvgPrice =
                (Math.random(1, 1000) * 100).toFixed(2) * 1;
              $vue.$message(
                "当前选中的值为[" +
                  value +
                  "],选中后给成交均价赋一个随机值[" +
                  $vue.formFields.AvgPrice +
                  "]"
              );
            },
          },
        ],
        [
          {
            title: "分类",
            //如果这里绑定了data数据，后台不会加载此数据源
            data: [
              { key: "1", value: "1" },
              { key: "2", value: "2" },
            ],
            required: true,
            field: "Variety",
            colSize: 12,
            dataKey: "pz",
            data: [],
            type: "select",
          },
        ],
        [
          {
            dataKey: "city",
            title: "级联",
            required: true,
            field: "City",
            colSize: 12,
            data: [
              {
                value: "北京",
                label: "北京",
                children: [
                  { value: "天坛", label: "天坛" },
                  { value: "王府井", label: "王府井" },
                ],
              },
            ],
            type: "cascader",
          },
        ],
        [
          {
            title: "日期",
            required: true,
            field: "Date",
            colSize: 12,
            type: "datetime",
          },
        ],
        [
          {
            title: "日期2",
            range: true, //设置为true可以选择开始与结束日期
            required: true,
            field: "DateRange",
            colSize: 12,
            type: "date",
          },
        ],
      ],
    };
  },
};
</script>
<style scoped>
.single-form {
  position: relative;
  max-width: 600px;
  padding: 30px 45px;
  left: 0;

  margin: auto;
}
</style>