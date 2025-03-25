<template>
  <div v-if="inited">
    <div class="i-text">
      <h2>关于ViewGird组件</h2>
    </div>
    <Alert type="warning">
      <template slot="desc" style="line-height: 30px">
        <p>
          1、ViewGird组件也是前端框架的核心，所有由代码生成的页面的基础功能全部依赖此组件，也可以单独使用此组件。
        </p>
        <p>
          2、组件默认包括(单表、主从表)：查询、添加、修改、删除、导入、导出、审核功能
        </p>
        <p>
          3、组件支持方法与属性扩展,如：动态按钮、动态控制table列显示、表单动态显示、弹出框动态控制、现有事件进行拦截等，更支持对此组件进行其他组件扩展，组件扩展可实现任何自己想写的代码，具体用法与扩展操作与代码生成后的页面操作相同。
        </p>
        <p>
          4、如果需要一对多或多对多表单等操作，在ViewGrid提供的位置进行扩展组件编写即可。
        </p>
      </template>
    </Alert>
    <div class="i-text">
      <h2>组件结构图</h2>
    </div>
    <pre class="bg-ms">
          <code>
          还没画好;
          </code>
      </pre>
    <!-- ViewGird使用方法 -->
    <DocViewGird></DocViewGird>
    <br />
    <br />
    <div>
      <Button type="info" @click="viewCode = true">查看代码</Button>
    </div>
    <docParamTable name="viewGrid" :show-code="true">
      <div style="padding: 10px; background: #cfeaff">
        <div>代码一共有4个文件(都在./doc_viewGrid/文件夹中):</div>
        <div>
          1、doc_viewGird.vue组件基础配置，doc_viewGirdExtension.js组件扩展(扩展全靠这个文件)，这两个文件必需有,并且都可以由代码生成器完成，不需要写任何代码。
        </div>
        <div>
          2、doc_viewGirdHeader.vu、doc_viewGirdModelBody.vue为自定义的扩展组件(实际有6个，可自行选择扩展某个或多个)，如果不需要组件扩展，可以不用加扩展的vue组件
        </div>
        <div>
          3、此处api提共的文件代码量较多，因为里面写了大量扩展方法与属性，如果想看主从表没有扩展过的代码，可参照:Sys_Dictionary.vue与Sys_Dictionary.js
        </div>
      </div>
    </docParamTable>
    <VolBox icon="ios-chatbubbles" :model.sync="viewCode" title="viewgrid代码" :height="550" :width="1000" :padding="15">
      <div>
        <Tabs value="name1">
          <TabPane label="doc_viewGird.vue" name="name1">
            <div v-html="sourceCode[0]"></div>
          </TabPane>
          <TabPane label="doc_viewGirdExtension.js" name="name2">
            <div v-html="sourceCode[1]"></div>
          </TabPane>
          <TabPane label="doc_viewGirdHeader.vue" name="name3">
            <div v-html="sourceCode[2]"></div>
          </TabPane>
          <TabPane label="doc_viewGirdModelBody.vue" name="name4">
            <div v-html="sourceCode[3]"></div>
          </TabPane>
        </Tabs>
      </div>
      <!-- footer 这里不写，默认有一个关闭按钮 -->
    </VolBox>
  </div>
</template>

