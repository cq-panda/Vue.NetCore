<template>
  <div class="vol-menu-filter" v-if="$global.navSearch">
    <el-select
      placement="bottom"
      v-model="searchValue"
      clearable
      filterable
      remote
      reserve-keyword
      style="width: 140px; margin-right: 15px"
      :placeholder="$ts('搜索') + '...'"
      :remote-method="remoteMethod"
      @change="selectChange"
    >
      <template #prefix><i class="el-icon-search"></i></template>
      <el-option
        v-for="item in menuData"
        :key="item.id"
        :label="item.name"
        :value="item.id"
      />
    </el-select>
  </div>
</template>
<script setup>
import {
  defineComponent,
  reactive,
  watch,
  ref,
  toRef,
  toRefs,
  computed,
  getCurrentInstance,
  
  // onMounted,
} from "vue";
import store from "@/store/index.js";
import { useRouter } from "vue-router";
const router = useRouter();
const props = defineProps({
  onSelect: {
    type: Function,
    default: (x) => {},
  },
});

const searchValue = ref("");
const remoteMethod = (query) => {
  if (!query) {
    return [];
  }
  menuData.value = store.state.permission.filter((x) => {
    return (
      x.enable == 1 &&
      x.name.indexOf(query) != -1 &&
      !store.state.permission.some((c) => {
        return c.parentId === x.id && x.id;
      })
    );
  });
};
const menuData = ref([]);

const selectChange = (id) => {
  let _item = store.state.permission.find((c) => {
    return c.id == id;
  });
  if (!_item) {
    return;
  }

  if (_item.linkType == 1) {
    window.open(_item.url || _item.path, "_blank");
    return;
  }
  const item = _item;

  props.onSelect(_item.id, _item);
  router.push({ path: _item.path || "", query: _item.query });
};
</script>
<style lang="less" scoped>
.vol-menu-filter {
  height: 60px;
  align-items: center;
  display: flex;
  ::v-deep(.el-select__wrapper) {
    border-radius: 15px !important;
  }
}
</style>
