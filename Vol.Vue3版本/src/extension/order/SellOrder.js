//1、此文件中的代码都是对基础业务进行扩展，也只能在此处编写代码，其他地方编写的代码会被代码生成器生成的代码覆盖
//2、此文件中的方法会与serviceFilter.js进行合并，终终执行的就是此文件中的方法
//3、components为扩展组件，可自定义页面的头部、body及尾部的额外显示的内容，分别对应的组件为:
//gridHeader、gridBody、gridFooter、modelHeader、modelBody、modelFooter共6个组件位置，如果不需要扩展组件，请忽略此处
//4、text为界面显示额外描述信息
//5、buttons->view/box/detail分别为查询界面、弹出框、弹出框明细表额外扩展的按钮
//6、methods为整个页面所有方法的业务代码扩展，如果需要在界面上的操作前、后编写业务，请覆盖此方法
//7、methods方法中可获取任意vue对象、方法、属性,可查看ViewGridConfig路径下的js文件及ViewGrid.vue的data属性
//如手动刷新表数据:this.search();
//获取表的列配置信息:this.columns  明细表表的配置信息this.detail.columns
//8、获取子组件gridHeader、gridBody、gridFooter、modelHeader、modelBody、modelFooter则使用
//this.$refs.gridHeader获取gridHeader为自己扩展的对象
//9、在子组件gridHeader、gridBody、gridFooter、modelHeader、modelBody、modelFooter的方法中调用并获得父组件
// this.$emit("parentCall", $vue => {}) //$vue为父组件对象，具体使用参考order->GridHeaderExtend.vue文件

//10、子父件传参除8、9方式，另可使用已封装的vuex,使用方式:this.$store.getters.data().xxx = this;使用实例：App_News.js

//此处的下面的属性与方法都是对基础业务代码的扩展，如果不需要扩展则忽略对应的方法也不要写在下面
//serviceFilter.js
//所的文件都最终会合并到ViewGrid.vue文件中

