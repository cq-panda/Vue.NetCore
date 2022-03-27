let extension = {
  components: {//动态扩充组件或组件路径
    //表单header、content、footer对应位置扩充的组件
    gridHeader: '',//{ template: "<div>扩展组xx件</div>" },
    gridBody: '',
    gridFooter: '',
    //弹出框(修改、编辑、查看)header、content、footer对应位置扩充的组件
    modelHeader: '',
    modelBody: '',
    modelFooter: ''
  },
  text: "点击行或者点击表格的编辑即可开启编辑功能",
  tableAction: 'App_Transaction',
  buttons: [],//扩展的按钮
  methods: {//事件扩展
    onInit() {//手动设置弹出框的高度与宽度
      //判断有没有App_Transaction表修改的权限 ，无权限不开启编辑功能
      if (!this.filterPermission('App_Transaction', 'Update')) {
        return;
      }
      //开启编辑功能
      this.doubleEdit = true;
      //开启指定列可以编辑
      //**注意，开启字段的编辑信息，如果调用框架的保存方法，代码生成器中必须设置了编辑行并生成了model否则验证通不过
      this.columns.forEach(column => {
        if (column.field == "Describe" || column.field == "Name") {
          column.edit = { type: "text" }
        }
        if (column.field == "TransactionType") {
          column.edit = { type: "switch" }
        }
        if (column.field == "CowType") {
          column.edit = { type: "select" }
        }
      })
      //动态添加操作列
      this.columns.push({ field: "操作", title: "操作",align:"center", width: 120, render: this.getRender() })
    },
    endEditBefore(row, column, index) {
      //可以自动结束编辑时，自动执行保存，下面getRender的保存按钮去掉
      // this.editSave();
      return true;
    },
    editSave(row) {
      //调用框架的默认保存方法
      this.http.post("/api/App_Transaction/update", { mainData: row }, true).then(x => {
        this.$Message.info("保存成功")
        console.log('保存结果：' + JSON.stringify(x));
      })
    },
    getRender() {//生成最后一列操作列
      return (h, { row, column, index }) => {
        return h("div", { style: { color: '#0c83ff', 'font-size': '13px', cursor: 'pointer' } }, [
          h(
            "a",
            {
              props: {},
              style: { "border-bottom": "1px solid" },
              onClick: (e) => {
                e.stopPropagation();
                //取消其他行选中
                this.$refs.table.$refs.table.clearSelection();
                //设置当前后选中
                this.$refs.table.$refs.table.toggleRowSelection(row);
                this.del([row]);
              }
            },
            "删除"
          ),
          h(
            "a",
            {
              props: {},
              style: { "margin-left": "9px", "border-bottom": "1px solid" },
              onClick: (e) => {
                e.stopPropagation();
                //将当前行设置为编辑行
                this.$refs.table.edit.rowIndex = index;
              }
            },
            "编辑"
          ),
          h(
            "a",
            {
              props: {},
              style: { "margin-left": "9px", "border-bottom": "1px solid" },
              onClick: (e) => {
                e.stopPropagation();
                //强制结束编辑
                this.$refs.table.edit.rowIndex = -1;
                //执行保存方法
                this.editSave(row);
              },
            },
            "保存"
          ),
        ]);
      };
    },
  }
};
export default extension;
