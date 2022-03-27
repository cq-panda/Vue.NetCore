import gridFooter from "./SellOrder2/SellOrder2GridFooter.vue"

//自定义从表选择数据源页面
import modelBody from "./SellOrder2/SellOrder2ModelBody.vue"
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
    modelBody: modelBody,//自定义从表选择数据源页面
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

      //明细表选择数据源操作
      //获取明细表备注列，给备注列添加选择数据操作
      let _column = this.detailOptions.columns.find(x => { return x.field == "Remark" });
      _column.title="(备注)点击选择数据"
      //移除编辑操作
      _column.edit = null;
      //给备注列添加选择数据操作
      _column.render = (h, { row, column, index }) => {
        return h("div", { style: {} },
          [
            h("i", {
              class: ["el-icon-zoom-out"],
              style: {
                cursor: "pointer",
                "margin-right": "8px",
                color: "#409eff",
              },
              onClick: (e) => {
                e.stopPropagation();
                //弹出选择数据源
                this.$refs.modelBody.open(row);
              },
            }),
          ], row.Remark)
      };
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
