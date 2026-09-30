<template>
  <div class="menu-container">
    <!-- <el-input/> -->
    <vol-box :width="940" :mask="true" :height="500" title="图标列表" v-model="model">
      <Icons :onSelect="onSelect"></Icons>
      <template #footer>
        <el-button type="primary" @click="model = false">确 认</el-button>
      </template>
    </vol-box>
    <vol-box :width="600" :mask="true" :height="270" title="其他权限" v-model="actionModel">
      <vol-form ref="actionFormRef" :formRules="actionOptions" :formFields="actionFields">
        <template #header>
          <div>
            <el-alert show-icon type="success">
              配置的其他权限
              <br />1、添加新的权限后请在vue项目中config文件夹下buttns.js添加此权限的按钮。
              <br />2、如果权限只在某少数几个功能中使用,在vue的对应页面扩展extension文件找到对应js,添加到el-buttons对象中,格式同config文件夹下buttns.js一样。
            </el-alert>
          </div>
        </template>
      </vol-form>
      <template #footer>
        <el-button type="primary" @click="otherAction">确 认</el-button>
      </template>
    </vol-box>

    <!-- v-if="tree.length" -->
    <div class="menu-left">
      <div class="m-title"><i class="el-icon-warning-outline"></i>菜单列表</div>
      <el-scrollbar style="height: 100%; width: 200px">
        <VolMenu :onSelect="getTreeItem" :list="tree" :isCollapse="false"></VolMenu>
      </el-scrollbar>
    </div>
    <div class="menu-right">
      <el-scrollbar style="height: 100%">
        <!-- <el-alert title="菜单配置说明" type="success" :closable="false" show-icon>
          <div class="desc-item">
            1、代码生器生成的页面,Url在Vue项目中src->router->viewGrid.js对应表名的path属性,移动端在pages.json中的path属性
          </div>
          <div class="desc-item">若使用了表别名,【视图/表名】填写数据库实际表名</div>
          <div class="desc-item">
            3、若二次修改了【视图/表名】请重开后台或者给角色重新分配下权限
          </div>
          <div class="desc-item">
            4、若只是建一级菜单或空菜单url不用填写,【视图/表名】填写.或者/
          </div>
        </el-alert> -->
        <div class="multi-table-tip">
          <div class="multi-table-tip-header">
            <span class=" el-icon-warning-outline"></span>
            <span class="multi-table-tip-title">菜单配置说明</span>
          </div>
          <ol class="multi-table-tip-list">
            <!-- <li>代码生成器生成的页面,Url在Vue项目中src->router->viewGrid.js对应表名的path属性,移动端在pages.json中的path属性</li>-->
            <li>如果修改了【视图/表名】需要给角色重新分配下菜单权限</li>
            <li>如果只是创建一级菜单或空菜单,url不用填写,【视图/表名】填写.或者/</li>
          </ol>
        </div>
        <div style="padding: 0px 30px 0 20px; margin-top: 15px" class="form-content">
          <vol-form ref="formRef" :formRules="options" :formFields="fields"> </vol-form>
          <div style="padding: 5px 21px">
            <div style="padding-bottom: 10px; color: #737272; font-size: 14px">
              <label style="width: 100px">权限按钮</label>
            </div>
            <div class="auth-group auth-group-row">
              <div class="ck">
                <el-checkbox-group v-model="actions">
                  <el-checkbox v-for="(item, index) in action" :key="index" :value="item.value"><span
                      style="top: -2px; position: relative">{{
                        item.text + "(" + item.value + ")"
                      }}</span></el-checkbox>

                </el-checkbox-group>
                <el-button type="primary" plain size="small" class="auth-extra-btn" @click="actionModel = true">
                  <i class="el-icon-plus"></i>其他权限
                </el-button>
              </div>

            </div>
          </div>
          <div class="m-btn">
            <el-button type="primary" @click="save"><i class="el-icon-check"></i>保存</el-button>
            <el-button type="success" @click="add"><i class="el-icon-plus"></i>新建</el-button>
            <el-button type="default" @click="addChild"><i class="el-icon-plus"></i>添加子级</el-button>
            <el-button type="primary" plain @click="addBrother"><i class="el-icon-circle-plus"></i> 添加同级</el-button>
            <el-button type="danger" plain @click="delMenu"><i class="el-icon-delete"></i> 删除菜单</el-button>
          </div>
        </div>
      </el-scrollbar>
    </div>
  </div>
