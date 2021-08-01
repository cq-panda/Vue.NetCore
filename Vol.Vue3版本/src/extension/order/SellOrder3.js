
import SellOrder3GridFooter from "./SellOrder3/SellOrder3GridFooter.vue"
let extension = {
  components: {//动态扩充组件或组件路径
    //表单header、content、footer对应位置扩充的组件
    gridHeader: '',//{ template: "<div>扩展组xx件</div>" },
    gridBody:'',
    gridFooter: SellOrder3GridFooter, //() => import("./SellOrder3/SellOrder3GridFooter.vue"),
    //弹出框(修改、编辑、查看)header、content、footer对应位置扩充的组件
    modelHeader: "",
    modelBody: '',
    modelFooter: "", //() => import("./SellOrderComponents/ModelFooter.vue"),
  },
  text: "用法与【主从一对一(2)】一致(见SellOrder3.js)",
  buttons: { //根据需要自行实现扩展按钮
  },//扩展的按钮
  methods: {
    mounted() {
    },
    //方式1,通过select选择触发显示与隐藏
    onInit() {
      //点击单元格编辑与结束编辑(默认是点击单元格编辑，鼠标离开结束编辑)
      this.detailOptions.clickEdit = true;
      //设置为单选，用于明细表加载数据时获取主表选行的id
      this.single = true;
    },
    onInited() {
      this.height = this.height - 350;
    },

    rowClick({ row, column, event }) { //查询界面table点击行选中当前行
      this.$refs.table.$refs.table.toggleRowSelection(row);
      if (this.$refs.gridFooter && this.$refs.gridFooter.$refs.tableList) {
        //添加明细表的数据(触发明细表加载数据，见SellOrder3GridFooter方法loadBefore)
        //load方法可参照voltable组件api文档
        this.$refs.gridFooter.$refs.tableList.load()
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
    },
    modelOpenAfter() {
      //新建弹出框时，设置设置默认订单类型
      if (this.currentAction == "Add") {
        this.editFormOptions.forEach(item => {
          item.forEach(x => {
            //如果是编辑帐号设置为只读
            if (x.field == "OrderType") {
              //新建时默认选择中第一个下拉框的值，如果要选中其他的值，请遍历x.data获取key
              /*注意:如果下拉框的数据源是自定义sql，并且key是数字，请将（x.data[0].key*1）转换成数字*/
              this.editFormFields.OrderType = x.data[0].key;
              //可以指定其他input标签的默认值
              this.editFormFields.TranNo="8888"
            }
          })

        })
      }
    }
  }
};
export default extension;
