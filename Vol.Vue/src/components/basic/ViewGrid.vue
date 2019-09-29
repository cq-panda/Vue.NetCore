<template>
  <div class="layout-container">
    <a :href="exportHref" ref="export"></a>
    <vol-box :model.sync="viewModel" :height="450" :width="width" :title="table.cnName+'数据结构'">
      <div slot="content">
        <Table :columns="viewColumns" :data="viewData"></Table>
      </div>
    </vol-box>
    <!--审核(异步点击按钮时才加载待完)-->
    <vol-box :model.sync="auditParam.model" :height="300" :width="550" :title="table.cnName+'--审核'">
      <div slot="content">
        <Audit :auditParam="auditParam"></Audit>
      </div>
      <div slot="footer">
        <Button type="success" icon="md-checkmark-circle" @click="saveAudit">审核</Button>
      </div>
    </vol-box>

    <!--导入excel功能-->
    <vol-box
      v-if="upload.url"
      :model.sync="upload.excel"
      :height="260"
      :width="600"
      :title="table.cnName+'--导入'"
    >
      <UploadExcel @importExcelAfter="importAfter" :url="upload.url" :template="upload.template"></UploadExcel>
    </vol-box>

    <!--头部自定义组件-->
    <gridHeader ref="gridHeader" @parentCall="parentCall"></gridHeader>
    <!--主界面查询与table表单布局-->
    <div class="view-container">
      <div class="view-header">
        <div class="desc-text">
          <Icon type="md-apps" />
          <span>{{table.cnName}}</span>
        </div>
        <div class="notice">
          <!-- <Tooltip content="6666666666666666" placement="bottom">
            <a>Bottom Center</a>
          </Tooltip>-->
          <a class="text" :title="extend.text">{{extend.text}}</a>
        </div>
        <!--快速查询字段-->
        <div class="search-line">
          <QuickSearch
            v-if="singleSearch"
            :singleSearch="singleSearch"
            :searchFormFileds="searchFormFileds"
          ></QuickSearch>
        </div>
        <!--操作按钮组-->
        <div class="btn-group">
          <Button
            v-for="(btn,bIndex) in getButtons()"
            :key="bIndex"
            :type="btn.type"
            :class="btn.value=='Search'?'dropdown':''"
            @click="onClick(btn.onClick)"
          >
            <Icon :type="btn.icon" />
            {{btn.name}}
            <Icon
              v-if="btn.value=='Search'"
              @click="searchBoxShow=!searchBoxShow"
              @click.stop
              type="ios-arrow-down"
            ></Icon>
          </Button>
          <Dropdown trigger="click" @on-click="changeDropdown" v-if="buttons.length> maxBtnLength">
            <Button type="info" ghost>
              更多
              <Icon type="ios-arrow-down"></Icon>
            </Button>
            <DropdownMenu slot="list">
              <DropdownItem
                :name="item.name"
                v-for="(item,dIndex) in buttons.slice(maxBtnLength,buttons.length)"
                :key="dIndex"
              >
                <Icon :type="item.icon"></Icon>
                {{item.name}}
              </DropdownItem>
            </DropdownMenu>
          </Dropdown>
        </div>
        <!--查询条件-->
        <div class="search-box" v-show="searchBoxShow">
          <vol-form ref="searchForm" :formRules="searchFormOptions" :formFileds="searchFormFileds">
            <div class="form-closex" slot="footer">
              <Button size="small" type="info" ghost @click="search">
                <Icon type="md-search" />查询
              </Button>
              <!-- <Icon type="md-close-circle" color="color" size="20" /> -->
              <Button size="small" type="success" ghost @click="resetSearch">
                <Icon type="md-refresh" />重置
              </Button>
              <Button size="small" type="warning" ghost @click="searchBoxShow=!searchBoxShow">
                <Icon type="md-power" />关闭
              </Button>
            </div>
          </vol-form>
        </div>
        <!-- 新建、编辑、查看表单 -->
        <vol-box
          v-if="boxInit"
          :model.sync="boxModel"
          :title="table.cnName+(getCurrentAction())"
          :width="boxOptions.width"
          :height="boxOptions.height"
        >
          <!--明细头部自定义组件-->
          <div class="iview-com" slot="content">
            <modelHeader ref="modelHeader" @parentCall="parentCall"></modelHeader>
            <div class="form-text v-text">
              <span class="title">
                <Icon type="ios-create-outline" />
                {{table.cnName}}
              </span>
            </div>
            <vol-form ref="form" :formRules="editFormOptions" :formFileds="editFormFileds"></vol-form>
            <!--明细body自定义组件-->
            <modelBody ref="modelBody" @parentCall="parentCall"></modelBody>
            <div v-if="detail.columns&&detail.columns.length>0" class="grid-detail">
              <div class="toolbar">
                <div class="title form-text">
                  <span>
                    <Icon type="md-list-box" />
                    {{detail.cnName}}
                  </span>
                </div>
                <!--明细表格按钮-->
                <div class="btns">
                  <Button
                    v-for="(btn,bIndex) in detailOptions.buttons"
                    :key="bIndex"
                    @click="onClick(btn.onClick)"
                    type="dashed"
                    ghost
                    :icon="btn.icon"
                    size="small"
                  >{{btn.name}}</Button>
                </div>
              </div>
              <vol-table
                ref="detail"
                @loadBefore="loadInternalDetailTableBefore"
                @loadAfter="loadDetailTableAfter"
                :url="detailOptions.url"
                :index="detailOptions.edit"
                :tableData="detailOptions.data"
                :columns="detailOptions.columns"
                :pagination="detailOptions.pagination"
                :height="detailOptions.height"
              ></vol-table>
            </div>
          </div>
          <!--明细footer自定义组件-->
          <modelFooter ref="modelFooter" @parentCall="parentCall"></modelFooter>
          <div slot="footer">
            <Button
              v-for="(btn,bIndex) in boxButtons"
              :key="bIndex"
              :type="btn.type"
              @click="onClick(btn.onClick)"
            >
              <Icon :type="btn.icon" />
              {{btn.name}}
            </Button>
            <Button type="info" @click="boxModel=false">
              <Icon type="md-close" />关闭
            </Button>
          </div>
        </vol-box>
      </div>
      <!--body自定义组件-->
      <gridBody ref="gridBody" @parentCall="parentCall"></gridBody>
      <!--table表格-->
      <div class="grid-container">
        <vol-table
          ref="table"
          @loadBefore="loadTableBefore"
          @loadAfter="loadTableAfter"
          :tableData="[]"
          :linkView="linkData"
          :columns="columns"
          :pagination="pagination"
          :height="height"
          :url="url"
        ></vol-table>
      </div>
    </div>

    <!--footer自定义组件-->
    <gridFooter ref="gridFooter" @parentCall="parentCall"></gridFooter>
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
  UPLOAD: "Upload" //上传文件
};
const comName = [
  "gridHeader",
  "gridBody",
  "gridFooter",
  "modelHeader",
  "modelBody",
  "modelFooter"
];
import Empty from "@/components/basic/Empty.vue";
var $viewGridVue;
let _components = {
  gridHeader: Empty,
  gridBody: Empty,
  gridFooter: Empty,
  modelHeader: Empty,
  //弹出框(修改、编辑、查看)header、content、footer对应位置扩充的组件
  // modelHeader: {
  //   template: ""//'<Alert type="success">静态页面发布目前主要用于的是移动端</Alert>'
  // },
  // gridHeader: function(resolve, reject) {
  //   setTimeout(function() {
  //     // 向 `resolve` 回调传递组件定义
  //     resolve({
  //       template: ""
  //     });
  //   }, 1000);
  // },
  modelBody: Empty,
  modelFooter: Empty
};
var vueParam = {
  components: {
    //表单header、content、footer对应位置扩充的组件
    // gridHeader: function(resolve, reject) {
    //   setTimeout(function() {
    //     // 向 `resolve` 回调传递组件定义
    //     resolve({
    //       template: ""
    //     });
    //   }, 1000);
    // },
    ..._components,
    VolForm: () => import("@/components/basic/VolForm.vue"),
    VolBoxForm: () => import("@/components/basic/VolBoxForm.vue"),
    VolTable: () => import("@/components/basic/VolTable.vue"),
    VolBox: () => import("@/components/basic/VolBox.vue"),
    QuickSearch: () => import("@/components/basic/QuickSearch.vue"),
    Audit: () => import("@/components/basic/Audit.vue"),
    UploadExcel: () => import("@/components/basic/UploadExcel.vue")
  },
  props: {},
  data() {
    return {
      _inited: false,
      const: _const, //增删改查导入导出等对应的action
      boxInit: false, //新建或编辑的弹出框初化状态，默认不做初始化，点击新建或编辑才初始化弹出框
      searchBoxShow: false, //高级查询(界面查询后的下拉框点击触发)
      singleSearch: "", //快速查询字段
      exportHref: "",
      currentAction: _const.ADD, //当新建或编辑时，记录当前的状态:如当前操作是新建
      hasKeyField: {}, //当前操作的行数据(新建、编辑、查看)
      closable: false,
      boxModel: false, //弹出新建、编辑框
      width: 700,
      viewModel: false, //查看表结构的弹出框
      viewColumns: [], //查看表结构的列数据
      viewData: [], //查看表结构信息
      maxBtnLength: 3, //界面按钮最多显示的个数，超过的数量都显示在更多中
      buttons: [], //查询界面按钮  如需要其他操作按钮，可在表对应的.js中添加(如:Sys_User.js中buttons添加其他按钮)
      boxButtons: [], //弹出框按钮 如需要其他操作按钮，可在表对应的.js中添加
      dicKeys: [], //当前界面所有的下拉框字典编号
      hasKeyField: [], //有字典数据源的字段
      url: "", //界面表查询的数据源的url
      hasDetail: false, //是否有从表(明细)表格数据
      initActivated: false,
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
        delKeys: [], //当编辑时删除当前明细的行主键值
        url: "", //从表加载数据的url
        pagination: { total: 0, size: 100, sortName: "" }, //从表分页配置数据
        height: 250 //默认从表高度
      },
      auditParam: {
        //审核对象
        rows: 0, //当前选中审核的行数
        model: false, //审核弹出框
        status: -1, //审核结果
        reason: "", //审核原因
        //审核选项(可自行再添加)
        data: [{ text: "通过", status: 1 }, { text: "拒绝", status: 2 }]
      },
      upload: {
        //导入上传excel对象
        excel: false, //导入的弹出框是否显示
        url: "", //导入的路径,如果没有值，则不渲染导入功能
        template: {
          //下载模板对象
          url: "", //下载模板路径
          fileName: "" //模板下载的中文名
        },
        init: false //是否有导入权限，有才渲染导入组件
      },
      height: 0, //表高度

      pagination: { total: 0, size: 30, sortName: "" }, //从分页配置数据
      boxOptions: { height: 0, width: 0 }
    };
  },
  methods: {//方法已放到ViewGridConfig文件夹下，加载时会合并ViewGridConfig下的方法到methods中
    mergeComponents() {
      if (this.extend.components) {
        for (const key in this.extend.components) {
          if (this.extend.components[key]) {
            this.$options.components[key] = this.extend.components[key];
          } else {
            this.$options.components[key] = Empty;
          }
        }
      }
    }
  }, 
  activated() {
    if (!this._inited) {
      this._inited = true;
      return;
    }
    console.log("activated");
    // //  this.$options.components.modelHeader.template =
    // //   '<Alert type="success">88767</Alert>';
    //合并扩展组件、弹出框新建编辑页面自定义扩展组件或组件路径
    this.mergeComponents();
  },
  mounted() {
    this.mounted();
  },
  beforeCreate() {
  },
  created: function() {
    //在其他方法中如果拿不到this，请使用$viewGridVue
    $viewGridVue = this;
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
  },
  beforeUpdate: function() {},
  updated: function() {}
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
</style>
