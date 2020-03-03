<template>
  <div style="background: white;
    padding-top: 20px;
    margin-bottom: 10px;">
    <VolForm ref="myform" :formFileds="formFileds" :formRules="formRules"></VolForm>
   
  </div>
</template>
<script>
import VolForm from "@/components/basic/VolForm.vue";
export default {
  components: { VolForm },
  methods: {
  },
  data() {
    return {
      loadKey: true,
      formFileds: {
        City: "",
        AvgPrice: null
      },
      formRules: [
        [
          {
            columnType: "decimal",
            title: "成交均价",
            // required: true,
            placeholder: "你可以自己定义placeholder显示的文字", //显示自定义的信息
            field: "AvgPrice"
          }
        ]
      ]
    };
  }
};
</script>