import { h, resolveComponent } from 'vue';
import gridHeader from "./SellOrderComponents/GridHeaderExtend.vue"
import gridFooter from "./SellOrderComponents/GridFooterExtend.vue"
import modelFooter from "./SellOrderComponents/ModelFooter.vue"
import modelBody from "./SellOrderComponents/ModelBody.vue"
let extension = {
  components: {//动态扩充组件或组件路径
    //表单header、content、footer对应位置扩充的组件
   gridHeader: gridHeader,
    gridBody: {
      render() {
        return [
          h(resolveComponent('el-alert'), {
            style: { 'margin-bottom': '12px' },
            'show-icon': true, type: 'warning',
            closable: false, title: '一对一全部由代码生成不需要写任何代码,点击新建或编辑查看明细表,可根据需要实现扩展gridHeader、gridBody、gridFooter、modelHeader、modelBody、modelFooter任意位置'
          }, ''),
        ]
      }
    },
    gridFooter: gridFooter,
    //弹出框(修改、编辑、查看)header、content、footer对应位置扩充的组件
    modelHeader: "",
   modelBody: modelBody,
   modelFooter: modelFooter,
  },
  text: "示例覆盖全部可扩展方法,前台扩展文件SellOrder.js，后台Partial->SellOrdeService.cs",
  //this.filterPermission('表名','权限值，如:Add')来判断页面上是否有某个按钮的权限
  buttons: { //根据需要自行实现扩展按钮
    //注：没有编辑或新建权限的情况下，是不会显示此处添加的扩展按钮，如果仍需要显示此处的按钮，可以把按钮在methods的onInited方法中添加,如：this.boxButtons.push(...)
    view: [//ViewGrid查询界面按钮
      {
        name: "点我",
        icon: 'md-create',
        value: 'Edit',
        class: '',
        type: 'primary',
        index: 1,//显示的位置
        onClick: function () { //扩展按钮执行事件
          //this可以获取所有属性，包括this.$refs.gridHeader/gridBody等获取扩展组件对象
          // this.$message("测试扩展按钮");
          this.$refs.gridHeader.model = true;
        }
      }, {
        name: "调用后台",
        icon: 'md-create',
        value: 'Edit',
        class: '',
        type: 'primary',
        index: 1,//显示的位置
        onClick: function () { //扩展按钮执行事件
          this.getServiceDate();
        }
      }
    ],
    box: //新建、编辑弹出框按钮
      [//ViewGrid查询界面按钮
        {
          name: "点我1",
          icon: 'el-icon-delete',
          value: 'Edit',
          class: '',
          type: 'success',
          index: 1,//显示的位置
          onClick: function () {
            this.$message.error("扩展的明细Box按钮,可设置index值指定显示位置,可使用this.$refs拿到包括自定义扩展的所有组件");
          }
        }],
    detail: //新建、编辑弹出框明细表table表按钮
      [//ViewGrid查询界面按钮
        {
          name: "点我2",
          icon: 'el-icon-delete',
          value: 'Edit',
          class: '',
          type: 'success',
          index: 1,//显示的位置
          onClick: function () {
            this.$message.error("扩展的明细table按钮,可设置index值指定显示位置");
          }
        }]
  },//扩展的按钮
  methods: {
    //扩展方法使用示例,根据需要实行下面的方法
    getServiceDate() {
      this.http.post("/api/SellOrder/getServiceDate", {}, '正在调用后台数据').then(date => {
        this.$message.error("从后台获取的服务器时间是：" + date);
      })
    },
    mounted() {
      //this.$message.success('mounted方法执行时,你可以此处编写业务逻辑');
    },
    //方式1,通过select选择触发显示与隐藏
    onInit() {
      //获取订单类型select配置，当前订单类型select改变值时，动态设置Remark,SellNo两个字段是否显示 
      var orderTypeOption = this.getFormOption("OrderType");
      orderTypeOption.onChange = (val) => {
        //当订单类型select改变值时，如果选中的是发货(对应字典编号为2)，emark,SellNo隐藏，否则显示出来
        var remarkOption = this.getFormOption("Remark").hidden = val == "2"
        var sellNoOption = this.getFormOption("SellNo").hidden = val == "2"
      }

      //点击单元格编辑与结束编辑(默认是点击单元格编辑，鼠标离开结束编辑)
      this.detailOptions.clickEdit = true;

      //设置主表合计
      this.summary = true;
      //设置明细表合计
      this.detailOptions.summary = true;
      //表格设置为单选
      // this.single=true;
      // this.detailOptions.single=true;
      //设置编辑表单数量字段的最小与最大值
      this.editFormOptions.forEach(x => {
        x.forEach(item => {
          //设置输入的数量的最小值与最大值(默认是1)
          if (item.field == "Qty") {
            item.min = 10;
            item.max = 200;
          }
        });
      })

      //动态修改table并给列添加事件
      this.columns.forEach(x => {
        if (x.field == "Qty") {
          x.formatter = (row) => {
            return '<a>' + row.Qty + "(弹出框)" + '</a>'
          }
          x.click = (row, column, event) => {
            this.$refs.gridHeader.model = true;
          }
        }
      })

      //动态设置查询界面table高度
      this.tableHeight = 300;
      
    },
    onInited() {
      //设置主表求字段，后台需要实现SummaryExpress方法
      this.columns.forEach(x => {
        if (x.field == 'Qty') {
          x.summary = true;
        }
      })
      //设置明细表高度
      this.detailOptions.height = 220;
      this.boxOptions.height=document.body.clientHeight*0.90;
      //设置明细表求字和段，后台需要实现GetDetailSummary方法
      this.detailOptions.columns.forEach(x => {
        if (x.field == 'Weight' || x.field == 'Qty') {
          x.summary = true;
        }
      })
      //   this.$message.success('create方法执行后', desc: '你可以SellOrder.js中编写业务逻辑,其他方法同样适用' });
    },
    searchBefore(param) { //查询ViewGird表数据前,param查询参数
      //你可以指定param查询的参数，处如果返回false，则不会执行查询
      // this.$message.success(this.table.cnName + ',查询前' });
      // console.log("扩展的"this.detailOptions.cnName + '触发loadDetailTableBefore');
      return true;
    },
    searchAfter(result) { //查询ViewGird表数据后param查询参数,result回返查询的结果
      // this.$notify({
      //   title: '查询结果',
      //   message: '返回的对象：' + JSON.stringify(result),
      //   type: 'success'
      // });
      return true;
    },
    searchDetailBefore(param) {//查询从表表数据前,param查询参数
      //  this.$message.success(this.detailOptions.cnName + '查询前' });
      return true;
    },
    searchDetailAfter(data) {//查询从表后param查询参数,result回返查询的结果
      // this.$notify({
      //   title: '明细查询结果',
      //   message: '返回的对象：' + JSON.stringify(data),
      //   type: 'success'
      // });
      return true;
    },
    delBefore(ids, rows) { //查询界面的表删除前 ids为删除的id数组,rows删除的行
      let auditStatus = rows.some(x => { return x.AuditStatus > 0 });
      if (auditStatus) {
        this.$message.error('只能删除未审核的数据')
        return false;
      }
      this.$message.success('删除前，选择的Id:' + ids.join(','));
      return true;
    },
    delAfter(result) {//查询界面的表删除后
      return true;
    },
    delDetailRow(rows) { //弹出框删除明细表的行数据(只是对table操作，并没有操作后台)
      console.log(rows)
      return true;
    },
    addBefore(formData) { //新建保存前formData为对象，包括明细表
      //formData格式：
      // {
      //     mainData: { 主表字段1: 'x1', 主表字段2: 'x2' },
      //     detailData: [{ 明细表字段1: d1 }],
      //     delKeys: null //删除明细表行数据的id
      // }

      //formData.mainData.xxx="xxxx";//还可以继续手动添加值

      //如果需要同时提交其他数据到后台，请设置formData.extra=xxxx
      //后台在表xxxxService.cs中重写Add方法即可从saveDataModel参数中拿到extra提交的对象
      this.$message.success(this.detailOptions.cnName + '新建前,提交的数据：' + JSON.stringify(formData));
      return true;
    },
    async addBeforeAsync(formData) {
      //2020.12.06增加新建前异步方法同步处理
      //功能同上，区别在于此处可以做一些异步请求处理,全：
      // var _result = await this.http.post("/api/SellOrder/getPageData", {}, true).then(result => {
      //   console.log("1、异步请求前")
      //   return result;
      // })
      // console.log("2、异步请求，同步处理结果:" + JSON.stringify(_result))
      return true;
    },
    addAfter(result) {//新建保存后result返回的状态及表单对象
      this.$message.success(this.detailOptions.cnName + '新建完成后,返回的数据' + JSON.stringify(result));
      return true;
    },
    updateBefore(formData) { //编辑保存前formData为对象，包括明细表、删除行的Id
      //formData格式：(自己调试出输看)
      // {
      //     mainData: { 主表字段1: 'x1', 主表字段2: 'x2' },
      //     detailData: [{ 明细表字段1: d1 }],
      //     delKeys: null //删除明细表行数据的id
      // }

      //formData.mainData.xxx="xxxx";//还可以继续手动添加值

      //如果需要同时提交其他数据到后台，请设置formData.extra=xxxx
      //后台在表xxxxService.cs中重写Update方法即可从saveDataModel参数中拿到extra提交的对象

      this.$message.success(this.detailOptions.cnName + '编辑前,提交的数据：' + JSON.stringify(formData));
      //获取扩展的modelFooter属性text
      console.log(this.$refs.modelFooter.text)
      return true;
    },
    async updateBeforeAsync(formData) {
      //2020.12.06增加修改前异步方法同步处理
      //功能同上，区别在于此处可以做一些异步请求处理,全：
      var _result = await this.http.post("/api/SellOrder/getPageData", {}, true).then(result => {
        console.log("1、异步请求前")
        return result;
      })
      console.log("2、异步请求，同步处理结果:" + JSON.stringify(_result))
      return true;
    },
    updateAfter(result) {//编辑保存后result返回的状态及表单对象
    //  this.$message.success(this.detailOptions.cnName + '编辑完成后,返回的数据' + JSON.stringify(result));
      return true;
    },
    auditBefore(ids, rows) {//审核前
      if (rows.length > 2) {//每次最多只能审核2条数据
        this.$message.error('最多只能选择两条数据');
        return false;
      }
      return true;
    },
    auditAfter(result, rows) {// 审核后
      if (result.status) {
        result.message = "审核成功。。。。。" + result.message;
      }
      return true;
    },
    resetAddFormBefore() { //重置新建表单前的内容
      return true;
    },
    resetAddFormAfter() { //重置新建表单后的内容
      //如果某些字段不需要重置，则可以重新赋值
      this.editFormFields.Remark = '新建重置默认值66666';
      //给明细表添加默认一行
      this.$refs.detail.rowData.push({ Remark: "新建666666" });
      return true;
    },
    resetUpdateFormBefore() { //重置编辑表单前的内容
      //this.editFormFields当前值
      console.log(this.editFormFields)
      //当前明细表的行
      console.log(this.$refs.detail.rowData)
      return true;
    },
    resetUpdateFormAfter() { //重置编辑表单后的内容
      //如果某些字段不需要重置，则可以重新赋值
      this.editFormFields.Remark = '编辑重置默认值66666';
      //给明细表添加默认一行
      this.$refs.detail.rowData.push({ Remark: "编辑666666" });
      return true;
    },
    importAfter(data) { //导入excel后刷新table表格数据
      this.search(); //刷新table
    },
    modelOpenBefore(row) { //点击编辑/新建按钮弹出框前，可以在此处写逻辑，如，从后台获取数据

    },
    async modelOpenBeforeAsync(row) { //点击编辑/新建按钮弹出框前，可以在此处写逻辑，如，从后台获取数据
      //2021.01.10
      if (row) {
        console.log("编辑操作")
      } else {
        console.log("新建操作")
      }
      //打开弹出框前，http请求同步执行
      // var _result = await this.http.post("url", {}, true).then(result => {

      //   _result = result;
      // })
      // console.log(result);
      //返回false不会弹出框 
      //this.$message.error("不能打开弹出框 ");
      return true;
    },
    getFormOption(field) {
      let option;
      this.editFormOptions.forEach(x => {
        x.forEach(item => {
          if (item.field == field) {
            option = item;
          }
        })
      })
      return option;
    },

    //方式2,通过打开弹出框时触发显示与隐藏
    modelOpenAfter(row) {  //编辑或新建时，根据不同的情况控制字段是否显示 
      //   this.editFormOptions.forEach(x => {
      //     x.forEach(item => {
      //       if (item.field == "Remark" || item.field == "SellNo") {
      //         //如果不是新建，则隐藏Remark,SellNo两个字段是否显示 
      //          //也可以根据row当前编辑行的值来处理
      //         this.$set(item, "hidden", this.currentAction != "Add")
      //       }
      //     })
      //   })
    },
    rowClick({ row, column, event }) { //查询界面table点击行选中当前行
      this.$refs.table.$refs.table.toggleRowSelection(row);
    },
    // detailRowClick ({ row, column, event }) {
    //   //编辑弹出框从表table点击行选中当前行，没有从表的不用管
    //   this.$refs.detail.$refs.table.toggleRowSelection(row);
    // }
  }
};
export default extension;
