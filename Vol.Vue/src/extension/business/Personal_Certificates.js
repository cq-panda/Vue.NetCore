//此处是对表单的方法，组件，权限操作按钮等进行任意扩展(方法扩展可参照SellOrder.js)
let extension = {
  components: {
    //动态扩充组件或组件路径
    //表单header、content、footer对应位置扩充的组件
    gridHeader: () => import("./Personal_Certificates/BodyExtend.vue"), //{ template: "<div>扩展组xx件</div>" },
    gridBody: "",
    gridFooter: "",
    //弹出框(修改、编辑、查看)header、content、footer对应位置扩充的组件
    modelHeader: "",
    modelBody: "",
    modelFooter: ""
  },
  buttons: {
    view: [
      //ViewGrid查询界面按钮
      {
        name: "添加",
        icon: "md-add",
        value: "Add",
        class: "",
        type: "success",
        index: 1, //显示的位置
        onClick: function() {
          this.$refs.gridHeader.viewModel = true;
        }
      }, //ViewGrid查询界面按钮
      {
        name: "修改",
        icon: "md-create",
        value: "Edit",
        class: "",
        type: "warning",
        index: 2, //显示的位置
        onClick: function() {
          var selected = this.$refs.table.getSelected();
          if (selected.length) {
            this.$refs.gridHeader.editPersonal(selected[0]);
            this.$refs.gridHeader.viewModel = true;
          } else {
            this.$Message.error("请选择编辑对象");
          }
        }
      }
    ],
    //新建、编辑弹出框按钮
    box: [],
    detail: []
  }, //扩展的按钮
  methods: {
    //事件扩展
    onInit() {
      //是否单选
      this.single = true;
      //设置高度
      // this.tableMaxHeight = document.documentElement.clientHeight * 0.5;
      //设置查询页面显示6个按钮(默认3个)
      this.maxBtnLength = 5;
    }
  }
};
export default extension;
