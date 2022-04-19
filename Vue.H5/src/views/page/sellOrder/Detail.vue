<template >
  <div style="height:100%; background: #f7f7f7;">

    <vol-header :title="title"
                :show-icon="false"></vol-header>
    <div class="form-body order-body">
      <h3>订单详情</h3>
      <div class="main-form">
        <vol-form :options="mainForm.options"
                  :fields="mainForm.fields"
                  ref="searchForm">
        </vol-form>
      </div>
      <h3>订单明细</h3>
      <div class="list-form">
        <div v-for="(fields,index) in detailForm.fields"
             :key="index">
          <div class="list-header">
            <van-icon name="chat-o" /><span>选项{{index+1}}</span>
            <span class="remove"
                  @click="removeItem(index)">
              <van-icon name="delete" />
            </span>
          </div>
          <vol-form :options="detailForm.options"
                    :fields="fields">
          </vol-form>
        </div>
      </div>
    </div>
    <div class="action-icon">
      <van-icon name="add"
                class="add-icon"
                @click="addClick" />
      <van-icon name="success"
                class="save-icon"
                @click="saveClick" />
    </div>
  </div>
</template>
<script>
import { Tabbar, TabbarItem, ActionSheet, Icon, Dialog } from "vant";
import VolHeader from "@/components/VolHeader.vue";
export default {
  components: {
    "van-tabbar": Tabbar,
    "van-tabbar-item": TabbarItem,
    "vol-header": VolHeader,
    "vol-form": () => import("@/components/VolForm"),
    "van-icon": Icon
  },
  computed: {
    title () {
      return "主从明细一对一详情" + (this.mainForm.fields.Order_Id ? '(编辑)' : "(新增)")
    }
  },
  data () {
    return {
      currentAction: "",//当前状态add/update
      url: {
        search: "/api/sellorder/getPageData",//搜索加载url，与上面一样
      },
      //查询表单配置
      mainForm: {
        options: [[{ "field": "OrderType", "name": "订单类型", "key": "ordertype", data: [], "required": true, "type": "select" },
        { "name": "运单号", "required": true, "field": "TranNo" },
        { "name": "销售数量", "required": true, "field": "Qty", "type": "number" },
        { "name": "销售订单号", "required": true, "field": "SellNo" },
        { "name": "创建时间", "field": "CreateDate", "readonly": true },
        { "name": "备注", "field": "Remark", "type": "textarea" }]],
        fields: { "OrderType": "", "TranNo": "", "Qty": "", "SellNo": "", "Remark": "", "CreateDate": "" },
      },
      //明细表配置
      detailForm: {
        options: [[
          { field: 'ProductName', name: '商品名称', type: 'select', key: 'pn', data: [], required: true, align: 'left' },
          { field: 'MO', name: '批次', width: 100, required: true },
          { field: 'Qty', name: '数量', type: 'number', required: true, align: 'left' },
          { field: 'Weight', name: '重量', type: 'number' },
          { field: 'Remark', name: '备注', type: 'textarea' }],
        ],
        fields: [],
      }
    };
  },
  methods: {
    saveClick () {
      var url;
      //判断当前主表表单有没有主键的值，如果有默认为编辑
      if (this.mainForm.fields.Order_Id) {
        url = "/api/SellOrder/update";
      } else {
        url = "/api/SellOrder/add";
      }
      var _form = { mainData: this.mainForm.fields, detailData: this.detailForm.fields };
      this.http.post(url, _form, true).then(x => {
        if (!x.status) return this.$toast(x.message)
        var _data = JSON.parse(x.data);
        this.mainForm.fields = _data.data;
        this.detailForm.fields = _data.list;
      })
    },
    addClick () {//添加明细
      this.detailForm.fields.push({ "ProductName": null, "MO": null, "Qty": null, "Weight": null, "Remark": "" })
      //滚动到最底部
      var $el = document.getElementsByClassName("order-body")[0];
      $el.scrollTop = $el.scrollHeight
    },
    removeItem (index) {
      //如果没有主键的值，默认为数据库不存的数据。直接删除
      if (!this.detailForm.fields[index].Order_Id) {
        return this.detailForm.fields.splice(index, 1);
      }
      //删除的是表中的数据，从后台删除
      Dialog.confirm({
        title: '警告!',
        message: '确认要删除此数据吗',
      })
        .then(() => {
          //自己后台写一个接口来删除明细表的数据
          // var url = "xxxx/del?id=" + this.detailForm.fields[index].OrderList_Id;
          // this.http.post(url, {}, true).then(x => {
          this.detailForm.fields.splice(index, 1);
          // })
        })
        .catch(() => {
          // on cancel
        });
      return;

    },
    getData (orderId) {
      var _options = { wheres: JSON.stringify([{ name: "Order_Id", value: orderId }]) }
      //自己写个接口获取数据
      //获取主表数据
      this.http.post("/api/sellorder/getPageData", _options, true).then(x => {
        Object.assign(this.mainForm.fields, x.rows[0])
      })
      //获取明细表数据
      this.http.post("/api/sellorder/getDetailPage", { page: 1, rows: 100, value: orderId }, true).then(x => {
        this.detailForm.fields = x.rows;
      })
    },

  },
  async created () {
    if (this.$route.query && this.$route.query.orderId) {
      this.getData(this.$route.query.orderId);
    }
  }
};
</script>
<style lang="less" scoped>
.vol-tabbar {
  position: absolute;
  bottom: 0;
  width: 100%;
}
.form-body {
  overflow: scroll;
  height: calc(100vh - 50px);
}

.main-form,
.list-form {
  padding: 10px;
  // background: #f7f7f7;
}
.list-header {
  position: relative;
  padding: 1rem 0.8rem;
  background: white;
  border-bottom: 1px solid #eaeaea;
  font-weight: bold;
}
h3 {
  margin: 0;
  font-weight: 500;
  padding-left: 16px;
}
.remove {
  width: 2rem;
  text-align: center;
  color: red;
  position: absolute;
  right: 1rem;
  line-height: 2rem;
}
.action-icon {
  z-index: 99;
  position: fixed;
  bottom: 8px;
  right: 0px;
  height: 100px;
  width: 50px;

  .add-icon {
    color: #03a9f4;
    background: white;
    font-size: 37px;
    width: 39px;
  }
  .save-icon {
    font-size: 20px;
    width: 33px;
    background: #10d01f;
    border-radius: 50%;
    color: white;
    line-height: 33px;
    text-align: center;
    margin-left: 3px;
    margin-top: 5px;
  }
}
</style>