</template>
<script setup lang="jsx">
import { ref, onMounted, getCurrentInstance, nextTick } from "vue";
import Icons from "@/components/basic/Icons.vue";
import VolMenu from "@/components/basic/VolElementMenu.vue";
import http from "@/api/http";

const { proxy } = getCurrentInstance();

const formRef = ref();
const actionFormRef = ref();
const tree = ref([]);
/** 级联 orginData：含 id=0 顶级节点，供 getTreeAllParent 解析路径 */
const menuFlatForCascader = ref([]);
const actionValues = ref([]);
const action = ref([
  { text: "查询", value: "Search" },
  { text: "新建", value: "Add" },
  { text: "删除", value: "Delete" },
  { text: "编辑", value: "Update" },
  { text: "复制", value: "CopyData" },
  { text: "导入", value: "Import" },
  { text: "导出", value: "Export" },
  { text: "上传", value: "Upload" },
  { text: "审核", value: "Audit" },
  { text: "反审", value: "AntiAudit" },
]);
const len = action.value.length;
const actions = ref([]);
actionValues.value = action.value.map((x) => {
  return x.value;
});

const actionModel = ref(false);
const model = ref(false);

const fields = ref({
  menu_Id: 0,
  parentId: [],
  menuName: "",
  tableName: "",
  url: "",
  auth: "",
  icon: "",
  orderNo: 0,
  enable: 1,
  menuType: null,
  createDate: "",
  creator: "",
  modifyDate: "",
  authData: null,
  linkType: 0,
});

const actionFields = ref({
  name: "",
  value: "",
});
const actionOptions = ref([
  [
    {
      title: "权限名称",
      field: "name",
      placeholder: "权限名称,如：新增",
      required: true,
    },
  ],
  [
    {
      title: "权 限 值",
      field: "value",
      placeholder: "权限值,如：Add",
      required: true,
    },
  ],
]);

const options = ref([
  [
    {
      title: "菜单ID",
      field: "menu_Id",
      placeholder: "菜单ID",
      min: 0,
      disabled: true,
    },
    {
      title: "父级菜单",
      required: true,
      type: "cascader",
      min: 0,
      field: "parentId",
      data: [],
      orginData: [],
      checkStrictly: true,
    },
    {
      title: "菜单名称",
      field: "menuName",
      required: true,
    },
  ],
  [
    {
      title: "视图/表名",
      field: "tableName",
      placeholder: "与代码生成器使用的名称相同",
      required: true,
      labelRender: (h, { }) => {
        return (
          <div>
            <el-tooltip placement="top-start" title="" trigger="hover">
              {{
                default: () => {
                  return (
                    <span>
                      视图/表名
                      <i
                        style="font-size:12px;margin-left:3px;color:#4f58d2"
                        class="el-icon-warning-outline"
                      ></i>
                    </span>
                  );
                },
                content: () => {
                  return (
                    <div>
                      <div>1.生成的页面，这里应该填写代码生成器上填写的表名</div>
                      <div>2.不是生成的页面，这里任意填写没有写过的名字</div>
                      <div>3. 如果只是创建目录菜单,填写.或者/</div>
                    </div>
                  );
                },
              }}
            </el-tooltip>
          </div>
        );
      }
    },
    {
      title: "(路由)Url",
      field: "url",
      placeholder: "见:上面菜单配置说明",
      labelRender: (h, { }) => {
        return (
          <div>
            <el-tooltip placement="top-start" title="" trigger="hover">
              {{
                default: () => {
                  return (
                    <span>
                      路由地址
                      <i
                        style="font-size:12px;margin-left:3px;color:#4f58d2"
                        class="el-icon-warning-outline"
                      ></i>
                    </span>
                  );
                },
                content: () => {
                  return (
                    <div>
                      <div>1. web页面url：前端web项目src- &gt; router- &gt; viewGrid.js对应表名的path属性</div>
                      <div>2. 移动端url：在pages.json中的path属性</div>
                      <div>3. 如果只是创建目录菜单,url不用填写</div>
                    </div>
                  );
                },
              }}
            </el-tooltip>
          </div>
        );
      },
    },
    {
      title: "排序号",
      field: "orderNo",
      type: "number",
      min: 0,
      placeholder: "值越大显示越靠前",
      required: true,
    },
  ],
  [
    {
      title: "是否启用",
      field: "enable",
      required: true,
      type: "select",
      colSize: 4,
      data: [
        { key: 1, value: "启用" },
        { key: 2, value: "启用不显示" },
        { key: 0, value: "禁用" },
      ],
    },
    {
      title: "菜单类型",
      field: "menuType",
      required: true,
      type: "select",
      colSize: 4,
      data: [
        { key: 0, value: "PC菜单" },
        { key: 1, value: "移动端菜单" },
      ],
      onChange: (value) => {
        iconChange(value);
      },
    },
    {
      title: "链接类型",
      field: "linkType",
      required: false,
      type: "select",
      colSize: 4,
      datKey: "enable",
      data: [
        { key: 0, value: "请选择" },
        // { key: 2, value: "一级分类菜单(首页导航菜单)" },
        { key: 1, value: "外部url链接" }
      ],
    },
  ],
  [
    {
      title: "图标Icon",
      field: "icon",
      type: "img",
      url: "api/sys_user/upload",
    },
  ],
]);

