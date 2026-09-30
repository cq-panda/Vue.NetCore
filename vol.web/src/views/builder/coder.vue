<template>
  <div class="builder-container" :style="{ zoom: zoom }">
    <vol-box ref="addRef" :width="650" title="新建配置信息" :padding="0" v-model="addModel">
      <div style="padding: 0">
        <el-alert title="如果只是创建目录，请选择【创建目录】节点;" class="alert-primary" :closable="false"></el-alert>
      </div>
      <div class="addModel">
        <vol-form ref="addFormRef" label-position="left" :formRules="addOptions" :formFields="layOutOptins.addFields">
        </vol-form>
      </div>
      <template #footer>
        <div style="text-align: center;">
          <el-button type="default" size="small" @click="addModel = false"><i class="el-icon-close"></i> 关闭</el-button>
          <el-button type="primary" size="small" color="rgb(108, 108, 255)" @click="add"><i class="el-icon-plus"></i>
            确定</el-button>
        </div>
      </template>
    </vol-box>
    <div class="coder-page-main">
      <coderV2Tree ref="treePanelRef" :orgin-data="orginData" @node-click="loadTableInfo" />
      <div class="builder-content">
        <div class="builder-content-inner">
          <div class="coder-container">
            <coderV2Form ref="coderFormRef" :form-rules="layOutOptins.options" :form-fields="layOutOptins.fields"
              @save="save" @add-visible="addVisible" @ceate-vue-page="ceateVuePage" @ceate-model="ceateModel"
              @create-service="createService" @del-tree="delTree" />
            <coderV2Table ref="coderTableRef" :table-data="data" :columns="layOutOptins.columns" @del-row="delRow"
              @sync-table="syncTable" @on-sort-end="onSortEnd" />
          </div>
        </div>
      </div>
    </div>
    <coderV2DetailSelect ref="detailSelectRef" @onDetailSelect="onDetailSelect" />
    <coderV2SortFieldSelect ref="sortFieldSelectRef" @onSortConfirm="onSortFieldConfirm" />
  </div>
</template>
<script setup lang="jsx">
import { ref, reactive, watch, onMounted, getCurrentInstance, nextTick, defineAsyncComponent } from "vue";
import { tableOptions, builderFormCallbacks } from "./builderData.jsx";
import { dataType } from "./coderV2Options.jsx";
import coderV2Tree from "./coderV2Tree.vue";
import coderV2Form from "./coderV2Form.vue";
import coderV2Table from "./coderV2Table.vue";

const coderV2DetailSelect = defineAsyncComponent(() => import("./coderV2DetailSelect.vue"));
const coderV2SortFieldSelect = defineAsyncComponent(() => import("./coderV2SortFieldSelect.vue"));

const builderData = tableOptions();
defineOptions({ name: "coder" });

const addRef = ref(null);
const addFormRef = ref(null);
const coderFormRef = ref(null);
const coderTableRef = ref(null);
const treePanelRef = ref(null);
const detailSelectRef = ref(null);
const sortFieldSelectRef = ref(null);

/** 与 coderV3Content：快捷编辑 / 主表关联字段下拉数据源 */
const dicFields = ref([{ key: "", value: "请选择" }]);

const { proxy } = getCurrentInstance();

const more = {
  addChild: "addChild",
  ceateController: "ceateController",
  addRow: "addRow",
  delRow: "delRow",
  delTree: "delTree",
};

const addModel = ref(false);
const addOptions = builderData.form.addOptions;
const layOutOptins = reactive({
  fields: builderData.form.fields,
  /** 新建弹窗表单数据，与主表单 fields 分离 */
  addFields: builderData.form.addFields,
  options: builderData.form.options,
  columns: builderData.columns,
});

layOutOptins.options.forEach((row) => {
  row.forEach((c) => {
    if (c.field === "expressField") {
      c.type = "select";
      c.data = dicFields;
    } else if (c.field === "mainKeyField") {
      c.type = "select";
      c.data = dicFields;
    }
  });
});
const tableInfo = ref(null);
const data = ref([]);
const orginData = ref([]);
const zoom = ref(document.body.clientWidth < 1500 ? 0.9 : 1);
/** 命名空间下拉仅首次从 GetTableTree 注入，避免重复 push */
const namespaceBootstrapped = ref(false);

