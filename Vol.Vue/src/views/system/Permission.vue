<template>
  <div class="t-tree">
    <div class="role-list">
      <ul>
        <li
          :class="{actived:selectIndex==rIndex}"
          @click="getUserRole(item,rIndex)"
          v-for="(item,rIndex) in roles"
          :key="rIndex"
        >{{item.roleName}}</li>
      </ul>
    </div>
    <div class="action-container">
      <div class="block">
        <div class="head">
          <div class="text">
            <icon type="md-contact"></icon>角色权限分配
          </div>
          <div>
            <Button type="info" icon="md-checkmark-circle" @click="save">保存</Button>
            <Button type="success" icon="ios-refresh-circle" @click="refresh">刷新</Button>
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
                @change="onChange"
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

export default {
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
    refresh() {
      //this.load();
    },
    getUserRole(item, selectIndex) {
      this.selectIndex = selectIndex;
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
      let roleId = this.roles[this.selectIndex].id;
      this.http
        .post(
          "/api/role/SavePermission?roleId=" + roleId,
          userPermissions,
          true
        )
        .then(result => {
          this.$message.error(result.message);
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
        //  x.checked = selected;
        this.$set(x, "checked", selected);
      });
    },
    onChange() {
     // this.$message("xxx");
    },
    append(data) {
      const newChild = { id: id++, label: "testtest", children: [] };
      if (!data.children) {
        this.$set(data, "children", []);
      }
      data.children.push(newChild);
    },

    remove(node, data) {
      const parent = node.parent;
      const children = parent.data.children || parent.data;
      const index = children.findIndex(d => d.id === data.id);
      children.splice(index, 1);
    },

    renderContent(h, { node, data, store }) {
      return (
        <span class="custom-tree-node">
          <span>{node.label}ppp </span>
          <span>
            <el-checkbox checked="checked">备选项</el-checkbox>
          </span>
        </span>
      );
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
  margin-left: 180px;
  flex: 1;
  /* padding: 25px;
  border: 1px solid #eee; */
  /* 
  padding-top: 10px; */
}
.action-container .block {
  border-radius: 5px;
  /* padding: 15px; */
  border: 1px solid #eee;
  /* margin: 15px; */
  border-radius: 5px;
}
.action-container .block > div:last-child {
  padding: 5px 15px;
}

.role-list {
  z-index: 999;
  width: 180px;
  top: 0;
  bottom: 0px;
    background: #eaedf1;
  position: absolute;
  border: 1px solid #eee;
}
.role-list ui {
  display: inline-block;
  width: 180px;
}
.role-list li {
  color: #828282;
  width: 100%;
  float: left;
  list-style: none;
  padding: 10px 20px;
  border-bottom: 1px solid #eee;
  font-size: 13px;
}
.role-list li:hover {
    color: #409EFE important;
    background-color: #f3f7f9;
  cursor: pointer;
}
.actived {
    color: #409EFE !important;
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
