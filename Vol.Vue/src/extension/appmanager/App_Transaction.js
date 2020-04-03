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
  text: "目前导入导出的字段为代码生成器中配置[是否显示与编辑列],可自行添加配置字段处理",
  buttons: [],//扩展的按钮
  methods: {//事件扩展
    onInit() {//手动设置弹出框的高度与宽度
      this.maxBtnLength = 6;
      this.boxOptions.height = 380;
      this.boxOptions.width = 600;
    }
  }
};
export default extension;