watch(
  () => layOutOptins.fields.vuePath,
  (val) => {
    const s = val == null ? "" : String(val).trim();
    if (s) {
      localStorage.setItem("vuePath", s);
    }
  }
);

watch(
  () => layOutOptins.fields.appPath,
  (val) => {
    const s = val == null ? "" : String(val).trim();
    if (s) {
      localStorage.setItem("appPath", s);
    }
  }
);

const getVuePath = (key) => {
  let vuePath = localStorage.getItem(key);
  if (!vuePath || vuePath == "null" || vuePath == "undefined") {
    vuePath = "";
  }
  return vuePath;
};

/** LoadTableInfo 等接口常不返回路径，表单应从 localStorage 回填（与 coderV3 nodeClick 一致） */
const applyCachedPathsToPayload = (row) => {
  if (!row) return;
  row.vuePath = getVuePath("vuePath");
  row.appPath = getVuePath("appPath");
};

/** 与 coderV3Content：默认排序字段 JSON / 旧版纯字段名 */
const hasSortNameConfigured = (sortName) => {
  const s = sortName == null ? "" : String(sortName).trim();
  if (!s) {
    return false;
  }
  if (s.startsWith("{")) {
    try {
      const o = JSON.parse(s);
      if (!o || typeof o !== "object" || Array.isArray(o)) {
        return false;
      }
      return Object.keys(o).length > 0;
    } catch {
      return false;
    }
  }
  return true;
};

/**
 * 与 coderV3Content 一致：未配置默认排序时生成 JSON（主键 int/bigint 或 CreateDate）
 */
const buildDefaultSortNameJson = (columns) => {
  if (!columns?.length) {
    return "";
  }
  const keyCol = columns.find((c) => c.isKey);
  if (keyCol?.columnName) {
    const t = String(keyCol.columnType || "").toLowerCase();
    if (t === "int" || t === "bigint") {
      return JSON.stringify({ [keyCol.columnName]: "asc" });
    }
  }
  const dateCol = columns.find(
    (c) => String(c.columnName || "").toLowerCase() === "createdate"
  );
  if (dateCol?.columnName) {
    return JSON.stringify({ [dateCol.columnName]: "desc" });
  }
  return "";
};

const applyDefaultSortNameIfNeeded = () => {
  if (hasSortNameConfigured(layOutOptins.fields.sortName)) {
    return;
  }
  const json = buildDefaultSortNameJson(data.value);
  if (json) {
    layOutOptins.fields.sortName = json;
  }
};

const initBuilderDicFields = () => {
  const rows = data.value || [];
  const mapped = rows.map((x) => ({
    key: x.columnName,
    value: x.columnCnName ? "(" + x.columnCnName + ")" + x.columnName : x.columnName,
  }));
  dicFields.value = [{ key: "", value: "请选择" }, ...mapped];
};

const syncQuickQueryOptionData = (v) => {
  const quickQueryOption = layOutOptins.options.flat().find((x) => x.field === "quickQueryFields");
  if (!quickQueryOption) return;
  quickQueryOption.data = (data.value || [])
    .filter((x) => x.searchRowNo > 0)
    .map((x) => ({ key: x.columnName, value: x.columnCnName || x.columnName }));
  v === 1 && proxy.$message.success('刷新成功')
};

const syncBuilderFormColumnsDerived = () => {
  initBuilderDicFields();
  syncQuickQueryOptionData();
};

const getDetailSelectTreeData = () => {
  let tree = [];
  layOutOptins.options.forEach((row) => {
    row.forEach((item) => {
      if (item.field === "parentId" && Array.isArray(item.data)) {
        tree = item.data.filter((x) => x && x.value != -999);
      }
    });
  });
  return tree;
};

const showDetailSelect = () => {
  if (!layOutOptins.fields.table_Id) {
    return proxy.$message.error("请先点击左边树加载数据");
  }
  const detailInfo = {
    detailCnName: layOutOptins.fields.detailCnName,
    detailName: layOutOptins.fields.detailName,
  };
  detailSelectRef.value?.show(detailInfo, getDetailSelectTreeData());
};

