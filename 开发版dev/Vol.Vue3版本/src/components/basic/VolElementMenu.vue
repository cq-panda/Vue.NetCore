<template>
  <div class="vol-el-menu">
    <div class="menu-search" v-if="showSearch">
      <el-select placement="bottom" v-model="searchValue" clearable filterable remote reserve-keyword
        :placeholder="'请输入关键字搜索...'" :remote-method="remoteMethod" @change="selectChange" :loading="loading">
        <template #prefix><i class="el-icon-search"></i></template>
        <el-option v-for="item in options" :key="item.value" :label="item.label" :value="item.value" />
      </el-select>
    </div>
    <el-menu close="vol-el-menu--vertical" :default-openeds="openedIds" :default-active="defaultActive"
      :unique-opened="true" @select="select" :collapse="isCollapse" @open="handleOpen" @close="handleClose"
      @contextmenu.prevent="bindRightClickMenu">
      <template v-for="item in convertTree(list)">
        <el-sub-menu :key="item.id" :index="'' + item.id" v-if="item.children.length && (!enable || item.enable == 1)">
          <template #title>
            <i class="menu-icon" :class="item.icon"></i>
            <span> {{ item.name}}</span>
          </template>
          <vol-element-menu-child :enable="enable" :list="item.children"></vol-element-menu-child>
        </el-sub-menu>
        <template v-else>
          <el-menu-item class="menu-item-lv1" v-if="!enable || item.enable == 1" :key="item.id" :index="'' + item.id">
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
  reactive,
  watch,
  ref,
  toRef,
  toRefs,
  getCurrentInstance,
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
      default: (x) => { },
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
    currentMenuId: {
      type: Number,
      default: 0,
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
    const openedIds = reactive([props.currentMenuId]);
    const defaultActive = ref(props.currentMenuId + "");
    let _base = getCurrentInstance().appContext.config.globalProperties.base;
    watch(
      () => props.currentMenuId,
      (newVal, oldVal) => {
        defaultActive.value = newVal + "";
        openedIds.splice(0);
        openedIds.push(
          ..._base.getTreeAllParent(newVal, props.list).map((c) => {
            return c.id;
          })
        );
      }
    );
    const router = useRouter();
    let eventSelect = false;
    const select = (index, _item) => {

      _item = props.list.find((x) => {
        return x.id == index;
      });

      if (_item.linkType == 1) {
        window.open(_item.url || _item.path, '_blank')
        return;
      }
      if (eventSelect) {
        return;
      }
      eventSelect = true;
      setTimeout(() => {
        eventSelect = false;
      }, 20);



      props.onSelect(index, _item);
      router.push({ path: _item.path || "", query: _item.query });
    };

    const handleOpen = (index, path) => {
      if (props.openSelect) {
        select(index, path);
      }
    };
    const handleClose = () => { };

    /**
     * 菜单导航右键事件
     * @param {*} enable 是否启用右键事件[true:启用;false:禁用;]
     */
    const bindRightClickMenu = (enable) => {
      if (!enable) return;
    };
    const { proxy } = getCurrentInstance();
    const loading = ref(false)
    const searchValue = ref('');
    const options = ref([]);
    const remoteMethod = (query) => {
      if (!query) {
        options.value.length = 0;
        return;
      }
      options.value = props.list
        .filter(c => { return (c.enable == 1 || c.enable === undefined) && c.name.indexOf(query) != -1 && (!c.children || !c.children.length) })
        .map(x => { return { value: x.id, label: x.name } }).slice(0, 7)
    }
    const selectChange = (id) => {
      if (!id) {
        return;
      }
      let index = props.list.findIndex(c => { return c.id === id });
      if (index === -1) {
        return;
      }
      searchValue.value = "";
      if(proxy.list.some(c=>{return c.parentId===id})){
        return;
      }
      select(id, props.list[index]);
    }
 
    const showSearch=ref(proxy.$global.menuSearch===undefined||proxy.$global.menuSearch)
    return {
      // treeList,
      // list,
      select,
      convertTree,
      handleOpen,
      handleClose,
      bindRightClickMenu,
      openedIds,
      defaultActive,
      searchValue,
      options,
      remoteMethod,
      loading,
      selectChange,
      showSearch
    };
  },
});
</script>
<style lang="less" scoped>
.vol-el-menu {
  // box-sizing: content-box;
  width: 100%;

  .menu-icon {
    font-size: 18px;
    margin-right: 6px;
  }
}

.menu-search {
  padding: 6px 10px;

  ::v-deep(.el-input__wrapper) {
    border-radius: 15px !important;
  }
}
</style>
