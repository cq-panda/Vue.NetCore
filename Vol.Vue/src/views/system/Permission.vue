<template>
  <div class="t-tree">
    <div class="role-list">
      <role-tree :onChange="getUserRole"></role-tree>
    </div>
    <div class="action-container">
      <div class="block">
        <div class="head">
          <div class="text">
            <icon type="md-contact"></icon>角色权限分配
          </div>
          <div>
            <Button type="info" icon="md-checkmark-circle" @click="save">保存</Button>
          </div>
        </div>
        <el-tree
          @check-change="leftCheckChange"
          :data="tree"
          show-checkbox
          node-key="id"
          default-expand-all
          :expand-on-click-node="false"
        >
          <div class="action-group" slot-scope="{ node, data }">
            <div class="action-text" :style="{width:((4-data.lv)*18+150)+'px'}">{{ data.text }}</div>
            <div class="action-item">
              <el-checkbox
                v-for="(item,index) in data.actions"
                :key="index"
                v-model="item.checked"
                @change="()=>{}"
              >{{item.text}}</el-checkbox>
            </div>
          </div>
        </el-tree>
      </div>
    </div>
  </div>
</template>
<script>
let id = 1000;

import RoleTree from "./Permission/RoleTree";
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
        .post("/api/role/getCurrentTreePermission", {}, true)
        .then(result => {
          if (!result.status) return this.$message.error(result.message);
          this.data.splice(0);
          this.roles.splice(0);
          this.data = result.data.tree;
          this.roles = result.data.roles;
          this.data.forEach(x => {
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
      this.data.forEach(x => {
        x.actions.forEach(a => {
          this.$set(a, "checked", false);
        });
      });
      this.http
        .post("/api/role/getUserTreePermission?roleId=" + item.id, {}, true)
        .then(result => {
          if (!result.status) return this.$message.error(result.message);
          result.data.forEach(item => {
            if (item.actions.length == 0) return;
            let sourceItem = this.data.find(f => f.id == item.id);
            if (!sourceItem) return;
            item.actions.forEach(actions => {
              sourceItem.actions.forEach(soure => {
                if (soure.value == actions.value) {
                  this.$set(soure, "checked", true);
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
      this.data.forEach(x => {
        let checkedPermission = x.actions.filter(f => {
          return f.checked;
        });
        if (checkedPermission.length > 0) {
          let actions = checkedPermission.map(m => {
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
          "/api/role/SavePermission?roleId=" + this.selectIndex, //roleId,
          userPermissions,
          true
        )
        .then(result => {
          this.$Message[result.status ? "info" : "error"](result.message);
        });
    },
    getTree(id, data) {
      this.data.forEach(x => {
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
        this.$set(x, "checked", selected);
      });
    }
  }
};
</script>

<style scoped>
.t-tree {
  display: flex;
  /* padding: 100px; */
}
.action-group {
  width: 100%;
  display: flex;
}
.action-text {
  /* width: 200px; */
  margin-right: 10px;
}
.action-item {
  flex: 1;
}
.action-item > label {
  width: 70px;
  margin-left: 10px;
}
.action-container {
  margin-left: 10px;
  flex: 1;
}
.action-container .block {
  border-radius: 5px;
  border: 1px solid #eee;
  border-bottom: 0;
  border-radius: 5px;
}
.action-container .block > div:last-child {
  padding: 5px 15px;
}
.role-list {
  width: 180px;
  border: 1px solid #eee;
  border-bottom: 0;
}

.actived {
  color: #409efe !important;
  background-color: #f3f7f9;
}
.head {
  line-height: 40px;
  border-bottom: 1px solid #e2e2e2;
  width: 100%;
  display: inline-block;
  margin-bottom: 20px;
  padding: 0 25px;
}
.head .text {
  border-bottom: 2px solid #009688;
  float: left;
  font-size: 16px;
}
.head > div:last-child {
  float: right;
}
</style>
