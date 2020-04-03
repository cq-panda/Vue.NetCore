import test from "./App_Expert/App_ExpertModelBody.vue";
let extension = {
  components: {//动态扩充组件或组件路径
    //表单header、content、footer对应位置扩充的组件
    gridHeader: '',//{ template: "<div>扩展组xx件</div>" },
    gridBody: '',
    gridFooter: '',
    //弹出框(修改、编辑、查看)header、content、footer对应位置扩充的组件
    modelHeader: "",//test,//此处可以根据实际情况同步引用也可以异步引用() => import("./App_Expert/App_ExpertModelBody.vue"),
    modelBody: '',
    modelFooter: ''
  },
  text: "代码生成器中，如果字段是图片地址或文件，选择[table列显示类型]即可",
  buttons: {
    box:[] //新建、编辑弹出框按钮

  },//扩展的按钮
  methods: {//事件扩展
    onInit() {
      this.boxOptions.height = document.documentElement.clientHeight * 0.8;
      //启用多图上传,其他上传参数，参照volupload组件api
      this.editFormOptions.forEach(x => {
        x.forEach(item => {
          if (item.field == 'HeadImageUrl') {
           // item.type = 'file';
            //设置成100%宽度
            item.colSize = 12;
            item.multiple = true;
            //最多可以上传3张照片
            item.maxFile = 3;
            //限制图片大小，默认3M
            item.maxSize = 3;
            item.append = true;
          }
        })
      })
    },
    modelOpenBefore(row) {
      this.boxButtons.forEach(x => {
        if (x.name == '保 存') {
          //    x.hidden = this.currentAction == this.const.ADD
        }
        // if (x.name == '重 置') x.disabled = true;
      })
    },
    modelOpenAfter(row) {
      if (this.$refs.modelBody) {
        return console.log('forminited');
      }
      console.log('form_undefined');
    }
  }
};
export default extension;
