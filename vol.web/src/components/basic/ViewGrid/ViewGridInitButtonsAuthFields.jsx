import { getUrl, resetSearch } from "./ViewGridProvider.jsx";
import action from "./Action.js";
import apiButtons from "@/api/buttons.js";

const inputType = [
  "text",
  "like",
  "likeStart",
  "likeEnd",
  "input",
  "textarea",
  "number",
];

const initSearchEvent = (props, proxy) => {
  //全局绑定查询输入框回车搜索
  props.searchFormOptions.forEach((x) => {
    x.forEach((option) => {
      //设置查询树形级联父级选择时候自动勾上下级
      if (option.type == "treeSelect") {
        // option.checkStrictly = false;
      }
      if (
        !option.onKeyPress &&
        (inputType.includes(option.type) || !option.type)
      ) {
        option.onKeyPress = ($event) => {
          if ($event && $event.keyCode === 13) {
            proxy.search();
          }
        };
      }
    });
  });
};

export const getButtons = (proxy, props, ctx, dataConfig) => {
  //生成ViewGrid界面的操作按钮及更多选项
  const buttons = dataConfig.buttons.value;
  let searchIndex = buttons.findIndex((x) => {
    return x.value === "Search";
  });
  initSearchEvent(props, proxy);

  //添加高级查询
  let hasOneFormItem =
    props.searchFormOptions.length === 1 &&
    props.searchFormOptions[0].length === 1;
  if (searchIndex !== -1 && !hasOneFormItem && !proxy.$global.fixedSearch) {
    buttons.splice(searchIndex + 1, 0, {
      icon: dataConfig.fixedSearchForm.value
        ? "el-icon-refresh-left"
        : "el-icon-search",
      name: dataConfig.fixedSearchForm.value ? "重置" : "高级查询",
      plain: true,
      value: dataConfig.fixedSearchForm.value ? "" : "advanced",
      type: buttons[searchIndex].type,
      onClick: async () => {
        if (dataConfig.fixedSearchForm.value) {
          return resetSearch(proxy, props);
        }
        if (!dataConfig.searchBoxShow.value) {
          if (!(await props.showAdvancedSearchBefore())) {
            return;
          }
          if (!(await proxy.showAdvancedSearchBefore.call(proxy))) {
            return;
          }
        }

        //显示、隐藏高级查询
        dataConfig.searchBoxShow.value = !dataConfig.searchBoxShow.value;
      },
    });
  }
  if (props.searchFormOptions.length === 1) {
    const option = props.searchFormOptions[0];
    if (
      option.length == 1 &&
      option[0].type != "radio" &&
      option[0].type != "checkbox"
    ) {
      option[0].itemStyle = "width:200px";
    }
  }
  // if (hasOneFormItem) {
  //   dataConfig.fixedSearchForm.value = false;
  // }
  dataConfig.maxBtnLength.value += searchIndex === -1 ? 0 : 1;
};

export const setViewReadonly = (props, dataConfig, b) => {
  props.editFormOptions.flat().forEach((x) => {
    if (!dataConfig.defaultFormReadonlyFields.value.includes(x.field)) {
      x.readonly = b;
    }
  })

  dataConfig.boxButtons.value.forEach((x) => {
    if (x.value == "save") {
      x.hidden = b;
    }
  });
  if (props.details?.length) {
    props.details.forEach(item => {
      item.buttons.forEach(x => {
        x.hidden = b;
      })
    })
  }
  dataConfig.detailOptions.buttons.forEach((x) => {
    x.hidden = b;
  });
  // console.log(props.editFormOptions.flat())
};

