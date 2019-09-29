<template>
  <div class="container" style="padding: 30px 100px;">
    <Divider>多列表单</Divider>
    <VolForm ref="myform" :loadKey="loadKey" :formFileds="formFileds" :formRules="formRules"></VolForm>
    <slot></slot>
    <div v-if="showBtn">
      <Button type="success" style="margin-bottom:20px;" long @click="getForm">获取表单</Button>
      <Button type="error" long @click="reset">重置</Button>
    </div>
  </div>
</template>
<script>
import VolForm from "@/components/basic/VolForm.vue";
export default {
  props: {
    showBtn: { type: Boolean, default: true }
  },
  components: { VolForm },
  methods: {
    getForm() {
      if (!this.$refs.myform.validate()) {
        return;
      }
      this.$message.error(JSON.stringify(this.formFileds));
    },
    reset() {
      //重置表单，重置时可指定重置的值，如果没有指定重置的值，默认全部清空
      let data = { Variety: "1", AvgPrice: 888 };
      this.$refs.myform.reset(data);
      this.$message.error("表单已重置"); 
    }
  },
  data() {
    return {
      loadKey: true,
      formFileds: {
        Variety: "",
        AgeRange: "",
        DateRange: [],
        City: "",
        AvgPrice: 8.88, //input标签如果是数字，此处注意区分不要写成字符串了
        Date: "",
        IsTop: "1",
        Address: "",
        Source: [],
        Remark: "",
        img: ""
      },
      formRules: [
        //两列的表单，formRules数据格式为:[[{},{}]]
        [
          {
            columnType: "string",
            dataKey: "age", //后台下拉框对应的数据字典编号
            data: [], //loadKey设置为true,会根据dataKey从后台的下拉框数据源中自动加载数据
            title: "月龄",
            required: true, //设置为必选项
            field: "AgeRange",
            type: "select"
          },
          {
            columnType: "string",
            title: "品种",
            dataKey: "pz",
            //如果这里绑定了data数据，后台不会加载此数据源
            data: [{ key: "1", value: "1" }, { key: "2", value: "2" }],
            required: false,
            field: "Variety",
            type: "select"
          },
          {
            columnType: "string",
            dataKey: "city",
            title: "城市",
            required: true,
            data: [],
            field: "City",
            type: "select"
          }
        ],
        [
          {
            columnType: "decimal",
            title: "成交均价",
            required: true,
            placeholder:"你可以自己定义placeholder显示的文字",
            field: "AvgPrice"
          },
          {
            columnType: "datetime",
            title: "日期",
            required: true,
            field: "Date",
            placeholder:"你可以设置colSize属性决定标签的长度，可选值12/8/6/4",
            colSize: 8, //设置宽度为2/3
            type: "datetime"
          }
        ],
        [
          {
            columnType: "datetime",
            title: "开始结束日期",
            range: true, //设置为true可以选择开始与结束日期
            required: false,
            field: "DateRange",
            type: "date"
          },
          {
            columnType: "string",
            title: "地址",
            required: true,
            field: "Address"
          },
          {
            columnType: "int",
            dataKey: "top",
            title: "是否",
            required: true,
            field: "IsTop",
            data: [],
            type: "switch"
          }
        ],
        [
          {
            columnType: "string",
            title: "备注",
            required: true,
            field: "Remark",
             placeholder:"你可以设置colSize属性决定标签的长度，可选值12/8/6/4",
            min: 1,
            max: 3,
            type: "textarea",
            colSize: 12 //设置宽度100%
          },
          {
            columnType: "string",
            dataKey: "pz",
            title: "来源",
            // required: true,
            data: [],
            min: 2,
            max: 4,
            field: "Source",
            type: "checkbox",
            colSize: 12 //设置宽度100%
          }
        ],
        [
          {
            columnType: "img",
            title: "图片",
            required: true,
            field: "img",
            type: "img",
            colSize: 12 //设置宽度100%
          }
        ]
      ]
    };
  }
};
</script>