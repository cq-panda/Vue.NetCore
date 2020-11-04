 <template>
  <div class="menu-container">
    <!-- <div class="menu-left">
      <Alert class="module-name" show-icon>权限类型</Alert>
      <div class="menu-tree" style="height: 95%">
        <el-scrollbar style="height: 100%">
         TODO 待处理
        </el-scrollbar>
      </div>
    </div> -->
    <div class="menu-right">
      <el-scrollbar style="height: 100%">
        <div style="padding: 0 60px">
          <Divider>
            <span icon="ivu-icon ivu-icon-md-podium">{{ divider }}</span>
          </Divider>
          <vol-form
            class="form-content"
            ref="form"
            :formRules="options"
            :formFileds="formFileds"
          >
            <div slot="footer">
              <div class="m-btn">
                <Button type="info" icon="md-checkmark-circle" @click="save"
                  >保存</Button
                >
              </div>
            </div>
          </vol-form>
        </div>
      </el-scrollbar>
    </div>
  </div>
</template>
<script>
import VolForm from "@/components/basic/VolForm.vue";
export default {
  components: {
    VolForm: VolForm,
    VolMenu: () => import("@/../src/components/basic/VolMenu"),
  },
  methods: {
    save() {
      var than = this;
      this.$refs.form.validate(() => {
        this.http
          .post("/api/Sys_Setting/Save", this.formFileds, true)
          .then((x) => {
            if (x.status) {
              than.$store.dispatch("setSystemSetting", x.data);
              return this.$message(x.message);
            }
          });
      });
    },
  },
  created() {
    this.http.post("/api/Sys_Setting/getSystemSetting", {}, true).then((x) => {
      if (x.status == false) {
        return this.$message(x.message);
      }
      this.$refs.form.reset(x.data);
    });
  },

  data() {
    return {
      divider: "系统设置",
      options: [
        [
          {
            dataKey: "setting_Login_EnableVerificaCode",
            title: "是否启用验证码",
            field: "login_EnableVerificaCode",
            type: "switch",
          },
          {
            title: "平台名称",
            field: "platformName",
            type: "text",
            required: true,
          },
        ],
        [
          {
            title: "修改时间",
            field: "modifyDate",
            disabled: true,
          },
          {
            title: "修改人",
            field: "modifier",
            disabled: true,
          },
        ],
      ],
      formFileds: { login_EnableVerificaCode: "", id: "", platformName: "" },
    };
  },
};
</script>

<style lang="less" scoped>
.menu-container {
  display: flex;
  position: absolute;
  width: 100%;
  height: 100%;
  border-radius: 5px;
  /* .menu-left {
    width: 201px;
    border: 1px solid #eee;
    .module-name {
      border-radius: 0px;
      height: 5%; 
      line-height: 21px;
      margin-bottom: 0;
    }
  }*/
  .menu-right {
    flex: 1;
    // padding: 0 100px;
    .form-content {
      border: 1px solid #eee;
      margin-top: 5px;
      width: 100%;
      padding: 25px;
      box-shadow: rgb(214, 214, 214) 0px 4px 21px;
    }
  }
}
.m-btn {
  text-align: right;
  button {
    margin-left: 10px;
  }
}
</style>


<style  scoped>
.menu-left >>> .ivu-menu {
  width: 200px !important;
}
</style>