export const initButtonsAuthFields = (
  proxy,
  props,
  dataConfig,
  $route,
  hiddenFields,
) => {
  const buttons = dataConfig.buttons.value;
  // const boxButtons=dataConfig.boxButtons;
  const upload = dataConfig.upload;
  const detailOptions = dataConfig.detailOptions;
  const extend = props.extend || {};
  const details = props.details;
  //初始化ViewGird与弹出框/明细表按钮
  //通过菜单获取用户所对应菜单需要显示的按钮
  let permissionButtons;
  //预览
  if (props.priview) {
    permissionButtons = apiButtons.filter((x) => {
      return ["Search", "Add", "Update", "Export", "Delete"].includes(x.value);
    });
  } else {
    permissionButtons = proxy.base.getButtons(
      $route.path,
      null,
      extend.tableAction,
      props.table.name,
    );
  }

  //console.log(permissionButtons);
  if (permissionButtons) {
    //2020.03.31添加深拷贝按钮组
    permissionButtons.forEach((p) => {
      let _obj = {};
      for (const key in p) {
        _obj[key] = p[key];
      }
      buttons.push(_obj);
    });
    // this.buttons.push(...permissionButtons);
  }
  if (!extend.buttons) {
    extend.buttons = {};
  }
  //查询界面扩展按钮(扩展按钮可自行通过设置按钮的Index属性显示到具体位置)
  if (extend.buttons.view) {
    extendBtn(buttons, extend.buttons.view);
  }
  const pageBtns = proxy.$store.getters.getPermission("/" + props.table.name);
  if (pageBtns && pageBtns.permission?.includes("View")) {
    props.columns.push({
      title: "查看",
      field: "View_Btn",
      view: true,
      fixed: "right",
      align: "center",
      hidden: false,
      width: 50,
      formatter: () => {
        return `<a  href="javascript:void(0)" style="text-decoration: none;" class="el-icon-monitor"></a>`;
      },
      click: (row) => {
        proxy.viewClick(row)
        // dataConfig.currentAction.value = "View";
        // setViewReadonly(props, dataConfig, true);
        // proxy.edit([row]);
        // dataConfig.boxOptions.title = `${props.table.cnName}(${proxy.$ts('查看')})`;
      },
    });
  }
  //弹出框按钮
  let boxButtons = [];

  let saveBtn = buttons.some((x) => {
    if (
      x.value &&
      (x.value.toLowerCase() === action.ADD.toLowerCase() ||
        x.value.toLowerCase() === action.EDIT.toLowerCase())
    )
      return true;
  });
  dataConfig.currentReadonly.value = !saveBtn;
  //主从明细表格操作按钮
  let detailGridButtons = {
    name: "刷新",
    type: "info",
    value: "refresh",
    icon: "el-icon-refresh",
    onClick() {
      //如果明细表当前的状态为新建时，禁止刷新
      if (dataConfig.currentAction.value === action.ADD) {
        return;
      }
      proxy.refreshRow();
    },
  };



  let importExcel = buttons.some((x) => {
    if (x.value === action.IMPORT) return true;
  });
  //如果有导入权限,则需要初始化导入组件
  if (importExcel) {
    initImportOptions(proxy, props, dataConfig);
  }

  // disabled
  //如果当前角色没有编辑或新建功能，查看明细时字段设置全部只读
  //只有明细表，将明细表也设置为不可能编辑，并且不显示添加行、删除行
  if (!saveBtn) {
    props.editFormOptions.forEach((row) => {
      row.forEach((x) => {
        x.readonly = true;
      });
    });
    //没有新增编辑权限的，弹出框都设置为只读
    if (props.detail.columns) {
      props.detail.columns.forEach((column) => {
        if (column.hasOwnProperty("edit")) {
          column.readonly = true;
        }
      });
    }
    //弹出框扩展按钮
    extendBtn(boxButtons, extend.buttons.box);

    //弹出弹框按钮(2020.04.21),没有编辑或新建权限时，也可以通过buttons属性添加自定义弹出框按钮
    boxButtons.push(...boxButtons);
    detailOptions.buttons.push(detailGridButtons);
    detailOptions.buttons.forEach((button) => {
      if (!button.hasOwnProperty("hidden")) {
        button.hidden = false;
      }
    });

    //弹出框扩展明细表按钮
    extendBtn(detailOptions.buttons, extend.buttons.detail);
    return boxButtons;
  }

  detailOptions.edit = true;
  boxButtons.push(
    ...[
      {
        name: "保存",
        icon: "el-icon-check",
        type: "danger",
        disabled: false,
        value: "save",
        onClick() {
          proxy.save();
        },
      },
    ],
  );

  //主从明细表一对一
  detailOptions.buttons.push(
    ...[
      {
        name: "添加行",
        icon: "el-icon-plus",
        type: "primary",
        hidden: false,
        plain: true,
        onClick() {
          proxy.addRow();
        },
      },
      {
        type: "danger",
        plain: true,
        name: "删除行",
        hidden: false,
        icon: "el-icon-delete",
        onClick() {
          proxy.delRow();
        },
      },
      //注意需要重写后台明细表接口的导入与下载模板、导出的权限,Sys_DictionaryListController.cs/SellOrderListController.cs
      {
        type: "danger",
        plain: true,
        name: "导入",
        value: "import",
        hidden: false,
        icon: "el-icon-upload2",
        onClick() {
          initDetailImportOptions(proxy, props, dataConfig, { table: props.detail.table, cnName: props.detail.cnName }, true)
        },
      },
      {
        type: "danger",
        plain: true,
        name: "导出",
        value: "export",
        icon: "el-icon-download",
        hidden: false,
        onClick() {
          proxy.export(true);
        },
      },
    ],
  );
  detailOptions.buttons.forEach((button) => {
    if (button.hasOwnProperty("hidden")) {
      button.hidden = false;
    }
  });
  //弹出框扩展按钮
  extendBtn(boxButtons, extend.buttons.box);

  //弹出框扩展明细表按钮
  detailOptions.buttons.push(detailGridButtons);
  extendBtn(detailOptions.buttons, extend.buttons.detail);
  //弹出弹框按钮
  dataConfig.boxButtons.value.push(...boxButtons);

};


