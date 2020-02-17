<template>
  <div>
    <vol-box :model.sync="viewModel" :height="300" :width="600" title="点击表的弹出框">
      <div slot="content" style="word-break: break-all;">{{text}}</div>
    </vol-box>
    <Alert type="success" show-icon>
      关于table
      <div slot="desc">table都是基于element table进行的二次封装，目前只需要配置好json数据即可使用,表字段的配置此处为手动配置，也可以由代码生成器完成...</div>
    </Alert>
    <div class="tb">
      <VolHeader icon="md-apps" text="双击表即可编辑">
        <div slot="content">同时可配置数据字典编号自动绑定字段的显示值,如【是否启用】列值为0/1显示文本为是、否</div>
        <slot>
          <div style="text-align: right;">
            <Button type="info" ghost @click="clear">清空表</Button>
            <Button type="info" ghost @click="del">删除行</Button>
            <Button type="info" ghost @click="add">添加行</Button>
            <Button type="info" ghost @click="getRows">获取选中的行</Button>
          </div>
        </slot>
      </VolHeader>

      <vol-table
        ref="table"
        :columns="columns"
        :height="315"
        :index="true"
        :tableData="tableData"
        :paginationHide="true"
      ></vol-table>
    </div>

    <div class="tb" style="margin-top: 20px;">
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
    </div>
  </div>
</template>
<script>
import VolTable from "@/components/basic/VolTable.vue";
import VolHeader from "@/components/basic/VolHeader.vue";
import VolBox from "@/components/basic/VolBox.vue";
export default {
  components: { VolTable, VolBox, VolHeader },
  methods: {
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
    add() {
      this.tableData.push({});
    },
    getRows() {
      let rows = this.$refs.table.getSelected();
      if (rows.length == 0) {
        return this.$message.error("请先选中行1");
      }
      this.text = "当前选中的行数据：" + JSON.stringify(rows);
      this.viewModel = true;
    },
    cellClick(row) {
      this.text =
        "点击单元格的弹出框，当前点击的行数据：" + JSON.stringify(row);
      this.viewModel = true;
    }
  },
  data() {
    return {
      text: "",
      viewModel: false, //点击单元格时弹出框
      tableData: [
        //表数据
        {
          ExpertId: 276,
          ExpertName: "沈万三",
          HeadImageUrl:
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x3.jpg",
          UserName: "13888888881",
          UserTrueName: "孤独比夜还长 ",
          AuditStatus: 0,
          Enable: 1,
          ReallyName: "孤独比夜还长",
          CreateDate: "2018-09-18 17:45:54",
          Creator: 38.88
        },
        {
          ExpertId: 276,
          ExpertName: "小短腿-鲁班",
          HeadImageUrl:
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x1.jpg",
          UserName: "13888888882",
          UserTrueName: "七秒钟的记忆",
          AuditStatus: 1,
          Enable: 1,
          ReallyName: "七秒钟的记忆1",
          CreateDate: "2018-09-18 17:45:54",
          Creator: 19.2
        },
        {
          ExpertId: 276,
          ExpertName: "行走在冷风中",
          HeadImageUrl:
            "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x2.jpg",
          UserName: "13888888883",
          UserTrueName: "不午休的、猫 ",
          AuditStatus: 2,
          Enable: 0,
          ReallyName: "月穿潭底水無痕 ",
          CreateDate: "2018-09-18 17:45:54",
          Creator: 2.2
        }
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
          readonly: true, //是否只读(功能未启用)
          require: true, //是否必填(功能未启用)
          align: "left" //文字显示位置
        },
        {
          field: "ExpertName",
          title: "名称",
          type: "string",
          width: 150,
          require: true,
          align: "left",
          edit: { type: "text" },
          sortable: true,
          extra: {
            icon: "ios-search", //图标
            text: "点击事件",//显示文本
            style: "line-height: 31px;margin-left: 3px;",//自定义样式
            //column列配置, row数据, tableData整个table的数据源
            click: (column, row, tableData) => {
              //  this.getRows();
              this.$Message.error("点击标签触发的事件");
            }
          }
        },
        {
          field: "HeadImageUrl",
          title: "头像",
          type: "img",
          width: 160,
          align: "left"
        },
        {
          field: "UserName",
          title: "申请人帐号",
          type: "string",
          //  link: true, //设置link=true后此单元格可以点击获取当前行的数据进行其他操作
          width: 120,
          require: true,
          //    hidden: true, //是否显示
          edit: { type: "text", min: 3, max: 5 },
          align: "left"
        },
        {
          field: "UserTrueName",
          title: "申请人",
          type: "string",
          width: 120,
          align: "left",
          require: true,
          // edit: { type: "text", min: 4, max: 7 },
          click: (row, column) => {
            //单元格点击事亻
            this.$message.error("此单元格没有设置为可以编辑");
          },
          formatter: row => {
            //对单元格的数据格式化处理
            return row.UserTrueName;
          }
        },
        {
          field: "AuditStatus",
          title: "审核状态",
          type: "int",
          bind: {
            //如果后面返回的数据为数据源的数据，请配置此bind属性，可以从后台字典数据源加载，也只以直接写上
            key: "audit",
            data: [
              { key: "0", value: "审核中" },
              { key: "1", value: "审核通过" },
              { key: "2", value: "审核未通过" }
            ]
          },
          width: 120,
          align: "left"
        },
        {
          field: "Enable",
          title: "是否启用",
          type: "byte",
          bind: { key: "enable", data: [] }, //此处值为data空数据，自行从后台字典数据源加载
          width: 80,
          require: true,
          align: "left",
          edit: { type: "switch" }
        },
        {
          field: "CreateDate",
          title: "创建时间",
          type: "datetime",
          width: 150,
          readonly: true,
          align: "left",
          edit: { type: "datetime" },
          sortable: true
        },
        {
          field: "ReallyName",
          title: "真实姓名",
          type: "string",
          width: 120,
          edit: { type: "number", min: 10, max: 20 }
        },
        {
          field: "Creator",
          title: "类型:小数",
          type: "string",
          width: 130,
          edit: { type: "decimal", min: 2.2, max: 5.5 }
        }
      ],
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
            onChange:(column,row,tableData)=>{
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
  }
};
</script>
<style lang="less" scoped>
.tb {
  padding: 0px 20px;
}
</style>