<template>
  <div>
    <Alert show-icon>当前选中{{auditParam.rows}}条记录待审核..</Alert>
    <Form :label-width="85" style="padding-right: 13px;padding-top: 8px;">
      <FormItem label="审核结果：">
        <RadioGroup v-model="auditParam.status">
          <Radio v-for="item in auditParam.data" :key="item.status" :label="item.status">
            <span>{{item.text}}</span>
          </Radio>
        </RadioGroup>
      </FormItem>
      <FormItem label="备 注：">
        <Input
          v-model="auditParam.reason"
          type="textarea"
          :autosize="{minRows: 4,maxRows: 10}"
          placeholder="审核备注..."
        ></Input>
      </FormItem>
    </Form>
  </div>
</template>
<script>
export default {
  props: {
    auditParam: {
      type: Object,
      default: () => {
        return {
          auditParam: {
            rows: 0,
            model: false,
            status: -1,
            reason: "",
            data: []//[{ text: "通过", status: 1 }, { text: "拒绝", status: 2 }]
          }
        };
      }
    }
  }
};
</script>