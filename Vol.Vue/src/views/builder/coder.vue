<template>
  <div class="builder-container">
    <!-- 代码生成器 -->
    <!-- <vol-box ref="help" title="代码生成手册" :model.sync="helpModel">
      <div><p></p></div>
    </vol-box>-->
    <vol-box ref="add" :width="550" :height="350" title="新建配置信息" :model.sync="addModel">
      <div class="addModel">
        <vol-form ref="addForm" :formRules="addOptions" :formFileds="layOutOptins.fileds"></vol-form>
      </div>
      <Button slot="footer" type="info" @click="add">确 认</Button>
    </vol-box>
    <div class="builder-left">
      <Alert class="module-name" show-icon>模块列表</Alert>
      <div class="builder-tree">
        <el-scrollbar style="height:100%;">
          <VolMenu :onOpenChange="onOpenChange" :options="tree" :onSelect="onSelect"></VolMenu>
        </el-scrollbar>
      </div>
    </div>
    <div class="builder-content">
      <div style="height:100%;">
        <el-scrollbar style="height:100%;">
          <div class="ivu-alert ivu-alert-success ivu-alert-with-icon">
            <span class="ivu-alert-icon">
              <i class="ivu-icon ivu-icon-md-ionic"></i>
            </span>
            <span class="ivu-alert-message">代码生成器</span>
            <span @click="help" class="ivu-alert-message help ivu-icon ivu-icon-md-hand">代码生成器文档</span>
            <div class="action">
              <span class="ivu-icon ivu-icon-md-checkmark" @click="save">保存</span>
              <span class="ivu-icon ivu-icon-md-add" @click="addVisible()">新建</span>
              <span class="ivu-icon ivu-icon-md-flower" @click="ceateVuePage">生成Vue页面</span>
              <span class="ivu-icon ivu-icon-md-flower" @click="ceateModel">生成Model</span>
              <span class="ivu-icon ivu-icon-md-flower" @click="createService">生成业务类</span>
              <!-- <span class="ivu-icon ivu-icon-md-flower" @click="ceateApiController">生成Api控制器</span> -->
              <!-- <span class="ivu-icon ivu-icon-md-flower" @click="ceatePage" >生成后台页面</span> -->
              <Dropdown @on-click="changeMore" class="more">
                <a href="javascript:void(0)">
                  其他
                  <Icon type="ios-arrow-down"></Icon>
                </a>
                <DropdownMenu slot="list">
                  <DropdownItem :name="more.addChild">添加菜单子级</DropdownItem>
                  <DropdownItem :name="more.ceateController">生成后台控制器</DropdownItem>
                  <DropdownItem :name="more.addRow">添加行</DropdownItem>
                  <DropdownItem :name="more.delRow">删除行</DropdownItem>
                  <DropdownItem :name="more.delTree">删除菜单</DropdownItem>
                </DropdownMenu>
              </Dropdown>
            </div>
          </div>
          <div class="config">
            <vol-form
              ref="form"
              :formRules="layOutOptins.options"
              :formFileds="layOutOptins.fileds"
            ></vol-form>
          </div>
          <div class="grid-container" style="padding-bottom:20px">
            <vol-table
              ref="table"
              :paginationHide="true"
              :tableData="data"
              :columns="layOutOptins.columns"
              :height="tableHeight"
              :color="false"
              :index="true"
              :allowEmpty="true"
            ></vol-table>
          </div>
        </el-scrollbar>
      </div>
    </div>
  </div>
