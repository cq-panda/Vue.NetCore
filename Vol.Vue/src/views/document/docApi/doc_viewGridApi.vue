<template>
  <div>
    <div class="i-text">
      <h2>关于ViewGird组件</h2>
    </div>
    <Alert type="warning">
      <template slot="desc">
        <p>1、ViewGird组件也是前端框架的核心，所有由代码生成的页面的基础功能全部依赖此组件，也可以单独使用此组件。</p>
        <p>2、组件默认包括(单表、主从表)：查询、添加、修改、删除、导入、导出、审核功能</p>
        <p>3、组件支持方法与属性扩展,如：动态按钮、动态控制table列显示、表单动态显示、弹出框动态控制、现有事件进行拦截等，更支持对此组件进行其他组件扩展，组件扩展可实现任何自己想写的代码，具体用法与扩展操作与代码生成后的页面操作相同。</p>
        <p>4、如果需要一对多或多对多表单等操作，在ViewGrid提供的位置进行扩展组件编写即可。</p>
      </template>
    </Alert>
    <div class="i-text">
      <h2>组件结构图</h2>
    </div>
    <pre class="bg-ms">
        <code>
        还没画好;
        </code>
    </pre>
    <!-- ViewGird使用方法 -->
    <DocViewGird></DocViewGird>
    <br />
    <br />

    <docParamTable name="viewGrid">
      <div style="padding: 10px;background: #cfeaff;">
        <div>代码一共有4个文件(都在./doc_viewGrid/文件夹中):</div>
        <div>1、doc_viewGird.vue组件基础配置，doc_viewGirdExtension.js组件扩展(扩展全靠这个文件)，这两个文件必需有,并且都可以由代码生成器完成，不需要写任何代码。</div>
        <div>2、doc_viewGirdHeader.vu、doc_viewGirdModelBody.vue为自定义的扩展组件(实际有6个，可自行选择扩展某个或多个)，如果不需要组件扩展，可以不用加扩展的vue组件</div>
        <div>3、此处api提共的文件代码量较多，因为里面写了大量扩展方法与属性，如果想看主从表没有扩展过的代码，可参照:Sys_Dictionary.vue与Sys_Dictionary.js</div>
      </div>
    </docParamTable>
  </div>
</template>

<script>
import DocViewGird from "./doc_viewGrid/doc_viewGird.vue";
import docParamTable from "./doc_ParamTable.vue";
export default {
  components: { DocViewGird, docParamTable }
};
</script>