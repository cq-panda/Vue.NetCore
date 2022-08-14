<template>
  <div class="vol-title">
    <div class="vol-title-name" :style="{'padding-top':paddingTop+'px'}" style="display:flex;">
      <div class="as-boder"></div>
      <div class="text">{{ title }}</div>
    </div>
    <div style="flex: 1; padding-left: 0px"><slot></slot></div>
  </div>
</template>

<script>
export default {
  props: {
    paddingTop:0,
    text: {
      type: String,
      default: "标题",
    },
  },
};
</script>
<style lang="less" scoped>
.vol-title {
  display: flex;
  .text {
    font-size: 14px;
  }
  .as-boder {
    border-left: 8px solid #2196f3;
    border-radius: 4px;
    margin-right: 6px;
    height: 17px;
    margin-top: 2px;
  }
}
</style>