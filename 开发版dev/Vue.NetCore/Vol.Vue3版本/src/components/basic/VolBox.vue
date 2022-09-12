<template>
  <el-dialog
    custom-class="v-dialog"
    v-model="vmodel"
    :top="top"
    :close-on-click-modal="false"
    :close-on-press-escape="false"
    :width="width"
    :draggable="draggable"
    :modal="modal"
    :before-close="handleClose"
  >
    <template #header> <i :class="icon"></i> {{ title }} </template>
    <div class="dia-content" :style="{ height: contentHeight + 'px' }">
      <el-scrollbar style="flex: 1">
        <!-- 是否开启懒加载2020.12.06 -->
        <div
          v-if="inited"
          class="srcoll-content"
          :style="{ padding: padding + 'px' }"
        >
          <slot name="content"></slot>
          <slot></slot>
        </div>
      </el-scrollbar>
      <div class="dia-footer">
        <slot name="footer"></slot>
        <el-button
          type="primary"
          v-if="!footer"
          size="mini"
          @click="handleClose()"
          ><i class="el-icon-close"></i>关闭</el-button
        >
      </div>
    </div>
  </el-dialog>
</template>

<script>
import { defineComponent, ref, watch, watchEffect } from 'vue';

export default defineComponent({
  props: {
    modelValue: false,
    lazy: {
      //是否开启懒加载2020.12.06
      type: Boolean,
      default: false
    },
    icon: {
      type: String,
      default: 'el-icon-warning-outline'
    },
    title: {
      type: String,
      default: '基本信息'
    },
    height: {
      type: Number,
      default: 200
    },
    width: {
      type: Number,
      default: 650
    },
    padding: {
      type: Number,
      default: 16
    },
    modal: {  //是否需要遮罩层
      type: Boolean,
      default: true
    },
    draggable: {  //启用可拖拽功能	
      type: Boolean,
      default: false
    },
    mask: {
      type: Boolean,
      default: true
    },
    onModelClose: {
      //2021.07.11增加弹出框关闭事件
      type: Function,
      default: (iconClick) => {
        return true;
      }
    }

  },
  setup(props, context) {
    const clientHeight = document.body.clientHeight;
    const inited = ref(true);
    const vmodel = ref(false);
    const footer = ref(false);
    const top = ref(100);
    vmodel.value = props.modelValue;
    footer.value = !!context.slots.footer;
    const contentHeight = ref(200);
    contentHeight.value = props.height;
    const handleClose = (done, iconClose) => {
      let result = props.onModelClose(!!iconClose);
      if (result === false) return;
      vmodel.value = false;
      context.emit('update:modelValue', false);
      done && done();
    };
    const calcHeight = (val) => {
      if (props.height > clientHeight) {
        contentHeight.value = clientHeight - 56;
        return clientHeight / -2 + 'px';
      }
      contentHeight.value = val || props.height;
      return (props.height + 56) / -2 + 'px';
    };

    top.value = calcHeight();
    watch(
      () => props.modelValue,
      (newVal, oldVal) => {
        vmodel.value = newVal;
      }
    );
    watch(
      () => props.height,
      (newVal, oldVal) => {
        top.value = calcHeight();
      }
    );
    return {
      handleClose,
      inited,
      vmodel,
      footer,
      top,
      calcHeight,
      contentHeight
    };
  }
});
</script>

<style lang="less" scoped>
.dia-content {
  display: flex;
  flex-direction: column;
  .dia-footer {
    min-height: 40px;
    width: 100%;
    border-top: 1px solid #e2e2e2;
    text-align: right;
    padding: 6px 8px;
  }
}
</style>
