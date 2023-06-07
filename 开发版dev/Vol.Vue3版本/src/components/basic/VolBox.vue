<template>
  <div class="vol-dialog">

    <el-dialog v-model="vmodel" :close-on-click-modal="false" :close-on-press-escape="false" :width="width"
      :fullscreen="fullscreen" :draggable="draggable" :modal="modal" :before-close="handleClose">
      <template #header>
        <i :class="icon"></i> {{ title }}
        <button class="el-dialog__headerbtn" type="button" style="right: 35px; color: var(--el-color-info)" @click="handleFullScreen">
          <i class="el-icon el-icon-full-screen"></i>
        </button>
      </template>
      <el-scrollbar :max-height="contentHeight">
        <div v-if="inited" style="min-height: 50px;" class="srcoll-content" :style="{ padding: padding + 'px' }">
          <slot name="content"></slot>
          <slot></slot>
        </div>
      </el-scrollbar>
      <template #footer>
        <div class="dia-footer" v-if="footer">
          <slot name="footer"></slot>
          <el-button type="primary" v-if="!footer" size="mini" @click="handleClose()"><i
              class="el-icon-close"></i>关闭</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script>
import { defineComponent, ref, watch, watchEffect } from 'vue';

export default defineComponent({
  props: {
    modelValue: false,
    lazy: {
      //是否开启懒加载2020.12.06
      type: Boolean,
      default: false,
    },
    icon: {
      type: String,
      default: "el-icon-warning-outline",
    },
    title: {
      type: String,
      default: "基本信息",
    },
    height: {
      type: Number,
      default: 200,
    },
    width: {
      type: Number,
      default: 650,
    },
    padding: {
      type: Number,
      default: 16,
    },
    modal: {
      //是否需要遮罩层
      type: Boolean,
      default: true,
    },
    draggable: {
      //启用可拖拽功能
      type: Boolean,
      default: false,
    },
    mask: {
      type: Boolean,
      default: true,
    },
    onModelClose: {
      //2021.07.11增加弹出框关闭事件
      type: Function,
      default: (iconClick) => {
        return true;        
      }
    },
    footer:{ //是否显示底部按钮
      type: Boolean,
      default: true
    }

  },
  setup(props, context) {
    const clientHeight = document.body.clientHeight * 0.95 - 60;
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
      context.emit("update:modelValue", false);
      done && done();
    };
    const calcHeight = (val) => {
    //  if (props.height > clientHeight) {
    //  if(true){
        contentHeight.value = clientHeight - 30;
        return clientHeight / -2 + 'px';
    //  }
      // contentHeight.value = val || props.height;
      // return (props.height + 56) / -2 + 'px';
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
    const fullscreen=ref(false);
    const handleFullScreen=()=> {
      fullscreen.value = !fullscreen.value;
      context.emit("fullscreen", fullscreen.value);
    }
    return {
      handleClose,
      inited,
      vmodel,
      footer,
      top,
      calcHeight,
      contentHeight,
      fullscreen,
      handleFullScreen
    };
  }
});
</script>

<style lang="less" scoped>
.dia-footer {
  text-align: right;
  width: 100%;
  border-top: 1px solid #e2e2e2;
  text-align: right;
  padding: 6px 8px;
}
</style>

<style scoped lang="less">
.vol-dialog ::v-deep(.el-overlay-dialog) {
  display: flex !important;
}

.vol-dialog ::v-deep(.el-dialog) {
  margin: auto;
}

.vol-dialog ::v-deep(.el-dialog) {
  border-top-left-radius: 4px;
  border-top-right-radius: 4px;
}

.vol-dialog ::v-deep(.el-dialog__header) {
  border-top-left-radius: 4px;
  border-top-right-radius: 4px;
  padding: 0px 13px;
  line-height: 53px;
  border-bottom: 1px solid #e6e6e6;
  height: 50px;
  color: rgb(79, 79, 79);
  font-weight: bold;
  font-size: 14px;
  margin: 0;
  // background-image: linear-gradient(135deg, #0cd7bd 10%, #50c3f7);
}

.vol-dialog ::v-deep(.el-dialog__footer),
.vol-dialog ::v-deep(.el-dialog__body) {
  padding: 0;
}

.vol-dialog ::v-deep(.el-dialog__headerbtn) {
  top: 0;
  padding-top: 8px;
  height: 50px;
  width: 0;
  padding-right: 30px;
  padding-left: 5px;
}
// .vol-dialog ::v-deep(.el-dialog__headerbtn .el-dialog__close) {
//   color: #fff;
// }
</style>
