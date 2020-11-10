<template>
  <div>
    <vol-header :back="false"
                title="菜单"></vol-header>

    <div class="sd-menu-container">
      <van-sidebar class="sd-menu-item"
                   v-model="activeKey"
                   @change="onChange">
        <van-sidebar-item v-for="(rootItem,roo_index) in rootMenu"
                          :title="rootItem.name"
                          :key="roo_index" />

      </van-sidebar>

      <ul class="sd-menu-list">
        <li @click="to(item)"
            v-for="(item,index) in childrenMenu"
            :key="index">
          <div class="l-icon"
               :style="{background:getColor()}"><span>{{item.name.substring(0,1)}}</span></div>
          <div class="text"> {{item.name}}</div>
          <div class="r-icon">
            <van-icon name="arrow" />
          </div>
        </li>
      </ul>
    </div>
  </div>
</template>
<script>
import { Grid, GridItem, Icon, Sidebar, SidebarItem } from "vant";
import VolHeader from "@/components/VolHeader.vue";
export default {
  components: {
    "van-grid": Grid,
    "vol-header": VolHeader,
    "van-grid-item": GridItem,
    "van-icon": Icon,
    "van-sidebar": Sidebar,
    "van-sidebar-item": SidebarItem
  },
  data () {
    return {
      colors: ["#1ab8ff", "#e91e63", "#00dc09", "#607D8B", "#FF5722", "#ed9efb"],
      activeKey: -1,
      menuList: [],
      menuChildren: []
    };
  },
  computed: {
    rootMenu () {
      return this.menuList.filter(x => {
        return x.parentId == 0;
      })
    },
    childrenMenu () {
      if (this.activeKey == -1) {
        return [];
      }
      var id = this.rootMenu[this.activeKey].id;
      return this.menuList.filter(x => {
        return x.parentId == id;
      })
    }
  },
  methods: {
    getColor () {
      return this.colors[Math.floor(Math.random() * (6 - 1)) + 1];
    },
    onChange (index) {
    },
    to (item) {
      this.$router.push({ path: item.url });
    }
  },
  created () {
    this.http.post("/api/menu/getTreeMenu", {}, true).then(x => {
      this.$store.dispatch("setPermission", x);
      this.menuList.push(...x);
      this.activeKey = 0;
    });
  }
};
</script>

<style lang="less" scoped>
.sd-menu-container {
  height: calc(100vh - 100px);
  overflow: scroll;
  display: flex;
  .sd-menu-list {
    flex: 1;
    display: inline-block;
    li {
      padding: 15px 20px;
      border-bottom: 1px solid #f2f3f5;
      box-sizing: border-box;
      font-size: 13px;
      display: flex;
      .text {
        flex: 1;
      }
      .l-icon {
        //   background: #e91e63;
        /* position: absolute; */
        margin-right: 8px;
        font-size: 12px;
        color: white;
        line-height: 25px;
        width: 25px;
        text-align: center;
        border-radius: 50%;
        margin-top: -3px;
      }
      .r-icon {
        padding-top: 2px;
      }
    }
  }
}
</style>
<style scoped>
.sd-menu-item >>> .van-sidebar-item__text {
  display: block;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
  font-size: 13px;
}
.sd-menu-item >>> .van-sidebar-item {
  padding: 15px 10px;
}
</style>
