
import gridHeader from './App_Expert/App_ExpertGridHeader'
//声明vue对象
let $this;
let extension = {
  components: {
    gridHeader:``,
    gridBody:  { template: '<Alert type="success">复杂table内容，适用于table列较多的情况可以将列合并在一起显示(代码生成后，在对应js文件中设置合并显示信息)</Alert>'},
    gridFooter: '',
    modelHeader: '',
    modelBody: '',
    modelFooter: ''
  }, //动态扩充组件或组件路径
  buttons: {
    view: []
  },
  methods: { //事件扩展
    onInit() {
      this.initFirstColumn();
      this.initColor();
      this.initColumnButton();
    },
    onInited(){
      this.height= this.height-40;
    },
    initColor() {
      var _index = this.columns.findIndex(x => { return x.field == "Enable" });
      if (_index == -1) {
        return;
      }
      this.columns.splice(_index, 1, {
        title: "状态",
        field: "状态",
        with: 60,
        formatter: (row) => {
          var _color = row.Enable == 1 ? '#ff1212' : '#04c966';
          return `<span style='background:` + _color + `;
          width: 8px;
          height: 8px;
          position: absolute;
          border-radius: 50%;
          margin-left: 7px;'>&nbsp;</span>`
        }
      })
    },
    initFirstColumn() {
      //在第一行后面动态添加一行
      this.columns.splice(1, 0, {
        title: "用户信息",
        field: "用户信息",
        width: 220,
        render: (h, { row, column, index }) => {
          //下面所有需要显示的信息都从row里面取出来
          return h(
            "div",
            {
              style: { display: "flex", cursor: 'pointer', },
              on: {
                click: () => { }
              }
            },
            [

              h(
                "img",
                {
                  attrs: { src: this.http.ipAddress + row.HeadImageUrl },
                  style: { "width": "70px", height: "90px", "object-fit": "cover" },
                },
                ""
              ),
              h(
                "div",
                {
                  props: {},
                  style: { "margin-left": "15px" },
                },
                [
                  h("div", { style: { "font-size": "12px", "color": "#459fff", "margin-bottom": "8px", "font-weight": "bold" } },
                    [h("span", {}, row.ReallyName),
                    h("span", { style: { "margin-left": "20px" } }, row.Enable == "1" ? '在线' : "离线")]
                  ),
                  h("div", { style: { "font-size": "12px", "color": "#459fff", 'line-height': '20px' } }, row.IDNumber || '无身份证信息'),
                  h("div", { style: { "font-size": "12px", "color": "#459fff", 'line-height': '20px' } }, "电话：" + row.PhoneNo),
                  h("div", { style: { "font-size": "12px", "color": "#459fff", 'line-height': '20px' } }, "城市：" + row.City),
                ]
              )])
        }
      })
    },
    initColumnButton() {
      this.columns.push({
        title: '操作',
        fixed: 'right',
        width: 70,
        render: (h, { row, column, index }) => {
          return h(
            "div", { style: {} }, [
            h(
              "a", {
              props: {},
              style: {"border-bottom": "1px solid"},
              on: {
                click: (e) => {
                  e.stopPropagation()
                this.add();
                }
              }
            },
              "添加"
            ),
            h(
              "a", {
              props: {},
              style: {"margin-left":"9px","border-bottom": "1px solid"},
              on: {
                click: (e) => {
                  e.stopPropagation()
                  this.linkData(row);
                }
              }
            },
              "修改"
            ),
          ])
        }
      })
    }

  }
};
export default extension;