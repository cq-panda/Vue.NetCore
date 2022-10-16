<template>
  <div class="builder-container">
    <vol-box
      ref="add"
      :width="850"
      :height="450"
      title="新建配置信息"
      padding="10px"
      v-model="addModel"
    >
      <div style="padding: 30px 30px 10px 34px">
        <el-alert type="warning" :closable="false">
          1、如果只是创建目录，父级id填0,其他随便填写;
          <br />
          2、如果是生成代码，父级id填写【代码生成配置】列表页面的id
        </el-alert>
      </div>
      <div class="addModel" style="padding-right: 30px">
        <vol-form
          ref="addForm"
          :formRules="addOptions"
          :formFields="layOutOptins.fields"
        >
        </vol-form>
      </div>
      <template #footer>
        <div>
          <el-button type="primary" size="small" @click="add"
            ><i class="el-icon-plus"></i> 确 定</el-button
          >
        </div>
      </template>
    </vol-box>
    <div class="builder-left">
      <div class="module-name">代码生成配置</div>
      <div class="builder-tree">
        <el-scrollbar style="height: 100%; width: 200px">
          <!-- :onOpenChange="onOpenChange" -->
          <VolMenu :list="tree" :onSelect="onSelect"></VolMenu>
        </el-scrollbar>
      </div>
    </div>
    <div class="builder-content">
      <div style="height: 100%">
        <el-scrollbar style="height: 100%">
          <div class="coder-container">
            <div class="coder-item" style="padding-top: 7px">
              <VolHeader icon="ios-chatbubbles" text="代码生成器">
                <template #content>
                  <div style="color: red; font-size: 13px">
                    删除左侧配置菜单:删除行->保存->删除菜单
                  </div>
                </template>
                <div class="action">
                  <span @click="save"> <i class="el-icon-check"></i>保存 </span>
                  <span @click="addVisible()">
                    <i class="el-icon-plus"></i>新建
                  </span>
                  <span @click="ceateVuePage(0)">
                    <i class="el-icon-document"></i>生成Vue页面
                  </span>
                  <span @click="ceateVuePage(1)">
                    <i class="el-icon-document"></i>生成app页面
                  </span>
                  <span @click="ceateModel">
                    <i class="el-icon-tickets"></i>生成Model
                  </span>
                  <span @click="createService">
                    <i class="el-icon-document"></i>生成业务类
                  </span>
                  <span @click="delTree">
                    <i class="el-icon-delete"></i>删除菜单
                  </span>
                </div>
              </VolHeader>
              <div class="config">
                <vol-form
                  :label-width="90"
                  ref="form"
                  :formRules="layOutOptins.options"
                  :formFields="layOutOptins.fields"
                ></vol-form>
              </div>
            </div>
            <el-alert type="warning" :closable="false">
              1、如果需要修改表结构，请在数据库修改，再点同步表结构->生成vue页面->生成model。
              2、修改编辑行后需要点击生成model、生成vue页面
            </el-alert>
            <div class="coder-item">
              <VolHeader
                icon="md-podium"
                style="border-bottom: 0"
                text="表结构"
              >
                <template #content>
                  <div style="color: red; font-size: 13px">
                    数据库表结构发生变化时请点【同步表结构】
                  </div></template
                >

                <div class="action">
                  <span
                    style="color: rgb(23, 156, 216)"
                    class="ivu-icon ivu-icon-ios-folder"
                    @click="help"
                    >代码生成器参数文档</span
                  >
                  <span @click="delRow" class="ivu-icon ivu-icon-md-close"
                    >删除行数据</span
                  >
                  <span @click="syncTable" class="ivu-icon ivu-icon-md-sync"
                    >同步表结构</span
                  >
                </div>
              </VolHeader>

              <div class="grid-container" style="padding-bottom: 20px">
                <vol-table
                  ref="table"
                  :paginationHide="true"
                  :tableData="data"
                  :height="tableHeight"
                  :columns="layOutOptins.columns"
                  :color="false"
                  :index="true"
                  :allowEmpty="true"
                  :clickEdit="true"
                ></vol-table>
              </div>
            </div>
          </div>
        </el-scrollbar>
      </div>
    </div>
  </div>
