<template>
  <div>
    <Button @click="volBoxFrom" style="margin-left: 8px">弹出框带表单</Button>
    <Button @click="volBoxFromObject" style="margin-left: 8px">获取弹出框表单对象</Button>
  </div>
</template>

<script>

import VolBoxForm from "@/components/basic/VolBoxForm.vue";

var formParam = {
  components: {
    VolBoxForm
  }, 
  methods: {
    volBoxFrom() {
   
    },
    volBoxFromObject() {
    
    }
  },
  created() {},
  data() {
    return {
     
    };
  }
};
extend(formParam);
export default formParam;
</script>

