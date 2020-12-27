<template>
  <div style="padding: 30px 100px;">
    <Divider>两列表单(数据源可后台自动绑定/也可手动绑定)</Divider>
    <VolForm ref="myform"
             :loadKey="loadKey"
             :formFileds="formFileds"
             :formRules="formRules"></VolForm>
    <Button type="success"
            style="margin-bottom:20px;"
            long
            @click="getForm">获取表单</Button>
    <Button type="error"
            long
            @click="reset">重置</Button>
  </div>
</template>
<script>
import VolForm from "@/components/basic/VolForm.vue";
export default {
  components: { VolForm },
  methods: {
    getForm () {
      if (!this.$refs.myform.validate()) {
        return;
      }
      this.$message.error(JSON.stringify(this.formFileds));
    },
    reset () {
      //重置表单，重置时可指定重置的值，如果没有指定重置的值，默认全部清空
      let data = { Variety: "1", AvgPrice: 888 };
      this.$refs.myform.reset(data);
      this.$message.error("表单已重置");
    }
  },
  data () {
    return {
      loadKey: true,
      formFileds: {
        Variety: "",
        AgeRange: "",
        DateRange: [],
        City: "",
        AvgPrice: 8.88,
        Date: "",
        IsTop: "1"
      },
      formRules: [
        //两列的表单，formRules数据格式为:[[{},{}]]
        [
          {
            dataKey: "age", //后台下拉框对应的数据字典编号
            data: [], //loadKey设置为true,会根据dataKey从后台的下拉框数据源中自动加载数据
            title: "月龄",
            required: true, //设置为必选项
            field: "AgeRange",
            type: "select",
            extra: {
              render: h => {
                return h(
                  "div",
                  {
                    props: {}, style: { color: "#03A9F4", cursor: "pointer" },
                    on: { click: () => { this.$Message.info("点击事件") } }
                  },
                  [
                    h(
                      "Tooltip",
                      {
                        props: { content: "这里是提示的内容", placement: "right-start" },
                        class: "ivu-icon ivu-icon-ios-alert-outline",
                        style: {}
                      }, [
                      h("span", {}, ["提示"])
                    ]
                    )
                  ]
                );
              }
            }
          },
          {

            title: "品种",
            dataKey: "age",
            placeholder: "此处数据源为手动绑定",
            //如果这里绑定了data数据，后台不会加载此数据源
            data: [{ key: "1", value: "1" }, { key: "2", value: "2" }],
            required: false,
            field: "Variety",
            type: "select"
          }
        ],
        [
          {
            dataKey: "city",
            title: "城市",
            required: true,
            field: "City",
            data: [],
            type: "select"
          },
          {
            type: "decimal",
            title: "成交均价",
            required: true,
            placeholder: "你可以自己定义placeholder显示的文字",
            field: "AvgPrice"
          }
        ],
        [
          {
            title: "日期",
            required: true,
            field: "Date",
            placeholder: "你可以设置colSize属性决定标签的长度，可选值12/8/6/4",
            colSize: 8,//设置宽度为2/3
            type: "datetime"
          },
          {
            title: "开始结束日期",
            range: true, //设置为true可以选择开始与结束日期
            required: false,
            field: "DateRange",
            colSize: 4,//设置宽度为1/3
            type: "date"
          }
        ],
        [
          {
            dataKey: "top",
            title: "是否推荐价格",
            data: [],
            required: true,
            field: "IsTop",
            colSize: 12, //设置12，此列占100%宽度
            type: "select"
          }
        ]
      ]
    };
  }
};
</script>