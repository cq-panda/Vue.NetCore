import { h, resolveComponent } from 'vue';
let extension = {
  components: {
    //动态扩充组件或组件路径
    //表单header、content、footer对应位置扩充的组件
    gridHeader: "", //{ template: "<div>扩展组xx件</div>" },
    gridBody: '',
    gridFooter: "",
    //弹出框(修改、编辑、查看)header、content、footer对应位置扩充的组件
    modelHeader: "",
    modelBody: "",
    modelFooter: ""
  },
  buttons: [], //扩展的按钮
  methods: {
    //事件扩展
    onInit() {
      console.log("sys_log")
      this.setFiexdSearchForm(true);
    },
    onInited() {
      this.height = this.height - 195;
    }
  }
};
export default extension;
