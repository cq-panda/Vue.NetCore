<template>
  <Form ref="formValidate" :model="formValidate" :rules="ruleValidate" :label-width="100">
    <Row class="line-row">
      <Col span="8">
        <FormItem prop="name" label="姓名">
          <Col span="21">
            <Input v-model="formValidate.name" placeholder="Enter your name"></Input>
          </Col>
        </FormItem>
      </Col>
      <Col span="8">
        <FormItem prop="name" label="电话">
          <Col span="21">
            <Input v-model="formValidate.name" placeholder="Enter your name"></Input>
          </Col>
        </FormItem>
      </Col>
      <Col span="8">
        <FormItem prop="name" label="日期">
          <Col>
            <DatePicker type="date" placeholder="Select date" v-model="formValidate.date"></DatePicker>
          </Col>
        </FormItem>
      </Col>
    </Row>
    <Row class="line-row">
      <Col span="8">
        <FormItem label="省" prop="city">
          <Col span="21">
            <Select v-model="formValidate.city" placeholder="Select your city">
              <Option value="beijing">New York</Option>
              <Option value="shanghai">London</Option>
              <Option value="shenzhen">Sydney</Option>
            </Select>
          </Col>
        </FormItem>
      </Col>
      <Col span="8">
        <FormItem label="姓别" prop="gender">
          <Col span="21">
            <RadioGroup v-model="formValidate.gender">
              <Radio label="male">男</Radio>
              <Radio label="female">女</Radio>
            </RadioGroup>
          </Col>
        </FormItem>
      </Col>
      <Col span="8">
        <FormItem label="兴趣" prop="interest">
          <Col span="21">
            <CheckboxGroup v-model="formValidate.interest">
              <Checkbox label="Eat">电子竞技</Checkbox>
              <Checkbox label="Sleep">旅游</Checkbox>
              <Checkbox label="Run">写作</Checkbox>
              <Checkbox label="Movie">看电影</Checkbox>
            </CheckboxGroup>
          </Col>
        </FormItem>
      </Col>
    </Row>
  </Form>
</template>
<script>
export default {
  data() {
    return {
      formValidate: {
        name: "",
        mail: "",
        city: "",
        gender: "",
        interest: [],
        date: "",
        time: "",
        desc: ""
      },
      ruleValidate: {
        name: [
          {
            required: true,
            message: "The name cannot be empty",
            trigger: "blur"
          }
        ],
        mail: [
          {
            required: true,
            message: "Mailbox cannot be empty",
            trigger: "blur"
          },
          { type: "email", message: "Incorrect email format", trigger: "blur" }
        ],
        city: [
          {
            required: true,
            message: "Please select the city",
            trigger: "change"
          }
        ],
        gender: [
          { required: true, message: "Please select gender", trigger: "change" }
        ],
        interest: [
          {
            required: true,
            type: "array",
            min: 1,
            message: "Choose at least one hobby",
            trigger: "change"
          },
          {
            type: "array",
            max: 2,
            message: "Choose two hobbies at best",
            trigger: "change"
          }
        ],
        date: [
          {
            required: true,
            type: "date",
            message: "Please select the date",
            trigger: "change"
          }
        ],
        time: [
          {
            required: true,
            type: "string",
            message: "Please select time",
            trigger: "change"
          }
        ],
        desc: [
          {
            required: true,
            message: "Please enter a personal introduction",
            trigger: "blur"
          },
          {
            type: "string",
            min: 20,
            message: "Introduce no less than 20 words",
            trigger: "blur"
          }
        ]
      }
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
    }
  }
};
</script>
<style  scoped>
.line-row >>> .ivu-form-item-error-tip {
  top: 32px !important;
}
</style>

