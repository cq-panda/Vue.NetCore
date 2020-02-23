<template>
  <div>
    <div class="title">
      <h2>前端开发</h2>
    </div>
    <div class="d-content">
      <p class="desc">前端代码生成器创建的页面扩展及使用，参照[组件api]->[代码生成后页面viewGrid]</p>
      <p
        class="desc"
      >在扩展组件、方法可直接使用这些属性,前端扩展业务代码编写参照vue项目中extension->order->SellOrder.js文件,根据实际需要添加扩展方法</p>
    </div>
        <div class="title">
      <h2>编写第一个扩展方法</h2>
    </div>
    <div class="d-content">
      <p class="desc">整理中</p>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {};
  }
};
</script>
<style lang="less" scoped>
h2 {
  color: #00bcd4;
  font-weight: 500;
}
.d-content {
  margin-top: 10px;
  border: 1px dotted #dcd3d3;
  border-radius: 6px;
  padding: 15px;
  background: white;
  font-size: 14px;
  margin-bottom: 30px;
  box-shadow: 0 8px 12px #ebedf0;
  > p {
    padding: 5px 0;
  }
  > p:before {
    content: "";
    display: inline-block;
    width: 4px;
    height: 4px;
    border-radius: 50%;
    vertical-align: middle;
    background-color: #5e6d82;
    margin-right: 5px;
  }
}
.title h2:before {
  content: "";
  display: inline-block;
  width: 4px;
  height: 4px;
  border-radius: 50%;
  vertical-align: middle;
  background-color: #5e6d82;
  margin-right: 5px;
}
</style>