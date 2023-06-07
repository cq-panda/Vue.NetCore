<template>
  <div class="message-container">
    <div class="item" v-for="(item, index) in list" :key="index">
      <div class="title">{{ item.title }}({{ item.date }})</div>
      <div class="content">{{ item.message }}</div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    list: {
      type: Array,
      default: () => {
        return [];
      }
    }
  },
  created() {
    if (!this.list.length) {
      this.list.push({
        title: '消息测试标题',
        message: '消息测试内容消息测试内容消息测试内容消息测试内容',
        date: '2022-05-02 03:10'
      });
    }
  }
};
</script>
<style scoped lang="less">
.message-container {
  .title {
    padding-bottom: 10px;
  }
  .item {
    border-bottom: 1px solid #eee;
    padding: 10px 20px;
  }
  .content {
    color: #7e7e7e;
    font-size: 13px;
  }
}
</style>
