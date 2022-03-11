<template>
  <div class="vol-el-menu">
    <el-menu
      close="vol-el-menu--vertical"
      :unique-opened="true"
      @select="select"
      :collapse="isCollapse"
     active-text-color="#ffff"
      @open="handleOpen"
      @close="handleClose"
    >
      <template v-for="item in convertTree(list)">
        <el-submenu
          :key="item.id"
          :index="'' + item.id"
          v-if="item.children.length && (!enable || item.enable == 1)"
        >
          <template #title>
            <i :class="item.icon"></i>
            <span> {{ item.name }}</span>
          </template>
          <vol-element-menu-child
            :enable="enable"
            :list="item.children"
          ></vol-element-menu-child>
        </el-submenu>
        <template v-else>
          <el-menu-item
            class="menu-item-lv1"
            v-if="!enable || item.enable == 1"
            :key="item.id"
            :index="'' + item.id"
          >
            <i :class="item.icon"></i>
            <span> {{ item.name }}</span>
          </el-menu-item>
        </template>
      </template>
    </el-menu>
  </div>
</template>

<script>
import VolElementMenuChild from "./VolElementMenuChild";
import { useRouter } from "vue-router";

import {
  defineComponent,
  // reactive,
  // watch,
  // ref,
  // toRef,
  // toRefs,
  // onMounted,
} from "vue";
export default defineComponent({
  components: {
    "vol-element-menu-child": VolElementMenuChild,
  },
  props: {
    enable: {
      type: Boolean,
      default: false, //是否判断enable=1
    },
    isCollapse: {
      type: Boolean,
      default: false,
    },
    onSelect: {
      type: Function,
      default: (x) => {},
    },
    openSelect: {
      //打开的时候是否触发选中事件
      type: Boolean,
      default: true,
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
  setup(props) {
    // const { list } = toRefs(props);
    //  const treeList = ref([]);
    const getTree = (id, node, data) => {
      if (!node.children) {
        node.children = [];
      }
      data.forEach((x) => {
        if (x.parentId == id && !node.children.some((c) => c.id === x.id)) {
          node.children.push(x);
          getTree(x.id, x, data);
        }
      });
    };
    let rootTreeId = !isNaN(props.rootId) ? ~~props.rootId : props.rootId;
    props.list.forEach((x) => {
      if (!x.icon || x.icon.substring(0, 3) != "el-") {
        x.icon = "el-icon-menu";
      }
      x.children = [];
      x.isRoot = x.parentId === rootTreeId;
    });
    const convertTree = (data) => {
      var root_data = [];
      data.forEach((x) => {
        if (x.parentId === rootTreeId) {
          if (!x.hasOwnProperty("enable")) x.enable = 1;
          root_data.push(x);
          getTree(x.id, x, data);
        }
      });
      return root_data;
    };
    // watch(
    //   () => props.list,
    //   (newVal, oldVal) => {
    //     treeList.value = convertTree(JSON.parse(JSON.stringify(newVal)));
    //   }
    //   // ,
    //   // {
    //   //   deep: true,
    //   // }
    // );
    // treeList.value = convertTree(JSON.parse(JSON.stringify(props.list)));
    const router = useRouter();
    const select = (index, path) => {
      let _item = props.list.find((x) => {
        return x.id == index;
      });
      props.onSelect(index, _item);
      router.push({ path: _item.path || "" });
    };

    const handleOpen = (index, path) => {
      if (props.openSelect) {
        select(index, path);
      }
    };
    const handleClose = () => {};
    return {
      // treeList,
      // list,
      select,
      convertTree,
      handleOpen,
      handleClose,
    };
  },
});
</script>
<style scoped>
.vol-el-menu {
  box-sizing: content-box;
  width: 100%;
}
</style>

