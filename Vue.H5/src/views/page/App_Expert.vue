<template >
  <div style="height:100%;">
    <vol-header title="文件上传与图片显示 "
                :right-click="showSearch"></vol-header>

    <!-- table内容 -->
    <!-- cell-overflow-hidden=true单元格超出部分隐藏 -->
    <vol-table ref="table"
               :url="url.table"
               :queryParams="queryParams"
               :row-click="rowClick"
               :cell-overflow-hidden="true"
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
        table: "/api/app_expert/getPageData", //table加载的url
        search: "/api/app_expert/getPageData",//搜索加载url，与上面一样
        update: "/api/app_expert/update",//详情提交的地址
        add: "/api/app_expert/add", //详情提交的地址
        del: "/api/app_expert/del",
        upload: "/api/app_expert/upload"
      },
      //table表配置
      columns: [{ field: 'ExpertId', title: '主键ID', width: 80, hidden: true },
      { field: 'HeadImageUrl', title: '头像', type: 'img', width: 150, align: 'left' },
      { field: 'ExpertName', title: '名称', type: 'string', width: 140, },
      { field: 'Enable', title: '是否启用', type: 'byte', bind: { key: 'enable', data: [] }, width: 120 }],
      //查询表单配置
      searchForm: {
        options: [[
          { field: 'ExpertName', name: '名称' },
          { field: 'Enable', type: "select", name: '是否启用', type: 'switch', data: [] }]],
        fields: { ExpertName: "", Enable: "" }
      },
      //编辑、新建、详情表单配置
      detailForm: {
        options: [[{ "name": "名称", "field": "ExpertName" },
        { name: '是否启用', field: 'Enable', type: 'switch', data: [], "required": true }],
        [
          { "name": "地区", "field": "City", "key": "city", "data": [], "type": "select" },
        ],
        [
          {
            "name": "头像", "field": "HeadImageUrl", "type": "img",
            multiple: true,//开启多图上传
            maxCount:5,
            url: "/api/app_expert/upload"
          }
        ]],
        fields: { ExpertName: "", Enable: "", City: "", HeadImageUrl: [] }
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
        { name: "ExpertName", value: this.searchForm.fields.ExpertName },
        { name: "Enable", value: this.searchForm.fields.Enable }
      ]
    },
    rowClick (row) { //点击表行数据查看详情或编辑 

      Object.assign(this.detailForm.fields, row);
      //将图片转换成数组
      this.detailForm.fields.HeadImageUrl = (this.detailForm.fields.HeadImageUrl || "").split(',');
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
        this.detailForm.fields.Id = key;
      }
    },
    addClick () {//点击新建
      if (this.$refs.detailForm) {
        this.$refs.detailForm.reset();
      }
      this.detailForm.fields.AuditStatue = 0;
      this.detailModel = true;
      this.showDelBtn = false;//隐藏删除按钮
      this.currentAction = "add";
    },
    submitClick () {//编辑或新建时提交数据
      if (!this.$refs.detailForm.validator()) return;
      //如果字段是selectList类型提交的时候手动将值转换成字符串
      var _fields = {};
      for (const key in this.detailForm.fields) {
        var _val = this.detailForm.fields[key];
        _fields[key] = _val instanceof Array ? _val.join(',') : _val;
      }
      this.http.post(this.url[this.currentAction], { maindata: _fields }, true).then(x => {
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
