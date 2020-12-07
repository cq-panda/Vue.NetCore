<template>
  <div>
    <vol-box
      :model.sync="viewModel"
      :height="560"
      :width="850"
      title="点击表的弹出框"
    >
      <div slot="content">
        <div class="personal">
          <div>
            <div class="left">
              <vol-form
                ref="personalForm"
                :load-key="true"
                :width="350"
                :formRules="personalFormOptions"
                :formFileds="personalFormFields"
              >
                <div slot="header">
                  <Divider>
                    <span>图片上传</span>
                  </Divider>
                </div>
              </vol-form>
              <div>
                <div class="imgs">
                  <div v-if="enableOCR" class="item">
                    <div class="remove" v-show="showRemove">
                      <Icon @click="remove" type="md-close" />
                    </div>
                    <img
                      class="header-img"
                      :src="this.imgSrc"
                      :onerror="errorImg"
                    />
                  </div>
                  <div v-else>
                    <VolUpload
                      :url="url"
                      :upload-before="uploadBefore"
                      :upload-after="uploadAfter"
                      :on-change="onChange"
                      :max-size="500"
                      :img="true"
                    >
                    </VolUpload>
                  </div>
                </div>
                <div>
                  <Button
                    :disabled="!enableOCR"
                    type="primary"
                    @click="handleCOR()"
                    >OCR光学字符识别</Button
                  >
                </div>
              </div>
            </div>
            <div class="right">
              <vol-form
                ref="idCardForm"
                :load-key="true"
                :width="350"
                :formRules="idCardFormOptions"
                :formFileds="idCardFormFields"
              >
                <div slot="header">
                  <Divider>
                    <span>个人信息</span>
                  </Divider>
                </div>
                <div slot="footer"></div>
              </vol-form>
            </div>
          </div>
        </div>
      </div>
      <div slot="footer">
        <Button
          type="info"
          size="large"
          :disabled="!saveBtn"
          @click="modifyInfo"
          >保存</Button
        >
        <Button type="error" size="large" @click="modelClose()">取消</Button>
      </div>
    </vol-box>
  </div>
