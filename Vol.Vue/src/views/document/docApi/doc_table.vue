<template>
  <div>
    <div class="i-text">
      <h2>组件引入方式</h2>
    </div>
    <pre class="bg-ms">
        <code>
        import Icons from "@/components/basic/VolTable.vue";
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
        style="display: block;word-break: break-all;word-wrap: break-word;"
        slot="content"
      >{{text}}</div>
      <div slot="footer">
        <Button type="info" @click="viewModel=false">确认</Button>
      </div>
    </vol-box>
    <div>
      <VolHeader icon="md-podium" text="双击编辑">
        <div slot="content">可设置属性对数据合法性进行校验..</div>
        <div style="text-align: right;">
          <Button type="info" size="small" ghost @click="clear">清空表</Button>
          <Button type="info" size="small" ghost @click="del">删除行</Button>
          <Button type="info" size="small" ghost @click="add">添加行</Button>
          <Button type="info" size="small" ghost @click="getRows">获取选中的行</Button>
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
          @click="()=>{this.viewCode=true;this.code=this.sourceCode.edittable}"
        >查看代码</Button>
      </div>
    </div>
    <br />
    <br />
    <br />
    <br />

    <div>
      <VolHeader icon="md-apps" text="使用button编辑">
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
          @click="()=>{this.viewCode=true;this.code=this.sourceCode.btnedittable}"
        >查看代码</Button>
      </div>
    </div>
    <br />
    <br />
    <br />
    <br />

    <div style="margin-top: 30px;">
      <VolHeader icon="md-apps" text="从api加载数据">
        <div slot="content">还没想好..</div>
        <slot>
          <div style="text-align: right;">
            <Button type="info" ghost @click="remoteLoad" size="small">刷新表数据</Button>
          </div>
        </slot>
      </VolHeader>
      <vol-table
        ref="table"
        :loadKey="true"
        :linkView="viewRow"
        :columns="table.columns"
        :pagination="table.pagination"
        :pagination-hide="false"
        :max-height="450"
        :url="table.url"
        :index="true"
        @loadBefore="loadTableBefore"
        @loadAfter="loadTableAfter"
      ></vol-table>
    </div>
    <div>
      <docParamTable name="voltable"></docParamTable>
    </div>
    <br />
    <br />
    <br />
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
  </div>
</template>
<script>
import VolBox from "@/components/basic/VolBox.vue";
import VolTable from "@/components/basic/VolTable.vue";
import VolHeader from "@/components/basic/VolHeader.vue";
import docParamTable from "./doc_ParamTable.vue";
import { editTable, remoteColumns } from "./doc_tableOptions.js";
import sourceCode from "./sourceCode.js";
let $doc_vue;
let doc_options = {
  data() {
    return {
      editTableOptions: {
        data: editTable.data,
        columns: []
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
          sortName: "CreateDate" //从后加载数据分页时的排序字段
        }
      },
      icon: "md-male",
      text: "主题名称",

      /////////////////////////button编辑配置///////////////////
      eidtWithButton: {
        data: [
          {
            test1: "123",
            test2: "1",
            test3: "789",
            test4: "2018-09-18 17:45:54",
            test5: "123"
          },
          {
            test1: "123x",
            test2: "0",
            test3: "789x",
            test4: "2020-01-18 13:24:26",
            test5: "123x"
          }
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
              }
            },
            width: 250
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
              data: [{ key: "0", value: "否" }, { key: "1", value: "是" }]
            },
            width: 130
          },
          {
            field: "test3",
            title: "测试3",
            width: 160
          },
          {
            field: "test4",
            title: "测试4",
            edit: { type: "datetime" },
            width: 250
          },
          {
            field: "test5",
            title: "测试5",
            width: 150
          }
        ]
      }
    };
  },
  components: { VolTable, VolBox, docParamTable, VolHeader },
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
    }
  }
};
export default doc_options;
</script>