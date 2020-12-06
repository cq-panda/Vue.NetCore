<template>
  <div class="doc">
    <h3>H5 VolTable组件参数配置</h3>
    <div style="font-size: 12px;
    padding: 0 10px;
    margin: 0 10px;">具体使用见App_TransactionAvgPrice.vue,App_Appointment.vue页面 </div>
    <h4>props属性</h4>
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
    <h4>columns属性</h4>
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
      props: [{ name: "cellOverflowHidden", type: "bool", desc: "单元格超出部分是否隐藏" },
      { name: "height", type: "number", desc: "table高度（默认页面高度-90）" },
      { name: "rowClick", type: "function", desc: "行点击事件" },
      { name: "url", type: "string", desc: "后台的url地址" },
      { name: "columns", type: "Array", desc: "table配置,见下面columns配置" },
      ],
      columns: [{ name: "field", type: "string", desc: "字段" },
      { name: "title", type: "string", desc: "列名" },
      { name: "hidden", type: "bool", desc: "是否显示(默认true)" },
      {
        name: "bind", type: "json", desc: `<p>数据源绑定(与PC的操作一样)</p>
        <p>{ </p>
            <p> &nbsp; &nbsp; key:"",//字典编号 </p>
            <p>  &nbsp; &nbsp;&nbsp;type:"",//标签类型 </p>
                <p>// 可选bool,switch,select,selectList</p>
           
            <p> &nbsp;&nbsp;&nbsp;  data:[],//数据源,设置了字段编后，组件自动绑定 </p>
        },</p>
      ` },
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
