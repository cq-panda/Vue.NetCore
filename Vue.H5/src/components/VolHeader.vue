<template>
  <van-nav-bar
    class="v-nav-bar"
    v-if="back"
    :title="title"
    left-arrow
    @click-left="_back"
    @click-right="onClickRight"
    :right-text="rightText"
  />
  <van-nav-bar v-else :title="title" />
</template>
<script>
import { NavBar } from "vant";
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
    "van-nav-bar": NavBar
  },
  data() {
    return {
      a: 1
    };
  },
  methods: {
    _back() {
      if (this.backPath) {
        return this.$router.push({ path: this.backPath });
      }
      this.$router.go(this.backPath || -1);
    },
    onClickRight() {
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
