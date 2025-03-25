import { h, resolveComponent } from 'vue';
let extension = {
  components: {
    //动态扩充组件或组件路径
    //表单header、content、footer对应位置扩充的组件
    gridHeader: '',
    gridBody: {
      render(h) {
        return (
          <el-alert
            style={{ 'margin-bottom': '10px' }}
            type="success"
            show-icon
          >
            <p v-html="1、 onInit(){ this.setFiexdSearchForm(true){设置固定显示所有查询条件}">
            </p>
            <p v-html="2、自定义表格按钮、弹出框提示、弹出框分组信息,见示例：App_Appointment.js文件">
            </p>
            <p v-html="3、2023.08.19集成表格行、列合并功能,更新文件见:http://v2.volcore.xyz/document/log">
            </p>
          </el-alert>
        );
      }
    },
    gridFooter: '',
    //弹出框(修改、编辑、查看)header、content、footer对应位置扩充的组件
    modelHeader: '',
    modelBody: '',
    modelFooter: ''
  },
  buttons: [], //扩展的按钮
  tableAction: 'App_Appointment', //指定菜单权限，其他任何页面引用时都会走对应权限
  text:
    '代码生成器中设置[是否只读]或如果没有编辑或新建权限弹出框都是只读的(点击用户姓名列可查看表单分组)',
  methods: {
    btn1Click(row, $e) {
      $e.stopPropagation();
      this.edit(row);
    },
    btn2Click(row, $e) {
      $e.stopPropagation();
      this.$message.success('点击了按钮');
    },
    dropdownClick(value, row, column) {
      console.log(row);
      this.$message.success(value);
    },
    //事件扩展
    onInit() {
      this.buttons.push({
        name: '查看代码',
        onClick: () => {
          window.open('http://api.volcore.xyz/vol.doc/appointment.html', 'blank');
        }
      });

      //设置显示所有查询条件
      this.setFiexdSearchForm(true);

      //表格上添加自定义按钮
      this.columns.push({
        title: '操作',
        field: '操作',
        width: 150,
        align: 'left',// 'center',
        render: (h, { row, column, index }) => {
          return (
            <div>
              <el-button
                onClick={($e) => {
                  this.btn1Click(row, $e);
                }}
                type="primary"
                plain
                style="height:26px; padding: 10px !important;"
              >
                查看
              </el-button>

              {/* 通过条件判断,要显示的按钮 */}
              {
                /*  {
                      index % 2 === 1 
                      ?<el-button>修改</el-button>
                      : <el-button>设置</el-button>
                  } */
              }


              {/* 通过v-show控制按钮隐藏与显示
                  下面的index % 2 === 1换成：row.字段==值 */
              }
              <el-button
                onClick={($e) => {
                  this.btn2Click(row, $e);
                }}
                v-show={index % 2 === 1}
                type="success"
                plain
                style="height:26px;padding: 10px !important;"
              >
                修改
              </el-button>

              <el-button
                onClick={($e) => {
                  this.btn2Click(row, $e);
                }}
                v-show={index % 2 === 0}
                type="warning"
                plain
                style="height:26px;padding: 10px !important;"
              >
                设置
              </el-button>

              <el-dropdown
                onClick={(value) => {
                  this.dropdownClick(value);
                }}
                trigger="click"
                v-slots={{
                  dropdown: () => (
                    <el-dropdown-menu>
                      <el-dropdown-item>
                        <div
                          onClick={() => {
                            this.dropdownClick('京酱肉丝', row, column);
                          }}
                        >
                          京酱肉丝
                        </div>
                      </el-dropdown-item>
                      <el-dropdown-item>
                        <div
                          onClick={() => {
                            this.dropdownClick('驴肉火烧', row, column);
                          }}
                        >
                          驴肉火烧
                        </div>
                      </el-dropdown-item>
                    </el-dropdown-menu>
                  )
                }}
              >
                <span
                  style="font-size: 13px;color: #409eff;margin: 5px 0 0 10px;"
                  class="el-dropdown-link"
                >
                  更多<i class="el-icon-arrow-right"></i>
                </span>
              </el-dropdown>
            </div>
          );
        }
      });

      //表格显示Tooltip提示
      this.columns.forEach((col) => {
        if (col.field == 'Describe') {
          col.title = '单元格Tooltip(鼠标放上来看效果)';
          col.showOverflowTooltip = true;
          //或者用下面这的个方法自定义提示
          // col.render = (h, { row, column, index }) => {
          //   return (
          //     <el-popover
          //       placement="top-start"
          //       title="提示信息"
          //       width={350}
          //       trigger="hover"
          //       content={
          //         row.Describe +
          //         ',这里是用render渲染的表格提示,示例见:App_Appointment.js'
          //       }
          //     >
          //       {{ reference: <span>{row.Describe}</span> }}
          //     </el-popover>
          //   );
          // };
        }
      });

      //增加弹出框提示信息
      //https://cn.vuejs.org/guide/extras/render-function.html#passing-slots
      //自定义提示
      this.editFormOptions[0][0].extra = {
        render: (h) => {
          return (
            <el-popover
              placement="top-start"
              title="Title"
              width="200"
              trigger="hover"
              content="this is content, this is content, this is content"
            >
              {/* 这里对应下面的#reference数据槽 */}
              {{ reference: <i class="el-icon-warning-outline"></i> }}
            </el-popover>
          );
        }
      };

      //   <el-popover
      //   placement="top-start"
      //   title="Title"
      //   :width="200"
      //   trigger="hover"
      //   content="this is content, this is content, this is content"
      // >
      //   <template #reference>
      //     <el-button>Hover to activate</el-button>
      //   </template>
      // </el-popover>

      //格式化单格颜色
      this.columns.forEach((x) => {
        if (x.field == 'PhoneNo') {
          x.title='设置背景颜色'
          x.cellStyle = (row, rowIndex, columnIndex) => {
            if (row.PhoneNo == '138888887698') { //&& rowIndex == 0
              return { background: '#ddecfd' };
            }else  if (row.PhoneNo == '138888887692') { //&& rowIndex == 0
              return { background: '#a9d6f9' };
            }
          };
        }
        if (x.field == 'Creator') {
          x.title='合并列'
          x.cellStyle = (row, rowIndex, columnIndex) => {
            if (row.Creator == '超级管理员') {
              return { background: 'rgb(45 140 240)', color: '#ffff' };
            }
          };
        }

        //设置进度条
        //进度条组件见:https://element-plus.gitee.io/zh-CN/component/progress.html#%E8%BF%9B%E5%BA%A6%E6%9D%A1%E5%86%85%E6%98%BE%E7%A4%BA%E7%99%BE%E5%88%86%E6%AF%94%E6%A0%87%E8%AF%86
        if (x.field == 'CreateDate') {
          x.title = '进度条'
          x.render = (h, { row, column, index }) => {
            if (index % 2 === 1) {
              //90改为row.字段
              return <el-progress stroke-width={4} percentage={90} />
            }
            //10改为row.字段
            return <el-progress stroke-width={4} color="#67c23a" show-text={true} percentage={10} />
          }
        }

        if (x.field == 'Name') {
          x.title = '点击查看(合并行)';
        }
      });

      //设置表单分组
      this.editFormOptions.splice(0, 0, [
        {
          colSize: 12,
          render: (h) => {
            return (
              <div
                style={{
                  display: 'flex',
                  'margin-bottom': '-4px',
                  'line-height': '20px',
                  'margin-top': '5px',
                  'padding-bottom': '5px',
                  'border-bottom': '1px solid rgb(238, 238, 238)'
                }}
              >
                <div style="height: 19px; background: rgb(45, 206, 217); width: 9px; border-radius: 10px;"></div>
                <div style="padding-left: 6px; font-weight: bold; font-size: 13px;">
                  基本信息
                </div>
              </div>
            );
          }
        }
      ]);

      //设置表单分组

      this.editFormOptions.splice(2, 0, [
        {
          colSize: 12,
          render: (h) => {
            return (
              <div
                style={{
                  display: 'flex',
                  'margin-bottom': '-4px',
                  'line-height': '20px',
                  'margin-top': '5px',
                  'padding-bottom': '5px',
                  'border-bottom': '1px solid rgb(238, 238, 238)'
                }}
              >
                <div style="height: 19px; background: rgb(45, 206, 217); width: 9px; border-radius: 10px;"></div>
                <div style="padding-left: 6px; font-weight: bold; font-size: 13px;">
                  基本信息
                </div>
              </div>
            );
          }
        }
      ]);

      //弹出框增加分段alert提示
      this.editFormOptions.splice(3, 0, [
        {
          colSize: 12,
          render: (h) => {
            return (
              <el-alert
                title="这里是自定的提示信息"
                style={{ padding: 0 }}
                type="success"
              ></el-alert>
            );
          }
        }
      ]);

      //查询界面按钮组
      //按钮图标这里找https://element.eleme.cn/#/zh-CN/component/icon
      //第二个按钮后面添加按钮组
      this.buttons.splice(2, 1, {
        name: '按钮组',
        type: 'primary',
        plain: true,
        color: '#009688',
        data: [
          {
            name: '按钮一',
            icon: 'el-icon-plus',
            onClick: () => {
              this.$message.info('按钮一');
            }
          },
          {
            name: '按钮二',
            icon: 'el-icon-zoom-out',
            onClick: () => {
              this.$message.info('按钮二');
            }
          }
        ]
      });
    },

    onInited() {
      //多页签菜单打开时，重新设置表格的最大高度
      if (this.$route.path == '/tabsTable') {
        this.tableMaxHeight = document.body.clientHeight - 415;
      } else {
        //设置表的最大高度
        this.tableMaxHeight = this.height - 125; //400
      }
      //移除快捷查询
      this.singleSearch = null;
    },
    spanMethod({ row, column, rowIndex, columnIndex }) { //2023.08.19增加行、列合并功能,el合并文档见https://element-plus.gitee.io/zh-CN/component/table.html#%E5%90%88%E5%B9%B6%E8%A1%8C%E6%88%96%E5%88%97
      if (rowIndex % 2 === 0) {
        if (columnIndex === 6) {
          return [1, 2]
        } 
        else if (columnIndex === 5) {
           return [0, 0]
        }
      }
      if (columnIndex === 1) {
        if (rowIndex % 2 === 0) {
          return {
            rowspan: 2,
            colspan: 1,
          }
        } else {
          return {
            rowspan: 0,
            colspan: 0,
          }
        }
      }
    }
  }
};
export default extension;
