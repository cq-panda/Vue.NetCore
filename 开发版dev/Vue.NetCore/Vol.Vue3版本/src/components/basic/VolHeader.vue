<template>
  <div class="v-header">
    <div class="v-left-text">
      <!-- <i size="20" :class="icon" class="h-icon"/> -->
      <span>{{text}}</span>
    </div>
    <div class="content">
      <slot name="content"></slot>
    </div>
    <div class="v-right-content">
      <slot></slot>
    </div>
  </div>
</template>
<script>
export default {
  props: {
    icon: {
      type: String,
      default: ""
    },
    text: {
      type: String,
      default: "未定义名称"
    }
  }
};
</script>
<style lang="less" scoped>
.v-header {
  display: flex;
  border-bottom: 1px solid #dcdee2;
  .v-left-text {
    margin-top: 3px;
    padding-bottom: 6px;
    font-weight: bold;
    font-size: 15px;
    color: #484848;
    white-space: nowrap;
    border-bottom: 2px solid #676767;
    margin-bottom: -1px;
    letter-spacing: 1px;
    > span {
      position: relative;
      top: 2px;
    }
  }
  .content {
    line-height: 25px;
    padding-left: 10px;
    padding: 6px 0 0 10px;
  }
  .v-right-content {
    flex: 1;
        text-align: right;
  }
  .h-icon{
    position: relative;
    top: 2px;
    margin-right: 3px;
  }
}
</style>