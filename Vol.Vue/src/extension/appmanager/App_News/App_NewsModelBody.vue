<template>
  <div class="v-kind">
    <div class="text">
      <label style="width: 100px;">发布内容：</label>
    </div>
    <div>
      <kind-editor
        ref="editor"
        :content.sync="$store.getters.getData().editor.currentRow.Content"
        height="360px"
      ></kind-editor>
    </div>
  </div>
</template>
<script>
import VolHeader from "@/components/basic/VolHeader.vue";
import KindEditor from "@/components/kindeditor/KindEditor.vue";
export default {
  components: {
    VolHeader,
    KindEditor: KindEditor
  },
  methods: {},
  mounted() {
    //第一次打开弹出框时，可以用子组件获取父组件的对象进行初始化(此处已使用vuex替代)
    // this.$emit("parentCall", $vue => {
    //     this.content = $vue.currentRow.Content;
    // });
  },
  data() {
    return {
    //  content:"" //文本编辑器内容
    };
  }
};
</script>
<style lang="less" scoped>
.v-kind {
  background: white;
  padding: 10px 18px;
  .text {
    padding-bottom: 8px;
    color: #939394;
  }
}
</style>