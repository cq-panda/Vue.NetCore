<template>
  <div>
    <vol-box :options="boxOptions" ref="box">
      <div class="iview-com">
        <vol-form ref="form" :formRules="formOptions" :formFileds="formFileds"></vol-form>
      </div>
    </vol-box>
  </div>
</template>
<script>
import VolBox from "@/components/basic/VolBox.vue";
import VolForm from "@/components/basic/VolForm.vue";
let $vueBoxForm = {
  components: {
    VolBox,
    VolForm
  },
  props: {
    boxOptions: {
      type: Object,
      default: () => {
        return {
          height: "400px",
          width: "700px",
          btn: [
            {
              name: "重置",
              handler: function($vue) {
                //  $vue.box = false;
                // $vue.$props.form.Url = "11";
                //  $vueBoxForm.$refs.form.formFileds.Url = "11";
                $vue.$props.value = false;
              },
              icon: "",
              style: { background: "red" }
            }
          ]
        };
      }
    },
    formOptions: {
      type: Array,
      default: []
    },
    formFileds: {
      type: Object,
      default: {}
    }
  },
  methods: {
    show() {
      this.$refs.box.show();
    },
    close() {
      this.$refs.box.close();
    },
    volBoxFromObject() {
      this.$refs.box.getObject();
    }
  }
};
export default $vueBoxForm;
</script>
<style scoped>
.iview-com {
  padding: 15px 25px 15px 15px;
  /* left: 0;
  position: absolute;
  right: 0;
  max-width: 500px;
  margin: auto;
  margin-top: 13px; */
}
</style>


