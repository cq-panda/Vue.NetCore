<template>
  <div class="com-el-tree">
    <div class="role-list">测试列表</div>
    <el-scrollbar style="height:100%;  width: 210px;" class="el-role-tree">
      <el-tree
        :data="tree"
        @node-click="nodeClick"
        node-key="id"
        :default-expanded-keys="openKeys"
        :expand-on-click-node="false"
        style="padding:5px 0;"
      >
        <div class="action-group" slot-scope="{ node, data }">
          <div
            class="action-text"
            :class="{actived:data.id==selectId,'node-text':data.parentId!==0}"
            :style="{width:((4-data.lv)*18+150)+'px'}"
          >
            <Icon
              v-if="data.parentId!==0"
              :type="data.id==selectId?'ios-radio-button-on':'ios-radio-button-off'"
            />
            {{ data.text }}
          </div>
        </div>
      </el-tree>
    </el-scrollbar>
  </div>
</template>

<script>
import options from "./tree_options";
export default {
  props: {
    onChange: {
      type: Function,
      default: treeId => {}
    }
  },
  data() {
    return {
      selectId: -1,
      checked: false,
      openKeys: [],
      tree: []
    };
  },
  created() {
    this.load();
  },
  methods: {
    load() {
      // this.tree = options.tree;
      options.tree.forEach(x => {
        if (x.parentId == 0) {
          x.lv = 1;
          x.children = [];
          this.tree.push(x);
          this.getTree(x.id, x);
        }
      });
      //设置默认打开的菜单
      this.openKeys.push(this.tree[0].id);

      this.selectId = this.openKeys[0];
      //默认加载第一个树形菜单下面的数据
      this.$store.getters.data().treeDemo2.treeId = this.selectId;
      this.$store.getters.data().treeDemo2.text=this.tree[0].text;
      this.onChange(this.selectId);
    },
    getTree(id, data) {
      options.tree.forEach(x => {
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
      this.$store.getters.data().treeDemo2.treeId = node.id;
       this.$store.getters.data().treeDemo2.text=node.text;
       //调用刷新table数据
      this.onChange(node.id);
    }
  }
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
</style>
<style scoped>
.com-el-tree >>> .el-tree-node {
  padding: 3px 0;
}
.com-el-tree >>> .el-scrollbar .el-scrollbar__thumb {
  width: 0 !important;
}
</style>