const onDetailSelect = ({ detailName, detailCnName }) => {
  layOutOptins.fields.detailName = detailName || "";
  layOutOptins.fields.detailCnName = detailCnName || "";
};

const showSortFieldSelect = () => {
  if (!layOutOptins.fields.table_Id) {
    return proxy.$message.error("请先点击左边树加载数据");
  }
  if (!data.value?.length) {
    return proxy.$message.error("请先加载表结构");
  }
  const physicalName = (layOutOptins.fields.tableTrueName || layOutOptins.fields.tableName || "").trim();
  sortFieldSelectRef.value?.show(layOutOptins.fields.sortName, data.value, physicalName);
};

const onSortFieldConfirm = (jsonStr) => {
  layOutOptins.fields.sortName = jsonStr || "";
};

/** 与 coderV3Content：明细表、排序、明细中文名标签上的按钮/气泡 */
const patchCoderV2FormOptionsLabels = () => {
  const detailNameOps = layOutOptins.options.flat().find((item) => item.field === "detailName");
  if (detailNameOps) {
    detailNameOps.labelRender = () => {
      return (
        <div>
          明细表
          <el-button
            color="#0425dd"
            link
            plain
            size="small"
            style="padding: 5px !important;margin: 0;margin-left:15px;font-size:14px;"
            onClick={() => {
              showDetailSelect();
            }}
          >
            <i style="font-size:13px;" class="el-icon-plus"></i>
            选择
          </el-button>
        </div>
      );
    };
  }

  const sortNameOps = layOutOptins.options.flat().find((item) => item.field === "sortName");
  if (sortNameOps) {
    sortNameOps.labelRender = () => {
      return (
        <div>
          排序字段
          <el-button
            color="#0425dd"
            link
            plain
            size="small"
            style="padding: 5px !important;margin: 0;margin-left:15px"
            onClick={() => {
              showSortFieldSelect();
            }}
          >
            <i style="font-size:14px;" class="el-icon-plus"></i>
            排序设置
          </el-button>
        </div>
      );
    };
  }

  const detailCnNameOps = layOutOptins.options.flat().find((item) => item.field === "detailCnName");
  if (detailCnNameOps) {
    detailCnNameOps.labelRender = () => {
      const names = (layOutOptins.fields.detailName || "")
        .split(",")
        .map((s) => s.trim())
        .filter(Boolean);
      const cnNames = (layOutOptins.fields.detailCnName || "").split(",").map((s) => s.trim());
      const list = names.length ? names.map((name, i) => ({ name, cnName: cnNames[i] || "" })) : [];
      return (
        <el-popover trigger="hover" placement="right" width={280}>
          {{
            default: () =>
              list.length ? (
                <div>
                  <div style={{ marginBottom: 8, fontWeight: 500 }}>
                    <vol-title icon="Edit" title="明细表列表"></vol-title>
                  </div>
                  <ul style={{ margin: 0, padding: "0 0 0 20px", lineHeight: 1.8 }}>
                    {list.map((item, i) => (
                      <li key={i} style={{ marginBottom: 4 }}>
                        <span style={{ color: "#606266" }}>{item.name}</span>
                        {item.cnName ? (
                          <span style={{ color: "#909399", marginLeft: 8 }}> - {item.cnName}</span>
                        ) : null}
                      </li>
                    ))}
                  </ul>
                </div>
              ) : (
                <div style={{ padding: "4px 0" }}>
                  <span>未添加明细表</span>
                </div>
              ),
            reference: () => (
              <span style={{ cursor: "default", color: "#0247de" }}>
                <span
                  class="el-icon-warning-outline"
                  style={{ marginRight: "3px", color: "#0247de", fontSize: 13 }}
                ></span>
                明细表中文名{" "}
              </span>
            ),
          }}
        </el-popover>
      );
    };
  }
};

watch(
  () => data.value,
  () => {
    syncBuilderFormColumnsDerived();
  },
  { deep: true }
);

/**
 * 与 coderV3Content.getParam 一致：parentId、quickQueryFields、TableColumns / columnformat
 */
