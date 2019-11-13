<template>
  <div>
    <VolForm :label-width="150" :loadKey="true" :formFileds="formFileds1" :formRules="formRules1"></VolForm>
  </div>
</template>
<script>
import VolForm from "@/components/basic/VolForm.vue";
export default {
  components: { VolForm },
  methods: {},
  data() {
    return {
      formFileds1: {
        Variety: 1,
        AgeRange: "",
        DateRange: [],
        City: "北京市",
        AvgPrice: 8.88,
        number1: 20,
        mail: "",
        Date: "",
        IsTop: "还没想好...",
        Fruits: [],
        Other: "",
        Switch: 1,
        ProImg:
          "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x3.jpg"
      },
      formRules1: [
        //两列的表单，formRules数据格式为:[[{},{}]]
        [
          {
            dataKey: "city",
            title: "自动绑定数据源",
            required: true,
            field: "City",
            data: [],
            type: "select"
          },
          {
            title: "手动绑定数据源",
            dataKey: "age",
            placeholder: "在这里可设置提示描述",
            //如果这里绑定了data数据，后台不会加载此数据源
            data: [{ key: 1, value: "是" }, { key: 0, value: "否" }],
            required: false,
            field: "Variety",
            type: "select"
          }
        ],
        [
          {
            title: "手机号",
            required: true, //设置为必选项
            field: "AgeRange",
            type: "phone"
          },
          {
            title: "date日期",
            field: "Date",
            type: "datetime"
          }
        ],
        [
          {
            title: "多选日期",
            range: true, //设置为true可以选择开始与结束日期
            required: false,
            field: "DateRange",
            type: "date"
          },
          {
            type: "number",
            title: "数字",
            required: true,
            placeholder: "你可以自己定义placeholder显示的文字",
            field: "number1"
          }
        ],
        [
          {
            type: "decimal",
            title: "最大最小decimal值",
            max: 10,
            min: 2,
            required: true,
            field: "AvgPrice"
          },
          {
            title: "邮箱",
            field: "mail",
            range: true, //设置为true可以选择开始与结束日期
            required: false,
            type: "mail"
          }
        ],
        [
          {
            title: "自定义验证",
            required: true,
            field: "Other",
            validator: (rule, val, callback) => {
              if (val != "234") {
                return callback(new Error("必须输入【234】"));
              }
              return callback();
            }
          },
          {
            title: "Switch",
            field: "Switch",
            dataKey: "enable", //这里会从后台自动绑定数据源
            data: [],
            required: false,
            type: "switch"
          }
        ],
        [
          {
            title: "备注",
            required: true,
            field: "IsTop",
            colSize: 12, //设置12，此列占100%宽度
            type: "textarea"
          }
        ],
        [
          {
            title: "图片",
            disabled: true, //必须设置此属性
            field: "ProImg",
            type: "img"
          },
          {
            title: "checkbox",
            //如果这里绑定了data数据，后台不会加载此数据源
            data: [
              { key: 0, value: "冬瓜" },
              { key: 1, value: "西瓜" },
              { key: 2, value: "南瓜" },
              { key: 3, value: "哈密瓜" }
            ],
            field: "Fruits",
            type: "checkbox"
          }
        ]
      ]
    };
  }
};
</script>