<template>
  <div>
    <VolForm
      ref="myform"
      :label-width="150"
      :loadKey="true"
      :formFileds="formFileds1"
      :formRules="formRules1"
    ></VolForm>
    <div>
      <Button type="info" long @click="reset">重置表单</Button>
    </div>
  </div>
</template>
<script>
import VolForm from "@/components/basic/VolForm.vue";
export default {
  components: { VolForm },
  methods: {
    reset() {
      this.$refs.myform.reset();
      this.$Message.error("表单已重置");
    }
  },
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
        IsTop: "",
        Fruits: [],
        Other: "",
        Switch: 1,
        readonlyText: "还没想好....",
        readonlyImg:
          "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x2.jpg",
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
            type: "phone",
            onKeyPress: $event => {
              if ($event.keyCode == 13) {
                this.$Message.error(this.formFileds1.AgeRange + "");
              }
            }
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
            validator: (rule, val) => {
              if (val != "234") {
                return "必须输入【234】";
              }
              return "";
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
          //readonlyImg
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
          },
          {
            title: "字段只读",
            readonly: true, //设置readonly或disabled都行
            field: "readonlyText",
            type: "text"
          }
        ],
        [
          {
            title: "备注",
            required: true,
            field: "IsTop",
            min: 3,
            max: 5,
            placeholder: "至少输入3个字符,最多只能输入5个字符",
            colSize: 12, //设置12，此列占100%宽度
            type: "textarea"
          }
        ],
        [
          {
            title: "图片只读",
            readonly: true, //设置readonly或disabled都行
            field: "readonlyImg",
            type: "img"
          },
          {
            title: "可修改图片",
            field: "ProImg",
            type: "img"
          }
        ]
      ]
    };
  }
};
</script>