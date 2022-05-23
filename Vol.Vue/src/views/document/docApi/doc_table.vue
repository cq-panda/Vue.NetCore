<template>
  <div>
    <div class="i-text">
      <h2>组件引入方式</h2>
    </div>
    <pre class="bg-ms">
        <code>
        import VolTable from "@/components/basic/VolTable.vue";
        </code>
    </pre>
    <vol-box
      :model.sync="viewModel"
      title="远程加载table数据"
      icon="md-podium"
      :height="450"
      :width="600"
    >
      <div
        style="display: block; word-break: break-all; word-wrap: break-word"
        slot="content"
      >
        {{ text }}
      </div>
      <div slot="footer">
        <Button type="info" @click="viewModel = false">确认</Button>
      </div>
    </vol-box>

    <div class="vol-demo">
      <VolHeader icon="md-podium" text="双击编辑(1)">
        <div slot="content">
          双击编辑行数据，点击只读的单元格/其他行或者表头结束编辑
        </div>
      </VolHeader>
      <vol-table
        ref="editTable1"
        :columns="clickEditTableOptions.columns"
        :max-height="270"
        :index="true"
        :tableData="clickEditTableOptions.data"
        :pagination-hide="true"
        :click-edit="true"
        :endEditBefore="endEditBefore"
        :endEditAfter="endEditAfter"
        :beginEdit="beginEdit"
      ></vol-table>
      <!-- <div>
        <docParamTable name="edittable" :onlyCode="true"></docParamTable>
      </div>-->
      <br />
      <div>
        <Button
          type="info"
          @click="
            () => {
              this.viewCode = true;
              this.code = this.sourceCode.editTable1;
            }
          "
          >查看代码</Button
        >
      </div>
    </div>
    <br />
    <br />

    <div class="vol-demo">
      <VolHeader icon="md-podium" text="双击编辑(2)">
        <div slot="content">
          (与上面的区别，鼠标离开后结束编辑)可设置属性对数据合法性进行校验..
        </div>
        <div style="text-align: right">
          <Button type="info" size="small" ghost @click="clear">清空表</Button>
          <Button type="info" size="small" ghost @click="del">删除行</Button>
          <Button type="info" size="small" ghost @click="add">添加行</Button>
          <Button type="info" size="small" ghost @click="getRows"
            >获取选中的行</Button
          >
        </div>
      </VolHeader>
      <vol-table
        ref="editTable"
        :columns="editTableOptions.columns"
        :height="270"
        :index="true"
        :tableData="editTableOptions.data"
        :pagination-hide="true"
      ></vol-table>
      <!-- <div>
        <docParamTable name="edittable" :onlyCode="true"></docParamTable>
      </div>-->
      <br />
      <div>
        <Button
          type="info"
          @click="
            () => {
              this.viewCode = true;
              this.code = this.sourceCode.edittable;
            }
          "
          >查看代码</Button
        >
      </div>
    </div>
    <br />
    <br />

    <div class="vol-demo keep-edit">
      <VolHeader icon="md-podium" text="始终开启编辑">
        <div slot="content">
          配置columns属性edit.keep=true即可始终开启编辑状态..
        </div>
        <div style="text-align: right">
          <Button type="info" size="small" ghost>还没好想好</Button>
        </div>
      </VolHeader>
      <vol-table
        ref="table3"
        :columns="allowTable.columns"
        :height="250"
        :index="true"
        :tableData="allowTable.data"
      ></vol-table>
      <!-- <div>
        <docParamTable name="edittable" :onlyCode="true"></docParamTable>
      </div>-->
      <br />
      <div>
        <Button
          type="info"
          @click="
            () => {
              this.viewCode = true;
              this.code = this.sourceCode.editTableKeep;
            }
          "
          >查看代码</Button
        >
      </div>
    </div>
    <br />
    <br />

    <div class="vol-demo">
      <VolHeader icon="md-apps" text="使用button编辑,render动态渲染单元格">
        <div slot="content">通过button编辑与额外标签事件</div>
      </VolHeader>
      <vol-table
        ref="table1"
        :doubleEdit="false"
        :columns="eidtWithButton.columns"
        :max-height="200"
        :index="true"
        :tableData="eidtWithButton.data"
        :paginationHide="true"
      ></vol-table>
      <!-- <div>
        <docParamTable name="btnedittable"></docParamTable>
      </div>-->
      <br />
      <div>
        <Button
          type="info"
          @click="
            () => {
              this.viewCode = true;
              this.code = this.sourceCode.btnedittable;
            }
          "
          >查看代码</Button
        >
        <Button
          type="info"
          @click="
            () => {
              this.viewCode = true;
              this.code = this.sourceCode.btnedittable3;
            }
          "
          >查看vue3代码</Button
        >
      </div>
    </div>
    <br />
    <br />
    <div class="vol-demo" style="padding:0;">
      <table3></table3>
    </div>
    <div>
        <Button
          type="info"
          @click="
            () => {
              this.viewCode = true;
              this.code = this.sourceCode.searchTable;
            }
          "
          >查看代码</Button
        >
        <Button
          type="info"
          @click="
            () => {
              this.viewCode = true;
              this.code = this.sourceCode.searchTable3;
            }
          "
          >查看vue3代码</Button
        >
      </div>
      <docParamTable name="voltable"></docParamTable>
    <br />
    <br />
    <VolBox
      icon="ios-chatbubbles"
      :model.sync="viewCode"
      title="table代码"
      :height="550"
      :width="1000"
      :padding="15"
    >
      <div v-html="code"></div>
      <!-- footer 这里不写，默认有一个关闭按钮 -->
    </VolBox>

    <VolBox
      icon="ios-chatbubbles"
      :model.sync="model"
      title="选择图片"
      :height="220"
      :url="url"
      :width="520"
      :desc="true"
      :padding="15"
    >
      <VolUpload
        style="text-align: center; border: 1px dotted #ff9800; padding: 20px"
        :autoUpload="false"
        :multiple="true"
        :url="url"
        :max-file="3"
        :img="true"
        :fileInfo="fileInfo"
        :upload-after="uploadAfter"
      >
        <div>选择图片</div>
      </VolUpload>
    </VolBox>
  </div>
