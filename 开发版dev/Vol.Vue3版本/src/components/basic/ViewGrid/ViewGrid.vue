<template>
  <div class="layout-container">
    <a :href="exportHref" ref="export"></a>
    <!--开启懒加载2020.12.06 -->
    <vol-box
      :on-model-close="closeCustomModel"
      v-model="viewModel"
      :height="520"
      :width="500"
      :padding="0"
      :lazy="true"
      title="设置"
    >
      <template #content>
        <custom-column :view-columns="viewColumns"></custom-column>
      </template>
      <template #footer>
        <div style="text-align: center">
          <el-button type="default" size="small" @click="closeCustomModel"
            ><i class="el-icon-close"></i>取消</el-button
          >
          <el-button type="success" size="small" @click="initViewColumns(true)"
            ><i class="el-icon-refresh"></i>重置</el-button
          >
          <el-button type="primary" size="small" @click="saveColumnConfig"
            ><i class="el-icon-check"></i>确定</el-button
          >
        </div>
      </template>
    </vol-box>
    <ViewGridAudit @auditClick="saveAudit" :option="table" ref="audit">

    </ViewGridAudit>
 
    <!--导入excel功能-->
    <!--2020.10.31添加导入前的方法-->
    <!--开启懒加载2020.12.06 -->
    <!-- 2022.01.08增加明细表导入判断 -->
    <vol-box
      v-if="upload.url"
      v-model="upload.excel"
      :height="350"
      :width="600"
      :lazy="true"
      :title="(boxModel ? detailOptions.cnName : table.cnName) + '-导入'"
    >
      <UploadExcel
        ref="upload_excel"
        @importExcelAfter="importExcelAfter"
        :importExcelBefore="importExcelBefore"
        :url="upload.url"
        :template="upload.template"
      ></UploadExcel>
    </vol-box>
    <!--头部自定义组件-->
    <component
      :is="dynamicComponent.gridHeader"
      ref="gridHeader"
      @parentCall="parentCall"
    ></component>
    <!--主界面查询与table表单布局-->
    <div class="view-container">
      <!-- 2020.09.11增加固定查询表单 -->
      <!--查询条件-->
      <div class="grid-search">
        <div
          :class="[fiexdSearchForm ? 'fiexd-search-box' : 'search-box']"
          v-show="searchBoxShow"
        >
          <!-- 2020.09.13增加formFileds拼写错误兼容处理 -->
          <vol-form
            ref="searchForm"
            :load-key="false"
            style="padding: 0 15px"
            :label-width="labelWidth"
            :formRules="searchFormOptions"
            :formFields="searchFormFields"
            :select2Count="select2Count"
          >
            <template #footer>
              <div v-if="!fiexdSearchForm" class="form-closex">
                <el-button size="small" type="primary" plain @click="search">
                  <i class="el-icon-search" />查询
                </el-button>

                <el-button
                  size="small"
                  type="success"
                  plain
                  @click="resetSearch"
                >
                  <i class="el-icon-refresh-right" />重置
                </el-button>
                <el-button
                  size="small"
                  plain
                  @click="searchBoxShow = !searchBoxShow"
                >
                  <i class="el-icon-switch-button" />关闭
                </el-button>
              </div>
            </template>
          </vol-form>
          <div v-if="fiexdSearchForm" class="fs-line"></div>
        </div>
        <div class="view-header">
          <div class="desc-text">
            <i class="el-icon-s-grid" />
            <span>{{ table.cnName }}</span>
          </div>
          <div class="notice">
            <a class="text" :title="extend.text">{{ extend.text }}</a>
          </div>
          <!--快速查询字段-->
          <div class="search-line" v-if="!fiexdSearchForm">
            <QuickSearch
              v-if="singleSearch"
              :singleSearch="singleSearch"
              :searchFormFields="searchFormFields"
              :tiggerPress="quickSearchKeyPress"
            ></QuickSearch>
          </div>
          <!--操作按钮组-->
          <!-- 2020.11.29增加查询界面hidden属性 -->

          <div class="btn-group">
            <template
              :key="bIndex"
              v-for="(btn, bIndex) in buttons.slice(0, maxBtnLength)"
            >
              <el-dropdown size="small" v-if="btn.data" :split-button="false">
                <el-button
                  :color="btn.color"
                  :dark="false"
                  :type="btn.type"
                  :plain="btn.plain"
                >
                  {{ btn.name }}<i class="el-icon-arrow-down el-icon--right"></i
                ></el-button>
                <template #dropdown>
                  <el-dropdown-menu>
                    <el-dropdown-item
                      v-for="(item, index) in btn.data"
                      :key="index"
                    >
                      <div @click="onClick(item.onClick)">
                        <i :class="item.icon"></i>
                        {{ item.name }}
                      </div>
                    </el-dropdown-item>
                  </el-dropdown-menu>
                </template>
              </el-dropdown>
              <el-button
                v-else
                :type="btn.type"
                size="small"
                :color="btn.color"
                :dark="false"
                :class="btn.class"
                :plain="btn.plain"
                v-show="!btn.hidden"
                @click="onClick(btn.onClick)"
              >
                <i :class="btn.icon"></i> {{ btn.name }}
              </el-button>
            </template>
            <el-button
              type="default"
              style="padding: 0px 10px"
              size="small"
              :plain="true"
              v-if="showCustom"
              @click="showCustomModel"
            >
              <i class="el-icon-s-grid"></i>
            </el-button>
            <el-dropdown
              size="small"
              @click="changeDropdown"
              v-if="buttons.length > maxBtnLength"
            >
              <el-button type="primary" plain size="small">
                更多<i class="el-icon-arrow-down el-icon--right"></i>
              </el-button>
              <template #dropdown>
                <el-dropdown-menu>
                  <el-dropdown-item
                    @click="changeDropdown(item.name)"
                    :name="item.name"
                    v-show="!item.hidden"
                    v-for="(item, dIndex) in buttons.slice(
                      maxBtnLength,
                      buttons.length
                    )"
                    :key="dIndex"
                  >
                    <i :class="item.icon"></i> {{ item.name }}</el-dropdown-item
                  >
                </el-dropdown-menu>
              </template>
            </el-dropdown>
          </div>
        </div>

        <!-- 分割位置 -->
        <vol-box
          v-if="boxInit"
          v-model="boxModel"
          :title="boxOptions.title"
          :width="boxOptions.width"
          :height="boxOptions.height"
          :modal="boxOptions.modal"
          :draggable="boxOptions.draggable"
          :padding="0"
          :on-model-close="onGridModelClose"
          @fullscreen="fullscreen"
        >
          <!--明细头部自定义组件-->
          <template #content>
            <div class="box-com">
              <component
                :is="dynamicComponent.modelHeader"
                ref="modelHeader"
                @parentCall="parentCall"
              ></component>
              <!-- <div v-show="isBoxAudit" class="flow-step">
                <div v-for="(item, index) in workFlowSteps" :key="index">
                  {{ item.stepName }}
                </div>
              </div> -->
              <div class="item form-item">
                <vol-form
                  ref="form"
                  :editor="editor"
                  :load-key="false"
                  :label-width="boxOptions.labelWidth"
                  :formRules="editFormOptions"
                  :formFields="editFormFields"
                  :select2Count="select2Count"
                ></vol-form>
              </div>
              <!--明细body自定义组件-->
              <component
                :is="dynamicComponent.modelBody"
                ref="modelBody"
                @parentCall="parentCall"
              ></component>
              <div
                v-show="hasDetail"
                v-if="detail.columns && detail.columns.length > 0"
                class="grid-detail table-item item"
              >
                <div class="toolbar">
                  <div class="title form-text">
                    <span>
                      <i class="el-icon-menu" />
                      {{ detail.cnName }}
                    </span>
                  </div>
                  <!--明细表格按钮-->
                  <div class="btns" v-show="!isBoxAudit">
                    <el-button
                      v-for="(btn, bIndex) in detailOptions.buttons"
                      :key="bIndex"
                      :plain="btn.plain"
                      v-show="!(typeof btn.hidden == 'boolean' && btn.hidden)"
                      @click="onClick(btn.onClick)"
                      size="small"
                      ><i :class="btn.icon"></i>{{ btn.name }}</el-button
                    >
                  </div>
                </div>
                <vol-table
                  ref="detail"
                  @loadBefore="loadInternalDetailTableBefore"
                  @loadAfter="loadDetailTableAfter"
                  @rowChange="detailRowOnChange"
                  @rowClick="detailRowOnClick"
                  :url="detailOptions.url"
                  :load-key="false"
                  :index="true"
                  :tableData="detailOptions.data"
                  :columns="detailOptions.columns"
                  :pagination="detailOptions.pagination"
                  :height="detailOptions.height"
                  :single="detailOptions.single"
                  :pagination-hide="detailOptions.paginationHide"
                  :defaultLoadPage="detailOptions.load"
                  :beginEdit="detailOptions.beginEdit"
                  :endEditBefore="detailOptions.endEditBefore"
                  :endEditAfter="detailOptions.endEditAfter"
                  :summary="detailOptions.summary"
                  :click-edit="detailOptions.clickEdit"
                  :double-edit="detailOptions.doubleEdit"
                  :column-index="detailOptions.columnIndex"
                  :ck="detailOptions.ck"
                  :text-inline="detailOptions.textInline"
                  :select2Count="select2Count"
                  :selectable="detailSelectable"
                  :spanMethod="detailSpanMethod"
                ></vol-table>
              </div>
              <!--明细footer自定义组件-->
              <component
                :is="dynamicComponent.modelFooter"
                ref="modelFooter"
                @parentCall="parentCall"
              ></component>
            </div>
          </template>
          <template #footer>
            <div style="text-align: center;" v-show="isBoxAudit">
              <el-button
                size="small"
                type="primary"
                plain
                @click="onGridModelClose(false)"
              >
                <i class="el-icon-close">关闭</i>
              </el-button>
              <el-button
                size="small"
                type="primary"
                v-show="auditParam.showViewButton"
                @click="auditParam.model = true"
              >
                <i class="el-icon-view">审批</i>
              </el-button>
            </div>
            <div v-show="!isBoxAudit">
              <el-button
                v-for="(btn, bIndex) in boxButtons"
                :key="bIndex"
                :type="btn.type"
                size="small"
                :plain="btn.plain"
                v-show="!(typeof btn.hidden == 'boolean' && btn.hidden)"
                :disabled="btn.hasOwnProperty('disabled') && !!btn.disabled"
                @click="onClick(btn.onClick)"
              >
                <i :class="btn.icon"></i>{{ btn.name }}
              </el-button>
              <el-button
                size="small"
                type="primary"
                plain
                @click="onGridModelClose(false)"
              >
                <i class="el-icon-close">关闭</i>
              </el-button>
            </div>
          </template>
        </vol-box>
      </div>
      <!--body自定义组件-->
      <div class="grid-body">
        <component
          :is="dynamicComponent.gridBody"
          ref="gridBody"
          @parentCall="parentCall"
        ></component>
      </div>

      <!--table表格-->
      <div class="grid-container">
        <!-- 2021.05.02增加树形结构 rowKey -->
        <vol-table
          ref="table"
          :single="single"
          :rowKey="rowKey"
          :loadTreeChildren="loadTreeTableChildren"
          @loadBefore="loadTableBefore"
          @loadAfter="loadTableAfter"
          @rowChange="rowOnChange"
          @rowClick="rowOnClick"
          @rowDbClick="rowOnDbClick"
          @selectionChange="selectionOnChange"
          :tableData="[]"
          :linkView="linkData"
          :columns="columns"
          :pagination="pagination"
          :height="height"
          :max-height="tableMaxHeight"
          :pagination-hide="paginationHide"
          :url="url"
          :load-key="false"
          :defaultLoadPage="load"
          :summary="summary"
          :double-edit="doubleEdit"
          :index="doubleEdit"
          :beginEdit="tableBeginEdit"
          :endEditBefore="tableEndEditBefore"
          :click-edit="true"
          :column-index="columnIndex"
          :text-inline="textInline"
          :ck="ck"
          :select2Count="select2Count"
          :selectable="selectable"
          :spanMethod="spanMethod"
        ></vol-table>
      </div>
    </div>

    <!--footer自定义组件-->
    <component
      :is="dynamicComponent.gridFooter"
      ref="gridFooter"
      @parentCall="parentCall"
    ></component>
  </div>
