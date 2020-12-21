<template>
  <div class="vol-el-menu">
    <el-menu close="vol-el-menu--vertical"
             :unique-opened="true"
             @select="select"
             :collapse="isCollapse"
             @open="handleOpen"
             @close="handleClose">
      <template v-for="(item) in treeList">
        <el-submenu :key="item.id"
                    :index="''+item.id"
                    v-if="item.children.length">
          <template slot="title">
            <Icon :type="item.icon||'ios-aperture'" />
            <span slot="title"> {{ item.name }}</span>
          </template>
          <vol-element-menu-child :list="item.children"></vol-element-menu-child>

        </el-submenu>
        <template v-else>
          <el-menu-item class="menu-item-lv1"
                        :key="item.id"
                        :index="''+item.id">
            <Icon :type="item.icon||'ios-aperture'" />
            <span slot="title"> {{ item.name }}</span>
          </el-menu-item>
        </template>
      </template>

    </el-menu>

  </div>
</template>

<script>
import VolElementMenuChild from './VolElementMenuChild'
export default {
  components: {
    "vol-element-menu-child": VolElementMenuChild
  },
  props: {
    isCollapse: {
      type: Boolean,
      default: false
    },
    onSelect: {
      type: Function,
      default: x => {
        console.log(x);
      }
    },
    list: {
      type: Array,
      default: []
    }
  },
  data () {
    return {
      treeList: []
    }
  },
  created () {
    this.treeList = this.base.convertTree(this.list, () => { })
  },
  methods: {
    select (index, indexPath) {
      let _item = this.list.find(x => { return x.id == index });
      this.onSelect(index, _item);
      this.$router.push({ path: _item.path })
    },
    handleOpen () {

    },
    handleClose () { }
  }
}
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

