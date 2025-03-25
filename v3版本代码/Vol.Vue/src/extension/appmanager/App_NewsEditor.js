
let extension = {
  components: {
    gridHeader: "",
    gridBody: {
      template: '<Alert  type="success" show-icon>\
    使用代码生成器生成\
    <template slot="desc">\ <p>\
     1、代码生成器编辑类型选择editor即可默认生成编辑器,2021.01.16更新basic组件与代码生成器才可使用</p>\
     <p>2、设置属性后textInline，表格超出换行onInit(){ this.textInline = false}</p></template>\
   </Alert>'},
    gridFooter: '',
    modelHeader: '',
    modelBody: '',
    modelFooter: ''
  }, //动态扩充组件或组件路径
  buttons: {
    view: []
  },
  tableAction: "App_News",
  methods: { //事件扩展
    onInit() {
      //设置表的最大高度
      this.tableMaxHeight = 400;
      //table内容超出后自动换行
      this.textInline = false;
      //添加预览操作
      this.columns.forEach(item => {
        //设置url点击事件
        if (item.field == 'DetailUrl') {
          item.title = "页面预览";
          item.formatter = (row) => { return '<a>预览</a>' }
          item.click = (row, column, event) => {
            if (!row.DetailUrl || row.DetailUrl.indexOf('.html') == -1 || !this.base.isUrl(this.http.ipAddress + row.DetailUrl)) {
              return this.$Message.error("请先发布静态页面")
            }
            window.open(this.http.ipAddress + row.DetailUrl);
          }
        }
      })
    }

  }
};
export default extension;