<template>
  <div
    class="layout-container"
    v-if="isCreated"
    :class="{ 'layout-container-padding': $global.gridPadding || padding }"
  >
    <slot name="gridHeader"></slot>
    <!--头部自定义组件-->
    <component
      :is="dynamicComponent.gridHeader"
      ref="gridHeader"
      @parentCall="parentCall"
    ></component>
    <div class="view-container">
      <div class="grid-search">
        <div
          ref="fixedSearchBox"
          :class="[fixedSearchForm ? 'fiexd-search-box' : 'search-box']"
          v-show="searchBoxShow"
        >
          <vol-form
            v-if="searchFormOptions.length"
            ref="searchForm"
            :load-key="false"
            :label-width="labelWidth"
            :formRules="searchFormOptions"
            :formFields="searchFormFields"
            :label-position="labelPosition"
            :select2Count="select2Count"
          >
            <template #footer>
              <div v-if="!fixedSearchForm" class="form-closex">
                <el-button size="small" type="primary" plain @click="advancedSearch">
                  <i class="el-icon-search" />{{ $ts("查询") }}
                </el-button>

                <el-button size="small" type="success" plain @click="onResetSearch">
                  <i class="el-icon-refresh-right" />{{ $ts("重置") }}
                </el-button>
                <el-button size="small" plain @click="searchBoxShow = !searchBoxShow">
                  <i class="el-icon-switch-button" />{{ $ts("关闭") }}
                </el-button>
              </div>
            </template>
          </vol-form>
          <div v-if="fixedSearchForm" class="fs-line"></div>
        </div>
        <div class="view-header">
          <div class="desc-text">
            <i class="el-icon-s-grid" />
            <span>{{ $ts(table.cnName) }}</span>
          </div>
          <view-grid-expand
            :render="gridRender.h"
            :item="gridRender.data"
          ></view-grid-expand>
         <div class="btn-left-slot"> <slot name="btnLeft"></slot></div>
          <div class="notice">
            <div v-if="text" v-html="text"></div>
            <a class="text" :title="extend.text">{{ extend.text }}</a>
          </div>
          <!--快速查询字段-->
          <div class="search-line" v-if="!fixedSearchForm && !searchBoxShow">
            <QuickSearch
              ref="quickSearch"
              v-if="singleSearch"
              :searchFormOptions="searchFormOptions"
              :searchFormFields="searchFormFields"
              :select2Count="select2Count"
              :label-width="labelWidth"
              :queryFields="queryFields"
              @tiggerPress="search"
            ></QuickSearch>
          </div>
          <slot name="btnRight"></slot>
          <!--操作按钮组-->
          <div class="btn-group">
            <template :key="bIndex" v-for="(btn, bIndex) in gridButtons">
              <template v-if="btn.data">
                <el-dropdown size="small" :split-button="false">
                  <el-button
                    :color="btn.color"
                    :dark="false"
                    :type="btn.type"
                    :plain="btn.plain"
                  >
                    {{ $ts(btn.name) }}
                    <i class="el-icon-arrow-down el-icon--right"></i
                  ></el-button>
                  <template #dropdown>
                    <el-dropdown-menu>
                      <el-dropdown-item v-for="(item, index) in btn.data" :key="index">
                        <div @click="registerClick(item.onClick)">
                          <i :class="item.icon"></i>
                          {{ $ts(item.name) }}
                        </div>
                      </el-dropdown-item>
                    </el-dropdown-menu>
                  </template>
                </el-dropdown>
              </template>
              <view-grid-expand
                :render="btn.render"
                :item="btn"
                v-else-if="btn.render"
              ></view-grid-expand>
              <el-button
                v-else
                :type="btn.type"
                size="small"
                :color="btn.color"
                :dark="false"
                :class="btn.class"
                :plain="btn.plain"
                v-show="!btn.hidden"
                :disabled="btn.readonly || btn.disabled"
                @click="registerClick(btn.onClick)"
              >
                <i :class="btn.icon"></i> {{ $ts(btn.name) }}
              </el-button>
            </template>

            <el-dropdown size="small" @click="changeDropdown" v-if="moreButtons.length">
              <el-button type="primary" plain size="small" class="more-btn">
                {{ $ts("更多") }}<i class="el-icon-arrow-down el-icon--right"></i>
              </el-button>
              <template #dropdown>
                <el-dropdown-menu>
                  <template v-for="(item, mindex) in moreButtons" :key="mindex">
                    <el-dropdown-item
                      @click="changeDropdown(item.name)"
                      :name="item.name"
                    >
                      <div v-show="!item.hidden">
                        <i :class="item.icon"></i>
                        {{ $ts(item.name) }}
                      </div>
                    </el-dropdown-item>
                  </template>
                </el-dropdown-menu>
              </template>
            </el-dropdown>
            <el-button
              class="setting-btn"
              type="default"
              style="padding-left: 8px !important; padding-right: 8px !important"
              size="small"
              :plain="true"
              color="#626aef"
              v-if="showCustom"
              @click="customColumClick"
            >
              <i class="el-icon-sort"></i>
            </el-button>
          </div>
        </div>
      </div>
      <!--body自定义组件-->
      <div class="grid-body">
        <slot name="gridBody"></slot>
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
          :index="true"
          :beginEdit="tableBeginEdit"
          :endEditBefore="tableEndEditBefore"
          :column-index="columnIndex"
          :text-inline="textInline"
          :ck="ck"
          :select2Count="select2Count"
          :selectable="onSelectable"
          :lazy="lazy"
          :defaultExpandAll="defaultExpandAll"
          :rowParentField="rowParentField"
          :expandRowKeys="expandRowKeys"
          :dragPosition="dragPosition"
          :spanMethod="onSpanMethod"
          :reserveSelection="reserveSelection"
          :sortable="sortable"
          @onSortEnd="onSortEnd"
          :extraHeight="extraHeight"
        ></vol-table>
      </div>
    </div>
    <slot name="gridFooter"></slot>
    <!--footer自定义组件-->
    <component
      :is="dynamicComponent.gridFooter"
      ref="gridFooter"
      @parentCall="parentCall"
    ></component>
  </div>

  <!-- 编辑弹出框 -->
  <vol-box
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
      <div class="vol-edit-box">
        <div class="vol-edit-content">
              <slot name="modelHeader"></slot>
          <component
            :is="dynamicComponent.modelHeader"
            ref="modelHeader"
            @parentCall="parentCall"
          ></component>
          <div class="item form-item" style="padding-top: 10px">
            <vol-form
              ref="form"
              :editor="editor"
              :load-key="false"
              :label-width="boxOptions.labelWidth"
              :formRules="editFormOptions"
              :formFields="editFormFields"
              :select2Count="select2Count"
              :label-position="labelPosition"
              @tabClick="editFormTabClick"
            ></vol-form>
          </div>
          <!--明细body自定义组件-->
          <slot name="modelBody"></slot>
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
                  <i class="el-icon-edit-outline" />
                  {{ $ts(detail.cnName) }}
                </span>
              </div>
              <div class="detail-content">
                <slot name="detailContent"></slot>
              </div>
              <!--明细表格按钮-->
              <div class="btns detail-btns" v-show="!isBoxAudit">
                <template v-for="(btn, bIndex) in detailOptions.buttons" :key="bIndex">
                  <view-grid-expand
                    :render="btn.render"
                    :item="btn"
                    v-if="btn.render"
                  ></view-grid-expand>

                  <el-button
                    v-else
                    :plain="btn.plain"
                    v-show="!(typeof btn.hidden == 'boolean' && btn.hidden)"
                    @click="registerClick(btn.onClick)"
                    size="small"
                    ><span :style="{ color: btn.color }"
                      ><i :class="btn.icon"></i>{{ $ts(btn.name) }}</span
                    ></el-button
                  >
                </template>
              </div>
            </div>
            <vol-table
              ref="detail"
              @loadBefore="loadDetailTableBefore"
              @loadAfter="loadDetailTableAfter"
              @rowChange="detailRowOnChange"
              @rowClick="detailRowOnClick"
              :url="detailOptions.url"
              :load-key="true"
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
              :column-index="detailOptions.columnIndex"
              :ck="detailOptions.ck"
              :text-inline="detailOptions.textInline"
              :select2Count="select2Count"
              :selectable="detailOnSelectable"
              :spanMethod="detailSpanMethod"
              :sortable="detailOptions.sortable"
              @onSortEnd="detailOnSortEnd"
            ></vol-table>
          </div>
          <!--明细footer自定义组件-->
          <slot name="modelFooter"></slot>
          <component
            :is="dynamicComponent.modelFooter"
            ref="modelFooter"
            @parentCall="parentCall"
          ></component>
        </div>
        <div class="vol-edit-box-right">
          <slot name="modelRight"></slot>
          <component
            :is="dynamicComponent.modelRight"
            ref="modelRight"
            @parentCall="parentCall"
          ></component>
        </div>
      </div>
    </template>
    <template #footer>
      <div style="text-align: center" v-show="isBoxAudit">
        <el-button size="small" type="primary" plain @click="onGridModelClose(false)">
          <i class="el-icon-close">{{ $ts("关闭") }}</i>
        </el-button>
        <el-button
          size="small"
          type="primary"
          v-show="auditParam.showViewButton"
          @click="auditParam.model = true"
        >
          <i class="el-icon-view">{{ $ts("审批") }}</i>
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
          @click="registerClick(btn.onClick)"
        >
          <i :class="btn.icon"></i>{{ $ts(btn.name) }}
        </el-button>
        <el-button size="small" type="primary" plain @click="onGridModelClose(false)">
          <i class="el-icon-close">{{ $ts("关闭") }}</i>
        </el-button>
      </div>
    </template>
  </vol-box>

  <!--导入excel功能-->
  <vol-box
    v-if="upload.url"
    v-model="upload.excel"
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
      :desc="importDesc"
    >
      <slot name="importContent"></slot>
    </UploadExcel>
  </vol-box>
  <!--审批弹出框 -->
  <ViewGridAudit
    v-if="auditInited"
    @auditClick="saveAudit"
    @flowLoadAfter="flowLoadAfter"
    @signAfter="signAfter"
    :option="table"
    ref="auditRef"
  >
    <template #auditContent>
      <slot name="auditContent"></slot>
    </template>
    <template #auditButton>
      <slot name="auditButton"></slot>
    </template>
  </ViewGridAudit>

  <custom-column ref="customColumnRef"></custom-column>