const iconChange = (value) => {
  if (value === 0) {
    options.value[options.value.length - 1][0].render = (h) => {
      return (
        <div>
          <el-button
            type="primary"
            plain
            onClick={() => {
              model.value = true;
            }}
          >
            选择图标
          </el-button>
          <i
            style="font-size:25px;margin-left:10px;position:relative;top:4px"
            class={fields.value.icon}
          ></i>
        </div>
      );
    };
    fields.value.icon = [];
  } else {
    fields.value.icon = "";
    options.value[options.value.length - 1][0].render = null;
  }
};
iconChange(0);

/** 将扁平菜单转为 el-cascader 的 options（含顶级 value:0） */
const buildCascaderOptions = (flatRows) => {
  const rows = flatRows.filter((f) => f.id !== 0);
  const map = new Map();
  rows.forEach((item) => {
    map.set(item.id, {
      value: item.id,
      label: item.name,
      children: [],
    });
  });
  const roots = [];
  rows.forEach((item) => {
    const pid = item.parentId ?? 0;
    const node = map.get(item.id);
    if (!node) return;
    if (pid && map.has(pid)) {
      map.get(pid).children.push(node);
    } else {
      roots.push(node);
    }
  });
  const prune = (nodes) => {
    nodes.forEach((n) => {
      if (!n.children || !n.children.length) delete n.children;
      else prune(n.children);
    });
  };
  prune(roots);
  return [...[{ value: 0, label: "一级菜单(目录菜单)", children: [] }], ...roots];
};

const parentIdToPath = (pid) => {
  // cascader 需要完整路径，如 [1,2,3]
  if (Array.isArray(pid)) {
    const arr = pid
      .filter((x) => x !== null && x !== undefined)
      .map((x) => Number(x) || 0);
    const filtered = arr.filter((x) => x !== 0);
    return filtered.length ? filtered : [0];
  }
  if (pid === null || pid === undefined || pid === "") {
    return [0];
  }
  const parentId = Number(pid) || 0;
  if (parentId === 0) {
    return [0];
  }

  const flat = menuFlatForCascader.value;
  if (!flat || !flat.length) {
    return [parentId];
  }
  const chain = proxy.base.getTreeAllParent(parentId, flat);
  if (chain && chain.length) {
    // 过滤掉顶级 0，只保留真实菜单路径；顶级则返回 [0]
    const ids = chain.map((k) => Number(k.id) || 0).filter((x) => x !== 0);
    return ids.length ? ids : [0];
  }
  return [parentId];
};

const applyCascaderFromMenuList = (list) => {
  const flat = [
    { id: 0, parentId: null, name: "顶级" },
    ...list.map((item) => ({
      id: item.id,
      parentId: item.parentId ?? 0,
      name: item.name,
    })),
  ];
  menuFlatForCascader.value = flat;
  const cascaderItem = options.value[0][1];
  cascaderItem.orginData = flat;
  cascaderItem.data = buildCascaderOptions(flat);
};

