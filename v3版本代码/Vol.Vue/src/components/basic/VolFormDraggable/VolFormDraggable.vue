<template>
  <div class="drag-container">

    <vol-box :model.sync="model"
             :height="300"
             :width="550"
             :lazy="true"
             title="弹出框">
      <div>弹出框内容</div>

      <div slot="footer">
        <el-button type="primary"
                   size="mini"
                   @click="model = false"><i class="el-icon-close"></i>点击关闭</el-button>
        <el-button size="mini"
                   @click="model = false"><i class="el-icon-close"></i>关闭</el-button>
      </div>

    </vol-box>

    <vol-box :model.sync="previewModel"
             :height="600"
             :width="1300"
             :lazy="true"
             :padding="1"
             :close="false"
             title="预览">
      <preview :options="viewFormData"></preview>
    </vol-box>

    <vol-box :model.sync="tableModel"
             :height="600"
             :width="1300"
             :lazy="true"
             :padding="0"
             :title="currentItem.name">
      <div slot="content">
        <el-alert title="关于table配置"
                  type="info"
                  :closable="false"
                  show-icon>
          此处table是对框架voltable基本操作的配置,如果需要事件触发、数据加载等更多功能，请在生成后的代码添加需要的功能，完整配置见文档<a href="http://v2.volcore.xyz/document/api"
             style="color: #1e88e5; margin-left: 9px"
             target="_blank">voltable</a>
        </el-alert>
        <div class="btns">
          <div class="btns-left">
            表格默认功能按钮：
            <el-checkbox v-for="item in currentItem.buttons"
                         :label="item.name"
                         :key="item.name">{{ item.name }}</el-checkbox>
          </div>
          <div class="btns-right">
            <el-button type="primary"
                       size="mini"
                       @click="addRow"><i class="el-icon-plus"></i>添加字段</el-button>
            <el-button type="primary"
                       size="mini"
                       @click="delRow"><i class="el-icon-delete"></i>删除字段</el-button>
            <el-button type="primary"
                       size="mini"
                       @click="sortRow"><i class="el-icon-sort"></i>重新排列</el-button>
          </div>
        </div>
        <vol-table :load-key="true"
                   :tableData="currnetTableData"
                   :columns="currentTableOption"
                   :height="448"
                   ref="table"
                   :index="true"
                   :pagination-hide="true"
                   :column-index="true"
                   :ck="true"></vol-table>
        <div slot="footer">
          <div style="text-align: center">
            <el-button size="mini"
                       @click="tableModel = false"><i class="el-icon-close"></i>关闭</el-button>
            <el-button type="primary"
                       size="mini"
                       @click="saveConfigOptions"><i class="el-icon-check"></i>保存</el-button>
          </div>
        </div>
      </div>
    </vol-box>

    <!-- @start="onStart" -->
    <div class="drag-left">

      <div class="left-title">组件列表</div>
      <draggable v-model="components"
                 @end="end1"
                 class="left-draggable-item"
                 :group="{ name: 'componentsGroup', pull: 'clone', put: false }"
                 animation="300"
                 @start="onStart"
                 :sort="false"
                 :move="onMove1">
        <transition-group>
          <div :class="item.id == 1 ? 'item forbid' : 'item'"
               v-for="item in components"
               :key="item.id">
            <i :class="item.icon"></i> {{ item.name }}
          </div>
        </transition-group>

      </draggable>
      <div class="example">
        <div @click="example1">示例一<i class="el-icon-arrow-right"></i></div>
        <div @click="example2">示例二<i class="el-icon-arrow-right"></i></div>
        <div @click="example3">示例三<i class="el-icon-arrow-right"></i></div>
      </div>
    </div>

    <div class="drag-center">
      <div class="center-top">
        <span>
          <!-- <i class="el-icon-warning-outline"></i>高效的表单配置 -->
        </span>
        <el-button type="primary"
                   size="mini"
                   plain
                   @click="save"><i class="el-icon-check"> </i>保存</el-button>
        <el-button type="primary"
                   size="mini"
                   plain
                   @click="preview(true)"><i class="el-icon-view"> </i>预览</el-button>
        <el-button type="primary"
                   size="mini"
                   plain
                   @click="download"><i class="el-icon-view"> </i>下载</el-button>
        <el-button type="primary"
                   @click="clearItems"
                   size="mini"
                   plain><i class="el-icon-delete"> </i>清空</el-button>
        <a style="margin-left: 15px"
           href="http://v2.volcore.xyz/document/api"
           target="_blank">设计器基于框架volform、voltable、volupload、volbox定制开发</a>
      </div>
      <div>
        <el-alert title="关于表单设计器"
                  type="success"
                  :show-icon="true"
                  :closable="false">
          <div>
            1、表单设计器基于draggable开发,为本框架自定义页面功能的补充,框架仍以可视化代码生成器为核心
          </div>
          <div>
            2、支持可视化设计1对1、1对多及表单下拉框自动绑定、table自动加载数据(分页、编辑)、自动上传文件、富文本编辑
          </div>
        </el-alert>
      </div>
      <el-scrollbar style="flex: 1">
        <div class="tips"
             key="empty"
             v-show="!currentComponents.length">
          请将左边组件拖入此容器中
        </div>
        <el-form label-position="top">
          <draggable class="draggable-container"
                     v-model="currentComponents"
                     @end="end2"
                     animation="300"
                     :move="onMove"
                     group="componentsGroup">
            <transition-group class="drag-center-item"
                              key="tg">
              <div class="item2"
                   :class="{ actived: index === currentIndex }"
                   @click="itemClick(item, index)"
                   :style="{ width: item.width + '%' }"
                   v-for="(item, index) in currentComponents"
                   :key="item.field+index">
                <i class="el-icon-document-copy"
                   @click.stop="copyItem(item)"></i>
                <i class="el-icon-delete"
                   @click.stop="removeItem(index)"> </i>
                <el-form-item :required="item.required"
                              label-position="top"
                              style="width: 100%"
                              :label="item.type == 'line' ? '' : item.name">
                  <el-col>
                    <!-- <div></div> -->
                    <!-- {{ item.name }} -->
                    <el-input v-if="item.type == 'text'"
                              placeholder="请输入内容"
                              v-model="item.value"
                              :disabled="item.readonly"
                              size="medium"></el-input>
                    <el-input v-else-if="item.type == 'textarea'"
                              type="textarea"
                              v-model="item.value"
                              :disabled="item.readonly"
                              placeholder="请输入内容"></el-input>
                    <el-date-picker v-else-if="item.type == 'date'"
                                    align="right"
                                    v-model="item.value"
                                    type="date"
                                    :disabled="item.readonly"
                                    size="medium"
                                    placeholder="选择日期">
                    </el-date-picker>
                    <el-radio-group :disabled="item.readonly"
                                    v-else-if="item.type == 'radio'"
                                    v-model="item.value">
                      <el-radio v-for="item in item.data"
                                :key="item.key"
                                :label="item.value"
                                :value="item.key">
                      </el-radio>
                      <!-- <el-radio :label="1">是</el-radio>
                      <el-radio :label="0">否</el-radio> -->
                    </el-radio-group>

                    <el-checkbox-group v-model="item.values"
                                       :disabled="item.readonly"
                                       style="width: 100%; display: inline-block"
                                       v-else-if="item.type == 'checkbox'">
                      <el-checkbox v-for="item in item.data"
                                   :key="item.key"
                                   :label="item.value"
                                   :value="item.key">
                      </el-checkbox>
                      <!-- <el-checkbox label="复选框 A"></el-checkbox>
                      <el-checkbox label="复选框 B"></el-checkbox>
                      <el-checkbox label="复选框 C"></el-checkbox> -->
                    </el-checkbox-group>

                    <el-select style="width: 100%"
                               :disabled="item.readonly"
                               v-model="item.value"
                               size="medium"
                               v-else-if="item.type == 'select'"
                               placeholder="请选择">
                      <el-option v-for="item in item.data"
                                 :key="item.value"
                                 :label="item.label"
                                 :value="item.value">
                      </el-option>
                    </el-select>
                    <el-select style="width: 100%"
                               :disabled="item.readonly"
                               v-model="item.values"
                               size="medium"
                               :multiple="true"
                               v-else-if="item.type == 'selectList'"
                               placeholder="请选择">
                      <el-option v-for="item in item.data"
                                 :key="item.value"
                                 :label="item.label"
                                 :value="item.value">
                      </el-option>
                    </el-select>
                    <el-cascader :disabled="item.readonly"
                                 style="width: 100%"
                                 v-else-if="item.type == 'cascader'"
                                 v-model="item.values"
                                 :options="item.data"
                                 @change="() => {}"></el-cascader>

                    <el-switch :disabled="item.readonly"
                               v-model="item.value"
                               style="width: 100%"
                               v-else-if="item.type == 'switch'"
                               active-color="#13ce66"
                               inactive-color="#0e7ef3"
                               :active-value="1"
                               :inactive-value="0">
                    </el-switch>
                    <div class="col-line"
                         v-else-if="item.type == 'line'">
                      {{ item.name }}
                    </div>

                    <vol-upload v-else-if="
                        item.type == 'img' ||
                        item.type == 'excel' ||
                        item.type == 'file'
                      "
                                :fileInfo="item.fileInfo"
                                :url="item.url"
                                :img="item.type == 'img'"
                                :excel="item.type == 'excel'"
                                :multiple="item.multiple"
                                :max-size="item.maxSize"
                                :max-file="item.maxFile"
                                :autoUpload="item.autoUpload">
                    </vol-upload>
                    <vol-wang-editor v-else-if="item.type == 'editor'"
                                     :url="item.url"
                                     v-model="item.value"
                                     :height="item.height"></vol-wang-editor>

                    <vol-table v-else-if="item.type == 'table'"
                               :url="item.url"
                               style="width: 99%;"
                               :load-key="true"
                               :index="item.edit"
                               :tableData="item.tableData"
                               :columns="item.columns"
                               :height="item.height"
                               :pagination-hide="true"
                               :column-index="item.columnIndex"
                               :ck="item.ck"></vol-table>
                    <el-button @click="model = true"
                               v-else-if="item.type == 'box'"
                               type="primary"
                               size="small">{{ item.name }}</el-button>
                  </el-col>
                </el-form-item>
              </div>
            </transition-group>
          </draggable>
        </el-form>
      </el-scrollbar>
    </div>
    <div class="drag-right">
      <div class="left-title">组件属性</div>
      <div class="attr"
           v-show="currentIndex != -1">
        <div class="attr-item">
          <div class="text">字段名称</div>
          <el-input size="medium"
                    v-model="currentItem.name" />
        </div>
        <div class="attr-item">
          <div class="text">字段(唯一字段)</div>
          <el-input size="medium"
                    v-model="currentItem.field" />
        </div>
        <div class="attr-item"
             v-show="currentItem.type == 'table'">
          <div class="text">后台返回数据接口地址</div>
          <el-input size="medium"
                    placeholder="例:api/表名/getPageData"
                    v-model="currentItem.url" />
        </div>
        <div class="attr-item"
             v-show="
            currentItem.type != 'table' && currentItem.hasOwnProperty('url')
          ">
          <div class="text">上传接口地址(后台接口)</div>
          <el-input size="medium"
                    placeholder="可用框架地址:api/表名/upload"
                    v-model="currentItem.url" />
          <div class="text"
               style="margin-top: 10px">文件大小限制(M)</div>
          <el-input size="medium"
                    v-model="currentItem.maxSize" />
          <div class="text"
               style="margin-top: 10px">是否多文件上传</div>
          <el-switch v-model="currentItem.multiple"
                     style="width: 100%"
                     active-color="#13ce66"
                     inactive-color="rgb(165 165 165)"
                     :active-value="true"
                     :inactive-value="false">
          </el-switch>
          <div class="text"
               style="margin-top: 10px">是否自动上传</div>
          <el-switch v-model="currentItem.autoUpload"
                     style="width: 100%"
                     active-color="#13ce66"
                     inactive-color="rgb(165 165 165)"
                     :active-value="true"
                     :inactive-value="false">
          </el-switch>
        </div>
        <div class="attr-item"
             v-show="currentItem.data">
          <div class="text">数据源(下拉框绑定设置中维护)</div>

          <!-- dicList -->
          <el-select style="width: 100%"
                     v-model="currentItem.key"
                     size="medium"
                     @change="dicChange"
                     placeholder="请选择数据源字典">
            <el-option v-for="item in dicList"
                       :key="item.key"
                       :label="item.value"
                       :value="item.key">
            </el-option>
          </el-select>
        </div>
        <div class="attr-item"
             v-show="currentItem.type != 'table'">
          <div class="text">标签宽度</div>
          <el-slider style="width: 90%"
                     :min="20"
                     v-model="colWidth"
                     :step="10"
                     show-stops>
          </el-slider>
        </div>
        <div class="attr-item attr2"
             v-show="currentItem.type != 'table'">
          <div>
            <div class="text">必填</div>
            <el-switch v-model="currentItem.required"
                       style="width: 100%"
                       active-color="#13ce66"
                       inactive-color="rgb(165 165 165)"
                       :active-value="true"
                       :inactive-value="false">
            </el-switch>
          </div>

          <div>
            <!-- active-text="是"
              inactive-text="否" -->
            <div class="text">只读</div>
            <el-switch v-model="currentItem.readonly"
                       style="width: 100%"
                       active-color="#13ce66"
                       inactive-color="rgb(165 165 165)"
                       :active-value="true"
                       :inactive-value="false">
            </el-switch>
          </div>
        </div>
        <div v-show="currentItem.type == 'table'">
          <div class="attr-item">
            <div class="text">是否使用选项卡(tabs)</div>
            <div>
              <el-switch v-model="currentItem.tabs"
                         style="width: 100%"
                         active-text="是"
                         inactive-text="否"
                         active-color="#13ce66"
                         inactive-color="rgb(165 165 165)"
                         :active-value="true"
                         :inactive-value="false">
              </el-switch>
            </div>
          </div>
          <div class="attr-item attr2">
            <el-button style="width: 100%"
                       @click="openTableModel"
                       type="primary"
                       size="medium">table配置</el-button>
          </div>
        </div>
      </div>
    </div>
  </div>

