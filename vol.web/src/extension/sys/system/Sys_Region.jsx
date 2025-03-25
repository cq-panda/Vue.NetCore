/*****************************************************************************************
 **  Author:jxx 2022
 **  QQ:283591387
 **完整文档见：http://v2.volcore.xyz/document/api 【代码生成页面ViewGrid】
 **常用示例见：http://v2.volcore.xyz/document/vueDev
 **后台操作见：http://v2.volcore.xyz/document/netCoreDev
 *****************************************************************************************/
//此js文件是用来自定义扩展业务代码，可以扩展一些自定义页面或者重新配置生成的代码

let extension = {
  components: {
    gridHeader: '',
    gridBody:'' ,
    gridFooter: '',
    //新建、编辑弹出框扩展组件
    modelHeader: '',
    modelBody: '',
    modelFooter: ''
  },
  tableAction: '', //指定某张表的权限(这里填写表名,默认不用填写)
  buttons: { view: [], box: [], detail: [] }, //扩展的按钮
  methods: {
    //下面这些方法可以保留也可以删除
    searchAfter(result) {
      //2、查询后方法，调用自定义列表设置值
      //this.$refs.gridBody.loadList(result, this.columns)
      return true
    },
    sortEnd(newIndex, oldIndex, rows) {
      console.log(this.editFormFields)
    },
    //下面这些方法可以保留也可以删除
    onInit() {


      //此处仅作为演示默认查询使用
      if (
        !localStorage.getItem('filter:Sys_Region:name') ||
        localStorage.getItem('filter:Sys_Region:name') == '[]'
      ) {
        localStorage.setItem(
          'filter:Sys_Region:name',
          '["默认查询","北京市查询","上海市查询"]'
        )
        localStorage.setItem(
          'filter:Sys_Region',
          '[{"name":"默认查询","value":[{"field":"code","title":"编码","icon":"el-icon-document","searchType":"like","value":null,"type":"string","width":25},{"field":"name","title":"名称","icon":"el-icon-document","searchType":"like","value":null,"type":"string","width":25},{"field":"mername","title":"完整地址","icon":"el-icon-document","searchType":"like","value":null,"type":"string","width":25},{"field":"pinyin","title":"拼音","icon":"el-icon-document","searchType":null,"value":null,"type":"string","width":25}]},{"name":"北京市查询","value":[{"field":"mername","title":"完整地址","icon":"el-icon-document","searchType":"like","value":"北京","type":"string","width":25},{"field":"pinyin","title":"拼音","icon":"el-icon-document","searchType":"likeStart","value":null,"type":"string","width":25}]},{"name":"上海市查询","value":[{"field":"mername","title":"完整地址","icon":"el-icon-document","searchType":"like","value":"上海","type":"string","width":25},{"field":"name","title":"名称","icon":"el-icon-document","searchType":"like","value":null,"type":"string","width":25},{"field":"pinyin","title":"拼音","icon":"el-icon-document","searchType":"likeStart","value":null,"type":"string","width":25}]}]'
        )
      }
      this.sortable = true

      //设置多个快捷查询字段
      this.queryFields = ['mername', 'name']
      //1、自定义按钮切换页面显示
      this.isList = true
      this.columns.forEach((x) => {
        if (x.field == 'mername') {
          x.tip = {
            text: '<a>标题长度不够时</br>可自定义标题或提示信息</a>',
            click: () => {
              this.$message.success('点击了表头')
            }
          }
        } else if (x.field == 'name') {
          x.tip = {
            text: '自定义标题提示',
            icon: 'bi-text-right',
            click: () => {
              this.$message.success('点击了表头')
            }
          }
        }
      })
      //示例：在按钮的最前面添加一个按钮
      //   this.buttons.unshift({  //也可以用push或者splice方法来修改buttons数组
      //     name: '按钮', //按钮名称
      //     icon: 'el-icon-document', //按钮图标vue2版本见iview文档icon，vue3版本见element ui文档icon(注意不是element puls文档)
      //     type: 'primary', //按钮样式vue2版本见iview文档button，vue3版本见element ui文档button
      //     onClick: function () {
      //       this.$Message.success('点击了按钮');
      //     }
      //   });

      //示例：设置修改新建、编辑弹出框字段标签的长度
      // this.boxOptions.labelWidth = 150;
    },
    onInited() {
      this.testattr = '123131'
      console.log(this.testattr)
      this.height = this.height - 38

      //如果是一对多明细，给二级明细表绑定下拉搜索:
      //二级表：this.details[0].columns.forEach
      //三级表：this.subDetails[0].columns.forEach
      //0表示第几张表,其他操作不变按下面的配置

      //配置编辑表单下拉框table搜索选项
      this.columns.forEach((item) => {
        if (item.field == 'code') {
          item.readonly = false
          item.edit.type = 'selectTable'
          //配置请求的接口地址
          //可以使用生成的页面接口，注意接口权限问题，如果提示没有权限,参照后台后开发文档上的重写权限示例
          //item.url = 'api/Demo_Goods/getPageData';

          //尽量自定义接口，见下面的文档描述，或者Demo_GoodsController类的方法Search
          item.url = 'api/Demo_Goods/search'

          //输入框只读操作，需要将columns的search字段设置为true，否则无法过滤数据
          //item.inputReadonly=true;
          //设置显示的字段
          item.columns = [
            { field: 'GoodsName', title: '商品名称', type: 'string', width: 120, search: false },
            { field: 'GoodsCode', title: '商品编号', type: 'string', width: 100, search: false },
            { field: 'Specs', title: '规格', type: 'string', width: 60, align: 'left' },
            { field: 'Price', title: '单价', type: 'decimal', width: 60 },
            { field: 'Remark', title: '备注', type: 'string', width: 100 }
          ]

          //选中table数据后，回写到表单
          //editRow:当前正在编辑的行
          //rows:选中的行
          item.onSelect = (editRow, rows) => {
            editRow.name = rows[0].GoodsName
            editRow.code = rows[0].GoodsCode
          }

          /****下面的这些都是可以选配置，上面的是必填的******/

          //(输入框搜索)表格数据加载前处理
          //editRow:当前正在编辑的行
          //param:请求的参数
          item.loadBefore = (editRow, param, callback) => {
            //loadType=1按回车调用的查询，loadType=1输入框变化调用的查询，loadType=undefined默认页面加载
            //这里可以实现只加载回车事件
            // if(params.loadType!=1){
            //     return false;
            // }

            //(上面如果设置了item.inputReaonly，这里就不能添加表单的值过滤，否则无法显示数据)
            //方式1、手动设置查询条件
            // param.wheres.push({
            //       name:"GoodsName",
            //       value:editRow.GoodsName,
            //       displayType:"like"
            // })
            //方式2、给param.value设置值，后台手动处理查询条件
            //上面设置了inputReadonly后这里就不用设置了
            param.value = editRow.GoodsName
            callback(true)
          }

          /****************下面这些配置不是必须的**************/
          //表格数据加载后处理
          //editRow:当前正在编辑的行
          //rows:后台返回的数据
          item.loadAfter = (editRow, rows, callback, result) => {
            callback(true)
          }

          //监听输入框变动与回车事件
          item.onKeyPress = (val, $event, row) => {
            console.log(val)
            if ($event.keyCode == 13) {
              console.log('按了回车')
            }
            //清空值时给其他字段设置值
            // if(!val&&value+''!='0'){
            //     row.xx=null;
            // }
          }
          //设置弹出框高度(默认200)
          item.height = 200
          //设置弹出框宽度(默认500)
          item.selectWidth = 500
          item.textInline = true //设置表格超出显示...
          //设置表格是否单选
          item.single = true
          //隐藏分页
          item.paginationHide = true
        }
      })
    },
    async searchBefore(param) {
      console.log('region', this.testattr)
      //界面查询前,可以给param.wheres添加查询参数
      //返回false，则不会执行查询
      return true
    },
    addBefore(formData) {
      //新建保存前formData为对象，包括明细表，可以给给表单设置值，自己输出看formData的值
      return true
    },
    updateBefore(formData) {
      //编辑保存前formData为对象，包括明细表、删除行的Id
      return true
    },
    rowClick({ row, column, event }) {
      //查询界面点击行事件
      // this.$refs.table.$refs.table.toggleRowSelection(row); //单击行时选中当前行;
    },
    rowChange(rows) {
      console.log(rows)
    },
    modelOpenAfter(row) {
      //点击编辑、新建按钮弹出框后，可以在此处写逻辑，如，从后台获取数据
      //(1)判断是编辑还是新建操作： this.currentAction=='Add';
      //(2)给弹出框设置默认值
      //(3)this.editFormFields.字段='xxx';
      //如果需要给下拉框设置默认值，请遍历this.editFormOptions找到字段配置对应data属性的key值
      //看不懂就把输出看：console.log(this.editFormOptions)
    }
  }
}
export default extension
