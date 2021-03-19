import detailMethods from "./detailMethods.js";
//业务处理方法,全部可以由开发覆盖
import serviceFilter from "./serviceFilter.js";
let methods = {
  //当添加扩展组件gridHeader/gridBody/gridFooter及明细modelHeader/modelBody/modelFooter时，
  //如果要获取父级Vue对象,请使用此方法进行回调
  parentCall(fun) {
    if (typeof fun != "function") {
      return console.log("扩展组件需要传入一个回调方法才能获取父级Vue对象");
    }
    fun(this);
  },
  getCurrentAction() {
    if (this.currentReadonly) {
      return "";
    }
    return "--" + (this.currentAction == this.const.ADD ? "新增" : "编辑");
  },
  quickSearchKeyPress($event) {
    //查询字段为input时，按回车查询
    if ($event.keyCode == 13) {
      if (this._searchFormFields[this.singleSearch.field] != "") {
        this.search();
      }
    }
  },
  getButtons() {
    //生成ViewGrid界面的操作按钮及更多选项
    let searchIndex = this.buttons.findIndex(x => {
      return x.value == "Search";
    });
    //添加高级查询
    if (searchIndex != -1) {
      this.buttons.splice(searchIndex + 1, 0, {
        icon: "ios-arrow-down",
        class: "r-dropdown",
        name: "",
        type: this.buttons[searchIndex].type,
        onClick: () => {
          this.searchBoxShow = !this.searchBoxShow;
        }
      });
    }
    this.maxBtnLength += searchIndex == -1 ? 0 : 1;
    if (this.buttons.length <= this.maxBtnLength) return this.buttons;
    let btns = this.buttons.slice(0, this.maxBtnLength);
    btns[this.maxBtnLength - 1].last = true;
    return btns;
  },
  extendBtn(btns, source) {
    //btns权限按钮，source为扩展按钮
    if (!btns || !(source && source instanceof Array)) {
      return;
    }
    //source通过在表的扩展js文件中buttons对应按钮的属性index决定按钮所放位置
    source.forEach(x => {
      //通过按钮的Index属性，放到指定的位置
      btns.splice(x.index == undefined ? btns.length : x.index, 0, x);
    });
    // if (this.extend.buttons.view) {
    //     this.extend.buttons.view.forEach((x) => {
    //         //通过按钮的Index属性，放到指定的位置
    //         this.buttons.splice(x.index == undefined ? this.buttons.length : x.index, 0, x);
    //     })
    // }
  },
  initBoxButtons() {
    //初始化ViewGird与弹出框/明细表按钮
    let path = this.$route.path;
    //通过菜单获取用户所对应菜单需要显示的按钮
    let permissionButtons = this.permission.getButtons(
      path,
      null,
      this.extend.tableAction
    );
    if (permissionButtons) {
      //2020.03.31添加深拷贝按钮组
      permissionButtons.forEach(p => {
        let _obj = {};
        for (const key in p) {
          _obj[key] = p[key];
        }
        this.buttons.push(_obj);
      });
      // this.buttons.push(...permissionButtons);
    }
    if (!this.extend) {
      this.extend = {};
    }
    if (!this.extend.buttons) {
      this.extend.buttons = {};
    }
    //查询界面扩展按钮(扩展按钮可自行通过设置按钮的Index属性显示到具体位置)
    if (this.extend.buttons.view) {
      this.extendBtn(this.buttons, this.extend.buttons.view);
    }

    //弹出框按钮
    let boxButtons = [];

    let saveBtn = this.buttons.some(x => {
      if (
        x.value &&
        (x.value.toLowerCase() == this.const.ADD.toLowerCase() ||
          x.value.toLowerCase() == this.const.EDIT.toLowerCase())
      )
        return true;
    });
    this.currentReadonly = !saveBtn;
    //从表表格操作按钮
    let detailGridButtons = {
      name: "刷新",
      icon: "md-refresh",
      onClick() {
        //如果明细表当前的状态为新建时，禁止刷新
        if (this.currentAction == this.const.ADD) {
          return;
        }
        this.refreshRow();
      }
    };

    let importExcel = this.buttons.some(x => {
      if (x.value == this.const.IMPORT) return true;
    });
    //如果有导入权限,则需要初始化导入组件
    if (importExcel) {
      this.upload.url = this.getUrl(this.const.IMPORT);
      //定义下载模板的文件名
      this.upload.template.fileName = this.table.cnName;
      //定义下载模板的Url路径
      this.upload.template.url =
        this.http.ipAddress + this.getUrl(this.const.DOWNLOADTEMPLATE, true);
    }

    // disabled
    //如果当前角色没有编辑或新建功能，查看明细时字段设置全部只读
    //只有明细表，将明细表也设置为不可能编辑，并且不显示添加行、删除行
    if (!saveBtn) {
      this.editFormOptions.forEach(row => {
        row.forEach(x => {
          x.disabled = true;
        });
      });
      //没有新增编辑权限的，弹出框都设置为只读
      this.detail.columns.forEach(row => {
        if (row.hasOwnProperty("edit")) {
          row["edit"] = false;
        }
      });
      //弹出框扩展按钮
      this.extendBtn(boxButtons, this.extend.buttons.box);
      //弹出弹框按钮(2020.04.21),没有编辑或新建权限时，也可以通过buttons属性添加自定义弹出框按钮
      this.boxButtons.push(...boxButtons);
      this.detailOptions.buttons.push(detailGridButtons);
      //弹出框扩展明细表按钮
      this.extendBtn(this.detailOptions.buttons, this.extend.buttons.detail);

      return boxButtons;
    }

    this.detailOptions.edit = true;
    boxButtons.push(
      ...[
        {
          name: "保 存",
          icon: "md-checkmark",
          type: "error",
          onClick() {
            this.save();
          }
        },
        {
          name: "重 置",
          icon: "md-refresh",
          type: "success",
          onClick() {
            this.resetEdit();
          }
        }
      ]
    );
    //从表表格操作按钮
    this.detailOptions.buttons.push(
      ...[
        {
          name: "添加行",
          icon: "md-add",
          onClick() {
            this.addRow();
          }
        },
        {
          name: "删除行",
          icon: "md-close",
          onClick() {
            this.delRow();
          }
        }
      ]
    );

    //弹出框扩展按钮
    this.extendBtn(boxButtons, this.extend.buttons.box);

    //弹出框扩展明细表按钮
    this.detailOptions.buttons.push(detailGridButtons);
    this.extendBtn(this.detailOptions.buttons, this.extend.buttons.detail);

    //弹出弹框按钮
    this.boxButtons.push(...boxButtons);
  },
  onClick(click) {
    click.apply(this);
  },
  changeDropdown(btnName, v1) {
    let button = this.buttons.filter(x => {
      return x.name == btnName;
    });
    if (button && button.length > 0) {
      button[0].onClick.apply(this);
    }
  },
  emptyValue(value) {
    return value === null || value === undefined || value === "";
  },
  getSearchParameters() {
    //获取查询参数
    // 2020.09.11增加固定查询表单,如果设置固定了查询表单，点击查询时，不再关闭
    if (!this.fiexdSearchForm) {
      this.searchBoxShow = false;
    }

    let query = { wheres: [] };
    for (const key in this._searchFormFields) {
      let value = this._searchFormFields[key];
      if (this.emptyValue(value)) continue;

      if (typeof value == "number") {
        value = value + "";
      }
      let displayType = this.getSearchItem(key);
      //联级只保留选中节点的最后一个值
      if (displayType == "cascader") {
        //查询下面所有的子节点，如：选中的是父节点，应该查询下面所有的节点数据--待完
        value = value.length ? (value[value.length - 1] + "") : "";
      }
      if (
        typeof value == "string" ||
        ["date", "datetime"].indexOf(displayType) == -1
      ) {
        query.wheres.push({
          name: key,
          value: typeof value == "string" || !value ? value : value.join(","),
          displayType: displayType
        });
        continue;
      }
      for (let index = 0; index < value.length; index++) {
        query.wheres.push({
          name: key,
          value: value[index],
          displayType: (() => {
            if (["date", "datetime"].indexOf(displayType) != -1) {
              return index ? "lessorequal" : "thanorequal";
            }
            return displayType;
          })()
        });
      }
    }
    return query;
  },
  search() {
    //查询
    // let query = this.getSearchParameters();
    // this.$refs.table.load(query, true);
    this.$refs.table.load(null, true);
  },
  loadTableBefore(param, callBack) {
    //查询前设置查询条件及分页信息
    let query = this.getSearchParameters();
    if (query) {
      param = Object.assign(param, query);
    }
    let status = this.searchBefore(param);
    callBack(status);
  },
  loadTableAfter(data, callBack, result) {
    //查询后
    //2020.10.30增加查询后返回所有的查询信息
    let status = this.searchAfter(data, result);
    callBack(status);
  },
  loadDetailTableBefore(param, callBack) {
    //明细查询前
    //新建时禁止加载明细
    if (this.currentAction == this.const.ADD) {
      callBack(false);
      return false;
    }
    let status = this.searchDetailBefore(param);
    callBack(status);
  },
  loadDetailTableAfter(data, callBack) {
    //明细查询后
    let status = this.searchDetailAfter(data);
    callBack(status);
  },
  getSearchItem(field) {
    //获取查询的参数
    let data;
    for (let index = 0; index < this.searchFormOptions.length; index++) {
      if (data) return data.type;
      const item = this.searchFormOptions[index];
      data = item.find(x => {
        return x.field == field;
      });
    }
    return data.type;
  },
  resetSearch() {
    //重置查询对象
    this.resetSearchForm();
    //2020.10.17增加重置后方法
    this.resetSearchFormAfter && this.resetSearchFormAfter();
  },
  resetEdit() {
    //重置编辑的数据
    let isEdit = this.currentAction != this.const.ADD;
    //重置之前
    if (!this[isEdit ? "resetUpdateFormBefore" : "resetAddFormBefore"]()) {
      return;
    }
    let objKey = {};
    //编辑状态下,不需要重置主键,创建时间创建人
    if (isEdit) {
      objKey[this.table.key] = this._editFormFields[this.table.key];
    }
    this.resetEditForm(objKey);
    //重置之后

    if (!this[isEdit ? "resetUpdateFormAfter" : "resetAddFormAfter"]()) {
      return;
    }
  },
  resetSearchForm(sourceObj) {
    //重置查询表
    this.resetForm("searchForm", sourceObj);
  },
  resetEditForm(sourceObj) {
    if (this.hasDetail && this.$refs.detail) {
      // this.$refs.detail.rowData.splice(0);
      this.$refs.detail.reset();
    }
    this.resetForm("form", sourceObj);
  },
  getKeyValueType(formData, isEditForm) {
    try {
      let keyLeft = (isEditForm ? "e" : "s") + "_b_";
      formData.forEach(item => {
        item.forEach(x => {
          if (this.keyValueType.hasOwnProperty(keyLeft + x.field)) {
            return true;
          }
          let data;
          if (x.type == "switch") {
            this.keyValueType[x.field] = 1;
          } else if (x.bind && x.bind.data) {
            data = x.bind.data;
          } else if (x.data) {
            if (x.data instanceof Array) {
              data = x.data;
            } else if (x.data.data && x.data.data instanceof Array) {
              data = x.data.data;
            }
          }
          if (
            data &&
            data.length > 0 &&
            !this.keyValueType.hasOwnProperty(x.field)
          ) {
            this.keyValueType[x.field] = data[0].key;
            this.keyValueType[keyLeft + x.field] = x.type;
          }
        });
      });
    } catch (error) {
      console.log(error.message);
    }
  },
  resetForm(formName, sourceObj) {
    //   return;
    //重置表单数据
    if (this.$refs[formName]) {
      this.$refs[formName].reset();
    }

    if (!sourceObj) return;
    let form, keyLeft;
    if (formName == "searchForm") {
      form = this._searchFormFields;
      keyLeft = "s" + "_b_";
    } else {
      form = this._editFormFields;
      keyLeft = "e" + "_b_";
    }
    //获取数据源的data类型，否则如果数据源data的key是数字，重置的值是字符串就无法绑定值
    if (!this.keyValueType._dinit) {
      this.getKeyValueType(this.editFormOptions, true);
      this.getKeyValueType(this.searchFormOptions, false);
      this.keyValueType._dinit = true;
    }
    var _cascaderParentTree;
    for (const key in form) {
      if (sourceObj.hasOwnProperty(key)) {
        let newVal = sourceObj[key];
        let kv_type = this.keyValueType[keyLeft + key];

        if (
          kv_type == "selectList" ||
          kv_type == "checkbox" ||
          kv_type == "cascader"
        ) {
          // 2020.05.31增加iview组件Cascader
          // 2020.11.01增加iview组件Cascader表单重置时查询所有的父节点
          if (kv_type == "cascader") {
            var treeDic = this.dicKeys.find(dic => {
              return dic.fileds && dic.fileds.indexOf(key) != -1;
            })
            if (treeDic && treeDic.orginData && treeDic.orginData.length) {
              if (typeof treeDic.orginData[0].id == 'number') {
                newVal = ~~newVal;
              } else {
                newVal = newVal + '';
              }
              _cascaderParentTree = this.base.getTreeAllParent(newVal, treeDic.orginData);
              if (_cascaderParentTree) {
                newVal = _cascaderParentTree.map(x => { return x.id })
              }
            } else {
              newVal = [newVal];
            }
          }
          else if (
            newVal != "" &&
            newVal != undefined &&
            typeof newVal == "string"
          ) {
            newVal = newVal.split(",");
          } else if (kv_type == "checkbox") {
            newVal = [];
          }
        } else if (
          this.keyValueType.hasOwnProperty(key) &&
          typeof this.keyValueType[key] == "number" &&
          newVal * 1 == newVal
        ) {
          newVal = newVal * 1;
        } else {
          if (newVal == null || newVal == undefined) {
            newVal = "";
          } else {
            newVal += "";
          }
        }
        if (newVal instanceof Array) {
          if (form[key]) {
            form[key] = [];
          }
          form[key].splice(0)
          //  this.$set(form, key, newVal);
          form[key].push(...newVal);
          if (kv_type == "cascader") {
            this.$nextTick(() => {
              //封装后iview原生监听不到model变化，后面再调试看看2020.11.01
              _cascaderParentTree = _cascaderParentTree || [];
              _cascaderParentTree.forEach(c => {
                c.label = c.value;
              })
              this.$refs.form.$refs[key][0].selected = _cascaderParentTree;
            });
          }
        } else {
          form[key] = newVal;
        }
      } else {
        form[key] = form[key] instanceof Array ? [] : "";
      }
    }
  },
  onBtnClick(param) {
    this[param.method](param.data);
  },
  refresh() {
    //刷新
    this.search();
    // this.$refs.table.load();
  },
  saveBefore(formData) {
    return true;
  },
  saveAfter(formData, result) {
    return true;
  },
  save() {
    //新增或编辑时保存
    // if (!this.$refs.form.validate()) return;
    this.$refs.form.validate(result => {
      if (result) {
        this.saveExecute();
      }
    });
  },
  async saveExecute() {
    let _editFormFields = {};
    //上传文件以逗号隔开
    for (const key in this._editFormFields) {
      if (
        this.uploadfiled &&
        this.uploadfiled.length > 0 &&
        this.uploadfiled.indexOf(key) != -1 &&
        this._editFormFields[key] instanceof Array
      ) {
        let allPath = this._editFormFields[key].map(x => {
          return x.path;
        });
        _editFormFields[key] = allPath.join(",");
      } else {
        _editFormFields[key] = this._editFormFields[key];
      }
    }
    //将数组转换成string
    //2020.11.01增加级联处理
    for (const key in _editFormFields) {
      if (_editFormFields[key] instanceof Array) {

        var iscascader = this.dicKeys.some(x => { return x.type == "cascader" && x.fileds && x.fileds.indexOf(key) != -1 });
        if (iscascader && _editFormFields[key].length) {
          _editFormFields[key] = _editFormFields[key][_editFormFields[key].length - 1];
        } else {
          _editFormFields[key] = _editFormFields[key].join(",");
        }

      }
    }

    let formData = {
      mainData: _editFormFields,
      detailData: null,
      delKeys: null
    };

    //获取明细数据(前台数据明细未做校验，待完.后台已经校验)
    if (this.hasDetail) {
      formData.detailData = this.$refs.detail.rowData;
    }
    if (this.detailOptions.delKeys.length > 0) {
      formData.delKeys = this.detailOptions.delKeys;
    }
    //保存前拦截
    let _currentIsAdd = this.currentAction == this.const.ADD;
    if (_currentIsAdd) {
      //2020.12.06增加新建前异步处理方法
      if (!this.addBefore(formData) || await !this.addBeforeAsync(formData)) return;
    } else {
      //2020.12.06增加修改前异步处理方法
      if (!this.updateBefore(formData) || await !this.updateBeforeAsync(formData)) return;
    }
    let url = this.getUrl(this.currentAction);
    this.http.post(url, formData, true).then(x => {
      //保存后
      if (_currentIsAdd) {
        if (!this.addAfter(x)) return;
      } else {
        if (!this.updateAfter(x)) return;
      }
      if (!x.status) return this.$error(x.message);
      this.$success(x.message);
      //如果保存成功后需要关闭编辑框，直接返回不处理后面
      if (this.boxOptions.saveClose) {
        this.boxModel = false;
        //2020.12.27如果是编辑保存后不重置分页页数，刷新页面时还是显示当前页的数据
        this.$refs.table.load(null, _currentIsAdd);
        //this.refresh();
        return;
      }
      let resultRow;
      if (typeof x.data == "string" && x.data != "") {
        resultRow = JSON.parse(x.data);
      } else {
        resultRow = x.data;
      }

      if (this.currentAction == this.const.ADD) {
        //  this.currentRow=x.data;
        this._editFormFields[this.table.key] = "";
        this.currentAction = this.const.EDIT;
        this.currentRow = resultRow.data;
      }
      this.resetEditForm(resultRow.data);
      // console.log(resultRow);
      if (this.hasDetail) {
        this.detailOptions.delKeys = [];
        if (resultRow.list) {
          this.$refs.detail.rowData.push(...resultRow.list);
        }
      }
      this.$refs.table.load(null, _currentIsAdd);
      // this.refresh();
    });
  },
  del() {
    //删除数据
    let rows = this.$refs.table.getSelected();
    if (rows.length == 0) return this.$error("请选择要删除的行!");
    let delKeys = rows.map(x => {
      return x[this.table.key];
    });
    if (!delKeys || delKeys.length == 0)
      return this.$error("没有获取要删除的行数据!");
    //删除前
    if (!this.delBefore(delKeys, rows)) {
      return;
    }
    let tigger = false;
    this.$Modal.confirm({
      title: "删除警告!",
      content:
        '<p style="color: red;font-weight: bold;letter-spacing: 3px;">确认要删除选择的数据吗?</p>',
      onOk: () => {
        if (tigger) return;
        tigger = true;
        let url = this.getUrl(this.const.DEL);
        this.http.post(url, delKeys, "正在删除数据....").then(x => {
          if (!x.status) return this.$error(x.message);
          this.$success(x.message);
          //删除后
          if (!this.delAfter(x)) {
            return;
          }
          this.refresh();
        });
      } //, onCancel: () => {}
    });
  },
  async modelOpenBeforeAsync(row) {
    return true;
  },
  async initBox() {
    //初始化新建、编辑的弹出框
    if (!await this.modelOpenBeforeAsync(this.currentRow)) return false;
    this.modelOpenBefore(this.currentRow);
    if (!this.boxInit) {
      this.boxInit = true;
      this.boxModel = true;
      // this.detailUrl = this.url;
    }
    return true;
  },
  setEditForm(row) {
    // if (this.remoteColumns.length == 0 || !rows || rows.length == 0) return;
    let remoteColumns = this.$refs.table.remoteColumns;
    remoteColumns.forEach(column => {
      this.editFormOptions.forEach(option => {
        option.forEach(x => {
          if (x.field == column.field) {
            x.data.data = Object.assign([], x.data, column.bind.data);
          }
        });
      });
    });
    this._editFormFields;
    //重置编辑表单数据
    this._editFormFields[this.table.key] = row[this.table.key];

    this.resetEditForm(row);
    this.currentAction = this.const.EDIT;
    this.boxModel = true;
  },
  async linkData(row, column) {
    //点击table单元格快捷链接显示编辑数据
    this.currentAction = this.const.EDIT;
    this.currentRow = row;
    if (!await this.initBox()) return;
    this.resetDetailTable(row);
    this.setEditForm(row);
    //设置远程查询表单的默认key/value
    this.getRemoteFormDefaultKeyValue();
    //点击编辑按钮弹出框后，可以在此处写逻辑，如，从后台获取数据
    this.modelOpenProcess(row);
  },
  async add() {
    //新建
    this.currentAction = this.const.ADD;
    this.currentRow = {};
    if (!await this.initBox()) return;
    if (this.hasDetail) {
      this.$refs.detail &&
        //  this.$refs.detail.rowData &&
        this.$refs.detail.reset();
    }
    let obj = {};
    //如果有switch标签，默认都设置为是
    this.editFormOptions.forEach(x => {
      x.forEach(item => {
        if (item.type == "switch") {
          obj[item.field] = 1;
        }
      });
    });
    this.resetEditForm(obj);
    //  this.resetEditForm();
    this.boxModel = true;
    //点击新建按钮弹出框后，可以在此处写逻辑，如，从后台获取数据
    this.modelOpenProcess();
    // this.modelOpenAfter();
  },
  async edit() {
    //编辑
    this.currentAction = this.const.EDIT;
    let rows = this.$refs.table.getSelected();
    if (rows.length == 0) {
      return this.$error("请选择要编辑的行!");
    }
    //记录当前编辑的行
    this.currentRow = rows[0];
    //初始化弹出框
    if (!await this.initBox()) return;
    //重置表单
    this.resetDetailTable();

    //设置当前的数据到表单上
    this.setEditForm(rows[0]);
    //设置远程查询表单的默认key/value
    this.getRemoteFormDefaultKeyValue();
    //点击编辑按钮弹出框后，可以在此处写逻辑，如，从后台获取数据
    this.modelOpenProcess(rows[0]);
    // this.modelOpenAfter(rows[0]);
  },
  getRemoteFormDefaultKeyValue() {
    //设置表单远程数据源的默认key.value
    if (this.currentAction != this.const.EDIT || this.remoteKeys.length == 0)
      return;
    this.editFormOptions.forEach((x, xIndex) => {
      x.forEach((item, yIndex) => {
        if (item.remote) {
          let column = this.columns.find(x => {
            return x.bind && x.bind.key == item.dataKey;
          });
          if (!column) return;
          let key = this.currentRow[item.field];
          let obj = column.bind.data.find(x => {
            return x.key == key;
          });
          // obj ? obj.value : key如果没有查到数据源，直接使用原数据
          item.data = [{ key: key, value: obj ? obj.value : key }];
          this.editFormOptions[xIndex].splice(yIndex, 1, item);
          // this.$set(item, 'data', [{ key: key + '', value: obj.value }])
          //  item.data = [{ key: key + '', value: obj.value }];
        }
      });
    });
  },
  modelOpenProcess(row) {
    this.$nextTick(() => {
      this.modelOpenAfter(row);
    });
    return;
    // if (!this.$refs.form) {
    //     let timeOut = setTimeout(x => {
    //         this.modelOpenAfter(row);
    //     }, 500)
    //     return;
    // }
    // this.modelOpenAfter(row);
  },
  import() {
    //导入(上传excel),弹出导入组件UploadExcel.vue
    this.upload.excel = true;
    this.$refs.upload_excel && this.$refs.upload_excel.reset();
  },
  download(url, fileName) {
    //下载导出的文件
    let xmlResquest = new XMLHttpRequest();
    xmlResquest.open("GET", url, true);
    xmlResquest.setRequestHeader("Content-type", "application/json");
    xmlResquest.setRequestHeader(
      "Authorization",
      this.$store.getters.getToken()
    );
    let elink = this.$refs.export;
    xmlResquest.responseType = "blob";
    xmlResquest.onload = function (oEvent) {
      if (xmlResquest.status != 200) {
        this.$error("下载文件出错了..");
        return;
      }
      let content = xmlResquest.response;
      //  let elink = this.$refs.export;//document.createElement("a");
      elink.download = fileName; //+".xlsx";
      // elink.style.display = "none";
      let blob = new Blob([content]);
      elink.href = URL.createObjectURL(blob);
      //  document.body.appendChild(elink);
      elink.click();
      //  document.body.removeChild(elink);
    };
    xmlResquest.send();
  },
  export() {
    //导出
    //导出
    let url = this.getUrl(this.const.EXPORT);
    let query = this.getSearchParameters();
    let param = { order: this.pagination.order, wheres: query.wheres || [] };
    //2020.06.25增加导出前处理
    if (!this.exportBefore(param)) {
      return;
    }

    if (param.wheres && typeof param.wheres == "object") {
      param.wheres = JSON.stringify(param.wheres);
    }
    let $http = this.http;
    $http.post(url, param, "正在导出数据....").then(result => {
      if (!result.status) {
        return this.$error(result.message);
      }
      let path = this.getUrl(this.const.DOWNLOAD);
      path = path[0] == "/" ? path.substring(1) : path;
      this.download(
        $http.ipAddress + path + "?path=" + result.data,
        this.table.cnName + ".xlsx" // filePath
      );
      ///  window.open($http.ipAddress + path + "?fileName=" + filePath, "_self");
    });
  },
  getSelectRows() {
    //获取选中的行
    return this.$refs.table.getSelected();
  },
  getDetailSelectRows() {
    //或获取明细选中的行
    if (!this.$refs.detail) {
      return [];
    }
    return this.$refs.detail.getSelected();
  },
  audit() {
    //审核弹出框
    let rows = this.$refs.table.getSelected();
    if (rows.length == 0) return this.$error("请选择要审核的行!");
    let checkStatus = rows.every(x => {
      return x.AuditStatus > 0;
    });
    if (checkStatus) return this.$error("只能选择审核中的数据!");
    this.auditParam.rows = rows.length;
    this.auditParam.model = true;
  },
  saveAudit() {
    //保存审核
    let rows = this.$refs.table.getSelected();
    if (this.auditParam.status == -1) return this.$error("请选择审核结果!");

    if (rows.length != this.auditParam.rows)
      return this.$error("所选数据已发生变化,请重新选择审数据!");

    let keys = rows.map(x => {
      return x[this.table.key];
    });
    if (!this.auditBefore(keys, rows)) {
      return;
    }
    let url =
      this.getUrl(this.const.AUDIT) +
      "?auditReason=" +
      this.auditParam.reason +
      "&auditStatus=" +
      this.auditParam.status;
    this.http.post(url, keys, "审核中....").then(x => {
      if (!this.auditAfter(x, rows)) {
        return;
      }
      if (!x.status) return this.$error(x.message);
      this.auditParam.rows = 0;
      this.auditParam.status = -1;
      this.auditParam.reason = "";
      this.auditParam.model = false;
      this.$success(x.message);
      this.refresh();
    });
  },
  openViewColumns() {
    //查看表结构
    if (this.viewColumns == 0) {
      this.viewColumns.push(
        ...[
          { title: "名称", key: "title" },
          { title: "字段", key: "field" },
          { title: "类型", key: "type" },
          { title: "是否显示", key: "hidden" },
          { title: "绑定数据源", key: "bind" }
        ]
      );
      this.columns.forEach(x => {
        this.viewData.push({
          title: x.title,
          field: x.field,
          type: x.type,
          hidden: x.hidden ? "否" : "是",
          bind: x.bind ? x.bind.dicNo : "--",
          cellClassName: {
            title: "table-info-cell-title"
          }
        });
      });
    }
    this.viewModel = true;
  },
  viewModelCancel() {
    //查看表结构
    this.viewModel = false;
  },
  initFormOptions(formOptions, keys, formFileds, isEdit) {
    //初始化查询、编辑对象的下拉框数据源、图片上传链接地址
    //let defaultOption = { key: "", value: "请选择" };
    //有上传的字段
    //2020.05.03新增
    //编辑数据源的类型
    formOptions.forEach(item => {
      item.forEach(d => {
        if (
          d.type == "img" ||
          d.type == "excel" ||
          d.type == "file" ||
          d.columnType == "img"
        ) {
          d.url = this.http.ipAddress + "api" + this.table.url + "Upload";
          this.uploadfiled.push(d.field);
        }
        if (!d.dataKey) return true;
        //开启远程搜索
        if (d.remote) {
          this.remoteKeys.push(d.dataKey);
          d.data = []; //{ dicNo: d.dataKey, data: [] };
          return true;
        }
        //2020.05.03增加编辑表单对checkbox的支持
        if (d.type == "checkbox" && !(formFileds[d.field] instanceof Array)) {
          formFileds[d.field] = [];
        }
        if (keys.indexOf(d.dataKey) == -1) {
          //2020.05.03增加记录编辑字段的数据源类型

          keys.push(d.dataKey);
          //2020.05.03修复查询表单与编辑表单type类型变成强一致性的问题
          //this.dicKeys.push({ dicNo: d.dataKey, data: [], type: d.type });
          //  2020.11.01增加iview组件Cascader数据源存储
          let _dic = { dicNo: d.dataKey, data: [], fileds: [d.field], orginData: [] };
          if (d.type == "cascader") {
            _dic.type = "cascader";
          }
          if (isEdit) {
            _dic['e_type'] = d.type;
          }
          this.dicKeys.push(_dic);
        } else if (d.type == "cascader") {
          //强制开启联级可以选择某个节点
          if (!d.hasOwnProperty("changeOnSelect")) {
            d.changeOnSelect = true;
            // d.formatter = label => {
            //   return label.join(' / ')
            // };
          }

          this.dicKeys.forEach(x => {
            if (x.dicNo == d.dataKey) {
              x.type = "cascader";
              x.fileds.push(d.field);
            }
          })
        }

        //2020.01.30移除内部表单formOptions数据源配置格式data.data，所有参数改为与组件api格式相同
        Object.assign(
          d,
          this.dicKeys.filter(f => {
            return f.dicNo == d.dataKey;
          })[0]
        );
      });
    });
  },
  //初始table与明细表的数据源指向dicKeys对象，再去后台加载数据源
  initColumns(scoure, dicKeys, keys) {
    if (!scoure || !(scoure instanceof Array)) return;
    scoure.forEach(item => {
      if (!item.bind || (item.bind.data && item.bind.data.length > 0))
        return true;
      let key = item.bind.key || item.bind.dicNo;
      if (this.remoteKeys.indexOf(key) != -1) {
        item.bind.remote = true;
        return true;
      }
      if (this.hasKeyField.indexOf(item.field) == -1) {
        this.hasKeyField.push(item.field);
      }
      var dic = dicKeys.filter(x => {
        return x.dicNo == key;
      });
      if (!dic || dic.length == 0) {
        dicKeys.push({ dicNo: key, data: [] });
        dic = [dicKeys[dicKeys.length - 1]];
        keys.push(key);
      }
      //2020.11.01增加级联处理
      if (dic[0].type == "cascader") {
        item.bind = { data: dic[0].orginData, tyep: "select" }
      } else {
        item.bind = dic[0];
      }
      //2020.05.03优化table数据源checkbox与select类型从编辑列中选取
      item.bind.type = item.bind.e_type || "string";
    });
  },
  bindOptions(dic) {
    //绑定下拉框的数据源
    //绑定后台的字典数据
    dic.forEach(d => {
      this.dicKeys.forEach(x => {
        if (x.dicNo != d.dicNo) return true;
        //2020.10.26增加级联数据源绑定处理
        if (x.type == "cascader") {
          // x.data=d.data;
          //生成tree结构
          x.data.push(... this.base.convertTree(JSON.parse(JSON.stringify(d.data)), (node, data, isRoot) => {
            node.label = node.value;
            node.value = node.key;
          }));
          x.orginData.push(...d.data);
        } else if (d.data.length > 0 && !d.data[0].hasOwnProperty("key")) {
          let source = d.data,
            newSource = new Array(source.length);
          for (let index = 0; index < source.length; index++) {
            newSource[index] = {
              //默认从字典数据读出来的key都是string类型,但如果数据从sql中查询的可能为非string,否是async-validator需要重置设置格式
              key: source["key"] + "", //source[index][x.config.valueField] + "",
              value: source["value"] //source[index][x.config.textField]
            };
          }

          x.data.push(...newSource);
        } else {
          //2020.06.06，如果是selectList数据源使用的自定义sql并且key是数字，强制转换成字符串
          if (
            x.e_type == "selectList" &&
            d.data.length > 0 &&
            typeof d.data[0].key == "number"
          ) {
            d.data.forEach(c => {
              c.key = c.key + "";
            });
          }
          x.data.push(...d.data);
        }
        if (
          this.singleSearch &&
          this.singleSearch.dataKey &&
          this.singleSearch.dataKey == x.dicNo
        ) {
          this.singleSearch.data.splice(0, 1, ...x.data);
        }
      });
    });
  },
  getUrl(action, ingorPrefix) {
    //是否忽略前缀/  获取操作的url
    return (!ingorPrefix ? "/" : "") + "api" + this.table.url + action;
  },
  initDicKeys() {
    //初始化字典数据
    let keys = [];
    this.dicKeys.splice(0);
    //初始化编辑数据源,默认为一个空数组，如果要求必填设置type=number/decimal的最小值
    this.initFormOptions(this.editFormOptions, keys, this._editFormFields, true);
    //初始化查询数据源,默认为一个空数组
    this.initFormOptions(
      this.searchFormOptions,
      keys,
      this._searchFormFields,
      false
    );
    //查询日期设置为可选开始与结果日期
    this.searchFormOptions.forEach(item => {
      item.forEach(x => {
        if (x.type == "date" || x.type == "datetime") x.range = true;
      });
    });
    //初始化datatable表数据源,默认为一个空数组,dicKeys为界面所有的数据字典编号
    this.initColumns(this.columns, this.dicKeys, keys);
    if (this.detailOptions && this.detailOptions.columns) {
      this.initColumns(this.detailOptions.columns, this.dicKeys, keys);
    }
    //初始化快速查询字段,默认使用代码生成器配置的第一个查询字段
    if (this.searchFormOptions.length > 0) {
      this.singleSearch = {
        dataKey: this.searchFormOptions[0][0].dataKey,
        dicNo: this.searchFormOptions[0][0].dicNo,
        field: this.searchFormOptions[0][0].field,
        title: this.searchFormOptions[0][0].title,
        type: this.searchFormOptions[0][0].type,
        data: []
      };
      // this.singleSearch = this.searchFormOptions[0][0];
    }
    if (keys.length == 0) return;
    let $internalVue = this;
    this.http.post("/api/Sys_Dictionary/GetVueDictionary", keys).then(dic => {
      $internalVue.bindOptions(dic);
    });
  },
  setFiexdColumn(columns, containerWidth) {
    //计算整个table的宽度，根据宽度决定是否启用第一行显示的列为固定列
    let columnsWidth = 0;
    columns.forEach(x => {
      if (!x.hidden && x.width) {
        columnsWidth += x.width;
      }
    });
    //启用第一列为固定列
    if (columnsWidth > containerWidth) {
      let firstColumn = columns.find(x => !x.hidden);
      if (firstColumn) {
        firstColumn.fixed = true;
      }
    }
  },
  initBoxHeightWidth() {
    //初始化弹出框的高度与宽度
    let clientHeight = document.documentElement.clientHeight;
    //弹出框高度至少250px
    clientHeight = clientHeight < 250 ? 250 : clientHeight;
    let clientWidth = document.documentElement.clientWidth;
    if (this.editFormOptions.some(x => { return x.some(item => { return item.type == "editor" }) })) {
      this.editor.uploadImgUrl = this.getUrl("upload");
      this.boxOptions.height = clientHeight * 0.8;
      this.boxOptions.width = clientWidth * 0.8;
    }
    else {
      if (this.boxOptions.height) {
        //如果高度与宽度超过了获取到的可见高宽度，则设为默认的90%高宽
        if (this.boxOptions.height > clientHeight * 0.8) {
          this.boxOptions.height = clientHeight * 0.8;
        }
      }
      if (this.boxOptions.width) {
        //如果高度与宽度超过了获取到的可见高宽度，则设为默认的90%高宽
        if (this.boxOptions.width > clientWidth * 0.8) {
          this.boxOptions.width = clientWidth * 0.8;
        }
      }
    }
    //计算整个table的宽度，根据宽度决定是否启用第一行显示的列为固定列
    let maxTableWidth = clientWidth - 270;
    this.setFiexdColumn(this.columns, maxTableWidth);

    this.height = this.tableHeight || clientHeight - 210;
    this.url = this.getUrl(this.const.PAGE);
    //计算弹出框的高与宽度
    //如果有明细表，高度与宽带设置为0.9/0.82
    if (this.detail.columns && this.detail.columns.length > 0) {
      this.hasDetail = true;
      clientWidth = clientWidth * 0.8;
      clientHeight = clientHeight * 0.82;
      if (!this.detailOptions.height) {
        this.detailOptions.height =
          clientHeight - this.editFormOptions.length * 57 - 205;
        this.detailOptions.height =
          this.detailOptions.height < 240 ? 240 : this.detailOptions.height;
      }

      this.detailOptions.columns = this.detail.columns;
      this.detailOptions.pagination.sortName = this.detail.sortName;
      this.detailOptions.cnName = this.detail.cnName;
      this.detailOptions.key = this.detail.key;
      this.detailOptions.url = this.getUrl("getDetailPage");
      //计算弹出框整个table的宽度，根据宽度决定是否启用第一行显示的列为固定列
      this.setFiexdColumn(this.detail.columns, clientWidth);
    } else {
      let maxColumns = 1; //最大列数，根据列计算弹框的宽度
      this.editFormOptions.forEach(x => {
        if (x.length > maxColumns) maxColumns = x.length;
      });
      let maxHeightRate = 0.7,
        maxWidthRate = 0.5;
      maxWidthRate = maxColumns / 10 + 0.3;
      maxHeightRate = (this.editFormOptions.length || 1) * 0.1 + 0.03;
      maxHeightRate = maxHeightRate > 0.9 ? 0.9 : maxHeightRate;
      clientWidth = clientWidth * maxWidthRate;
      clientHeight = clientHeight * maxHeightRate;
      // this.boxOptions.width = clientWidth * maxWidthRate;
      // this.boxOptions.height = clientHeight * maxHeightRate;
    }
    if (!this.boxOptions.height) {
      this.boxOptions.height = clientHeight;
    }
    if (!this.boxOptions.width) {
      this.boxOptions.width = clientWidth;
    }
  },
  rowOnChange(row) {
    this.rowChange(row);
  },
  rowChange(row) {
    //选中行checkbox行事件
  },
  rowOnClick({ row, column, event }) {
    this.rowClick({ row, column, event });
  },
  rowClick({ row, column, event }) {
    // 点击行事件(2020.11.07)
  },
  $error(message) {
    this.$Message.error({
      content: message,
      duration: 5
    });
  },
  $success(message) {
    this.$Message.success({
      content: message,
      duration: 3
    });
  },
  setFiexdSearchForm(visiable) { //2020.09.011增加固定查询表单功能,visiable=true默认将查询表单展开
    this.fiexdSearchForm = true;
    let refreshBtn = this.buttons.find(x => x.name == "刷 新");
    if (visiable) {
      this.searchBoxShow = true;
    }
    if (refreshBtn) {
      refreshBtn.name = "重 置";
      refreshBtn.onClick = function () {
        this.resetSearch();
      };
    }
  },
  endEditBefore(row, column, index) {//2021.03.19是否开启查询界面表格双击编辑结束方法,返回false不会结束编辑
    return true;
  },
  filterPermission(tableName, permission) {  //2021.03.19判断是否有某个表的按钮权限
    //:["Search","Add","Delete","Update","Import","Export","Upload","Audit"]
    const _result = (this.$store.state.system.permission || []).find(x => { return x.url == '/' + tableName });
    return _result && _result.permission.some(x => x == permission);
  }
};
//合并扩展方法
methods = Object.assign(methods, detailMethods, serviceFilter);
export default methods;
