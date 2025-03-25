// author:jxx
// 此处是对表单的方法，组件，权限操作按钮等进行任意扩展(方法扩展可参照SellOrder.js)
let extension = {
  components: {
      // 动态扩充组件或组件路径
      // 表单header、content、footer对应位置扩充的组件
      gridHeader: '', // { template: "<div>扩展组xx件</div>" },
      gridBody: '',
      gridFooter: '',
      // 弹出框(修改、编辑、查看)header、content、footer对应位置扩充的组件
      modelHeader: '',
      modelBody: '',
      modelFooter: ''
  },
  text: '',
  buttons: {
      view: [
          {
              name: '生成语言包',
              icon: 'el-icon-plus',
              index: 1,
              type: 'primary',
              plain:true,
              onClick: function () {
                  this.createLanguagePack()
              }
          }
      ],
      box: [],
      detail: []
  }, // 扩展的按钮
  methods: {
      destroyed () {
      },
      // 事件扩展
      onInit () {
          this.labelWidth = 140
          this.maxBtnLength = 10
        //   this.boxOptions.height = 300
          this.textInline = false
          this.continueAdd = true;

      },
      onInited () {

      },
      createLanguagePack () {
          this.http
              .get('/api/Sys_Language/createLanguagePack', {}, true)
              .then(x => {
                  this.$Message[x.status ? 'info' : 'error'](this.$ts(x.message))
              })
      },
      searchAfter (result) {
          // 查询ViewGird表数据后param查询参数,result回返查询的结果
          //   this.testList = { recordset: result };
          return true
      },
      modelOpenAfter (row) {
          if (this.currentAction == 'Add') {
              this.editFormFields.IsPackageContent = "1";
          }
      }
  }
}
export default extension
