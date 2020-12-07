<template>
  <div class="container" style="padding: 30px 100px">
    <Divider></Divider>
    <VolForm
      :ref="configId"
      :loadKey="loadKey"
      :formFields="formFields"
      :formRules="formRules"
    ></VolForm>
    <div slot="footer">
      <div class="m-btn">
        <Button type="info" icon="md-checkmark-circle" @click="save()"
          >保存</Button
        >
      </div>
    </div>
  </div>
</template>
<script>
import VolForm from "@/components/basic/VolForm.vue";
export default {
  props: {
    configId: {
      type: Number,
      default: 1,
    },
  },
  components: { VolForm },
  mounted() {
    this.http
      .post("/api/Sys_Configuration/get?id=" + this.configId, {}, true)
      .then((x) => {
        if (!x.status) {
          this.$Message.error(x.message);
          return;
        }
        this.$refs[this.configId].reset(x.data.value);
      });
  },
  data() {
    return {
      loadKey: true,
      formRules: [
        [
          {
            title: "系统标题",
            field: "Title",
            displayType: "text",
            required: true,
          },
          {
            title: "版权申明",
            field: "Copyright",
            dataType: "string",
            displayType: "text",
            required: true,
          },
        ],
        [
          {
            title: "Logo",
            field: "Logo",
            multiple: false,
            type: "img",
            url: "/api/Sys_Configuration/upload",
          },
        ],
        [
          {
            title: "修改时间",
            field: "ModifyDate",
            type: "datetime",
            disabled: true,
            dataType: "datetime",
            displayType: "datetime",
          },
        ],
      ],
      formFields: {
        ModifyDate: "",
      },
    };
  },
  methods: {
    save() {
      this.$refs[this.configId].validate(() => {
        this.http
          .post(
            "/api/Sys_Configuration/save",
            {
              id: this.configId,
              json: JSON.stringify(this.formFields),
            },
            true
          )
          .then((x) => {
            if (!x.status) {
              this.$Message.error(x.message);
              return;
            }
            this.$Message.info(x.message);
            this.$refs[this.configId].reset(x.data.value);
          });
      });
    },
  },
};
</script>
<style lang="less" scoped>
.m-btn {
  text-align: center;
  button {
    width: 200px;
    margin-left: 10px;
  }
}
</style>