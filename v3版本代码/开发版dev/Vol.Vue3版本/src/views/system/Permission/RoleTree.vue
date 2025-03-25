<template>
  <div class="com-el-tree">

      <div class="m-title"><i class="el-icon-warning-outline"></i>角色列表</div>

    <el-scrollbar style="height: 100%; width: 200px" class="el-role-tree">
      <el-tree
        :data="tree"
        @node-click="nodeClick"
        node-key="id"
        :default-expanded-keys="openKeys"
        :expand-on-click-node="false"
        style="padding: 5px 0; margin-right: 2px"
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
              <Icon
                v-if="data.parentId !== 0"
                :type="data.id == selectId ? 'ios-paper' : 'ios-paper-outline'"
              />
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
    // roles: {
    //   type: Object,
    //   default: () => {
    //     return [];
    //   }
    // },
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

        //this.onChange(this.selectId);
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
      //  console.log(node);
      this.selectId = node.id;
      //缓存当前选中的节点
      //  this.$store.getters.data().treeDemo1.treeId = node.id;
      this.onChange(node);
    },
  },
};
</script>
<style lang="less" scoped>
.com-el-tree {
  //2020.06.03增加左侧tree固定宽度
  width: 200px;
  display: flex;
  flex-direction: column;
  height: 100%;
  border-radius: 3px;
  background: white;
  .el-role-tree {
    flex: 1;
    // border-right: 1px solid #eee;
  }
  .actived {
  }
  .action-text {
    font-size: 14px;
  }
}
.role-list {
  color: white;
  line-height: 40px;
  padding: 0 13px;
  font-size: 16px;
  top: 2px;
  width: 200px;
}
.m-title {
  line-height: 30px;
  font-size: 15px;
  background: #66b1ff0f;
  font-weight: bold;
  padding: 6px 16px;
  border-bottom: 1px solid #eee;
  i {
    padding-right: 5px;
  }
}
.com-el-tree ::v-dee(.el-tree-node) {
  padding: 3px 0;
}
.com-el-tree ::v-dee(.el-scrollbar .el-scrollbar__thumb) {
  width: 0 !important;
}
</style>
<style scoped>

</style>
