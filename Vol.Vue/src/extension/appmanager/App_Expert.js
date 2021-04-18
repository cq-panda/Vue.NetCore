
import gridHeader from './App_Expert/App_ExpertGridHeader'
//声明vue对象
let $this;
let extension = {
  components: {
    gridHeader: gridHeader,
    gridBody: '',
    gridFooter: '',
    modelHeader: '',
    modelBody: '',
    modelFooter: ''
  }, //动态扩充组件或组件路径
  buttons: {
    view: [{
      name: "弹出框1",
      icon: 'md-add',
      index: 1,//添加到第一个按钮后面
      type: 'error',
      onClick: function () {
        this.$refs.gridHeader.open1()
      }
    }]
  },
  methods: { //事件扩展
    onInit() {
      //设置保存后继续添加 ，不关闭当前窗口
      //2021.04.11需要更新methods.js,ViewGrid.vue
      this.continueAdd = true;
      this.continueAddName = "连续添加";

      //将编辑表单第一行第一列【名称】字段添加一个额外提示属性
      //需要2020.12.27更新volform组件后才能使用
      this.editFormOptions[0][0].extra = {
        render: h => {
          return h(
            "div",
            {
              props: {}, style: { color: "#03A9F4", cursor: "pointer" },
              on: { click: () => { this.$Message.info("点击事件") } }
            },
            [
              h(
                "Tooltip",
                {
                  props: { content: "这里是提示的内容", placement: "right-start" },
                  class: "ivu-icon ivu-icon-ios-alert-outline",
                  style: {}
                }, [
                h("span", {}, ["提示信息"])
              ]
              )
            ]
          );
        }
      }



      //设置界面上最多可显示的按钮数量 
      this.maxBtnLength = 6;
      // 第2个弹出框操作
      this.buttons.splice(2, 0, ...[{
        name: "弹出框2",
        icon: 'md-add',
        type: 'info',
        onClick: function () {
          this.$refs.gridHeader.open2()
        }
      },
      {
        name: "获取子组件对象",
        icon: 'md-add',
        type: 'info',
        onClick: function () {
          this.$Message.info(this.$refs.gridHeader.getTestData())
        }
      }])


      // 第3个弹出框操作
      this.columns.forEach(x => {
        if (x.field == "Resume") {
          x.formatter = (row, column, event) => {
            return '<a>(弹出框3)' + row.Resume + '</a>'
          };
          //绑定点击事件
          x.click = (row, column, event) => {
            this.$refs.gridHeader.open3(row)
          };
        }
      })

      //启用多图上传,其他上传参数，参照volupload组件api
      this.editFormOptions.forEach(x => {
        x.forEach(item => {
          if (item.field == 'HeadImageUrl') {
            //item.type = 'file';
            //设置成100%宽度
            item.colSize = 12;
            item.multiple = true;
            //最多可以上传3张照片
            item.maxFile = 3;
            //限制图片大小，默认3M
            item.maxSize = 3;
           // item.append = true;
          }
        })
      })
    },
  }
};
export default extension;