<script>
import DocViewGird from "./doc_viewGrid/doc_viewGird.vue";
import docParamTable from "./doc_ParamTable.vue";
import VolBox from "@/components/basic/VolBox.vue";
export default {
  components: { DocViewGird, docParamTable, VolBox },
  created() {
    this.$store.dispatch("setPermission", [{
      "id": 75,
      "name": "主从一对一(1)",
      "url": "/SellOrder",
      "path": "/SellOrder",
      "parentId": 74,
      "icon": "",
      "enable": 1,
      "tableName": "SellOrder",
      "permission": [
        "Search",
        "Add",
        "Delete",
        "Update",
        "Import",
        "Export",
        "Upload",
        "Audit"
      ]
    },{
      "id": 75,
      "name": "主从一对一(1)",
      "url": "/App_Transaction",
      "path": "/App_Transaction",
      "parentId": 74,
      "icon": "",
      "enable": 1,
      "tableName": "SellOrder",
      "permission": [
        "Search",
        "Add",
        "Delete",
        "Update",
        "Import",
        "Export",
        "Upload",
        "Audit"
      ]
    },]);
    this.inited = true;

  },
  data() {
    return {
      inited: false,
      viewCode: false,
      sourceCode: [`<div class="cnblogs_code">
<pre>&lt;template&gt;
    &lt;div&gt;
        &lt;view-grid :columns="columns"<span style="color: #000000;">
                   :detail</span>="detail"<span style="color: #000000;">
                   :editFormFileds</span>="editFormFileds"<span style="color: #000000;">
                   :editFormOptions</span>="editFormOptions"<span style="color: #000000;">
                   :searchFormFileds</span>="searchFormFileds"<span style="color: #000000;">
                   :searchFormOptions</span>="searchFormOptions"<span style="color: #000000;">
                   :table</span>="table"<span style="color: #000000;">
                   :extend</span>="extend"&gt;
        &lt;/view-grid&gt;
    &lt;/div&gt;
&lt;/template&gt;

&lt;script&gt;<span style="color: #000000;">
    import gridExtend from </span>"../doc_viewGrid/doc_viewGirdExtension.js"<span style="color: #000000;">;
    import ViewGrid from </span>"@/components/basic/ViewGrid.vue"<span style="color: #000000;">;
    </span><span style="color: #0000ff;">var</span> vueParam =<span style="color: #000000;"> {
        components: {
            ViewGrid
        },
        data() {
            </span><span style="color: #0000ff;">return</span><span style="color: #000000;"> {
                table: {
                    key: </span>'Order_Id', <span style="color: #008000;">//</span><span style="color: #008000;">排序字段</span>
                    footer: "Foots"<span style="color: #000000;">,
                    cnName: </span>'主从表ViewGird组件使用',<span style="color: #008000;">//</span><span style="color: #008000;">表中文名</span>
                    name: 'SellOrder',<span style="color: #008000;">//</span><span style="color: #008000;">表名(代码生码的别名)</span>
                    url: "/SellOrder/",<span style="color: #008000;">//</span><span style="color: #008000;">后台控制名</span>
                    sortName: "CreateDate" <span style="color: #008000;">//</span><span style="color: #008000;">后台排序字段</span>
<span style="color: #000000;">                },
                </span><span style="color: #008000;">//</span><span style="color: #008000;">所以自定义扩展对象，包括：方法、属性、自定义vue组件</span>
<span style="color: #000000;">                extend: gridExtend,
                </span><span style="color: #008000;">//</span><span style="color: #008000;">编辑字段</span>
                editFormFileds: {"OrderType":"","TranNo":"","Qty":"","SellNo":"","Remark":"","Creator":"","CreateDate":"","ModifyDate":""<span style="color: #000000;">},
                </span><span style="color: #008000;">//</span><span style="color: #008000;">编辑配置</span>
                editFormOptions: [[{"dataKey":"ordertype","title":"订单类型","required":<span style="color: #0000ff;">true</span>,"field":"OrderType","type":"select"<span style="color: #000000;">},
                               {</span>"type":"text","title":"运单号","required":<span style="color: #0000ff;">true</span>,"field":"TranNo"<span style="color: #000000;">},
                               {</span>"type":"number","title":"销售数量","required":<span style="color: #0000ff;">true</span>,"field":"Qty"<span style="color: #000000;">}],
                              [ {</span>"type":"text","title":"销售订单号","required":<span style="color: #0000ff;">true</span>,"field":"SellNo"},{"type":"text","title":"创建人","field":"Creator","disabled":<span style="color: #0000ff;">true</span><span style="color: #000000;">},
                               {</span>"type":"datetime","title":"创建时间","field":"CreateDate","disabled":<span style="color: #0000ff;">true</span><span style="color: #000000;">}
                             ],
                              [{</span>"title":"备注","field":"Remark","colSize":12,"type":"textarea"<span style="color: #000000;">}
                              ]],
                </span><span style="color: #008000;">//</span><span style="color: #008000;">查询字段,第一个字段为快捷查询字段</span>
                searchFormFileds: {"OrderType":"","TranNo":"","SellNo":"","AuditStatus":"","AuditDate":"","Auditor":"","Creator":"","CreateDate":"","ModifyDate":""<span style="color: #000000;">},
                </span><span style="color: #008000;">//</span><span style="color: #008000;">查询配置</span>
<span style="color: #000000;">                searchFormOptions: [
                    [
                        {</span>"title":"运单号","field":"TranNo"<span style="color: #000000;">},
                        {</span>"type":"text","title":"销售订单号","field":"SellNo"<span style="color: #000000;">},
                        {</span>"dataKey":"ordertype","title":"订单类型","field":"OrderType","type":"select"<span style="color: #000000;">}
                    ],
                    [
                        {</span>"columnType":"int","dataKey":"audit","title":"审核状态","field":"AuditStatus","type":"select"<span style="color: #000000;">},
                        {</span>"title":"审核时间","field":"AuditDate","type":"datetime"<span style="color: #000000;">},
                        {</span>"type":"text","title":"审核人","field":"Auditor"<span style="color: #000000;">}
                    ],
                    [
                        {</span>"type":"text","title":"创建人","field":"Creator"<span style="color: #000000;">},
                        {</span>"title":"创建时间","field":"CreateDate","type":"datetime"<span style="color: #000000;">},
                        {</span>"title":"修改时间","field":"ModifyDate","type":"datetime"<span style="color: #000000;">}
                    ]
                ],
                </span><span style="color: #008000;">//</span><span style="color: #008000;">主表table配置</span>
                columns: [ <span style="color: #008000;">//</span><span style="color: #008000;">列参数为voltable组件的配置</span>
                       {field:'Order_Id',title:'Id',type:'string',width:90,hidden:<span style="color: #0000ff;">true</span>,readonly:<span style="color: #0000ff;">true</span>,require:<span style="color: #0000ff;">true</span><span style="color: #000000;">},
                       {field:</span>'OrderType',title:'订单类型',type:'int',bind:{ key:'ordertype',data:[]},width:90,require:<span style="color: #0000ff;">true</span>,sortable:<span style="color: #0000ff;">true</span><span style="color: #000000;">},
                       {field:</span>'TranNo',title:'运单号(点击可弹出框)',type:'string',link:<span style="color: #0000ff;">true</span>,width:140,require:<span style="color: #0000ff;">true</span><span style="color: #000000;">},
                       {field:</span>'SellNo',title:'销售订单号',type:'string',width:140,require:<span style="color: #0000ff;">true</span><span style="color: #000000;">},
                       {field:</span>'Qty',title:'销售数量',type:'int',width:90,require:<span style="color: #0000ff;">true</span><span style="color: #000000;">},
                       {field:</span>'Remark',title:'备注',type:'string',width:170<span style="color: #000000;">},
                       {field:</span>'Creator',title:'创建人',type:'string',width:100,readonly:<span style="color: #0000ff;">true</span><span style="color: #000000;">},
                       {field:</span>'CreateDate',title:'创建时间',type:'datetime',width:90,readonly:<span style="color: #0000ff;">true</span>,sortable:<span style="color: #0000ff;">true</span><span style="color: #000000;">},
                       {field:</span>'ModifyID',title:'ModifyID',type:'int',width:80,hidden:<span style="color: #0000ff;">true</span><span style="color: #000000;">}
                    ],
                </span><span style="color: #008000;">//</span><span style="color: #008000;">从表明细表配置</span>
<span style="color: #000000;">                detail: {
                    cnName:</span>"订单明细",<span style="color: #008000;">//</span><span style="color: #008000;">明细表中文名</span>
                    <span style="color: #008000;">//</span><span style="color: #008000;">明细表table配置</span>
<span style="color: #000000;">                    columns: [
                        {field:</span>'OrderList_Id',title:'OrderList_Id',type:'string',width:90,hidden:<span style="color: #0000ff;">true</span>,require:<span style="color: #0000ff;">true</span><span style="color: #000000;">},
                       {field:</span>'Order_Id',title:'订单Id',type:'string',width:90,hidden:<span style="color: #0000ff;">true</span>,readonly:<span style="color: #0000ff;">true</span>,require:<span style="color: #0000ff;">true</span><span style="color: #000000;">},
                       {field:</span>'ProductName',title:'商品名称',type:'string',bind:{ key:'pn',data:[]},width:150,edit:{type:'select'},require:<span style="color: #0000ff;">true</span>,sortable:<span style="color: #0000ff;">true</span><span style="color: #000000;">},
                       {field:</span>'MO',title:'批次',type:'string',width:100,edit:{type:''},require:<span style="color: #0000ff;">true</span><span style="color: #000000;">},
                       {field:</span>'Qty',title:'数量',type:'int',width:90,edit:{type:'drop'},require:<span style="color: #0000ff;">true</span><span style="color: #000000;">},
                       {field:</span>'Weight',title:'重量',type:'decimal',width:90,edit:{type:''<span style="color: #000000;">}},
                       {field:</span>'Remark',title:'备注',type:'string',width:120,edit:{type:''<span style="color: #000000;">}},
                       {field:</span>'CreateID',title:'CreateID',type:'int',width:80,hidden:<span style="color: #0000ff;">true</span><span style="color: #000000;">},
                       {field:</span>'Creator',title:'创建人',type:'string',width:130<span style="color: #000000;">},
                       {field:</span>'CreateDate',title:'创建时间',type:'datetime',width:90,sortable:<span style="color: #0000ff;">true</span><span style="color: #000000;">},
                       {field:</span>'ModifyID',title:'ModifyID',type:'int',width:80,hidden:<span style="color: #0000ff;">true</span><span style="color: #000000;">},
                       {field:</span>'Modifier',title:'修改人',type:'string',width:100<span style="color: #000000;">},
                       {field:</span>'ModifyDate',title:'修改时间',type:'datetime',width:90,sortable:<span style="color: #0000ff;">true</span><span style="color: #000000;">}
                    ],
                    </span><span style="color: #008000;">//</span><span style="color: #008000;">明细表排序字段</span>
                    sortName: "CreateDate"<span style="color: #000000;">,
                    </span><span style="color: #008000;">//</span><span style="color: #008000;">明细表主键</span>
                    key:"OrderList_Id"<span style="color: #000000;">
                }
            };
        }
    };
    export </span><span style="color: #0000ff;">default</span><span style="color: #000000;"> vueParam;
</span>&lt;/script&gt;</pre>
</div>
<p>&nbsp;</p>`, `<div class="cnblogs_code">
<pre>import extendHeader from "./doc_viewGirdHeader.vue"<span style="color: #000000;">

import extendModelBodyHeader from </span>"./doc_viewGirdModelBody.vue"<span style="color: #000000;">
let extension </span>=<span style="color: #000000;"> {
    components: {</span><span style="color: #008000;">//</span><span style="color: #008000;">动态扩充组件或组件路径</span>
        gridHeader: extendHeader,<span style="color: #008000;">//</span><span style="color: #008000;">自定义扩展查询界面header部份</span>
        gridBody: "",<span style="color: #008000;">//</span><span style="color: #008000;">扩展同上</span>
        gridFooter: "",<span style="color: #008000;">//</span><span style="color: #008000;">扩展同上</span>
        modelHeader: '',<span style="color: #008000;">//</span><span style="color: #008000;">扩展同上</span>
        modelBody: extendModelBodyHeader,<span style="color: #008000;">//</span><span style="color: #008000;">自定义扩展弹出框界面body部份</span>
        modelFooter: ''<span style="color: #008000;">//</span><span style="color: #008000;">扩展同上</span>
<span style="color: #000000;">    },
    tableAction:</span>'SellOrder',<span style="color: #008000;">//</span><span style="color: #008000;">设置获取指定表的权限按钮</span>
    text: "此处为主从表扩展示例,doc_viewGird.vue与doc_viewGirdExtension.js可由代码生成,其他两个文件自己写的扩展", <span style="color: #008000;">//</span><span style="color: #008000;">查询界面文字描述</span>
    buttons: { <span style="color: #008000;">//</span><span style="color: #008000;">扩展的按钮</span>
        <span style="color: #008000;">//</span><span style="color: #008000;">查询界面的按钮</span>
<span style="color: #000000;">        view: [{
            name: </span>"扩展弹出框"<span style="color: #000000;">,
            icon: </span>'md-create'<span style="color: #000000;">,
            value: </span>'Edit'<span style="color: #000000;">,
            class: </span>''<span style="color: #000000;">,
            type: </span>'success'<span style="color: #000000;">,
            index: </span>1,<span style="color: #008000;">//</span><span style="color: #008000;">显示的位置</span>
            onClick: <span style="color: #0000ff;">function</span><span style="color: #000000;"> () {
                </span><span style="color: #0000ff;">this</span>.$refs.gridHeader.model = <span style="color: #0000ff;">true</span><span style="color: #000000;">;
                </span><span style="color: #008000;">//</span><span style="color: #008000;"> this.$message.error("扩展的明细Box按钮,可设置index值指定显示位置,可使用this.$refs拿到包括自定义扩展的所有组件");</span>
<span style="color: #000000;">            }
        }],
        </span><span style="color: #008000;">//</span><span style="color: #008000;">弹出框的按钮，配置同上</span>
<span style="color: #000000;">        box: [{
            name: </span>"配置的button"<span style="color: #000000;">,
            icon: </span>'md-add'<span style="color: #000000;">,
            value: </span>'Add'<span style="color: #000000;">,
            class: </span>''<span style="color: #000000;">,
            type: </span>'error'<span style="color: #000000;">,
            onClick: </span><span style="color: #0000ff;">function</span><span style="color: #000000;"> () {
                </span><span style="color: #0000ff;">this</span>.$message.error("配置出来的button"<span style="color: #000000;">);
            }
        }],
        </span><span style="color: #008000;">//</span><span style="color: #008000;">弹出框的明细table按钮，配置同上</span>
<span style="color: #000000;">        detail: [{
            name: </span>"配置的明细按钮"<span style="color: #000000;">,
            icon: </span>'md-add'<span style="color: #000000;">,
            value: </span>'Add'<span style="color: #000000;">,
            class: </span>''<span style="color: #000000;">,
            type: </span>'error'<span style="color: #000000;">,
            onClick: </span><span style="color: #0000ff;">function</span><span style="color: #000000;"> () {
                </span><span style="color: #0000ff;">this</span>.$message.error("配置的明细按钮button"<span style="color: #000000;">);
            }
        }]
    },
    methods: {</span><span style="color: #008000;">//</span><span style="color: #008000;">事件扩展</span>
<span style="color: #000000;">        onInit() {
            </span><span style="color: #008000;">//</span><span style="color: #008000;">动态设置查询界面table的高度,默认会进行计算高度到屏幕底部</span>
            <span style="color: #0000ff;">this</span>.tableHeight = 270<span style="color: #000000;">;
            </span><span style="color: #008000;">//</span><span style="color: #008000;">动态设置弹出框table的高度,默认会进行计算高度到弹出框底部</span>
            <span style="color: #0000ff;">this</span>.detailOptions.height = 180<span style="color: #000000;">;
            </span><span style="color: #008000;">//</span><span style="color: #008000;">本身已经自带所有按钮,也可以在这里自定义操作查询界面与编辑框页面的按钮</span>
            <span style="color: #008000;">//</span><span style="color: #008000;">删除以前的按钮</span>
            <span style="color: #0000ff;">this</span>.buttons.splice(3<span style="color: #000000;">);
            </span><span style="color: #008000;">//</span><span style="color: #008000;">添加自己的按钮,其他导入、删除等按钮可参照config-&gt;buttons.js配置</span>
            <span style="color: #0000ff;">this</span><span style="color: #000000;">.buttons.push(
                {
                    name: </span>"扩展的新建按钮"<span style="color: #000000;">,
                    icon: </span>'md-add'<span style="color: #000000;">,
                    value: </span>'Add'<span style="color: #000000;">,
                    class: </span>''<span style="color: #000000;">,
                    type: </span>'error'<span style="color: #000000;">,
                    onClick: </span><span style="color: #0000ff;">function</span><span style="color: #000000;"> () {
                        </span><span style="color: #0000ff;">this</span><span style="color: #000000;">.add();
                    }
                },
                {
                    name: </span>"onInit扩展的按钮"<span style="color: #000000;">,
                    icon: </span>'md-create'<span style="color: #000000;">,
                    value: </span>'Edit'<span style="color: #000000;">,
                    type: </span>'success'<span style="color: #000000;">,
                    index: </span>1,<span style="color: #008000;">//</span><span style="color: #008000;">显示的位置</span>
                    onClick: <span style="color: #0000ff;">function</span><span style="color: #000000;"> () {
                        </span><span style="color: #0000ff;">this</span>.$message.error("通过onInit扩展出来的按钮"<span style="color: #000000;">);
                    }
                }
            )

        },
        onInited() {
            </span><span style="color: #008000;">//</span><span style="color: #008000;">弹出框按钮</span>
            <span style="color: #0000ff;">this</span><span style="color: #000000;">.boxButtons.push(
                {
                    name: </span>"点我试试"<span style="color: #000000;">,
                    icon: </span>'md-add'<span style="color: #000000;">,
                    value: </span>'Add'<span style="color: #000000;">,
                    class: </span>''<span style="color: #000000;">,
                    type: </span>'error'<span style="color: #000000;">,
                    onClick: </span><span style="color: #0000ff;">function</span><span style="color: #000000;"> () {
                        </span><span style="color: #0000ff;">this</span>.$refs.modelBody.bodyModel = <span style="color: #0000ff;">true</span><span style="color: #000000;">;
                    }
                })
            </span><span style="color: #008000;">//</span><span style="color: #008000;">弹出框明细表的按钮</span>
            <span style="color: #0000ff;">this</span><span style="color: #000000;">.detailOptions.buttons.push(
                {
                    name: </span>"明细表扩展按钮"<span style="color: #000000;">,
                    icon: </span>'md-add'<span style="color: #000000;">,
                    value: </span>'Add'<span style="color: #000000;">,
                    class: </span>''<span style="color: #000000;">,
                    type: </span>'error'<span style="color: #000000;">,
                    onClick: </span><span style="color: #0000ff;">function</span><span style="color: #000000;"> () {
                        </span><span style="color: #0000ff;">this</span>.$message.error("onInited出来的明细button"<span style="color: #000000;">);
                    }
                })
            </span><span style="color: #008000;">//</span><span style="color: #008000;">给单元格添加事件及格式数据、自定颜色</span>
            <span style="color: #0000ff;">this</span>.columns.forEach(x =&gt;<span style="color: #000000;"> {
                </span><span style="color: #008000;">//</span><span style="color: #008000;">自定有数据源的颜色</span>
                <span style="color: #0000ff;">if</span> (x.field == "OrderType"<span style="color: #000000;">) {
                    x.getColor </span>= "#E91E63;"<span style="color: #000000;">
                }
                </span><span style="color: #0000ff;">if</span> (x.field == 'Qty'<span style="color: #000000;">) {
                    </span><span style="color: #008000;">//</span><span style="color: #008000;">添加事件</span>
                    x.click = (row, column, event) =&gt;<span style="color: #000000;"> {
                        </span><span style="color: #0000ff;">this</span>.$Message.error('这里是自己写的事件'<span style="color: #000000;">)
                    }
                    </span><span style="color: #008000;">//</span><span style="color: #008000;">格式化</span>
                    x.formatter = (row) =&gt;<span style="color: #000000;"> {
                        </span><span style="color: #0000ff;">return</span> "&lt;a&gt;" + row.Qty + '(点我试试)' + "&lt;/a&gt;"<span style="color: #000000;">;
                    }
                }

                </span><span style="color: #0000ff;">if</span> (x.field == 'Remark'<span style="color: #000000;">) {
                    </span><span style="color: #008000;">//</span><span style="color: #008000;">添加事件</span>
                    x.click = (row, column, event) =&gt;<span style="color: #000000;"> {
                        </span><span style="color: #0000ff;">this</span>.$refs.gridHeader.model = <span style="color: #0000ff;">true</span><span style="color: #000000;">;
                    }
                    </span><span style="color: #008000;">//</span><span style="color: #008000;">格式化</span>
                    x.formatter = (row) =&gt;<span style="color: #000000;"> {
                        </span><span style="color: #0000ff;">return</span> "&lt;a&gt;" + row.Remark + '(点击弹出框)' + "&lt;/a&gt;"<span style="color: #000000;">;
                    }
                }
            })
        },
        </span><span style="color: #008000;">//</span><span style="color: #008000;">其他可以在此处定义的事件，全部事件可参照serviceFilter.js或SellOrder.js</span>
<span style="color: #000000;">        mounted() {
            console.log(</span>'mounted'<span style="color: #000000;">);
        },
        searchBefore(param) { </span><span style="color: #008000;">//</span><span style="color: #008000;">查询ViewGird表数据前,param查询参数</span>
            console.log('表' + <span style="color: #0000ff;">this</span>.table.cnName + '触发loadTableBefore'<span style="color: #000000;">);
            </span><span style="color: #0000ff;">return</span> <span style="color: #0000ff;">true</span><span style="color: #000000;">;
        },
        searchAfter(param, result) { </span><span style="color: #008000;">//</span><span style="color: #008000;">查询ViewGird表数据后param查询参数,result回返查询的结果</span>
            console.log('表' + <span style="color: #0000ff;">this</span>.table.cnName + '触发loadTableAfter'<span style="color: #000000;">);
            </span><span style="color: #0000ff;">return</span> <span style="color: #0000ff;">true</span><span style="color: #000000;">;
        },
        searchDetailBefore(param) {</span><span style="color: #008000;">//</span><span style="color: #008000;">查询从表表数据前,param查询参数</span>
            console.log(<span style="color: #0000ff;">this</span>.detailOptions.cnName + '触发loadDetailTableBefore'<span style="color: #000000;">);
            </span><span style="color: #0000ff;">return</span> <span style="color: #0000ff;">true</span><span style="color: #000000;">;
        },
        searchDetailAfter(param, data) {</span><span style="color: #008000;">//</span><span style="color: #008000;">查询从表后param查询参数,result回返查询的结果</span>
            console.log(<span style="color: #0000ff;">this</span>.detailOptions.cnName + '触发loadDetailTableAfter'<span style="color: #000000;">);
            </span><span style="color: #0000ff;">return</span> <span style="color: #0000ff;">true</span><span style="color: #000000;">;
        },
        delBefore(ids, rows) { </span><span style="color: #008000;">//</span><span style="color: #008000;">查询界面的表删除前 ids为删除的id数组,,rows删除的行</span>
            <span style="color: #0000ff;">return</span> <span style="color: #0000ff;">true</span><span style="color: #000000;">;
        },
        delAfter(result) {</span><span style="color: #008000;">//</span><span style="color: #008000;">查询界面的表删除后</span>
            <span style="color: #0000ff;">return</span> <span style="color: #0000ff;">true</span><span style="color: #000000;">;
        },
    }
};
export </span><span style="color: #0000ff;">default</span> extension;</pre>
</div>
<p>&nbsp;</p>`, `<div class="cnblogs_code">
<pre>&lt;template&gt;
  &lt;div&gt;
    &lt;Alert type="info"&gt;此处是对ViewGird组件Header扩展的doc_viewGirdHeader.vue组件，你可以在此处写任何你想写的代码&lt;/Alert&gt;
    &lt;VolBox :model.sync="model" title="扩展子组件header中的弹出框" :height="400" :width="700" :padding="15"&gt;
      &lt;div&gt;
        &lt;div&gt;通过 <span style="color: #0000ff;">this</span>.$emit("parentCall", $vue =&gt; {})可以访问父组件ViewGird中的任何属性、对象、方法&lt;/div&gt;
        &lt;div&gt;当前选中的行：&lt;/div&gt;
        &lt;div&gt;{{text}}&lt;/div&gt;
      &lt;/div&gt;
      &lt;div slot="footer"&gt;
        &lt;Button type="error" @click="getParentEl()"&gt;获取父组件GridView选中的行数据&lt;/Button&gt;
        &lt;Button type="info" @click="()=&gt;{model=false}"&gt;点击关闭弹出框&lt;/Button&gt;
      &lt;/div&gt;
    &lt;/VolBox&gt;
  &lt;/div&gt;
&lt;/template&gt;
&lt;script&gt;<span style="color: #000000;">
import VolBox from </span>"@/components/basic/VolBox.vue"<span style="color: #000000;">;
export </span><span style="color: #0000ff;">default</span><span style="color: #000000;"> {
  components: { VolBox },
  data() {
    </span><span style="color: #0000ff;">return</span><span style="color: #000000;"> {
      text: </span>"无"<span style="color: #000000;">,
      model: </span><span style="color: #0000ff;">false</span><span style="color: #000000;">
    };
  },
  methods: {
    getParentEl() {
      </span><span style="color: #0000ff;">this</span>.$emit("parentCall", $vue =&gt;<span style="color: #000000;"> {
        </span><span style="color: #008000;">//</span><span style="color: #008000;">获取明细表$vue.getDetailSelectRows()选中的行;</span>
        let rows =<span style="color: #000000;"> $vue.getSelectRows();
        </span><span style="color: #0000ff;">if</span> (rows.length == 0<span style="color: #000000;">) {
          </span><span style="color: #0000ff;">return</span> <span style="color: #0000ff;">this</span>.$Message.error("请先请选中查询界面的行数据"<span style="color: #000000;">);
        }
        </span><span style="color: #0000ff;">this</span>.text =<span style="color: #000000;"> JSON.stringify(rows);
      });
    }
  }
};
</span>&lt;/script&gt;</pre>
</div>
<p>&nbsp;</p>`, `<div class="cnblogs_code">
<pre>&lt;template&gt;
  &lt;div&gt;
    &lt;Alert type="error"&gt;
      &lt;Button type="info" @click="getDetailSelectRow()"&gt;获取明细选中的行&lt;/Button&gt;
      &lt;div class="desc"&gt;1、此处是对ViewGird组件modelBody扩展的doc_viewGirdModelBody.vue组件，你可以在此处写任何你想写的代码&lt;/div&gt;
      &lt;div class="desc"&gt;2、通过 <span style="color: #0000ff;">this</span>.$emit("parentCall", $vue =&gt; {})可以访问父组件ViewGird中的任何属性、对象、方法&lt;/div&gt;
      &lt;div class="desc"&gt;
        3<span style="color: #000000;">、当前编辑的行数据：
        </span>&lt;div&gt;{{text}}&lt;/div&gt;
      &lt;/div&gt;
    &lt;/Alert&gt;
    &lt;<span style="color: #000000;">VolBox
      :model.sync</span>="bodyModel"<span style="color: #000000;">
      title</span>="扩展子组件modelBody中的弹出框"<span style="color: #000000;">
      :height</span>="280"<span style="color: #000000;">
      :width</span>="450"<span style="color: #000000;">
      :padding</span>="15"
    &gt;
      &lt;div&gt;
        &lt;div&gt;这里点击弹出框中的按钮触发的弹出框&lt;/div&gt;
      &lt;/div&gt;
    &lt;/VolBox&gt;
  &lt;/div&gt;
&lt;/template&gt;
&lt;script&gt;<span style="color: #000000;">
import VolBox from </span>"@/components/basic/VolBox.vue"<span style="color: #000000;">;

export </span><span style="color: #0000ff;">default</span><span style="color: #000000;"> {
  components: { VolBox },
  data() {
    </span><span style="color: #0000ff;">return</span><span style="color: #000000;"> {
      text: </span>"无"<span style="color: #000000;">,
      bodyModel: </span><span style="color: #0000ff;">false</span><span style="color: #000000;">
    };
  },
  created() {
    </span><span style="color: #0000ff;">this</span>.$emit("parentCall", $vue =&gt;<span style="color: #000000;"> {
      </span><span style="color: #008000;">//</span><span style="color: #008000;">获取当前编辑的行;</span>
      <span style="color: #0000ff;">this</span>.text =<span style="color: #000000;"> JSON.stringify($vue.currentRow);
    });
  },
  methods: {
    getDetailSelectRow() {
      </span><span style="color: #0000ff;">this</span>.$emit("parentCall", $vue =&gt;<span style="color: #000000;"> {
        </span><span style="color: #008000;">//</span><span style="color: #008000;">获取当前编辑的行;</span>
        let rows =<span style="color: #000000;"> $vue.getDetailSelectRows();
        </span><span style="color: #0000ff;">if</span> (rows.length == 0<span style="color: #000000;">) {
          </span><span style="color: #0000ff;">return</span> <span style="color: #0000ff;">this</span>.$Message.error("请选中订单明细的行"<span style="color: #000000;">);
        }
        </span><span style="color: #0000ff;">this</span><span style="color: #000000;">.$Message.error(JSON.stringify(rows));
      });
    }
  }
};
</span>&lt;/script&gt;
&lt;style scoped&gt;<span style="color: #000000;">
.desc {
  padding: 3px 5px;
}
</span>&lt;/style&gt;</pre>
</div>
<p>&nbsp;</p>`,]
    };
  },
  methods: {}
};
</script>