const getTreeItem = (node) => {
  http.post("api/menu/getTreeItem?menuId=" + node, {}, true).then((x) => {
    try {
      fields.value.icon = x.icon;
      iconChange(x.menuType);
      if (x.auth) {
        x.auth = JSON.parse(x.auth);
        action.value.splice(len, 100);

        actions.value = x.auth.map((element) => {
          if (actionValues.value.indexOf(element.value) == -1) {
            action.value.push(element);
          }
          return element.value;
        });
      } else {
        action.value.splice(20, action.value.length);
        x.auth = [];
        fields.value.icon = "";
        actions.value = [];
      }
    } catch (error) {
      console.log("菜单功能权限转换成JSON失败:" + x.auth);
      x.auth = [];
      actions.value = [];
    }
    formRef.value.reset(x);
    nextTick(() => {
      fields.value.parentId = parentIdToPath(x.parentId);
    });
  });
};

const initTree = () => {
  return http.post("api/menu/getMenu", {}, true).then((x) => {
    x.forEach((item) => {
      item.parentId = item.parentId || 0;
      item.icon = item.icon || "el-icon-menu";
      if (item.menuType == 1 && !item.parentId) {
        item.name = "(app)" + item.name;
      }
    });
    tree.value = x;
    applyCascaderFromMenuList(x);
  });
};

onMounted(() => {
  initTree();
});

const otherAction = () => {
  actionFormRef.value.validate(() => {
    let exist = action.value.some((x) => {
      return x.text == actionFields.value.name || x.value == actionFields.value.value;
    });
    if (exist) {
      return proxy.$message.error("权限名称或权限值已存在");
    }
    actionModel.value = false;
    action.value.push({
      text: actionFields.value.name,
      value: actionFields.value.value,
    });
  });
};

const add = (obj) => {
  const merged = Object.assign({ enable: 1 }, obj || { parentId: 0 });
  formRef.value.reset(merged);
  actions.value = ["Search"];
  nextTick(() => {
    fields.value.parentId = parentIdToPath(merged.parentId);
  });
};

const addChild = () => {
  if (!isSelect()) return;
  add({ parentId: fields.value.menu_Id });
};

const addBrother = () => {
  if (!isSelect()) return;
  let pid = fields.value.parentId;
  if (Array.isArray(pid)) {
    pid = pid.length ? pid[pid.length - 1] : 0;
  }
  add({ parentId: pid });
};

const delMenu = () => {
  if (fields.value.menu_Id == 0) {
    return proxy.$Message.error("请选择菜单");
  }

  let tigger = false;
  proxy
    .$confirm("确认要删除【" + fields.value.menuName + "】菜单吗？", "警告", {
      confirmButtonText: "确定",
      cancelButtonText: "取消",
      type: "warning",
      center: true,
    })
    .then(() => {
      if (tigger) return;
      tigger = true;
      let menuId = fields.value.menu_Id;
      http.post("/api/menu/delMenu?menuId=" + menuId, {}, "正在删除数据....").then((x) => {
        if (!x.status) return proxy.$Message.error(x.message);
        formRef.value.reset();
        proxy.$Message.info(x.message);
        initTree();
      });
    });
};

const save = () => {
  formRef.value.validate(() => {
    fields.value.auth = "";
    if (actions.value) {
      fields.value.auth = action.value.filter((x) => {
        return actions.value.indexOf(x.value) != -1;
      });
    }
    if (
      fields.value.auth &&
      fields.value.auth instanceof Array &&
      fields.value.auth.length > 0
    ) {
      fields.value.auth = JSON.stringify(fields.value.auth);
    } else {
      fields.value.auth = "";
    }

    const saveFields = Object.assign({}, fields.value);
    if (Array.isArray(saveFields.parentId)) {
      const arr = saveFields.parentId;
      saveFields.parentId = arr.length ? arr[arr.length - 1] : 0;
    }
    if (Array.isArray(saveFields.icon)) {
      saveFields.icon = saveFields.icon
        .map((x) => {
          return x.path;
        })
        .join(",");
    }

    const currentId = Number(saveFields.menu_Id) || 0;
    const parentIdInt = Number(saveFields.parentId) || 0;
    if (currentId > 0) {
      const flat = menuFlatForCascader.value;
      if (flat && flat.length) {
        const subtreeIds = proxy.base.getTreeAllChildrenId(currentId, flat);
        if (subtreeIds.includes(parentIdInt)) {
          proxy.$message.error(
            "父级不能为当前菜单本身或其下级菜单,请重新选择父级id"
          );
          return;
        }
      }
    }

    const wasNew = !fields.value.menu_Id;
    http.post("/api/menu/save", saveFields, true).then((x) => {
      if (!x.status) {
        proxy.$message.error(x.message);
        return;
      }

      proxy.$message.success(x.message);
      initTree().then(() => {
        if (wasNew && x.data) {
          fields.value.menu_Id = x.data.menu_Id;
          fields.value.createDate = x.data.createDate;
          fields.value.parentId = parentIdToPath(saveFields.parentId);
        }
      });
    });
  });
};

