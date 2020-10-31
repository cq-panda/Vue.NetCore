<template >
  <div style="height:100%;">
    <vol-header title="table表数据(CURD)"
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
                     :title="currentAction=='add'?'新建':'编辑'">
      <div class="search-container content">
        <vol-form ref="detailForm"
                  :options="detailForm.options"
                  :fields="detailForm.fields">
          <div class="btns">
            <van-button type="danger"
                        v-show="showDelBtn"
                        @click="del"
                        block>
              <van-icon name="delete" />删除
            </van-button>
            <van-button type="primary"
                        block
                        @click="reset">
              <van-icon name="replay" />重置
            </van-button>
            <van-button type="info"
                        @click="submitClick"
                        block>
              <van-icon name="certificate" />提交
            </van-button>
            <slot name="btn-footer"></slot>
          </div>
        </vol-form>
      </div>
    </van-actionsheet>
    <van-icon name="add"
              class="add-icon"
              @click="addClick" />
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
        table: "/api/Sys_Log/getPageData", //table加载的url
        search: "/api/Sys_Log/getPageData",//搜索加载url，与上面一样
        update: "/api/Sys_Log/update",//详情提交的地址
        add: "/api/Sys_Log/add", //详情提交的地址
        del: "/api/Sys_Log/del"
      },
      //table表配置
      columns: [{ field: 'Id', title: 'Id', type: 'int', hidden: true },
      {
        field: 'BeginDate', width: 100, title: '开始时间', type: 'datetime', formatter: (val, row, column) => {
          return (val || '').substring(0, 10)
        }
      },
      { field: 'UserName', title: '用户名称', type: 'string' },
      { field: 'LogType', title: '日志类型', type: 'string', bind: { key: 'enable', data: [] }, },
      //kye绑定数据源的key
      { field: 'Success', title: '响应状态', bind: { key: 'restatus', data: [] } },
      { field: 'ElapsedTime', title: '时长' }],
      //查询表单配置
      searchForm: {
        options: [[
          {
            field: "UserName",
            name: "用户名称",
            type: "text"
          },
          {
            field: "BeginDate1",
            type: "date",
            name: "开始时间(启)",
            // required: true
          }, {
            field: "BeginDate2",
            type: "date",
            name: "开始时间(止)",
            //required: true
          }

        ],
        [
          {
            field: "Success",
            type: "select",
            name: "响应状态",
            key: "log",
            data: []
          }
        ]],
        fields: { UserName: "", BeginDate1: "", BeginDate2: "", Success: "" }
      },
      //编辑、新建、详情表单配置
      detailForm: {
        options: [[
          {
            field: "UserName",
            name: "用户名称",
            type: "text",
            required: true
          },
          {
            field: "BeginDate",
            type: "date",
            name: "开始时间",
            required: true
          }
        ],
        [
          {
            field: "Success",
            type: "select",
            name: "响应状态",
            key: "log",
            data: []
          },
          {
            field: "ExceptionInfo",
            name: "异常信息"
          },
          {
            field: "RequestParameter",
            name: "请求参数"
          },
          {
            field: "UserIP",
            name: "用户Ip",
            readonly: true //设置字段只读
          }
        ]],
        fields: { UserName: "", BeginDate: "", Success: "", ExceptionInfo: "", RequestParameter: "", UserIP: "" }
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
        { name: "UserName", value: this.searchForm.fields.UserName, displayType: "like" },
        { name: "Success", value: this.searchForm.fields.Success },
        { name: "BeginDate", value: this.searchForm.fields.BeginDate1, displayType: "thanorequal" },
        { name: "BeginDate", value: this.searchForm.fields.BeginDate2, displayType: "lessorequal" }
      ]
    },
    rowClick (row) { //点击表行数据查看详情或编辑 
      //从后台查询表的明细,这里不再写了
      // this.http.post("获取表明细的url",{},true).then(x=>{
      // });
      Object.assign(this.detailForm.fields, row);
      this.currentAction = "update";
      this.detailModel = true;
      this.showDelBtn = true;//显示删除按钮
    },
    reset () { //重置
      //如果是编辑，不重置主键字段
      var key = '';
      if (this.currentAction == 'update') {
        key = this.detailForm.fields.Id;
      }
      this.$refs.detailForm.reset();
      if (key) {
        this.detailFormz.fields.Id = key;
      }
    },
    addClick () {//点击新建
      if (this.$refs.detailForm) {
        this.$refs.detailForm.reset();
      }
      this.detailModel = true;
      this.showDelBtn = false;//隐藏删除按钮
      this.currentAction = "add";
    },
    submitClick () {//编辑或新建时提交数据
      if (!this.$refs.detailForm.validator()) return;

      this.http.post(this.url[this.currentAction], { maindata: this.detailForm.fields }, true).then(x => {
        this.reloadTable(x);
      })
    },
    del () {//删除
      this.http.post(this.url.del, [this.detailForm.fields.Id], true).then(x => {
        this.reloadTable(x);
      })
    },
    reloadTable (result) { //新建、编辑、删除请求后刷新页面数据
      this.$toast(result.message)
      if (result.status) {
        this.detailModel = false
        this.$refs.table.reload();
      }
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
