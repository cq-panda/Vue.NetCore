<template>
  <div class="vol-el-menu">
    <el-menu close="vol-el-menu--vertical"
             :unique-opened="true"
             @select="select"
             :collapse="isCollapse"
             @open="handleOpen"
             @close="handleClose">
      <template v-for="item in treeList">
        <el-submenu :key="item.id"
                    :index="'' + item.id"
                    v-if="item.children.length && item.enable == 1">
          <template slot="title">
            <Icon :type="item.icon || 'ios-aperture'" />
            <span slot="title"> {{ item.name }}</span>
          </template>
          <vol-element-menu-child :list="item.children"></vol-element-menu-child>
        </el-submenu>
        <template v-else>
          <el-menu-item class="menu-item-lv1"
                        v-if="item.enable == 1"
                        :key="item.id"
                        :index="'' + item.id">
            <Icon :type="item.icon || 'ios-aperture'" />
            <span slot="title"> {{ item.name }}</span>
          </el-menu-item>
        </template>
      </template>
    </el-menu>
  </div>
</template>

<script>
import VolElementMenuChild from "./VolElementMenuChild";
export default {
  components: {
    "vol-element-menu-child": VolElementMenuChild,
  },
  props: {
    isCollapse: {
      type: Boolean,
      default: false,
    },
    onSelect: {
      type: Function,
      default: (x) => {
        console.log(x);
      },
    },
    list: {
      type: Array,
      default: [],
    },
    rootId: {
      type: String,
      default: "0",
    },
  },
  data () {
    return {
      treeList: [],
    };
  },
  created () {
    this.treeList = this.convertTree(this.list);
  },
  methods: {
    convertTree (data) {
      var rootId = !isNaN(this.rootId) ? ~~this.rootId : this.rootId;
      var root_data = [];
      data.forEach((x) => {
        if (!x.children) x.children = [];
        if (x.parentId === rootId) {
          x.isRoot = true;
          if (!x.hasOwnProperty("enable")) x.enable = 1;
          root_data.push(x);
          this.getTree(x.id, x, data);
        }
      });
      return root_data;
    },
    getTree (id, node, data) {
      data.forEach((x) => {
        if (!x.hidden && x.parentId == id) {
          if (!node.children) node.children = [];
          node.children.push(x);
          this.getTree(x.id, x, data);
        }
      });
    },
    select (index, indexPath) {
      let _item = this.list.find((x) => {
        return x.id == index;
      });
      this.onSelect(index, _item);
      this.$router.push({ path: _item.path });
    },
    handleOpen () { },
    handleClose () { },
  },
};
</script>
<style scoped>
.vol-el-menu {
  box-sizing: content-box;
  width: 100%;
}
.vol-el-menu >>> .el-menu-item-group__title {
  padding: 0 !important;
}
.vol-el-menu >>> .horizontal-collapse-transition {
  transition: 0s width ease-in-out, 0s padding-left ease-in-out,
    0s padding-right ease-in-out;
}
</style>

