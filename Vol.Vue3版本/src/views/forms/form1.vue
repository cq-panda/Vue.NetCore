<template>
  <div class="single-form">
    <VolForm ref="myform" :formFields="formFields" :formRules="formRules">
      <div style="text-align: center; margin-top: 10px">
        <el-button type="primary" size="small" @click="getForm"
          >获取表单</el-button
        >
        <el-button type="success" size="small" @click="reset"
          >重置表单</el-button
        >
      </div>
    </VolForm>
    <el-alert title="关于VolForm表单" type="success" style="margin-left: 30px;align-items: flex-start;
    padding-top: 25px;" show-icon :closable="false">
      <p>1、VolForm基于Element Plus常用组件封装的表单。</p>
      <p>
        2、组件包括：select、select联动、switch、radio、checkbox、多选、日期、图片显示与预览、文件上传下载、input、render动态渲染等组件。
      </p>
      <p>
        3、封装后的组件功能包括：自动绑定下拉框数据源、及表单验证等常用功能。
      </p>
          <p>
        4、 只需要照着文档配置json即可完成各种表单。
      </p>
     
      <p>
        5、具体使用见：框架文档->组件api->VolForm。<a
          href="http://v2.volcore.xyz/document/api"
          target="_blank"
          >点击查看文档
        </a>
      </p>
    </el-alert>
  </div>
</template>
<script>
let $vue;
import VolForm from "@/components/basic/VolForm.vue";
import { readonly } from "@vue/reactivity";
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
        AgeRange: "", // [50, 100],
        DateRange: [],
        City: [],
        AvgPrice: null,
        Date: "",
        date3: "",
        InpuText: "",
        InpuText1: "",
      },
      formRules: [
        [
          {
            type: "range",
            title: "区间输入",
            required: true,
            placeholder: "你可以自己定义placeholder显示的文字", //显示自定义的信息
            field: "AvgPrice",
          },
        ],
        [
          {
            dataKey: "age", //后台下拉框对应的数据字典编号
            data: [], //loadKey设置为true,会根据dataKey从后台的下拉框数据源中自动加载数据
            //data是须的参数，可以默认一个[]
            title: "选择事件",
            required: false, //设置为必选项
            field: "AgeRange",
            placeholder: "可触发事件的下拉框",
            type: "select",
            onChange(value, param) {
              //设置选择数据时触发的事件
              $vue.formFields.AvgPrice =
                (Math.random(1, 1000) * 100).toFixed(2) * 1;
              $vue.$message.info(
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
            title: "自动绑定",

            //如果这里绑定了data数据，后台不会加载此数据源
            data: [
              { key: "1", value: "1x" },
              { key: "2", value: "2x" },
            ],
            required: true,
            field: "Variety",
            dataKey: "pz",
            data: [],
            type: "select",
          },
        ],
        [
          {
            title: "输入事件",
            required: true,
            field: "InpuText",
            type: "text",
            onKeyPress: ($event) => {
              this.formFields.InpuText1 = $event.key;
            },
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
            title: "输入事件",
            required: true,
            readonly: true,
            field: "InpuText1",
            placeholder: "上面添加onKeyPress事件",
            type: "text",
            readonly: true,
          },
        ],
        [
          {
            dataKey: "city",
            title: "级联选择",
            required: true,
            field: "City",
            checkStrictly: true, //设置可以选择任意一级
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
        // [
        //   {
        //     title: "日期单选",
        //     required: true,
        //     field: "Date",
        //     type: "datetime",
        //   },
        // ],
        [
          {
            title: "多选日期",

            range: true, //设置为true可以选择开始与结束日期
            required: true,
            field: "DateRange",
            type: "date",
          },
        ],
        [
          {
            title: "可选日期",
            min: "2021-07-01 00:00:000", //设置只能选2021-07-01到今天的数据(注意后面的小时00:00:000)
            max: Date.now(), // "2021-07-10",
            required: true,
            field: "date3",
            placeholder: "设置日期选择范围(可选与不可选)",
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
  max-width: 1200px;
  padding: 30px 45px;
  left: 0;
   display: flex;
  margin: auto;
}
</style>