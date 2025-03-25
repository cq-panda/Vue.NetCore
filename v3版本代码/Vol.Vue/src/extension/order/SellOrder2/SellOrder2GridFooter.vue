<template>
  <div>
    <h3 >
      <i class="ivu-icon ivu-icon-ios-information-circle-outline"></i>订单明细
    </h3>
    <div style="padding:10px;background: white;padding-top: 0;">
      <vol-table ref="tableList"
                 :loadKey="true"
                 :columns="columns"
                 :pagination-hide="true"
                 :height="210"
                 :defaultLoadPage="false"
                 @loadBefore="loadBefore"
                 url="/api/SellOrder/getDetailPage"
                 :row-index="true"
                 :index="false"></vol-table>
    </div>
  </div>
</template>

<script>
import VolTable from "@/components/basic/VolTable.vue";
export default {
  components: {
    VolTable
  },
  methods: {
    loadBefore (params, callback) {
      return callback(true);
    }
  },
  data () {
    return {
      tableData: [],
      //从生成的代码sellorder2.vue里面把明细配置复制过来就能用
      columns:  [{field:'OrderList_Id',title:'OrderList_Id',type:'string',width:90,hidden:true,require:true,align:'left'},
                {field:'Order_Id',title:'订单Id',type:'string',width:90,hidden:true,readonly:true,require:true,align:'left'},
                {field:'ProductName',title:'商品名称',type:'string',width:150,require:true,align:'left',sortable:true},
                {field:'MO',title:'批次',type:'string',width:100,require:true,align:'left'},
                {field:'Qty',title:'数量',type:'int',width:90,require:true,align:'left'},
                {field:'Weight',title:'重量',type:'decimal',width:90,align:'left'},
                {field:'Remark',title:'备注',type:'string',width:120,align:'left'},
                {field:'Creator',title:'创建人',type:'string',width:130,align:'left'},
                {field:'CreateDate',title:'创建时间',type:'datetime',width:90,align:'left'},
                {field:'Modifier',title:'修改人',type:'string',width:100,align:'left'},
                {field:'ModifyDate',title:'修改时间',type:'datetime',width:90,align:'left'}]
    }
  }
}
</script>
<style scoped>
 h3{
     font-weight: 500;
    padding-left: 10px;
    background: white;
    margin-top: 10px;
       padding-top: 6px;
    padding-bottom: 5px;
 }
</style>