<template>
  <component :is="disPlayComponent" class="vol-el-menu-item" :class="{ 'menu-item-lv1': hasChild }">
    <i v-if="!hasChild" class="menu-icon" :class="item.icon"></i>
    <template #title>
      <i v-if="hasChild" class="menu-icon" :class="item.icon"></i>
      <span> {{ item.name }}</span>
    </template>
    <template v-if="hasChild">
      <template v-for="cItem in item.children">
        <vol-element-menu-child v-if="!enable || cItem.enable == 1" :enable="enable" :list="cItem.children"
          :item="cItem" :key="cItem.id" :index="`${cItem.id}`" />
      </template>
    </template>
  </component>
</template>

<script setup>
import { computed, onMounted } from 'vue';
import { ElSubMenu, ElMenuItem } from 'element-plus';

const props = defineProps({
  item: {
    type: Object,
    default: () => { },
  },
  enable: {
    type: Boolean,
    default: false, //是否判断enable=1
  },
})

onMounted(() => {
  console.log('VolElementMenuChild mounted', props.item);
})

const hasChild = computed(() => props.item.children?.length)

const disPlayComponent = computed(() => hasChild.value ? ElSubMenu : ElMenuItem);
</script>

<style scoped lang="less">
.vol-el-menu-item :deep(.el-menu-item) {
  height: 42px !important;
  line-height: 42px !important;
}

.menu-icon {
  font-size: 18px;
  margin-right: 6px;
}
</style>
