<template>
  <div>
    <vol-header :back="false" title="菜单"></vol-header>
    <van-grid square :column-num="4">
      <van-grid-item
        :to="item.path"
        class="menu-grid-item"
        v-for="(item,index) in menuList"
        :key="index"
      >
        <img src="https://img.yzcdn.cn/vant/share-icon-wechat.png" style="width:40px;" />
        <div class="text">{{item.name}}</div>
      </van-grid-item>
    </van-grid>
  </div>
</template>
<script>
import { Grid, GridItem } from "vant";
import VolHeader from "@/components/VolHeader.vue";
export default {
  components: {
    "van-grid": Grid,
    "vol-header": VolHeader,
    "van-grid-item": GridItem
  },
  data() {
    return {
      menuList: []
    };
  },
  created() {
    this.http.post("/api/menu/getTreeMenu", {}, true).then(x => {
      this.$store.dispatch("setPermission", x);
      let menu = x.filter(d => {
        return d.parentId === 0;
      });
      if (!menu || menu.length == 0) return;
      menu = menu.map(m => {
        return { name: m.name, id: m.id, icon: m.icon, path: "" };
      });
      this.menuList = menu;
    });
  }
};
</script>

<style lang="less" scoped>
.menu-grid-item {
  img {
    width: 60px;
  }
  .text {
    margin-top: 8px;
    color: #646566;
    font-size: 12px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
  }
}
</style>