</template>

<script>
// import draggable from "vuedraggable";
import draggable from 'vuedraggable'

import VolWangEditor from "@/components/basic/VolWangEditor.vue";
import VolUpload from "./../VolUpload";
import VolTable from "./../VolTable";
import VolBox from "./../VolBox";
import VolFormPreview from "./VolFormPreview";
import { components, tableOption } from "./options";
import { options1, options2, options3 } from "./formTemplate";
import downloadForm from './DownloadForm'
export default {
  props: {
    userComponents: {
      type: Array,
      default: () => {
        return [];
      },
    },
  },
  components: {
    draggable: draggable,
    "vol-upload": VolUpload,
    "vol-wang-editor": VolWangEditor,
    "vol-table": VolTable,
    "vol-box": VolBox,
    preview: VolFormPreview,
  },
  data () {
    return {
      options: {},
      options1: options1,
      options2: options2,
      options3: options3,
      colWidth: 100,
      currentIndex: -1,
      currentItem: {},
      currnetTableData: [],
      currentTableOption: tableOption,
      //定义要被拖拽对象的数组
      components: components,
      currentComponents: [],
      dicList: [],
      model: false,
      tableModel: false,
      previewModel: false,
      viewFormData: { fields: {}, formOptions: [], tables: [] },
    };
  },
  watch: {
    colWidth (newVal) {
      if (this.currentIndex != -1) {
        this.currentComponents[this.currentIndex].width = newVal;
      }
    },
  },
  created () {
    //  this.currentComponents = this.userComponents;
    this.currentComponents.push(...this.userComponents);
    this.http
      .post("api/Sys_Dictionary/GetBuilderDictionary", {}, false)
      .then((x) => {
        this.dicList = x.map((c) => {
          return { key: c, value: c };
        });
      });
  },
  methods: {
    getFormOptions (item) {
      let _option = {};
      _option.field = item.field;
      _option.title = item.name;
      _option.type = item.type;
      _option.required = item.required;
      _option.readonly = item.readonly;
      if (item.type == "line") {
        _option.title = "";
        let title = item.name;
        _option.render = (h) => {
          return h(
            "div",
            {
              style: {
                "line-height": "25px",
                "font-weight": "bold",
                "margin-left": "15px",
                "border-bottom": "1px solid #dadada",
              },
            },
            title
            //也可以在这里放一些组件，例如：
            // resolveComponent("el-tooltip"),
            // {
            //   content: "这里是提示的内容",
            //   props: { effect: "dark", placement: "top-start" },
            //   style: {},
            // },
            // [h("a", { style: { color: "#2a92ff" } }, "提示信息")]
          );
        };
      }
      if (item.type == "editor") {
        _option.height = item.height;
      }
      if (item.width == 100) {
        _option.colSize = 12;
      } else {
        _option.colSize = (_option.width * 12) / 100;
      }
      if (["img", "excel", "file"].indexOf(item.type) != -1) {
        _option.maxSize = item.maxSize;
        _option.fileInfo = item.fileInfo;
        _option.multiple = item.multiple;
        _option.autoUpload = item.autoUpload;
        _option.maxFile = item.maxFile;
      }
      if (
        ["img", "excel", "file", "editor", "table"].indexOf(item.type) != -1
      ) {
        _option.url = item.url;
      }
      if (item.data) {
        _option.data = item.data;
        _option.dataKey = item.key;
      }
      return _option;
    },
    getLineFormOptions (index) {
      let _index = index;
      let endIndex = index;
      let width = 0;
      let _options = [];
      for (index; index < this.filterCurrentComponents().length; index++) {
        const item = this.currentComponents[index];
        if (item.width + width <= 100) {
          width = item.width + width;
          endIndex = index;
          _options.push(this.getFormOptions(item));
        }
      }
      return { options: _options, index: _index, endIndex: endIndex };
    },
    filterCurrentComponents () {
      return this.currentComponents.filter((x) => {
        return x.type != "table";
      });
    },
    setSpan () { },
    preview (isPre) {
      let _fields = {};
      let _formOptions = [];
      let endIndex = -1;
      this.filterCurrentComponents().forEach((item, index) => {
        if (item.hasOwnProperty("values")) {
          _fields[item.field] = [];
        } else {
          _fields[item.field] = null;
        }

        if (item.width == 100) {
          _formOptions.push([this.getFormOptions(item)]);
        } else {
          if (endIndex == -1) {
            let lineOptions = this.getLineFormOptions(index);
            endIndex = lineOptions.endIndex;
            _formOptions.push(lineOptions.options);
            endIndex--;
          } else {
            endIndex--;
          }
        }
        // _fields[item.field] = null;xc
        // let _option = {};
        // _option.field = item.field;
        // _option.title = item.name;
        // _option.type = item.type;
        // _option.required = item.required;
        // _option.readonly = item.readonly;
        // if (["img", "excel", "file"].indexOf(item.type) != -1) {
        //   _option.maxSize = item.maxSize;
        //   _option.fileInfo = item.fileInfo;
        //   _option.multiple = item.multiple;
        //   _option.autoUpload = item.autoUpload;
        //   _option.maxFile = item.maxFile;
        // }
        // if (
        //   ["img", "excel", "file", "editor", "table"].indexOf(item.type) != -1
        // ) {
        //   _option.url = item.url;
        // }
        // if (item.data) {
        //   _option.data = item.data;
        //   _option.dataKey = item.key;
        // }
        // _formOptions.push(_option);
      });
      this.viewFormData.fields = _fields;
      // console.log(JSON.stringify(_formOptions))
      this.viewFormData.formOptions = _formOptions;
      if (isPre) {
        this.previewModel = true;
      }

      let tableIndex = 0;
      let keys = [];
      let tables = this.currentComponents
        .filter((x) => {
          return x.type == "table";
        })
        .map((m) => {
          m.pagination = !m.url;
          if (m.name == "表格") {
            tableIndex++;
          }
          return {
            name: m.name + (m.name == "表格" ? tableIndex : ""),
            url: m.url,
            tabs: m.tabs,
            pagination: m.pagination,
            buttons: m.buttons,
            columns: m.columns.map((c) => {
              let obj = {
                title: c.title,
                field: c.field,
                hidden: !c.show,
                width: c.width,
                required: c.required,
              };

              if (c.dataSource) {
                obj.bind = { key: c.dataSource, data: [] };
              }
              if (c.dataSource) {
                keys.push(c.dataSource);
              }
              if (c.edit) {
                if (!obj.bind) {
                  obj.bind = { key: "", data: [] };
                }
                obj.edit = { type: c.editType };
              }
              return obj;
            }),
            tableData: [{}, {}, {}],
          };
        });
      this.viewFormData.tables = tables.filter((x) => {
        return !x.tabs;
      });
      this.viewFormData.tabs = tables.filter((x) => {
        return x.tabs;
      });
      this.getDicKeys(keys);
      this.options = this.viewFormData;
      // console.log(JSON.stringify(this.viewFormData));
    },
    getDicKeys (keys) {
      if (!keys.length) {
        return;
      }
      this.http
        .post("api/Sys_Dictionary/GetVueDictionary", keys, true)
        .then((result) => {
          result.forEach((c) => {
            this.viewFormData.tables.forEach((t) => {
              let _option = t.columns.find((x) => {
                return x.bind && x.bind.key == c.dicNo;
              });
              if (_option) {
                _option.bind.data = c.data;
              }
            });
            this.viewFormData.tabs.forEach((t) => {
              let _option = t.columns.find((x) => {
                return x.bind && x.bind.key == c.dicNo;
              });
              if (_option) {
                _option.bind.data = c.data;
              }
            });
          });
        });
    },
    save () {
      this.$emit("save", this.currentComponents);
    },
    download () {
      this.preview(false);
      downloadForm.call(this);
      // this.$Message.info("开发中")
    },
    openTableModel () {
      let dataSource = this.currentTableOption.find((x) => {
        return x.field == "dataSource";
      });
      if (!dataSource.bind.data.length) {
        dataSource.bind.data = this.dicList;
      }
      this.currnetTableData = JSON.parse(
        JSON.stringify(this.currentItem.columns)
      );
      this.tableModel = true;
    },
    addRow () {
      this.currnetTableData.push({ field: this.getField() });
    },
    delRow () {
      this.$confirm("确认要删除选择的数据吗?", "警告", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
        center: true,
      }).then(() => {
        this.$refs.table.delRow();
      });
    },
    sortRow () {
      this.currnetTableData = this.currnetTableData.sort((a, b) => {
        return a.orderNo - b.orderNo;
      }); //.reverse();
      this.$Message.success("列显示顺序已重新排列,点击预览可查看");
    },
    saveConfigOptions () {
      this.currentItem.columns = JSON.parse(
        JSON.stringify(this.currnetTableData)
      );
      this.tableModel = false;
    },
    copyItem (item) {
      let itemClone = JSON.parse(JSON.stringify(item));
      itemClone.field = "field" + new Date().valueOf();
      this.currentComponents.push(itemClone);
    },
    removeItem (index) {
      this.currentComponents.splice(index, 1);
      this.colWidth = 100;
      this.currentIndex = -1;
      this.currentItem = {};
    },
    clearItems () {
      this.currentComponents.length = 0;
      this.colWidth = 100;
      this.currentIndex = -1;
      this.currentItem = {};
    },
    itemClick (item, index) {
      this.currentIndex = index;
      this.colWidth = this.currentComponents[this.currentIndex].width;
      this.currentItem = this.currentComponents[this.currentIndex];
    },
    //开始拖拽事件
    onStart (e, e1) {
      this.drag = true;
    },
    getField () {
      return "field" + new Date().valueOf();
    },
    //左边往右边拖动时的事件
    end1 (e) {
      if (1 == 1 || e.from !== e.to) {
        let obj = JSON.parse(JSON.stringify(this.components[e.oldIndex]));
        obj.field = this.getField();
        obj.width = 100;
        obj.readonly = false;
        obj.required = false;
        this.currentComponents.splice(e.newIndex, 1, obj);
        this.userComponents.splice(0);
        this.userComponents.push(...this.currentComponents);
        // this.currentComponents = this.currentComponents.filter((x) => {
        //   return x.hasOwnProperty("field");
        // });
        this.colWidth = 100;
        this.currentIndex = this.userComponents.length <= 1 || e.newIndex > this.userComponents.length ? 0 : e.newIndex; //this.currentComponents.length - 1;
        this.currentItem = this.currentComponents[this.currentIndex];
      }
    },
    //右边往左边拖动时的事件
    end2 (e) { },
    onMove1 (e, originalEvent) {
      // this.moveId = e.relatedContext.element.id;
      return true;
    },
    //move回调方法
    onMove (e, originalEvent) {
      console.log(JSON.stringify(this.currentComponents));
      return true;
    },
    dicChange (key) {
      this.http
        .post("api/Sys_Dictionary/GetVueDictionary", [key], true)
        .then((result) => {
          if (result[0].data.length) {
            if (this.currentItem.type == 'cascader') {
              this.currentItem.data = this.base.convertTree(result[0].data, (node, data, isRoot) => {
                node.label = node.value;
                node.value = node.key;
              })
              return;
            }
            this.currentItem.data = result[0].data;

            if (this.currentItem.type == "select") {
              this.currentItem.value = result[0].data[0].value;
            } else {
              this.currentItem.values = [result[0].data[0].value];
            }
          }
        });
    },
    example1 () {
      this.currentComponents = this.options1;
    },
    example2 () {
      this.currentComponents = this.options2;
    },
    example3 () {
      this.currentComponents = this.options3;
    },
  },
  computed: {
    tabsTable () {
      return this.currentComponents.filter((x) => {
        return x.type == "table" && x.tabs == true;
      });
    },
  },
};
</script>
<style lang="less" scoped>
* {
  box-sizing: border-box;
}
.drag-container {
  /* padding: 20px; */
  display: flex;
  height: 100%;
  position: absolute;
  width: 100%;
  box-sizing: border-box;
}
.drag-left {
  width: 250px;
  display: flex;
  border-right: 1px solid #eee;
  flex-direction: column;
}
.left-title {
  height: 42px;
  text-align: left;
  border-right: 1px solid #eee;
  padding: 10px 0 10px 11px;
  border-bottom: 1px solid #eee;
}
.drag-center {
  display: flex;
  flex-direction: column;
  flex: 1;
}
.left-draggable-item {
  //   flex: 1;
  display: inline-block;
  padding: 5px;
  //   border-right: 1px solid #eee;
}