const isGenericImport = (proxy, props, dataConfig) => {
  if (props.generic && dataConfig.currentAction.value == 'Add') {
    proxy.$message.error(proxy.$ts('当前为新建数据,请在编辑时导入明细表数据'))
    return true;
  }
  return false;
}



const extendBtn = (btns, source) => {
  //btns权限按钮，source为扩展按钮
  if (!btns || !(source && source instanceof Array)) {
    return;
  }
  //source通过在表的扩展js文件中buttons对应按钮的属性index决定按钮所放位置
  source.forEach((x) => {
    //通过按钮的Index属性，放到指定的位置
    btns.splice(x.index === undefined ? btns.length : x.index, 0, x);
  });
};




//主表上传参数
export const initImportOptions = (proxy, props, dataConfig) => {
  const upload = dataConfig.upload;
  upload.url = getUrl(action.IMPORT, null, props.table, null, props, dataConfig.asyncApi.value);
  //定义下载模板的文件名
  upload.template.fileName = props.table.cnName;
  //定义下载模板的Url路径
  upload.template.url =
    proxy.http.ipAddress + getUrl(action.DOWNLOADTEMPLATE, true, props.table, null, props, dataConfig.asyncApi.value);

  if (props.generic) {
    upload.url += getGenericQueryTable(props)
    upload.template.url += getGenericQueryTable(props)
  }
};

//明细表上传参数
const initDetailImportOptions = (proxy, props, dataConfig, item, isDetail) => {
  if (isGenericImport(proxy, props, dataConfig)) {
    return;
  }
  const upload = dataConfig.upload;
  //不是主从表
  if (!isDetail) {
    upload.currentDetail = item;
  }
  const table = props.generic ? 'generic' : item.table
  let query = getGenericQueryTable(props, proxy, item.table) || '?table=1';
  const asyncApi = dataConfig.asyncApi.value;
  upload.url = `${proxy.http.ipAddress}api/${table}/${action.IMPORT}${asyncApi}${query}`;
  upload.template.url = `${proxy.http.ipAddress}api/${table}/${action.DOWNLOADTEMPLATE}${asyncApi}${query}`;
  //定义下载模板的文件名
  upload.template.fileName = item.cnName;
  upload.excel = true;

};

const getGenericQueryTable = (props, proxy, table) => {
  if (!props.generic) {
    return ''
  }
  let parm = `?tableName=${(table || props.table.name)}`
  if (proxy && proxy.currentRow) {
    parm += `&mainTable=${props.table.name}&id=${proxy.currentRow[props.table.key]}`;
  }
  return parm;
}
