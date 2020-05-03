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
  text: "下拉框的数据源不需要写代码，在代码生成器中配置。数据源在系统->下拉框绑定中设置",
  buttons: [],//扩展的按钮
  methods: {//事件扩展
    onInit() {
      //手动调整弹出框表单的label宽度
      this.boxOptions.labelWidth = 130;
      //编辑时，设置IsTop、City字段为远程搜索
      this.editFormOptions.forEach(x => {
        x.forEach(item => {
          if (item.field == 'Variety') {
            item.onChange = (arr) => {
              console.log(arr)
            }
          }
          if (item.field == 'City') {
            //指定IsTop、City为远程搜索(代码生成器中页面配置编辑类型必须是select，并指定数据源字典编号,数据源必须是自定义sql)
            item.remote = true;
            item.extra = {
              icon: "md-sad",//显示图标
              text: "远程搜索,在App_TransactionAvgPrice.js中查看详细配置" //显示文本
              //触发事件 click: item => {}
            }
          }
        })
      })
    }
  }
};
export default extension;