const getSaveParam = () => {
  const param = JSON.parse(JSON.stringify(tableInfo.value || {}));
  const fieldsCopy = JSON.parse(JSON.stringify(layOutOptins.fields));
  Object.assign(param, fieldsCopy);

  if (Array.isArray(param.parentId)) {
    if (param.parentId.length) {
      param.parentId = [...param.parentId].pop();
    } else {
      param.parentId = 0;
    }
  }
  if (param.parentId === -999 || param.parentId === null || param.parentId === "") {
    param.parentId = 0;
  }
  if (!param.parentId && param.parentId !== 0) {
    param.parentId = 0;
  }
  if (Array.isArray(param.quickQueryFields)) {
    param.quickQueryFields = param.quickQueryFields.join(",");
  }

  delete param.tableColumns;
  param.TableColumns = (data.value || []).map((x) => {
    return { ...x };
  });
  param.TableColumns.forEach((x) => {
    if (x.columnformat && typeof x.columnformat !== "string") {
      x.columnformat = JSON.stringify(x.columnformat);
    }
  });
  return param;
};

const normalizeTreeFlatList = (list) => {
  list.forEach((c) => {
    if (
      c.parentId &&
      !list.some((a) => {
        return a.id == c.parentId;
      })
    ) {
      c.parentId = 0;
      c.pId = 0;
    }
  });
};

const fillParentCascaderFromList = (list) => {
  const treeData = proxy.base.convertTree(list, (node) => {
    node.label = node.name;
    node.value = node.id;
    node.key = node.id;
  });
  treeData.unshift({
    parentId: null,
    value: -999,
    label: "无(创建目录)",
  });
  [layOutOptins.options, addOptions].forEach((opts) => {
    opts.forEach((option) => {
      option.forEach((item) => {
        if (item.field === "parentId") {
          item.data = treeData;
          item.orginData = list;
        }
      });
    });
  });
};

const processGetTableTreeResponse = (x) => {
  const list = JSON.parse(x.list);
  normalizeTreeFlatList(list);
  orginData.value = list;
  fillParentCascaderFromList(list);
  nextTick(() => {
    treePanelRef.value?.rebuildTree();
  });
};

const bootstrapNamespaceIfNeeded = (x) => {
  if (!x.nameSpace) {
    if (!namespaceBootstrapped.value) {
      proxy.$message.error(
        "未获取后台项目类库所在命名空间,请确认目录或调试Sys_TableInfoService类GetTableTree方法"
      );
    }
    return;
  }
  if (namespaceBootstrapped.value) return;
  namespaceBootstrapped.value = true;
  const nameSpace = JSON.parse(x.nameSpace);
  const nameSpaceArr = [];
  for (let index = 0; index < nameSpace.length; index++) {
    nameSpaceArr.push({
      key: nameSpace[index],
      value: nameSpace[index],
    });
  }
  layOutOptins.options.forEach((option) => {
    option.forEach((item) => {
      if (item.field == "namespace") {
        item.data.push(...nameSpaceArr);
      }
    });
  });
  addOptions.forEach((option) => {
    option.forEach((item) => {
      if (item.field == "namespace") {
        item.data.push(...nameSpaceArr);
      }
    });
  });
};

/** 重新拉取左侧树并刷新表单「父级 ID」级联 data / orginData（与 coderV3 树更新思路一致） */
const fetchAndApplyTableTree = () => {
  return proxy.http.post("/api/builder/GetTableTree", {}, false).then((x) => {
    processGetTableTreeResponse(x);
    bootstrapNamespaceIfNeeded(x);
    return x;
  });
};

const loadTableInfo = (id) => {
  proxy.http
    .post("/api/builder/LoadTableInfo?table_Id=" + id + "&isTreeLoad=true", {}, true)
    .then((x) => {
      if (!x.data.tableTrueName) {
        x.data.tableTrueName = x.data.tableName;
      }
      const _fields = [
        "sortable",
        "isNull",
        "isReadDataset",
        "isColumnData",
        "isDisplay",
      ];
      x.data.tableColumns.forEach((item) => {
        for (let index = 0; index < _fields.length; index++) {
          item[_fields[index]] = item[_fields[index]] || 0;
        }
      });
      tableInfo.value = x.data;
      applyCachedPathsToPayload(x.data);
      proxy.base.resetForm(layOutOptins.fields, layOutOptins.options, x.data);
      data.value = x.data.tableColumns;
      nextTick(() => {
        treePanelRef.value?.setCurrentKey(x.data.table_Id);
        applyDefaultSortNameIfNeeded();
        syncBuilderFormColumnsDerived();
      });
    });
};

