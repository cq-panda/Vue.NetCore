
import { h, resolveComponent } from 'vue';
import modelBody from "./vSellOrderImg/vSellOrderImgModelBody.vue"
let extension = {
  components: {//动态扩充组件或组件路径
    gridHeader: '',
    gridBody: {
      render() {
        return h(resolveComponent('el-alert'), {
          type: "success",
          style: { 'margin-bottom': '12px' },
          'show-icon': false,
          closable: false,
        }, '点击新建、编辑弹出框，可以对明细表进行上传文件或者图片操作，见vSellOrderImg.js')
      }
    },
    gridFooter: '',
    modelHeader: "",
    //点击上传图片的弹出框
    modelBody: modelBody,
    modelFooter: "",
  },
  text: "一对一从表编辑上传图片",
  methods: {
    onInit() {
    },
    onInited() {
      this.height = this.height - 56;
      //获取图片位置，在图片后面加一个上传按钮,这里只是演示随便找的一个字段存图片
      let _index = this.detailOptions.columns.findIndex(x => { return x.field == 'Remark' });

      //这里只是演示，实际操作在代码生成器table显示类型设置为图片后这里就不用操作了
      //代码生成器中编辑行号设置为0，不要设置为大于0的数据
      this.detailOptions.columns[_index].edit = null;
      this.detailOptions.columns[_index].type = 'img';
      this.detailOptions.columns[_index].title = '图片';

      //从表动态添加一列(上传图片列),生成上传图片、与删除图片操作
      this.detailOptions.columns.splice(_index, 0, {
        field: "随便写",
        title: "上传图片",
        width: 150,
        align: "center",
        render: (h, { row, column, index }) => {
          //下面所有需要显示的信息都从row里面取出来
          return h(
            "div", { style: { color: '#0c83ff', 'font-size': '13px', cursor: 'pointer' } },
            [
              h(
                "i", {
                style: { 'margin-right': '10px' },
                class:['el-icon-upload'],
                onClick: (e) => {
                  e.stopPropagation();
                  //记住当前操作的明细表行数据
                  //如果原来有图片,上传图片界面把原来的图片也显示出来
                  let fileInfo = (row.Remark || '').split(",").filter(x => { return x }).map(img => {
                    //(生成文件格式) fileInfo格式参数，见volupload组件
                    return { path: img, name: "" };
                  })
                  this.$refs.modelBody.open(fileInfo, row)
                }
              }, [], '上传图片'
              ),
              h('i', {
                class: ['el-icon-delete'], onClick: (e) => {
                  e.stopPropagation(); row.Remark = ''
                }
              }, '删除图片')
            ])
        },
      })
    }
  }
};
export default extension;
