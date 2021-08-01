
import { h, resolveComponent, defineAsyncComponent } from 'vue';
let extension = {
  components: {//动态扩充组件或组件路径
    gridHeader: "",
    gridBody: {
      render() {
        return h(resolveComponent('ElAlert'), {
          style: { 'margin-bottom': '12px' },
          'show-icon': true,
          closable: false,
        }, [h('p', {}, '1、此界面与上面的区别是：多个明细表在弹出框进行的扩展,见App_ReportPrice.js(点击新建或编辑即可查看效果)'),
        h('p', {}, ' 2、手动创建一个页面(可以写任意代码)，引入到App_ReportPrice.js的modelBody位置')]);
      }
    },
    gridFooter: '',
    modelHeader: '',
    //通过defineAsyncComponent异步引用
    modelBody: defineAsyncComponent(() => (import("./App_ReportPrice/App_ReportPriceModelBody.vue"))),
    modelFooter: ''
  },
  buttons: [],//扩展的按钮
  text: "弹出框一对多明细",
  methods: {//事件扩展
    onInit() {
    },
    onInited() {
      //初始化后将table高度减少85,因为gridHeader加了提示会导致页面有滚动条
      this.height = this.height - 100;
      //自定义弹出框的高与宽
      this.boxOptions.height = document.documentElement.clientHeight * 0.9;
      this.boxOptions.width = document.documentElement.clientWidth * 0.8;
    },
    modelOpenAfter() {//打开弹出框时
      //是否子组件渲染完成
      if (this.$refs.modelBody) {
        //新建功时，清空 清空,从表1，从表2的数据
        if (this.currentAction == 'Add') {
          this.$refs.modelBody.$refs.table1.reset();
          //(组件可能还没加载)
          if (this.$refs.modelBody.$refs.table2) {
            this.$refs.modelBody.$refs.table2.reset();
          }
        } else {
          //编辑时，加载从表1，从表2的数据
          this.$refs.modelBody.$refs.table1.load();
          //(组件可能还没加载)
          if (this.$refs.modelBody.$refs.table2) {
            this.$refs.modelBody.$refs.table2.load();
          }
        }
      }
    },
    addBefore(formData) { //弹出框新建或编辑功能点保存时可以将从表1，从表2的数据提到后台
      this.setFormData(formData);
      return true;
    },
    updateBefore(formData) { //编辑时功能点保存时可以将从表1，从表2的数据提到后台
      this.setFormData(formData);
      return true;
    },
    setFormData(formData) { //新建或编辑时，将从表1、2的数据提交到后台,见后台App_ReportPriceService的新建方法
      //后台从对象里直接取extra的值
      let extra = {
        table1List: this.$refs.modelBody.$refs.table1.rowData,//获取从表1的行数据
        table2List: this.$refs.modelBody.$refs.table2.rowData//获取从表2的行数据
      }
      formData.extra = JSON.stringify(extra);
    },
    resetUpdateFormAfter() { //编辑弹出框时，点重置时，可自定义重置
      console.log('resetUpdateFormAfter')
      return true;
    },
    resetAddFormAfter() { //新建弹出框时，点重置时，可自定义重置
      console.log('resetAddFormAfter')
      return true;
    }
  }
};
export default extension;