const addVisible = (pid) => {
  addModel.value = true;
  proxy.base.resetForm(layOutOptins.addFields, addOptions, {});
  data.value.splice(0);
  if (pid !== undefined && pid !== null && pid !== "") {
    const flat = orginData.value;
    const chain = flat?.length ? proxy.base.getTreeAllParent(pid, flat) : null;
    if (chain?.length) {
      layOutOptins.addFields.parentId = chain.map((n) => n.id);
    } else {
      layOutOptins.addFields.parentId = [pid];
    }
  }
};

const delTree = () => {
  const tableId = layOutOptins.fields.table_Id;
  if (!tableId) return proxy.$message.error("请选择节点");
  proxy.http.post("/api/builder/delTree?table_Id=" + tableId, {}, true).then(async (x) => {
    if (!x.status) return proxy.$message.error(x.message);
    proxy.$message.primary({ message: x.message || "删除成功", offset: 100, duration: 2000 });
    await fetchAndApplyTableTree();
    tableInfo.value = null;
    data.value = [];
    const appPath=layOutOptins.fields.appPath;
    const vuePath=layOutOptins.fields.vuePath;
    proxy.base.resetForm(layOutOptins.fields, layOutOptins.options, {appPath:appPath,vuePath:vuePath});
    nextTick(() => {
      coderFormRef.value?.clear?.();
      treePanelRef.value?.setCurrentKey(null);
    });
  });
};

const add = () => {
  addFormRef.value?.validate(() => {
    const af = layOutOptins.addFields;
    if (!af.tableTrueName) {
      af.tableTrueName = af.tableName;
    }

    let parentId = af.parentId;
    if (Array.isArray(parentId)) {
      parentId = parentId.length ? parentId[parentId.length - 1] : 0;
    }
    if (parentId === -999 || parentId === null || parentId === "") {
      parentId = 0;
    }
    let queryParam =
      "parentId=" +
      parentId +
      "&tableName=" +
      af.tableName +
      "&columnCNName=" +
      af.columnCNName +
      "&nameSpace=" +
      af.namespace +
      "&foldername=" +
      af.folderName +
      "&isTreeLoad=false" 
    proxy.http.post("/api/builder/LoadTableInfo?" + queryParam, {}, true).then(async (x) => {
      if (!x.status) {
        proxy.$message.error(x.message);
        return;
      }
      await fetchAndApplyTableTree();
      if (!x.data.tableTrueName) {
        x.data.tableTrueName = x.data.tableName;
      }
      addModel.value = false;
      tableInfo.value = x.data;
      applyCachedPathsToPayload(x.data);
      proxy.base.resetForm(layOutOptins.fields, layOutOptins.options, x.data);
      data.value = x.data.tableColumns;
      nextTick(() => {
        treePanelRef.value?.setCurrentKey(x.data.table_Id);
        applyDefaultSortNameIfNeeded();
        syncBuilderFormColumnsDerived();
      });
    });
  });
};

const addChild = () => {
  let id = layOutOptins.fields.table_Id;
  if (!id) {
    return proxy.$message.error("请选中节点");
  }
  addVisible(id);
};

const addRow = () => {
  data.value.push({});
};

const delRow = () => {
  let tigger = false;
  proxy
    .$confirm("删除警告?", "确认要删除选择的数据吗", {
      confirmButtonText: "确定",
      cancelButtonText: "取消",
      type: "warning",
      center: true,
    })
    .then(() => {
      if (tigger) return;
      tigger = true;
      coderTableRef.value?.delRow();
    });
};