</template>
<script>
import builderData from './builderData';
import VolForm from '@/components/basic/VolForm.vue';
import VolTable from '@/components/basic/VolTable.vue';
import VolBox from '@/components/basic/VolBox.vue';
import VolHeader from '@/components/basic/VolHeader.vue';
import VolMenu from '@/components/basic/VolElementMenu.vue';
export default {
  components: {
    VolForm: VolForm,
    VolTable: VolTable,
    VolBox: VolBox,
    VolHeader: VolHeader,
    VolMenu
  },
  data() {
    return {
      more: {
        addChild: 'addChild',
        ceateController: 'ceateController',
        addRow: 'addRow',
        delRow: 'delRow',
        delTree: 'delTree'
      },
      addModel: false,
      helpModel: false,
      tableHeight: 500,
      addOptions: builderData.form.addOptions,
      layOutOptins: {
        fields: builderData.form.fields,
        options: builderData.form.options,
        columns: builderData.columns
      },
      tableInfo: null,
      data: [],
      tree: []
    };
  },
  watch: {
    'layOutOptins.fields.vuePath'(val) {
      localStorage.setItem('vuePath', val);
    },
    deep: true
    //localStorage.setItem("vuePath", this.layOutOptins.fields.vuePath || "");
  },
  methods: {
    changeMore(funName) {
      this[funName]();
    },
    help() {
      window.open('http://v2.volcore.xyz/document/coder');
      // this.helpModel = true;
    },
    addVisible(pid) {
      this.addModel = true;
      this.$refs.form.reset();
      this.data.splice(0);
      if (pid) {
        this.layOutOptins.fields.parentId = pid;
      }
    },
    delTree() {
      let tableId = this.layOutOptins.fields.table_Id;
      if (!tableId) return this.$message.error('请选择节点');
      let tigger = false;
      this.$confirm('删除警告?', '确认要删除吗', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning',
        center: true
      }).then(() => {
        if (tigger) return;
        tigger = true;
        this.http
          .post('/api/builder/delTree?table_Id=' + tableId, {}, true)
          .then((x) => {
            if (!x.status) return this.$message.error(x.message);
            this.$message.error('删除成功,请刷新页面');
            // for (let index = 0; index < this.tree.length; index++) {
            //   if (this.tree[index].id == tableId) {
            //     this.tree.splice(index, 1);
            //   }
            // }
          });
      });
    },
    add() {
      this.$refs.form.validate(() => {
        // this.layOutOptins.fields.tableName =
        //   this.layOutOptins.fields.tableName.slice(0, 1).toUpperCase() +
        //   this.layOutOptins.fields.tableName.slice(1);
        if (!this.layOutOptins.fields.tableTrueName) {
          this.layOutOptins.fields.tableTrueName = this.layOutOptins.fields.tableName;
        }

        let queryParam =
          'parentId=' +
          this.layOutOptins.fields.parentId +
          '&tableName=' +
          this.layOutOptins.fields.tableName +
          '&columnCNName=' +
          this.layOutOptins.fields.columnCNName +
          '&nameSpace=' +
          this.layOutOptins.fields.namespace +
          '&foldername=' +
          this.layOutOptins.fields.folderName +
          '&isTreeLoad=false';
        this.http
          .post('/api/builder/LoadTableInfo?' + queryParam, {}, true)
          .then((x) => {
            if (!x.status) {
              this.$message.error(x.message);
              return;
            }
            let hasTree = this.tree.some((t) => {
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
            if (!x.data.tableTrueName) {
              x.data.tableTrueName = x.data.tableName;
            }
            this.addModel = false;
            this.tableInfo = x.data;
            this.$refs.form.reset(x.data);
            this.data = x.data.tableColumns;
          });
      });
    },
    addChild() {
      // this.$message.info("开发中");
      let id = this.layOutOptins.fields.table_Id;
      if (!id) {
        return this.$message.error('请选中节点');
      }
      this.addVisible(id);
    },
    addRow() {
      this.data.push({});
    },
    delRow() {
      let tigger = false;
      this.$confirm('删除警告?', '确认要删除选择的数据吗', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning',
        center: true
      }).then(() => {
        if (tigger) return;
        tigger = true;
        this.$refs.table.delRow();
      });
    },
    validateTableInfo(callback) {
      this.$refs.form.validate(() => {
        if (!this.tableInfo) {
          this.$message.error('请先加载数据');
          return false;
        }
        if (this.data && this.data.length > 0) {
          let keyInfo = this.data.find((x) => {
            return x.isKey;
          });
          if (!keyInfo) {
            this.$message.error('请勾选设置主键');
            return false;
          }
          if (keyInfo.isNull == 1) {
            this.$message.error('主键【可为空】必须设置为否');
            return false;
          }
          if (
            keyInfo.columnType != 'int' &&
            keyInfo.columnType != 'bigint' &&
            !this.layOutOptins.fields.sortName
          ) {
            this.$message.error('主键非自增类型,请设置上面表单的【排序字段】');
            return false;
          }
        }

        for (const key in this.tableInfo) {
          if (this.layOutOptins.fields.hasOwnProperty(key)) {
            let newVal = this.layOutOptins.fields[key];
            this.tableInfo[key] = newVal;
          }
        }
        callback();
      });
    },
    ceateVuePage(isApp) {
      this.validateTableInfo(() => {
        let vuePath;
        if (!isApp) {
          vuePath = localStorage.getItem('vuePath');
          if (!vuePath) {
            return this.$message.error(
              '请先设置Vue项目对应Views的绝对路径,然后再保存!'
            );
          }
        } else {
          vuePath = localStorage.getItem('appPath');
          if (!vuePath) {
            return this.$message.error('请先设置app路径,然后再保存!');
          }
        }

        let url = `/api/builder/createVuePage?vuePath=${vuePath}&v3=1&app=${isApp ||
          0}`;
        this.http.post(url, this.tableInfo, true).then((x) => {
          this.$Message.info(x);
        });
      });
    },
    createService() {
      this.validateTableInfo(() => {
        let queryParam =
          'tableName=' +
          this.layOutOptins.fields.tableName +
          '&nameSpace=' +
          this.layOutOptins.fields.namespace +
          '&foldername=' +
          this.layOutOptins.fields.folderName;
        this.http
          .post(
            '/api/builder/CreateServices?' + queryParam,
            this.tableInfo,
            true
          )
          .then((x) => {
            this.$Message.info(x);
          });
      });
    },
    ceateModel() {
      this.validateTableInfo(() => {
        this.http
          .post('/api/builder/CreateModel', this.tableInfo, true)
          .then((x) => {
            this.$message.info(x);
          });
      });
    },
    syncTable() {
      if (!this.layOutOptins.fields.tableName)
        return this.$Message.error('请选模块');
      this.http
        .post(
          '/api/builder/syncTable?tableName=' +
            this.layOutOptins.fields.tableName,
          {},
          true
        )
        .then((x) => {
          if (!x.status) {
            return this.$Message.error(x.message);
          }
          this.$Message.info(x.message);
          this.loadTableInfo(this.layOutOptins.fields.table_Id);
        });
    },
    ceateApiController() {},
    ceateController() {},
    checkSortName() {},
    save() {
      localStorage.setItem('vuePath', this.layOutOptins.fields.vuePath || '');
      localStorage.setItem('appPath', this.layOutOptins.fields.appPath || '');

      if (
        this.tableInfo &&
        this.tableInfo.tableColumns &&
        this.tableInfo.tableColumns.length &&
        this.tableInfo.tableColumns.filter((x) => {
          return x.isKey == 1;
        }).length > 1
      ) {
        return this.$Message.error('表结构只能勾选一个主键字段');
      }
      this.validateTableInfo(() => {
        this.http.post('/api/builder/Save', this.tableInfo, true).then((x) => {
          if (!x.status) {
            this.$Message.error(x.message);
            return;
          }
          this.$Message.info(x.message);
          this.tree.forEach((x) => {
            if (x.id == this.layOutOptins.fields.table_Id) {
              x.name = this.layOutOptins.fields.columnCNName;
              x.parentId = this.layOutOptins.fields.parentId;
            }
          });
          this.tableInfo = x.data;
          x.data.vuePath = this.layOutOptins.fields.vuePath;
          x.data.appPath = this.layOutOptins.fields.appPath;
          this.$refs.form.reset(x.data);
          //  this.layOutOptins.fields.vuePath = localStorage.getItem("vuePath");
          this.data = x.data.tableColumns;
          //  this.$Message.info(x);
        });
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
      // localStorage.setItem("vuePath", this.layOutOptins.fields.vuePath || "");
      this.http
        .post(
          '/api/builder/LoadTableInfo?table_Id=' + id + '&isTreeLoad=true',
          {},
          true
        )
        .then((x) => {
          if (!x.data.tableTrueName) {
            x.data.tableTrueName = x.data.tableName;
          }
          //2021.01.09增加代码生成器设置table排序功能
          const _fields = [
            'sortable',
            'isNull',
            'isReadDataset',
            'isColumnData',
            'isDisplay'
          ];
          x.data.tableColumns.forEach((item) => {
            for (let index = 0; index < _fields.length; index++) {
              item[_fields[index]] = item[_fields[index]] || 0;
            }
          });
          this.tableInfo = x.data;

          this.$refs.form.reset(x.data);
          this.data = x.data.tableColumns;
        });
    },
    getVuePath(key) {
      let vuePath = localStorage.getItem(key);
      if (!vuePath || vuePath == 'null' || vuePath == 'undefined') {
        vuePath = '';
      }
      return vuePath;
    }
  },
  mounted() {},
  created() {
    let clientHeight = document.documentElement.clientHeight - 170;
    this.tableHeight = clientHeight < 400 ? 400 : clientHeight;
    this.http
      .post('/api/Sys_Dictionary/GetBuilderDictionary', {}, true)
      .then((dic) => {
        let column = this.layOutOptins.columns.find((x) => {
          return x.field == 'dropNo';
        });
        if (!column) return;

        let data = [{ key: '', value: '' }];
        for (let index = 0; index < dic.length; index++) {
          data.push({ key: dic[index], value: dic[index] });
        }

        column.bind.data = data;
      });

    builderData.form.fields.vuePath = this.getVuePath('vuePath');
    builderData.form.fields.appPath = this.getVuePath('appPath');
    this.http.post('/api/builder/GetTableTree', {}, false).then((x) => {
      this.tree = JSON.parse(x.list);
      if (!x.nameSpace) {
        return this.$message.error(
          '未获取后台项目类库所在命名空间,请确认目录或调试Sys_TableInfoService类GetTableTree方法'
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
      this.layOutOptins.options.forEach((option) => {
        option.forEach((item) => {
          if (item.field == 'namespace') {
            item.data.push(...nameSpaceArr);
          }
        });
      });
      this.addOptions.forEach((option) => {
        option.forEach((item) => {
          if (item.field == 'namespace') {
            item.data.push(...nameSpaceArr);
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
  border-right: 2px solid #dcd6d6;
}
.builder-content {
  position: absolute;
  top: 0px;
  left: 200px;
  display: inline-block;
  bottom: 0;
  right: 0px;
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
  text-align: right;
  line-height: 33px;
  padding-right: 26px;
}
.builder-content .action i {
  top: 0px;
  position: relative;
}
.builder-content .action > span {
  padding: 0px 6px;
  font-size: 12px;
  letter-spacing: 1px;
  color: #5a5f5e;
}
.builder-content .action > span:hover {
  cursor: pointer;
  color: black;
}
.builder-content .config {
  /* border: 1px solid #e9e8e8; */
  padding: 15px 15px 0px 15px;
  border-radius: 3px;
  background: #ffffff;
  margin-bottom: 10px;
}
.builder-container .config >>> .ivu-form > .ivu-form-item {
  display: none;
}
.coder-container {
  background: #eee;
}
.coder-container .coder-item {
  background: white;
  padding: 0px 15px;
}
.module-name {
  color: #2d8cf0;
  font-size: 13px;
  line-height: 39px;
  padding-left: 15px;
  border: 1px solid #abdcff;
  background-color: #f0faff;
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
  padding: 10px;
}
</style>