.left-draggable-item .item {
  cursor: move;
  float: left;
  width: 111px;
  /* height: 20px; */
  text-align: center;
  border: 1px solid #eeeeee;
  padding: 2px 13px;
  text-align: left;
  line-height: 28px;
  margin: 4px;
  border-radius: 3px;
  background: #f0f9eb;
  font-size: 13px;
}
// .drag-center-item {
//   display: inline-block;
//   width: 100%;
//   height: calc(100vh - 122px);
//   padding: 10px;
// }
.draggable-container {
  display: inline-block;
  width: 100%;
  height: calc(100vh - 215px);
  padding: 10px 0;
}

.item2 {
  position: relative;
  cursor: move;
  padding: 18px 10px 10px 10px;
  text-align: left;
  float: left;
  margin-bottom: 10px;
}
.item2 .el-icon-delete,
.item2 .el-icon-document-copy {
  position: absolute;
  right: 10px;
  top: 2px;
  padding: 5px;
  display: none;
  color: red;
  cursor: pointer;
}
.item2 .el-icon-document-copy {
  right: 35px;
}
.item2:hover,
.actived {
  background: #f0f9eb;
}
.item:hover {
  border: 1px dashed #787be8;
  color: #787be8;
}
.item2:hover .el-icon-delete,
.item2:hover .el-icon-document-copy {
  display: block;
}

