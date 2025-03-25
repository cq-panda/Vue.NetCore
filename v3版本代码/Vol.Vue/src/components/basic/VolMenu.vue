<template>
  <div class="menu-list">
    <vol-item-menu :onOpenChange="onOpenChange" :onSelect="onSelect" :trees="arrayToTree()" :theme="theme"></vol-item-menu>
  </div>
</template>
<script>
import VolItemMenu from "@/components/basic/VolItemMenu.vue";

export default {
  components: {
    VolItemMenu
  },
  props: {
    options: {
      type: Array,
      default: []
    },
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
  methods: {
    convertTree(root, source) {
      var subItems = source.filter(x => {
        return x.parentId == root.id;
      });
      if (subItems.length > 0) {
        root.children = [];
        root.children.push(...subItems);
        root.children.forEach(element => {
          this.convertTree(element, source);
        });
      }
    },
    arrayToTree() {
      // var menuData = [
      //   { id: 1, name: "iview组件", parentId: 0,icon:'ios-aperture' }
      // ];

      var basicRoot = this.options.filter(x => {
        return x.parentId == 0;
      });
      basicRoot.forEach(x => {
        return this.convertTree(x, this.options);
      });

      return basicRoot;
    }
  },
  data() {
    return {};
  }
};
</script>


