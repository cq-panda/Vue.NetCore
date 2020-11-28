<template>
  <div class="menu-container" style="padding: 30px 100px">
    <div class="menu-left">
      <Alert class="module-name" show-icon>菜单列表</Alert>
      <div class="menu-tree" style="height: 95%">
        <el-scrollbar style="height: 100%">
          <VolMenu :options="tree" :onSelect="menuSelect"></VolMenu>
        </el-scrollbar>
      </div>
    </div>

    <div class="menu-right">
      <el-scrollbar style="height: 100%">
        <Divider>{{ this.tableName }}</Divider>
        <vol-form
          :ref="configId"
          :loadKey="loadKey"
          :formFields="formFields"
          :formRules="formRules"
        >
          <div slot="footer">
            <div class="tableColumns" v-show="formFields.Tables.length > 0">
              <label class="ivu-form-item-label">导出项：</label>
              <div class="ck">
                <Checkbox
                  :indeterminate="indeterminate"
                  :value="checkAll"
                  @click.prevent.native="handleCheckAll"
                  >{{ checkAll ? "取消全选" : "全选" }}</Checkbox
                >
                <CheckboxGroup
                  v-model="selectColumns"
                  @on-change="checkAllGroupChange"
                >
                  <Checkbox
                    v-for="(item, index) in tableColumns"
                    :key="index"
                    :label="item.ColumnId"
                  >
                    {{ item.ColumnName }}
                  </Checkbox>
                </CheckboxGroup>
              </div>
            </div>
          </div>
          <div slot="footer">
            <div class="m-btn">
              <Button type="info" icon="md-checkmark-circle" @click="save()"
                >保存</Button
              >
            </div>
          </div>
        </vol-form>
      </el-scrollbar>
    </div>
  </div>
</template>
<script>
let $vue;
import VolForm from "@/components/basic/VolForm.vue";
export default {
  props: {
    configId: {
      type: Number,
      default: 1,
    },
  },
  components: {
    VolForm,
    VolMenu: () => import("@/../src/components/basic/VolMenu"),
  },
  mounted() {},
  created() {
    $vue = this;
    this.http
      .post("/api/Sys_Configuration/getTableData", {}, true)
      .then((x) => {
        if (!x.status) {
          this.$Message.error(x.message);
          return;
        }
        this.$refs[this.configId].reset(x.data.value);
        x.data.value.Tables.forEach((element) => {
          this.tree.push({
            id: element.TableId,
            parentId: 0,
            name: element.TableName,
          });
        });
      });
  },
  data() {
    return {
      tree: [],
      tableId: 0,
      tableName: "请选择数据表",
      loadKey: true,
      indeterminate: false,
      checkAll: false,
      selectColumns: [],
      tableColumns: [],
      formRules: [
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
        Tables: "",
      },
    };
  },
  methods: {
    menuSelect(node) {
      this.selectColumns = [];
      this.checkAll = false;
      this.indeterminate = false;
      this.formFields.Tables.forEach((element) => {
        if (element.TableId == node) {
          this.tableId = element.TableId;
          this.tableName = element.TableName;
          this.tableColumns = element.TableColumns;
          this.$nextTick(() => {
            element.TableColumns.forEach((column) => {
              if (column.IsExport === true) {
                this.selectColumns.push(column.ColumnId);
              }
              if (this.selectColumns.length == element.TableColumns.length) {
                this.checkAll = true;
                this.indeterminate = true;
              }
            });
          });
        }
      });
    },
    handleCheckAll() {
      if (this.checkAll == false && this.indeterminate == false) {
        this.checkAll = true;
        this.indeterminate = true;
      } else if (this.checkAll == false && this.indeterminate == true) {
        this.checkAll = false;
        this.indeterminate = false;
      } else {
        this.checkAll = !this.checkAll;
        this.indeterminate = false;
      }
      if (this.checkAll) {
        this.selectColumns = this.tableColumns.map((x) => {
          return x.ColumnId;
        });
        this.indeterminate = false;
      } else {
        this.selectColumns = [];
      }
    },
    checkAllGroupChange(data) {
      if (data.length === this.tableColumns.length) {
        this.indeterminate = false;
        this.checkAll = true;
      } else if (data.length > 0) {
        this.indeterminate = true;
        this.checkAll = false;
      } else {
        this.indeterminate = false;
        this.checkAll = false;
      }
    },
    save() {
      if (this.tableId <= 0) return;
      //必须要初始化
      this.tableColumns.forEach((column, index) => {
        this.tableColumns[index].IsExport = false;
      });
      //标记所选择项目
      this.selectColumns.forEach((selectColumn) => {
        this.tableColumns.forEach((column, index) => {
          if (selectColumn == column.ColumnId) {
            this.tableColumns[index].IsExport = true;
          }
        });
      });
      this.$refs[this.configId].validate(() => {
        this.http
          .post(
            "/api/Sys_Configuration/saveExportColumns",
            {
              Id: this.configId,
              Json: JSON.stringify({
                tableId: this.tableId,
                tableName: this.tableName,
                tableColumns: this.tableColumns,
              }),
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
.menu-container {
  display: flex;
  width: 100%;
  height: 100%;
  border-radius: 5px;
  .menu-left {
    width: 201px;
    border: 1px solid #eee;
    .module-name {
      border-radius: 0px;
      /* height: 5%; */
      line-height: 21px;
      margin-bottom: 0;
    }
  }
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
.tableColumns {
  width: 100%;
  display: flex;
  margin-bottom: 15px;
  .ivu-checkbox-wrapper {
    margin-right: 20px;
  }
  .ivu-form-item-label {
    min-width: 100px;
  }
  .ck {
    line-height: 33px;
    min-width: 20px;
    float: left;
    label:first-child {
      margin-top: 1px;
    }
  }
}
</style>