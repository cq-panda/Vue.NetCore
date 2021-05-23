<template>
  <div class="layout-container">
    <a :href="exportHref"
       ref="export"></a>
    <!--开启懒加载2020.12.06 -->
    <vol-box :model.sync="viewModel"
             :height="450"
             :width="width"
             :lazy="true"
             :title="table.cnName+'数据结构'">
      <div slot="content">
        <Table :columns="viewColumns"
               :data="viewData"></Table>
      </div>
    </vol-box>
    <!--开启懒加载2020.12.06 -->
    <!--审核(异步点击按钮时才加载待完)-->
    <vol-box :model.sync="auditParam.model"
             :height="300"
             :width="550"
             :lazy="true"
             :title="table.cnName+'--审核'">
      <div slot="content">
        <Audit :auditParam="auditParam"></Audit>
      </div>
      <div slot="footer">
        <Button type="success"
                icon="md-checkmark-circle"
                @click="saveAudit">审核</Button>
      </div>
    </vol-box>

    <!--导入excel功能-->
    <!--2020.10.31添加导入前的方法-->
    <!--开启懒加载2020.12.06 -->
    <vol-box v-if="upload.url"
             :model.sync="upload.excel"
             :height="285"
             :width="600"
             :lazy="true"
             :title="table.cnName+'--导入'">
      <UploadExcel ref="upload_excel"
                   @importExcelAfter="importAfter"
                   :importExcelBefore="importExcelBefore"
                   :url="upload.url"
                   :template="upload.template"></UploadExcel>
    </vol-box>

    <!--头部自定义组件-->
    <gridHeader ref="gridHeader"
                @parentCall="parentCall"></gridHeader>
    <!--主界面查询与table表单布局-->
    <div class="view-container">
      <!-- 2020.09.11增加固定查询表单 -->
      <!--查询条件-->
      <div class="grid-search">
        <div :class="[fiexdSearchForm?'fiexd-search-box':'search-box']"
             v-show="searchBoxShow">
          <!-- 2020.09.13增加formFileds拼写错误兼容处理 -->
          <vol-form ref="searchForm"
                    :label-width="labelWidth"
                    :formRules="searchFormOptions"
                    :formFields="_searchFormFields">
            <div v-if="!fiexdSearchForm"
                 class="form-closex"
                 slot="footer">
              <Button size="small"
                      type="info"
                      ghost
                      @click="search">
                <Icon type="md-search" />查询
              </Button>

              <Button size="small"
                      type="success"
                      ghost
                      @click="resetSearch">
                <Icon type="md-refresh" />重置
              </Button>
              <Button size="small"
                      type="warning"
                      ghost
                      @click="searchBoxShow=!searchBoxShow">
                <Icon type="md-power" />关闭
              </Button>
            </div>
          </vol-form>
        </div>
        <div class="view-header">
          <div class="desc-text">
            <Icon type="md-apps" />
            <span>{{table.cnName}}</span>
          </div>
          <div class="notice">
            <a class="text"
               :title="extend.text">{{extend.text}}</a>
          </div>
          <!--快速查询字段-->
          <div class="search-line">
            <QuickSearch v-if="singleSearch"
                         :singleSearch="singleSearch"
                         :searchFormFields="_searchFormFields"
                         :tiggerPress="quickSearchKeyPress"></QuickSearch>
          </div>
          <!--操作按钮组-->
          <!-- 2020.11.29增加查询界面hidden属性 -->
          <div class="btn-group">
            <Button v-for="(btn,bIndex) in splitButtons"
                    :key="bIndex"
                    :type="btn.type"
                    :class="btn.class"
                    v-show="!btn.hidden"
                    @click="onClick(btn.onClick)">
              <Icon :type="btn.icon" />
              {{btn.name}}
            </Button>
            <Dropdown trigger="click"
                      @on-click="changeDropdown"
                      v-if="buttons.length> maxBtnLength">
              <Button type="info"
                      ghost>
                更多
                <Icon type="ios-arrow-down"></Icon>
              </Button>
              <DropdownMenu slot="list">
                <DropdownItem :name="item.name"
                              v-show="!item.hidden"
                              v-for="(item,dIndex) in buttons.slice(maxBtnLength,buttons.length)"
                              :key="dIndex">
                  <Icon :type="item.icon"></Icon>
                  {{item.name}}
                </DropdownItem>
              </DropdownMenu>
            </Dropdown>
          </div>
        </div>
        <vol-box v-if="boxInit"
                 :model.sync="boxModel"
                 :title="table.cnName+(getCurrentAction())"
                 :width="boxOptions.width"
                 :height="boxOptions.height"
                 :padding="0">
          <!--明细头部自定义组件-->
          <div class="iview-com"
               slot="content">
            <modelHeader ref="modelHeader"
                         class="model-header"
                         @parentCall="parentCall"></modelHeader>
            <div class="item form-item">
              <div class="form-text v-text">
                <span class="title">
                  <Icon type="ios-create-outline" />
                  {{table.cnName}}
                </span>
              </div>
              <vol-form ref="form"
                        :editor="editor"
                        :label-width="boxOptions.labelWidth"
                        :formRules="editFormOptions"
                        :formFields="_editFormFields"></vol-form>
            </div>
            <!--明细body自定义组件-->
            <modelBody class="model-body"
                       ref="modelBody"
                       @parentCall="parentCall"></modelBody>
            <div v-if="detail.columns&&detail.columns.length>0"
                 class="grid-detail table-item item">
              <div class="toolbar">
                <div class="title form-text">
                  <span>
                    <Icon type="md-list-box" />
                    {{detail.cnName}}
                  </span>
                </div>
                <!--明细表格按钮-->
                <div class="btns">
                  <Button v-for="(btn,bIndex) in detailOptions.buttons"
                          :key="bIndex"
                          v-show="!btn.hasOwnProperty('hidden')||!btn.hidden"
                          @click="onClick(btn.onClick)"
                          type="dashed"
                          ghost
                          :icon="btn.icon"
                          size="small">{{btn.name}}</Button>
                </div>
              </div>
              <vol-table ref="detail"
                         @loadBefore="loadInternalDetailTableBefore"
                         @loadAfter="loadDetailTableAfter"
                         @rowChange="detailRowOnChange"
                         @rowClick="detailRowOnClick"
                         :url="detailOptions.url"
                         :index="detailOptions.edit"
                         :tableData="detailOptions.data"
                         :columns="detailOptions.columns"
                         :pagination="detailOptions.pagination"
                         :height="detailOptions.height"
                         :single="detailOptions.single"
                         :pagination-hide="false"
                         :defaultLoadPage="detailOptions.load"
                         :doubleEdit="detailOptions.doubleEdit"
                         :beginEdit="detailOptions.beginEdit"
                         :endEditBefore="detailOptions.endEditBefore"
                         :endEditAfter="detailOptions.endEditAfter"
                         :summary="detailOptions.summary"
                         :click-edit="detailOptions.clickEdit"
                         :column-index="detailOptions.columnIndex"
                         :ck="detailOptions.ck"></vol-table>
            </div>
            <!--明细footer自定义组件-->
            <modelFooter ref="modelFooter"
                         class="model-footer"
                         @parentCall="parentCall"></modelFooter>
          </div>

          <div slot="footer">
            <Button v-for="(btn,bIndex) in boxButtons"
                    :key="bIndex"
                    :type="btn.type"
                    v-show="!btn.hasOwnProperty('hidden')||!btn.hidden"
                    :disabled="btn.hasOwnProperty('disabled')&&!!btn.disabled"
                    @click="onClick(btn.onClick)">
              <Icon :type="btn.icon" />
              {{btn.name}}
            </Button>
            <Button type="info"
                    @click="boxModel=false">
              <Icon type="md-close" />关闭
            </Button>
          </div>
        </vol-box>
      </div>
      <!--body自定义组件-->
      <gridBody ref="gridBody"
                @parentCall="parentCall"></gridBody>
      <!--table表格-->
      <div class="grid-container">
        <!-- 2021.05.02增加树形结构 rowKey -->
        <vol-table ref="table"
                   :single="single"
                   :rowKey="rowKey"
                   :loadTreeChildren="loadTreeTableChildren"
                   @loadBefore="loadTableBefore"
                   @loadAfter="loadTableAfter"
                   @rowChange="rowOnChange"
                   @rowClick="rowOnClick"
                   @row-dbclick="rowOnDbClick"
                   :tableData="[]"
                   :linkView="linkData"
                   :columns="columns"
                   :pagination="pagination"
                   :height="height"
                   :max-height="tableMaxHeight"
                   :pagination-hide="false"
                   :url="url"
                   :defaultLoadPage="load"
                   :summary="summary"
                   :double-edit="doubleEdit"
                   :index="doubleEdit"
                   :endEditBefore="endEditBefore"
                   :click-edit="true"
                   :column-index="columnIndex"
                   :text-inline="textInline"
                   :ck="ck"></vol-table>
      </div>
    </div>

    <!--footer自定义组件-->
    <gridFooter ref="gridFooter"
                @parentCall="parentCall"></gridFooter>
  </div>
