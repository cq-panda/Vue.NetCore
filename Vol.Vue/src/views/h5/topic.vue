<template>
  <div>
      <div class="head"><Icon type="ios-arrow-back" />话题</div>
      <div class="content">
           <Topic></Topic>
      </div>
  </div>
</template>

<script>
import Topic from "@/../src/components/Community/question.vue";
export default {
  components: { Topic: Topic },
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
    margin-top:60px;
}
</style>
