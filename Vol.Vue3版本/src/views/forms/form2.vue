<template>
  <div
    style="
      width: 800px;
      position: absolute;
      left: 0;
      right: 0;
      margin: auto;
      top: 100px;
    "
  >
    <h4 style="padding-left: 63px; padding-bottom: 30px; font-weight: 500">
      两列表单(数据源可后台自动绑定/也可手动绑定)
    </h4>
    <VolForm
      ref="myform"
      :loadKey="loadKey"
      :formFields="formFields"
      :formRules="formRules"
    >
      <div style="text-align: center">
        <el-button type="info" @click="getForm">获取表单</el-button>
        <el-button type="error" @click="reset">重置表单</el-button>
      </div></VolForm
    >
  </div>
</template>
<script>
import VolForm from "@/components/basic/VolForm.vue";
export default {
  components: { VolForm },
  methods: {
    getForm() {
      this.$refs.myform.validate(() => {
        this.$message.error(JSON.stringify(this.formFields));
      });
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
      formFields: {
        Variety: "",
        AgeRange: "",
        DateRange: [],
        City: "",
        AvgPrice: 8.88,
        Date: "",
        IsTop: "1",
      },
      formRules: [
        //两列的表单，formRules数据格式为:[[{},{}]]
        [
          {
            dataKey: "age", //后台下拉框对应的数据字典编号
            data: [], //loadKey设置为true,会根据dataKey从后台的下拉框数据源中自动加载数据
            title: "年龄",
            required: true, //设置为必选项
            field: "AgeRange",
            type: "select",
          },
          {
            title: "分类",
            dataKey: "age",
            placeholder: "此处数据源为手动绑定",
            //如果这里绑定了data数据，后台不会加载此数据源
            data: [
              { key: "1", value: "1x" },
              { key: "2", value: "2x" },
            ],
            required: false,
            field: "Variety",
            type: "select",
          },
        ],
        [
          {
            dataKey: "city",
            title: "城市",
            required: true,
            field: "City",
            data: [],
            type: "select",
          },
          {
            type: "decimal",
            title: "价格",
            required: true,
            placeholder: "你可以自己定义placeholder显示的文字",
            field: "AvgPrice",
          },
        ],
        [
          {
            title: "宽度",
            required: true,
            field: "Date",
            placeholder: "你可以设置colSize属性决定标签的长度，可选值12/8/6/4",
            type: "datetime",
          },
          {
            title: "日期",
            range: true, //设置为true可以选择开始与结束日期
            required: false,
            field: "DateRange",
            type: "date",
          },
        ],
        [
          {
            dataKey: "top",
            title: "textarea",
            required: true,
            field: "IsTop",
            colSize: 12, //设置12，此列占100%宽度
            type: "textarea",
          },
        ],
      ],
    };
  },
};
</script>