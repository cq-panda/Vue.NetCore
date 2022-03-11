<template>
  <div class="com-el-tree">
    <div class="m-title"><i class="el-icon-warning-outline"></i>角色列表</div>
    <el-scrollbar style="height: 100%; width: 210px" class="el-role-tree">
      <el-tree
        :data="tree"
        @node-click="nodeClick"
        node-key="id"
        :default-expanded-keys="openKeys"
        :expand-on-click-node="false"
        style="padding: 5px 0"
      >
        <template #default="{ node, data }">
          <div class="action-group">
            <div
              class="action-text"
              :class="{
                actived: data.id == selectId,
                'node-text': data.parentId !== 0,
              }"
              :style="{ width: (4 - data.lv) * 18 + 150 + 'px' }"
            >
              {{ data.roleName }}
            </div>
          </div>
        </template>
      </el-tree>
    </el-scrollbar>
  </div>
</template>

<script>
export default {
  props: {
    onChange: {
      type: Function,
      default: (treeId) => {},
    },
  },
  data() {
    return {
      selectId: -1,
      checked: false,
      openKeys: [],
      data: [],
      tree: [],
    };
  },
  created() {
    this.load();
  },
  methods: {
    load() {
      this.http.post("/api/role/getUserChildRoles", {}, true).then((result) => {
        if (!result.status) return this.$message.error(result.message);
        this.data.splice(0);
        this.data = result.data;
        this.data.forEach((x) => {
          if (x.parentId == 0) {
            x.lv = 1;
            x.children = [];
            this.tree.push(x);
            this.getTree(x.id, x);
          }
        });
        this.openKeys.push(this.tree[0].id);
        this.selectId = this.openKeys[0];
        //默认加载第一个树形菜单下面的数据
        this.$store.getters.data().treeDemo1.treeId = this.selectId;
        this.onChange(this.selectId);
      });
    },
    getTree(id, data) {
      this.data.forEach((x) => {
        if (x.parentId == id) {
          x.lv = data.lv + 1;
          if (!data.children) data.children = [];
          data.children.push(x);
          this.getTree(x.id, x);
        }
      });
    },
    nodeClick(node, selected) {
      console.log(node);
      this.selectId = node.id;
      //缓存当前选中的节点
      this.$store.getters.data().treeDemo1.treeId = node.id;
      this.onChange(node.id);
    },
  },
};
</script>
<style lang="less" scoped>
.com-el-tree {
  display: inline-block;
  width: 210px;
  .el-role-tree {
    position: absolute;
    padding: 5px 0px;
    top: 45px;
    bottom: 0;
    border-right: 1px solid #eee;
  }
  .actived {
    color: #5884ff;
    font-size: 15px;
  }
  .action-text {
    font-size: 14px;
  }
}
.role-list {
  color: white;
  line-height: 44px;
  background: #1a89ff;
  padding: 0 13px;
  font-size: 16px;
  position: absolute;
  top: 2px;
  width: 210px;
}
.m-title {
  line-height: 40px;
  font-size: 15px;
  background: #66b1ff0f;
  font-weight: bold;
  padding: 6px 16px;
    border: 1px solid #ececec;
  i {
    padding-right: 5px;
  }
}
.com-el-tree ::v-deep(.el-tree-node) {
  padding: 3px 0;
}
.com-el-tree ::v-deep(.el-scrollbar .el-scrollbar__thumb) {
  width: 0 !important;
}
</style>
