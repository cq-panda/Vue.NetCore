let extension = {
  components: {
    //动态扩充组件或组件路径
    //表单header、content、footer对应位置扩充的组件
    gridHeader: '',
    gridBody: '',
    gridFooter: '',
    //弹出框(修改、编辑、查看)header、content、footer对应位置扩充的组件
    modelHeader: '',
    modelBody: '',
    modelFooter: ''
  },
  buttons: [], //扩展的按钮
  methods: {
    //事件扩展
    onInit() {
      this.columns.forEach((x) => {
        if (x.field == 'ParentId') {
          x.title = '上级角色';
        }
      });

      //这些配置不是必须的
      this.editFormOptions.forEach((x) => {
        x.forEach((item) => {
          if (item.field == 'ParentId') {
            item.title = '上级角色';
            //设置任意节点都能选中(默认只能选中最后一个节点)
            item.changeOnSelect = true;
          }
        });
      });
    },
    onInited() {},
    addAfter(params) {
      this.initDicKeys(true);
      return true;
    },
    updateAfter(params) {
      this.initDicKeys(true);
      return true;
    },
    delAfter(params) {
      this.initDicKeys(true);
      return true;
    }
  }
};
export default extension;
