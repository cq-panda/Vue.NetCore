<template>
  <Menu
    :accordion="true"
    @on-open-change="menuOpenChange"
    @on-select="menuSelect"
    :active-name="activeId"
    :theme="theme"
    :open-names="[0]"
  >
    <vol-tree :treeData="trees"></vol-tree>
  </Menu>
</template>
<script>
export default {
  components: {
    VolTree: {
      name: "VolTree",
      template: `<div>
           <div  class="com-menu" v-for="(subItem,subIndex) in treeData">
            <MenuItem v-if="!subItem.children":to="subItem.to||''" :name="subItem.id">{{subItem.name}}</MenuItem>
            <Submenu v-else :name="subItem.id">
              <template slot="title">
                <Icon :type="subItem.icon||'ios-aperture'"/>{{subItem.name}}
              </template>
                <vol-tree :treeData="subItem.children" ></vol-tree>
            </Submenu>
           </div>
           </div>`,
      props: ["treeData"]
    }
  },
  props: {
    trees: { type: Array, default: [] },
    onSelect: {
      type: Function,
      default: x => {
        console.log(x);
      }
    },
    onOpenChange: {
      type: Function,
      default: x => {
        console.log(x);
      }
    },
    theme: { type: String, default: "light" /*light,dark */ }
  },
  render(createElement) {
    console.log(createElement);
  },
  data() {
    return {
      activeId: 0
    };
  },
  methods: {
    menuOpenChange(node) {
      if (node.length == 0) return;
      this.activeId =-999999;
      this.onOpenChange(node);
    },
    menuSelect(node) {
      this.onSelect(node);
    }
  }
};
</script>