const validateTableInfo = async () => {
  const formOk = await coderFormRef.value.validate();
  if (!formOk) {
    return false;
  }
  if (!tableInfo.value) {
    proxy.$message.error({ message: "请先加载数据", offset: 100, duration: 2000 });
    return false;
  }
  if (data.value && data.value.length > 0) {
    const keyInfo = data.value.find((x) => {
      return x.isKey;
    });
    if (!keyInfo) {
      proxy.$message.error({ message: "请勾选设置主键", offset: 100, duration: 2000 });
      return false;
    }
    if (keyInfo.isNull == 1) {
      proxy.$message.error({
        message: "主键【可为空】必须设置为否",
        offset: 100,
        duration: 2000,
      });
      return false;
    }
    if (
      keyInfo.columnType != "int" &&
      keyInfo.columnType != "bigint" &&
      !hasSortNameConfigured(layOutOptins.fields.sortName)
    ) {
      proxy.$message.error({
        message: "主键非自增类型,请选择上面表单【默认排序字段】",
        offset: 100,
        duration: 2000,
      });
      return false;
    }
  }
  return true;
};

const ceateVuePage = async (isApp) => {
  if (!(await validateTableInfo())) {
    return;
  }
  let vuePath;
  if (!isApp) {
    vuePath = localStorage.getItem("vuePath");
    if (!vuePath) {
      return proxy.$message.error("请先设置Vue项目对应Views的绝对路径,然后再保存!");
    }
  } else {
    vuePath = localStorage.getItem("appPath");
    if (!vuePath) {
      return proxy.$message.error("请先设置app路径,然后再保存!");
    }
  }

  const param = getSaveParam();
  let url = `/api/builder/createVuePage?vuePath=${vuePath}&vite=1&v3=1&app=${isApp || 0}`;
  proxy.http.post(url, param, true).then((x) => {
    proxy.$Message.info(x);
  });
};

const createService = async () => {
  if (!(await validateTableInfo())) {
    return;
  }
  const param = getSaveParam();
  let queryParam =
    "tableName=" +
    layOutOptins.fields.tableName +
    "&nameSpace=" +
    layOutOptins.fields.namespace +
    "&foldername=" +
    layOutOptins.fields.folderName;
  proxy.http.post("/api/builder/CreateServices?" + queryParam, param, true).then((x) => {
    proxy.$Message.info(x);
  });
};

const ceateModel = async () => {
  if (!(await validateTableInfo())) {
    return;
  }
  const param = getSaveParam();
  proxy.http.post("/api/builder/CreateModel", param, true).then((x) => {
    proxy.$message.info(x);
  });
};

const syncTable = () => {
  if (!layOutOptins.fields.tableName) return proxy.$Message.error("请选模块");
  proxy.http
    .post("/api/builder/syncTable?tableName=" + layOutOptins.fields.tableName, {}, true)
    .then((x) => {
      if (!x.status) {
        return proxy.$Message.error(x.message);
      }
      proxy.$Message.info(x.message);
      loadTableInfo(layOutOptins.fields.table_Id);
    });
};

const ceateApiController = () => { };
const ceateController = () => { };
const checkSortName = () => { };

