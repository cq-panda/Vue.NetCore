<template>
  <van-nav-bar class="v-nav-bar"
               style="border-bottom: 1px solid #f1f1f1;"
               v-if="back"
               :title="title"
               left-arrow
               @click-left="_back"
               @click-right="onClickRight"
               :right-text="rightText">
    <template #right>
      <van-icon name="search"
                size="16" />
    </template>
  </van-nav-bar>
  <van-nav-bar style="border-bottom: 1px solid #f1f1f1;"
               v-else
               :title="title" />
</template>
<script>
import { NavBar, Icon } from "vant";
export default {
  props: {
    back: {
      type: Boolean,
      default: true
    },
    title: "",
    rightText: "",
    backPath: {
      type: String,
      default: ""
    },
    rightClick: {
      type: Function,
      default: () => {
        return;
      }
    }
  },
  components: {
    "van-nav-bar": NavBar,
    "van-icon": Icon
  },
  data () {
    return {
      a: 1
    };
  },
  methods: {
    _back () {
      if (this.backPath) {
        return this.$router.push({ path: this.backPath });
      }
      this.$router.go(this.backPath || -1);
    },
    onClickRight () {
      this.rightClick();
    }
  }
};
</script>
<style scoped>
.nav-bar {
  background: #2b73f7;
}
.nav-bar >>> * {
  color: white;
}
</style>
