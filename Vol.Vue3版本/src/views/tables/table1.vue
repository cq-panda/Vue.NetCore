<template>
  <div class="example-tb">
    <el-alert title="关于table使用" type="success" show-icon :closable="false">
      <p>1、VolTable基于Element Table封装的常用功能。</p>
      <p>
        2、功能包括，双击编辑：select、select联动、switch、日期、图片显示与预览、单元格文件下载、input、render动态渲染等组件。
      </p>
      <p>
        3、最重要的是,封装后的组件功能包括：自动绑定下拉框数据源、自动从后台加载数据、分页、及table输入验证等常用功能(只需要照着文档配置json即可完成)。
      </p>
      <p>
        4、具体使用见：框架文档->组件api->voltable。<a
          href="http://v2.volcore.xyz/document/api"
          target="_blank"
          >点击查看文档
        </a>
      </p>
    </el-alert>
    <div class="tb">
      <div class="btns" style="margin-bottom: 10px;">
        <el-button type="success" size="small" @click="getSelect"><i class="el-icon-check"></i>获取选中行</el-button>
  
           <el-button type="primary" size="small" @click="addRow"><i class="el-icon-plus"></i>添加行</el-button
        >
      </div>
              <!-- :single="true"设置为单选  -->
      <vol-table
        ref="table"
        :columns="columns"
        :max-height="500"
        :index="true"
        @rowClick="rowClick"
        :tableData="tableData"
        :paginationHide="true"
        :endEditBefore="endEditBefore"
        :endEditAfter="endEditAfter"
        @rowChange="rowChange"
        :single="true"
        :beginEdit="beginEdit"
      ></vol-table>
    </div>
    <el-alert
      style="margin-top: 15px"
      :closable="false"
      title="此示例给出了大部分功能所以代码比看起来比较多，可根据需要设置"
      type="info"
      show-icon
    >
    </el-alert>
    <br />
  </div>
</template>
<script>
/*********************此示例采用的vue2语法，也可以使用vue3语法***************************/

