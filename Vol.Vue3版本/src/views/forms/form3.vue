<template>
  <div class="container" style="padding: 15px 30px 20px 0px">
    <VolHeader
      icon="el-icon-warning-outline"
      text="表单配置"
      style="margin: 0 0 20px 50px"
    >
      <template #content>
        <div style="color: #909090; font-size: 13px">
          表单集成了element多种组件,只需要简单配置,功能包括：表单只读、自定义验证、非空验证、下拉框自动绑定、render动态渲染等.<a
            href="http://www.volcore.xyz/document/api"
            target="_blank"
            >查看文档
          </a>
        </div>
      </template>
    </VolHeader>
    <VolForm
      ref="myform"
      :loadKey="loadKey"
      :formFields="formFields"
      :formRules="formRules"
    >
      <div style="text-align: center; margin-top: -30px">
        <el-button type="primary" size="small" @click="getForm"
          >获取表单</el-button
        >
        <el-button type="success" size="small" @click="reset"
          >重置表单</el-button
        >
        <el-button type="info" size="small" @click="setReadonlyStaus(true)"
          >全部只读</el-button
        >
        <el-button type="waring" size="small" @click="setReadonlyStaus(false)"
          >取消只读</el-button
        >
      </div>
    </VolForm>
  </div>
</template>
<script>
import VolForm from "@/components/basic/VolForm.vue";
import VolHeader from "@/components/basic/VolHeader.vue";
export default {
  props: {
    showBtn: { type: Boolean, default: true },
  },
  components: {
    VolForm,
    VolHeader,
  },
  methods: {
    setReadonlyStaus(status) {
      this.formRules.forEach((rules) => {
        rules.forEach((option) => {
          option.readonly = status;
        });
      });
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
      model: false,
      loadKey: true,
      formFields: {
        Variety: "",
        AgeRange: "",
        DateRange: ["", ""],
        City: [],
        AvgPrice: 8.88, //input标签如果是数字，此处注意区分不要写成字符串了
        Date: "",
        IsTop: 0,
        Address: "北京市海淀区",
        Source: [],
        Source1: "5",
        Remark: "",
        phone: "",
        email: "",
        extra2: "",
        userVali: "",
        uploadFile: [
          {
            name: "exceltest.xlsx",
            path: "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/github/exceltest.xlsx",
          },
          // {
          //   name: "wordtest.docx",
          //   path: "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/github/wordtest.docx",
          // },
        ],
        img: [
          {
            name: "060222.jpg",
            path: "http://api.volcore.xyz/Upload/Tables/App_Expert/202103061753415708/060222.jpg",
          },
        ],
      },
      formRules: [
        //两列的表单，formRules数据格式为:[[{},{}]]
        [
          {
            dataKey: "age", //后台下拉框对应的数据字典编号
            data: [], //loadKey设置为true,会根据dataKey从后台的下拉框数据源中自动加载数据
            title: "下拉框",
            filter: true,
            required: true, //设置为必选项
            field: "AgeRange",
            type: "select",
          },
          {
            title: "自动完成",
            autocomplete:true, //设置为自动完成
            dataKey: "pz",
            placeholder: "不存的数据自动填充",
            //如果这里绑定了data数据，后台不会加载此数据源
            data: [
              { key: "北京市", value: "北京市" },
              { key: "上海市", value: "上海市" },
            ],
            required: false,
            field: "Variety",
            type: "select",
          },
          {
            dataKey: "city",
            title: "多选",
            required: true,
            data: [],
            field: "City",
            type: "selectList",//selectList属性为多选 
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
            placeholder: "限制时间范围",
            field: "Date",
            type: "datetime", //设置日期选择范围
            min: "2021-07-01",
            max: Date.now(),
            onChange: (val) => {
              console.log("选择日期:" + val);
            },
          },
          {
            title: "日期2",
            range: true, //设置为true可以选择开始与结束日期
            placeholder: "日期",
            field: "DateRange",
            type: "date",
            //  colSize:6,//如果宽度不够，可以指定colSize,可选值,4,6,8,12
            onChange: (val) => {
              console.log("日期:" + val);
            },
          },
          {
            type: "text",
            title: "地址",
            required: false,
            field: "Address",
          },
          {
            title: "额外标签",
            field: "extra2",
            type: "text",
            extra: {
              style: "color:red;cursor: pointer;",
              icon: "el-icon-edit", //显示图标
              text: "点击", //显示文本
              //触发事件
              click: (item) => {
                this.$message.error("点击标签触发的事件");
              },
            },
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
            placeholder: "只能输入值：123",
            type: "text",
            validator: (rule, val) => {
              if (val != "123") {
                return "自定设置必须输入123";
              }
              return "";
            },
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
            title: "备注",
            required: true,
            field: "Remark",
            placeholder: "你可以设置colSize属性决定标签的长度，可选值12/8/6/4",
            min: 1,
            max: 3,
            type: "textarea",
            colSize: 12, //设置宽度100%
          },
        ],
        [
          {
            dataKey: "pz",
            title: "多选",
            required: true,
            data: [],
            min: 1,
            max: 4,
            field: "Source",
            type: "checkbox",
            colSize: 12, //设置宽度100%
          },
        ],
        [
          {
            dataKey: "pz",
            title: "Radio",
            required: true,
            data: [],
            min: 2,
            max: 4,
            field: "Source1",
            type: "radio",
            colSize: 12, //设置宽度100%
          },
        ],
        [
          {
            title: "只读",
            field: "Address",
            readonly: true,
          },
          {
            title: "只读文本",
            field: "Address",
            type: "label",
          },
          {
            title: "图片",
            required: true,
            field: "img",
            type: "img",
            multiple: true,
            maxFile: 2,
            maxSize: 5,
            url: "api/App_Appointment/Upload",
            //  colSize: 6, //设置宽度50%
          },
          {
            title: "上传",
            required: true,
            field: "uploadFile",
            type: "excel", //指定上传类型excel/img/file
            multiple: true,
            maxFile: 5,
            maxSize: 3,
            url: "api/App_Appointment/Upload",
            // colSize: 6, //设置宽度50%
          },
        ],
      ],
    };
  },
};
</script>