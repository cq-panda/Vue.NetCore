<template>
  <div class="vol-el-menu-item">
    <template v-for="(item, index) of list">
      <el-menu-item :key="index"
                    :index="''+item.id"
                    v-if="!item.children.length&&item.enable==1">
        <!-- <Icon :type="item.icon" /> -->
        <span slot="title"> {{ item.name }}</span>
      </el-menu-item>
      <el-submenu :key="index"
                  :index="''+item.id"
                  v-if="item.children.length&&item.enable==1">
        <template slot="title">
          <!-- <Icon :type="item.icon||'ios-aperture'" /> -->
          <span> {{ item.name }}</span>
        </template>
        <vol-element-menu-child :list="item.children" />
      </el-submenu>
    </template>
    <!-- <vol-element-menu-child :list="item.children" /> -->
  </div>
</template>

<script>
export default {
  name: 'vol-element-menu-child',
  props: {
    list: Array
  },
}
</script>
<style scoped>
.vol-el-menu-item >>> .el-menu-item {
  height: 42px !important;
  line-height: 42px !important;
}
</style>