</template>

<script lang="jsx">
// 第一次打开弹出框时,明细表数据没加载
import {
  ref,
  reactive,
  getCurrentInstance,
  onBeforeMount,
  onUnmounted,
  onMounted,
  onActivated,
  shallowRef,
  toRaw,
  onBeforeUnmount,
  defineAsyncComponent,
  defineComponent,
  computed,
  nextTick,
} from "vue";
import action from "./Action";
import { useRouter, useRoute } from "vue-router";
import viewGridProps from "./ViewGridProps.js";
import ViewGridExpand from "./ViewGridExpand.js";
import ViewGridDataConfig from "./ViewGridDataConfig.jsx";
import * as ViewGridProvider from "./ViewGridProvider.jsx";
import { initMethods } from "./ViewGridExposeMethods.jsx";
import { initButtonsAuthFields, getButtons } from "./ViewGridInitButtonsAuthFields.jsx";
import * as ViewGridProviderDetail from "./ViewGridProviderDetail.jsx";
//审批初始化配置
import { ViewGridAuditConfig } from "./ViewGridAuditConfig.jsx";
import ViewGridFilter from "./ViewGridFilter.js";
import { initViewColumns } from "./ViewGridCustomColumn.js";
import { initDicData } from "./ViewGridDicData.js";
import ViewGridEvent from "./ViewGridEvent.js";

