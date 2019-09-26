<template>
  <div class="t-tree">
    <div class="custom-tree-container">
      <div class="block">
        <p>使用 scoped slot</p>
        <el-tree
          @check-change="leftCheckChange"
          :data="data"
          show-checkbox
          node-key="id"
          default-expand-all
          :expand-on-click-node="false"
        >
          <div class="action-group" slot-scope="{ node, data }">
            <div class="action-text" :style="{width:((4-data.lv)*18+300)+'px'}">{{ data.label }}</div>
            <div class="action-item">
              <el-checkbox
                v-for="item in data.actions"
                :key="item.value"
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
      checked: false,
      tree: [
        { id: 1, name: "广东", pid: 0 },
        { id: 2, name: "广州", pid: 1 },
        { id: 3, name: "天河", pid: 2 },
        { id: 4, name: "白云", pid: 2 },
        { id: 5, name: "广西", pid: 0 },
        { id: 6, name: "玉林", pid: 5 },
        { id: 7, name: "北流", pid: 6 },
        { id: 8, name: "深圳", pid: 1 },
        { id: 9, name: "东莞", pid: 1 },
        { id: 10, name: "松山湖", pid: 9 }
      ],
      tree: [
        {
          id: 1,
          label: "广东",
          actions: [{ text: "查询", value: "Search", checked: false }],
          pid: 0
        },
        {
          id: 2,
          label: "广州",
          actions: [{ text: "查询", value: "Search", checked: false }],
          pid: 1
        },
        {
          id: 3,
          label: "天河",
          actions: [{ text: "查询", value: "Search", checked: false }],
          pid: 2
        },
        {
          id: 4,
          label: "白云",
          actions: [{ text: "查询", value: "Search", checked: false }],
          pid: 2
        },
        {
          id: 5,
          label: "广西",
          actions: [{ text: "查询", value: "Search", checked: false }],
          pid: 0
        },
        {
          id: 6,
          label: "玉林",
          actions: [{ text: "查询", value: "Search", checked: false }],
          pid: 5
        },
        {
          id: 7,
          label: "北流",
          actions: [{ text: "查询", value: "Search", checked: false }],
          pid: 6
        },
        {
          id: 8,
          label: "深圳",
          actions: [{ text: "查询", value: "Search", checked: false }],
          pid: 1
        },
        {
          id: 9,
          label: "东莞",
          actions: [{ text: "查询", value: "Search", checked: false }],
          pid: 1
        },
        {
          id: 10,
          label: "松山湖",
          actions: [{ text: "查询", value: "Search", checked: false },
          { text: "导入", value: "Search", checked: true }],
          pid: 9
        }
      ],
      data: [
        // {
        //   id: 1,
        //   label: "一级 1",
        //   actions: [{ text: "查询", value: "Search", checked: false }],
        //   lv: 1,
        //   children: [
        //     {
        //       id: 4,
        //       label: "二级 1-1",
        //       actions: [{ text: "查询", value: "Search", checked: true }],
        //       lv: 2,
        //       children: [
        //         {
        //           id: 9,
        //           label: "三级 1-1-1",
        //           lv: 3,
        //           actions: [{ text: "查询", value: "Search", checked: false }]
        //         },
        //         {
        //           id: 10,
        //           label: "三级 1-1-2",
        //           lv: 3,
        //           actions: [{ text: "查询", value: "Search", checked: false }]
        //         }
        //       ]
        //     },
        //     {
        //       id: 10,
        //       label: "三级 1-1-2",
        //       lv: 2,
        //       actions: [
        //         { text: "查询", value: "Search", checked: false },
        //         { text: "导出", value: "Export", checked: false }
        //       ]
        //     }
        //   ]
        // }
      ]
    };
  },
  created() {
    let root = {
      id: 0,
      label: "树形菜单",
      lv: 0,
      actions: [{ text: "查询", value: "Search", checked: false }]
    };
    this.menuFn(0, root);
    this.data=root.children;
   // this.$set()
    console.log(root);
  },
  methods: {
    //https://www.cnblogs.com/vipsoft/p/4343493.html
    menuFn(id, data) {
      this.tree.forEach(x => {
        if (x.pid == id) {
          x.lv = data.lv + 1;
          if (!data.children) data.children = [];
          data.children.push(x);
          this.menuFn(x.id, x);
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
      this.$message("xxx");
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
  padding: 100px;
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
  width: 80px;
}
</style>
