//如果嫌render双向绑定麻烦或内容太多，可以使用下面的方式
var $com;
var MyComponent = {
  data() { return { time: "" } },
  created() {
    $com = this;
  },
  methods: {
    btnClick() {
      this.$message.info(JSON.stringify($this.editFormFields))
    }
  },
  //创建自定义组件模板
  template: ` <div style="margin-bottom: 17px;">
            <div style="display: flex;">
              <label style="text-align: right;width: 100px;padding: 7px 12px 10px 0;color:red;">
                选择时间：
              </label>
              <TimePicker style="flex:1" type="time" :value="time" placeholder="Select time">
              </TimePicker>
              <div style="line-height: 33px;padding-left: 15px;color:red;">
                <Button @click="btnClick" type="primary">获取弹出框表单内容</Button>
                这里是render直接使用的html代码渲染的
              </div>
            </div>
          <div style="padding-left: 100px;margin-top: 10px;color: #0089ff;">
              动态render渲染出来的组件可以与当前页面互相调用,见modelOpenAfter与btnClick方法
          </div>
 </div>`
};
let $this;
let extension = {
  components: {
    gridHeader: '',
    gridBody: '',
    gridFooter: '',
    modelHeader: '',
    modelBody: '',
    modelFooter: ''
  }, //动态扩充组件或组件路径
  buttons: { box: [] },
  methods: { //事件扩展
    onInit() {
      //必须
      $this = this;
      //在表单配置的第二行后，将MyComponent组件添加到表单中
      this.editFormOptions.splice(2, 0, [{
        colSize: 12,
        render: () => {
          return h(MyComponent)
        }
      }])
    },
    modelOpenAfter(row) { //打开弹出框后给组件设置不同的值
      //调用render渲染的组件
      if (this.currentAction == "Add") {
        $com.time = "09:41:00";
      } else { //编辑
        $com.time = "23:22:00";
      }
    }
  }
};
export default extension;