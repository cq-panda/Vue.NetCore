import { h, resolveComponent } from 'vue';
let extension = {
  components: {
    //动态扩充组件或组件路径
    //表单header、content、footer对应位置扩充的组件
    gridHeader: '',
    gridBody: {
      render(h) {
        return <el-alert style={{ 'margin-bottom': '10px' }} type="success" show-icon>
          <p v-html="1、 onInit(){ this.setFiexdSearchForm(true){设置固定显示所有查询条件}"> </p>
          <p v-html="2、自定义表格按钮、弹出框提示、弹出框分组信息,见示例：App_Appointment.js文件"> </p>
        </el-alert>
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
      $e.stopPropagation()
      this.edit(row)
    },
    btn2Click(row, $e) {
      $e.stopPropagation()
      this.$message.success('点击了按钮')
    },
    //事件扩展
    onInit() {

      //设置显示所有查询条件
      this.setFiexdSearchForm(true);

      //表格上添加自定义按钮
      this.columns.push({
        title: "操作",
        field: "操作",
        width: 150,
        align: "center",
        render: (h, { row, column, index }) => {
          return <div >
            <el-button onClick={($e) => { this.btn1Click(row, $e) }} type="primary" plain size="small" style="padding: 10px !important;">查看</el-button>
            <el-button onClick={($e) => { this.btn2Click(row, $e) }} type="success" plain size="small" style="padding: 10px !important;">按钮</el-button>
          </div>
        }
      })

      //增加弹出框提示信息
      //https://cn.vuejs.org/guide/extras/render-function.html#passing-slots
      //自定义提示
      this.editFormOptions[0][0].extra =
      {
        render: (h) => {
          return <el-popover
            placement="top-start"
            title="Title"
            width="200"
            trigger="hover"
            content="this is content, this is content, this is content"
          >
            {/* 这里对应下面的#reference数据槽 */}
            {{ reference: <i class='el-icon-warning-outline'></i> }}
          </el-popover>
        }
      }

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
      this.columns.forEach(x => {
        if (x.field == "PhoneNo") {
          x.cellStyle = (row, rowIndex, columnIndex) => {
            if (row.PhoneNo == "138888887698" && rowIndex == 0) {
              return { background: "#ddecfd" }
            }
          }
        }
        if (x.field == "Creator") {
          x.cellStyle = (row, rowIndex, columnIndex) => {
            if (row.Creator == "超级管理员") {
              return { background: "rgb(45 140 240)", color: "#ffff" }
            }
          }
        }

        if (x.field == 'Name') {
          x.title = "点击查看表单"
        }

      })

      //设置表单分组
      this.editFormOptions.splice(0, 0, [
        {
          colSize: 12,
          render: (h) => {
            return <div style={{
              display: 'flex', 'margin-bottom': '-4px', 'line-height': '20px',
              'margin-top': '5px', 'padding-bottom': '5px', 'border-bottom': '1px solid rgb(238, 238, 238)'
            }}>
              <div style="height: 19px; background: rgb(45, 206, 217); width: 9px; border-radius: 10px;"></div>
              <div style="padding-left: 6px; font-weight: bold; font-size: 13px;">基本信息</div>
            </div>
          }
        }
      ]);

      //设置表单分组

      this.editFormOptions.splice(2, 0, [
        {
          colSize: 12,
          render: (h) => {
            return <div style={{
              display: 'flex', 'margin-bottom': '-4px', 'line-height': '20px',
              'margin-top': '5px', 'padding-bottom': '5px', 'border-bottom': '1px solid rgb(238, 238, 238)'
            }}>
              <div style="height: 19px; background: rgb(45, 206, 217); width: 9px; border-radius: 10px;"></div>
              <div style="padding-left: 6px; font-weight: bold; font-size: 13px;">基本信息</div>
            </div>
          }
        }
      ]);

      //增加分段alert提示
      this.editFormOptions.splice(3, 0, [
        {
          colSize: 12,
          render: (h) => {
            return <el-alert title="这里是自定的提示信息" style={{ padding: 0 }} type="success" >
            </el-alert>
          }
        }
      ])
    },

    onInited() {
      //多页签菜单打开时，重新设置表格的最大高度
      if (this.$route.path == '/tabsTable') {
        this.tableMaxHeight = document.body.clientHeight - 415;
      } else {
        //设置表的最大高度
        this.tableMaxHeight = this.height - 125;//400
      }
      //移除快捷查询
      this.singleSearch = null;
    }
  }
};
export default extension;
