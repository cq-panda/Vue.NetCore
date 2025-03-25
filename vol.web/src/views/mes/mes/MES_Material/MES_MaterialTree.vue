<template>
  <div class="goods-tree">
    <!-- 左边树结构 -->
    <div class="tree-left">
      <div class="tree-left-title">物料分类</div>
      <el-scrollbar style="flex: 1; border-right: 1px solid #eee">
        <!-- el-tree文档https://element-plus.gitee.io/zh-CN/component/tree.html#%E6%96%B9%E6%B3%95 -->
        <el-tree
          ref="treeRef"
          highlight-current
          node-key="id"
          :default-expanded-keys="defaultExpandedKeys"
          :data="data"
          :props="defaultProps"
          :expand-on-click-node="false"
          @node-click="nodeClick"
        />
      </el-scrollbar>
    </div>
  </div>
</template>

<script setup>
const emit = defineEmits(['nodeClick'])
import { ref, reactive, getCurrentInstance, nextTick } from 'vue'
const { proxy } = getCurrentInstance()
const data = ref([])
const orginData = ref([]) //原始数据
const defaultProps = ref({
  children: 'children',
  label: 'name' //树形结构显示名称的字段
})
const defaultExpandedKeys = ref([]) //默认展开的tree节点

const treeRef = ref()
//节点点击事件
const nodeClick = (data) => {
  //左侧树点击事件
  let ids = []
  //获取分类的子节点
  //左边树节点的甩有子节点，用于查询数据
  getAllChildrenId(data, ids)
  //获取所有的父节点
  //左侧树选中节点的所有父节点,用于新建时设置级联的默认值
  let nodes = proxy.base.getTreeAllParent(data.id, orginData.value)
  //获取节点的id
  nodes = nodes.map((m) => {
    return m.id
  })
  emit('nodeClick', ids, nodes)
}
const getAllChildrenId = (data, ids) => {
  //获取分类的子节点
  ids.push(data.id)
  if (!data.children || !data.children.length) {
    return
  }
  data.children.forEach((x) => {
    ids.push(x.id)
    getAllChildrenId(x, ids)
  })
}

//从商品MES_MaterialCatalogController加载左边tree数据
proxy.http.get('api/MES_MaterialCatalog/getList').then((result) => {
  //记录原始数据
  orginData.value = result
  //将返回的数据递归转换为tree结构，文档：http://v2.volcore.xyz/document/vueDev【数组对象转换为tree】
  data.value = proxy.base.convertTree(result, (node, data, isRoot) => {})
  //商品分类有数据时加载右边商品信息
  if (data.value.length) {
    //默认展开经一个树节点
    defaultExpandedKeys.value = [data.value[0].id]
    nodeClick(data.value[0])
  }
})
</script>
<style lang="less" scoped>
.goods-tree {
  position: absolute;
  display: flex;
  height: 100%;
  width: 100%;
  .tree-left {
    display: flex;
    flex-direction: column;
    width: 200px;
    .tree-left-title {
      line-height: 25px;
      font-size: 13px;
      font-weight: bolder;;
      background: rgba(102, 177, 255, 0.058823529411764705);
      padding: 6px 16px;
      border: 1px solid #ececec;
    }
  }
  .tree-right {
    flex: 1;
    width: 0;
  }
}
</style>
