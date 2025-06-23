<template>
  <div ref="editorRef"></div>
</template>

<script setup>
const props = defineProps({
  url: {
    // 上传图片的url
    type: String,
    default: "",
  },
  upload: {
    // 上传方法
    type: Function,
    // (file, insertImgFn) => {}
    default: null,
  },
  uploadCount: {
    // 最多可以上传(图片)的数量
    type: Number,
    default: 3,
  },
  modelValue: {
    type: String,
    default: "",
  },
  width: {
    type: String,
    default: "100%",
  },
  height: {
    type: Number,
    default: 250,
  },
  minWidth: {
    type: Number,
    default: 650,
  },
  minHeight: {
    type: Number,
    default: 100,
  },
});
import E from "wangeditor";
import {
  ref,
  getCurrentInstance,
  watchEffect,
  onMounted,
  onUnmounted,
  nextTick,
  defineProps,
  defineEmits,
} from "vue";

const { proxy } = getCurrentInstance();

const emits = defineEmits(["update:modelValue"]);

const editorRef = ref(null);
const editor = ref(null);
const lastHtml = ref("");
const isEditorReady = ref(false);

// 创建编辑器实例
const createEditor = () => {
  editor.value = new E(editorRef.value);

  // 编辑器基本配置
  editor.value.config.zIndex = 500;
  editor.value.config.height = props.height;

  // 内容变化时触发事件
  editor.value.config.onchange = (html) => {
    // 避免初始渲染时触发不必要的更新
    if (!isEditorReady.value) {
      isEditorReady.value = true;
      lastHtml.value = html;
      return;
    }

    // 只有当内容真正变化时才更新
    if (html !== lastHtml.value) {
      lastHtml.value = html;
      emits("update:modelValue", html);
    }
  };

  // 自定义图片上传
  editor.value.config.customUploadImg = function (resultFiles, insertImgFn) {
    if (props.upload) {
      // 使用自定义上传方法
      resultFiles.map((item) => {
        props.upload(item, insertImgFn);
      });
    } else {
      // 使用默认上传逻辑
      const formData = new FormData();
      const nameArr = [];

      resultFiles.forEach(function (file) {
        formData.append("fileInput", file, file.name);
        nameArr.push(file.name);
      });

      if (!props.url) {
        console.error("未配置上传URL");
        return;
      }

      proxy.http
        .post(props.url, formData, true, {
          headers: { "Content-Type": "multipart/form-data" },
        })
        .then((x) => {
          if (!x.status) {
            console.error(x.message);
            return;
          }

          nameArr.forEach((m) => {
            insertImgFn(proxy.http.ipAddress + x.data + m);
          });
        });
    }
  };

  // 创建编辑器
  editor.value.create();

  // 初始化内容
  nextTick(() => {
    if (props.modelValue) {
      editor.value.txt.html(props.modelValue);
      lastHtml.value = props.modelValue;
    }
    isEditorReady.value = true;
  });
};

// 监听外部传入的 modelValue 变化
watchEffect(() => {
  if (isEditorReady.value && props.modelValue !== lastHtml.value) {
    // 使用 nextTick 确保 DOM 更新完成
    nextTick(() => {
      editor.value.txt.html(props.modelValue);
      lastHtml.value = props.modelValue;
    });
  }
});

// 生命周期钩子
onMounted(() => {
  createEditor();
});

onUnmounted(() => {
  if (editor.value) {
    editor.value.destroy();
    editor.value = null;
  }
});
</script>

<style scoped></style>
