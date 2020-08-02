<template >
  <div style="height:100%;">
    <vol-header title="统计"></vol-header>
  </div>
</template>
<script>
import { Tabbar, TabbarItem } from "vant";
import VolHeader from "@/components/VolHeader.vue";
export default {
  components: {
    "van-tabbar": Tabbar,
    "van-tabbar-item": TabbarItem,
    "vol-header": VolHeader
  },
  data() {
    return {};
  },
  methods: {},
  created() {}
};
</script>
<style lang="less" scoped>
.vol-tabbar {
  position: absolute;
  bottom: 0;
  width: 100%;
}
</style>
