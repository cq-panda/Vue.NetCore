<template>
  <div>
      <div class="head"><Icon type="ios-arrow-back" />社圈</div>
      <div class="content">
           <Question></Question>
      </div>
  </div>
</template>

<script>
import question from "@/../src/components/Community/index.vue";
export default {
  components: { Question: question },
  data(){
      return {}
  }
}
</script>
<style lang="less" scoped>
.head{
    top: 0;
    position: fixed;
    background: #03A9F4;
    padding: 0.8rem;
    font-size: 1rem;
    color: white;
    width: 100%;
    z-index: 999;
}
.content{
    margin-top:50px;
}
</style>
