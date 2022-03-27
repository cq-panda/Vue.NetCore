<template>
  <div class="t-tree">
    <div class="role-list">
      <role-tree :onChange="getUserRole"></role-tree>
    </div>
    <div class="action-container">
      <div class="header">
        <span class="text"><icon type="md-contact"></icon>角色权限分配</span>

        <el-button type="primary" size="mini" icon="el-icon-check" @click="save"
          >保存</el-button
        >
      </div>
      <el-scrollbar style="flex: 1">
        <el-tree
          @check-change="leftCheckChange"
          @check="nodeCheck"
          :data="tree"
          show-checkbox
          style="padding: 15px"
          node-key="id"
          default-expand-all
          :expand-on-click-node="false"
        >
          <template #default="{ node, data }">
            <div class="action-group">
              <div
                class="action-text"
                :style="{ width: (4 - data.lv) * 18 + 150 + 'px' }"
              >
                {{ data.text }}
              </div>
              <div class="action-item">
                <el-checkbox
                  v-for="(item, index) in data.actions"
                  :key="index"
                  v-model="item.checked"
                  @change="() => {}"
                  >{{ item.text }}</el-checkbox
                >
              </div>
            </div>
          </template>
        </el-tree>
      </el-scrollbar>
    </div>
  </div>
</template>
<script>
let id = 1000;

import RoleTree from "./Permission/RoleTree";
export default {
  components: {
    RoleTree,
  },
  data() {
    return {
      selectIndex: -1,
      checked: false,
      roles: [],
      data: [],
      tree: [],
    };
  },
  created() {
    this.load();
  },
  methods: {
    load() {
      this.http
        .post("/api/role/getCurrentTreePermission", {}, true)
        .then((result) => {
          if (!result.status) return this.$message.error(result.message);
          this.data.splice(0);
          this.roles.splice(0);
          this.data = result.data.tree;
          this.roles = result.data.roles;
          this.data.forEach((x) => {
            if (x.pid == 0) {
              x.lv = 1;
              x.children = [];
              this.tree.push(x);
              this.getTree(x.id, x);
            }
          });
        });
    },
    getUserRole(item, selectIndex) {
      this.selectIndex = item.id;
      this.data.forEach((x) => {
        x.actions.forEach((a) => {
          a.checked = false;
        });
      });
      this.http
        .post("/api/role/getUserTreePermission?roleId=" + item.id, {}, true)
        .then((result) => {
          if (!result.status) return this.$message.error(result.message);
          result.data.forEach((item) => {
            if (item.actions.length == 0) return;
            let sourceItem = this.data.find((f) => f.id == item.id);
            if (!sourceItem) return;
            item.actions.forEach((actions) => {
              sourceItem.actions.forEach((soure) => {
                if (soure.value == actions.value) {
                  soure.checked = true;
                }
              });
            });
          });
        });
    },
    save() {
      if (this.selectIndex == -1) {
        return this.$message.error("请选择角色!");
      }
      let userPermissions = [];
      this.data.forEach((x) => {
        let checkedPermission = x.actions.filter((f) => {
          return f.checked;
        });
        if (checkedPermission.length > 0) {
          let actions = checkedPermission.map((m) => {
            return { text: m.text, value: m.value };
          });
          userPermissions.push({
            id: x.id,
            actions: actions,
          });
        }
      });
      //  let roleId = this.roles[this.selectIndex].id;
      this.http
        .post(
          "/api/role/SavePermission?roleId=" + this.selectIndex, //roleId,
          userPermissions,
          true
        )
        .then((result) => {
          this.$Message[result.status ? "success" : "error"](result.message);
        });
    },
   getTree (id, data, isRootId) {
      this.data.forEach(x => {
        if (x.pid == id) {
          x.lv = data.lv + 1;
          if (isRootId) {
            x.rootId = id;
          }
          if (!data.children) data.children = [];
          data.children.push(x);
          this.getTree(x.id, x, isRootId);
        }
      });
    },
    actionChange (data) {
      let checked = (data.actions.some(x => { return x.checked }));
      //移除左边的选中节点
      if (!checked) {
        let keys = this.$refs.tree.getCheckedKeys().filter(x => { return x !== data.id });
        this.$refs.tree.setCheckedKeys(keys || []);
      } else { //选中根节点
        let rootData = this.data.find(x => { return x.id === data.pid });
        if (rootData && rootData.actions.length) {
          rootData.actions[0].checked=true;
        }
        //选中左边节点
        // let checkedKeys = this.$refs.tree.getCheckedKeys();
        // if (checkedKeys.indexOf(data.pid) == -1) {
        //   checkedKeys.push(data.id)
        //   this.$refs.tree.setCheckedKeys(checkedKeys);
        // }
      }
    },
    nodeCheck (node, data) {

      let rootData = this.data.find(x => { return x.id === node.pid });
      if (rootData && rootData.actions.length) {
        rootData.actions[0].checked =
          node.actions.some(x => { return x.checked })
          || data.halfCheckedNodes.some(x => { return x.id === node.pid });
      }
    },
    leftCheckChange (node, selected) {
      node.actions.forEach((x, index) => {
        x.checked=selected;
      });
    }
  },
};
</script>

<style lang="less" scoped>
.t-tree {
  position: absolute;
  width: 100%;
  height: 100%;
  display: flex;
  padding: 8px;
  background: #eee;
  /* padding: 100px; */
}

.header {
  background: #66b1ff0f;
  line-height: 43px;
  border-bottom: 1px solid #eee;
  position: relative;
  font-size: 15px;
  padding: 0 15px;
  button {
    position: absolute;
    right: 15px;
    top: 8px;
  }
}
.action-container {
  border-radius: 4px;
  flex: 1;
  margin-left: 11px;
  background: white;
  border: 1px solid #eaeaea;
  display: flex;
  flex-direction: column;
}

.role-list {
  width: 200px;
  border: 1px solid #eee;
  border-bottom: 0;
}

.actived {
  color: #409efe !important;
  background-color: #f3f7f9;
}
</style>
<style scoped>
.action-group {
  width: 100%;
  display: flex;
}
.action-text {
  font-size: 14px;
  margin-right: 10px;
}
.action-item {
  flex: 1;
}
.action-item > label {
  min-width: 25px;
  margin-left: 3px;
  margin-right: 10px;
}
.action-container >>> .el-tree-node {
  padding: 5px 0;
}
.action-container >>> .el-checkbox__label {
  padding-left: 5px;
}
</style>
