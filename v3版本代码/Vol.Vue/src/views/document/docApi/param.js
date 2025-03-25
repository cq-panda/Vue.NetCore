const param = {
  icons: {
    attr: [],
    methods: [{ name: "on-select", desc: "选中图标事件", param: "图标样式名" }]
  },
  form: {
    attr: [{ name: "loadKey", desc: "是否自动绑定select/checkboxt等标签的数据源", type: "bool", default: "false" },
    { name: "width", desc: "表单宽度", type: "number", default: "100%" },
    { name: "labelWidth", desc: "左边标签宽度", type: "number", default: "100" },
    { name: "formFields", desc: "表单字段存的值，如:{name:'admin',age:''}", type: "json", default: "" },
   // { name: "formFields", desc: "<span style='color:red;'>表单字段同上（此属性用于兼容上面字段拼写错误的问题，2020.09.13更新后才能使用）</span>", type: "json", default: "" },
    { name: "disabled", desc: "是否只读", type: "bool", default: "false" },
    { name: "placeholder", desc: "标签提示文字", type: "string", default: "" },
    { name: "colSize", desc: "每行列的宽度，可选值:12,8,6,如果是12标签会占100%宽度", type: "number", default: "" },
    { name: "表单配置参数", desc: "表单字段的参数配置说明(数组的元素个数决定了表单每行显示的标签个数),配置实例参照【查看代码】", type: "array", default: "[]" },
    { name: "[[{", desc: "表单字段formRules的参数配置说明", type: "", default: "" },
    { name: "dataKey", desc: "数据源字典编号(菜单->系统->下拉框绑定中的字典编号)", type: "string", default: "" },
    { name: "data", desc: "数据源，可以手动绑定格式[{key:1,value:'是',hidden:false,disabled:false}],(hidden下拉框选项是否隐藏,disabled下拉框选项是否禁用,2022.05.08更新后才能使用),也可以自动绑定,自定绑定需要设置属性loadKey='true'", type: "array", default: "[]" },
    { name: "render", desc: "<span style='color:red;'>支持vue原生render处理,[前端开发->render渲染form对象1/2]为配置示例，render完整用法见vue官方文档(2020.06.20)</span>", type: "function", default: "" },
    { name: "title", desc: "标签名称", type: "string", default: "" },
    //
    { name: "disabled/readonly", desc: "是否只读", type: "bool", default: "false" },
    { name: "inputStyle", desc: "<span style='color:red;'>输入框或者只读的自定义样式(只有vue3生效)</span>", type: "bool", default: "false" },
    { name: "hidden", desc: "<span style='color:red;'>字段(标签)是否显示2020.11.21</span>", type: "bool", default: "" },
    { name: "required", desc: "是否必填", type: "bool", default: "false" },
    { name: "field", desc: "字段，与表单字段必须相同", type: "string", default: "" },
    { name: "filter", desc: "启用搜索,只对select/selectList生效,默认下拉框数据源超出10个开启搜索", type: "bool", default: "false" },
    { name: "type", desc: "渲染的标签类型,可选值,mail、text、textarea、img、checkbox、number、decimal、date、datetime、phone、switch、select、selectList(多选下拉框)、label(纯文本显示,vue3版本有效)、cascader(Iview级联组件,具体配置见上面[查看代码],2020.05.31)", type: "string", default: "text" },
    { name: "range", desc: "如果type是日期，需要选开始与结束日期,(2021.05.02增加区间文本)", type: "bool", default: "false" },
    { name: "min", desc: `字段如果是数字，会自动验证数字最大、小值；如果是字符串,
    会验证字符长度，如果日期，会限制日期可选范围<span style='color:red'>(日期范围选择2021.07.17更新volform.vue/voltable.vue组件后才能使用)</span>`, type: "number", default: "" },
    { name: "max", desc: "最大值,操作与min相同", type: "number", default: "" },
    {
      name: "validator",
      desc: "对标签的值进行自定义验证，如：    validator: (rule, val, callback) => {\
            if (val != '234') {\
              return callback(new Error('必须输入【234】'));\
            }\
            return callback();\
          }",
      type: "function",
      default: ""
    },
    {
      name: "onKeyPress",
      desc: '只对input/textarea生效,onKeyPress: $event => {\
                if ($event.keyCode == 13) {}\
              }',
      type: "function",
      default: ""
    },
    {
      name: "onChange", desc: `仅对select、date、datetime、checkbox生效（2020.07.24）
        <p>
	onChange: (value, option) =&gt; {
</p>
<p>
	}
</p>`, type: "function", default: ""
    },
    { name: "url", desc: "从指定后台url(例：api/xx/xx)远程搜索，(返回的数据格式:[{key:'x',value:'x1'}])，type=select生效", type: "bool", default: "false" },
    { name: "remote", desc: "开启后台字典远程搜索(后台字典必须配置必须是自定sql)，type=select才会生效", type: "bool", default: "false" },
    { name: "extra", desc: '添加额外标签：  extra: {//样式 style: "color:red",//显示图标 icon: "ios-search", //显示文本 text: "点击可触发事件",//触发事件 click: item => {}}', type: "string", default: "" },
    { name: "minRows", desc: "textarea标签最小高度", type: "number", default: "2" },
    { name: "maxRows", desc: "textarea标签最大高度", type: "number", default: "10" },
    { name: "}]]", desc: "表单字段formRules的参数配置说明", type: "", default: "" },
    { name: "表单重置", desc: "表单重置使用：this.$refs.你的ref名字.reset()", type: "", default: "" },
    { name: "表单验证", desc: "表单验证使用：this.$refs.myform.validate(()=>{}),只有验证通过才会执行回调", type: "", default: "" },
    { name: "数据槽slot", desc: "可以在表单的第一行第前使用<div name='header'></div>或最后一行<div name='footer'></div>", type: "", default: "" }
    ],
    methods: []
  },
  header: {
    attr: [{ name: "icon", desc: "显示图标", type: "string", default: "" },
    { name: "text", desc: "显示名称", type: "string", default: "" },
    { name: "slot数据槽", desc: "右边button显示的这部份内容", type: "", default: "" },
    { name: "slot数据槽content", desc: "使用方式<div slot='content'>VolHeader这里可以定义显示内容</div>", type: "", default: "" }
    ],
    methods: []
  },
  box: {
    attr: [{ name: "title", desc: "弹出框标题", type: "string", default: "基本信息" },
    { name: "icon", desc: "弹出框图标", type: "string", default: "ios-information-circle-outline" },
    { name: "model", desc: "是否显示弹出框", type: "bool", default: "false" },
    { name: "lazy", desc: "<span style='color:red;'>是否延迟加载(建议开启)2020.12.06</span>", type: "bool", default: "false" },
    { name: "height", desc: "弹出框高度", type: "int", default: "200" },
    { name: "width", desc: "弹出框宽度", type: "int", default: "650" },
    { name: "padding", desc: "弹出框内容padding大小", type: "int", default: "16" },
    { name: "mask", desc: "弹出框是否显示遮罩", type: "boole", default: "true" },
    { name: "数据槽slot", desc: "弹出框内容", type: "", default: "" },
    { name: "数据槽footer", desc: "弹出框底部按钮，默认只有一个关闭按钮，如果加了 <div slot='footer'></div>关闭按钮不会显示，需要自己添加", type: "", default: "" }
    ],
    methods: []
  },
  voltable: {
    attr: [
      { name: "rowKey", desc: "<span style='color:red;'>treetable的主键字段(需要与下面loadTreeChildren方法配置使用2021.05.02)</span>", type: "string", default: "" },
      { name: "loadKey", desc: "是否自动绑定数据源key/value,如果=true会自动把带bind属性data长度为0的列绑定上数据源", type: "bool", default: "false" },
    { name: "height", desc: "table高度", type: "number", default: "" },
    { name: "clickEdit", desc: "单击编辑与单击结束编辑(2020.10.11)", type: "bool", default: "false" },
    { name: "max-height", desc: "table最大高度,如果设置了max-height属性，height属性将不会生效", type: "number", default: "" },
    { name: "single", desc: "是否只能单选", type: "number", default: "false" },
    { name: "ck", desc: "是否显示checkbox", type: "bool", default: "true" },
    { name: "columnIndex", desc: "是否显示index序号(2020.11.01)", type: "bool", default: "false" },
    { name: "--", desc: "--", type: "--", default: "--" },
    { name: "pagination", desc: "分页参数", type: "json", default: "{ total: 0, size: 0, sortName: ''}" },
    { name: "{", desc: "", type: "", default: "" },
    { name: "total", desc: "总数量", type: "number", default: "0" },
    { name: "size", desc: "分页大小", type: "number", default: "0" },
    { name: "sizes", desc: "分页条数", type: "Array", default: "[30,60,100,120]" },
    { name: "sortName", desc: "排序字段", type: "string", default: "" },
    { name: "}", desc: "", type: "", default: "" },
    { name: "--", desc: "--", type: "--", default: "--" },
    { name: "url", desc: `api接口地址，配置了url默认从接口加载数据,查询条件在loadBefore中实现,如<vol-table @loadBefore='loadBefore'></vol-table>,在methods中添加loadBefore方法，见下面loadBefore
    <br><div style='color:red;'>注意：接口参数返回格式为:{rows:[],total:100,summary:{price:70,qty:20}} //rows为返回的数据，total为总数量,summary为表格汇总信息没有可以不用返回,或者随便点开生成的页面点查询，看返回的数据格式</div>`, type: "string", default: "" }, { name: "defaultLoadPage", desc: "传入了url参数，是否默认加载表格数据", type: "bool", default: "true" },
    { name: "paginationHide", desc: "是否隐藏分页数据", type: "bool", default: "true" },
    { name: "index", desc: "是否创建索引号(如果启用编辑功能,index必须设置为true)", type: "bool", default: "false" },
    { name: "tableData", desc: "table表数据，如果不需要从远程加载table数据，请设置tableData属性,格式:[{'字段1':'值1'},{'字段2':'值2'}]", type: "array", default: "[]" },
    { name: "--", desc: "--", type: "--", default: "--" },
    { name: "columns", desc: "table表参数配置", type: "array", default: "[]" },
    { name: "{-----", desc: "-----columns属性介绍开始处-----", type: "-----", default: "-----" },
    { name: "field", desc: "字段", type: "string", default: "" },
    { name: "render", desc: "<span style='color:red;'>支持vue原生render处理,[前端开发->render渲染form对象1/2]为配置示例，render完整用法见vue官方文档(2020.06.20)</span>", type: "function", default: "" },
    { name: "cellStyle", desc: "<span style='color:red;'>单元格td背景颜色,cellStyle:(row, rowIndex, columnIndex)=>  return { background: '#f3f3f3' }  2020.12.13 </span>", type: "function", default: "" },
    { name: "title", desc: "table列名", type: "string", default: "" },
    { name: "showOverflowTooltip", desc: "<span style='color:red;'>当内容过长被隐藏时显示tooltip(2022.08.26更新voltable.vue组件,仅支持vue3版本)</span>", type: "boll", default: "false" },
    { name: "width", desc: "列宽度", type: "number", default: "" },
    { name: "sort", desc: "是否排序列", type: "bool", default: "false" },
    { name: "hidden", desc: "是否隐藏列", type: "bool", default: "false" },
    { name: "fixed", desc: "是否固定列", type: "bool", default: "false" },
    { name: "type", desc: "目前只有img,file(设置了此属性，点击即可下载文件),其他不需要设置", type: "string", default: "" },
    { name: "required", desc: "是否必填项(设置edit了属性才会生效)", type: "bool", default: "false" },
    { name: "summary", desc: "是否显示统计求和,目前远程api返回的数据才有效，前台参照sellorder.js配置,后台可参照SellOrder表查询数据返回的格式", type: "bool", default: "false" },
    { name: "readonly", desc: "<span style='color:red;'>2021.09.21(vue3版本可用),单元格是否只读,为true时单元格不可以编辑，下面edit属性会同时失效(应用场景：动态设置table列是否可以编辑)</span>", type: "bool", default: "false" },
    { name: "edit:{", desc: "表格编辑配置", type: "json", default: "" },
    { name: "type", desc: "编辑创建的标签类型：number、decimal、text、datetime、date、switch、select", type: "", default: "" },
    { name: "keep", desc: "当前单元格始终处于编辑状态", type: "bool", default: "false" },
    { name: "min", desc: "type为number、decimal时验证最小值,其他验证长度", type: "number", default: "" },
    { name: "max}", desc: "同上min", type: "number", default: "" },
    { name: "normal", desc: "是否移除table列数据源显示的背景颜色，2020.09.06", type: "bool", default: "false" },
    {
      name: "getStyle", desc: `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:1.2;white-space:pre;">
            <div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:1.2;white-space:pre;">
                <p>
                    <span style="display:none;"></span> 
                </p>
                <p style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:0px;color:#D4D4D4;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:normal;">
                    <span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;color:#DCDCAA;">getStyle<span style="display:none;"></span></span>:(<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;color:#9CDCFE;">row</span>,&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;color:#9CDCFE;">column</span>)&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;color:#569CD6;">=&gt;</span>&nbsp;{
                </p>
                <p style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:0px;color:#D4D4D4;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:normal;">
                    &nbsp; &nbsp; <span style="color:#60D978;">&nbsp; &nbsp;</span><span style="display:none;"></span><span style="color:#60D978;"> &nbsp; //设置列的背景颜色，只在设置normal=true属性后才会生效,2020.09.06</span><span style="display:none;"></span>
                </p>
                <div style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:0px;color:#D4D4D4;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:normal;">
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;color:#C586C0;">if</span>&nbsp;(<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;color:#9CDCFE;">row</span>.<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;color:#9CDCFE;">City</span>&nbsp;==&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;color:#CE9178;">"北京市"</span>)&nbsp;{
                </div>
                <div style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:0px;color:#D4D4D4;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:normal;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;color:#C586C0;">return</span>&nbsp;{&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;color:#9CDCFE;">color</span><span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;color:#9CDCFE;">:</span>&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;color:#CE9178;">"red"</span>,&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;color:#9CDCFE;">cursor</span><span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;color:#9CDCFE;">:</span>&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;color:#CE9178;">"pointer"</span>&nbsp;};
                </div>
                <div style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:0px;color:#D4D4D4;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:normal;">
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}
                </div>
                <div style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:0px;color:#D4D4D4;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:normal;">
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;color:#C586C0;">return</span>&nbsp;{&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;color:#9CDCFE;">color</span><span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;color:#9CDCFE;">:</span>&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;color:#CE9178;">"blue"</span>,&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;color:#9CDCFE;">cursor</span><span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;color:#9CDCFE;">:</span>&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;color:#CE9178;">"pointer"</span>&nbsp;};
                </div>
                <div style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:0px;color:#D4D4D4;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:normal;">
                    &nbsp; &nbsp;}
                </div>
        <br />
        <span style="display:none;"></span> 
                <p>
                    <br />
                </p>
            </div>
        </div>`, type: "function", default: "--"
    },
    { name: "--", desc: "--", type: "--", default: "--" },
    {
      name: "onChange",
      desc: `<div class="cnblogs_Highlighter">
        <div>select、switch、date、datetime组件选择事件(只对编辑生效)</div>
        <div>为date、datetime时onChange(row,column,date)只有这三个参数，2023.04.11以前的代码需要更新voltable.vue文件</div>
        <div>onChange:(column,row,tableData,value)=&gt;{</div>
        <pre class="brush:javascript;gutter:true;"><em id="__mceDel">             this.$Message.error(row["test2"]);
                    },
        </em></pre>
        </div>
        <p>　　</p>`,
      type: "function",
      default: ""
    },
    { name: "extra", desc: "额外标签(只对编辑生效)", type: "json", default: "" },
    {
      name: "额外标签",
      desc: `<div class="cnblogs_code">
        <pre><span style="color: #000000;">   extra: {
                    icon: </span>"ios-search", <span style="color: #008000;">//</span><span style="color: #008000;">图标</span>
                    text: "点击事件",<span style="color: #008000;">//</span><span style="color: #008000;">显示文本</span>
                    style: "line-height: 31px;margin-left: 3px;",<span style="color: #008000;">//</span><span style="color: #008000;">自定义样式</span>
                    <span style="color: #008000;">//</span><span style="color: #008000;">column列配置, row数据, tableData整个table的数据源</span>
                    click: (column, row, tableData) =&gt;<span style="color: #000000;"> {
                      </span><span style="color: #008000;">//</span><span style="color: #008000;">  this.getRows();</span>
                      <span style="color: #0000ff;">this</span>.$Message.error("点击标签触发的事件"<span style="color: #000000;">);
                    }
                  }</span></pre>
        </div>
        <p>&nbsp;</p>`,
      type: "",
      default: ""
    },
    { name: "bind{", desc: "数据源绑定配置", type: "json", default: "" },
    { name: "key", desc: "后台字典数据的key", type: "string", default: "" },
    { name: "data}", desc: "数据源,如果设置的loadKey=true,些处将设置为data:[]。格式:[{key:'1',value:'北京市'},{key:'2',value:'上海市',hidden:false,disabled:false}],(hidden下拉框选项是否隐藏,disabled下拉框选项是否禁用,2022.05.08更新后才能使用),如果data长度>0，不会被loadKey从后台加载的数据源覆盖", type: "array", default: "[]" },
    { name: "formatter", desc: "列格式化处理,格式：formatter:(row) => {return '123'}", type: "function", default: "" },
    { name: "click", desc: "单元格点击事件,格式：click: (row, column, event) => {}", type: "function", default: "" },
    { name: "getColor", desc: "设置绑定了bind数据源属性的单元格颜色,格式：getColor:(row) => {return 'red'}", type: "function", default: "" },
    { name: "-----}", desc: "-----columns属性介绍结尾处-----", type: "-----", default: "-----" }, 
    ],
    methods: [{ name: "delRow", desc: "删除选中行，this.$refs.自定义的名字.delRow()", param: "" },
    { name: "addRow", desc: "添加行，this.$refs.自定义的名字.addRow({'字段1':'值1','字段2':'值2'})；<br>批量添加行：this.$refs.自定义的名字.rowData.push(...[{'字段1':'值1'},{'字段2':'值2'}]);//<br>(vue3版本不要循环添加，请使用批量添加", param: "" },
    { name: "selection", desc: "获取选中的行，this.$refs.自定义的名字.selection,注意此处selection是属性", param: "" },
    { name: "getSelected", desc: "获取选中的行(vue3版本才能使用)，this.$refs.自定义的ref名字.getSelected()", param: "" },
    { name: "获取底部统计合计数据", desc: "this.$refs.自定义的ref名字.summaryData", param: "" },
    { name: "获取/设置table正在编辑的行", desc: "this.$refs.自定义的ref名字.edit.rowIndex //设置值可以指定某行处于编辑状态，值为-1时关闭编辑状态，", param: "" },
    { name: "tableData/rowData", desc: "获取表中的所有行数据", param: "this.$refs.自定义的名字.tableData/rowData(如果传入了url参数，使用rowData)" },
    { name: "reset", desc: "清空表数据", param: "this.$refs.自定义的名字.reset" },
    { name: "load", desc: `<p>
    <div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;">
      <div>
        <div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;">
          <div>
            &nbsp; <span style="color:#6a9955;">//刷新表数据，this.$refs.自定义的名字.load(params,true)//也可以在loadBefore方法中实现查询条件</span>
          </div>
          <div>
            &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">/*params查询条件格式：</span>
          </div>
          <div>
            <span style="color:#6a9955;">&nbsp; &nbsp; &nbsp; let params = {</span>
          </div>
          <div>
            <span style="color:#6a9955;">&nbsp; &nbsp; &nbsp; &nbsp; page: 1,//分页页数(可不填)</span>
          </div>
          <div>
            <span style="color:#6a9955;">&nbsp; &nbsp; &nbsp; &nbsp; rows: 30,//分页大小(可不填)</span>
          </div>
          <div>
            <span style="color:#6a9955;">&nbsp; &nbsp; &nbsp; &nbsp; sort:"排序字段",//可不填</span>
          </div>
          <div>
            <span style="color:#6a9955;">&nbsp; &nbsp; &nbsp; &nbsp; order: "desc/asc", //可不填</span>
          </div>
          <div>
            <span style="color:#6a9955;">&nbsp; &nbsp; &nbsp; &nbsp; wheres: [{ name: "字段1", value: "xx",displayType:"select/selectList/like" },</span>
          </div>
          <div>
            <span style="color:#6a9955;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ name: "字段2", value: "x2",displayType:"select/selectList/like" }]// 查询条件(可不填) &nbsp; &nbsp; &nbsp; &nbsp;</span>
          </div>
          <div>
            <span style="color:#6a9955;">&nbsp; &nbsp; &nbsp; };*/</span>
          </div>
          <div>
            &nbsp; &nbsp;
          </div>
          <div>
            &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//第二个参数true:是否重置分页信息</span>
          </div>
        </div>
      </div>
      <div>
      </div>
    </div>
  </p>
  <p>
    <br />
  </p>`, param: "" },
    { name: "resetPage", desc: "重置分页信息，this.$refs.自定义的名字.resetPage()", param: "" },
    {
      name: "loadBefore", desc: `从后台加载数据前处理，也可参照【从api加载数据】Demo", param: "(param, callBack) 参数：param为查询相关配置，可自己修改此配置;callBack回调方法，callBack(true),如果回调传入false，将中断代码执行,<span style="display:none;"></span><span style="line-height:2;font-size:18px;"><span style="display:none;"></span><span style="font-size:14px;">&nbsp; &nbsp;
        <br/>
        /*查询前处理(如果需要查询条件，实现组件方法loadBefore方法即可:</span><br />
            <span style="font-size:14px;"> &nbsp; &nbsp; &nbsp; &nbsp; loadBefore(param, callBack){</span><br />
            <span style="font-size:14px;"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; param.wheres.push(...[{ name: "PhoneNo", value: "1234567890" }]);</span><br />
            <span style="font-size:14px;"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; callBack(true);</span><br />
            <span style="font-size:14px;"> &nbsp; &nbsp; &nbsp; &nbsp; })</span><br />
            <span style="font-size:14px;"> &nbsp; &nbsp; &nbsp; */</span><br />
            </span><span style="line-height:1.5;font-size:18px;"><span style="display:none;"></span></span><br />` },
    { name: "loadAfter", desc: "从后台加载数据后处理，可参照【从api加载数据】Demo", param: "(data, callBack) 参数：data为后台返回的数据;callBack回调方法，callBack(true),如果回调传入false，将中断代码执行" },
    { name: "rowChange", desc: "行选中事件,只有设置single=true单选才会生效", param: "row,当前选中的行 " },
    { name: "rowClick", desc: `单击行事件同时选中当前行选中:
    <p>
    rowClick ({ row, column, event }) {   </p>
    <p>&nbsp;// this.$refs.table.$refs.table.clearSelection();//清除当前选中的行  </p>
        <p>&nbsp; this.$refs.table.$refs.table.toggleRowSelection(row);  </p>
        <p> },  </p>
    </p>
    `, param: "{row:当前选中的行,column:当前行配置,$event:当前事件}" },
    { name: "rowDbClick", desc: "双击行事件(2021.05.23新增),点击时选中当前行，见上面rowClick", param: "{row:当前选中的行,column:当前行配置,$event:当前事件}" },
    { name: "loadTreeChildren", desc: `<span style="color:red;"></span>&nbsp; loadTreeChildren(tree, treeNode, resolve) { //加载子节点<br />
      &nbsp; &nbsp; &nbsp; let url="api/xxx?roleId="+tree.Role_Id<br />
      &nbsp; &nbsp; &nbsp; this.http.post(url,{}).then(result=&gt;{<br />
      &nbsp; &nbsp; &nbsp; &nbsp; resolve(result.rows)<br />
      &nbsp; &nbsp; &nbsp; })<br />
      &nbsp; &nbsp; }<br /></span>
      <div style="color:red;">2021.05.02具体使用见示例说明见:<a href="http://volcore.xyz/treetable3"> 树形菜单与表->treetable页面</a>  <a href="http://volcore.xyz/Sys_Role1"> 用户基础信息->角色管理(tree)页面</a> </div>`, param: "" }
    ]
  },
  edittable: {
    attr: [],
    methods: []
  },
  viewGrid: {
    attr: [
      { name: "重要说明", desc: "<span style='color:red;'>此处列出来的这些属性，在生成页面对应表名的.js文件onInit中可以直接this.xx使用,见下面示例", type: "json", default: "" },
      { name: "自定义扩展页面获取父组件(获取生成页面对象)", desc: "<span styl`e='color:red;'>1、通过 this.$emit('parentCall', $parent => { //如：调用页面查询 $parent.search()  })可以访问父组件ViewGird中的任何属性、对象、方法<p>2、见上面示例【扩展弹出框按钮】</p></span>", type: "", default: "" },
      { name: "获取自定义扩展页面", desc: "this.$refs.gridHeader/gridBody/gridFooter/modelHeader/modelBody/modelFooter", type: "", default: "" },
      { name: "rowKey", desc: "<span style='color:red;'>树形table的主键字段,字段的值必须是唯一的(2021.05.02)</span>", type: "String", default: "" },
      { name: "columns", desc: "查询页面table表的配置,如果满足不了业务,可参照VolTable参数动态扩展", type: "array", default: "[]" },
    { name: "detail", desc: "从表配置：{columns:[],sortName:''},columns从表table列配置,sortName从表排序字段", type: "json", default: "{}" },
  //  { name: "editFormFileds", desc: "编辑字段，可参照VolForm配置", type: "json", default: "{}" },
    { name: "editFormFields", desc: "<span style='color:red;'>编辑字段，可参照VolForm配置</span>", type: "json", default: "" },
    { name: "editFormOptions", desc: "编辑配置,，可参照VolForm配置", type: "array", default: "[]" },
   // { name: "searchFormFileds", desc: "查询字段，同上", type: "json", default: "{}" },
    { name: "searchFormFields", desc: "<span style='color:red;'>查询字段同上</span>", type: "json", default: "" },
    { name: "searchFormOptions", desc: "查询配置，同上", type: "array", default: "[]" },
    { name: "select2Count", desc: "下拉框选项超出500个后会启用element plus中的select2组件", type: "int", default: "500" },
    
    {
      name: "table",
      desc: "表其他配置,如：     table: {\
            key: 'Order_Id', //排序字段\
            footer: 'Foots',\
            cnName: '主从表ViewGird组件使用',//表中文名\
            name: 'SellOrder',//表名(代码生码的别名)\
            url: '/SellOrder/',//后台控制器名\
            sortName: 'CreateDate' //后台排序字段}",
      type: "array",
      default: "{}"
    },
    { name: "extend", desc: "扩展js中的所有对象,如:doc_viewGirdExtension.js整个js文件的对象", type: "json", default: "array" },
    { name: "single", desc: "查询界面的表是否只能单选", type: "bool", default: "false" },
    { name: "continueAdd", desc: "连续添加(新建功能连续添加不会关闭弹出框)", type: "bool", default: "false" },
    { name: "continueAddName", desc: "连续添加的按钮文字", type: "string", default: "保存后继续添加" },
    { name: "downloadFileName", desc: "自定义导出文件名(2022.09.26更新前端组件后才能使用)", type: "string", default: "" },
    { name: "boxModel", desc: "弹出新建、编辑框状态", type: "bool", default: "false" },
    { name: "currentAction", desc: "当前操作的状态:如：Add,Update", type: "string", default: "" },
    { name: "currentRow", desc: "当前编辑的行数据", type: "json", default: "" },
    { name: "labelWidth", desc: "高级查询label标签的宽度", type: "number", default: "100" },
    { name: "maxBtnLength", desc: "查询界面显示的按钮最大数量，超过的在更多中显示", type: "number", default: "3" },
    { name: "ck", desc: "<span  style='color:red'>是否显示checkbox(2020.11.01)</span>", type: "bool", default: "true" },
    { name: "columnIndex", desc: "是否显示index序号(2020.11.01)", type: "bool", default: "false" },
    { name: "textInline", desc: "<span style='color:red'>table内容超出后自动换行(2021.01.16)</span>", type: "bool", default: "true" },
    { name: "(获取焦点)获取表单原生dom标签", desc: "this.$refs.form.$refs.字段名<br>使用场景:新建/编辑时设置input标签设置焦点：this.$refs.form.$refs.字段名[0].focus()<br>(2022.09.12更新volform.vue文件后才能使用)", param: "" },
    {
      name: "buttons", desc: `查询界面的所有按钮，[{<br />
          &nbsp; &nbsp; name: "刷 新",//按钮名称<br />
          &nbsp; &nbsp; icon: 'md-refresh',//按钮图标，参照iview图标<br />
          &nbsp; &nbsp; type: 'success',//按钮类型,可参照iview buttons设置此属性<br />
          &nbsp; &nbsp; hidden:false,//是否隐藏按钮(如果想要隐藏按钮，在onInited方法中遍历buttons，设置hidden=true)<br />
          &nbsp; &nbsp; onClick: function () { //触发事件<br />
          &nbsp; &nbsp; &nbsp; &nbsp; this.refresh();<br />
          &nbsp; &nbsp; }<br />
          }]<br />`, type: "array", default: "[]"
    },
    { name: "boxButtons", desc: "弹出框的所有按钮，格式同上", type: "array", default: "[]" },
    { name: "dicKeys", desc: "所有数据源的字典编号", type: "array", default: "[]" },
    { name: "hasKeyField", desc: "所有有数据源的字段", type: "array", default: "[]" },
    { name: "load", desc: "页面打开后是否默认加载表格数据", type: "bool", default: "true" },
    { name: "activatedLoad", desc: "页面触发actived时是否刷新页面数据", type: "bool", default: "false" },
    { name: "hasDetail", desc: "是否有明细表数据(可控制新建、编辑弹出框中的明细表是否显示2022.04.17更新viewgrid.vue才能使用)", type: "bool", default: "false" },
    //{ name: "summary", desc: "查询界面是否显示统计和求，设置为true需要实现后台SummaryExpress方法,可参照SellOrderService实现", type: "bool", default: "false" },
    {
      name: "detailOptions",
      desc: `<div class="cnblogs_code">
            <pre></pre>
            <div class="cnblogs_code">
            <pre><span style="color: #000000;">
                 明细表参数
                 detailOptions: {
                    </span><span style="color: #008000;">//</span><span style="color: #008000;">弹出框从表(明细)对象</span>
                    <span style="color: #008000;">//</span><span style="color: #008000;">从表配置</span>
                    buttons: [], <span style="color: #008000;">//</span><span style="color: #008000;">弹出框从表表格操作按钮,目前有删除行，添加行，刷新操作，如需要其他操作按钮，可在表对应的.js中添加</span>
                    cnName: "", <span style="color: #008000;">//</span><span style="color: #008000;">从表名称</span>
                    key: "", <span style="color: #008000;">//</span><span style="color: #008000;">从表主键名</span>
                    data: [], <span style="color: #008000;">//</span><span style="color: #008000;">数据源</span>
                    columns: [], <span style="color: #008000;">//</span><span style="color: #008000;">从表列信息</span>
                    textInline: <span style="color: #0000ff;">true</span>, <span style="color: #008000;">//</span><span style="color: #008000;">明细表行内容显示在一行上，如果需要换行显示，请设置为false2022.08.16</span>
                    edit: <span style="color: #0000ff;">true</span>, <span style="color: #008000;">//</span><span style="color: #008000;">明细是否可以编辑</span>
                    single:<span style="color: #0000ff;">false</span>,<span style="color: #008000;">//</span><span style="color: #008000;">明细表是否单选</span>
                    delKeys: [], <span style="color: #008000;">//</span><span style="color: #008000;">当编辑时删除当前明细的行主键值</span>
                    url: "", <span style="color: #008000;">//</span><span style="color: #008000;">从表加载数据的url</span>
                    pagination: { total: 0, size: 100, sortName: "" }, <span style="color: #008000;">//</span><span style="color: #008000;">从表分页配置数据</span>
                    height: 0, <span style="color: #008000;">//</span><span style="color: #008000;">默认从表高度</span>
                    doubleEdit: <span style="color: #0000ff;">true</span>, <span style="color: #008000;">//</span><span style="color: #008000;">使用双击编辑</span>
                    columnIndex: <span style="color: #0000ff;">false</span>, <span style="color: #008000;">//</span><span style="color: #008000;">是否显示index序号(2020.11.01)</span>
                    ck: <span style="color: #0000ff;">true</span>, <span style="color: #008000;">//</span><span style="color: #008000;">是否显示checkbox(2020.11.01)</span>
                    <span style="color: #008000;">//</span><span style="color: #008000;">开启编辑时</span>
                    beginEdit: (row, column, index) =&gt;<span style="color: #000000;"> {
                      </span><span style="color: #0000ff;">return</span> <span style="color: #0000ff;">true</span><span style="color: #000000;">;
                    },
                    </span><span style="color: #008000;">//</span><span style="color: #008000;">结束编辑前</span>
                    endEditBefore: (row, column, index) =&gt;<span style="color: #000000;"> {
                      </span><span style="color: #0000ff;">return</span> <span style="color: #0000ff;">true</span><span style="color: #000000;">;
                    },
                    </span><span style="color: #008000;">//</span><span style="color: #008000;">结束编辑后</span>
                    endEditAfter: (row, column, index) =&gt;<span style="color: #000000;"> {
                      </span><span style="color: #0000ff;">return</span> <span style="color: #0000ff;">true</span><span style="color: #000000;">;
                    },
                    <span style="color: #008000;">summary:弹出框明细表是否显示统计和求，设置为true需要实现后台GetDetailSummary方法,可参照SellOrderService实现</span>,
             }</span></pre>
            </div>
            <pre></pre>
            <p>&nbsp;</p>
            <pre><span style="color: #000000;">&nbsp;</span></pre>
            </div>
            <p>&nbsp;</p>`,
      type: "json",
      default: ""
    },
    {
      name: "auditParam",
      desc: `审核参数<div class="cnblogs_code">
        <pre><span style="color: #000000;">    auditParam: {
                </span><span style="color: #008000;">//</span><span style="color: #008000;">审核对象</span>
                rows: 0, <span style="color: #008000;">//</span><span style="color: #008000;">当前选中审核的行数</span>
                model: <span style="color: #0000ff;">false</span>, <span style="color: #008000;">//</span><span style="color: #008000;">审核弹出框</span>
                status: -1, <span style="color: #008000;">//</span><span style="color: #008000;">审核结果</span>
                reason: "", <span style="color: #008000;">//</span><span style="color: #008000;">审核原因</span>
                <span style="color: #008000;">//</span><span style="color: #008000;">审核选项(可自行再添加)</span>
                data: [{ text: "通过", status: 1 }, { text: "拒绝", status: 2<span style="color: #000000;"> }]
              },</span></pre>
        </div>
        <p>&nbsp;</p>`
    },
    { name: "tableHeight", desc: "指定页面table的高度(只能在onInit方法中使用)", type: "number", default: "0" },
    { name: "height", desc: "查询页面table的高度,值已经计算好了(只能在onInited方法中使用)", type: "number", default: "计算后的高度" },
    { name: "tableMaxHeight", desc: "查询页面table的最大高度,如果同时设置了tableHeight，只会tableMaxHeight起作用", type: "number", default: "0" },
    {
      name: "pagination",
      desc: `分页参数<div class="cnblogs_code">
        <pre><span style="color: #000000;">pagination: {
              total: </span>0<span style="color: #000000;">,
             size: </span>30, <span style="color: #008000;">//</span><span style="color: #008000;">分页大小</span>
            sortName: "" <span style="color: #008000;">//</span><span style="color: #008000;">排序字段</span>
         }</pre>
        </div>
        <p>&nbsp;</p>`,
      type: "json",
      default: ""
    },
    {
      name: "boxOptions",
      desc: `新建、编辑弹出框参数<div class="cnblogs_code">
        <div class="cnblogs_code">
        <pre><span style="color: #000000;"> boxOptions: {
           saveClose: </span><span style="color: #0000ff;">true</span>, <span style="color: #008000;">//</span><span style="color: #008000;">新建、编辑完成后是否关闭弹出框</span>
           labelWidth: 100, <span style="color: #008000;">//</span><span style="color: #008000;">弹出框里表单的label标签的宽度</span>
          height: 0, <span style="color: #008000;">//</span><span style="color: #008000;">弹出框的高度(默认自动计算)</span>
          width: 0<span style="color: #008000;">//</span><span style="color: #008000;">弹出框的宽度(默认自动计算)</span>
         }</pre>
        </div>
        <p>&nbsp;</p>
        </div>
        <p>&nbsp;</p>`,
      type: "json",
      default: ""
    },
    ],


    methods: [{ name: "refresh", desc: "刷新查询界面的表数据,使用：this.refresh()", param: "" },
    { name: "getSelectRows", desc: "查询界面获取选中的行,使用：this.getSelectRows()", param: "" },
    { name: "initDicKeys", desc: "刷新字典数据源,使用：this.initDicKeys()//使用场景如：新建编辑级联下拉框保存后，调用此方法刷新级联的数据源", param: "" },
  
    { name: "filterPermission", desc: `&nbsp; &nbsp; onInit()<br />
    &nbsp; &nbsp; {<br />
    &nbsp; &nbsp; &nbsp; &nbsp; //例：判断用户是否有SellOrder表有没有Add权限(2021.03.19到最后的才能使用)<br />
    &nbsp; &nbsp; &nbsp; &nbsp; //第二个参数可选值：Add、Update、Delete、Audit、Import、Export、Search，也可以是自定的义的按钮权限值<br />
    &nbsp; &nbsp; &nbsp; &nbsp; if (this.filterPermission("SellOrder", 'Add'))<br />
    &nbsp; &nbsp; &nbsp; &nbsp; {<br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; //to do...<br />
    &nbsp; &nbsp; &nbsp; &nbsp; }<br />
    &nbsp; &nbsp; }<br />`, param: "" },
    { name: "显示所有查询条件", desc: "this.setFiexdSearchForm(true)//直接放在onInit中使用", param: "" },
    { name: "调用新建方法", desc: "this.add()", param: "" },
    { name: "调用删除方法", desc: "this.del(row)//row要删除的行数据", param: "" },
    { name: "调用编辑方法", desc: "this.edit(row)//row要编辑的行数据", param: "" },
    { name: "获取从表明细选择中的行", desc: "获取从表明细选择中的行,使用：this.$refs.detail.getSelected()", param: "" },
    { name: "强制刷新从表统计合计数据", desc: "this.$refs.detail.updateDetailTableSummaryTotal()", param: "" },
    { name: "获取table所有的行数据", desc: "this.$refs.table.rowData", param: "" },
    { name: "获取/设置table正在编辑的行", desc: "this.$refs.table.edit.rowIndex //设置值可以指定某行处于编辑状态，值为-1时关闭编辑状态，", param: "" },
    
    { name: "获取明细表table所有的行数据", desc: "this.$refs.detail.rowData", param: "" },
    {
      name: "刷新从表数据", desc: `<p> this.resetDetailTable()</p>
        <br />
//如果是新建弹出框中，此方法不会执行<br />
//新建中刷新从表解决办法：<br />
/*<br />
&nbsp;let _currentAction= this.currentAction;<br />
&nbsp; this.currentAction="";<br />
&nbsp; this.resetDetailTable()<br />
&nbsp; this.currentAction=_currentAction;<br />
*/<br />`, param: ""
    },
    { name: "扩展js方法使用", desc: "扩展js为当前数据库表生成页面扩展js,如:SellOrder.js,文件由代码生成，可自行在js中实现下面列出的方法", param: "" },
    {
      name: "扩展js方法使用",
      desc: `<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
      <div>
        <span style="color:#569cd6;">let</span>&nbsp;<span style="color:#9cdcfe;">extension</span>&nbsp;=&nbsp;{
      </div>
      <div>
        &nbsp;&nbsp;<span style="color:#9cdcfe;">components:</span>&nbsp;{<span style="color:#6a9955;">//动态扩充组件或组件路径</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//表单header、content、footer对应位置扩充的组件</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">gridHeader:</span>&nbsp;<span style="color:#ce9178;">""</span>,<span style="color:#6a9955;">//()&nbsp;=&gt;&nbsp;import("./SellOrderComponents/GridHeaderExtend.vue"),//{&nbsp;template:&nbsp;"&lt;div&gt;扩展组xx件&lt;/div&gt;"&nbsp;},</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">gridBody:</span>&nbsp;<span style="color:#ce9178;">""</span>,<span style="color:#6a9955;">//()&nbsp;=&gt;&nbsp;import("./SellOrderComponents/GridBodyExtend.vue"),</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">gridFooter</span><span style="color:#9cdcfe;">:</span>&nbsp;()&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;<span style="color:#569cd6;">import</span>(<span style="color:#ce9178;">"./SellOrderComponents/GridFooterExtend.vue"</span>),
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//弹出框(修改、编辑、查看)header、content、footer对应位置扩充的组件</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">modelHeader:</span>&nbsp;<span style="color:#ce9178;">""</span>,
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">modelBody:</span>&nbsp;{&nbsp;<span style="color:#9cdcfe;">template:</span>&nbsp;<span style="color:#ce9178;">'xx'</span>&nbsp;},
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">modelFooter:</span>&nbsp;<span style="color:#ce9178;">""</span>,
      </div>
      <div>
        &nbsp;&nbsp;},
      </div>
      <div>
        &nbsp;&nbsp;<span style="color:#9cdcfe;">tableAction:</span>&nbsp;<span style="color:#ce9178;">""</span>,<span style="color:#6a9955;">//指定获取表的权限按钮,默认为当前表的权限</span>
      </div>
      <div>
        &nbsp;&nbsp;<span style="color:#9cdcfe;">text:</span>&nbsp;<span style="color:#ce9178;">"示例覆盖全部可扩展方法,前台扩展文件SellOrder.js，后台Partial-&gt;SellOrdeService.cs"</span>,
      </div>
      <div>
        &nbsp;&nbsp;<span style="color:#9cdcfe;">buttons:</span>&nbsp;{&nbsp;<span style="color:#6a9955;">//扩展按钮</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//注：没有编辑或新建权限的情况下，是不会显示此处添加的扩展按钮，如果仍需要显示此处的按钮，可以把按钮在methods的onInited方法中添加,如：this.boxButtons.push(...)</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">view:</span>&nbsp;[<span style="color:#6a9955;">//ViewGrid查询界面按钮</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">name:</span>&nbsp;<span style="color:#ce9178;">"点我"</span>,
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">icon:</span>&nbsp;<span style="color:#ce9178;">'md-create'</span>,
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">value:</span>&nbsp;<span style="color:#ce9178;">'Edit'</span>,
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">class:</span>&nbsp;<span style="color:#ce9178;">''</span>,
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">'error'</span>,
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">index:</span>&nbsp;<span style="color:#b5cea8;">1</span>,<span style="color:#6a9955;">//显示的位置</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onClick</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">function</span>&nbsp;()&nbsp;{&nbsp;<span style="color:#6a9955;">//扩展按钮执行事件</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//this可以获取所有属性，包括this.$refs.gridHeader/gridBody等获取扩展组件对象</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;this.$message("测试扩展按钮");</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">gridHeader</span>.<span style="color:#9cdcfe;">model</span>&nbsp;=&nbsp;<span style="color:#569cd6;">true</span>;
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},&nbsp;{
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">name:</span>&nbsp;<span style="color:#ce9178;">"调用后台"</span>,
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">icon:</span>&nbsp;<span style="color:#ce9178;">'md-create'</span>,
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">value:</span>&nbsp;<span style="color:#ce9178;">'Edit'</span>,
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">class:</span>&nbsp;<span style="color:#ce9178;">''</span>,
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">'error'</span>,
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">index:</span>&nbsp;<span style="color:#b5cea8;">1</span>,<span style="color:#6a9955;">//显示的位置</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onClick</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">function</span>&nbsp;()&nbsp;{&nbsp;<span style="color:#6a9955;">//扩展按钮执行事件</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#dcdcaa;">getServiceDate</span>();
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}],
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">box:</span>&nbsp;<span style="color:#6a9955;">//新建、编辑弹出框按钮</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[<span style="color:#6a9955;">//ViewGrid查询界面按钮</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">name:</span>&nbsp;<span style="color:#ce9178;">"点我1"</span>,
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">icon:</span>&nbsp;<span style="color:#ce9178;">'md-create'</span>,
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">value:</span>&nbsp;<span style="color:#ce9178;">'Edit'</span>,
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">class:</span>&nbsp;<span style="color:#ce9178;">''</span>,
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">'success'</span>,
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">index:</span>&nbsp;<span style="color:#b5cea8;">1</span>,<span style="color:#6a9955;">//显示的位置</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onClick</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">function</span>&nbsp;()&nbsp;{
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$message</span>.<span style="color:#dcdcaa;">error</span>(<span style="color:#ce9178;">"扩展的明细Box按钮,可设置index值指定显示位置,可使用this.$refs拿到包括自定义扩展的所有组件"</span>);
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}],
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">detail:</span>&nbsp;<span style="color:#6a9955;">//新建、编辑弹出框明细表table表按钮</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[<span style="color:#6a9955;">//ViewGrid查询界面按钮</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">name:</span>&nbsp;<span style="color:#ce9178;">"点我2"</span>,
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">icon:</span>&nbsp;<span style="color:#ce9178;">'md-create'</span>,
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">value:</span>&nbsp;<span style="color:#ce9178;">'Edit'</span>,
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">class:</span>&nbsp;<span style="color:#ce9178;">''</span>,
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">type:</span>&nbsp;<span style="color:#ce9178;">'success'</span>,
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">index:</span>&nbsp;<span style="color:#b5cea8;">1</span>,<span style="color:#6a9955;">//显示的位置</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onClick</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">function</span>&nbsp;()&nbsp;{
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$message</span>.<span style="color:#dcdcaa;">error</span>(<span style="color:#ce9178;">"扩展的明细table按钮,可设置index值指定显示位置"</span>);
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}]
      </div>
      <div>
        &nbsp;&nbsp;},<span style="color:#6a9955;">//扩展的按钮</span>
      </div>
      <div>
        &nbsp;&nbsp;<span style="color:#9cdcfe;">methods:</span>&nbsp;{<span style="color:#6a9955;">//方法扩展</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">getServiceDate</span>&nbsp;()&nbsp;{
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">http</span>.<span style="color:#dcdcaa;">post</span>(<span style="color:#ce9178;">"/api/SellOrder/getServiceDate"</span>,&nbsp;{},&nbsp;<span style="color:#ce9178;">'正在调用后台数据'</span>).<span style="color:#dcdcaa;">then</span>(<span style="color:#9cdcfe;">date</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$message</span>.<span style="color:#dcdcaa;">error</span>(<span style="color:#ce9178;">"从后台获取的服务器时间是："</span>&nbsp;+&nbsp;<span style="color:#9cdcfe;">date</span>);
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;},
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">mounted</span>&nbsp;()&nbsp;{
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;this.$Notice.success({&nbsp;title:&nbsp;'执行mounted方法'&nbsp;});</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;},
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onActivated</span>&nbsp;()&nbsp;{&nbsp;<span style="color:#6a9955;">//对应vue原生&nbsp;activated方法</span>
      </div>
    <br />
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;},
      </div>
      <div>
      &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">dicInited</span>&nbsp;(params)&nbsp;{&nbsp;<span style="color:#6a9955;">//数据源加载完成时的方法,2022.04.04更新method.js文件后才能使用</span>
    </div>
  <br />
    <div>
      &nbsp;&nbsp;&nbsp;&nbsp;},
    </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onInit</span>&nbsp;()&nbsp;{
      </div>
      
      <div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas">
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp; <span style="color:#6a9955;">//例：判断用户是否有SellOrder表有没有Add权限(2021.03.19到最后的才能使用)</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//第二个参数可选值：Add、Update、Delete、Audit、Import、Export、Search，也可以是自定的义的按钮权限值</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#569cd6;">this</span>.<span style="color:#dcdcaa;">filterPermission</span>(<span style="color:#ce9178;">"SellOrder"</span>,<span style="color:#ce9178;">'Add'</span>))&nbsp;{
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//to&nbsp;do...</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
      </div>
    </div>
    <br />
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//表格设置为单选</span>
      </div>
    
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;this.single=true;</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;this.detailOptions.single=true;</span>
      </div>
    <br />
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设置编辑表单数量字段的最小与最大值</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormOptions</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">item</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//设置输入的数量的最小值与最大值(默认是1)</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">field</span>&nbsp;==&nbsp;<span style="color:#ce9178;">"Qty"</span>)&nbsp;{
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">min</span>&nbsp;=&nbsp;<span style="color:#b5cea8;">10</span>;
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">item</span>.<span style="color:#9cdcfe;">max</span>&nbsp;=&nbsp;<span style="color:#b5cea8;">200</span>;
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;});
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
      </div>
    <br />
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//动态修改table并给列添加事件</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">columns</span>.<span style="color:#dcdcaa;">forEach</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">field</span>&nbsp;==&nbsp;<span style="color:#ce9178;">"Qty"</span>)&nbsp;{
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#dcdcaa;">formatter</span>&nbsp;=&nbsp;(<span style="color:#9cdcfe;">row</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#ce9178;">'&lt;a&gt;'</span>&nbsp;+&nbsp;<span style="color:#9cdcfe;">row</span>.<span style="color:#9cdcfe;">Qty</span>&nbsp;+&nbsp;<span style="color:#ce9178;">"(弹出框)"</span>&nbsp;+&nbsp;<span style="color:#ce9178;">'&lt;/a&gt;'</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#dcdcaa;">click</span>&nbsp;=&nbsp;(<span style="color:#9cdcfe;">row</span>,&nbsp;<span style="color:#9cdcfe;">column</span>,&nbsp;<span style="color:#9cdcfe;">event</span>)&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">gridHeader</span>.<span style="color:#9cdcfe;">model</span>&nbsp;=&nbsp;<span style="color:#569cd6;">true</span>;
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
      </div>
    <br />
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//动态设置弹出框table的高度</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">detailOptions</span>.<span style="color:#9cdcfe;">height</span>&nbsp;=&nbsp;<span style="color:#b5cea8;">110</span>;
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//动态设置查询界面table高度</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">tableHeight</span>&nbsp;=&nbsp;<span style="color:#b5cea8;">200</span>;;
      </div>
  


      
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;},
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onInited</span>&nbsp;()&nbsp;{
      </div>

      <p>
      <br />
    </p>
    <div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;">
      <div>
        <div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;">
          <div>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//明细表行编辑开始、结束方法(只能写在onInited中)</span>
          </div>
          <div>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//明细表点击表格时触发编辑方法</span>
          </div>
          <div>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">detailOptions</span>.<span style="color:#dcdcaa;">beginEdit</span>= (<span style="color:#9cdcfe;">row</span>, <span style="color:#9cdcfe;">column</span>, <span style="color:#9cdcfe;">index</span>) <span style="color:#569cd6;">=&gt;</span> {
          </div>
          <div>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#569cd6;">true</span>;<span style="color:#6a9955;">//返回false不会进行编辑</span>
          </div>
          <div>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }
          </div>
          <div>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//明细表格行编辑结束方法</span>
          </div>
          <div>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">detailOptions</span>.<span style="color:#dcdcaa;">endEditBefore</span>= (<span style="color:#9cdcfe;">row</span>, <span style="color:#9cdcfe;">column</span>, <span style="color:#9cdcfe;">index</span>) <span style="color:#569cd6;">=&gt;</span> {
          </div>
          <div>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#569cd6;">true</span>;<span style="color:#6a9955;">//返回false不会进行编辑</span>
          </div>
          <div>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }
          </div>
        </div>
      </div>
    </div>
    <p>
      <br />
    </p>

      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;},
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">searchBefore</span>&nbsp;(<span style="color:#9cdcfe;">param</span>)&nbsp;{&nbsp;<span style="color:#6a9955;">//查询ViewGird表数据前,param查询参数</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//添加其他查询条件,也可以在后台扩展中写查询条件</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">let</span>&nbsp;<span style="color:#9cdcfe;">wheres</span>&nbsp;=&nbsp;[{
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">'name'</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'字段名'</span>,
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">'value'</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'查询的值'</span>,
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">'displayType'</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'like'</span><span style="color:#6a9955;">//设置为模糊查询,其他类型见下面exportBefore方法displayType属性说明</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}]
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//也可以提交一些其他参数，后台在GetPageData()方法读取options.value</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">param</span>.<span style="color:#9cdcfe;">value</span>&nbsp;=&nbsp;<span style="color:#ce9178;">"xxx"</span>;
      </div>
    <br />
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">param</span>.<span style="color:#9cdcfe;">wheres</span>.<span style="color:#dcdcaa;">push</span>(...<span style="color:#9cdcfe;">wheres</span>);
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//返回false，则不会执行查询</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">true</span>;
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;},
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">searchAfter</span>&nbsp;(<span style="color:#9cdcfe;">result</span>)&nbsp;{&nbsp;<span style="color:#6a9955;">//查询ViewGird表数据后param查询参数,result回返查询的结果</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$Notice</span>.<span style="color:#dcdcaa;">success</span>({&nbsp;<span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">table</span>.<span style="color:#9cdcfe;">cnName</span>&nbsp;+&nbsp;<span style="color:#ce9178;">',查询结果'</span>,&nbsp;<span style="color:#9cdcfe;">desc</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'返回的对象：'</span>&nbsp;+&nbsp;<span style="color:#9cdcfe;">JSON</span>.<span style="color:#dcdcaa;">stringify</span>(<span style="color:#9cdcfe;">result</span>)&nbsp;});
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">true</span>;
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;},
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">searchDetailBefore</span>&nbsp;(<span style="color:#9cdcfe;">param</span>)&nbsp;{<span style="color:#6a9955;">//查询从表表数据前,param查询参数</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;同上searchBefore操作</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">true</span>;
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;},
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">searchDetailAfter</span>&nbsp;(<span style="color:#9cdcfe;">data</span>)&nbsp;{<span style="color:#6a9955;">//查询从表后param查询参数,result回返查询的结果</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$Notice</span>.<span style="color:#dcdcaa;">success</span>({&nbsp;<span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">detailOptions</span>.<span style="color:#9cdcfe;">cnName</span>&nbsp;+&nbsp;<span style="color:#ce9178;">',查询结果'</span>,&nbsp;<span style="color:#9cdcfe;">desc</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'返回的对象：'</span>&nbsp;+&nbsp;<span style="color:#9cdcfe;">JSON</span>.<span style="color:#dcdcaa;">stringify</span>(<span style="color:#9cdcfe;">data</span>)&nbsp;});
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">true</span>;
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;},
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">delBefore</span>&nbsp;(<span style="color:#9cdcfe;">ids</span>,&nbsp;<span style="color:#9cdcfe;">rows</span>)&nbsp;{&nbsp;<span style="color:#6a9955;">//查询界面的表删除前&nbsp;ids为删除的id数组,rows删除的行</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">let</span>&nbsp;<span style="color:#9cdcfe;">auditStatus</span>&nbsp;=&nbsp;<span style="color:#9cdcfe;">rows</span>.<span style="color:#dcdcaa;">some</span>(<span style="color:#9cdcfe;">x</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#9cdcfe;">x</span>.<span style="color:#9cdcfe;">AuditStatus</span>&nbsp;&gt;&nbsp;<span style="color:#b5cea8;">0</span>&nbsp;});
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">auditStatus</span>)&nbsp;{
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$message</span>.<span style="color:#dcdcaa;">error</span>(<span style="color:#ce9178;">'只能删除未审核的数据'</span>)
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">false</span>;
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$Notice</span>.<span style="color:#dcdcaa;">success</span>({&nbsp;<span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'删除前，选择的Id:'</span>&nbsp;+&nbsp;<span style="color:#9cdcfe;">ids</span>.<span style="color:#dcdcaa;">join</span>(<span style="color:#ce9178;">','</span>)&nbsp;});
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">true</span>;
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;},
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">delAfter</span>&nbsp;(<span style="color:#9cdcfe;">result</span>)&nbsp;{<span style="color:#6a9955;">//查询界面的表删除后</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">true</span>;
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;},
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">addRow</span>&nbsp;()&nbsp;{
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//明细表添加行，在此处可以设置添加的默认值</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">let</span>&nbsp;<span style="color:#9cdcfe;">obj</span>&nbsp;=&nbsp;{};
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//给明细表添加行时，设置默认值。--onInited方法中对this.detailOptions.columns进行formatter也可以实现)</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//obj.xx=123;</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">detail</span>.<span style="color:#dcdcaa;">addRow</span>(<span style="color:#9cdcfe;">obj</span>);
      </div>
      <div>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//明细表批量添加行<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$refs</span>.
      <span style="color:#9cdcfe;">detail</span>.<span style="color:#dcdcaa;">rowData.push(...</span>[<span style="color:#9cdcfe;">{},{}</span>]);
    </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;},
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">delDetailRow</span>&nbsp;(<span style="color:#9cdcfe;">rows</span>)&nbsp;{&nbsp;<span style="color:#6a9955;">//弹出框删除明细表的行数据(只是对table操作，并没有操作后台)</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">console</span>.<span style="color:#dcdcaa;">log</span>(<span style="color:#9cdcfe;">rows</span>)
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">true</span>;
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;},
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">addBefore</span>&nbsp;(<span style="color:#9cdcfe;">formData</span>)&nbsp;{&nbsp;<span style="color:#6a9955;">//新建保存前formData为对象，包括明细表</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//formData格式：</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;{</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mainData:&nbsp;{&nbsp;主表字段1:&nbsp;'x1',&nbsp;主表字段2:&nbsp;'x2'&nbsp;},</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;detailData:&nbsp;[{&nbsp;明细表字段1:&nbsp;d1&nbsp;}],</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;delKeys:&nbsp;null&nbsp;//删除明细表行数据的id</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;}</span>
      </div>
    <br />
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//formData.mainData.xxx="xxxx";//还可以继续手动添加值</span>
      </div>
    <br />
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//如果需要同时提交其他数据到后台，请设置formData.extra=xxxx</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//后台在表xxxxService.cs中重写Add方法即可从saveDataModel参数中拿到extra提交的对象</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$Notice</span>.<span style="color:#dcdcaa;">success</span>({&nbsp;<span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">detailOptions</span>.<span style="color:#9cdcfe;">cnName</span>&nbsp;+&nbsp;<span style="color:#ce9178;">'新建前：'</span>,&nbsp;<span style="color:#9cdcfe;">desc</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'提前的数据：'</span>&nbsp;+&nbsp;<span style="color:#9cdcfe;">JSON</span>.<span style="color:#dcdcaa;">stringify</span>(<span style="color:#9cdcfe;">formData</span>)&nbsp;});
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">true</span>;
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;},
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">async</span>&nbsp;<span style="color:#dcdcaa;">addBeforeAsync</span>&nbsp;(<span style="color:#9cdcfe;">formData</span>)&nbsp;{
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//2020.12.06增加新建前异步方法同步处理</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//功能同上，区别在于此处可以做一些异步请求处理,全：</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;var&nbsp;_result&nbsp;=&nbsp;await&nbsp;this.http.post("/api/SellOrder/getPageData",&nbsp;{},&nbsp;true).then(result&nbsp;=&gt;&nbsp;{</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;console.log("1、异步请求前")</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;return&nbsp;result;</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;})</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;console.log("2、异步请求，同步处理结果:"&nbsp;+&nbsp;JSON.stringify(_result))</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">true</span>;
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;},
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">addAfter</span>&nbsp;(<span style="color:#9cdcfe;">result</span>)&nbsp;{<span style="color:#6a9955;">//新建保存后result返回的状态及表单对象</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$Notice</span>.<span style="color:#dcdcaa;">success</span>({&nbsp;<span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">detailOptions</span>.<span style="color:#9cdcfe;">cnName</span>&nbsp;+&nbsp;<span style="color:#ce9178;">'新建完成后：'</span>,&nbsp;<span style="color:#9cdcfe;">desc</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'返回的数据'</span>&nbsp;+&nbsp;<span style="color:#9cdcfe;">JSON</span>.<span style="color:#dcdcaa;">stringify</span>(<span style="color:#9cdcfe;">result</span>)&nbsp;});
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">true</span>;
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;},
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">updateBefore</span>&nbsp;(<span style="color:#9cdcfe;">formData</span>)&nbsp;{&nbsp;<span style="color:#6a9955;">//编辑保存前formData为对象，包括明细表、删除行的Id</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//formData格式：(自己调试出输看)</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;{</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mainData:&nbsp;{&nbsp;主表字段1:&nbsp;'x1',&nbsp;主表字段2:&nbsp;'x2'&nbsp;},</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;detailData:&nbsp;[{&nbsp;明细表字段1:&nbsp;d1&nbsp;}],</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;delKeys:&nbsp;null&nbsp;//删除明细表行数据的id</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;}</span>
      </div>
    <br />
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//formData.mainData.xxx="xxxx";//还可以继续手动添加值</span>
      </div>
    <br />
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//如果需要同时提交其他数据到后台，请设置formData.extra=xxxx</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//后台在表xxxxService.cs中重写Update方法即可从saveDataModel参数中拿到extra提交的对象</span>
      </div>
    <br />
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$Notice</span>.<span style="color:#dcdcaa;">success</span>({&nbsp;<span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">detailOptions</span>.<span style="color:#9cdcfe;">cnName</span>&nbsp;+&nbsp;<span style="color:#ce9178;">'编辑前：'</span>,&nbsp;<span style="color:#9cdcfe;">desc</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'提前的数据：'</span>&nbsp;+&nbsp;<span style="color:#9cdcfe;">JSON</span>.<span style="color:#dcdcaa;">stringify</span>(<span style="color:#9cdcfe;">formData</span>)&nbsp;});
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//获取扩展的modelFooter属性text</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">console</span>.<span style="color:#dcdcaa;">log</span>(<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">modelFooter</span>.<span style="color:#9cdcfe;">text</span>)
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">true</span>;
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;},
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">async</span>&nbsp;<span style="color:#dcdcaa;">updateBeforeAsync</span>&nbsp;(<span style="color:#9cdcfe;">formData</span>)&nbsp;{
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//2020.12.06增加修改前异步方法同步处理</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//功能同上，区别在于此处可以做一些异步请求处理,全：</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">var</span>&nbsp;<span style="color:#9cdcfe;">_result</span>&nbsp;=&nbsp;<span style="color:#c586c0;">await</span>&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">http</span>.<span style="color:#dcdcaa;">post</span>(<span style="color:#ce9178;">"/api/SellOrder/getPageData"</span>,&nbsp;{},&nbsp;<span style="color:#569cd6;">true</span>).<span style="color:#dcdcaa;">then</span>(<span style="color:#9cdcfe;">result</span>&nbsp;<span style="color:#569cd6;">=&gt;</span>&nbsp;{
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">console</span>.<span style="color:#dcdcaa;">log</span>(<span style="color:#ce9178;">"1、异步请求前"</span>)
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#9cdcfe;">result</span>;
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">console</span>.<span style="color:#dcdcaa;">log</span>(<span style="color:#ce9178;">"2、异步请求，同步处理结果:"</span>&nbsp;+&nbsp;<span style="color:#9cdcfe;">JSON</span>.<span style="color:#dcdcaa;">stringify</span>(<span style="color:#9cdcfe;">_result</span>))
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">true</span>;
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;},
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">updateAfter</span>&nbsp;(<span style="color:#9cdcfe;">result</span>)&nbsp;{<span style="color:#6a9955;">//编辑保存后result返回的状态及表单对象</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$Notice</span>.<span style="color:#dcdcaa;">success</span>({&nbsp;<span style="color:#9cdcfe;">title</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">detailOptions</span>.<span style="color:#9cdcfe;">cnName</span>&nbsp;+&nbsp;<span style="color:#ce9178;">'编辑完成后：'</span>,&nbsp;<span style="color:#9cdcfe;">desc</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'返回的数据'</span>&nbsp;+&nbsp;<span style="color:#9cdcfe;">JSON</span>.<span style="color:#dcdcaa;">stringify</span>(<span style="color:#9cdcfe;">result</span>)&nbsp;});
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">true</span>;
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;},
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">auditBefore</span>&nbsp;(<span style="color:#9cdcfe;">ids</span>,&nbsp;<span style="color:#9cdcfe;">rows</span>)&nbsp;{<span style="color:#6a9955;">//审核前</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">rows</span>.<span style="color:#9cdcfe;">length</span>&nbsp;&gt;&nbsp;<span style="color:#b5cea8;">2</span>)&nbsp;{<span style="color:#6a9955;">//每次最多只能审核2条数据</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$message</span>.<span style="color:#dcdcaa;">error</span>(<span style="color:#ce9178;">'最多只能选择两条数据'</span>);
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">false</span>;
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">true</span>;
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;},
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">auditAfter</span>&nbsp;(<span style="color:#9cdcfe;">result</span>,&nbsp;<span style="color:#9cdcfe;">rows</span>)&nbsp;{<span style="color:#6a9955;">//&nbsp;审核后</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>&nbsp;(<span style="color:#9cdcfe;">result</span>.<span style="color:#9cdcfe;">status</span>)&nbsp;{
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">result</span>.<span style="color:#9cdcfe;">message</span>&nbsp;=&nbsp;<span style="color:#ce9178;">"审核成功。。。。。"</span>&nbsp;+&nbsp;<span style="color:#9cdcfe;">result</span>.<span style="color:#9cdcfe;">message</span>;
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">true</span>;
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;},
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">resetAddFormBefore</span>&nbsp;()&nbsp;{&nbsp;<span style="color:#6a9955;">//重置新建表单前的内容</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">true</span>;
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;},
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">resetAddFormAfter</span>&nbsp;()&nbsp;{&nbsp;<span style="color:#6a9955;">//重置新建表单后的内容</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//如果某些字段不需要重置，则可以重新赋值</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormFields</span>.<span style="color:#9cdcfe;">Remark</span>&nbsp;=&nbsp;<span style="color:#ce9178;">'新建重置默认值66666'</span>;
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//给明细表添加默认一行</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">detail</span>.<span style="color:#9cdcfe;">rowData</span>.<span style="color:#dcdcaa;">push</span>({&nbsp;<span style="color:#9cdcfe;">Remark</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"新建666666"</span>&nbsp;});
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">true</span>;
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;},
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">resetUpdateFormBefore</span>&nbsp;()&nbsp;{&nbsp;<span style="color:#6a9955;">//重置编辑表单前的内容</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//this.editFormFields当前值</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">console</span>.<span style="color:#dcdcaa;">log</span>(<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormFields</span>)
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//当前明细表的行</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">console</span>.<span style="color:#dcdcaa;">log</span>(<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">detail</span>.<span style="color:#9cdcfe;">rowData</span>)
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">true</span>;
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;},
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">resetUpdateFormAfter</span>&nbsp;()&nbsp;{&nbsp;<span style="color:#6a9955;">//重置编辑表单后的内容</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//如果某些字段不需要重置，则可以重新赋值</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">editFormFields</span>.<span style="color:#9cdcfe;">Remark</span>&nbsp;=&nbsp;<span style="color:#ce9178;">'编辑重置默认值66666'</span>;
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//给明细表添加默认一行</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">detail</span>.<span style="color:#9cdcfe;">rowData</span>.<span style="color:#dcdcaa;">push</span>({&nbsp;<span style="color:#9cdcfe;">Remark</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">"编辑666666"</span>&nbsp;});
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">true</span>;
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;},
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">importAfter</span>&nbsp;(<span style="color:#9cdcfe;">data</span>)&nbsp;{&nbsp;<span style="color:#6a9955;">//导入excel后刷新table表格数据</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#dcdcaa;">search</span>();&nbsp;<span style="color:#6a9955;">//刷新table</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;},
      </div>
      <div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">async</span>&nbsp;<span style="color:#dcdcaa;">modelOpenBeforeAsync</span>(<span style="color:#9cdcfe;">row</span>)&nbsp;{&nbsp;<span style="color:#6a9955;">//点击编辑/新建按钮弹出框前，可以在此处写逻辑，如，从后台获取数据</span> 
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//2021.01.10增加</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">if</span>(<span style="color:#9cdcfe;">row</span>){
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">console</span>.<span style="color:#dcdcaa;">log</span>(<span style="color:#ce9178;">"编辑操作"</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<span style="color:#c586c0;">else</span>{
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">console</span>.<span style="color:#dcdcaa;">log</span>(<span style="color:#ce9178;">"新建操作"</span>)
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//打开弹出框前，http请求同步执行</span> 
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;var&nbsp;_result&nbsp;=&nbsp;await&nbsp;this.http.post("url",&nbsp;{},&nbsp;true).then(result&nbsp;=&gt;&nbsp;{</span> 
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;&nbsp;&nbsp;_result&nbsp;=&nbsp;result;</span> 
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;})</span> 
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//&nbsp;console.log(result);</span> 
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//返回false不会弹出框&nbsp;</span> 
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//this.$message.error("不能打开弹出框&nbsp;");</span> 
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">true</span>;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;},
	</div>
</div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">modelOpenBefore</span>&nbsp;(<span style="color:#9cdcfe;">row</span>)&nbsp;{&nbsp;<span style="color:#6a9955;">//点击编辑/新建按钮弹出框前，可以在此处写逻辑，如，从后台获取数据</span>
      </div>
    <br />
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;},
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">modelOpenAfter</span>&nbsp;(<span style="color:#9cdcfe;">row</span>)&nbsp;{&nbsp;&nbsp;<span style="color:#6a9955;">//点击编辑/新建按钮弹出框后，可以在此处写逻辑，如，从后台获取数据</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$message</span>.<span style="color:#dcdcaa;">error</span>(<span style="color:#ce9178;">"此处是打开弹出框后事件,当前操作："</span>&nbsp;+&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">currentAction</span>&nbsp;+&nbsp;<span style="color:#ce9178;">"，你可以在此处编写逻辑，如，从后台获取数据"</span>);
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;},
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">rowChange</span>&nbsp;(<span style="color:#9cdcfe;">row</span>)&nbsp;{&nbsp;&nbsp;<span style="color:#6a9955;">//查询界面table点击行事件，只有设置了single=true单选才会生效</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;},
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">detailRowChange</span>&nbsp;(<span style="color:#9cdcfe;">row</span>)&nbsp;{&nbsp;&nbsp;<span style="color:#6a9955;">//明细表界面table点击行事件，只有设置了single=true单选才会生效</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;},
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">onActivated</span>&nbsp;()&nbsp;{&nbsp;<span style="color:#6a9955;">//重新加载字典绑定的数据源(如果需要每次点击页面时刷新字典数据源，直接将整个方法添加到js的methods中即可使用)</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">//this</span>.<span style="color:#dcdcaa;">initDicKeys</span>();
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;},
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">exportBefore</span>&nbsp;(<span style="color:#9cdcfe;">param</span>)&nbsp;{&nbsp;<span style="color:#6a9955;">//添加自定义导出查询条件</span>
      </div>
      <div style="padding:10px 0;">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;this.downloadFileName='a.xlsx';//自定义导出的文件名(2022.09.12更新前端ViewGrid.vue才能使用)
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;"> let</span>&nbsp;<span style="color:#9cdcfe;">wheres</span>&nbsp;=&nbsp;[{
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">'name'</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'字段名'</span>,
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">'value'</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'查询的值'</span>,
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ce9178;">'displayType'</span><span style="color:#9cdcfe;">:</span>&nbsp;<span style="color:#ce9178;">'like'</span><span style="color:#6a9955;">
        //可选类型text/like/selectList/thanorequal/lessorequal，like(模糊查询) ; selectList为多选,后台in查询，thanorequal>=,lessorequal<=</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}]
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">param</span>.<span style="color:#9cdcfe;">wheres</span>.<span style="color:#dcdcaa;">push</span>(...<span style="color:#9cdcfe;">wheres</span>);
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#569cd6;">true</span>;<span style="color:#6a9955;">//返回false会中断执行</span>
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;},
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">rowClick</span>&nbsp;({&nbsp;<span style="color:#9cdcfe;">row</span>,&nbsp;<span style="color:#9cdcfe;">column</span>,&nbsp;<span style="color:#9cdcfe;">event</span>&nbsp;})&nbsp;{&nbsp;<span style="color:#6a9955;">//查询界面table点击行事件</span>
      </div>
      <div>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">//this</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">table</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">table</span>.<span style="color:#dcdcaa;">clearSelection</span>(<span style="color:#9cdcfe;">row</span>)//清除当前选中当前行;
    </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">table</span>.<span style="color:#9cdcfe;">$refs</span>.<span style="color:#9cdcfe;">table</span>.<span style="color:#dcdcaa;">toggleRowSelection</span>(<span style="color:#9cdcfe;">row</span>)//单击行时选中当前行;
      </div>
      <div>
        &nbsp;&nbsp;&nbsp;&nbsp;},

      

        <div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
		<br />
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#dcdcaa;">destroyed</span>(){&nbsp;
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//2021.04.11增加vue页面销毁方法,路由必须设置keepLive:false，设置方法见：前端开发文档-》[禁用页面缓存keepAlive]</span> 
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//需要更新methods.js与ViewGird.vue文件&nbsp;2021.04.11</span> 
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#9cdcfe;">console</span>.<span style="color:#dcdcaa;">log</span>(<span style="color:#ce9178;">"destroyed"</span>)
	</div>
	<div >
		&nbsp;&nbsp;&nbsp;&nbsp;},
    <div  style="padding-left: 20px;">
	<div>

	</div>
	<p>
		&nbsp;&nbsp;<span style="color:#dcdcaa;">onModelClose</span>(<span style="color:#9cdcfe;">iconClick</span>){
	</p>
	<p>
  &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">2021.07.11更新后才能使用</span>
	</p>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//iconClick=true为点击左中上角X触发的关闭事件</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//如果返回&nbsp;false不会关闭弹出框&nbsp;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6a9955;">//return&nbsp;false;</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#569cd6;">this</span>.<span style="color:#9cdcfe;">boxModel</span>=<span style="color:#569cd6;">false</span>;
	</div>
	<div>
		&nbsp;&nbsp;}		,
	</div>
</div>
    <div style="padding-left: 20px;color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;line-height:19px;white-space:pre;">
	<div>
	</div>
	<div>
		&nbsp;&nbsp;<span style="color:#dcdcaa;">loadTreeChildren</span>(<span style="color:#9cdcfe;">tree</span>,&nbsp;<span style="color:#9cdcfe;">treeNode</span>,&nbsp;<span style="color:#9cdcfe;">resolve</span>){<span style="color:#6a9955;">//树形结构加载子节点(2021.05.02),在onInit中设置了rowKey主键字段后才会生效</span>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#c586c0;">return</span>&nbsp;<span style="color:#dcdcaa;">resolve</span>([]);
	</div>
	<div>
		&nbsp;&nbsp;},
    <p>
	<div style="color:#D4D4D4;background-color:#1E1E1E;font-family:Consolas, &quot;font-size:14px;">
		<br />
		<div>
			&nbsp; &nbsp; <span style="color:#6a9955;">//2023.05.03更新ViewGrid.vue、serviceFilter.js、detailMethods.js后才能使用</span>
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#dcdcaa;">selectable</span>(<span style="color:#9cdcfe;">row</span>, <span style="color:#9cdcfe;">index</span>) {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//设置界面CheckBox是否可以勾选</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//判断字段=xx的checkbox不能选中</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">if</span> (<span style="color:#9cdcfe;">row</span>.<span style="color:#9cdcfe;">字段</span> == <span style="color:#ce9178;">"值"</span>) {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#569cd6;">false</span>;
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; }
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#569cd6;">true</span>;
		</div>
		<div>
			&nbsp; &nbsp; },
		</div>
		<div>
			&nbsp; &nbsp; <span style="color:#dcdcaa;">detailSelectable</span>(<span style="color:#9cdcfe;">row</span>, <span style="color:#9cdcfe;">index</span>) {
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//明细表CheckBox 是否可以勾选</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//操作同上</span>
		</div>
		<div>
			&nbsp; &nbsp; &nbsp; <span style="color:#c586c0;">return</span> <span style="color:#569cd6;">true</span>;
		</div>
		<div>
			&nbsp; &nbsp; },
      <div style="color:#CCCCCC;background-color:#1F1F1F;font-family:Consolas, &quot;font-size:14px;">
	<div>
		<div style="color:#CCCCCC;background-color:#1F1F1F;font-family:Consolas, &quot;font-size:14px;">
			<div style="color:#CCCCCC;background-color:#1F1F1F;font-family:Consolas, &quot;font-size:14px;">
				<div>
					&nbsp; &nbsp; <span style="color:#dcdcaa;">continueAddAfter</span>(<span style="color:#9cdcfe;">formFields</span>,<span style="color:#9cdcfe;">formData</span>,<span style="color:#9cdcfe;">result</span>){
				</div>
				<div>
					&nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//连续添加后方法，这是新建后执行的方法2023.07.23更新methods.js中saveExecute方法才能使用</span>
				</div>
<br />
				<div>
					&nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//formFields：界面上表单的示例</span>
				</div>
				<div>
					&nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//formData：提交到后台的数据</span>
				</div>
				<div>
					&nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//result:保存后返回 数据</span>
				</div>
<br />
				<div>
					&nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//注意:需要在上面的onInit方法设置this.continueAdd=true才会执行continueAddAfter</span>
				</div>
<br />
				<div>
					&nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//新建后可以设置一些默认值(不重置表单的数据)</span>
				</div>
				<div>
					&nbsp; &nbsp; &nbsp; <span style="color:#6a9955;">//this.editFormFields.字段=formFields.字段</span>
				</div>
<br />
				<div>
					&nbsp; &nbsp; },
				</div>
			</div>
			<div>
				<span style="color:#6a9955;"></span>
			</div>
		</div>
	</div>
	<div>
		<span style="color:#6a9955;"></span> 
	</div>
</div>
		</div>
	</div>
</p>
	</div>
        &nbsp;&nbsp;}
      </div>
      <div>
        };
      </div>
      <div>
        <span style="color:#c586c0;">export</span>&nbsp;<span style="color:#c586c0;">default</span>&nbsp;<span style="color:#9cdcfe;">extension</span>;
      </div>
    </div>`,
      param: ""
    }
    ]
  },
  uploadExcel: {
    attr: [],
    methods: []
  },
  uploadImg: {
    attr: [],
    methods: []
  },
  volmenu: {
    attr: [],
    methods: []
  },
  volupload: {
    attr: [{ name: "组件上传参数", desc: "组件上传参数属性", type: "", default: "" },
    {
      name: "组件上传参数", desc: `<div class="cnblogs_code">
        <pre><span style="color: #000000;">
            desc: {
              </span><span style="color: #008000;">//</span><span style="color: #008000;">是否显示默认介绍</span>
              <span style="color: #008000;">//</span><span style="color: #008000;">是否多选</span>
        <span style="color: #000000;">      type: Boolean,
              </span><span style="color: #0000ff;">default</span>: <span style="color: #0000ff;">false</span><span style="color: #000000;">
            },
            fileInfo: {
              </span><span style="color: #008000;">//</span><span style="color: #008000;">用于接收上传的文件，也可以加以默认值，显示已上传的文件，用户上传后会覆盖默认值</span>
        <span style="color: #000000;">      type: Array,
              </span><span style="color: #0000ff;">default</span>: () =&gt;<span style="color: #000000;"> {
                </span><span style="color: #0000ff;">return</span><span style="color: #000000;"> [];
              } </span><span style="color: #008000;">//</span><span style="color: #008000;">格式[{name:'1.jpg',path:'127.0.01/1.jpg'}]</span>
        <span style="color: #000000;">    },
            downLoad: {
              </span><span style="color: #008000;">//</span><span style="color: #008000;">是否可以点击文件下载</span>
        <span style="color: #000000;">      type: Boolean,
              </span><span style="color: #0000ff;">default</span>: <span style="color: #0000ff;">true</span><span style="color: #000000;">
            },
            multiple: {
              </span><span style="color: #008000;">//</span><span style="color: #008000;">是否多选</span>
        <span style="color: #000000;">      type: Boolean,
              </span><span style="color: #0000ff;">default</span>: <span style="color: #0000ff;">false</span><span style="color: #000000;">
            },
            maxFile: {
              </span><span style="color: #008000;">//</span><span style="color: #008000;">最多可选文件数量，必须multiple=true，才会生效</span>
        <span style="color: #000000;">      type: Number,
              </span><span style="color: #0000ff;">default</span>: 5<span style="color: #000000;">
            },
            maxSize: {
              </span><span style="color: #008000;">//</span><span style="color: #008000;">文件限制大小3M</span>
        <span style="color: #000000;">      type: Number,
              </span><span style="color: #0000ff;">default</span>: 3<span style="color: #000000;">
            },

            autoUpload: {
              </span><span style="color: #008000;">//</span><span style="color: #008000;">选择文件后是否自动上传</span>
        <span style="color: #000000;">      type: Boolean,
              </span><span style="color: #0000ff;">default</span>: <span style="color: #0000ff;">true</span><span style="color: #000000;">
            },
            img: {
              </span><span style="color: #008000;">//</span><span style="color: #008000;">图片类型  img&gt;excel&gt;fileTypes三种文件类型优先级</span>
        <span style="color: #000000;">      type: Boolean,
              </span><span style="color: #0000ff;">default</span>: <span style="color: #0000ff;">false</span><span style="color: #000000;">
            },
            excel: {
              </span><span style="color: #008000;">//</span><span style="color: #008000;">excel文件</span>
        <span style="color: #000000;">      type: Boolean,
              </span><span style="color: #0000ff;">default</span>: <span style="color: #0000ff;">false</span><span style="color: #000000;">
            },
            fileTypes: {
              </span><span style="color: #008000;">//</span><span style="color: #008000;">指定上传文件的类型</span>
        <span style="color: #000000;">      type: Array,
              </span><span style="color: #0000ff;">default</span>: () =&gt;<span style="color: #000000;"> {
                </span><span style="color: #0000ff;">return</span><span style="color: #000000;"> [];
              }
            },
            url: {
              </span><span style="color: #008000;">//</span><span style="color: #008000;">上传的url</span>
        <span style="color: #000000;">      type: String,
              </span><span style="color: #0000ff;">default</span>: ""<span style="color: #000000;">
            },
            uploadBefore: {
              </span><span style="color: #008000;">//</span><span style="color: #008000;">返回false会中止执行</span>
              <span style="color: #008000;">//</span><span style="color: #008000;">上传前</span>
        <span style="color: #000000;">      type: Function,
              </span><span style="color: #0000ff;">default</span>: files =&gt;<span style="color: #000000;"> {
                </span><span style="color: #0000ff;">return</span> <span style="color: #0000ff;">true</span><span style="color: #000000;">;
              }
            },
            uploadAfter: {
              </span><span style="color: #008000;">//</span><span style="color: #008000;">返回false会中止执行</span>
              <span style="color: #008000;">//</span><span style="color: #008000;">上传后</span>
        <span style="color: #000000;">      type: Function,
              </span><span style="color: #0000ff;">default</span>: (result, files) =&gt;<span style="color: #000000;"> {
                </span><span style="color: #0000ff;">return</span> <span style="color: #0000ff;">true</span><span style="color: #000000;">;
              }
            },
            onChange: {
              </span><span style="color: #008000;">//</span><span style="color: #008000;">选择文件时  //返回false会中止执行</span>
        <span style="color: #000000;">      type: Function,
              </span><span style="color: #0000ff;">default</span>: files =&gt;<span style="color: #000000;"> {
                </span><span style="color: #0000ff;">return</span> <span style="color: #0000ff;">true</span><span style="color: #000000;">;
              }
            },
            </span><span style="color: #008000;">//</span><span style="color: #008000;"> clear: {</span>
            <span style="color: #008000;">//</span><span style="color: #008000;">   //上传完成后是否清空文件列表</span>
            <span style="color: #008000;">//</span><span style="color: #008000;">   type: Boolean,</span>
            <span style="color: #008000;">//</span><span style="color: #008000;">   default: true</span>
            <span style="color: #008000;">//</span><span style="color: #008000;"> },</span>
        <span style="color: #000000;">    fileList: {
              </span><span style="color: #008000;">//</span><span style="color: #008000;">是否显示选择的文件列表</span>
        <span style="color: #000000;">      type: Boolean,
              </span><span style="color: #0000ff;">default</span>: <span style="color: #0000ff;">true</span><span style="color: #000000;">
            },
            fileClick: {
              </span><span style="color: #008000;">//</span><span style="color: #008000;">点击文件事件</span>
        <span style="color: #000000;">      type: Function,
              </span><span style="color: #0000ff;">default</span>: (index, file, files) =&gt;<span style="color: #000000;"> {
                </span><span style="color: #0000ff;">return</span> <span style="color: #0000ff;">true</span><span style="color: #000000;">;
              }
            },
            removeBefore: {
              </span><span style="color: #008000;">//</span><span style="color: #008000;">移除文件事件</span>
        <span style="color: #000000;">      type: Function,
              </span><span style="color: #0000ff;">default</span>: (index, file, files) =&gt;<span style="color: #000000;"> {
                </span><span style="color: #0000ff;">return</span> <span style="color: #0000ff;">true</span><span style="color: #000000;">;
              }
            },
            append: {
              </span><span style="color: #008000;">//</span><span style="color: #008000;">多选时，重新选择文件是否追加(默认重选直接用清原数据),逻辑待处理</span>
        <span style="color: #000000;">      type: Boolean,
              </span><span style="color: #0000ff;">default</span>: <span style="color: #0000ff;">false</span><span style="color: #000000;">
            }
          </span></pre>
        </div>
        <p>&nbsp;</p>`, type: "", default: ""
    }
    ],
    methods: []
  }
}
export default param;