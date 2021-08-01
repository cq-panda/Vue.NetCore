import gridFooter from "./SellOrder2/SellOrder2GridFooter.vue"
import { h, resolveComponent } from 'vue';
let extension = {
  components: {//动态扩充组件或组件路径
    //表单header、content、footer对应位置扩充的组件
    gridHeader: '',//{ template: "<div>扩展组xx件</div>" },
    gridBody: {
      render() {
        return [
          h(resolveComponent('el-alert'), {
            style: { 'margin-bottom': '12px' },
            'show-icon': true, type: 'success',
            closable: false, title: '界面由代码生成器生成,只需几行代码即可实现点击主表行显示明细表数据(直接扩展gridFooter位置的代码,具体代码见此示例:SellOrder2.js)'
          }, ''),
        ]
      }
    },
    gridFooter: gridFooter,
    //弹出框(修改、编辑、查看)header、content、footer对应位置扩充的组件
    modelHeader: "",
    modelBody: '',
    modelFooter: "",
  },
  text: "点击主表行加载明细表数据,如果本地看不到此菜单,可以按照演示环境配置下此页面菜单",
  buttons: { //根据需要自行实现扩展按钮
  },//扩展的按钮
  methods: {
    mounted() {
    },
    //方式1,通过select选择触发显示与隐藏
    onInit() {
      //点击单元格编辑与结束编辑(默认是点击单元格编辑，鼠标离开结束编辑)
      this.detailOptions.clickEdit = true;
      //设置主表合计
      this.summary = true;

    },
    onInited() {
      //调整界面table高度
      this.height = this.height - 310;
    },
    // rowDbClick({ row, column, event }){//双击事件
    // },
    rowClick({ row, column, event }) { //查询界面table点击行选中当前行
      //取消其他行选中
      this.$refs.table.$refs.table.clearSelection();
      //设置选中当前行
      this.$refs.table.$refs.table.toggleRowSelection(row);
      if (this.$refs.gridFooter && this.$refs.gridFooter.$refs.tableList) {
        //load方法可参照voltable组件api文档
        this.$refs.gridFooter.$refs.tableList.load({ value: row.Order_Id, sort: "CreateDate" })
      }
    },
    searchAfter(rows) {
      //页面加载或者刷新数据后直接显示第一行的明细
      if (rows.length) {
        // this.$nextTick(() => {
        this.$refs.gridFooter.$refs.tableList.load({ value: rows[0].Order_Id, sort: "CreateDate" })
        // })
      } else {
        //没有数据时，清空明细数据
        this.$refs.gridFooter.$refs.tableList.rowData.splice(0)
      }
      return true;
    }
  }
};
export default extension;