import VolTable from "@/components/basic/VolTable.vue";
import VolHeader from "@/components/basic/VolHeader.vue";
// import VolBox from "@/components/basic/VolBox.vue";
import { ref, getCurrentInstance } from "vue";
import VolUpload from "@/components/basic/VolUpload.vue";
export default {
  components: {
    VolTable,
    //VolBox,
    VolHeader,
    VolUpload,
  },
  setup() {},
  data() {
    return {
      url: "/api/app_news/upload", //使用后台自带的上传文件方法，也可以自定义方法上传
      text: "",
      tableData: [
        //表数据
        {
          ExpertId: 276,
          ExpertName: "时间管理大湿",
          HeadImageUrl:
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x3.jpg",
          UserName: "12345",
          UserTrueName: "孤独比夜还长 ",
          AuditStatus: 0,
          Enable: 1,
          ReallyName: "45678",
          CreateDate: "2018-09-18 17:45:54",
          Creator: 38.88,
        },
        {
          ExpertId: 276,
          ExpertName: "小短腿-鲁班",
          HeadImageUrl:
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x1.jpg",
          UserName: "56789",
          UserTrueName: "七秒钟的记忆",
          AuditStatus: 1,
          Enable: 1,
          ReallyName: "七秒钟的记忆1",
          CreateDate: "2018-09-18 17:45:54",
          Creator: 19.2,
        },
        {
          ExpertId: 276,
          ExpertName: "行走在冷风中",
          HeadImageUrl:
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x2.jpg",
          UserName: "13883",
          UserTrueName: "不午休的、猫 ",
          AuditStatus: 2,
          Enable: 0,
          ReallyName: "月穿潭底水無痕 ",
          CreateDate: "2018-09-18 17:45:54",
          Creator: 2.2,
        },
      ],
      columns: [
        //表配置
        {
          field: "ExpertId", //数据库表字段,必须和数据库一样，并且大小写一样
          title: "主键ID", //表头显示的名称
          type: "int", //数据类型
          isKey: true, //是否为主键字段
          width: 80, //表格宽度
          hidden: true, //是否显示
          readonly: true, 
          require: true, 
          align: "left"//文字显示位置left、center
        },
        {
          field: "ExpertName",
          title: "render动态渲染",
          type: "string",
          width: 100,
          require: true,
          align: "left",
          render: (h, { row, column, index }) => {
            return h("div", { style: {} }, [
              h("div", {}, [
                h("i", {
                  class: ["el-icon-zoom-out"],
                  style: {
                    cursor: "pointer",
                    "margin-right": "8px",
                    color: "#b1b1b1",
                  },
                  onClick: (e) => {
                    e.stopPropagation();
                    this.$Message.success("搜索按钮");
                  },
                }),
                h(
                  "a",
                  {
                    class: [],
                    style: {
                      cursor: "pointer",
                      color: "#3a8ee6",
                    },
                    onClick: (e) => {
                      e.stopPropagation();
                      //弹出框编辑
                      this.$message.success(row.ExpertName);
                    },
                  },
                  row.ExpertName
                ),
              ]),
            ]);
          },
        },
        {
          field: "HeadImageUrl",
          title: "头像",
          type: "img",
          width: 80,
          align: "left",
        },
        {
          field: "UserName",
          title: "长度限制",
          type: "string",
          //  link: true, //设置link=true后此单元格可以点击获取当前行的数据进行其他操作
          width: 70,
          require: true,
          edit: { type: "text", min: 3, max: 5 },
          align: "left",
        },
        {
          field: "UserTrueName",
          title: "不可编辑",
          type: "string",
          width: 100,
          align: "left",
          require: true,
          // edit: { type: "text", min: 4, max: 7 },
          click: (row, column) => {
            //单元格点击事亻
            this.$message.error("此单元格没有设置为可以编辑");
          },
          formatter: (row) => {
            //对单元格的数据格式化处理
            return row.UserTrueName;
          },
        },
        {
          field: "AuditStatus",
          title: "下拉框",
          type: "int",
          bind: {
            //如果后面返回的数据为数据源的数据，请配置此bind属性，可以从后台字典数据源加载，也只以直接写上
            key: "audit",
            data: [
              { key: 0, value: "审核中" },
              { key: 1, value: "审核通过" },
              { key: 2, value: "审核未通过" },
            ],
          },
          edit: { type: "select" },
          width: 100,
          align: "left",
          onChange: (row, column) => {
            this.$message.success(row.AuditStatus + "");
          },
        },
        {
          field: "Enable",
          title: "Switch",
          type: "byte",
          bind: { key: "enable", data: [] }, //会自动从后台字典数据源加载
          width: 70,
          require: true,
          align: "left",
          edit: { type: "switch", keep: true }, //keep始终开启编辑状态
          onChange: (val, row, column) => {
            this.$message.info("switch点击事件");
          },
        },
        {
          field: "CreateDate",
          title: "日期",
          type: "date",
          width: 140,
          align: "left",
          edit: { type: "date" }
        },
        {
          field: "Creator",
          title: "数字验证",
          type: "string",
          width: 90,
          onKeyPress: (row, column, $event) => {
            console.log(row);
          },
          edit: { type: "decimal", min: 2.2, max: 40 },
        },
        {
          field: "操作",
          title: "操作",
          width: 120,
          fixed: "right",
          align: "center",
          render: (h, { row, column, index }) => {
            return h("div", { style: {} }, [
              h("div", {}, [
                h(
                  "span",
                  {
                    class: [
                      "el-icon-edit el-tag el-tag--success el-tag--light",
                    ],
                    style: {
                      cursor: "pointer",
                      "margin-right": "8px",
                    },
                    onClick: (e) => {
                      e.stopPropagation();
                      //开启编辑
                      let _index = this.$refs.table.edit.rowIndex;
                      if (_index != -1) {
                        return this.$message.error(
                          "请先完成第" +
                            (_index + 1) +
                            "行的编辑,点击表头可完成编辑"
                        );
                      }
                      this.$refs.table.rowBeginEdit(row, column);
                    },
                  },
                  "编辑"
                ),
                h(
                  "span",
                  {
                    class: [
                      "el-icon-delete el-tag el-tag--danger el-tag--light",
                    ],
                    style: {
                      cursor: "pointer",
                    },
                    onClick: (e) => {
                      e.stopPropagation();
                      //删除行
                      this.tableData.splice(index, 1);
                      this.$message.success("删除成功");
                    },
                  },
                  "删除"
                ),
              ]),
            ]);
          },
        },
      ],
    };
  },
  methods: {
    rowChange(row) {
      //选中checkbox事件
      return this.$message.success("点击checkbox,第" + row.elementIndex + "行");
    },
    rowClick({ row, column, $event }) {
      //点击行事件
      return this.$message.success("点击的行：" + row.elementIndex);
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
    del() {
      let rows = this.$refs.table.getSelected();
      if (rows.length == 0) {
        return this.$message.error("请先选中行");
      }
      this.$refs.table.delRow();
    },
    clear() {
      this.tableData.splice(0);
    },
    addRow() { //添加行
      this.tableData.push({});
    },
    getSelect() { //获取选中的行
      let rows = this.$refs.table.getSelected();

      return this.$message.error("请先选中行:" + JSON.stringify(rows));
    },
  },
};
</script>
<style lang="less" scoped>
.example-tb {
  padding: 15px;
}
.tb {
  margin-top: 15px;
}
.v-header {
  background: white;
  padding: 10px;
}
</style>