</template>
<script>
import VolBox from "@/components/basic/VolBox.vue";
import VolTable from "@/components/basic/VolTable.vue";
import VolUpload from "@/components/basic/VolUpload.vue";
import VolHeader from "@/components/basic/VolHeader.vue";
import docParamTable from "./doc_ParamTable.vue";
import table3 from "../../tables/table3";
import { editTable, remoteColumns } from "./doc_tableOptions.js";
import sourceCode from "./sourceCode.js";
let $doc_vue;
let doc_options = {
  components: { VolTable, VolBox, docParamTable, VolHeader, VolUpload, table3 },
  data() {
    return {
      //查询条件字段
      searchFields: {
        CreateDate1: "",
        CreateDate2: "",
        UserName: "",
      },
      url2: "api/App_Expert/getPageData",
      url: "/api/app_news/upload", //使用后台自带的上传文件方法，也可以自定义方法上传
      uploadRow: {},
      fileInfo: [],
      model: false,
      editTableOptions: {
        data: editTable.data,
        columns: [],
      },
      clickEditTableOptions: {
        data: [
          //表数据
          {
            ExpertId: 276,
            NotNull: "还没想好",
            LimitNumber: 5,
            EventClick: "不午休的猫",
            FormatString: "2019-11-08",
            Enable: 0,
            CreateDate: "2018-09-18 17:45:54",
          },
          {
            ExpertId: 276,
            NotNull: "往事已成风",
            LimitNumber: 5,
            EventClick: "此单元格不能编辑",
            FormatString: "2019-11-09",
            Enable: 1,
            CreateDate: "2020-22-18 17:45:54",
          },
        ],
        columns: [
          //表配置
          {
            field: "ExpertId", //数据库表字段,必须和数据库一样，并且大小写一样
            title: "主键ID", //表头显示的名称
            isKey: true, //是否为主键字段
            hidden: true, //是否显示
          },
          {
            field: "NotNull",
            title: "不可为空",
            width: 70,
            required: true,
            edit: { type: "text" },
            sortable: true, //是否排序(目前第一个字段为排序字段，其他字段排序开发中)
          },
          {
            field: "LimitNumber",
            title: "数字大小",
            summary: true, //设置求和，并可以实时计算
            width: 70,
            require: true,
            edit: { type: "number", min: 3, max: 5 },
          },
          {
            field: "EventClick",
            title: "不可编辑",
            type: "string",
            width: 80,
            require: true,
            cellStyle: (row, rowIndex, columnIndex) => {
              if (row.EventClick == "不午休的猫") {
                return { background: "#2196F3", color: "#ffff" };
              }
            },
          },
          {
            field: "FormatString",
            title: "格式化日期",
            width: 90,
            require: true,
            formatter: (row) => {
              //对单元格的数据格式化处理
              if (!row.FormatString) {
                return;
              }
              return row.FormatString.replace(/-/g, ".");
            },
          },
          {
            field: "Enable",
            title: "自动绑定KeyValue",
            type: "byte",
            bind: { key: "enable", data: [] }, //此处值为data空数据，自行从后台字典数据源加载
            width: 110,
            edit: { type: "switch" },
          },
          {
            field: "CreateDate",
            title: "日期",
            type: "datetime",
            width: 110,
            edit: { type: "datetime" },
          },
        ],
      },
      viewModel: false,
      viewCode: false,
      text: "",
      code: "",
      sourceCode: sourceCode,
      table: {
        columns: [],
        url: "api/App_Expert/getPageData",
        pagination: {
          total: 0, //分页总数量
          size: 30, //分页大小,30,60,100.
          sortName: "CreateDate", //从后加载数据分页时的排序字段
        },
      },
      icon: "md-male",
      text: "主题名称",
      allowTable: {
        data: [
          {
            userName: "拉美西斯",
            imgs:
              "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x2.jpg",
            enable: 1,
            date: "2020-03-18 17:45:54",
          },
          {
            userName: "梁什么伟",
            imgs:
              "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x2.jpg",
            enable: 0,
            date: "2020-03-20 12:20:30",
          },
        ],
        columns: [
          {
            field: "userName",
            title: "用户名",
            require: true,
            edit: { type: "text", keep: true },
            width: 150,
          },
          {
            field: "imgs",
            title: "图文介绍",
            type: "img",
            width: 200,
          },
          {
            field: "upload",
            title: "上传头像",
            width: 160,
            formatter: () => {
              return "<div class='img-btn'>选择图片</div>";
            },
            click: (row, column, event) => {
              this.uploadRow = row; //记录当前上传图片的行
              //清空上传组件的默认图片
              this.fileInfo.splice(0);
              //如果当前的row行有图片，直接将图片添加上传组件中
              if (row.imgs) {
                let _imgs = row.imgs.split(",");
                for (let i = 0; i < _imgs.length; i++) {
                  this.fileInfo.push({ path: _imgs[i], name: "11" });
                }
              }
              this.model = true;
            },
          },
          {
            field: "enable",
            title: "是否可用",
            require: true,
            width: 130,
            edit: { type: "switch", keep: true },
            bind: {
              //如果后面返回的数据为数据源的数据，请配置此bind属性，可以从后台字典数据源加载，也只以直接写上
              key: "audit",
              data: [
                { key: 0, value: "否" },
                { key: 1, value: "是" },
              ],
            },
            onChange: (row, column, data, value) => {
              this.$Message.info(value ? "是" : "否");
            },
          },
          {
            field: "date",
            title: "日期",
            edit: { type: "datetime", keep: true },
            width: 150,
          },
          {
            field: "save",
            title: "操作",
            width: 150,
            formatter: () => {
              return "<div  class='oper-btn'>保存</div>";
            },
            click: (row, column, event) => {
              this.$Message.info("当前保存的行数据：" + JSON.stringify(row));
            },
          },
        ],
      },
      /////////////////////////button编辑配置///////////////////
      eidtWithButton: {
        data: [
          {
            test1: "123",
            test2: "1",
            test3: "789",
            test4: "2018-09-18 17:45:54",
            test5: "123",
          },
          {
            test1: "123x",
            test2: "0",
            test3: "789x",
            test4: "2020-01-18 13:24:26",
            test5: "123x",
          },
        ],
        columns: [
          {
            field: "test1",
            title: "测试1",
            require: true,
            edit: { type: "text", min: 5, max: 7 },
            extra: {
              icon: "ios-search",
              text: "点击可触发事件",
              style: "line-height: 31px;margin-left: 11px;",
              click: (column, row, tableData) => {
                //  this.getRows();
                this.$Message.error("点击标签触发的事件");
              },
            },
            width: 80,
          },
          {
            field: "test2",
            title: "测试2",
            require: true,
            edit: { type: "select" },
            onChange: (column, row, tableData) => {
              this.$Message.error(row["test2"]);
            },
            bind: {
              //如果后面返回的数据为数据源的数据，请配置此bind属性，可以从后台字典数据源加载，也只以直接写上
              key: "audit",
              data: [
                { key: "0", value: "否" },
                { key: "1", value: "是" },
              ],
            },
            width: 130,
          },
          {
            field: "test3",
            title: "测试3",
            width: 160,
          },
          {
            title: "render动态生成组件",
            width: 220,
            render: (h, { row, column, index }) => {
              return h("div", { style: {} }, [
                h(
                  "a",
                  {
                    props: { },
                    style: {},
                    on: {
                      click: (e) => {
                        e.stopPropagation();
                        //弹出框编辑
                        this.$Notice.open({
                          title: "当前操作的行",
                          desc: JSON.stringify(row),
                        });
                      },
                    },
                  },
                  "render按钮"
                ),
                h(
                  "a",
                  {
                    props: { },
                    style: { "margin-left": "10px" },
                    on: {
                      click: (e) => {
                        e.stopPropagation();
                        this.$Notice.open({
                          title: "当前操作的行",
                          desc: JSON.stringify(row),
                        });
                      },
                    },
                  },
                  "审核"
                ),
                h(
                  "Dropdown",
                  {
                    props: {
                      transfer: true,
                    },
                    style: {
                      "margin-left": "10px",
                    },
                    on: {
                      "on-click": (name) => {
                        this.$Message.info(name);
                      },
                    },
                  },
                  [
                    h("a", {}, [
                      "更多",
                      h("Icon", { props: { type: "ios-arrow-down" } }),
                    ]),
                    h("DropdownMenu", { slot: "list" }, [
                      h("DropdownItem", { props: { name: "明细" } }, "明细"),
                      h("DropdownItem", { props: { name: "签收" } }, "签收"),
                      h(
                        "DropdownItem",
                        { props: { name: "bubu.." } },
                        "bubu.."
                      ),
                    ]),
                  ]
                ),
              ]);
            },
          },
          {
            field: "test5",
            title: "测试5",
            width: 300,
          },
        ],
      },
      columns: [
        //表配置
        {
          field: "ExpertId", //数据库表字段,必须和数据库一样，并且大小写一样
          title: "主键ID", //表头显示的名称
          type: "int", //数据类型
          isKey: true, //是否为主键字段
          hidden: true, //是否显示
          align: "left", //文字显示位置
        },
        {
          field: "HeadImageUrl",
          title: "头像",
          type: "img",
          width: 160,
        },
        {
          field: "UserName",
          title: "申请人帐号",
          width: 120,
          sort: true,
        },
        {
          field: "UserTrueName",
          title: "申请人",
          sort: true,
          width: 120,
        },
        {
          field: "Enable",
          title: "是否启用",
          sort: true,
          bind: { key: "enable", data: [] }, //此处值为data空数据，自行从后台字典数据源加载
          width: 80,
        },
        {
          field: "ReallyName",
          title: "真实姓名",
          sort: true,
          width: 120,
          click: (row, column) => {
            //单元格点击事亻
            let msg =
              "此处可以自己自定格式显示内容,此单元格原始值是:【" +
              row.ReallyName +
              "】";
            this.$message.error(msg);
          },
          formatter: () => {
            //对单元格的数据格式化处理
            return "<a>点我</a>";
          },
        },
        {
          field: "CreateDate",
          title: "申请时间",
          sort: true,
          width: 150,
        },
      ],
    };
  },

  mounted() {
    this.$refs.editTable1.summaryData[2] = 10;
  },
  created() {
    remoteColumns[5].click = (row, column) => {
      //单元格点击事亻
      let msg =
        "此处可以自己自定格式显示内容,此单元格原始值是:【" +
        row.ReallyName +
        "】";
      this.$Message.error(msg);
    };
    this.table.columns.push(...remoteColumns);
    this.editTableOptions.columns.push(...editTable.columns);
    this.editTableOptions.columns[5].click = (row, column) => {
      //单元格点击事亻
      this.$Message.error(
        "此单元格没有设置编辑属性。如果columns写在配置js中，拿不到this，请在created方法动态添加click方法"
      );
    };
    this.editTableOptions.columns[5].formatter = (row, column) => {
      //单元格点击事亻
      return "<a>" + row[column.field] + "</a>";
    };
    $doc_vue = this;
  },
  methods: {
    viewRow(row, column) {
      this.text =
        "点击单元格的弹出框，当前点击的行数据：" + JSON.stringify(row);
      this.viewModel = true;
      //  this.$message.error(JSON.stringify(row));
    },
    loadTableBefore(param, callBack) {
      //此处是从后台加数据前的处理，自己在此处自定义查询条件,查询数据格式自己定义或参考代码生成器查询页面请求的数据格式
      console.log("加载数据前" + param);
      callBack(true); //此处必须进行回调，返回处理结果，如果是false，则不会执行后台查询
    },
    loadTableAfter(data, callBack) {
      //此处是从后台加数据后，你可以在渲染表格前，预先处理返回的数据
      console.log("加载数据后" + data);
      callBack(true); //同上
    },
    remoteLoad() {
      //此处可以自定义查询条件,如果不调用的框架的查询，格式需要自己定义，
      //如果查询的是框架getPageData方法,需要指定格式,如:
      // let where={wheres:[{"name":"UserTrueName","value":"教兽",displayType:"text"}]};
      let where = {};
      this.$refs.table.load(where);
    },
    del() {
      let rows = this.$refs.editTable.getSelected();
      if (rows.length == 0) {
        return this.$Message.error("请先选中行");
      }
      this.$refs.editTable.delRow();
    },
    clear() {
      this.editTableOptions.data.splice(0);
    },
    add() {
      this.editTableOptions.data.push({});
    },
    getRows() {
      let rows = this.$refs.editTable.getSelected();
      if (rows.length == 0) {
        return this.$Message.error("请先选中行");
      }
      this.$Message.error(JSON.stringify(rows));
    },
    uploadAfter(result, files) {
      if (!result.status) return true;
      let imgs = [];
      files.forEach((x) => {
        imgs.push(result.data + x.name);
      });
      // //将图片填写表格中
      this.uploadRow.imgs = imgs.join(",");
      //强制刷新表格数据
      let _rows = this.allowTable.data.splice(0);
      this.allowTable.data.push(..._rows);
      this.model = false;
      return true;
    },
    beginEdit(row, column, index) {
      console.log("编辑开始前" + JSON.stringify(row));
      return true;
    },
    endEditBefore(row, column, index) {
      console.log("结束编辑前" + JSON.stringify(row));
      return true;
    },
    endEditAfter(row, column, index) {
      console.log("结束编辑后" + JSON.stringify(row));
      return true;
    },
    //点击查询时生成查询条件
    loadTableBefore2(param, callBack) {
      //此处是从后台加数据前的处理，自己在此处自定义查询条件,查询数据格式自己定义或参考代码生成器查询页面请求的数据格式
      console.log("加载数据前" + param);
      //生成查询条件
      param.wheres = [
        //设置为like模糊查询
        {
          name: "UserName",
          value: this.searchFields.UserName,
          displayType: "like",
        },
        //设置日期查询>=、<=
        {
          name: "CreateDate",
          value: this.searchFields.CreateDate1,
          displayType: "thanorequal",
        },
        {
          name: "CreateDate",
          value: this.searchFields.CreateDate2,
          displayType: "lessorequal",
        },
      ];
      callBack(true); //此处必须进行回调，返回处理结果，如果是false，则不会执行后台查询
    },
    loadTableAfter2(data, callBack) {
      //此处是从后台加数据后，你可以在渲染表格前，预先处理返回的数据
      console.log("加载数据后" + data);
      callBack(true); //同上
    },
    load2() {
      //此处可以自定义查询条件,如果不调用的框架的查询，格式需要自己定义，
      //如果查询的是框架getPageData方法,需要指定格式,如:
      // let where={wheres:[{"name":"UserTrueName","value":"教兽",displayType:"text"}]};
      let where = {};
      this.$refs.table.load(where);
    },
    del2() {
      let rows = this.$refs.table.getSelected();
      if (rows.length == 0) {
        return this.$message.error("请先选中行");
      }
      this.$refs.table.delRow();
      //此处可以接着写删除后台的代码
    },
    getRows2() {
      let rows = this.$refs.table.getSelected();
      if (rows.length == 0) {
        return this.$message.error("请先选中行1");
      }
      this.text = "当前选中的行数据：" + JSON.stringify(rows);
      this.viewModel = true;
      return rows;
    },
  },
};
export default doc_options;
</script>

<style lang="less" scoped>
.vol-demo {
  box-shadow: 0px 0px 10px #ccc9c9;
  padding: 23px;
}
</style>

<style scoped>
.keep-edit >>> .oper-btn,
.keep-edit >>> .img-btn {
  width: 75px;
  border-radius: 4px;
  padding: 2px 15px;
  background: #eee;
  color: #fff;
  background-color: #03a9f4;
  border-color: #19be6b;
  text-align: center;
  font-size: 12px;
  line-height: 24px;
  cursor: pointer;
}
.keep-edit >>> .oper-btn {
  background-color: #19be6b;
}
</style>
