import { ref, reactive } from 'vue'

const dataConfig = () => {
  return {
    // 是否弹出框审批
    isBoxAudit: ref(false),
    auditInited:ref(false),
    showTableAudit: ref(true), //是否显示表格审批按钮
    // 表单字段类型
    formFieldsType: ref([]),
    // 工作流步骤
    workFlowSteps: ref([]),
    // 树形结构的主键字段，如果设置值默认会开启树形table；注意rowKey字段的值必须是唯一（2021.05.02）
    rowKey: ref(undefined),
    // 2020.09.011是否固定查询表单，true查询表单将固定显示在表单的最上面
    fixedSearchForm: ref(false),
    // 初始化状态
    isInited: ref(false),
    // 2021.03.19是否开启查询界面表格双击编辑
    doubleEdit: ref(false),
    // 当前用户没有编辑或新建权限时，表单只读(可用于判断用户是否有编辑或新建权限)
    currentReadonly: ref(false),
    // 表是否单选
    single: ref(false),
    // 增删改查导入导出等对应的action
    action: ref('action'),
    // 新建或编辑的弹出框初化状态，默认不做初始化，点击新建或编辑才初始化弹出框
    boxInit: ref(false),
    // 高级查询(界面查询后的下拉框点击触发)
    searchBoxShow: ref(false),
    // 快速查询字段
    singleSearch: ref({}),
    // 导出链接
    exportHref: ref(''),
    // 当新建或编辑时，记录当前的状态:如当前操作是新建
    currentAction: ref('Add'),
    // 当前编辑或查看数据的行
    currentRow: ref({}),
    // 是否可关闭
    closable: ref(false),
    // 弹出新建、编辑框
    boxModel: ref(false),
    // 弹出框查看表数据结构
    width: ref(700),
    // 高级查询的标签宽度
    labelWidth: ref(85),
    // 查看表结构的弹出框
    viewModel: ref(false),
    // 查看表结构的列数据
    viewColumns: ref([]),
    viewColumnsClone: ref([]),
    // 是否显示自定义配置列按钮2022.05.27
    showCustom: ref(true),
    showCustomSearch:ref(true),//是否显示自定义查询
    // 界面按钮最多显示的个数，超过的数量都显示在更多中
    maxBtnLength: ref(8),
    // 查询界面按钮  如需要其他操作按钮，可在表对应的.js中添加(如:Sys_User.js中buttons添加其他按钮)
    buttons: ref([]),
    splitButtons: ref([]),
    // 弹出框按钮 如需要其他操作按钮，可在表对应的.js中添加
    boxButtons: ref([]),
    // 当前界面所有的下拉框字典编号及数据源
    dicKeys: ref([]),
    keyValueType: reactive({ _dinit: false }),
    // 界面表查询的数据源的url
    url: ref(''),
    // 是否有从表(明细)表格数据
    hasDetail: ref(false),
    initActivated: ref(false),
    // 是否默认加载表数据
    load: ref(true),
    // 页面触发actived时是否刷新页面数据
    activatedLoad: ref(false),
    // 查询界面table是否显示合计
    summary: ref(false),
    // 需要从远程绑定数据源的字典编号,如果字典数据源的查询结果较多，请在onInit中将字典编号添加进来
    // 只对自定sql有效
    remoteKeys: ref([]),
    // 2020.11.01是否显示行号
    columnIndex: ref(false),
    // 2020.11.01是否显示checkbox
    ck: ref(true),
    // 2021.04.11新建时是否可以连续新建操作
    continueAdd: ref(false),
    // 2021.04.11按钮名称
    continueAddName: ref('保存后继续添加'),
    // detailUrl: "",
    // 从表配置
    detailOptions: reactive({
      // 明细表隐藏分页
      paginationHide: false,
      // 明细表格可拖动位置，顶部拖动top,底部bottom
      dragPosition: '',
      // 弹出框从表表格操作按钮,目前有删除行，添加行，刷新操作，如需要其他操作按钮，可在表对应的.js中添加
      buttons: [],
      // 从表名称
      cnName: '',
      // 从表主键名
      key: '',
      // 数据源
      data: [],
      // 从表列信息
      columns: [],
      // 明细是否可以编辑
      edit: true,
      // 明细表是否单选
      single: false,
      load: false,
      // 当编辑时删除当前明细的行主键值
      delKeys: [],
      // 从表加载数据的url
      url: '',
      // 从表分页配置数据
      pagination: {
        // sizes: [20, 30, 40, 60, 90], //默认分页条大小
        // size: 30, //默认分页大小(每页大小)
        sortName: '', //排序字段
        order: 'desc' //排序方式desc或者asc
      },
      // 默认从表高度
      height: 0,
      // 明细表行内容显示在一行上，如果需要换行显示，请设置为false
      textInline: true,
      // 使用双击编辑
      doubleEdit: true,
      // 是否开启点击单元格编辑，点击其他行时结束编辑
      clickEdit: false,
      // 开启编辑时
      beginEdit: (row, column, index) => {
        return true
      },
      // 结束编辑前
      endEditBefore: (row, column, index) => {
        return true
      },
      // 结束编辑后
      endEditAfter: (row, column, index) => {
        return true
      },
      // 2020.11.01明细是否显示行号
      columnIndex: false,
      // 2020.11.01明细是否显示checkbox
      ck: true,
      // 表格是否可以拖拽排序2024.10.06
      sortable: false
    }),
    // 审核对象
    auditParam: reactive({
      // 当前选中审核的行数
      rows: 0,
      // 审核弹出框
      model: false,
      // 审核结果
      value: -1,
      status: -1,
      // 审核原因
      reason: '',
      height: 500,
      showViewButton: true,
      auditHis: [],
      // 是否显示审批操作(当前节点为用户审批时显示)
      showAction: false,
      // 审核选项(可自行再添加)
      data: [
        { text: '通过', value: 1 },
        { text: '拒绝', value: 2 },
        { text: '驳回', value: 3 }
      ]
    }),
    // 导入上传excel对象
    upload: reactive({
      // 导入的弹出框是否显示
      excel: false,
      // 导入的路径,如果没有值，则不渲染导入功能
      url: '',
      template: {
        // 下载模板路径
        url: '',
        // 模板下载的中文名
        fileName: ''
      },
      // 是否有导入权限，有才渲染导入组件
      init: false
    }),
    // 表高度
    height: ref(0),
    // 查询页面table的高度
    tableHeight: ref(0),
    // 查询页面table的最大高度
    tableMaxHeight: ref(0),
    // table内容超出后是否不换行2020.01.16
    textInline: ref(true),
    // 从分页配置数据
    pagination: reactive({ total: 0, size: 30, sortName: '' }),
    boxOptions: reactive({
      // 弹出框显示的标题2022.08.01
      title: '',
      // saveClose新建或编辑成功后是否关闭弹出框
      saveClose: true,
      // 弹出框的标签宽度labelWidth
      labelWidth: 85,
      height: 0,
      width: 0,
      // 弹出框明细table是否显示合计
      summary: false,
      // 2022.09.12弹出框拖动功能
      draggable: false,
      // 2022.09.12弹出框背景遮罩层
      modal: true
    }),
    editor: reactive({
      // 上传路径
      uploadImgUrl: '',
      // 上传方法
      upload: null
    }),
    // 2022.09.26增加自定义导出文件名
    downloadFileName: ref(null),
    // 超出500数量显示select2组件
    select2Count: ref(6000),
    // 新窗口编辑
    newTabEdit: ref(false),
    // 是否多明细表
    isMultiple: ref(false),
    // 明细表的高度
    detailHeight: ref(300),
    // 隐藏字段
    hiddenFields: ref([]),
    text: ref(''),
    // 三级明细表
    subDetails: ref([]),
    // 树形表格是否默认延迟加载
    lazy: ref(true),
    // 树形表格是否展开所有
    defaultExpandAll: ref(false),
    // 默认展开的节点
    expandRowKeys: ref([]),
    // 是否隐藏分页
    paginationHide: ref(false),
    // 树形表格父级id
    rowParentField: ref(''),
    // 导入excel弹出框的描述
    importDesc: ref(''),
    multiple: reactive({
      // 一对多水平显示(二级表与三级表是否左右结构显示)
      horizontal: false,
      // 左边二级表宽度(默认不用设置)
      leftWidth: 0,
      // 右边三级表宽度(默认不用设置)
      rightWidth: 0
    }),
    // 表格可拖动位置，顶部拖动top,底部bottom
    dragPosition: ref(''),
    // 编辑表单标签文字显示位置:left / top（默认是top，或者在main.js全局配置）
    labelPosition: ref(''),
    // 快捷查询字段2024.01.18增加多个快捷查询字段
    queryFields: ref([]),
    // 当前是否点击的复制行操作
    isCopyClick: ref(false),
    // 是否使用padding间距
    padding: ref(false),
    gridRender: reactive({
      h: (h, {}) => {
        return ''
      },
      data: {}
    }),
    // 只提交变更的明细表数据2024.08.30
    submitChangeRows: ref(true),
    // 分页或者刷新表格数据后是否保留复选框选择状态，2024.09.10
    reserveSelection: ref(false),
    // 表格是否可以拖拽排序2024.10.06
    sortable: ref(false),
    extraHeight: ref(0),
    showTabs: ref(true),
    orginColumnFields: reactive([]),
    //是否审批点击
    isAuditClick: ref(false)
  }
}

export default dataConfig
