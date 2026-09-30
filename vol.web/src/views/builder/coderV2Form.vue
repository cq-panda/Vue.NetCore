<template>
  <div class="coder-v2-form">


    <div class="action">
      <!-- <el-tabs v-model="formPanel" class="action-tabs">
        <el-tab-pane label="基础信息" name="basic" />
    
      </el-tabs> -->
      <div class="form-title"><span class="el-icon-edit-outline"></span>代码生成</div>
      <el-popover title="操作说明" :width="420">
        <template #reference>
          <span style="color: #0247de; font-size: 13px" class="el-icon-info"><span style="margin-left: 3px;">操作说明</span>
          </span>
        </template>
        <div style="line-height: 2">
          <div>1.点击新建，填写表信息</div>
          <div>2.配置表结构信息</div>
          <div>3.配置查询、编辑表单</div>
          <div>4.系统设置->配置表单</div>
        </div>
      </el-popover>
      <div class="action-buttons">
        <el-button v-for="btn in toolbarButtons" :key="btn.key" :color="btn.color" :type="btn.type" size="small"
          @click="onToolbarClick(btn)" style="margin-left: 5px !important;">
          <i class="action-btn__icon" :class="btn.icon"></i>
          {{ btn.label }}
        </el-button>
      </div>
    </div>
    <div class="config">
      <vol-form :label-width="90" label-position="top" ref="formRef" :formRules="formRules"
        :formFields="formFields"></vol-form>
    </div>
  </div>
</template>

<script setup>
import { ref, getCurrentInstance } from "vue";

defineOptions({ name: "coderV2Form" });

const { proxy } = getCurrentInstance();

/** 顶部工具栏：顺序即展示顺序；有 payload 时 emit(事件名, payload) */
const toolbarButtons = [
  { key: "save", label: "保存", icon: "el-icon-check", emit: "save", type: "danger" },
  /** 与 coderV3Content「新建」一致：由父级打开弹窗并重置新建表单 */
  { key: "addVisible", label: "新建", color: "#1e6fff", icon: "el-icon-plus", emit: "addVisible" },
  {
    key: "ceateVuePage0",
    label: "生成页面",
    icon: "bi-code-slash",
    emit: "ceateVuePage",
    payload: 0,
  },
  {
    key: "ceateVuePage1",
    label: "app页面",
    icon: "el-icon-mobile-phone",
    emit: "ceateVuePage",
    payload: 1,
  },
  { key: "ceateModel", label: "生成Model", icon: "bi-filetype-cs", emit: "ceateModel" },
  {
    key: "createService",
    label: "生成业务类",
    icon: "bi-fullscreen-exit",
    emit: "createService",
  },
  { key: "delTree", label: "删除配置", icon: "el-icon-delete", emit: "delTree" },
];

const emit = defineEmits([
  "save",
  "addVisible",
  "ceateVuePage",
  "ceateModel",
  "createService",
  "delTree",
]);

const onToolbarClick = (btn) => {
  if (btn.key === "delTree") {
    proxy
      .$confirm("删除警告?", "确认要删除吗", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
        center: true,
      })
      .then(() => {
        emit("delTree");
      })
      .catch(() => { });
    return;
  }
  if (Object.prototype.hasOwnProperty.call(btn, "payload")) {
    emit(btn.emit, btn.payload);
  } else {
    emit(btn.emit);
  }
};

defineProps({
  formRules: {
    type: Array,
    required: true,
  },
  formFields: {
    type: Object,
    required: true,
  },
});

/** 当前选中的页签名：basic | advanced（仅切换状态，内容由下方表单统一承载） */
const formPanel = ref("basic");

const formRef = ref(null);

const validate = async (cb) => {
  return await formRef.value?.validate(cb);
};

const reset = (data) => {
  formRef.value?.reset(data);
};

/** 仅清除校验提示（与 VolForm.clearValidate 一致）；勿用错误的 $refs 路径 */
const clear = () => {
};

defineExpose({
  validate,
  reset,
  clear,
});
</script>

<style scoped lang="less">
.coder-v2-form {

  border: 1px solid #efefef;
  border-radius: 5px;
  box-sizing: border-box;
}

.action {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  justify-content: space-between;
  gap: 8px;
  padding: 5px;
  background: #fff;
  border-radius: 4px;
}

.action-tabs {
  flex-shrink: 0;
}

.action-tabs :deep(.el-tabs__header) {
  margin-bottom: 0;
}

.action-tabs :deep(.el-tabs__content) {
  display: none;
}

.action-buttons {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  justify-content: flex-end;
  gap: 4px;
  margin-left: auto;
}

.action-btn {
  padding: 5px !important;
  margin: 0;
}

.action-btn__icon {
  font-size: 13px;
  position: relative;
  top: 0;
}

.config {
  padding: 10px 0 0;
  border-radius: 3px;
  background: #fff;
  margin: 10px 0;

  :deep(.el-select__selection) {
    flex-wrap: unset !important;
    overflow: hidden;
  }
}

.action :deep(.el-tabs__nav-scroll) {
  .el-tabs__item {
    padding: 0 10px;
  }
}

.form-title {
  font-size: 14px;
  font-weight: bolder;

  span {
    margin: 0 5px;
  }
}
</style>