</template>
<script>
import VolForm from "@/components/basic/VolForm.vue";
import VolUpload from "@/components/basic/VolUpload.vue";
export default {
  components: {
    VolForm,
    VolUpload,
    VolBox: () => import("@/components/basic/VolBox.vue"),
  },
  data() {
    return {
      errorImg: 'this.imgSrc="' + require("@/assets/imgs/error-img.png") + '"',
      url: "/api/App_Appointment/Upload",
      showRemove: false,
      enableOCR: false,
      saveBtn: false,
      viewModel: false,
      personal: null,
      imgSrc: "",
      idCardFormFields: {
        personalId: "",
        advancedInfo: "",
        requestId: "",
      },
      idCardFormOptions: [
        [
          {
            columnType: "string",
            title: "姓名",
            field: "name",
            type: "text",
          },
        ],
        [
          {
            columnType: "string",
            title: "性别",
            field: "sex",
            type: "text",
          },
        ],
        [
          {
            columnType: "string",
            title: "民族",
            field: "nation",
            type: "text",
          },
        ],
        [
          {
            columnType: "string",
            title: "出生日期",
            field: "birth",
            type: "text",
          },
        ],
        [
          {
            columnType: "string",
            title: "地址",
            field: "address",
            type: "text",
          },
        ],
        [
          {
            columnType: "string",
            title: "身份证号",
            field: "idNum",
            type: "text",
          },
        ],
        [
          {
            columnType: "string",
            title: "发证机关",
            field: "authority",
            type: "text",
          },
        ],
        [
          {
            columnType: "string",
            title: "证件有效期",
            field: "validDate",
            type: "text",
          },
        ],
      ],
      personalFormFields: {
        PersonalId: "",
        CertificateType: "",
        Describe: "",
        IDCardImagePath: "",
      },
      personalFormOptions: [
        [
          {
            dataKey: "CertificatesType",
            data: [],
            title: "类型",
            required: true,
            field: "CertificateType",
            type: "select",
          },
        ],
        [
          {
            dataKey: "Personal",
            data: [],
            title: "所属人员",
            required: true,
            field: "PersonalId",
            type: "select",
          },
        ],
        [{ title: "描述", field: "Describe", type: "textarea" }],
      ],
    };
  },
  methods: {
    editPersonal(personal) {
      this.$refs.personalForm.reset(personal);
      this.personalFormFields.CertificateType = personal.CertificateType.toString();
      var idCardInfo = JSON.parse(personal.IDCardInfo);
      this.$refs.idCardForm.reset(idCardInfo);
      this.imgSrc = this.http.ipAddress + personal.IDCardImagePath;
      this.showImage();
      console.log(personal);
    },
    modifyInfo() {
      if (this.personalFormFields.PersonalId == "") return;
      this.idCardFormFields.personalId = this.personalFormFields.PersonalId;
      this.$refs.idCardForm.validate(() => {
        this.http
          .post(
            "/api/Personal_Certificates/saveIdCardOCR",
            this.idCardFormFields,
            true
          )
          .then((x) => {
            if (x.status) {
              this.$Message.success(x.message);
              this.remove();
              this.$refs.personalForm.reset();
              this.$refs.idCardForm.reset();
            } else {
              return this.$Message.error(x.message);
            }
            this.viewModel = false;
            this.$parent.$refs.table.load();
          });
      });
    },
    handleCOR() {
      this.personalFormFields.IDCardImagePath = this.imgSrc;
      this.$refs.personalForm.validate(() => {
        this.http
          .post(
            "/api/Personal_Certificates/idCardOCR",
            this.personalFormFields,
            true
          )
          .then((x) => {
            if (x.status) {
              this.$Message.success(x.message);
              this.$refs.idCardForm.reset(x.data);
              this.saveBtn = true;
            } else {
              return this.$Message.error(x.message);
            }
          });
      });
    },
    remove() {
      this.$refs.idCardForm.reset();
      this.enableOCR = false;
      this.saveBtn = false;
      this.imgSrc = "";
    },
    modelClose() {
      this.viewModel = false;
      this.$refs.personalForm.reset();
      this.remove();
    },
    getFileNames(files) {
      let arr = [];
      for (let index = 0; index < files.length; index++) {
        const element = files[index];
        arr.push(element.name);
      }
      return arr.join(",");
    },
    uploadBefore(files) {
      // console.log("上传前的文件:" + this.getFileNames(files));
      return true;
    },
    uploadAfter(result, files) {
      this.imgSrc =
        this.http.ipAddress + result.data + this.getFileNames(files);
      this.personalFormFields.IDCardImagePath = this.imgSrc;
      this.showImage();
      return true;
    },
    showImage() {
      this.showRemove = true;
      this.enableOCR = true;
    },
    onChange(files) {
      // console.log("选择的文件:" + this.getFileNames(files));
      return true;
    },
  },
};
</script> 
<style lang="less" scoped>
img[src=""],
img:not([src]) {
  opacity: 0;
}

.personal {
  width: 820px;
  box-shadow: rgb(214, 214, 214) 0px 4px 15px;
  margin: 0 auto;
  text-align: center;
  display: flex;
  > div {
    margin: 0 auto;
  }
  .text {
    padding: 5px;
    > p {
      padding-top: 5px;
    }
  }
  .left {
    float: left;
    padding-right: 20px;
  }
  .right {
    float: right;
    padding-left: 20px;
    padding-bottom: 10px;
    border-left: 1px solid rgb(228, 228, 228);
  }
  .imgs {
    display: inline-block;
    .item:hover {
      cursor: pointer;
      .remove {
        display: block;
      }
    }
    > .item {
      position: relative;
      text-align: center;
      .header-img {
        width: 300px;
        border-radius: 6%;
        position: relative;
        border: 3px solid #dfdfdf;
        margin: 0 auto;
      }
      .remove {
        text-align: right;
        z-index: 1;
        display: none;
        position: absolute;
        width: 100%;
        right: 0;
        background: #9e9e9e;
        float: left;
        padding: 5px 10px;
        opacity: 0.6;
        font-size: 30px;
        line-height: 20px;
        color: #f56234;
        i {
          cursor: pointer;
        }
      }
    }
  }
}
</style>