const save = async () => {
  const vuePath = layOutOptins.fields.vuePath || "";
  localStorage.setItem("vuePath", vuePath);
  localStorage.setItem("appPath", layOutOptins.fields.appPath || "");
  if (!vuePath.endsWith("\\views") && !vuePath.endsWith("/views")) {
    return proxy.$message.error({
      message: "Vue路径只能填写到前端项目views目录,如E:\\xxx\\web.vite\\scr\\views",
      offset: 100,
      duration: 2000,
    });
  }

  if (
    data.value?.length &&
    data.value.filter((x) => {
      return x.isKey == 1;
    }).length > 1
  ) {
    return proxy.$message.error({
      message: "表结构只能勾选一个主键字段",
      offset: 100,
      duration: 2000,
    });
  }
  if (!(await validateTableInfo())) {
    return;
  }

  const param = getSaveParam();
  const dataMsg = dataType
    .filter((c) => {
      return c.requireData;
    })
    .map((x) => {
      return x.value;
    })
    .join(",");
  let item = param.TableColumns.find((x) => {
    return dataType.some((c) => {
      return c.requireData && c.key == x.searchType && !x.dropNo;
    });
  });
  // if (item) {
  //   return proxy.$message.error({
  //     message: `[查询表单]:字段[${item.columnCnName || item.columnName}]查询类型为[${dataMsg}]时必须选择数据源`,
  //     offset: 100,
  //     duration: 4000,
  //   });
  // }

  item = param.TableColumns.find((x) => {
    return dataType.some((c) => {
      return c.requireData && c.key == x.editType && !x.dropNo;
    });
  });
  if (item) {
    return proxy.$message.error({
      message: `[编辑表单]:字段[${item.columnCnName || item.columnName}]编辑类型为[${dataMsg}]时必须选择数据源`,
      offset: 100,
      duration: 4000,
    });
  }

  proxy.http.post("/api/builder/Save", param, true).then(async (x) => {
    if (!x.status) {
      proxy.$message.error({ message: x.message, offset: 100, duration: 2000 });
      return;
    }
    proxy.$message.primary({ message: x.message || "保存成功", offset: 100, duration: 2000 });
    await fetchAndApplyTableTree();
    tableInfo.value = x.data;
    applyCachedPathsToPayload(x.data);
    proxy.base.resetForm(layOutOptins.fields, layOutOptins.options, x.data);
    data.value = x.data.tableColumns;
    nextTick(() => {
      treePanelRef.value?.setCurrentKey(x.data.table_Id);
      applyDefaultSortNameIfNeeded();
      syncBuilderFormColumnsDerived();
    });
  });
};

const onSortEnd = (rows) => {
  let orderNo = 10000;
  rows.forEach((x) => {
    orderNo = orderNo - 50;
    x.orderNo = orderNo;
  });
};

const changeMore = (funName) => {
  const handlers = {
    addChild,
    ceateController,
    addRow,
    delRow,
    delTree,
  };
  handlers[funName]?.();
};

onMounted(() => {
  patchCoderV2FormOptionsLabels();
  builderFormCallbacks.refreshQuickQueryFields = syncQuickQueryOptionData;
  syncBuilderFormColumnsDerived();

  proxy.http.post("/api/Sys_Dictionary/GetBuilderDictionary", {}, true).then((dic) => {
    let column = layOutOptins.columns.find((x) => {
      return x.field == "dropNo";
    });
    if (!column) return;

    let dictData = [{ key: "", value: "" }];
    for (let index = 0; index < dic.length; index++) {
      dictData.push({ key: dic[index], value: dic[index] });
    }

    column.bind.data = dictData;
  });

  builderData.form.fields.vuePath = getVuePath("vuePath");
  builderData.form.fields.appPath = getVuePath("appPath");
  fetchAndApplyTableTree();
});
</script>
<style scoped>
/* 与 coderV3 .coder-v3 一致：整页背景与内边距 */
.builder-container {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  width: 100%;
  height: 100%;
  box-sizing: border-box;
  background: #f5f6f7;
  padding: 10px;
  display: flex;
  flex-direction: column;
}

.coder-page-main {
  flex: 1;
  min-height: 0;
  display: flex;
  flex-direction: row;
  gap: 10px;
}

.builder-content {
  flex: 1;
  min-width: 0;
  min-height: 0;
  display: flex;
  flex-direction: column;
}

.builder-content-inner {
  flex: 1;
  min-height: 0;
  display: flex;
  flex-direction: column;
  background: transparent;
  border: none;
  padding: 0;
  box-sizing: border-box;
}

.builder-content-scrollbar {
  flex: 1;
  min-height: 0;
  height: 100%;
}

.builder-content-scrollbar :deep(.el-scrollbar__wrap) {
  overflow-x: hidden;
}

.coder-container {
  display: flex;
  flex-direction: column;
  padding-bottom: 4px;
  background: transparent;
}

.coder-page-alert {
  margin: 0;
  border-radius: 5px;
  border: 1px solid #efefef;
  box-sizing: border-box;
  padding: 4px 10px;
}

.builder-content :deep(.ivu-alert) {
  position: relative;
  display: flex;
  padding: 12px 18px 12px 38px;
}

.builder-content :deep(.ivu-alert-icon) {
  top: 10px;
}

.more {
  text-align: left;
  position: relative;
  top: 2px;
}

.addModel {
  padding: 10px;
}
</style>
