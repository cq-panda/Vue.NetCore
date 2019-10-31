
import detailMethods from './detailMethods.js'
//业务处理方法,全部可以由开发覆盖
import serviceFilter from './serviceFilter.js'
let methods = {
    //当添加扩展组件gridHeader/gridBody/gridFooter及明细modelHeader/modelBody/modelFooter时，
    //如果要获取父级Vue对象,请使用此方法进行回调
    parentCall(fun) {
        if (typeof fun != 'function') {
            return console.log('扩展组件需要传入一个回调方法才能获取父级Vue对象')
        }
        fun(this);
    },
    getCurrentAction() {
        return "--" + (this.currentAction == this.const.ADD ? "新增" : "编辑");
    },
    getButtons() {//生成ViewGrid界面的操作按钮及更多选项
        if (this.buttons.length <= this.maxBtnLength) return this.buttons;
        let btns = this.buttons.slice(0, this.maxBtnLength);
        btns[this.maxBtnLength - 1].last = true;
        return btns;
    },
    extendBtn(btns, source) {//btns权限按钮，source为扩展按钮
        if (!btns || !(source && source instanceof Array)) { return; }
        //source通过在表的扩展js文件中buttons对应按钮的属性index决定按钮所放位置
        source.forEach((x) => {
            //通过按钮的Index属性，放到指定的位置
            btns.splice(x.index == undefined ? btns.length : x.index, 0, x);
        })
        // if (this.extend.buttons.view) {
        //     this.extend.buttons.view.forEach((x) => {
        //         //通过按钮的Index属性，放到指定的位置
        //         this.buttons.splice(x.index == undefined ? this.buttons.length : x.index, 0, x);
        //     })
        // }
    },
    initBoxButtons() { //初始化ViewGird与弹出框/明细表按钮
        let path = this.$route.path;
        //通过菜单获取用户所对应菜单需要显示的按钮
        this.buttons.push(... this.permission.getButtons(path));

        //查询界面扩展按钮(扩展按钮可自行通过设置按钮的Index属性显示到具体位置)
        this.extendBtn(this.buttons, this.extend.buttons.view);

        //弹出框按钮
        let boxButtons = [];

        let saveBtn = this.buttons.some(x => {
            if (x.value == this.const.ADD || x.value == this.const.EDIT) return true;
        });


        //从表表格操作按钮
        let detailGridButtons = {
            name: "刷新", icon: "md-refresh", onClick() {
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
            this.upload.template.url = this.http.ipAddress + this.getUrl(this.const.DOWNLOADTEMPLATE, true);
        }

        // disabled
        //如果当前角色没有编辑或新建功能，查看明细时字段设置全部只读
        //只有明细表，将明细表也设置为不可能编辑，并且不显示添加行、删除行
        if (!saveBtn) {
            this.editFormOptions.forEach(row => {
                row.forEach(x => {
                    x.disabled = true;
                })
            })
            //没有新增编辑权限的，弹出框都设置为只读
            this.detail.columns.forEach(row => {
                if (row.hasOwnProperty('edit')) {
                    row['edit'] = false;
                }
            })
            //弹出框扩展按钮
            this.extendBtn(boxButtons, this.extend.buttons.box)
            //弹出框扩展明细表按钮
            this.extendBtn(detailGridButtons, this.extend.buttons.detail)
            this.detailOptions.buttons.push(detailGridButtons);

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
        this.detailOptions.buttons.push(...[
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
        ]);

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
        if (
            (typeof value == "string" && value != "" && value.trim() != "") ||
            (value instanceof Array && value.length > 0)
        )
            return false;
        return true;
    },
    getSearchParameters() {//获取查询参数
        this.searchBoxShow = false;
        let query = { wheres: [] };
        for (const key in this.searchFormFileds) {
            let value = this.searchFormFileds[key];
            if (this.emptyValue(value)) continue;
            let displayType = this.getSearchItem(key);
            if (typeof value == "string" || ["date", "datetime"].indexOf(displayType) == -1) {
                query.wheres.push({
                    name: key,
                    value: typeof value == "string" || !value ? value : value.join(','),
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
    search() {//查询
        let query = this.getSearchParameters();
        this.$refs.table.load(query, true);
    },
    loadTableBefore(param, callBack) {//查询前
        let status = this.searchBefore(param);
        callBack(status);
    },
    loadTableAfter(data, callBack) {//查询后
        let status = this.searchAfter(data);
        callBack(status);
    },
    loadDetailTableBefore(param, callBack) {//明细查询前
        //新建时禁止加载明细
        if (this.currentAction == this.const.ADD) {
            callBack(false);
            return false;
        }
        let status = this.searchDetailBefore(param);
        callBack(status);
    },
    loadDetailTableAfter(data, callBack) {//明细查询后
        let status = this.searchDetailAfter(data);
        callBack(status);
    },
    getSearchItem(field) {//获取查询的参数
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
    resetSearch() {//重置查询对象
        this.resetSearchForm();
    },
    resetEdit() { //重置编辑的数据
        let isEdit = this.currentAction != this.const.ADD;
        //重置之前
        if (!this[isEdit ? 'resetUpdateFormBefore' : 'resetAddFormBefore']()) {
            return;
        }
        let objKey = {};
        //编辑状态下,不需要重置主键,创建时间创建人
        if (isEdit) {
            objKey[this.table.key] = this.editFormFileds[this.table.key];
        }
        this.resetEditForm(objKey);
        //重置之后
        if (!this[isEdit ? 'resetUpdateFormAfter' : 'resetAddFormAfter']()) {
            return;
        }
    },
    resetSearchForm(sourceObj) {
        //重置查询表
        this.resetForm("searchForm", sourceObj);
    },
    resetEditForm(sourceObj) {
        if (this.hasDetail && this.$refs.detail) {
            this.$refs.detail.rowData.splice(0);
        }
        this.resetForm("form", sourceObj);
    },
    resetForm(formName, sourceObj) {
        //重置表单数据
        if (this.$refs[formName]) {
            this.$refs[formName].reset();
        }

        if (!sourceObj) return;
        let form = formName == "searchForm"
            ? this.searchFormFileds
            : this.editFormFileds;

        for (const key in form) {
            if (sourceObj.hasOwnProperty(key)) {
                let newVal = sourceObj[key];
                //this.hasKeyField.indexOf(key) != -1默认所有字典项的key都需要设置为字符串，不是数字
                form[key] = this.hasKeyField.indexOf(key) != -1
                    ? (newVal + "")
                    : newVal;
            } else {
                form[key] = form[key] instanceof Array ? [] : "";
            }
        }
    },
    onBtnClick(param) {
        this[param.method](param.data);
    },
    refresh() {//刷新
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
        if (!this.$refs.form.validate()) return;

        let formData = {
            mainData: this.editFormFileds,
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
        if (this.currentAction == this.const.ADD) {
            if (!this.addBefore(formData)) return;
        } else {
            if (!this.updateBefore(formData)) return;
        }
        let url = this.getUrl(this.currentAction);
        this.http.post(url, formData, true).then(x => {
            //保存后
            if (this.currentAction == this.const.ADD) {
                if (!this.addAfter(x)) return;
            } else {
                if (!this.updateAfter(x)) return;
            }
            if (!x.status) return this.$Message.error(x.message);
            // //保存后拦截
            // if (!this.saveAfter(formData, x)) return;
            this.$Message.info(x.message);

            x.data = typeof x.data == "string" && x.data != ""
                ? JSON.parse(x.data).data
                : x.data.data
            let resultRow = x.data;

            if (this.currentAction == this.const.ADD) {
                //  this.currentRow=x.data;
                this.editFormFileds[this.table.key] = "";
                this.currentAction = this.const.EDIT;
                this.currentRow = resultRow.data;
                // if (this.hasDetail) {
                //     this.$refs.detail.rowData=resultRow.list;
                // }
            }
            this.resetEditForm(resultRow);
            //重置数据,待测试
            if (this.hasDetail) {
                this.detailOptions.delKeys = [];
                this.boxModel = false;
                //  this.$refs.detail.rowData.push(...resultRow.list);
            }

            this.refresh();
        });
    },
    del() {
        //删除数据
        let rows = this.$refs.table.getSelected();
        if (rows.length == 0) return this.$message.error("请选择要删除的行!");
        let delKeys = rows.map(x => {
            return x[this.table.key];
        });
        if (!delKeys || delKeys.length == 0)
            return this.$message.error("没有获取要删除的行数据!");
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
                    if (!x.status) return this.$Message.error(x.message);
                    this.$Message.info(x.message);
                    //删除后
                    if (!this.delAfter(x)) {
                        return;
                    }
                    this.refresh();
                });
            } //, onCancel: () => {}
        });
    },

    initBox() { //初始化新建、编辑的弹出框
        this.modelOpenBefore(this.currentRow);
        if (!this.boxInit) {
            this.boxInit = true;
            this.boxModel = true;
            // this.detailUrl = this.url;
        }
    },
    setEditForm(row) {
        //重置编辑表单数据
        this.editFormFileds[this.table.key] = row[this.table.key];
        this.resetEditForm(row);
        this.currentAction = this.const.EDIT;
        this.boxModel = true;
    },
    linkData(row, column) {   //点击table单元格快捷链接显示编辑数据
        this.currentAction = this.const.EDIT;
        this.currentRow = row;
        this.initBox();
        this.resetDetailTable(row);
        this.setEditForm(row);
        //点击编辑按钮弹出框后，可以在此处写逻辑，如，从后台获取数据
        this.modelOpenProcess(row);
    },
    add() {//新建
        this.currentAction = this.const.ADD;
        this.currentRow = null;
        this.initBox();
        if (this.hasDetail) {
            this.$refs.detail &&
                this.$refs.detail.rowData &&
                this.$refs.detail.rowData.splice(0);
        }
        this.resetEditForm({});
        //  this.resetEditForm();
        this.boxModel = true;
        //点击新建按钮弹出框后，可以在此处写逻辑，如，从后台获取数据
        this.modelOpenProcess();
        // this.modelOpenAfter();
    },
    edit() {//编辑
        let rows = this.$refs.table.getSelected();
        if (rows.length == 0) {
            return this.$message.error("请选择要编辑的行!");
        }
        //记录当前编辑的行
        this.currentRow = rows[0];
        //初始化弹出框
        this.initBox();
        //重置表单
        this.resetDetailTable();

        //设置当前的数据到表单上
        this.setEditForm(rows[0]);
        //点击编辑按钮弹出框后，可以在此处写逻辑，如，从后台获取数据
        this.modelOpenProcess(rows[0]);
        // this.modelOpenAfter(rows[0]);
    },
    modelOpenProcess(row) {
        if (!this.$refs.form) {
            let timeOut = setTimeout(x => {
                this.modelOpenAfter(row);
            }, 300)
            return;
        }
        this.modelOpenAfter(row);
    },
    import() { //导入(上传excel),弹出导入组件UploadExcel.vue
        this.upload.excel = true;
    },
    download(url, fileName) { //下载导出的文件
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
    export() {//导出
        //导出
        let url = this.getUrl(this.const.EXPORT);
        let query = this.getSearchParameters();
        let param = { order: this.pagination.order, wheres: query.wheres };
        if (param.wheres && typeof param.wheres == "object") {
            param.wheres = JSON.stringify(param.wheres);
        }
        let $http = this.http;
        $http.post(url, param, "正在导出数据....").then(result => {
            if (!result.status) {
                return this.$message.error(result.message);
            }
            let path = this.getUrl(this.const.DOWNLOAD);
            path = path[0] == "/" ? path.substring(1) : path;
            this.download(
                $http.ipAddress + path + "?path=" + result.data,
                this.table.cnName + ".xlsx"// filePath
            );
            ///  window.open($http.ipAddress + path + "?fileName=" + filePath, "_self");
        });
    },
    audit() {//审核弹出框
        let rows = this.$refs.table.getSelected();
        if (rows.length == 0) return this.$message.error("请选择要审核的行!");
        let checkStatus = rows.every(x => {
            return x.AuditStatus > 0;
        });
        if (checkStatus) return this.$message.error("只能选择审核中的数据!");
        this.auditParam.rows = rows.length;
        this.auditParam.model = true;
    },
    saveAudit() {//保存审核
        let rows = this.$refs.table.getSelected();
        if (this.auditParam.status == -1)
            return this.$message.error("请选择审核结果!");

        if (rows.length != this.auditParam.rows)
            return this.$message.error("所选数据已发生变化,请重新选择审数据!");

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
            if (!x.status) return this.$Message.error(x.message);
            this.auditParam.rows = 0;
            this.auditParam.status = -1;
            this.auditParam.reason = '';
            this.auditParam.model = false;
            this.$Message.info(x.message);
            this.refresh();
        });
    },
    openViewColumns() {//查看表结构
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
    viewModelCancel() {//查看表结构
        this.viewModel = false;
    },
    initFormOptions(formOptions, keys) {//初始化查询、编辑对象的下拉框数据源
        //let defaultOption = { key: "", value: "请选择" };
        formOptions.forEach(item => {
            item.forEach(d => {
                if (!d.dataKey) return true;
                if (keys.indexOf(d.dataKey) == -1) {
                    keys.push(d.dataKey);
                    //data:[defaultOption]
                    this.dicKeys.push({ dicNo: d.dataKey, config: "", data: [] });
                }
                d.data = this.dicKeys.filter(f => {
                    return f.dicNo == d.dataKey;
                })[0];
            });
        });
    },
    //初始table与明细表的数据源指向dicKeys对象，再去后台加载数据源
    initColumns(scoure, dicKeys, keys) {
        if (!scoure || !(scoure instanceof Array)) return;
        scoure.forEach(item => {
            if (!item.bind) return true;
            if (this.hasKeyField.indexOf(item.field) == -1) {
                this.hasKeyField.push(item.field);
            }
            let key = item.bind.key || item.bind.dicNo;
            var dic = dicKeys.filter(x => {
                return x.dicNo == key;
            });
            if (!dic || dic.length == 0) {
                dicKeys.push({ dicNo: key, config: "", data: [] });
                dic = [dicKeys[dicKeys.length - 1]];
                keys.push(key);
            }
            item.bind = dic[0];
        });
    },
    bindOptions(dic) { //绑定下拉框的数据源
        //绑定后台的字典数据
        dic.forEach(d => {
            this.dicKeys.forEach(x => {
                if (x.dicNo != d.dicNo) return true;
                // try {
                //     x.config = eval("(" + d.config + ")");
                // } catch (error) {
                //     x.config = { valueField: '', textField: '' }
                // }
                if (d.data.length > 0 && !d.data[0].hasOwnProperty("key")) {
                    let source = d.data,
                        newSource = new Array(source.length);
                    for (let index = 0; index < source.length; index++) {
                        newSource[index] = {
                            //默认从字典数据读出来的key都是string类型,但如果数据从sql中查询的可能为非string,否是async-validator需要重置设置格式
                            key: source['key'] + '',//source[index][x.config.valueField] + "",
                            value: source['value']//source[index][x.config.textField]
                        };
                    }
                    x.data.push(...newSource);
                } else {
                    x.data.push(...d.data);
                }
                //   x.data.push(...d.data);
            });
        });
    },
    getUrl(action, ingorPrefix) {//是否忽略前缀/  获取操作的url
        return (!ingorPrefix ? "/" : "") + "api" + this.table.url + action;
    },
    initDicKeys() { //初始化字典数据
        let keys = [];
        //初始化编辑数据源,默认为一个空数组
        this.initFormOptions(this.editFormOptions, keys);
        //初始化查询数据源,默认为一个空数组
        this.initFormOptions(this.searchFormOptions, keys);
        //查询日期设置为可选开始与结果日期
        this.searchFormOptions.forEach(item => {
            item.forEach(x => {
                if (x.type == "date" || x.type == "datetime") x.range = true;
            });
        });
        //初始化datatable表数据源,默认为一个空数组,dicKeys为界面所有的数据字典编号 
        this.initColumns(this.columns, this.dicKeys, keys);
        if (this.detailOptions && this.detailOptions.columns) {
            this.initColumns(this.detailOptions.columns, this.dicKeys, keys)
        }
        //初始化快速查询字段
        if (this.searchFormOptions.length > 0) {
            if (!this.singleField) {
                this.singleSearch = this.searchFormOptions[0][0];
            } else {
                this.searchFormOptions.forEach(x => {
                    if (this.singleSearch) return false;
                    this.singleSearch = x.find(item => {
                        return item.field == this.singleField;
                    });
                });
            }
        }
        if (keys.length == 0) return;
        let $internalVue = this;
        this.http.post("/api/Sys_Dictionary/GetVueDictionary", keys).then(dic => {
            $internalVue.bindOptions(dic);
        });
    },
    initBoxHeightWidth() { //初始化弹出框的高度与宽度
        let clientHeight = document.documentElement.clientHeight;
        //弹出框高度至少250px
        clientHeight = clientHeight < 250 ? 250 : clientHeight;
        let clientWidth = document.documentElement.clientWidth;

        if (this.boxOptions.height) {
            //如果高度与宽度超过了获取到的可见高宽度，则设为默认的90%高宽
            if (this.boxOptions.height > clientHeight * 0.8) {
                this.boxOptions.height = clientHeight * 0.8
            }
        }
        if (this.boxOptions.width) {
            //如果高度与宽度超过了获取到的可见高宽度，则设为默认的90%高宽
            if (this.boxOptions.height > clientWidth * 0.8) {
                this.boxOptions.width = clientWidth * 0.8
            }
        }
        this.height = clientHeight - 210;
        this.url = this.getUrl(this.const.PAGE);
        //计算弹出框的高与宽度
        //如果有明细表，高度与宽带设置为0.9/0.82
        if (this.detail.columns && this.detail.columns.length > 0) {
            this.hasDetail = true;
            clientWidth = clientWidth * 0.8;
            clientHeight = clientHeight * 0.82;
            this.detailOptions.height =
                clientHeight - this.editFormOptions.length * 57 - 205;
            this.detailOptions.height = this.detailOptions.height < 240 ? 240 : this.detailOptions.height;
            this.detailOptions.columns = this.detail.columns;
            this.detailOptions.pagination.sortName = this.detail.sortName;
            this.detailOptions.cnName = this.detail.cnName;
            this.detailOptions.key = this.detail.key;
            this.detailOptions.url = this.getUrl("getDetailPage");
        } else {
            let maxColumns = 1; //最大列数，根据列计算弹框的宽度
            this.editFormOptions.forEach(x => {
                if (x.length > maxColumns) maxColumns = x.length;
            });
            let maxHeightRate = 0.7, maxWidthRate = 0.5;
            maxWidthRate = maxColumns / 10 + 0.3;
            maxHeightRate = (this.editFormOptions.length || 1) * 0.1 + 0.03;
            maxHeightRate = maxHeightRate > 0.9 ? 0.9 : maxHeightRate;
            clientWidth = clientWidth * maxWidthRate;
            clientHeight = clientHeight * maxHeightRate;
            // this.boxOptions.width = clientWidth * maxWidthRate;
            // this.boxOptions.height = clientHeight * maxHeightRate;
        }
        this.boxOptions = { height: this.boxOptions.height || clientHeight, width: this.boxOptions.width || clientWidth };
    }
};
//合并扩展方法
methods = Object.assign(methods, detailMethods, serviceFilter);
export default methods;