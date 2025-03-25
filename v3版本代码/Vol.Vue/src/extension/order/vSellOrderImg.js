
let extension = {
  components: {//动态扩充组件或组件路径
    gridHeader: '',
    gridBody: {
      template: `<div>
      <Alert type="success" show-icon> <p style="color:red;">一对一从表编辑上传图片,点击编辑，从表点击[上传图片]</p></Alert></div>`},
    gridFooter: '',
    modelHeader: "",
    //点击上传图片的弹出框
    modelBody: () => import("./vSellOrderImg/vSellOrderImgModelBody.vue"),
    modelFooter: "",
  },
  text: "一对一从表编辑上传图片",
  methods: {
    onInit() {
      // 缓存当前对象，在vSellOrderImgModelBody.vue中会使用到
      //子组件中也可以使用this.$emit("parentCall", $vue => {})访问父组件替代
      this.$store.getters.getData().sellOrderImg = this;
    },
    onInited() {
      let _index = 0;
      let $this = this;
      //初始化一个空对象存储明细表编辑的行
      this.detailImgRow = {};
      this.height = this.height - 36;
      //获取图片位置，在图片后面加一个上传按钮
      for (let index = 0; index < this.detailOptions.columns.length; index++) {
        const element = this.detailOptions.columns[index];
        //找到图片显示的位置,此处将Remark字段当作图片字段
        if (element.field == "Remark") {
          _index = index;
          //设置单元格显示为图片,并禁止编辑
          Object.assign(element, { edit: null, type: 'img', title: '图片' });
        }
      }

      //从表动态添加一列(上传图片列)
      this.detailOptions.columns.splice(_index, 0, {
        field: "随便写", title: "上传图片", width: 100,
        formatter: function () { return '<a class="oper-btn">选择图片</a>'; },
        //点击上传图片事件
        click: row => {
          $this.$refs.modelBody.fileInfo.splice(0);
          //点击弹出框上传图片时，初始化当前选中行的图片
          if (row.Remark) {
            row.Remark.split(",").forEach(img => {
              // fileInfo格式参数，见volupload组件
              $this.$refs.modelBody.fileInfo.push({ path: img, name: "" });
            })
          }
          //记录明细表当前操作的行
          $this.detailImgRow = row;
          //弹出自己写的vue弹出框(vSellOrderImgModelBody.vue)
          $this.$refs.modelBody.img_model = true;
        }
      })
    }
  }
};
export default extension;