</template>
<script>
import builderData from "./builderData";
import VolForm from "@/components/basic/VolForm.vue";
import VolTable from "@/components/basic/VolTable.vue";
import VolBox from "@/components/basic/VolBox.vue";
export default {
  components: {
    VolForm: VolForm,
    VolTable: VolTable,
    VolBox: VolBox,
    VolMenu: () => import("@/../src/components/basic/VolMenu")
  },
  data() {
    return {
      more: {
        addChild: "addChild",
        ceateController: "ceateController",
        addRow: "addRow",
        delRow: "delRow",
        delTree: "delTree"
      },
      addModel: false,
      helpModel: false,
      tableHeight: 200,
      addOptions: builderData.form.addOptions,
      layOutOptins: {
        fileds: builderData.form.fields,
        options: builderData.form.options,
        columns: builderData.columns
      },
      tableInfo: null,
      data: [],
      tree: []
    };
  },
  methods: {
    changeMore(funName) {
      this[funName]();
    },
    help() {
      window.open("/document/coder");
      // this.helpModel = true;
    },
    addVisible(pid) {
      this.addModel = true;
      this.$refs.form.reset();
      this.data.splice(0);
      if (pid) {
        this.layOutOptins.fileds.parentId = pid;
      }
    },
    delTree() {
      let tableId = this.layOutOptins.fileds.table_Id;
      if (!tableId) return this.$message.error("请选择节点");
      this.$Modal.confirm({
        title: "删除警告!",
        content:
          '<p style="color: red;font-weight: bold;letter-spacing: 3px;">确认要删除' +
          this.layOutOptins.fileds.columnCNName +
          "?</p>",
        onOk: () => {
          this.http
            .post("/api/builder/delTree?table_Id=" + tableId, {}, true)
            .then(x => {
              if (!x.status) return this.$message.error(x.message);
              for (let index = 0; index < this.tree.length; index++) {
                if (this.tree[index].id == tableId) {
                  this.tree.splice(index, 1);
                }
              }
            });
        }
      });
    },
    add() {
      if (!this.$refs.form.validate()) {
        return;
      }
      let queryParam =
        "parentId=" +
        this.layOutOptins.fileds.parentId +
        "&tableName=" +
        this.layOutOptins.fileds.tableName +
        "&columnCNName=" +
        this.layOutOptins.fileds.columnCNName +
        "&nameSpace=" +
        this.layOutOptins.fileds.namespace +
        "&foldername=" +
        this.layOutOptins.fileds.folderName +
        "&isTreeLoad=false";
      this.http
        .post("/api/builder/LoadTableInfo?" + queryParam, {}, true)
        .then(x => {
          if (!x.status) {
            this.$message.error(x.message);
            return;
          }
          let hasTree = this.tree.some(t => {
            return t.id == x.data.table_Id;
          });
          if (!hasTree) {
            this.tree.push({
              id: x.data.table_Id,
              pId: x.data.parentId,
              parentId: x.data.parentId,
              name: x.data.columnCNName,
              orderNo: x.data.orderNo
            });
          }
          this.addModel = false;
          this.tableInfo = x.data;
          this.$refs.form.reset(x.data);
          this.data = x.data.tableColumns;
        });
    },
    addChild() {
      // this.$message.info("开发中");
      let id = this.layOutOptins.fileds.table_Id;
      if (!id) {
        return this.$message.error("请选中节点");
      }
      this.addVisible(id);
    },
    addRow() {
      this.data.push({});
    },
    delRow() {
      this.$Modal.confirm({
        title: "删除警告!",
        content:
          '<p style="color: red;font-weight: bold;letter-spacing: 3px;">确认要删除选择的数据吗?</p>',
        onOk: () => {
          let rows = this.$refs.table.delRow();
          console.log(rows);
        }
      });
    },
    validateTableInfo() {
      if (!this.$refs.form.validate()) {
        return;
      }
      if (!this.tableInfo) {
        this.$message.error("请先加载数据");
        return false;
      }
      if (this.data && this.data.length > 0) {
        let keyInfo = this.data.find(x => {
          return x.isKey;
        });
        if (!keyInfo) {
          this.$message.error("请勾选设置主键");
          return false;
        }
        if (
          keyInfo.columnType != "int" &&
          keyInfo.columnType != "bigint" &&
          !this.layOutOptins.fileds.sortName
        ) {
          this.$message.error("主键非自增类型,必须设置排序字段");
          return false;
        }
      }
      for (const key in this.tableInfo) {
        if (this.layOutOptins.fileds.hasOwnProperty(key)) {
          let newVal = this.layOutOptins.fileds[key];
          this.tableInfo[key] = newVal;
        }
      }
      return true;
    },
    ceateVuePage() {
      if (!this.validateTableInfo()) return;
      let vuePath = localStorage.getItem("vuePath");
      if (!vuePath) {
        return this.$message.error(
          "请先设置Vue项目对应Views的绝对路径,然后再保存!"
        );
      }
      this.http
        .post(
          "/api/builder/createVuePage?vuePath=" + vuePath,
          this.tableInfo,
          true
        )
        .then(x => {
          this.$Message.info(x);
        });
    },
    createService() {
      if (!this.validateTableInfo()) return;
      let queryParam =
        "tableName=" +
        this.layOutOptins.fileds.tableName +
        "&nameSpace=" +
        this.layOutOptins.fileds.namespace +
        "&foldername=" +
        this.layOutOptins.fileds.folderName;
      this.http
        .post("/api/builder/CreateServices?" + queryParam, this.tableInfo, true)
        .then(x => {
          this.$message(x);
        });
    },
    ceateModel() {
      if (!this.validateTableInfo()) return;
      this.http
        .post("/api/builder/CreateModel", this.tableInfo, true)
        .then(x => {
          this.$message(x);
        });
    },
    ceateApiController() {},
    ceateController() {},
    checkSortName() {},
    save() {
      localStorage.setItem("vuePath", this.layOutOptins.fileds.vuePath || "");
      if (!this.validateTableInfo()) return;
      this.http.post("/api/builder/Save", this.tableInfo, true).then(x => {
        if (!x.status) {
          this.$message.error(x.message);
          return;
        }
        this.$message.info(x.message);
        this.tree.forEach(x => {
          if (x.id == this.layOutOptins.fileds.table_Id) {
            x.name = this.layOutOptins.fileds.columnCNName;
            x.parentId = this.layOutOptins.fileds.parentId;
          }
        });
        this.tableInfo = x.data;
        this.$refs.form.reset(x.data);
        this.data = x.data.tableColumns;
        this.$message.info(x);
      });
    },
    onSelect(node) {
      this.loadTableInfo(node);
    },
    onOpenChange(node) {
      if (node.length == 0) return;
      this.loadTableInfo(node.length == 1 ? node[0] : node[node.length - 1]);
    },
    loadTableInfo(id) {
      this.http
        .post(
          "/api/builder/LoadTableInfo?table_Id=" + id + "&isTreeLoad=true",
          {},
          true
        )
        .then(x => {
          this.tableInfo = x.data;
          this.$refs.form.reset(x.data);
          this.data = x.data.tableColumns;
        });
    },
    getVuePath() {
      let vuePath = localStorage.getItem("vuePath");
      if (!vuePath || vuePath == "null" || vuePath == "undefined") {
        vuePath = "";
      }
      return vuePath;
    }
  },
  mounted() {},
  created() {
    this.http
      .post("/api/Sys_Dictionary/GetBuilderDictionary", {}, true)
      .then(dic => {
        let column = this.layOutOptins.columns.find(x => {
          return x.field == "dropNo";
        });
        if (!column) return;

        let data = [{ key: "", value: "" }];
        for (let index = 0; index < dic.length; index++) {
          data.push({ key: dic[index], value: dic[index] });
        }

        column.bind.data = data;
      });

    builderData.form.fields.vuePath = this.getVuePath();
    let clientHeight = document.documentElement.clientHeight - 425;
    this.tableHeight = clientHeight < 200 ? 150 : clientHeight;
    this.http.post("/api/builder/GetTableTree", {}, false).then(x => {
      this.tree = JSON.parse(x.list);
      if (!x.nameSpace) {
        return this.$message(
          "未获取后台项目类库所在命名空间,请确认目录或调试Sys_TableInfoService类GetTableTree方法"
        );
      }
      let nameSpace = JSON.parse(x.nameSpace);
      let nameSpaceArr = [];
      for (let index = 0; index < nameSpace.length; index++) {
        nameSpaceArr.push({
          key: nameSpace[index],
          value: nameSpace[index]
        });
      }

      //初始化项目命令空间
      this.layOutOptins.options.forEach(option => {
        option.forEach(item => {
          if (item.field == "namespace") {
            item.data.data.push(...nameSpaceArr);
          }
        });
      });
      this.addOptions.forEach(option => {
        option.forEach(item => {
          if (item.field == "namespace") {
            item.data.data.push(...nameSpaceArr);
          }
        });
      });
    });
  }
};
</script>
<style scoped>
.builder-tree {
  position: absolute;
  top: 41px;
  bottom: 0;
}
.builder-tree >>> .ivu-menu {
  text-align: left;
  width: 200px !important;
}
.builder-container {
  widows: 100%;
  /* padding: 20px; */
  position: absolute;
  top: 0px;
  left: 0;
  right: 0;
  display: inline-block;
  bottom: 0;
}
.grid-container >>> tr:hover {
  cursor: pointer;
}
.builder-left {
  position: relative;
  width: 201px;
  height: 100%;
  border: 1px solid #dadada;
  /* border-right: 0px; */
}
.builder-content {
  position: absolute;
  top: 5px;
  left: 205px;
  display: inline-block;
  bottom: 0;
  right: 5px;
}
.builder-content .ivu-alert {
  position: relative;
  display: flex;
  padding: 12px 18px 12px 38px;
}
.builder-content .ivu-alert-icon {
  top: 10px;
}
.builder-content .action {
  flex: 1;
  text-align: right;
}
.builder-content .action > span {
  padding: 0px 6px;
  font-size: 12px;
  letter-spacing: 1px;
  color: #999;
}
.builder-content .action > span:hover {
  cursor: pointer;
  color: black;
}
.builder-content .config {
  border: 1px solid #e9e8e8;
  padding: 15px 15px 0px 15px;
  border-radius: 3px;
  background: #ffffff;
  margin-bottom: 10px;
}
.builder-container .config >>> .ivu-form > .ivu-form-item {
  display: none;
}
.module-name {
  border-radius: 0;
  border: 0px;
  border-bottom: 1px solid #dcdcdc;
  padding: 13px 48px 11px 38px;
}
.module-name >>> .ivu-alert-icon {
  top: 12px;
}
.help {
  margin-left: 15px;
  top: 2px;
  position: relative;
  border-bottom: 1px solid;
}
.help:hover {
  color: #f56c6c;
  cursor: pointer;
}
.more {
  text-align: left;
  position: relative;
  top: 2px;
}
.addModel {
  padding: 10px 53px 0px 40px;
}
</style>


