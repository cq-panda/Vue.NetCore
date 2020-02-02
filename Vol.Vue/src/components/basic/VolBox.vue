<template>
  <!-- :draggable="draggable" -->
  <Modal
    :mask-closable="false"
    :closable="false"
    :mask="mask"
    title="Title"
    :width="width+'px'"
    v-model="model"
    class-name="vertical-center-modal"
  >
    <a class="ivu-modal-close" @click="viewModelCancel">
      <i class="ivu-icon ivu-icon-ios-close"></i>
    </a>
    <p slot="header" class="header">
      <Icon :type="icon"></Icon>
      <span>{{title}}</span>
    </p>
    <div class="view-model-content" :style="{height:height+'px'}">
      <el-scrollbar style="height:100%;">
        <div class="srcoll-content" :style="{padding:padding+'px'}">
          <slot name="content"></slot>
          <slot></slot>
        </div>
      </el-scrollbar>
    </div>
    <div slot="footer" class>
      <slot name="footer"></slot>
      <Button v-if="footer" type="info" @click="viewModelCancel">关闭</Button>
    </div>
  </Modal>
</template>
<script>
export default {
  props: {
    icon: {
      type: String,
      default: "ios-information-circle-outline"
    },
    title: {
      type: String,
      default: "基本信息"
    },
    model: {
      type: Boolean,
      default: false
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
    hideMask: {
      type: Boolean,
      default: false
    },
    draggable: {
      type: Boolean,
      default: false
    },
    mask: {
      type: Boolean,
      default: true
    }
  },
  data: function() {
    return {
      footer: true,
      vModel: this.model
    };
  },
  watch: {
    model() {
      this.vModel = this.model;
    }
  },
  mounted() {
    // console.log("cm");
  },
  created() {
    // console.log("c1");
    if (this.$slots.footer) {
      this.footer = false;
    }
  },
  methods: {
    viewModelCancel() {
      this.vModel = false;
      this.$emit("update:model", false);
    }
  }
};
</script>

<style lang="less">
.vertical-center-modal {
  display: flex;
  align-items: center;
  //   justify-content: center;
  .ivu-modal {
    top: 0;
  }
  .ivu-modal-close .ivu-icon-ios-close {
    color: white;
  }
  .view-model-content {
    min-height: 180px;
  }
  .srcoll-content {
    height: 100%;
    word-break: break-all;
    //  padding: 16px;
  }
  .ivu-modal-body {
    padding: 0px;
  }
  .ivu-modal-header {
    border-top-left-radius: 6px;
    border-top-right-radius: 6px;
    padding: 12px 15px;
    background-image: linear-gradient(
      135deg,
      rgb(12, 215, 189) 10%,
      #57c5f7 100%
    );
  }
  .ivu-modal-footer {
    padding: 5px 10px;
    button {
      padding: 4px 18px;
    }
  }
  .header {
    color: white;
  }
}
</style>
<style scoped>
.view-model-content >>> .el-scrollbar > .el-scrollbar__wrap {
  overflow-x: hidden;
}
</style>