import Empty from "@/components/basic/Empty.vue";

export default {
  components: {
    ViewGridExpand,
    QuickSearch: defineAsyncComponent(() => import("@/components/basic/QuickSearch.vue")),
    Audit: defineAsyncComponent(() => import("@/components/basic/Audit.vue")),
    UploadExcel: defineAsyncComponent(() => import("@/components/basic/UploadExcel.vue")),
    "custom-column": defineAsyncComponent(() => import("./ViewGridCustomColumn.vue")),
    "vol-header": defineAsyncComponent(() => import("./../VolHeader.vue")),
    ViewGridAudit: defineAsyncComponent(() => import("./ViewGridAudit.vue")),
  },
  props: { ...viewGridProps() },
  emit: ["parentCall"],
  setup(props, { attrs, emit, expose, slots }) {
    const route = useRoute();
    const { proxy, ctx } = getCurrentInstance();
    ctx.$route = route;
    const dynamicCom = {
      gridHeader: Empty,
      gridBody: Empty,
      gridFooter: Empty,
      modelHeader: Empty,
      modelBody: Empty,
      modelRight: Empty,
      modelFooter: Empty,
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

    const dataConfig = ViewGridDataConfig();
    const tableData = ref([]);
    const isCreated = ref(false);
    const { maxBtnLength, pagination, newTabEdit, hiddenFields } = dataConfig;

    const {
      //setFixedSearch,
      // initBoxButtons,
      // searchExec,
      initBoxHeightWidth,
      destroyed,
      initFlowQuery,
      getUrl,
      // resetSearch,
      initExtraHeight,
      initOntinueAdd,
    } = ViewGridProvider;
    const { initDetailOptions } = ViewGridProviderDetail;
    const exposeMethods = initMethods(proxy, props, dataConfig);
    const parentCall = (fun) => {
      if (typeof fun == "function") {
        fun(proxy);
      }
    };

    ctx.$error = (message) => {
      proxy.$message.error(message);
    };
    ctx.$success = (message) => {
      proxy.$message.success(message);
    };

    pagination.sortName = props.table.sortName || props.table.key;
    newTabEdit.value = props.table.newTabEdit;

    const onGridModelClose = (iconClick) => {
      let boxVal = proxy.onModelClose.call(proxy, iconClick);
      if (!boxVal) return;
      dataConfig.boxModel.value = !props.onModelClose(iconClick);
    };

    //初始化配置信息
    //初始化按钮
    initButtonsAuthFields(proxy, props, dataConfig, route, hiddenFields); //初始化弹出框与明细表格按钮

    //初始化字典配置
    const initDicKeys = (reset) => {
      initDicData(proxy, props, ctx, dataConfig,reset); //初始下框数据源
    };
    const gridEvent = ViewGridEvent(proxy, props, ctx, dataConfig);
    //const { loadTableBefore, loadTableAfter } = gridEvent;
    //查询url
    dataConfig.url.value = getUrl(action.PAGE, null, props.table);
    const gridButtons = computed(() => {
      return dataConfig.buttons.value.filter((x, i) => {
        return i < maxBtnLength.value;
      });
    });
    const moreButtons = computed(() => {
      return dataConfig.buttons.value.filter((x, i) => {
        return i >= maxBtnLength.value;
      });
    });
    //连续添加
    const setContinueAdd = (isAdd) => {
      initOntinueAdd(proxy, props, dataConfig, isAdd);
    };
    //明细配置
    const detailMethods = initDetailOptions(proxy, props, dataConfig);
    const { initAuditColumn, signAfter } = ViewGridAuditConfig(
      proxy,
      props,
      ctx,
      dataConfig
    );
    onBeforeMount(async () => {
      //调用初始化信息
      await proxy.onInit.call(proxy);
      //审批初始化配置
      initAuditColumn(false);
      setContinueAdd();
      await props.onInit(proxy);
      getButtons(proxy, props, ctx, dataConfig);
      initViewColumns(proxy, props, dataConfig, false);
      //初始编辑框等数据
      initBoxHeightWidth(proxy, props, ctx, dataConfig);
      initDicKeys();
      await proxy.onInited.call(proxy);
      await props.onInited(proxy);

      if (proxy.$grid) {
        Object.keys(proxy.$grid).forEach((key) => {
          const fn = proxy.$grid[key];
          typeof fn == "function" && fn.call(proxy);
        });
      }
      //proxy.height = 400;
      isCreated.value = true;
      initExtraHeight(proxy, dataConfig, true);
    });

    const customColumClick = () => {
      proxy.$refs.customColumnRef.show(
        props.columns,
        dataConfig.orginColumnFields,
        props.table.name
      );
    };
    onMounted(() => {
      proxy.mounted.call(proxy);
    });
    onUnmounted(() => {
      proxy.destroyed.call(proxy);
    });
    onActivated(() => {
      proxy.onActivated && proxy.onActivated.call(proxy);
      initFlowQuery(proxy, props, dataConfig, route);
    });
    // textInline.value = true;
    return {
      isCreated,
      tableData,
      ...exposeMethods,
      initDicKeys,
      ...gridEvent,
      parentCall,
      onGridModelClose,
      ...ViewGridProvider,
      ...ViewGridProviderDetail,
      ...ViewGridFilter,
      ...dataConfig,
      dynamicComponent,
      gridButtons,
      moreButtons,
      ...detailMethods,
      signAfter,
      setContinueAdd,
      customColumClick,
      ...props.extend.methods
    };
  },
};
</script>
<style lang="less" scoped>
@import "./ViewGrid.less";
</style>
<style lang="less" scoped>
.btn-group ::v-deep(.el-dropdown .el-button:focus-visible) {
  outline: 0px !important;
  outline-offset: 1px;
}
.vertical-center-modal ::v-deep(.srcoll-content) {
  padding: 0;
}
.view-model-content {
  background: #eee;
}
</style>
<style lang="less" scoped>
.form-item ::v-deep(.form-tabs) {
  margin-top: -10px;
}
.search-line ::v-deep(.vol-form-item) {
  margin-top: 4px !important;
}
</style>
