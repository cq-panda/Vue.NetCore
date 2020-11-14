<template>
  <div class="doc">
    <h3>H5 VolForm组件参数配置</h3>
    <div style="font-size: 12px;
    padding: 0 10px;
    margin: 0 10px;">具体使用见App_TransactionAvgPrice.vue,App_Appointment.vue页面 </div>
    <h4>props属性(options)</h4>
    <div class="table-props">
      <div class="header item">
        <div class="name">属性</div>
        <div class="desc">描述</div>
        <div class="type">类型</div>
      </div>
      <div class="item"
           v-for="(item) in props"
           :key="item.name">
        <div class="name">{{item.name}}</div>
        <div class="desc">{{item.desc}}</div>
        <div class="type">{{item.type}}</div>
      </div>
    </div>
    <h4>props属性(fields)</h4>
    <div class="table-props">
      <div class="header item">
        <div class="name">属性</div>
        <div class="desc">描述</div>
        <div class="type">类型</div>
      </div>
      <div class="item"
           v-for="(item) in columns"
           :key="item.name">
        <div class="name">{{item.name}}</div>
        <div class="desc"
             v-html="item.desc"></div>
        <div class="type">{{item.type}}</div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data () {
    return {
      props: [
        { name: "field", type: "string", desc: "字段" },
        { name: "name", type: "string", desc: "字段名称 " },
        { name: "type", type: "字段类型", desc: "可选string,select,selectList,bool,switch,date,datetime" },

        { name: "key", type: "string", desc: "字典编号(与PC的操作一样)" },
        { name: "data", type: "Array", desc: "数据源,设置了字典编号后，组件自动绑定" },
      ],
      columns: [{ name: "fields", type: "json", desc: "fields设置必须包括options中field属性,见demo使用" }
      ]
    }
  }
}
</script>
<style lang="less" scoped>
.h3 {
  font-weight: 500;
  font-size: 15px;
}
h3,
h4 {
  padding: 0 15px;
}
h4 {
  font-weight: 500;
  margin-bottom: 8px;
}
.table-props {
  .header {
    background: #efefef;
  }
  .item {
    display: flex;
    border-bottom: 1px solid #eee;
    > div {
      padding: 0.9rem 0.6rem;
      font-size: 0.8rem;
      word-break: break-all;
    }
    .desc {
      flex: 1;
    }
    .name {
      width: 4rem;
    }
    .type {
      width: 3rem;
    }
  }
}
</style>
<style scoped>
@media screen and (min-width: 600px) {
  .doc {
    position: absolute;
    height: 100%;
    width: 700px;
    left: 0;
    right: 0;
    margin: 0 auto;
  }
  .name {
    width: 140px !important;
  }
}
</style>
