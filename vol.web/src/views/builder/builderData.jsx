let columnType = [
  { key: 1, value: 'img' },
  { key: 2, value: 'excel' },
  { key: 3, value: 'file' },
  { key: 6, value: 'year(年)' },
  { key: 4, value: 'date(年月日)' },
  { key: 5, value: 'month(年月)' }
]

let dataType = [
  { key: 'text', value: 'input' },
  { key: 'textarea', value: 'textarea' },
  { key: 'switch', value: 'switch' },
  { key: 'select', value: 'select' },
  { key: 'selectList', value: 'select多选' },
  { key: 'year', value: '年' },
  { key: 'date', value: 'date(年月日)' },
  { key: 'datetime', value: 'datetime(年月日时分秒)' },
  { key: 'month', value: '年月' },
  { key: 'time', value: 'time' },
  { key: 'password', value: '密码输入框' },
  { key: 'checkbox', value: 'checkbox多选' },
  { key: 'radio', value: 'radio单选' },
  { key: 'cascader', value: '级联' },
  { key: 'treeSelect', value: '树形下拉框(多选)treeSelect' },
  { key: 'editor', value: '富文本编辑器' },
  { key: 'mail', value: 'mail' },
  { key: 'number', value: 'number' },
  { key: 'decimal', value: 'decimal' },
  { key: 'phone', value: 'phone' },
  { key: 'color', value: '颜色选择器' },
  { key: 'img', value: 'img' },
  { key: 'excel', value: 'excel' },
  { key: 'file', value: 'file' },
  { key: 'rate', value: '评分' }
]

let searchDataType = [
  { key: '=', value: '等于' },
  { key: '!=', value: '不等于' },
  { key: 'like', value: '%模糊查询%' },
  { key: 'likeStart', value: '模糊查询%' },
  { key: 'likeEnd', value: '%模糊查询' },
  { key: 'textarea', value: 'textarea' },
  { key: 'switch', value: 'switch' },
  { key: 'select', value: 'select' },
  { key: 'selectList', value: 'select多选' },
  { key: 'year', value: '年' },
  { key: 'date', value: 'date(年月日)' },
  { key: 'datetime', value: 'datetime(年月日时分秒)' },
  { key: 'month', value: 'year_month' },
  { key: 'time', value: 'time' },
  { key: 'cascader', value: '级联' },
  { key: 'treeSelect', value: '树形级联tree-select' },
  { key: 'checkbox', value: 'checkbox' },
  { key: 'radio', value: 'radio' },
  { key: 'range', value: '区间查询' },
  { key: 'mail', value: 'mail' },
  { key: 'number', value: 'number' },
  { key: 'decimal', value: 'decimal' }
  // { key: 'phone', value: 'phone' }
]

