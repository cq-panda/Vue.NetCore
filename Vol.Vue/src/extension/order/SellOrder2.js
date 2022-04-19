import gridFooter from "./SellOrder2/SellOrder2GridFooter.vue"

//自定义从表选择数据源页面
import modelBody from "./SellOrder2/SellOrder2ModelBody.vue"
let extension = {
  components: {//动态扩充组件或组件路径
    //表单header、content、footer对应位置扩充的组件
    gridHeader: '',//{ template: "<div>扩展组xx件</div>" },
    gridBody: {
      template: `<div>
        <Alert type="success" show-icon> <p style="color:red;">主表与弹出框部份由代码生成器生成，点击主表行显示多个明细表数据，直接扩展gridFooter位置的代码,具体代码见此示例(SellOrder2.js)</p></Alert></div>`},
    gridFooter: gridFooter,
    //弹出框(修改、编辑、查看)header、content、footer对应位置扩充的组件
    modelHeader: "",
    modelBody: modelBody,
    modelFooter: "", //() => import("./SellOrderComponents/ModelFooter.vue"),
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
      this.height = this.height - 300;
      this.detailOptions.height = this.detailOptions.height - 15;
      //设置主表求字段，后台需要实现SummaryExpress方法
      this.columns.forEach(x => {
        if (x.field == 'Qty') {
          x.summary = true;
        }
      })

      //明细表选择数据源操作
      //获取明细表备注列，给备注列添加选择数据操作
      let _column = this.detailOptions.columns.find(x => { return x.field == "Remark" });
      _column.title = "(备注)点击选择数据"
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
              on: {
                click: (e) => {
                  e.stopPropagation();
                  //弹出选择数据源
                  this.$refs.modelBody.open(row);
                },
              }
            }),
            h("span", {}, row.Remark)
          ])
      };
    },

    rowClick({ row, column, event }) { //查询界面table点击行选中当前行
      // this.$refs.table.$refs.table.toggleRowSelection(row);
      if (this.$refs.gridFooter && this.$refs.gridFooter.$refs.tableList) {
        //添加明细表的数据
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