</template>

<script>
const _const = {
  EDIT: 'update',
  ADD: 'Add',
  VIEW: 'view',
  PAGE: 'getPageData',
  AUDIT: 'audit',
  DEL: 'del',
  EXPORT: 'Export', //导出操作返回加密后的路径
  DOWNLOAD: 'DownLoadFile', //导出文件
  DOWNLOADTEMPLATE: 'DownLoadTemplate', //下载导入模板
  IMPORT: 'Import', //导入(导入表的Excel功能)
  UPLOAD: 'Upload' //上传文件
};
import Empty from '@/components/basic/Empty.vue';

import VolTable from '@/components/basic/VolTable.vue';
import VolForm from '@/components/basic/VolForm.vue';
import {
  defineAsyncComponent,
  defineComponent,
  ref,
  shallowRef,
  toRaw
} from 'vue';
var vueParam = {
  components: {
    'vol-form': VolForm,
    'vol-table': VolTable,
    VolBox: defineAsyncComponent(() => import('@/components/basic/VolBox.vue')),
    QuickSearch: defineAsyncComponent(() =>
      import('@/components/basic/QuickSearch.vue')
    ),
    Audit: defineAsyncComponent(() => import('@/components/basic/Audit.vue')),
    UploadExcel: defineAsyncComponent(() =>
      import('@/components/basic/UploadExcel.vue')
    ),
    'custom-column': defineAsyncComponent(() =>
      import('./ViewGridCustomColumn.vue')
    ),
    'vol-header': defineAsyncComponent(() => import('./../VolHeader.vue')),
     ViewGridAudit: defineAsyncComponent(() => import('./ViewGridAudit.vue'))
  },
  props: {},
  setup(props) {
    //2021.07.17调整扩展组件组件
    const dynamicCom = {
      gridHeader: Empty,
      gridBody: Empty,
      gridFooter: Empty,
      modelHeader: Empty,
      modelBody: Empty,
      modelFooter: Empty
    };
    //合并扩展组件
    if (props.extend.components) {
      for (const key in props.extend.components) {
        if (props.extend.components[key]) {
          dynamicCom[key] = toRaw(props.extend.components[key]);
        }
      }
    }
    const dynamicComponent = shallowRef(dynamicCom);
    return { dynamicComponent };
  },
  data() {
    return {
      isBoxAudit: false,
      formFieldsType: [],
      workFlowSteps: [],
      //树形结构的主键字段，如果设置值默认会开启树形table；注意rowKey字段的值必须是唯一（2021.05.02）
      rowKey: undefined,
      fiexdSearchForm: false, //2020.09.011是否固定查询表单，true查询表单将固定显示在表单的最上面
      _inited: false,
      doubleEdit: false, //2021.03.19是否开启查询界面表格双击编辑
      single: false, //表是否单选
      const: _const, //增删改查导入导出等对应的action
      boxInit: false, //新建或编辑的弹出框初化状态，默认不做初始化，点击新建或编辑才初始化弹出框
      searchBoxShow: false, //高级查询(界面查询后的下拉框点击触发)
      singleSearch: {}, //快速查询字段
      exportHref: '',
      currentAction: _const.ADD, //当新建或编辑时，记录当前的状态:如当前操作是新建
      currentRow: {}, //当前编辑或查看数据的行
      closable: false,
      boxModel: false, //弹出新建、编辑框
      width: 700, //弹出框查看表数据结构
      labelWidth: 100, //高级查询的标签宽度
      viewModel: false, //查看表结构的弹出框
      viewColumns: [], //查看表结构的列数据
      viewColumnsClone: [],
      showCustom: true, //是否显示自定义配置列按钮2022.05.27
      // viewData: [], //查看表结构信息
      maxBtnLength: 8, //界面按钮最多显示的个数，超过的数量都显示在更多中
      buttons: [], //查询界面按钮  如需要其他操作按钮，可在表对应的.js中添加(如:Sys_User.js中buttons添加其他按钮)
      splitButtons: [],
      uploadfiled: [], //上传文件图片的字段
      boxButtons: [], //弹出框按钮 如需要其他操作按钮，可在表对应的.js中添加
      dicKeys: [], //当前界面所有的下拉框字典编号及数据源
      hasKeyField: [], //有字典数据源的字段
      keyValueType: { _dinit: false },
      url: '', //界面表查询的数据源的url
      hasDetail: false, //是否有从表(明细)表格数据
      initActivated: false,
      load: true, //是否默认加载表数据
      activatedLoad: false, //页面触发actived时是否刷新页面数据
      summary: false, //查询界面table是否显示合计
      //需要从远程绑定数据源的字典编号,如果字典数据源的查询结果较多，请在onInit中将字典编号添加进来
      //只对自定sql有效
      remoteKeys: [],
      columnIndex: false, //2020.11.01是否显示行号
      ck: true, //2020.11.01是否显示checkbox
      continueAdd: false, //2021.04.11新建时是否可以连续新建操作
      continueAddName: '保存后继续添加', //2021.04.11按钮名称
      // detailUrl: "",
      detailOptions: {
        paginationHide:false,//是否隐藏明细表分页2023.10.23
        //弹出框从表(明细)对象
        //从表配置
        buttons: [], //弹出框从表表格操作按钮,目前有删除行，添加行，刷新操作，如需要其他操作按钮，可在表对应的.js中添加
        cnName: '', //从表名称
        key: '', //从表主键名
        data: [], //数据源
        columns: [], //从表列信息
        edit: true, //明细是否可以编辑
        single: false, //明细表是否单选
        load: false, //
        delKeys: [], //当编辑时删除当前明细的行主键值
        url: '', //从表加载数据的url
        pagination: { total: 0, size: 100, sortName: '' }, //从表分页配置数据
        height: 0, //默认从表高度
        textInline: true, //明细表行内容显示在一行上，如果需要换行显示，请设置为false
        doubleEdit: true, //使用双击编辑
        clickEdit: false, //是否开启点击单元格编辑，点击其他行时结束编辑
        currentReadonly: false, //当前用户没有编辑或新建权限时，表单只读(可用于判断用户是否有编辑或新建权限)
        //开启编辑时
        beginEdit: (row, column, index) => {
          return true;
        },
        //结束编辑前
        endEditBefore: (row, column, index) => {
          return true;
        },
        //结束编辑后
        endEditAfter: (row, column, index) => {
          return true;
        },
        columnIndex: false, //2020.11.01明细是否显示行号
        ck: true //2020.11.01明细是否显示checkbox
      },
      auditParam: {
        //审核对象
        rows: 0, //当前选中审核的行数
        model: false, //审核弹出框
        value: -1, //审核结果
        status: -1,
        reason: '', //审核原因
        height: 500,
        showViewButton: true,
        auditHis: [],
        showAction: false, //是否显示审批操作(当前节点为用户审批时显示)
        //审核选项(可自行再添加)
        data: [
          { text: '通过', value: 1 },
          { text: '拒绝', value: 2 },
          { text: '驳回', value: 3 }
        ]
      },
      upload: {
        //导入上传excel对象
        excel: false, //导入的弹出框是否显示
        url: '', //导入的路径,如果没有值，则不渲染导入功能
        template: {
          //下载模板对象
          url: '', //下载模板路径
          fileName: '' //模板下载的中文名
        },
        init: false //是否有导入权限，有才渲染导入组件
      },
      height: 0, //表高度
      tableHeight: 0, //查询页面table的高度
      tableMaxHeight: 0, //查询页面table的最大高度
      textInline: true, //table内容超出后是否不换行2020.01.16
      pagination: { total: 0, size: 30, sortName: '' }, //从分页配置数据
      boxOptions: {
        title: '', //弹出框显示的标题2022.08.01
        saveClose: true,
        labelWidth: 100,
        height: 0,
        width: 0,
        summary: false, //弹出框明细table是否显示合计
        draggable: false, //2022.09.12弹出框拖动功能
        modal: true //2022.09.12弹出框背景遮罩层
      }, //saveClose新建或编辑成功后是否关闭弹出框//弹出框的标签宽度labelWidth
      editor: {
        uploadImgUrl: '', //上传路径
        upload: null //上传方法
      },
      numberFields: [],
      //2022.09.26增加自定义导出文件名
      downloadFileName: null,
      select2Count: 2000, //超出500数量显示select2组件
      paginationHide:false//是隐藏分页(2023.10.11)
    };
  },
  methods: {},
  activated() {
     this.initFlowQuery();
    //2020.06.25增加activated方法
    this.onActivated && this.onActivated();
    if (!this._inited) {
      this._inited = true;
      return;
    }
    if (this.activatedLoad) {
      this.refresh();
    }
  },
  mounted() {
    this.mounted();
    // this.$refs.searchForm.forEach()
  },
  unmounted() {
    this.destroyed();
  },
  created: function() {
    //合并自定义业务扩展方法
    Object.assign(this, this.extend.methods);
    //如果没有指定排序字段，则用主键作为默认排序字段
    this.pagination.sortName = this.table.sortName || this.table.key;
    this.initBoxButtons(); //初始化弹出框与明细表格按钮
    this.initAuditColumn();
    this.onInit(); //初始化前，如果需要做其他处理在扩展方法中覆盖此方法
    this.getButtons();
    //初始化自定义表格列
    this.initViewColumns();
    //初始编辑框等数据
    this.initBoxHeightWidth();
    this.initDicKeys(); //初始下框数据源
    this.onInited(); //初始化后，如果需要做其他处理在扩展方法中覆盖此方法
  },
  beforeUpdate: function() {},
  updated: function() {}
};