</template>

<script>
const _const = {
  EDIT: "update",
  ADD: "Add",
  VIEW: "view",
  PAGE: "getPageData",
  AUDIT: "audit",
  DEL: "del",
  EXPORT: "Export", //导出操作返回加密后的路径
  DOWNLOAD: "DownLoadFile", //导出文件
  DOWNLOADTEMPLATE: "DownLoadTemplate", //下载导入模板
  IMPORT: "Import", //导入(导入表的Excel功能)
  UPLOAD: "Upload", //上传文件
};
const comName = [
  "gridHeader",
  "gridBody",
  "gridFooter",
  "modelHeader",
  "modelBody",
  "modelFooter",
];
import Empty from "@/components/basic/Empty.vue";
var $viewGridVue, $this;
let _components = {
  gridHeader: Empty,
  gridBody: Empty,
  gridFooter: Empty,
  modelHeader: Empty,
  modelBody: Empty,
  modelFooter: Empty,
};
import VolTable from "@/components/basic/VolTable.vue";
var vueParam = {
  components: {
    ..._components,
    VolForm: () => import("@/components/basic/VolForm.vue"),
    VolBoxForm: () => import("@/components/basic/VolBoxForm.vue"),
    VolTable: VolTable, //() => import("@/components/basic/VolTable.vue"),
    VolBox: () => import("@/components/basic/VolBox.vue"),
    QuickSearch: () => import("@/components/basic/QuickSearch.vue"),
    Audit: () => import("@/components/basic/Audit.vue"),
    UploadExcel: () => import("@/components/basic/UploadExcel.vue"),
  },
  props: {},
  data () {
    return {
       //树形结构的主键字段，如果设置值默认会开启树形table；注意rowKey字段的值必须是唯一（2021.05.02）
      rowKey:undefined,
      _searchFormFields: {}, //2020.09.13增加formFileds拼写错误兼容处理
      _editFormFields: {}, //2020.09.13增加formFileds拼写错误兼容处理
      fiexdSearchForm: false, //2020.09.011是否固定查询表单，true查询表单将固定显示在表单的最上面
      _inited: false,
      doubleEdit:false,//2021.03.19是否开启查询界面表格双击编辑
      single: false, //表是否单选
      const: _const, //增删改查导入导出等对应的action
      boxInit: false, //新建或编辑的弹出框初化状态，默认不做初始化，点击新建或编辑才初始化弹出框
      searchBoxShow: false, //高级查询(界面查询后的下拉框点击触发)
      singleSearch: {}, //快速查询字段
      exportHref: "",
      currentAction: _const.ADD, //当新建或编辑时，记录当前的状态:如当前操作是新建
      currentRow: {}, //当前编辑或查看数据的行
      closable: false,
      boxModel: false, //弹出新建、编辑框
      width: 700, //弹出框查看表数据结构
      labelWidth: 100, //高级查询的标签宽度
      viewModel: false, //查看表结构的弹出框
      viewColumns: [], //查看表结构的列数据
      viewData: [], //查看表结构信息
      maxBtnLength: 3, //界面按钮最多显示的个数，超过的数量都显示在更多中
      buttons: [], //查询界面按钮  如需要其他操作按钮，可在表对应的.js中添加(如:Sys_User.js中buttons添加其他按钮)
      splitButtons: [],
      uploadfiled: [], //上传文件图片的字段
      boxButtons: [], //弹出框按钮 如需要其他操作按钮，可在表对应的.js中添加
      dicKeys: [], //当前界面所有的下拉框字典编号及数据源
      hasKeyField: [], //有字典数据源的字段
      keyValueType: { _dinit: false },
      url: "", //界面表查询的数据源的url
      hasDetail: false, //是否有从表(明细)表格数据
      initActivated: false,
      load: true, //是否默认加载表数据
      activatedLoad: false, //页面触发actived时是否刷新页面数据
      summary: false, //查询界面table是否显示合计
      //需要从远程绑定数据源的字典编号,如果字典数据源的查询结果较多，请在onInit中将字典编号添加进来
      //只对自定sql有效
      remoteKeys: [],
      columnIndex: false,//2020.11.01是否显示行号
      ck: true,//2020.11.01是否显示checkbox
      continueAdd:false,//2021.04.11新建时是否可以连续新建操作
      continueAddName:"保存后继续添加",//2021.04.11按钮名称
      // detailUrl: "",
      detailOptions: {
        //弹出框从表(明细)对象
        //从表配置
        buttons: [], //弹出框从表表格操作按钮,目前有删除行，添加行，刷新操作，如需要其他操作按钮，可在表对应的.js中添加
        cnName: "", //从表名称
        key: "", //从表主键名
        data: [], //数据源
        columns: [], //从表列信息
        edit: true, //明细是否可以编辑
        single: false, //明细表是否单选
        load: true,
        delKeys: [], //当编辑时删除当前明细的行主键值
        url: "", //从表加载数据的url
        pagination: { total: 0, size: 100, sortName: "" }, //从表分页配置数据
        height: 0, //默认从表高度
        doubleEdit: true, //使用双击编辑
        clickEdit: false,//是否开启点击单元格编辑，点击其他行时结束编辑
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
        columnIndex: false,//2020.11.01明细是否显示行号
        ck: true,//2020.11.01明细是否显示checkbox
      },
      auditParam: {
        //审核对象
        rows: 0, //当前选中审核的行数
        model: false, //审核弹出框
        status: -1, //审核结果
        reason: "", //审核原因
        //审核选项(可自行再添加)
        data: [
          { text: "通过", status: 1 },
          { text: "拒绝", status: 2 },
        ],
      },
      upload: {
        //导入上传excel对象
        excel: false, //导入的弹出框是否显示
        url: "", //导入的路径,如果没有值，则不渲染导入功能
        template: {
          //下载模板对象
          url: "", //下载模板路径
          fileName: "", //模板下载的中文名
        },
        init: false, //是否有导入权限，有才渲染导入组件
      },
      height: 0, //表高度
      tableHeight: 0, //查询页面table的高度
      tableMaxHeight: 0, //查询页面table的最大高度
      textInline:true,//table内容超出后是否不换行2020.01.16
      pagination: { total: 0, size: 30, sortName: "" }, //从分页配置数据
      boxOptions: {
        saveClose: true,
        labelWidth: 100,
        height: 0,
        width: 0,
        summary: false, //弹出框明细table是否显示合计
      }, //saveClose新建或编辑成功后是否关闭弹出框//弹出框的标签宽度labelWidth
      editor:{
        uploadImgUrl:"",//上传路径 
        upload:null//上传方法
      }
    };
  },
  methods: {
    //方法已放到ViewGridConfig文件夹下，加载时会合并ViewGridConfig下的方法到methods中
    mergeComponents () {
      if (this.extend.components) {
        for (const key in this.extend.components) {
          if (this.extend.components[key]) {
            this.$options.components[key] = this.extend.components[key];
          } else {
            this.$options.components[key] = Empty;
          }
        }
      }
    },
  },
  activated () {
    //2020.06.25增加activated方法
    this.onActivated && this.onActivated();
    if (!this._inited) {
      this._inited = true;
      return;
    }
    if (this.activatedLoad) {
      this.refresh();
    }
    this.mergeComponents();
  },
  mounted () {
    this.mounted();
    // this.$refs.searchForm.forEach()
  },
  destroyed(){
    this.destroyed();
  },
  created: function () {
    //2020.09.13增加formFileds拼写错误兼容处理
    this._searchFormFields = Object.keys(this.searchFormFields).length
      ? this.searchFormFields
      : this.searchFormFileds;
    //2020.09.13增加formFileds拼写错误兼容处理
    this._editFormFields = Object.keys(this.editFormFields).length
      ? this.editFormFields
      : this.editFormFileds;
    //在其他方法中如果拿不到this，请使用$viewGridVue或$this
    $viewGridVue = this;
    $this = this;
    //合并扩展组件
    this.mergeComponents();
    //合并自定义业务扩展方法
    if (this.extend.methods) {
      for (const key in this.extend.methods) {
        this[key] = this.extend.methods[key];
      }
    }
    //如果没有指定排序字段，则用主键作为默认排序字段
    this.pagination.sortName = this.table.sortName || this.table.key;
    this.initBoxButtons(); //初始化弹出框与明细表格按钮
    this.onInit(); //初始化前，如果需要做其他处理在扩展方法中覆盖此方法
    //初始编辑框等数据
    this.initBoxHeightWidth();
    this.initDicKeys(); //初始下框数据源

    this.onInited(); //初始化后，如果需要做其他处理在扩展方法中覆盖此方法
    this.splitButtons = this.getButtons();
  },
  beforeUpdate: function () { },
  updated: function () { },
};

