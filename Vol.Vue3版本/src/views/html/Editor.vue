<template>
    <div class="editor-example">
    <el-alert type="info" show-icon  style="margin-bottom: 15px;" :closable="false" title="编辑器使用">
        <p>编辑器集成的是wangeditor,框架只做了一个基本功能集成</p>
        框架代码生成器默认集成了编辑器,代码生成器里面编辑类型选择editor即可自动生成,更多功能：<a href="https://www.wangeditor.com/" target="_blank">查看wangeditor文档</a>
    </el-alert>
    <vol-wang-editor v-model="content" :height="350" url="api/App_Expert/Upload"></vol-wang-editor>
    </div>
</template>

<script>
import VolWangEditor from '@/components/editor/VolWangEditor.vue'
import {ref,defineComponent} from 'vue'
export default defineComponent({
   components:{
       'vol-wang-editor':VolWangEditor
   },
   setup(props) {
       const content=ref('请输入。。。。');
       return {content}
   }
})
</script>
<style lang="less" scoped>
.editor-example{
    padding: 25px;
}
</style> 