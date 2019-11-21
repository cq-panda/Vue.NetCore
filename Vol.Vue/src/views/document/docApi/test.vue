<template>
  <div>
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
  </div>
</template>
<script>
import VolBox from "@/components/basic/VolBox.vue";
import VolTable from "@/components/basic/VolTable.vue";
import VolHeader from "@/components/basic/VolHeader.vue";
let $doc_vue;
let doc_options = {
  data() {
    return {
      viewModel: false,
      text: "",
      table: {
        url: "api/App_Expert/getPageData",
        pagination: {
          total: 0, //分页总数量
          size: 30, //分页大小,30,60,100.
          sortName: "CreateDate" //从后加载数据分页时的排序字段
        },
        columns: [
          //表配置
          {
            field: "ExpertId", //数据库表字段,必须和数据库一样，并且大小写一样
            title: "主键ID", //表头显示的名称
            isKey: true, //是否为主键字段
            hidden: true //是否显示
          },
          {
            field: "HeadImageUrl",
            title: "头像",
            type: "img",
            width: 160
          },
          {
            field: "UserName",
            title: "申请人帐号",
            link: true, //设置link=true后此单元格可以点击获取当前行的数据进行其他操作
            width: 120
          },
          {
            field: "UserTrueName",
            title: "申请人",
            width: 120
          },
          {
            field: "AuditStatus",
            title: "审核状态",
            width: 120,
            bind: {
              //如果后面返回的数据为数据源的数据，请配置此bind属性，可以从后台字典数据源加载，也只以直接写上
              key: "audit",
              data: []
            }
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
              this.$Message.error(msg);
              // $doc_vue.$Message.error(msg);
            },
            formatter: () => {
              //对单元格的数据格式化处理
              return "<a>点我</a>";
            }
          }
        ]
      }
    };
  },
  components: { VolTable, VolBox, VolHeader },
  created() {
    $doc_vue = this;
  },
  methods: {
    viewRow(row, column) {
      //设置linkView属性后，可不用配置click与formatter方法，直接使用linkView处理点击事件
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
    }
  }
};
export default doc_options;
</script>