import props from "./ViewGridConfig/props.js";
import methods from "./ViewGridConfig/methods.js";

//合并属性
vueParam.props = Object.assign(vueParam.props, props);
//合并方法
vueParam.methods = Object.assign(
  vueParam.methods,
  methods,
  props.extend.methods
);
// vueParam.methods=methods;
export default vueParam;
import "@/assets/css/ViewContainer.less";
import "@/assets/css/ViewGrid.less";
</script>

<style scoped>
.btn-group >>> .ivu-select-dropdown {
  padding: 0px !important;
  right: 3px;
}
.btn-group >>> .ivu-select-dropdown .ivu-dropdown-menu {
  min-width: 100px;
  right: -2px;
  position: absolute;
  background: white;
  width: 130px;
  border-radius: 5px;
  border: 1px solid #e7e5e5;
}
.vertical-center-modal >>> .srcoll-content {
  padding: 0;
}
.view-model-content {
  background: #eee;
}
</style>
<style lang="less">
.grid-search {
  position: relative;
  .fiexd-search-box {
    border-bottom: 1px solid #eee;
    margin-bottom: 28px;
    padding-bottom: 0px;
    padding-top: 5px;
  }
  .search-box {
    background: #fefefe;
    margin-top: 45px;
    border: 1px solid #ececec;
    position: absolute;
    z-index: 999;
    left: 0;
    right: 0;
    padding: 25px 40px;
    padding-bottom: 0;
    box-shadow: 0 7px 18px -12px #bdc0bb;
  }
}
</style>
