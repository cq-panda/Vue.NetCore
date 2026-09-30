
import { columnType, dataType, searchDataType } from "./coderV2Options.jsx";

/** 供 coder.vue 注册：快捷查询旁「刷新」图标点击时同步下拉数据（与 coderV3TableInfo.syncQuickQueryOptionData 一致） */
export const builderFormCallbacks = {
  refreshQuickQueryFields: null,
};

/** 表头提示：图标在文字左侧，与「是否显示」列风格一致 */
const renderColumnHeaderTip = (title, tip) => {
  return (h, { }) => (
    <el-tooltip effect="dark" placement="top">
      {{
        default: () => (
          <span>
            <span
              style="font-size: 10px; margin-right: 2px;"
              class="el-icon-warning-outline"
            ></span>
            {title}
          </span>
        ),
        content: () => (
          <div style="font-size:12px">{typeof tip === "function" ? tip() : tip}</div>
        ),
      }}
    </el-tooltip>
  );
};

/** 与「是否显示」一致：0/1 绑定行字段 */
const renderBoolCheckboxCell = (field) => {
  return (h, { row, column, index }) => {
    return (
      <el-checkbox true-value={1} false-value={0} v-model={row[field]}></el-checkbox>
    );
  };
};

export const tableOptions = () => {
  return {
    form: {
      fields: {
        table_Id: "",
        parentId: [],
        namespace: "",
        columnCNName: "",
        tableName: "",
        tableTrueName: "",
        folderName: "",
        detailCnName: "",
        detailName: "",
        expressField: "",
        sortName: "",
        richtitle: "",
        uploadField: "",
        uploadMaxCount: "",
        enable: 0,
        vuePath: "",
        appPath: "",
        dbServer: "",
        editType: null, //编辑模式
        userPermissionDesc: "",
        mainKeyField: "",
        dbSql: null,
        dyPage: 0,
        fixedSearch: 0,
        asyncApi: 0,
        showDetail: 0,
        quickQueryFields: []
      },
      /** 新建弹窗专用表单数据（与 addOptions 字段一一对应，勿与主表单 fields 混用） */
      addFields: {
        parentId: [],
        namespace: "",
        columnCNName: "",
        tableName: "",
        tableTrueName: "",
        folderName: "",
        dbServer: "",
      },
      addOptions: [
        [
          {
            title: "父级ID",
            field: "parentId",
            required: true,
            changeOnSelect: true,
            dataKey: "",
            data: [],
            orginData: [],
            type: "cascader",
            labelRender: (h, { }) => {
              return (
                <div>
                  <el-tooltip placement="top-start" title="" trigger="hover">
                    {{
                      default: () => {
                        return (
                          <span>
                            父级ID
                            <i
                              style="font-size:12px;margin-left:3px;color:#0076d4"
                              class="el-icon-warning-outline"
                            ></i>
                          </span>
                        );
                      },
                      content: () => {
                        return (
                          <div>
                            放在左边树形结构的文件夹ID下,如果填入【0】就是一级目录
                          </div>
                        );
                      },
                    }}
                  </el-tooltip>
                </div>
              );
            },
          },
        ],
        [
          {
            title: "项目类库",
            field: "namespace",
            type: "select",
            required: true,
            data: [],
            labelRender: (h, { }) => {
              return (
                <div>
                  <el-tooltip placement="top-start" title="" trigger="hover">
                    {{
                      default: () => {
                        return (
                          <span>
                            项目类库
                            <i
                              style="font-size:12px;margin-left:3px;color:#0076d4"
                              class="el-icon-warning-outline"
                            ></i>
                          </span>
                        );
                      },
                      content: () => {
                        return (
                          <div>
                            代码生成后的所在类库(可以自己提前在后台项目中创建一个.netcore类库)
                          </div>
                        );
                      },
                    }}
                  </el-tooltip>
                </div>
              );
            },
          },
        ],
        [
          {
            title: "表中文名",
            field: "columnCNName",
            required: true,
            placeholder: "表对应的中文名字",
          },
        ],
        [
          {
            title: "实际表名",
            field: "tableName",
            required: true,
            placeholder: "数据表/视图名",
            labelRender: (h, { }) => {
              return (
                <div>
                  <el-tooltip placement="top-start" title="" trigger="hover">
                    {{
                      default: () => {
                        return (
                          <span>
                            实际表名
                            <i
                              style="font-size:12px;margin-left:3px;color:#0076d4"
                              class="el-icon-warning-outline"
                            ></i>
                          </span>
                        );
                      },
                      content: () => {
                        return (
                          <div>
                            数据库实际表名或者视图名;如果只是创建目录，表名写一个不存在的名字并且没有填过这个名字
                          </div>
                        );
                      },
                    }}
                  </el-tooltip>
                </div>
              );
            },
          },
        ],
        [
          {
            title: "文件夹名",
            field: "folderName",
            required: true,
            labelRender: (h, { }) => {
              return (
                <div>
                  <el-tooltip placement="top-start" title="" trigger="hover">
                    {{
                      default: () => {
                        return (
                          <span>
                            文件夹名
                            <i
                              style="font-size:12px;margin-left:3px;color:#0076d4"
                              class="el-icon-warning-outline"
                            ></i>
                          </span>
                        );
                      },
                      content: () => {
                        return (
                          <div>
                            生成文件所在类库中的文件夹名(文件夹可以不存在);注意只需要填写文件夹名，不是路径
                          </div>
                        );
                      },
                    }}
                  </el-tooltip>
                </div>
              );
            },
          },
        ]
      ],
      options: [
        [
          //      {
          //   title: "主 键 ID",
          //   field: "table_Id",
          //   dataSource: [],
          //   readonly: true,
          //   disabled: true,
          //   columnType: "int",
          // },
          {
            title: "父级ID",
            field: "parentId",
            changeOnSelect: true,
            required: true,
            dataKey: "",
            data: [],
            orginData: [],
            type: "cascader",
          },
          {
            title: "项目类库",
            placeholder: "代码生成存放的位置",
            field: "namespace",
            type: "select",
            required: true,
            data: [],
            //  colSize: 6,
          },
          {
            title: "表中文名",
            field: "columnCNName",
            dataSource: [],
            required: true,
          },
          {
            title: "表别名",
            placeholder: "默认与实际表名相同",
            field: "tableName",
            required: true,
            v3: true,
          },
          { title: "实际表名", field: "tableTrueName", required: true },
          {
            title: "文件夹名",
            //placeholder: "生成文件所在类库中的文件夹名(文件夹可以不存在)",
            field: "folderName",
            required: true,
            v3: true
          }
        ],
        [
          {
            title: "明细表中文名",
            field: "detailCnName",
            readonly: true,
            placeholder: "明细表中文名",
          },
          {
            title: "明细表",
            field: "detailName",
            readonly: true,
            placeholder: "明细表表名",
          },

          {
            title: "显示明细表",
            field: "showDetail",
            type: "select",
            dataKey: "enable",
            data: [{ key: 1, value: "是" }, { key: 0, value: "否" }],
            placeholder: "显示明细表",
            // colSize: 4,
            v3: true,
            labelRender: (h, { }) => {
              return (
                <el-tooltip effect="dark" placement="top-start">
                  {{
                    default: () => {
                      return (
                        <span class="el-icon-warning-outline" style={{ color: '#0247de', fontSize: 13, 'margin-top': '3px', 'margin-bottom': '5px' }}>
                          <span style={{ marginLeft: '3px' }}>显示明细表</span>
                        </span>
                      );
                    },
                    content: () => { return (<div style="font-size:12px">生成的列表页面同时显示明细表数据</div>); },
                  }}
                </el-tooltip>
              )
            },
          },
          {
            title: "显示所有查询条件",
            field: "fixedSearch",
            type: "select",
            dataKey: "enable",
            data: [{ key: 1, value: "是" }, { key: 0, value: "否" }],
            placeholder: "显示明细表",
            v3: true,
            labelRender: (h, { }) => {
              return (
                <el-tooltip effect="dark" placement="top-start">
                  {{
                    default: () => {
                      return (
                        <span class="el-icon-warning-outline" style={{ color: '#0247de', fontSize: 13, 'margin-top': '3px', 'margin-bottom': '5px' }}>
                          <span style={{ marginLeft: '3px' }}>显示所有查询条件</span>
                        </span>
                      );
                    },
                    content: () => { return (<div style="font-size:12px">生成的列表页面显示配置的所有查询字段信息(默认点高级查询才会显示)</div>); },
                  }}
                </el-tooltip>
              )
            },
          },
          {
            title: "异步接口",
            field: "asyncApi",
            type: "select",
            dataKey: "enable",
            data: [{ key: 1, value: "是" }, { key: 0, value: "否" }],
            placeholder: "异步接口",
            v3: true,

            labelRender: (h, { }) => {
              return (
                <el-tooltip effect="dark" placement="top-start">
                  {{
                    default: () => {
                      return (
                        <span class="el-icon-warning-outline" style={{ color: '#0247de', fontSize: 13, 'margin-top': '3px', 'margin-bottom': '5px' }}>
                          <span style={{ marginLeft: '3px' }}>异步接口</span>
                        </span>
                      );
                    },
                    content: () => { return (<div style="font-size:12px">设置生成页面所有的操作执行异步接口：http://doc.volcore.xyz/docs/cs/service/search.html</div>); },
                  }}
                </el-tooltip>
              )
            },
          },


          {
            title: "快捷查询",
            field: "quickQueryFields",
            labelRender: (h, { }) => {
              return (
                <div style={{ display: "flex", alignItems: "center", flexWrap: "wrap", gap: "4px" }}>
                  <el-tooltip effect="dark" placement="top-start">
                    {{
                      default: () => {
                        return (
                          <span style={{ display: "inline-flex", alignItems: "center" }}>
                            <span class="el-icon-warning-outline" style={{ color: '#0247de', fontSize: 13 }}></span>
                            <span style={{ marginLeft: '3px' }}>快捷查询</span>
                          </span>
                        );
                      },
                      content: () => { return (<div style="font-size:12px">设置查询界面同时显示多个查询字段（选项来自下方表结构中「查询行」大于 0 的字段）</div>); },
                    }}
                  </el-tooltip>
                  <el-button link
                    onClick={(e) => {
                      e?.stopPropagation?.();
                      builderFormCallbacks.refreshQuickQueryFields?.(1);
                    }}>   <i style="color:#0247de" class="el-icon-refresh"></i></el-button>

                </div>
              )
            },
            type: "selectList",
            placeholder: "",
            dataKey: "",
            data: [],
            // colSize: 4,
            // v3: true
          },
          // showDetail: 0,

        ],
        [

          {
            title: "与主表关联字段",
            field: "mainKeyField",
            type: "select",
            data: [],
            colSize: 16.6666,
            placeholder: "请选择与主表关联字段",
            // v3: true,
            labelRender: (h, { }) => {
              return (
                <el-tooltip effect="dark" placement="top-start">
                  {{
                    default: () => {
                      return (
                        <span
                        > 与主表关联字段<span class="el-icon-warning-outline"></span></span>
                      );
                    },
                    content: () => {
                      return (<div><div style="font-size:12px">1.如果当前是明细表,请选择与主表关联的字段(这个字段应该是主表的主表字段)</div>
                        <div style="font-size:14px;font-weight:700;">2.选择字段后切换到主表配置,主表必须点生成model(无代码开发模式不用点生成model)</div></div>);
                    },
                  }}
                </el-tooltip>
              )
            }
          },
          {
            title: "快捷编辑字段",
            field: "expressField",
            type: "select",
            data: [],
            colSize: 16.6666,
            placeholder: "快捷编辑字段",
            labelRender: (h, { }) => {
              return (
                <el-tooltip effect="dark" placement="top-start">
                  {{
                    default: () => {
                      return (
                        <span>
                          快捷编辑字段<span class="el-icon-warning-outline"></span>
                        </span>
                      );
                    },
                    content: () => {
                      return (<div style="font-size:12px">
                        生成的表格页面点击此字段弹出框编辑(与编辑按钮功能相同)
                      </div>);
                    },
                  }}
                </el-tooltip>
              )
            }
          },
          {
            title: "排序字段",
            field: "sortName",
            type: "text",
            readonly: true,
            placeholder: "",
            colSize: 16.6666,
          },
          {
            title: "Vue路径",
            field: "vuePath",
            type: "text",
            placeholder: "路径：E:/app/src/views",
            colSize: 24.8666,
            v3: true
          },
          {
            title: "app路径",
            field: "appPath",
            type: "text",
            placeholder: "路径：E:/uniapp/pages",
            colSize: 24.8666,
            v3: true
          }],
      ],
    },
    columns: [
      {
        field: "coderRowIndex",
        title: "行号",
        fixed: true,
        width: 50,
        align: "center",
        formatter: (row) => {
          return row.elementIndex + 1;
        },
      },
      {
        field: "columnCnName",
        title: "名称",
        fixed: true,
        width: 90,
        align: "left",
        edit: { type: "text" },
      },
      {
        field: "columnName",
        title: "字段",
        fixed: true,
        width: 90,
        align: "left",
        edit: { type: "text" },
      },
      {
        field: "isKey",
        title: "主键",
        width: 80,
        align: "center",
        renderHeader: renderColumnHeaderTip("主键", "勾选设置主键，每张表只能有一个主键"),
        render: renderBoolCheckboxCell("isKey"),
      },
      {
        field: "isDisplay",
        title: "是否显示",
        width: 85,
        align: "center",
        renderHeader: renderColumnHeaderTip("是否显示", "控制表格上的字段隐藏、显示"),
        render: renderBoolCheckboxCell("isDisplay"),
      },
      {
        field: "isImage",
        title: "显示类型",
        hidden: false,
        width: 90,
        align: "left",
        edit: { type: "select" },
        bind: { data: columnType },
        renderHeader: renderColumnHeaderTip(
          "显示类型",
          "表格字段显示类型：如果编辑类型是上传的图片或者文件、日期,请同时选择显示类型"
        ),
      },
      {
        field: "columnWidth",
        title: "列宽度",
        width: 90,
        align: "left",
        edit: { type: "text" },
        min: 0,
        max: 9999,
        renderHeader: renderColumnHeaderTip("列宽度", "表格字段的显示宽度"),
      },
      {
        field: "orderNo",
        title: "显示顺序",
        width: 90,
        align: "left",
        edit: { type: "text" },
        renderHeader: renderColumnHeaderTip("列显示顺序", "表格字段的显示顺序，数值越大越靠前(可拖动行调整显示顺序)"),
      },
      {
        title: "表头排序",
        field: "sortable",
        width: 90,
        align: "center",
        renderHeader: renderColumnHeaderTip("表头排序", "字段在表格上显示排序图标，可切换排序"),
        render: renderBoolCheckboxCell("sortable"),
      },
      {
        field: "maxlength",
        title: "长度",
        width: 60,
        align: "left",
        renderHeader: renderColumnHeaderTip("长度", "字段最大长度限制"),
      },
      {
        field: "columnType",
        title: "数据类型",
        width: 90,
        align: "left",
        renderHeader: renderColumnHeaderTip("数据类型", "数据库字段数据类型"),
      },
      {
        field: "isNull",
        title: "可为空",
        width: 80,
        align: "center",
        renderHeader: renderColumnHeaderTip("可为空", "新建/编辑时该字段是否允许为空"),
        render: renderBoolCheckboxCell("isNull"),
      },
      {
        field: "enable",
        title: "app列",
        width: 120,
        align: "left",
        edit: { type: "select" },
        bind: {
          data: [
            { key: 1, value: "显示/查询/编辑" },
            { key: 2, value: "显示/编辑" },
            { key: 3, value: "显示/查询" },
            { key: 4, value: "显示" },
            { key: 5, value: "查询/编辑" },
            { key: 6, value: "查询" },
            { key: 7, value: "编辑" },
          ],
        },
        renderHeader: renderColumnHeaderTip(
          "app列",
          "控制移动端(app/小程序)列表的显示、查询、编辑权限"
        ),
      },
      {
        field: "searchRowNo",
        title: "查询行",
        width: 75,
        align: "left",
        min: 0,
        max: 1000,
        edit: { type: "text" },
        renderHeader: renderColumnHeaderTip("查询行", "查询表单中该字段所在行号"),
      },
      {
        field: "searchColNo",
        title: "查询列",
        width: 75,
        align: "left",
        min: 0,
        max: 1000,
        edit: { type: "text" },
        renderHeader: renderColumnHeaderTip("查询列", "查询表单中该字段所在列号"),
      },
      {
        field: "searchType",
        title: "查询类型",
        width: 85,
        align: "left",
        edit: { type: "select" },
        bind: { data: searchDataType },
        renderHeader: renderColumnHeaderTip("查询类型", "查询条件使用的表单控件类型"),
      },
      {
        title: "编辑行",
        field: "editRowNo",
        width: 75,
        align: "numberbox",
        min: 0,
        max: 1000,
        edit: { type: "text" },
        renderHeader: renderColumnHeaderTip("编辑行", "编辑表单中该字段所在行号"),
      },
      {
        field: "editColNo",
        title: "编辑列",
        width: 75,
        align: "numberbox",
        min: 0,
        max: 1000,
        edit: { type: "text" },
        renderHeader: renderColumnHeaderTip("编辑列", "编辑表单中该字段所在列号"),
      },
      {
        field: "editType",
        title: "编辑类型",
        width: 90,
        align: "left",
        edit: { type: "select" },
        bind: { data: dataType },
        renderHeader: renderColumnHeaderTip("编辑类型", "新建/编辑时该字段使用的表单控件类型"),
      },
      {
        title: "数据源",
        field: "dropNo",
        width: 80,
        align: "left",
        bind: { data: [] },
        edit: { type: "select", data: [] },
        renderHeader: renderColumnHeaderTip("数据源", "编辑表单、表格中下拉框、级联等类型绑定的数据源"),
      },
      {
        title: "编辑只读",
        field: "isReadDataset",
        width: 90,
        align: "left",
        renderHeader: renderColumnHeaderTip("编辑只读", "编辑表单中该字段是否只读"),
        edit: {
          type: "select"
        },
        bind: {
          data: [{ value: "否", key: 0 },
          { value: "是", key: 1 },
          { value: "编辑只读", key: 2 },
          { value: "新建只读", key: 3 }],
          key: ""
        },
        // render: renderBoolCheckboxCell("isReadDataset"),
      },
      {
        field: "placeholder",
        title: "占位文本",
        width: 90,
        align: "center",
        renderHeader: renderColumnHeaderTip(
          "占位文本",
          "编辑弹出框字段的占位提示文本placeholder"
        ),
      },
      // {
      //   field: 'isColumnData',
      //   title: '数据列',
      //   width: 120,
      //   align: 'left',
      //   edit: { type: 'switch', keep: true }
      // },

      {
        field: "colSize",
        title: "编辑宽度",
        width: 90,
        align: "left",
        edit: { type: "select" },
        bind: {
          data: [
            { key: 0, value: "自动宽度" },
            // { key: 2, value: "20%" },
            // { key: 3, value: "30%" },
            // { key: 4, value: "40%" },
            // { key: 6, value: "50%" },
            // { key: 8, value: "60%" },
            // { key: 10, value: "80%" },
            // { key: 12, value: "100%" },
            { key: 20, value: "20%" },
            { key: 33, value: "30%" },
            { key: 40, value: "40%" },
            { key: 50, value: "50%" },
            { key: 60, value: "60%" },
            { key: 80, value: "80%" },
            { key: 100, value: "100%" },
          ],
        },
        renderHeader: renderColumnHeaderTip("编辑宽度", "编辑表单中字段占用宽度百分比"),
      },
      {
        field: "headerFilter",
        title: "表头筛选",
        width: 90,
        align: "center",
        renderHeader: renderColumnHeaderTip("表头筛选", "字段在表头上开启筛选功能"),
        render: renderBoolCheckboxCell("headerFilter"),
      },
      {
        field: "summaryType",
        title: "合计类型",
        width: 90,
        align: "center",
        edit: { type: "select", keep: false },
        bind: {
          data: [
            { key: "", value: "无" },
            { key: "sum", value: "合计(sum)" },
            { key: "avg", value: "平均(avg)" },
            // { key: "count", value: "计数(count)" },
            // { key: "min", value: "最小(min)" },
            // { key: "max", value: "最大(max)" },
          ],
        },
        renderHeader: renderColumnHeaderTip("合计类型", "表格中显示字段的合计信息"),
      },
      {
        field: "isUnique",
        title: "字段唯一",
        width: 90,
        align: "center",
        renderHeader: renderColumnHeaderTip("字段唯一", "新建/编辑时校验该字段值在表内唯一"),
        render: renderBoolCheckboxCell("isUnique"),
      },
      {
        field: "textAlign",
        title: "表格对齐",
        width: 90,
        align: "center",
        edit: { type: "select", keep: false },
        bind: {
          data: [
            { key: "", value: "默认" },
            { key: "left", value: "左对齐" },
            { key: "center", value: "居中" },
            { key: "right", value: "右对齐" },
          ],
        },
        renderHeader: renderColumnHeaderTip("表格对齐", "字段在表格中显示的对齐方式"),
      },
      {
        field: "showOverflowTooltip",
        title: "超出提示",
        width: 90,
        align: "center",
        renderHeader: renderColumnHeaderTip(
          "超出提示",
          "字段在表格内容超长时，鼠标放上去以提示信息显示"
        ),
        render: renderBoolCheckboxCell("showOverflowTooltip"),
      },
      {
        field: "fixedColumn",
        title: "固定字段",
        width: 90,
        align: "center",
        edit: { type: "select", keep: false },
        bind: {
          data: [
            { key: "", value: "不固定" },
            { key: "left", value: "左侧" },
            { key: "right", value: "右侧" },
          ],
        },
        renderHeader: renderColumnHeaderTip(
          "固定字段",
          "表字段过多时，设置字段固定显示在最左边还是右边"
        ),
      },
      // {
      //   field: "calcColumn",
      //   title: "列计算",
      //   width: 90,
      //   align: "left",
      //   renderHeader: renderColumnHeaderTip("列计算",
      //     '多个字段计算结果，如：明细表输入：单价*数量=总价，这个字段就是总价的结果,可参照前端开发文档上的明细表实时计算示例'
      //   )
      // }
    ]
  };
}

