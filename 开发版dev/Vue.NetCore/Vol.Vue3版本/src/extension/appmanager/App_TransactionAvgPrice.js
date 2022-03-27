
import { h, resolveComponent } from 'vue';
let extension = {
  components: {
    //动态扩充组件或组件路径
    //表单header、content、footer对应位置扩充的组件
    gridHeader: '', //{ template: "<div>扩展组xx件</div>" },
    gridBody: {
      render() {
        return [
          h(resolveComponent('el-alert'), {
            style: { 'margin-bottom': '12px' },
            'show-icon': true, type: 'warning',
            closable: false, title: 'onInit中设置this.maxBtnLength = 7;指定按钮显示的个数。见代码：App_TransactionAvgPrice.js'
          }, ''),
        ]
      }
    },
    gridFooter: "",
    //弹出框(修改、编辑、查看)header、content、footer对应位置扩充的组件
    modelHeader: "",
    modelBody: "",
    modelFooter: ""
  },
  text:
    "还没想好",
  buttons: [], //扩展的按钮
  methods: {
    //事件扩展
    onInit() {
      //设置页面上显示的按钮个数(不是必须的)
      this.maxBtnLength = 7;
      //this.boxButtons弹出框的按钮,this.detailOptions.buttons，同样适用上面上方法
      //2021.07.17更新volform.vue组件后才能使用 
      this.editFormOptions.forEach(x => {
        x.forEach(option => {
          if (option.field == "Date") {
            option.min = "2021-07-01 00:00";
            option.max = Date.now();//日期最大值"2021-07-20 00:00" 
          }

        })
      })
      this.columns.forEach(option => {
        if (option.field == 'AgeRange') {
          option.normal = true;
        }
      })
      //如果要设置查询的日期范围选择同上 
      //this.searchFormOptions.forEach 

      //设置显示所有查询条件
      // this.setFiexdSearchForm(true);
    },
    onInited() {
      //设置表高度
      this.height = this.height - 50;
    },
    rowClick({ row, column, event }) { //查询界面table点击行时选中当前行
      this.$refs.table.$refs.table.toggleRowSelection(row);
    },
  }
};
export default extension;
