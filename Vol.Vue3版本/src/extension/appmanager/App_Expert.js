
import gridHeader from './App_Expert/App_ExpertGridHeader'

//自定义选择数据源页面
import App_ExpertModelBody from './App_Expert/App_ExpertModelBody'
import { h, resolveComponent } from 'vue';
//声明vue对象
let $this;
let extension = {
  components: {
    gridHeader: gridHeader,
    gridBody: {
      render() {
        return h(resolveComponent('ElAlert'), {
          style: { 'margin-bottom': '12px' },
          'show-icon': true,
          closable: false,
        }, [h('p', {}, '1、多个弹出框：手动创建一个页面,接着在表对应的js文件中引入页面放到gridHeader中'),
        h('p', {}, ' 2、在手动创建的页面中，可以写任意代码,在js中通过this.$refs.gridHeader.xx即可访问页面的内容,具体见:App_Expert.js、App_ExpertGridHeader.vue')]);
      }
    },
    gridFooter: '',
    modelHeader: '',
    modelBody: App_ExpertModelBody,  //将选择数据源页面App_ExpertModelBody注册到弹出框中
    modelFooter: ''
  }, //动态扩充组件或组件路径
  buttons: {
    view: [{
      name: "弹出框1",
      icon: 'md-add',
      index: 1,//添加到第一个按钮后面
      type: 'primary',
      onClick: function () {
        $this.$refs.gridHeader.open1()
      }
    }]
  },

  methods: { //事件扩展
    onInited() {
      $this = this;
      //手动调度弹出框的高度
      this.boxOptions.height = this.boxOptions.height + 90;
      //手动设置表高度自动适应
      this.height = this.height - 100;
    },
    onInit() {

      //选择数据源功能
      this.editFormOptions.forEach(x => {
        x.forEach(item => {
          if (item.field == 'CreateDate') {
            //给编辑表单设置[选择数据]操作,extra具体配置见volform组件api
            item.extra = {
              icon: "el-icon-zoom-out",
              text: "选择数据",
              style: "color:red;font-size: 12px;cursor: pointer;",
              click: item => {
                this.$refs.modelBody.openDemo();
              }
            }
          }
        })
      })


      //设置保存后继续添加 ，不关闭当前窗口
      //2021.04.11需要更新methods.js,ViewGrid.vue
      this.continueAdd = true;
      this.continueAddName = "连续添加";

      //将编辑表单第一行第一列【名称】字段添加一个额外提示属性
      this.editFormOptions[0][0].extra = {
        render: h => {
          return h(
            resolveComponent("el-tooltip"),
            {
              content: "这里是提示的内容",
              props: { effect: "dark", placement: "top-start" },
              style: {}
            }, [
            h('a', { style: { color: '#2a92ff' } }, '提示信息')
          ]
          )
        }
      }

      //设置界面上最多可显示的按钮数量 
      this.maxBtnLength = 6;

      // 第2个弹出框操作
      this.buttons.splice(2, 0, ...[{
        name: "弹出框2",
        icon: 'md-add',
        type: 'success',
        onClick: function () {
          $this.$refs.gridHeader.open2()
        }
      },
      {
        name: "获取子组件对象",
        icon: 'md-add',
        type: 'warning',
        onClick: function () {
          this.$Message.info(this.$refs.gridHeader.getTestData())
        }
      }])


      // 第3个弹出框操作
      this.columns.forEach(x => {
        if (x.field == "Resume") {
          x.formatter = (row, column, event) => {
            return '<a style="color:#2a92ff;cursor: pointer;">(弹出框3)' + row.Resume + '</a>'
          };
          //绑定点击事件
          x.click = (row, column, event) => {
            $this.$refs.gridHeader.open3(row)
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

      //动态添加一行表单配置
      this.editFormOptions[2].splice(0, 1, ...[{
        colSize: 12,
        render: h => {
          return h(
            'div', { style: { 'padding-left': '60px' } },
            [h(resolveComponent('ElAlert'), {
              style: {},
              type: 'success',
              'show-icon': true,
              title: "这里是render动态渲染的内容",
              closable: false,
            }, [h('div', { style: { 'margin-top': '-20px' } }, '代码生成器中编辑类型选择file/excel/img类型文件上传,同时可以设置上传文件数量、大小等,具体见App_Expert.js配置')])]
          )
        }
      }])

    },
  }
};
export default extension;