let data = {
  form: {
    fields: {
      table_Id: '',
      parentId: null,
      namespace: '',
      columnCNName: '',
      tableName: '',
      tableTrueName: '',
      folderName: '',
      detailCnName: '',
      detailName: '',
      expressField: '',
      sortName: '',
      richtitle: '',
      uploadField: '',
      uploadMaxCount: '',
      enable: 0,
      vuePath: '',
      appPath: '',
      userPermissionDesc: ''
    },
    addOptions: [
      [
        {
          title: '父 级 ID',
          min: 0,
          field: 'parentId',
          required: true,
          type: 'number',
          placeholder: '放在【代码生成配置】列表的文件夹ID下,如果填入【0】就是一级目录'
        }
      ],
      [
        {
          title: '项目类库',
          field: 'namespace',
          placeholder: '代码生成后的所在类库(可以自己提前在后台项目中创建一个.netcore类库)',
          type: 'select',
          required: true,
          data: []
        }
      ],
      [
        {
          title: '表中文名',
          field: 'columnCNName',
          required: true,
          placeholder: '表对应的中文名字,界面上显示会用到'
        }
      ],
      [
        {
          title: '实际表名',
          field: 'tableName',
          required: true,
          placeholder: '数据库实际表名或者视图名(多表关联请创建视图再生成代码)',
          labelRender: (h, {}) => {
            return (
              <div>
                <el-tooltip placement="top-start" title="" trigger="hover">
                  {{
                    default: () => {
                      return (
                        <span>
                          实际表名
                          <i
                            style="font-size:12px;margin-left:3px"
                            class="el-icon-warning-outline"
                          ></i>
                        </span>
                      )
                    },
                    content: () => {
                      return (
                        <div>
                          数据库实际表名或者视图名(多表关联请创建视图再生成代码);如果只是创建目录，表名写一个不存在的名字并且没有填过这个名字
                        </div>
                      )
                    }
                  }}
                </el-tooltip>
              </div>
            )
          }
        }
      ],
      [
        {
          title: '文件夹名',
          placeholder:
            '生成文件所在类库中的文件夹名(文件夹可以不存在);注意只需要填写文件夹名，不是路径',
          field: 'folderName',
          required: true,
          labelRender: (h, {}) => {
            return (
              <div>
                <el-tooltip placement="top-start" title="" trigger="hover">
                  {{
                    default: () => {
                      return (
                        <span>
                          文件夹名
                          <i
                            style="font-size:12px;margin-left:3px"
                            class="el-icon-warning-outline"
                          ></i>
                        </span>
                      )
                    },
                    content: () => {
                      return (
                        <div>
                          生成文件所在类库中的文件夹名(文件夹可以不存在);注意只需要填写文件夹名，不是路径
                        </div>
                      )
                    }
                  }}
                </el-tooltip>
              </div>
            )
          }
        }
      ]
    ],
    options: [
      [
        {
          title: '主 键 ID',
          field: 'table_Id',
          dataSource: [],
          readonly: true,
          disabled: true,
          columnType: 'int'
        },
        {
          title: '父 级 ID',
          field: 'parentId',
          min: 0,
          required: true,
          type: 'number'
        },
        {
          title: '项目类库',
          placeholder: '代码生成存放的位置',
          field: 'namespace',
          type: 'select',
          required: true,
          data: [],
          colSize: 6
        }
      ],
      [
        {
          title: '表中文名',
          field: 'columnCNName',
          dataSource: [],
          required: true
        },
        {
          title: '表 别 名',
          placeholder: '默认与实际表名相同',
          field: 'tableName',
          required: true
        },
        { title: '实际表名', field: 'tableTrueName' },
        {
          title: '文件夹名',
          placeholder: '生成文件所在类库中的文件夹名(文件夹可以不存在)',
          field: 'folderName',
          required: true
        }
      ],
      [
        {
          title: '明细中文名',
          field: 'detailCnName',
          placeholder: '明细表中文名字'
        },
        { title: '明细表名', field: 'detailName', placeholder: '数据库表名' },
        {
          title: '快捷编辑',
          field: 'expressField',
          placeholder: '快捷编辑字段',
          labelRender: (h, {}) => {
            return (
              <div>
                <el-tooltip placement="top-start" title="" trigger="hover">
                  {{
                    default: () => {
                      return (
                        <span>
                          快捷编辑
                          <i
                            style="font-size:12px;margin-left:3px"
                            class="el-icon-warning-outline"
                          ></i>
                        </span>
                      )
                    },
                    content: () => {
                      return <div>生成的表格数据，点击此字段可进行编辑</div>
                    }
                  }}
                </el-tooltip>
              </div>
            )
          }
        },
        {
          title: '排序字段',
          field: 'sortName',
          placeholder: '多个排序字段逗号隔开(默认降序排序),如：Name,Age'
        }
      ],

      [
        {
          title: 'Vue路径',
          field: 'vuePath',
          type: 'text',
          placeholder: '路径：E:/app/src/views',
          colSize: 6,
          labelRender: (h, {}) => {
            return (
              <div>
                <el-tooltip placement="top-start" title="" width="600" trigger="hover">
                  {{
                    default: () => {
                      return (
                        <span>
                          Vue路径
                          <i
                            style="font-size:12px;margin-left:3px"
                            class="el-icon-warning-outline"
                          ></i>
                        </span>
                      )
                    },
                    content: () => {
                      return (
                        <div>
                          生成前端文件所有在绝对路径：E:/xxxx/vol.web/src/views(注意是到前端项目的views目录)
                        </div>
                      )
                    }
                  }}
                </el-tooltip>
              </div>
            )
          }
        },
        {
          title: 'app路径',
          field: 'appPath',
          type: 'text',
          placeholder: '路径：E:/uniapp/pages',
          colSize: 6,
          labelRender: (h, {}) => {
            return (
              <div>
                <el-tooltip placement="top-start" title="" width="600" trigger="hover">
                  {{
                    default: () => {
                      return (
                        <span>
                          app路径
                          <i
                            style="font-size:12px;margin-left:3px"
                            class="el-icon-warning-outline"
                          ></i>
                        </span>
                      )
                    },
                    content: () => {
                      return (
                        <div>
                          生成app文件所有在绝对路径：E:/xxxx/vol.app.next/pages(注意是到前端项目的pages目录)
                        </div>
                      )
                    }
                  }}
                </el-tooltip>
              </div>
            )
          }
        }
      ]
    ]
  },
  columns: [
    {
      field: 'columnId',
      title: 'ColumnId',
      width: 120,
      align: 'left',
      edit: { type: 'text' },
      hidden: true
    },
    {
      field: 'table_Id',
      title: 'Table_Id',
      width: 120,
      align: 'left',
      editor: 'text',
      hidden: true
    },
    {
      field: 'columnCnName',
      title: '列显示名称',
      fixed: true,
      width: 120,
      align: 'left',
      edit: { type: 'text' }
    },
    {
      field: 'columnName',
      title: '列名',
      fixed: true,
      width: 120,
      align: 'left',
      edit: { type: 'text' }
    },
    {
      field: 'isKey',
      title: '主键',
      width: 90,
      align: 'left',
      edit: { type: 'switch' }
    },
    {
      field: 'sortable',
      title: '是否排序',
      width: 90,
      align: 'left',
      edit: { type: 'switch', keep: true }
    },
    {
      field: 'enable',
      title: 'app列',
      width: 140,
      align: 'left',
      edit: { type: 'select' },
      bind: {
        data: [
          { key: 1, value: '显示/查询/编辑' },
          { key: 2, value: '显示/编辑' },
          { key: 3, value: '显示/查询' },
          { key: 4, value: '显示' },
          { key: 5, value: '查询/编辑' },
          { key: 6, value: '查询' },
          { key: 7, value: '编辑' }
        ]
      }
    },
    {
      field: 'searchRowNo',
      title: '查询行',
      width: 90,
      align: 'left',
      edit: { type: 'text' },
      renderHeader: (h, {}) => {
        return (
          <div>
            <el-tooltip placement="top-start" title="" trigger="hover">
              {{
                default: () => {
                  return (
                    <span>
                      查询行
                      <i style="font-size:12px;margin-left:3px" class="el-icon-warning-outline"></i>
                    </span>
                  )
                },
                content: () => {
                  return (
                    <div>查询表单的所在第几行，只能输入数字，数字任意，相同的值会显示在一行</div>
                  )
                }
              }}
            </el-tooltip>
          </div>
        )
      }
    },
    {
      field: 'searchColNo',
      title: '查询列',
      width: 90,
      align: 'left',
      edit: { type: 'text' },
      renderHeader: (h, {}) => {
        return (
          <div>
            <el-tooltip placement="top-start" title="" trigger="hover">
              {{
                default: () => {
                  return (
                    <span>
                      查询列
                      <i style="font-size:12px;margin-left:3px" class="el-icon-warning-outline"></i>
                    </span>
                  )
                },
                content: () => {
                  return <div>查询表单的所在第几行、第几列</div>
                }
              }}
            </el-tooltip>
          </div>
        )
      }
    },
    {
      field: 'searchType',
      title: '查询类型',
      width: 150,
      align: 'left',
      edit: { type: 'select' },
      bind: { data: searchDataType }
    },
    {
      field: 'editRowNo',
      title: '编辑行',
      width: 90,
      align: 'numberbox',
      edit: { type: 'text' },
      renderHeader: (h, {}) => {
        return (
          <div>
            <el-tooltip placement="top-start" title="" trigger="hover">
              {{
                default: () => {
                  return (
                    <span>
                      编辑行
                      <i style="font-size:12px;margin-left:3px" class="el-icon-warning-outline"></i>
                    </span>
                  )
                },
                content: () => {
                  return (
                    <div>
                      弹出框表单字段所在第几行，只能输入数字，数字任意，相同的值会显示在一行(注意值需要大于>0才会在编辑表单显示，如果字典不需要编辑请设置为0)
                    </div>
                  )
                }
              }}
            </el-tooltip>
          </div>
        )
      }
    },
    {
      field: 'editColNo',
      title: '编辑列',
      width: 90,
      align: 'numberbox',
      edit: { type: 'text' },
      renderHeader: (h, {}) => {
        return (
          <div>
            <el-tooltip placement="top-start" title="" trigger="hover">
              {{
                default: () => {
                  return (
                    <span>
                      编辑列
                      <i style="font-size:12px;margin-left:3px" class="el-icon-warning-outline"></i>
                    </span>
                  )
                },
                content: () => {
                  return <div>弹出框编辑表单的所在第几行、第几列</div>
                }
              }}
            </el-tooltip>
          </div>
        )
      }
    },
    {
      field: 'editType',
      title: '编辑类型',
      width: 150,
      align: 'left',
      edit: { type: 'select' },
      bind: { data: dataType }
    },
    {
      field: 'dropNo',
      title: '数据源',
      width: 120,
      align: 'left',
      bind: { data: [] },
      edit: { type: 'select', data: [] },
      renderHeader: (h, {}) => {
        return (
          <div>
            <el-tooltip placement="top-start" title="" trigger="hover">
              {{
                default: () => {
                  return (
                    <span>
                      数据源
                      <i style="font-size:12px;margin-left:3px" class="el-icon-warning-outline"></i>
                    </span>
                  )
                },
                content: () => {
                  return <div>请先在数据字典维护数据源，然后刷新页面</div>
                }
              }}
            </el-tooltip>
          </div>
        )
      }
    },
    {
      field: 'isImage',
      title: 'table列显示类型',
      hidden: false,
      width: 130,
      align: 'left',
      edit: { type: 'select' },
      bind: { data: columnType }
    },
    {
      field: 'orderNo',
      title: '列显示顺序',
      width: 120,
      align: 'left',
      edit: { type: 'text' }
    },
    {
      field: 'maxlength',
      title: '字段最大长度',
      width: 130,
      align: 'left',
      edit: { type: 'text' }
    },
    {
      field: 'columnType',
      title: '数据类型',
      width: 120,
      align: 'left',
      edit: { type: 'text' }
    },
    {
      field: 'isNull',
      title: '可为空',
      width: 120,
      align: 'left',
      edit: { type: 'switch', keep: true }
    },
    {
      field: 'isReadDataset',
      title: '是否只读',
      width: 120,
      align: 'left',
      edit: { type: 'switch', keep: true }
    },
    // {
    //   field: 'isColumnData',
    //   title: '数据列',
    //   width: 120,
    //   align: 'left',
    //   edit: { type: 'switch', keep: true }
    // },
    {
      field: 'isDisplay',
      title: '是否显示',
      width: 120,
      align: 'left',
      edit: { type: 'switch', keep: true }
    },
    {
      field: 'columnWidth',
      title: 'table列宽度',
      width: 120,
      align: 'left',
      edit: { type: 'text' }
    },
    {
      field: 'colSize',
      title: '编辑字段宽度colSize',
      width: 180,
      align: 'left',
      edit: { type: 'select' },
      bind: {
        data: [
          { key: 0, value: '自动宽度' },
          { key: 2, value: '20%' },
          { key: 3, value: '30%' },
          { key: 4, value: '40%' },
          { key: 6, value: '50%' },
          { key: 8, value: '60%' },
          { key: 10, value: '80%' },
          { key: 12, value: '100%' }
        ]
      },
      renderHeader: (h, {}) => {
        return (
          <div>
            <el-tooltip placement="top-start" title="" trigger="hover">
              {{
                default: () => {
                  return (
                    <span>
                      编辑字段宽度
                      <i style="font-size:12px;margin-left:3px" class="el-icon-warning-outline"></i>
                    </span>
                  )
                },
                content: () => {
                  return (
                    <div>
                      编辑表单的宽度，也可手动设置：http://v3.volcore.xyz/docs/web/form/inputWidth.html
                    </div>
                  )
                }
              }}
            </el-tooltip>
          </div>
        )
      }
    }
    // { field: 'createDate', title: '创建时间', width: 120, align: 'left' }
  ]
}

export default data
