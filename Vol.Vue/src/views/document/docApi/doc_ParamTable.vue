<template>
  <div>
    <div class="i-text">
      <h2>{{ isAttr?'方法':"属性"}}</h2>
    </div>
    <table v-if="isAttr">
      <thead>
        <tr>
          <td>属性</td>
          <td>说明</td>
          <td>类型</td>
          <td>默认值</td>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(item,index) in data" :key="index">
          <td>{{item.name}}</td>
          <td>{{item.type}}</td>
          <td>{{item.defalut}}</td>
        </tr>
      </tbody>
    </table>
    <table v-else>
      <thead>
        <tr>
          <td>方法名</td>
          <td>说明</td>
          <td>参数</td>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(item,index) in data" :key="index">
          <td>{{item.name}}</td>
          <td>{{item.desc}}</td>
          <td>{{item.param}}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>
<script>
export default {
  props: {
    isAttr: {
      type: Boolean,
      default: true
    },
    data: {
      type: Array,
      default: () => {
        return [];
      }
    }
  }
};
</script>
<style scoped>
table {
  width: 100%;
  font-family: Consolas, Menlo, Courier, monospace;
  font-size: 12px;
  border-collapse: collapse;
  border-spacing: 0;
  empty-cells: show;
  border: 1px solid #e9e9e9;
  width: 100%;
  margin-bottom: 24px;
}
td {
  border: 1px solid #e9e9e9;
  padding: 8px 16px;
  text-align: left;
}
thead td {
    background: #f7f7f7;
    white-space: nowrap;
    color: #5c6b77;
    font-weight: 600;
}
.i-text{
      margin-bottom: 15px;
}
.i-text h2 {
    font-size: 20px;
    font-weight: 400;
}
</style>