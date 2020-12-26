<template >
  <div style="height:100%;">
    <vol-header title="主从明细一对一"
                :right-click="showSearch"></vol-header>

    <!-- table内容 -->
    <vol-table ref="table"
               :url="url.table"
               :queryParams="queryParams"
               :row-click="rowClick"
               :columns="columns"></vol-table>

    <!--搜索表单-->
    <van-actionsheet :round="false"
                     v-model="searchModel"
                     title="条件筛选">
      <div class="search-container content">
        <vol-form :options="searchForm.options"
                  :fields="searchForm.fields"
                  ref="searchForm"
                  title="查询">
          <div class="btns">
            <van-button type="primary"
                        block
                        @click="()=>{this.$refs.searchForm.reset()}">
              <van-icon name="replay" />重置
            </van-button>
            <van-button type="info"
                        block
                        class="search-btn"
                        @click="searchClick">
              <van-icon name="search" />查 询
            </van-button>
          </div>

        </vol-form>
      </div>
    </van-actionsheet>
  </div>
</template>
<script>
import { Tabbar, TabbarItem, ActionSheet, Icon } from "vant";
import VolHeader from "@/components/VolHeader.vue";
import VolTable from "@/components/VolTable.vue";
export default {
  components: {
    "van-tabbar": Tabbar,
    "van-tabbar-item": TabbarItem,
    "vol-header": VolHeader,
    "vol-table": VolTable,
    "van-actionsheet": ActionSheet,
    "vol-form": () => import("@/components/VolForm"),
    "van-icon": Icon
  },
  data () {
    return {
      searchModel: false,//查询表单
      showDelBtn: false,//是否显示删除按钮(新建时不显示 )
      /*现在的操作的是后台的框架默认的增删改查，暂时可以不用修改后台代码完成curd操作*/
      /*如果需要其他页面的h5操作，直接将当前整个页面复制出来，只需要挨着改里面的参数*/
      url: {
        table: "/api/sellorder/getPageData", //table加载的url
        search: "/api/sellorder/getPageData",//搜索加载url，与上面一样
      },
      //table表配置
      columns: [
        { field: 'TranNo', title: '运单号', type: 'string', link: true, width: 150, require: true, align: 'left' },

        { field: 'Qty', title: '销售数量', type: 'int', width: 90, require: true, align: 'left' },
        {
          field: 'CreateDate', title: '创建时间', formatter: (val, row, column) => {
            return (val || '').substring(0, 10)
          }
        },
      ],
      //查询表单配置
      searchForm: {
        options: [[
          {
            field: "TranNo",
            name: "运单号",
            type: "text"
          },
          {
            field: "CreateDate1",
            type: "date",
            name: "创建时间(启)",
          }, {
            field: "CreateDate1",
            type: "date",
            name: "创建时间(止)",
          }

        ]],
        fields: { TranNo: "", CreateDate1: "", CreateDate1: "" }
      }
    };
  },
  methods: {
    showSearch () { //点击右上解搜索
      this.searchModel = true;
    },
    searchClick () { //点击搜索时的事件
      this.searchModel = false;
      this.$refs.table.reload();
    },
    queryParams () { //生成查询参数
      return [
        { name: "TranNo", value: this.searchForm.fields.TranNo },
        { name: "CreateDate", value: this.searchForm.fields.CreateDate1, displayType: "thanorequal" },
        { name: "CreateDate", value: this.searchForm.fields.CreateDate2, displayType: "lessorequal" }
      ]
    },
    rowClick (row) { //点击表行数据查看详情或编辑 
      this.$router.push({ path: "/sellOrder/detail?orderId=" + row.Order_Id });
    }
  },
  created () {

  }
};
</script>
<style lang="less" scoped>
.btns {
  display: flex;
  button {
    flex: 1;
  }
  i {
    position: relative;
    top: 2.5px;
    margin-right: 5px;
  }
}
.search-btn {
  font-size: 16px;
  width: 94%;
  border-radius: 7px;
  margin: 0 3%;
  margin-top: 20px;
}
</style>
<style lang="less" scoped>
.vol-tabbar {
  position: absolute;
  bottom: 0;
  width: 100%;
}
.add-icon {
  z-index: 99;
  position: fixed;
  bottom: 8px;
  right: 10px;
  /* background: #eee; */
  font-size: 37px;
  color: #fb9d12;
  background: white;
}
</style>
