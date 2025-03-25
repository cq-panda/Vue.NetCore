<template>
  <div
    class="container"
    style="padding:10px 20px;" >
    <Divider>多列表单(邮箱、手机号码验证、自定义验证方法)</Divider>
    <VolForm
      ref="myform"
      :loadKey="loadKey"
      :formFields="formFields"
      :formRules="formRules"
    ></VolForm>
    <slot></slot>
    <div style="text-align: center">
      <Button type="info" @click="getForm">获取表单</Button>
      <Button type="error" @click="reset">重置表单</Button>
    </div>
  </div>
</template>
<script>
import VolForm from "@/components/basic/VolForm.vue";
export default {
  props: {
    showBtn: { type: Boolean, default: true },
  },
  components: { VolForm },
  methods: {
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
      formFields: {
        Variety: "",
        AgeRange: "",
        DateRange: [],
        City: "",
        AvgPrice: 8.88, //input标签如果是数字，此处注意区分不要写成字符串了
        Date: "",
        IsTop: 0,
        Address: "",
        Source: [],
        Remark: "",
        phone: "",
        email: "",
        extra2: "",
        userVali: "",
        uploadFile: [
          {
            name: "exceltest.xlsx",
            path:
              "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/github/exceltest.xlsx",
          },
          {
            name: "wordtest.docx",
            path:
              "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/github/wordtest.docx",
          },
        ],
        img: [
          {
            name: "060222.jpg",
            path:
              "http://api.volcore.xyz/Upload/Tables/App_Expert/202103061753415708/060222.jpg",
          },
        ],
      },
      formRules: [
        //两列的表单，formRules数据格式为:[[{},{}]]
        [
          {
            dataKey: "age", //后台下拉框对应的数据字典编号
            data: [], //loadKey设置为true,会根据dataKey从后台的下拉框数据源中自动加载数据
            title: "年龄",
            filter: true,
            required: true, //设置为必选项
            field: "AgeRange",
            type: "select",
          },
          {
            title: "分类",
            dataKey: "pz",
            //如果这里绑定了data数据，后台不会加载此数据源
            data: [
              { key: "1", value: "1" },
              { key: "2", value: "2" },
            ],
            required: false,
            field: "Variety",
            type: "select",
          },
          {
            dataKey: "city",
            title: "城市",
            required: true,
            data: [],
            field: "City",
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
            title: "日期",
            required: true,
            field: "Date",
            placeholder: "你可以设置colSize属性决定标签的长度，可选值12/8/6/4",
            type: "date",
          },
          {
            title: "日期",
            range: true, //设置为true可以选择开始与结束日期
            required: true,
            placeholder: "开始结束日期",
            field: "DateRange",
            type: "date",
          },
          {
            type: "text",
            title: "地址",
            required: false,
            field: "Address",
          },
          {
            dataKey: "top",
            title: "是否",
            required: true,
            field: "IsTop",
            data: [],
            type: "switch",
          },
        ],
        [
          {
            title: "手机",
            required: true,
            field: "phoneNo",
            type: "phone",
          },
          {
            title: "邮箱",
            required: true,
            field: "email",
            type: "mail",
          },
          {
            title: "自定义验证",
            required: true,
            field: "userVali",
            placeholder: "自定义验证方法验证输入值",
            type: "text",
            validator: (rule, val) => {
              if (val != "123") {
                return "自定设置必须输入123";
              }
              return "";
            },
          },
          {
            title: "额外标签",
            field: "extra2",
            type: "text",
            extra: {
              style: "color:red",
              icon: "ios-search", //显示图标
              text: "点击", //显示文本
              //触发事件
              click: (item) => {
                this.$Message.error("点击标签触发的事件");
              },
            },
          },
        ],

        [
          {
            title: "备注",
            required: true,
            field: "Remark",
            placeholder: "你可以设置colSize属性决定标签的长度，可选值12/8/6/4",
            min: 1,
            max: 3,
            type: "textarea",
            colSize: 12, //设置宽度100%
          },
          {
            dataKey: "pz",
            title: "来源",
            required: true,
            data: [],
            min: 2,
            max: 4,
            field: "Source",
            type: "checkbox",
            colSize: 12, //设置宽度100%
          },
        ],
        [
          {
            title: "上传excel",
            required: true,
            field: "uploadFile",
            type: "excel",
            multiple: true,
            maxFile: 5,
            maxSize: 3,
            url: "api/App_Appointment/Upload",
            colSize: 6, //设置宽度50%
          },
          {
            title: "图片",
            required: true,
            field: "img",
            type: "img",
            multiple: true,
            maxFile: 3,
            maxSize: 0.2,
            url: "api/App_Appointment/Upload",
            colSize: 6, //设置宽度50%
          },
        ],
      ],
    };
  },
};
</script>