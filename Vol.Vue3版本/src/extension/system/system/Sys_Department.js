
let extension = {
  components: {
    //查询界面扩展组件
    gridHeader: '',
    gridBody: '',
    gridFooter: '',
    //新建、编辑弹出框扩展组件
    modelHeader: '',
    modelBody: '',
    modelFooter: ''
  },
  tableAction: '', //指定某张表的权限(这里填写表名,默认不用填写)
  buttons: { view: [], box: [], detail: [] }, //扩展的按钮
  methods: {
    //下面这些方法可以保留也可以删除
    onInit() {
      this.paginationHide = true;
      this.lazy = false;
      
      //树形结点的id字段
      this.rowKey = 'DepartmentId';
      //父级id字段
      this.rowParentField = "ParentId";
      //是否展开所有节点（默认会记录展开的节点）
      //this.defaultExpandAll=true;
      
      //默认展开的节点
      // this.expandRowKeys=["id"]
    },

    /***加载后台数据见Sys_RoleController.cs文件***/
    searchBefore(params) {
      //判断加载根节点或子节点
      //没有查询条件，默认查询返回所有根节点数据
      // if (!params.wheres.length) {
      //   params.value = 1;
      // }
      return true;
    },
    onInited() {
      let hasUpdate, hasDel, hasAdd;
      this.buttons.forEach((x) => {
        if (x.value == 'Update') {
          x.hidden = true;
          hasUpdate = true;
        } else if (x.value == 'Delete') {
          hasDel = true;
          x.hidden = true; //隐藏按钮
        } else if (x.value == 'Add') {
          x.type = 'primary';
          hasAdd = true;
        }
      });
      if (!(hasUpdate || hasDel || hasAdd)) {
        return;
      }
      this.columns.push({
        title: '操作',
        field: '操作',
        width: 100,
        fixed: 'right',
        align: 'center',
        render: (h, { row, column, index }) => {
          return (
            <div>
              {hasAdd ? (
                <el-button
                  onClick={($e) => {
                    this.addBtnClick(row);
                  }}
                  type="primary"
                  link
                  icon="Plus"
                ></el-button>
              ) : (
                ''
              )}
              {hasUpdate ? (
                <el-button
                  onClick={($e) => {
                    this.edit(row);
                  }}
                  type="success"
                  link
                  icon="Edit"
                ></el-button>
              ) : (
                ''
              )}
              {hasDel ? (
                <el-button
                  link
                  onClick={($e) => {
                    this.del(row);
                  }}
                  type="danger"
                  icon="Delete"
                ></el-button>
              ) : (
                ''
              )}
            </div>
          );
        }
      });
    },
    addBtnClick(row) {
      //这里是动态addCurrnetRow属性记录当前点击的行数据,下面modelOpenAfter设置默认值
      this.addCurrnetRow = row;
      this.add();
    },
    addAfter() {
      //添加后刷新字典
      this.initDicKeys();
      return true;
    },
    updateAfter() {
      this.initDicKeys();
      return true;
    },
    delAfter(result) {
      //查询界面的表删除后
      this.initDicKeys();
      return true;
    },
    modelOpenAfter(row) {
      //点击行上的添加按钮事件
      if (this.addCurrnetRow) {
        //获取当前组织构架的所有父级id,用于设置新建时父级id的默认值

        //获取数据数据源
        let data = [];
        this.editFormOptions.forEach((options) => {
          options.forEach((option) => {
            if (option.field == 'ParentId') {
              data = option.orginData;
            }
          });
        });
        let parentIds = this.base
          .getTreeAllParent(this.addCurrnetRow.DepartmentId, data)
          .map((x) => {
            return x.id;
          });
        //设置编辑表单上级组织的默认值
        this.editFormFields.ParentId = parentIds;
        this.addCurrnetRow = null;
      }
    }
  }
};
export default extension;
