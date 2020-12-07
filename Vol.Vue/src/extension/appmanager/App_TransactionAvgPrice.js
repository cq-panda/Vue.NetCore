let extension = {
  components: {
    //动态扩充组件或组件路径
    //表单header、content、footer对应位置扩充的组件
    gridHeader: "", //{ template: "<div>扩展组xx件</div>" },
    gridBody: "",
    gridFooter: "",
    //弹出框(修改、编辑、查看)header、content、footer对应位置扩充的组件
    modelHeader: "",
    modelBody: "",
    modelFooter: ""
  },
  text:
    "下拉框的数据源不需要写代码，在代码生成器中配置。数据源在系统->下拉框绑定中设置",
  buttons: [], //扩展的按钮
  methods: {
    //事件扩展
    onInit () {
      //隐藏查询界面按钮
      this.buttons.forEach(x => {
        if (x.name == "刷 新" || x.name == "新 建") {
          this.$set(x, "hidden", true);
        }
      })
      //设置页面上显示的按钮个数(不是必须的)
      this.maxBtnLength = 6;
      //this.boxButtons弹出框的按钮,this.detailOptions.buttons，同样适用上面上方法
    }
  }
};
export default extension;