const isSelect = () => {
  let id = fields.value.menu_Id;
  if (!id) {
    proxy.$message.error("请选择节点");
    return false;
  }
  return true;
};

const onSelect = (icon) => {
  fields.value.icon = icon;
  proxy.$message.info(icon);
};

</script>

<style lang="less" scoped>
.on-icon {
  line-height: 20px;
  position: relative;

  .remove {
    display: none;
    color: red;
    right: 7px;
    position: absolute;
    top: -14px;
    font-size: 13px;
  }
}

.on-icon:hover {
  cursor: pointer;

  .remove {
    display: block;
  }
}

.action {
  width: 100%;
  display: flex;

  margin-bottom: 15px;

  .ivu-checkbox-wrapper {
    margin-right: 20px;
  }

  .ck {
    line-height: 33px;
    display: inline-block;
    display: flex;

    label:first-child {
      min-width: 58px;
      float: left;
      margin-top: 1px;
    }

    >div {
      float: left;
    }
  }
}

.menu-container {
  display: flex;
  position: absolute;
  width: 100%;
  height: 100%;
  padding: 8px;
  background: #f7f7f7;

  .menu-left {
    height: 100%;
    width: 201px;
    border: 1px solid #eee;
    display: flex;
    background: white;
    flex-direction: column;

    .module-name {
      border-radius: 0px;
      /* height: 5%; */
      line-height: 21px;
      margin-bottom: 0;
    }
  }

  .menu-right {
    flex: 1;
    border-radius: 3px;
    border: 1px solid #eee;
    background: white;
    margin-left: 9px;
    margin-right: 3px;
  }
}

.m-btn {
  margin-top: 20px;
  text-align: center;
}

.m-title {
  line-height: 40px;
  font-size: 15px;
  background: #66b1ff0f;
  font-weight: bold;
  padding: 6px 16px;
  border-bottom: 1px solid #eee;

  i {
    padding-right: 5px;
  }
}

.form-content {
  margin-top: 30px;
}

.menu-left ::v-deep(.el-scrollbar__bar.is-vertical) {
  width: 2px;
}

.auth-group {
  display: flex;

  &.auth-group-row {
    flex-wrap: wrap;
    align-items: flex-start;
    gap: 8px 12px;

    .ck {
      flex: 1;
      min-width: 0;
    }

    .auth-extra-btn {
      flex-shrink: 0;
      margin-top: 2px;
    }
  }

  label {
    display: inline-block;
    width: 100px;
    // text-align: right;
    color: #797979;
    font-size: 14px;
  }

  .ck {
    flex: 1;
  }

  .el-checkbox {
    min-width: 135px;
    width: auto !important;
    margin-right: 5px;
    display: inline-block;
    padding-bottom: 10px;
  }
}

.desc-item {
  font-size: 12px;
  line-height: 1.6;
}

.auth-group ::v-deep(.el-checkbox__label) {
  padding-left: 4px;
}

.multi-table-tip {
  padding: 12px 16px;
  background-color: #f7f7f9;
  border: 1px solid #c9ccff;
  border-radius: 6px;
  margin-bottom: 10px;

  .multi-table-tip-header {
    display: flex;
    align-items: center;
    gap: 8px;
    margin-bottom: 8px;


    .multi-table-tip-title {
      color: #4f58d2;
      font-weight: bold;
      font-size: 14px;
    }
  }

  .multi-table-tip-list {
    margin: 0;
    padding-left: 22px;
    color: #333;
    font-size: 13px;
    line-height: 1.8;

    li {
      margin-bottom: 4px;

      &:last-child {
        margin-bottom: 0;
      }
    }
  }
}
</style>