import props from './props.js';
import methods from './methods.js';

//合并属性
vueParam.props = Object.assign(vueParam.props, props);
//合并方法
vueParam.methods = Object.assign(
  vueParam.methods,
  methods,
  props.extend.methods
);
export default defineComponent(vueParam);
</script>
<style lang="less" scoped>
@import './ViewGrid.less';
</style>
<style lang="less" scoped>
.btn-group ::v-deep(.ivu-select-dropdown) {
  padding: 0px !important;
  right: 3px;
}

.btn-group ::v-deep(.ivu-select-dropdown .ivu-dropdown-menu) {
  min-width: 100px;
  right: -2px;
  position: absolute;
  background: white;
  width: 130px;
  border-radius: 5px;
  border: 1px solid #e7e5e5;
}

.vertical-center-modal ::v-deep(.srcoll-content) {
  padding: 0;
}

.view-model-content {
  background: #eee;
}

.grid-detail ::v-deep(.v-table .el-table__header th) {
  height: 44px;
}
</style>
<style lang="less" scoped>
.grid-search {
  position: relative;

  .search-box {
    background: #fefefe;
    margin-top: 33px;
    border: 1px solid #eae8e8;
    position: absolute;
    z-index: 999;
    left: 15px;
    right: 15px;
    padding: 25px 20px;
    padding-bottom: 0;
    border-top: 0;
    box-shadow: 0 7px 18px -12px #bdc0bb;
  }
}
</style>
