<template>
  <VolBox v-model="model" title="上传" :height="228" :width="500" :padding="15" lazy>
    <!-- 上传图片、excel或其他文件、文件数量、大小限制都可以，参照volupload组件api -->
    <div class="vol-table-upload">
      <VolUpload
        style="text-align: center"
        :autoUpload="column.edit.autoUpload"
        :multiple="column.edit.multiple"
        :url="uploadUrl"
        :max-file="column.edit.maxFile"
        :max-size="column.edit.maxSize"
        :img="column.edit.type == 'img'"
        :excel="column.edit.type == 'excel'"
        :fileTypes="column.edit.fileTypes ? column.edit.fileTypes : []"
        :fileInfo="fileInfo"
        :upload-before="uploadBefore"
        :upload-after="uploadAfter"
        :onChange="uploadOnChange"
      >
        <div>{{ column.message }}</div>
      </VolUpload>
    </div>
    <template #footer>
      <div style="text-align: center">
        <el-button type="default" size="small" @click="model = false">{{
          $ts("关闭")
        }}</el-button>
        <el-button type="primary" size="small" @click="saveUpload">{{
          $ts("保存")
        }}</el-button>
      </div>
    </template>
  </VolBox>
</template>
<script setup>
import { ref,  getCurrentInstance, defineAsyncComponent } from "vue";
const VolUpload = defineAsyncComponent(() => import("@/components/basic/VolUpload.vue"));
const VolBox = defineAsyncComponent(() => import("@/components/basic/VolBox.vue"));
const { proxy } = getCurrentInstance();
const row = ref({});
const column = ref({ message: null, edit: {} });
const uploadUrl = ref();
const model = ref(false);
const fileInfo = ref([]);

const uploadBefore = (files, params) => {
  if (!column.value.uploadBefore) {
    return true;
  }
  return column.value.uploadBefore(files, params, row);
};
const uploadAfter = (result, files) => {
  if (!column.value.uploadAfter) {
    return true;
  }
  return column.value.uploadAfter(result, files, row);
};
const uploadOnChange = (files) => {
  if (!column.value.onChange) {
    return true;
  }
  return column.value.onChange(files, row);
};
const saveUpload = () => {
  //生成保存后返回的路径
  let arr = fileInfo.value.map((x) => {
    if (x.path) {
      return x.path;
    }
    return result.data + x.name;
  });

  row.value[column.value.field] = arr.join(",");
  model.value = false;
  return true;
};

const initUploadInfo = (editRow, editColumn, url) => {
  if (editColumn.edit.autoUpload === undefined) {
    editColumn.edit.autoUpload = true;
  }
  if (editColumn.edit.multiple === undefined) {
    editColumn.edit.multiple = false;
  }
  if (editColumn.edit.url === undefined) {
    if (!url) {
      proxy.$message.error(`请配置columns字段上传url属性`);
    }
    const tb = url.replace("/api", "api").split("/")[1];
    uploadUrl.value = `api/${tb}/upload`;
  } else {
    uploadUrl.value = editColumn.edit.url;
  }

  if (!editRow[editColumn.field]) {
    fileInfo.value = [];
    return;
  }
  fileInfo.value = (editRow[editColumn.field] || "")
    .split(",")
    .filter((x) => {
      return x;
    })
    .map((item) => {
      return { path: item, name: "" };
    });
};

const showUpload = (editRow, editColumn, url) => {
  row.value = editRow;
  column.value = { ...{ message: null, edit: {} }, ...editColumn };

  initUploadInfo(editRow, editColumn, url);
  model.value = true;
};
defineExpose({
  showUpload,
});
</script>
