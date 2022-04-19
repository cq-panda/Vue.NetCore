<template >
  <div style="height:100%;">
    <vol-header title="只读表单"
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

    <!--详情、编辑表单-->
    <van-actionsheet :round="false"
                     v-model="detailModel"
                     title="详情">
      <div class="search-container content">
        <vol-form ref="detailForm"
                  :options="detailForm.options"
                  :fields="detailForm.fields">

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
      currentAction: "",//当前状态add/update
      searchModel: false,//查询表单
      detailModel: false,//编辑表单
      showDelBtn: false,//是否显示删除按钮(新建时不显示 )
      /*现在的操作的是后台的框架默认的增删改查，暂时可以不用修改后台代码完成curd操作*/
      /*如果需要其他页面的h5操作，直接将当前整个页面复制出来，只需要挨着改里面的参数*/
      url: {
        table: "/api/app_appointment/getPageData", //table加载的url
        search: "/api/app_appointment/getPageData",//搜索加载url，与上面一样
      },
      //table表配置
      columns: [
        { field: 'Id', title: 'Id', hidden: true, width: 50 },
        { field: 'Name', title: '姓名' },
        { field: 'Describe', title: '描述', width: 100 },
        { field: 'PhoneNo', title: '电话' },
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
            field: "Name",
            name: "姓名",
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
        fields: { Name: "", CreateDate1: "", CreateDate1: "" }
      },
      //编辑、新建、详情表单配置
      detailForm: {
        options: [[
          {
            field: "Name",
            name: "姓名",
            readonly: true
          },
          {
            field: "Describe",
            name: "描述",
            readonly: true
          }],
        [{ field: 'Creator', name: '创建人', readonly: true },
        {
          field: "CreateDate",
          name: "创建时间",
          readonly: true
        }
        ],
        [
          { field: 'Modifier', name: '修改人', readonly: true },
          { field: 'ModifyDate', name: '修改时间', readonly: true }
        ]],
        fields: {
          UserName: "",
          BeginDate: "",
          Success: [],//如果是多选，必须给一个默认空数组
          //  Success: "",
          ExceptionInfo: "",
          RequestParameter: "",
          UserIP: ""
        }
      },
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
        { name: "Name", value: this.searchForm.fields.Name, displayType: "like" },
        { name: "CreateDate", value: this.searchForm.fields.CreateDate1, displayType: "thanorequal" },
        { name: "CreateDate", value: this.searchForm.fields.CreateDate2, displayType: "lessorequal" }
      ]
    },
    rowClick (row) { //点击表行数据查看详情或编辑 
      //从后台查询表的明细,这里不再写了
      // this.http.post("获取表明细的url",{},true).then(x=>{
      // });
      Object.assign(this.detailForm.fields, row);
      this.detailModel = true;
    },
    reset () { //重置
      this.$refs.detailForm.reset();
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
