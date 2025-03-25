<template>
  <Form ref="formValidate" :model="formValidate" :rules="ruleValidate" :label-width="80">
    <FormItem v-for="(item,index) in formRules" :key="index" :label="item.title" :prop="item.filed">
      <Row v-if="item.type=='date'">
        <Col span="24">
          <FormItem :prop="item.filed">
            <DatePicker type="date" placeholder="日期" v-model="formValidate[formRules[1].filed]"></DatePicker>
          </FormItem>
        </Col>
      </Row>
      <CheckboxGroup v-if="item.type=='checkbox'" v-model="formValidate[formRules[0].filed]">
        <Checkbox label="Eat"></Checkbox>
        <Checkbox label="Sleep"></Checkbox>
        <Checkbox label="Run"></Checkbox>
        <Checkbox label="Movie"></Checkbox>
      </CheckboxGroup>
    </FormItem>
    <FormItem>
      <Button type="primary" @click="handleSubmit('formValidate')">Submit</Button>
      <Button @click="handleReset('formValidate')" style="margin-left: 8px">Reset</Button>
    </FormItem>
  </Form>
</template>
<script>
export default {
  props: {
    formRules: { type: Array, default: [] },
    formFileds: {
      type: Object,
      default: {}
    }
  },
  created() {
    // this.formValidate.interest = [];
    // this.formValidate.date = "";

    // this.ruleValidate.interest = [
    //   //   {
    //   //     required: true,
    //   //     type: "array",
    //   //     min: 1,
    //   //     message: "Choose at least one hobby",
    //   //     trigger: "change"
    //   //   },
    //   //   {
    //   //     type: "array",
    //   //     max: 2,
    //   //     message: "Choose two hobbies at best",
    //   //     trigger: "change"
    //   //   }
    // ];
    // this.ruleValidate.date = [
    //   //   {
    //   //     required: true,
    //   //     type: "date",
    //   //     message: "Please select the date",
    //   //     trigger: "change"
    //   //   }
    // ];
    // this.ruleValidate.date.push({
    //   required: true,
    //   type: "date",
    //   message: "Please select the date",
    //   trigger: "change"
    // });
    this.formRules.forEach(x => {
      if (1 == 1 || x.required) {
        switch (x.type) {
          case "date":
            this.ruleValidate[x.filed] = [
              {
                required: true,
                type: "date",
                message: "Please select the date",
                trigger: "change"
              }
            ];
            break;
          case "checkbox":
            this.ruleValidate[x.filed] = [
              {
                required: true,
                message: "请选择" + x.title,
                min: x.min || 1,
                type: "array",
                trigger: "change"
              }
            ];
            x.max &&
              (this.ruleValidate[x.filed].push(
                {
                  message: "最多只能选择" + x.max + "项" + x.title,
                  max: x.max,
                  type: "array",
                  trigger: "change"
                }
              ));
            break;
        }
      }
    });
  },
  data() {
    return {
      formValidate: this.$props.formFileds,
      ruleValidate: {}
    };
  },
  methods: {
    handleSubmit(name) {
      this.$refs[name].validate(valid => {
        if (valid) {
          this.$Message.success("Success!");
        } else {
          this.$Message.error("Fail!");
        }
      });
    },
    handleReset(name) {
      this.$refs[name].resetFields();
    },
    getReuired(item) {
      var arr = [];
      switch (item.type) {
        case "text":
        case "email":
        case "textarea":
          arr.push({
            required: true,
            message: item.title + "不能为空",
            trigger: "blur"
          });
          if (item.min) {
            arr[0].min = item.min;
            arr[0].message = item.title + "至少" + item.min + "个字符!";
          }
          if (item.max) {
            arr.push({
              max: item.max,
              required: true,
              message: item.title + "最多" + item.max + "个字符!",
              trigger: "blur"
            });
          }
          break;
        case "drop":
        case "radio":
          arr.push({
            required: true,
            message: "请选择" + item.title,
            trigger: "change"
          });
          break;
        case "date":
        case "datetime":
          arr.push({
            required: true,
            type: "date",
            message: "请选择" + item.title,
            trigger: "change"
          });
          break;
        case "checkbox":
          arr.push({
            required: true,
            message: "请选择" + item.title,
            min: item.min || 1,
            type: "array",
            trigger: "change"
          });
          item.max &&
            arr.push({
              message: "最多只能选择" + item.max + "项" + item.title,
              max: item.max,
              type: "array",
              trigger: "change"
            });
          break;
        default:
          arr.push({
            required: true,
            message: item.title + "不能为空",
            trigger: "blur"
          });
          break;
      }
      return arr;
    }
  }
};
</script>
