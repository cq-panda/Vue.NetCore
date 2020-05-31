

let extension = {
  components: {//动态扩充组件或组件路径
    //表单header、content、footer对应位置扩充的组件
    gridHeader: '',
    gridBody: '',
    gridFooter: '',
    //弹出框(修改、编辑、查看)header、content、footer对应位置扩充的组件
    modelHeader: '',
    modelBody: '',
    modelFooter: ''
  },
  buttons: [],//扩展的按钮
  methods: {//事件扩展
    onInit() {
      this.columns.forEach(x => {
        if (x.field == 'ParentId') {
          x.title = "上级角色";
          //2020.05.24修改上级角色的绑定数据源,
          //存在问题,非超级管理员，table中上级角色的值没有加载出来

          //注意，如果是2020.05.24之前获取的数据库脚本
          //请在菜单【下拉框绑定设置】添加一个字典编号【t_roles】,除了字典编号，其他内容随便填写
          x.bind = { key: "t_roles" }
        }
      });
      this.editFormOptions.forEach(x => {
        x.forEach(item => {
          if (item.field == 'ParentId') {
            item.min = 0;
          }
          if (item.field == 'ParentId') {
            item.title = "上级角色";
            item.type = 'select';
            item.dataKey = "roles";
            //item.data = [{ key:1,value:'超级管理员' }]
          }
        })
      })
    },
    onInited() {
    }
  }
};
export default extension;
