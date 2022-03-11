
<template>
  <div class="c-group">
    <div class="item item1">
      <i class="el-icon-warning"></i>
      <div>提示信息</div>
    </div>
    <div class="item item4">
      <i class="el-icon-success"></i>
      <div>成功信息</div>
    </div>
    <div class="item item2">
      <i class="el-icon-error"></i>
      <div>异常信息</div>
    </div>
    <div class="item item3">
      <i class="el-icon-info"></i>
      <div>警告信息</div>
    </div>
    <div class="item item4">
      <i class="el-icon-success"></i>
      <div>成功信息</div>
    </div>
    <div class="item item5">
      <i class="el-icon-question"></i>
      <div>未知信息</div>
    </div>
    <div class="item item6">
      <i class="el-icon-remove"></i>
      <div>还没想好</div>
    </div>
  </div>
  <div class="container">
    <div style="margin-top: 15px">
      <el-tabs type="border-card" style="min-height: 230px; box-shadow: none">
        <el-tab-pane>
          <template #label>
            <span><i class="el-icon-date"></i> 表1 </span>
          </template>
          <div class="header">
            <div class="text">双击表编辑</div>
            <div class="btns">
              <el-button type="primary" size="mini" plain @click="clear"
                >清空表</el-button
              >
              <el-button type="primary" size="mini" plain @click="del"
                >删除行</el-button
              >
              <el-button type="primary" size="mini" plain @click="add"
                >添加行</el-button
              >
              <el-button type="primary" size="mini" plain @click="getRows"
                >获取选中的行</el-button
              >
            </div>
          </div>

          <vol-table
            ref="table"
            :columns="columns"
            :max-height="200"
            :index="true"
            :tableData="tableData"
            :paginationHide="true"
          ></vol-table>
        </el-tab-pane>
        <el-tab-pane :lazy="true" label="消息中心">表2</el-tab-pane>
        <el-tab-pane :lazy="true" label="角色管理">表3</el-tab-pane>
        <el-tab-pane :lazy="true" label="定时任务补偿">表4</el-tab-pane>
      </el-tabs>
    </div>
  </div>
</template>
<script>
import VolTable from "@/components/basic/VolTable.vue";

export default {
  components: { VolTable },
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
        return this.$Message.error("请先选中行1");
      }
      this.$Message.info("当前选中的行数据：" + JSON.stringify(rows));
    },
  },
  created() {},
  data() {
    return {
      text: "",
      tableData: [
        //表数据
        {
          ExpertId: 276,
          ExpertName: "起名太麻烦",
          UserName: "13888888882",
          UserTrueName: "月穿潭底水無痕 ",
          AuditStatus: 1,
          Enable: 1,
          ReallyName: "月穿潭底水無痕 ",
          CreateDate: "2018-09-18 17:45:54",
        },
        {
          ExpertId: 276,
          ExpertName: "取名难好难",

          UserName: "13888888883",
          UserTrueName: "乌拉圭 ",
          AuditStatus: 2,
          Enable: 0,
          ReallyName: "月穿潭底水無痕 ",
          CreateDate: "2018-09-18 17:45:54",
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
          readonly: true, //是否只读(功能未启用)
          require: true, //是否必填(功能未启用)
          align: "left", //文字显示位置
        },
        {
          field: "ExpertName",
          title: "名称",
          width: 150,
          align: "left",
          edit: { type: "text" },
          sortable: true, //是否排序(目前第一个字段为排序字段，其他字段排序开发中)
        },
        {
          field: "UserName",
          title: "申请人帐号",
          width: 120,
          hidden: true, //是否显示
          edit: { type: "text" },
          align: "left",
        },
        {
          field: "UserTrueName",
          title: "申请人",

          width: 120,
          align: "left",
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
          title: "审核状态",
          type: "int",
          bind: {
            //如果后面返回的数据为数据源的数据，请配置此bind属性，可以从后台字典数据源加载，也只以直接写上
            key: "audit",
            data: [
              { key: "0", value: "审核中" },
              { key: "1", value: "审核通过" },
              { key: "2", value: "审核未通过" },
            ],
          },
          width: 120,
          align: "left",
        },
        {
          field: "Enable",
          title: "是否启用",
          type: "byte",
          bind: { key: "enable", data: [] }, //此处值为data空数据，自行从后台字典数据源加载
          width: 80,
          require: true,
          align: "left",
          edit: { type: "switch" },
        },
        {
          field: "CreateDate",
          title: "创建时间",
          type: "datetime",
          width: 150,
          readonly: true,
          align: "left",
          edit: { type: "datetime" },
          sortable: true,
        },
        {
          field: "ReallyName",
          title: "真实姓名",

          width: 120,
          click: (row, column) => {
            //单元格点击事亻
            let msg =
              "此处可以自己自定格式显示内容,此单元格原始值是:【" +
              row.ReallyName +
              "】";
            this.$message.error(msg);
          },
          formatter: (row, column) => {
            //对单元格的数据格式化处理
            return "<a style='color:rgb(15, 132, 255);'>点我</a>";
          },
          align: "left",
        },
        {
          field: "Creator",
          title: "创建人",

          width: 130,
          hidden: true,
          align: "left",
        },
      ],
    };
  },
};
</script>
<style lang="less" scoped>
.container {
  background: white;

  border-top: 10px solid #eee;
}
.header {
  display: flex;
  margin-bottom: 10px;
  .text {
    line-height: 30px;
    border-bottom: 2px solid #607d8b;
    font-size: 16px;
    /* color: #FF9800; */
    font-weight: 500;
  }
  .btns {
    flex: 1;
    text-align: right;
  }
}
.c-group {
  margin-top: 15px;
  border-top: 10px solid #eee;
  padding: 15px 0;
  display: flex;
  .item {
    flex: 1;
    text-align: center;
    i {
      border-radius: 50%;
      font-size: 60px;
      margin-bottom: 7px;
    }
  }
  .item1 {
    i {
      color: #409eff;
      border: 1px solid #3498ff;
    }
  }
  .item2 {
    i {
      color: red;
      border: 1px solid red;
    }
  }
  .item3 {
    i {
      color: rgb(0 0 0 / 60%);
      border: 1px solid rgb(0 0 0 / 60%);
    }
  }
  .item4 {
    i {
      color: #15c322;
      border: 1px solid #15c322;
    }
  }
  .item5 {
    i {
      color: #409eff;
      border: 1px solid #409eff;
    }
  }
  .item6 {
    i {
      color: #ff00d4;
      border: 1px solid #ff00d4;
    }
  }
}
</style>