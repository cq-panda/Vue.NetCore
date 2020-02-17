<template>
  <div>
    <div  class="i-text">
      <h2>
        <a @click="viewCode" v-show="!visibly" >查看代码</a>        <a v-show="visibly" @click="visibly=false">收起</a>
      </h2>
      <slot></slot>
      <div style="background: #eee;" v-show="visibly" v-html="code"></div>
      <h2>
        <a v-show="visibly" @click="visibly=false">收起</a>
      </h2>
    </div>
    <div >
      <div class="i-text">
        <h2>属性</h2>
      </div>
      <table v-if="param[name]&&param[name].attr">
        <thead>
          <tr>
            <td>属性</td>
            <td>说明</td>
            <td>类型</td>
            <td>默认值</td>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(item,index) in param[name].attr||[]" :key="index">
            <td>{{item.name}}</td>
            <td><div v-html="item.desc"></div></td>
            <td>{{item.type}}</td>
            <td>{{item.default}}</td>
          </tr>
        </tbody>
      </table>
      <div class="i-text">
        <h2>方法</h2>
      </div>
      <table>
        <thead>
          <tr>
            <td>方法名</td>
            <td>说明</td>
            <td>参数</td>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(item,index) in param[name].methods||[]" :key="index">
            <td>{{item.name}}</td>
            <td><div v-html="item.desc"></div></td>
            <td>{{item.param}}</td>
          </tr>
        </tbody>
      </table>
    </div>
    <br />
  </div>
</template>
<script>
import param from "./param";
import codeString from "./sourceCode";
export default {
  methods: {
    viewCode() {
      // if (this.visibly) {
      //   return;
      // }
      this.code = this.codeString[this.name];
      this.visibly = true;
    }
  },
  data() {
    return {
      onlyCode: false,
      code: "",
      visibly: false,
      param: param,
      codeString: codeString
    };
  },
  props: {
    name: "",
    isAttr: {
      type: Boolean,
      default: true
    },
    showCode:{
      type: Boolean,
      default: true
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
.i-text {
  margin-bottom: 15px;
}
.i-text h2 {
  font-size: 20px;
  font-weight: 400;
}
</style>