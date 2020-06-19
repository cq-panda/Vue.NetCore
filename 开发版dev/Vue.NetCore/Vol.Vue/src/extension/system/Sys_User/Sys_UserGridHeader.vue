<template>
  <div>
    <vol-box :model.sync="model" title="消息提示" :width="600" :height="450">
      <Alert type="error">
        <h4>{{success}}</h4>
      </Alert>
    </vol-box>
  </div>
</template>
<script>
export default {
  components: {
    VolBox: () => import("@/components/basic/VolBox.vue")
  },
  data() {
    return {
      success: "",
      model: false
    };
  },
  methods: {
    open(msg){
      this.success=msg;
      this.model=true;
    }
  },
  created() {}
};
</script>