.drag-right {
  background: #f7fbff3d;
  width: 250px;
  border-left: 1px solid #eee;
}

.center-top {
  height: 42px;
  line-height: 41px;
  background: #f2f5fb;
  border-bottom: 1px solid #eee;
  text-align: left;
  padding: 0 10px;
  font-size: 12px;
  color: #3391f3;
}
.center-top span {
  margin-right: 10px;
}
.attr {
  padding: 0px 15px 15px 15px;
}
.attr-item {
  text-align: left;
  margin-top: 12px;
  font-size: 14px;
}
.attr-item .text {
  padding: 0 0 5px 5px;
}
.attr2 {
  display: flex;
}
.attr2 > div {
  flex: 1;
}
.tips {
  position: absolute;
  font-size: 26px;
  letter-spacing: 6px;
  left: 0px;
  right: 0px;
  top: 150px;
  width: 500px;
  margin: auto;
  color: #c5c5c5;
}
.col-line {
  line-height: 25px;
  font-weight: bold;
  border-bottom: 1px solid rgb(218 218 218);
}

.example {
  margin-top: 8px;
  > div {
    cursor: pointer;
    padding: 14px 20px;
    border-top: 1px solid #eee;
    font-size: 13px;
    color: #646465;
    position: relative;
  }
  > div:hover {
    background: rgb(231, 231, 231);
  }
  i {
    position: absolute;
    right: 20px;
  }
}
.btns {
  padding: 8px 0;
  display: flex;
  > div {
    flex: 1;
  }
  .btns-left {
    padding-top: 8px;
    color: black;
    font-weight: bold;
  }
  .btns-right {
    text-align: right;
  }
}
</style>
<style scoped>
.drag-container >>> .el-col {
  width: 100%;
}
.drag-center >>> .el-form-item__label {
  line-height: 0 !important;
}
.drag-center >>> .el-scrollbar__wrap {
  overflow-x: hidden;
}
.drag-center >>> .el-form-item {
  margin-bottom: 0px;
}
.drag-center >>> .el-date-editor {
  width: 100%;
}
.drag-center >>> .el-checkbox {
  margin-right: 15px;
}
.drag-center >>> .el-checkbox__label {
  padding-left: 5px;
}
.drag-center >>> .hello > div {
  z-index: 500 !important;
}
.drag-center >>> th,
.drag-center >>> td {
  padding: 6px 0;
}
.drag-center >>> .w-e-toolbar,
.drag-center >>> .w-e-text-container {
  z-index: 500 !important;
}
.drag-center >>> .v-table .el-table__body td {
  padding: 3px 0 !important;
}
</style>