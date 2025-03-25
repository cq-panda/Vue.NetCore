<template>
  <div class="t-tree">
    <div class="role-list">
      <role-tree :onChange="getUserRole"></role-tree>
    </div>
    <div class="action-container">
      <div class="header">
        <span class="text"><icon type="md-contact"></icon>角色权限分配</span>

        <Button type="info" icon="md-checkmark-circle" @click="save"
          >保存</Button
        >
      </div>
      <el-scrollbar style="flex: 1">
        <el-tree
          @check-change="leftCheckChange"
          :data="tree"
          show-checkbox
          style="padding: 15px"
          node-key="id"
          default-expand-all
          :expand-on-click-node="false"
        >
          <div class="action-group" slot-scope="{ node, data }">
            <div
              class="action-text"
              :style="{ width: (4 - data.lv) * 18 + 150 + 'px' }"
            >
              {{ data.text + (data.isApp ? '(app)' : '') }}
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
        </el-tree>
      </el-scrollbar>
    </div>
  </div>
</template>
<script>
let id = 1000;

import RoleTree from './Permission/RoleTree';
export default {
  components: {
    RoleTree
  },
  data() {
    return {
      selectIndex: -1,
      checked: false,
      roles: [],
      data: [],
      tree: []
    };
  },
  created() {
    this.load();
  },
  methods: {
    load() {
      this.http
        .post('/api/role/getCurrentTreePermission', {}, true)
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
          this.$set(a, 'checked', false);
        });
      });
      this.http
        .post('/api/role/getUserTreePermission?roleId=' + item.id, {}, true)
        .then((result) => {
          if (!result.status) return this.$message.error(result.message);
          result.data.forEach((item) => {
            if (item.actions.length == 0) return;
            let sourceItem = this.data.find((f) => f.id == item.id);
            if (!sourceItem) return;
            item.actions.forEach((actions) => {
              sourceItem.actions.forEach((soure) => {
                if (soure.value == actions.value) {
                  this.$set(soure, 'checked', true);
                }
              });
            });
          });
        });
    },
    save() {
      if (this.selectIndex == -1) {
        return this.$message.error('请选择角色!');
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
            actions: actions
          });
        }
      });
      //  let roleId = this.roles[this.selectIndex].id;
      this.http
        .post(
          '/api/role/SavePermission?roleId=' + this.selectIndex, //roleId,
          userPermissions,
          true
        )
        .then((result) => {
          this.$Message[result.status ? 'info' : 'error'](result.message);
        });
    },
    getTree(id, data) {
      this.data.forEach((x) => {
        if (x.pid == id) {
          x.lv = data.lv + 1;
          if (!data.children) data.children = [];
          data.children.push(x);
          this.getTree(x.id, x);
        }
      });
    },
    leftCheckChange(node, selected) {
      node.actions.forEach((x, index) => {
        this.$set(x, 'checked', selected);
      });
    }
  }
};
</script>

<style lang="less" scoped>
.t-tree {
  position: absolute;
  width: 100%;
  height: 100%;
  display: flex;
  padding: 12px;
  background: #eee;
  /* padding: 100px; */
}

.header {
  background: #f9f8f8;
  line-height: 40px;
  border-bottom: 1px solid #eee;
  position: relative;
  font-size: 15px;
  padding: 0 15px;
  button {
    position: absolute;
    right: 15px;
    top: 4px;
  }
}
.action-container {
  border-radius: 4px;
  flex: 1;
  margin-left: 15px;
  background: white;
  border-bottom: 1px solid #eee;
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
  width: 55px;
  margin-left: 3px;
}
.action-container >>> .el-tree-node {
  padding: 5px 0;
}
.action-container >>> .el-checkbox__label {
  padding-left: 5px;
}
</style>
