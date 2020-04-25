let param = {
    icons: {
        attr: [],
        methods: [{ name: "on-select", desc: "选中图标事件", param: "图标样式名" }]
    }, form: {
        attr: [{ name: "loadKey", desc: "是否自动绑定select/checkboxt等标签的数据源", type: "bool", default: "false" },
        { name: "width", desc: "表单宽度", type: "number", default: "100%" },
        { name: "labelWidth", desc: "左边标签宽度", type: "number", default: "100" },
        { name: "formFileds", desc: "表单字段key/value，如:{name:'admin',age:''}", type: "json", default: "" },
        { name: "disabled", desc: "是否只读", type: "bool", default: "false" },
        { name: "placeholder", desc: "标签提示文字", type: "string", default: "" },
        { name: "colSize", desc: "每行列的宽度，可选值:12,8,6,如果是12标签会占100%宽度", type: "number", default: "" },
        { name: "表单配置参数", desc: "表单字段的参数配置说明(数组的元素个数决定了表单每行显示的标签个数),配置实例参照【查看代码】", type: "array", default: "[]" },
        { name: "[[{", desc: "表单字段formRules的参数配置说明", type: "", default: "" },
        { name: "dataKey", desc: "数据源字典编号(菜单->系统->下拉框绑定中的字典编号)", type: "string", default: "" },
        { name: "data", desc: "数据源，可以手动绑定格式[{key:1,value:'是'}],也可以自动绑定,自定绑定需要设置属性loadKey='true'", type: "array", default: "[]" },
        { name: "title", desc: "标签名称", type: "string", default: "" },
        //
        { name: "readonly/readonly", desc: "是否只读", type: "bool", default: "false" },
        { name: "required", desc: "是否必填", type: "bool", default: "false" },
        { name: "field", desc: "字段，与表单字段必须相同", type: "string", default: "" },
        { name: "filter", desc: "启用搜索,只对select/selectList生效,默认下拉框数据源超出10个开启搜索", type: "bool", default: "false" },
        { name: "type", desc: "渲染的标签类型,可选值,mail、text、textarea、img、checkbox、number、decimal、date、datetime、phone、switch、select、selectList(多选下拉框)", type: "string", default: "text" },
        { name: "range", desc: "如果type是日期，需要选开始与结束日期", type: "bool", default: "false" },
        { name: "min", desc: "1、数字类型标签：最小值,如果是type=number(整数)类型，默认验证最小值是1(decimal最小默认值0.1)，如果在代码生后的页面需要修改默认值，在扩展js的方法onInit中遍历form对象，可参考SellOrder.js中onInit方法。    2、其他标签,如：input/textarea设置min就是指的字符的最大长度", type: "number", default: "" },
        { name: "max", desc: "最大值,操作与min相同", type: "number", default: "" },
        {
            name: "validator", desc: "对标签的值进行自定义验证，如：    validator: (rule, val, callback) => {\
            if (val != '234') {\
              return callback(new Error('必须输入【234】'));\
            }\
            return callback();\
          }", type: "function", default: ""
        },
        {
            name: "onKeyPress", desc: '只对input/textarea生效,onKeyPress: $event => {\
                if ($event.keyCode == 13) {}\
              }', type: "function", default: ""
        },
        { name: "onChange", desc: `type=select生效
        <p>
	onChange: (value, option) =&gt; {
</p>
<p>
	}
</p>`, type: "function", default: "" },
        { name: "url", desc: "从指定后台url(例：api/xx/xx)远程搜索，(返回的数据格式:[{key:'x',value:'x1'}])，type=select生效", type: "bool", default: "false" },
        { name: "remote", desc: "开启后台字典远程搜索(后台字典必须配置必须是自定sql)，type=select才会生效", type: "bool", default: "false" },
        { name: "extra", desc: '添加额外标签：  extra: {//显示图标 icon: "ios-search", //显示文本 text: "点击可触发事件",//触发事件 click: item => {}}', type: "string", default: "" },
        { name: "minRows", desc: "textarea标签最小高度", type: "number", default: "2" },
        { name: "maxRows", desc: "textarea标签最大高度", type: "number", default: "10" },
        { name: "}]]", desc: "表单字段formRules的参数配置说明", type: "", default: "" },
        { name: "表单重置", desc: "表单重置使用：this.$refs.你的ref名字.reset()", type: "", default: "" },
        { name: "表单验证", desc: "表单验证使用：this.$refs.你的ref名字.validate()，返回值bool", type: "", default: "" },
        { name: "数据槽slot", desc: "可以在表单的第一行第前使用<div name='header'></div>或最后一行<div name='footer'></div>", type: "", default: "" }],
        methods: []
    }, header: {
        attr: [{ name: "icon", desc: "显示图标", type: "string", default: "" },
        { name: "text", desc: "显示名称", type: "string", default: "" },
        { name: "slot数据槽", desc: "右边button显示的这部份内容", type: "", default: "" },
        { name: "slot数据槽content", desc: "使用方式<div slot='content'>VolHeader这里可以定义显示内容</div>", type: "", default: "" }],
        methods: []
    },
    box: {
        attr: [{ name: "title", desc: "弹出框标题", type: "string", default: "基本信息" },
        { name: "icon", desc: "弹出框图标", type: "string", default: "ios-information-circle-outline" },
        { name: "model", desc: "是否显示弹出框", type: "bool", default: "false" },
        { name: "height", desc: "弹出框高度", type: "int", default: "200" },
        { name: "width", desc: "弹出框宽度", type: "int", default: "650" },
        { name: "padding", desc: "弹出框内容padding大小", type: "int", default: "16" },
        { name: "mask", desc: "弹出框是否显示遮罩", type: "boole", default: "true" },
        { name: "数据槽slot", desc: "弹出框内容", type: "", default: "" },
        { name: "数据槽footer", desc: "弹出框底部按钮，默认只有一个关闭按钮，如果加了 <div slot='footer'></div>关闭按钮不会显示，需要自己添加", type: "", default: "" }],
        methods: []
    }, voltable: {
        attr: [{ name: "loadKey", desc: "是否自动绑定数据源key/value,如果=true会自动把带bind属性data长度为0的列绑定上数据源", type: "bool", default: "false" },
        { name: "height", desc: "table高度", type: "number", default: "" },
        { name: "max-height", desc: "table最大高度,如果设置了max-height属性，height属性将不会生效", type: "number", default: "" },
        { name: "single", desc: "是否只能单选", type: "number", default: "false" },
        { name: "ck", desc: "是否显示checkbox", type: "bool", default: "true" },
        { name: "--", desc: "--", type: "--", default: "--" },
        { name: "pagination", desc: "分页参数", type: "json", default: "{ total: 0, size: 0, sortName: ''}" },
        { name: "{", desc: "", type: "", default: "" },
        { name: "total", desc: "总数量", type: "number", default: "0" },
        { name: "size", desc: "分页大小", type: "number", default: "0" },
        { name: "sortName", desc: "排序字段", type: "string", default: "" },
        { name: "}", desc: "", type: "", default: "" },
        { name: "--", desc: "--", type: "--", default: "--" },
        { name: "url", desc: "远程加载数据的地址，配置了url默认从远程加载数据", type: "string", default: "" }, { name: "defaultLoadPage", desc: "传入了url参数，是否默认加载表格数据", type: "bool", default: "true" },
        { name: "paginationHide", desc: "是否隐藏分页数据", type: "bool", default: "true" },
        { name: "index", desc: "是否创建索引号(如果启用编辑功能,index必须设置为true)", type: "bool", default: "false" },
        { name: "tableData", desc: "table表数据，如果不需要从远程加载table数据，请设置tableData属性,格式:[{'字段1':'值1'},{'字段2':'值2'}]", type: "array", default: "[]" },
        { name: "--", desc: "--", type: "--", default: "--" },
        { name: "columns", desc: "table表参数配置", type: "array", default: "[]" },
        { name: "{-----", desc: "-----columns属性介绍开始处-----", type: "-----", default: "-----" },
        { name: "field", desc: "字段", type: "string", default: "" },
        { name: "title", desc: "table列名", type: "string", default: "" },
        { name: "width", desc: "列宽度", type: "number", default: "" },
        { name: "sort", desc: "是否排序列", type: "bool", default: "false" },
        { name: "hidden", desc: "是否隐藏列", type: "bool", default: "false" },
        { name: "fixed", desc: "是否固定列", type: "bool", default: "false" },
        { name: "type", desc: "目前只有img,file(设置了此属性，点击即可下载文件),其他不需要设置", type: "string", default: "" },
        { name: "required", desc: "是否必填项(设置edit了属性才会生效)", type: "bool", default: "false" },
        { name: "summary", desc: "是否显示统计求和,目前远程api返回的数据才有效，前台参照sellorder.js配置,后台可参照SellOrder表查询数据返回的格式", type: "bool", default: "false" },
        { name: "edit:{", desc: "表格编辑配置", type: "json", default: "" },
        { name: "type", desc: "编辑创建的标签类型：number、decimal、text、datetime、date、switch、select", type: "", default: "" },
        { name: "keep", desc: "当前单元格始终处于编辑状态", type: "bool", default: "false" },
        { name: "min", desc: "type为number、decimal时验证最小值,其他验证长度", type: "number", default: "" },
        { name: "max}", desc: "同上min", type: "number", default: "" },
        { name: "--", desc: "--", type: "--", default: "--" },
        {
            name: "onChange", desc: `<div class="cnblogs_Highlighter">
        <div>select、switch组件选择事件(只对编辑生效)</div>
        <div>onChange:(column,row,tableData,value)=&gt;{</div>
        <pre class="brush:javascript;gutter:true;"><em id="__mceDel">             this.$Message.error(row["test2"]);
                    },
        </em></pre>
        </div>
        <p>　　</p>`, type: "json", default: ""
        },
        { name: "extra", desc: "额外标签(只对编辑生效)", type: "json", default: "" },
        {
            name: "额外标签", desc: `<div class="cnblogs_code">
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
        <p>&nbsp;</p>`, type: "", default: ""
        },
        { name: "bind{", desc: "数据源绑定配置", type: "json", default: "" },
        { name: "key", desc: "后台字典数据的key", type: "string", default: "" },
        { name: "data}", desc: "数据源,如果设置的loadKey=true,些处将设置为data:[]。格式:[{key:'1',value:'北京市'},{key:'2',value:'上海市'}],如果data长度>0，不会被loadKey从后台加载的数据源覆盖", type: "array", default: "[]" },
        { name: "formatter", desc: "列格式化处理,格式：formatter:(row) => {return '123'}", type: "function", default: "" },
        { name: "click", desc: "单元格点击事件,格式：click: (row, column, event) => {}", type: "function", default: "" },
        { name: "getColor", desc: "设置绑定了bind数据源属性的单元格颜色,格式：getColor:(row) => {return 'red'}", type: "function", default: "" },
        { name: "-----}", desc: "-----columns属性介绍结尾处-----", type: "-----", default: "-----" },
        ],
        methods: [{ name: "delRow", desc: "删除选中行，this.$refs.自定义的名字.delRow()", param: "" },
        { name: "add", desc: "添加行，this.$refs.自定义的名字.add({'字段1':'值1'})", param: "" },
        { name: "selection", desc: "获取选中的行，this.$refs.自定义的名字.selection,注意此处selection是属性", param: "" },
        { name: "load", desc: "刷新表数据，this.$refs.自定义的名字.load({条件:xx},true),条件可以任意写你自己接收的格式,第二个参数是否重置分页信息", param: "" },
        { name: "resetPage", desc: "重置分页信息，this.$refs.自定义的名字.resetPage()", param: "" },
        { name: "loadBefore", desc: `从后台加载数据前处理，也可参照【从api加载数据】Demo", param: "(param, callBack) 参数：param为查询相关配置，可自己修改此配置;callBack回调方法，callBack(true),如果回调传入false，将中断代码执行,<span style="display:none;"></span><span style="line-height:2;font-size:18px;"><span style="display:none;"></span><span style="font-size:14px;">&nbsp; &nbsp;
        <br/>
        /*查询前处理(如果需要查询条件，实现组件方法loadBefore方法即可:</span><br />
            <span style="font-size:14px;"> &nbsp; &nbsp; &nbsp; &nbsp; loadBefore=(param, callBack)=&gt;{</span><br />
            <span style="font-size:14px;"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; param.wheres = [{ name: "PhoneNo", value: "1234567890" }];</span><br />
            <span style="font-size:14px;"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; callBack(true);</span><br />
            <span style="font-size:14px;"> &nbsp; &nbsp; &nbsp; &nbsp; })</span><br />
            <span style="font-size:14px;"> &nbsp; &nbsp; &nbsp; */</span><br />
            </span><span style="line-height:1.5;font-size:18px;"><span style="display:none;"></span></span><br />` },
        { name: "loadTableAfter", desc: "从后台加载数据后处理，可参照【从api加载数据】Demo", param: "(data, callBack) 参数：data为后台返回的数据;callBack回调方法，callBack(true),如果回调传入false，将中断代码执行" },
        { name: "rowChange", desc: "行选中事件,只有设置single=true单选才会生效", param: "row,当前选中的行 " }]
    }, edittable: {
        attr: [],
        methods: []
    }, viewGrid: {
        attr: [{ name: "columns", desc: "查询页面table表的配置,如果满足不了业务,可参照VolTable参数动态扩展", type: "array", default: "[]" },
        { name: "detail", desc: "从表配置：{columns:[],sortName:''},columns从表table列配置,sortName从表排序字段", type: "json", default: "{}" },
        { name: "editFormFileds", desc: "编辑字段，可参照VolForm配置", type: "json", default: "{}" },
        { name: "editFormOptions", desc: "编辑配置,，可参照VolForm配置", type: "array", default: "[]" },
        { name: "searchFormFileds", desc: "查询字段，同上", type: "json", default: "{}" },
        { name: "searchFormOptions", desc: "查询配置，同上", type: "array", default: "[]" },
        {
            name: "table", desc: "表其他配置,如：     table: {\
            key: 'Order_Id', //排序字段\
            footer: 'Foots',\
            cnName: '主从表ViewGird组件使用',//表中文名\
            name: 'SellOrder',//表名(代码生码的别名)\
            url: '/SellOrder/',//后台控制器名\
            sortName: 'CreateDate' //后台排序字段}", type: "array", default: "{}"
        },
        { name: "extend", desc: "扩展js中的所有对象,如:doc_viewGirdExtension.js整个js文件的对象", type: "json", default: "array" },
        { name: "single", desc: "查询界面的表是否只能单选", type: "bool", default: "false" },
        { name: "boxModel", desc: "弹出新建、编辑框状态", type: "bool", default: "false" },
        { name: "currentAction", desc: "当前操作的状态:如：Add,Update", type: "string", default: "" },
        { name: "currentRow", desc: "当前编辑的行数据", type: "json", default: "" },
        { name: "labelWidth", desc: "高级查询label标签的宽度", type: "number", default: "100" },
        { name: "maxBtnLength", desc: "查询界面显示的按钮最大数量，超过的在更多中显示", type: "number", default: "3" },
        { name: "buttons", desc: `查询界面的所有按钮，[{<br />
          &nbsp; &nbsp; name: "刷 新",//按钮名称<br />
          &nbsp; &nbsp; icon: 'md-refresh',//按钮图标，参照iview图标<br />
          &nbsp; &nbsp; type: 'success',//按钮类型,可参照iview buttons设置此属性<br />
          &nbsp; &nbsp; hidden:false,//是否隐藏按钮(如果想要隐藏按钮，在onInited方法中遍历buttons，设置hidden=true)<br />
          &nbsp; &nbsp; onClick: function () { //触发事件<br />
          &nbsp; &nbsp; &nbsp; &nbsp; this.refresh();<br />
          &nbsp; &nbsp; }<br />
          }]<br />`, type: "array", default: "[]" },
        { name: "boxButtons", desc: "弹出框的所有按钮，格式同上", type: "array", default: "[]" },
        { name: "dicKeys", desc: "所有数据源的字典编号", type: "array", default: "[]" },
        { name: "hasKeyField", desc: "所有有数据源的字段", type: "array", default: "[]" },
        { name: "load", desc: "页面打开后是否默认加载表格数据", type: "bool", default: "true" },
        { name: "activatedLoad", desc: "页面触发actived时是否刷新页面数据", type: "bool", default: "false" },
        { name: "hasDetail", desc: "是否有明细(如果有明细表就为true)", type: "bool", default: "false" },
        { name: "summary", desc: "查询界面是否显示统计和求，设置为true需要实现后台SummaryExpress方法,可参照SellOrderService实现", type: "bool", default: "false" },
        {
            name: "detailOptions", desc: `<div class="cnblogs_code">
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
                    edit: <span style="color: #0000ff;">true</span>, <span style="color: #008000;">//</span><span style="color: #008000;">明细是否可以编辑</span>
                    single:<span style="color: #0000ff;">false</span>,<span style="color: #008000;">//</span><span style="color: #008000;">明细表是否单选</span>
                    delKeys: [], <span style="color: #008000;">//</span><span style="color: #008000;">当编辑时删除当前明细的行主键值</span>
                    url: "", <span style="color: #008000;">//</span><span style="color: #008000;">从表加载数据的url</span>
                    pagination: { total: 0, size: 100, sortName: "" }, <span style="color: #008000;">//</span><span style="color: #008000;">从表分页配置数据</span>
                    height: 0, <span style="color: #008000;">//</span><span style="color: #008000;">默认从表高度</span>
                    doubleEdit: <span style="color: #0000ff;">true</span>, <span style="color: #008000;">//</span><span style="color: #008000;">使用双击编辑</span>
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
            <p>&nbsp;</p>`, type: "json", default: ""
        },
        {
            name: "auditParam", desc: `审核参数<div class="cnblogs_code">
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
        <p>&nbsp;</p>`},
        { name: "tableHeight", desc: "查询页面table的高度", type: "number", default: "0" },
        { name: "tableMaxHeight", desc: "查询页面table的最大高度,如果同时设置了tableHeight，只会tableMaxHeight起作用", type: "number", default: "0" },
        {
            name: "pagination", desc: `分页参数<div class="cnblogs_code">
        <pre><span style="color: #000000;">pagination: {
              total: </span>0<span style="color: #000000;">,
             size: </span>30, <span style="color: #008000;">//</span><span style="color: #008000;">分页大小</span>
            sortName: "" <span style="color: #008000;">//</span><span style="color: #008000;">排序字段</span>
         }</pre>
        </div>
        <p>&nbsp;</p>`, type: "json", default: ""
        },
        {
            name: "boxOptions", desc: `新建、编辑弹出框参数<div class="cnblogs_code">
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
        <p>&nbsp;</p>`, type: "json", default: ""
        },
        ],


        methods: [{ name: "refresh", desc: "刷新查询界面的表数据,使用：this.refresh()", param: "" },
        { name: "getSelectRows", desc: "查询界面获取选中的行,使用：this.getSelectRows()", param: "" },
        { name: "获取从表明细选择中的行", desc: "获取从表明细选择中的行,使用：this.$refs.detail.getSelected()", param: "" },
        { name: "刷新从表数据", desc: `<p> this.resetDetailTable()</p>
        <br />
//如果是新建弹出框中，此方法不会执行<br />
//新建中刷新从表解决办法：<br />
/*<br />
&nbsp;let _currentAction= this.currentAction;<br />
&nbsp; this.currentAction="";<br />
&nbsp; this.resetDetailTable()<br />
&nbsp; this.currentAction=_currentAction;<br />
*/<br />`, param: "" },
        { name: "扩展js方法使用", desc: "扩展js为当前数据库表生成页面扩展js,如:SellOrder.js,文件由代码生成，可自行在js中实现下面列出的方法", param: "" },
        {
            name: "扩展js方法使用", desc: `<div class="cnblogs_code">
        <pre>let extension =<span style="color: #000000;"> {
            components: {</span><span style="color: #008000;">//</span><span style="color: #008000;">动态扩充组件或组件路径</span>
                <span style="color: #008000;">//</span><span style="color: #008000;">表单header、content、footer对应位置扩充的组件</span>
                gridHeader: "",//() =&gt; import("./SellOrderComponents/GridHeaderExtend.vue"),<span style="color: #008000;">//</span><span style="color: #008000;">{ template: "&lt;div&gt;扩展组xx件&lt;/div&gt;" },</span>
                gridBody: "",//() =&gt; import("./SellOrderComponents/GridBodyExtend.vue"<span style="color: #000000;">),
                gridFooter: () </span>=&gt; import("./SellOrderComponents/GridFooterExtend.vue"<span style="color: #000000;">),
                </span><span style="color: #008000;">//</span><span style="color: #008000;">弹出框(修改、编辑、查看)header、content、footer对应位置扩充的组件</span>
                modelHeader: ""<span style="color: #000000;">,
                modelBody: { template: </span>'xx'<span style="color: #000000;"> },
                modelFooter:""</span><span style="color: #000000;">,
            },<br /></span></pre>
        <div>&nbsp;tableAction:"",//指定获取表的权限按钮,默认为当前表的权限</div>
        <div>&nbsp;text: "示例覆盖全部可扩展方法,前台扩展文件SellOrder.js，后台Partial-&gt;SellOrdeService.cs",</div>
        <pre><span style="color: #000000;">    buttons: { </span><span style="color: #008000;">//</span><span style="color: #008000;">扩展按钮</span>
                <span style="color: #008000;">//</span><span style="color: #008000;">注：没有编辑或新建权限的情况下，是不会显示此处添加的扩展按钮，如果仍需要显示此处的按钮，可以把按钮在methods的onInited方法中添加,如：this.boxButtons.push(...)</span>
                view: [<span style="color: #008000;">//</span><span style="color: #008000;">ViewGrid查询界面按钮</span>
        <span style="color: #000000;">            {
                        name: </span>"点我"<span style="color: #000000;">,
                        icon: </span>'md-create'<span style="color: #000000;">,
                        value: </span>'Edit'<span style="color: #000000;">,
                        class: </span>''<span style="color: #000000;">,
                        type: </span>'error'<span style="color: #000000;">,
                        index: </span>1,<span style="color: #008000;">//</span><span style="color: #008000;">显示的位置</span>
                        onClick: <span style="color: #0000ff;">function</span> () { <span style="color: #008000;">//</span><span style="color: #008000;">扩展按钮执行事件</span>
                            <span style="color: #008000;">//</span><span style="color: #008000;">this可以获取所有属性，包括this.$refs.gridHeader/gridBody等获取扩展组件对象</span>
                            <span style="color: #008000;">//</span><span style="color: #008000;"> this.$message("测试扩展按钮");</span>
                            <span style="color: #0000ff;">this</span>.$refs.gridHeader.model = <span style="color: #0000ff;">true</span><span style="color: #000000;">;
                        }
                    }, {
                        name: </span>"调用后台"<span style="color: #000000;">,
                        icon: </span>'md-create'<span style="color: #000000;">,
                        value: </span>'Edit'<span style="color: #000000;">,
                        class: </span>''<span style="color: #000000;">,
                        type: </span>'error'<span style="color: #000000;">,
                        index: </span>1,<span style="color: #008000;">//</span><span style="color: #008000;">显示的位置</span>
                        onClick: <span style="color: #0000ff;">function</span> () { <span style="color: #008000;">//</span><span style="color: #008000;">扩展按钮执行事件</span>
                            <span style="color: #0000ff;">this</span><span style="color: #000000;">.getServiceDate();
                        }
                    }],
                box: </span><span style="color: #008000;">//</span><span style="color: #008000;">新建、编辑弹出框按钮</span>
                    [<span style="color: #008000;">//</span><span style="color: #008000;">ViewGrid查询界面按钮</span>
        <span style="color: #000000;">                {
                            name: </span>"点我1"<span style="color: #000000;">,
                            icon: </span>'md-create'<span style="color: #000000;">,
                            value: </span>'Edit'<span style="color: #000000;">,
                            class: </span>''<span style="color: #000000;">,
                            type: </span>'success'<span style="color: #000000;">,
                            index: </span>1,<span style="color: #008000;">//</span><span style="color: #008000;">显示的位置</span>
                            onClick: <span style="color: #0000ff;">function</span><span style="color: #000000;"> () {
                                </span><span style="color: #0000ff;">this</span>.$message.error("扩展的明细Box按钮,可设置index值指定显示位置,可使用this.$refs拿到包括自定义扩展的所有组件"<span style="color: #000000;">);
                            }
                        }],
                detail: </span><span style="color: #008000;">//</span><span style="color: #008000;">新建、编辑弹出框明细表table表按钮</span>
                    [<span style="color: #008000;">//</span><span style="color: #008000;">ViewGrid查询界面按钮</span>
        <span style="color: #000000;">                {
                            name: </span>"点我2"<span style="color: #000000;">,
                            icon: </span>'md-create'<span style="color: #000000;">,
                            value: </span>'Edit'<span style="color: #000000;">,
                            class: </span>''<span style="color: #000000;">,
                            type: </span>'success'<span style="color: #000000;">,
                            index: </span>1,<span style="color: #008000;">//</span><span style="color: #008000;">显示的位置</span>
                            onClick: <span style="color: #0000ff;">function</span><span style="color: #000000;"> () {
                                </span><span style="color: #0000ff;">this</span>.$message.error("扩展的明细table按钮,可设置index值指定显示位置"<span style="color: #000000;">);
                            }
                        }]
            },</span><span style="color: #008000;">//</span><span style="color: #008000;">扩展的按钮</span>
            methods: {<span style="color: #008000;">//</span><span style="color: #008000;">方法扩展</span>
        <span style="color: #000000;">        getServiceDate() {
                    </span><span style="color: #0000ff;">this</span>.http.post("/api/SellOrder/getServiceDate", {}, '正在调用后台数据').then(date =&gt;<span style="color: #000000;"> {
                        </span><span style="color: #0000ff;">this</span>.$message.error("从后台获取的服务器时间是：" +<span style="color: #000000;"> date);
                    })
                },
                mounted() {

                   </span><span style="color: #008000;">//</span><span style="color: #008000;"> this.$Notice.success({ title: '执行mounted方法' });</span>
        <span style="color: #000000;">        },
                onInit() {
                    </span><span style="color: #008000;">//</span><span style="color: #008000;">表格设置为单选</span>
                    <span style="color: #008000;">//</span><span style="color: #008000;"> this.single=true;</span>
                    <span style="color: #008000;">//</span><span style="color: #008000;"> this.detailOptions.single=true;</span>
                    <span style="color: #008000;">//</span><span style="color: #008000;">设置编辑表单数量字段的最小与最大值</span>
                    <span style="color: #0000ff;">this</span>.editFormOptions.forEach(x =&gt;<span style="color: #000000;"> {
                        x.forEach(item </span>=&gt;<span style="color: #000000;"> {
                            </span><span style="color: #008000;">//</span><span style="color: #008000;">设置输入的数量的最小值与最大值(默认是1)</span>
                            <span style="color: #0000ff;">if</span> (item.field == "Qty"<span style="color: #000000;">) {
                                item.min </span>= 10<span style="color: #000000;">;
                                item.max </span>= 200<span style="color: #000000;">;
                            }
                        });
                    })

                    </span><span style="color: #008000;">//</span><span style="color: #008000;">动态修改table并给列添加事件</span>
                    <span style="color: #0000ff;">this</span>.columns.forEach(x =&gt;<span style="color: #000000;"> {
                        </span><span style="color: #0000ff;">if</span> (x.field == "Qty"<span style="color: #000000;">) {
                            x.formatter </span>= (row) =&gt;<span style="color: #000000;"> {
                                </span><span style="color: #0000ff;">return</span> '&lt;a&gt;' + row.Qty + "(弹出框)" + '&lt;/a&gt;'<span style="color: #000000;">
                            }
                            x.click </span>= (row, column, event) =&gt;<span style="color: #000000;"> {
                                </span><span style="color: #0000ff;">this</span>.$refs.gridHeader.model = <span style="color: #0000ff;">true</span><span style="color: #000000;">;
                            }
                        }
                    })

                    </span><span style="color: #008000;">//</span><span style="color: #008000;">动态设置弹出框table的高度</span>
                    <span style="color: #0000ff;">this</span>.detailOptions.height = 110<span style="color: #000000;">;
                    </span><span style="color: #008000;">//</span><span style="color: #008000;">动态设置查询界面table高度</span>
                    <span style="color: #0000ff;">this</span>.tableHeight = 200<span style="color: #000000;">;;
                    </span><span style="color: #0000ff;">this</span>.$Notice.success({ title: 'create方法执行时,你可以此处编写业务逻辑'<span style="color: #000000;"> });
                },
                onInited() {
                    </span><span style="color: #008000;">//</span><span style="color: #008000;">   this.$Notice.success({ title: 'create方法执行后', desc: '你可以SellOrder.js中编写业务逻辑,其他方法同样适用' });</span>
        <span style="color: #000000;">        },
                searchBefore(param) { </span><span style="color: #008000;">//</span><span style="color: #008000;">查询ViewGird表数据前,param查询参数</span>
                  &nbsp; &nbsp; //添加任意查询参数
                  &nbsp; &nbsp; //在后台GetPageData()方法读取options.value
                  &nbsp; &nbsp; //见后台开发-&gt;后台代码扩展实现
                  &nbsp; &nbsp; //param.value="xxx";

                  &nbsp; &nbsp; //添加其他查询条件,也可以在后台扩展中写查询条件
                  &nbsp; &nbsp; // param.wheres = [{
                  &nbsp; &nbsp; //&nbsp; &nbsp;'name': '字段名',
                  &nbsp; &nbsp; //&nbsp; &nbsp;'value': '查询的值',
                  &nbsp; &nbsp; //&nbsp; &nbsp;'displayType': 'like'//设置为模糊查询
                  &nbsp; &nbsp; // }]
                  &nbsp; &nbsp; //返回false，则不会执行查询
                   &nbsp; return true;
                },
                searchAfter(result) { </span><span style="color: #008000;">//</span><span style="color: #008000;">查询ViewGird表数据后param查询参数,result回返查询的结果</span>
                    <span style="color: #0000ff;">this</span>.$Notice.success({ title: <span style="color: #0000ff;">this</span>.table.cnName + ',查询结果', desc: '返回的对象：' +<span style="color: #000000;"> JSON.stringify(result) });
                    </span><span style="color: #0000ff;">return</span> <span style="color: #0000ff;">true</span><span style="color: #000000;">;
                },
                searchDetailBefore(param) {</span><span style="color: #008000;">//</span><span style="color: #008000;">查询从表表数据前,param查询参数</span>
                    <span style="color: #008000;">//</span><span style="color: #008000;"> 同上searchBefore操作</span>
                    <span style="color: #0000ff;">return</span> <span style="color: #0000ff;">true</span><span style="color: #000000;">;
                },
                searchDetailAfter(data) {</span><span style="color: #008000;">//</span><span style="color: #008000;">查询从表后param查询参数,result回返查询的结果</span>
                    <span style="color: #0000ff;">this</span>.$Notice.success({ title: <span style="color: #0000ff;">this</span>.detailOptions.cnName + ',查询结果', desc: '返回的对象：' +<span style="color: #000000;"> JSON.stringify(data) });
                    </span><span style="color: #0000ff;">return</span> <span style="color: #0000ff;">true</span><span style="color: #000000;">;
                },
                delBefore(ids, rows) { </span><span style="color: #008000;">//</span><span style="color: #008000;">查询界面的表删除前 ids为删除的id数组,rows删除的行</span>
                    let auditStatus = rows.some(x =&gt; { <span style="color: #0000ff;">return</span> x.AuditStatus &gt; 0<span style="color: #000000;"> });
                    </span><span style="color: #0000ff;">if</span><span style="color: #000000;"> (auditStatus) {
                        </span><span style="color: #0000ff;">this</span>.$message.error('只能删除未审核的数据'<span style="color: #000000;">)
                        </span><span style="color: #0000ff;">return</span> <span style="color: #0000ff;">false</span><span style="color: #000000;">;
                    }
                    </span><span style="color: #0000ff;">this</span>.$Notice.success({ title: '删除前，选择的Id:' + ids.join(','<span style="color: #000000;">) });
                    </span><span style="color: #0000ff;">return</span> <span style="color: #0000ff;">true</span><span style="color: #000000;">;
                },
                delAfter(result) {</span><span style="color: #008000;">//</span><span style="color: #008000;">查询界面的表删除后</span>
                    <span style="color: #0000ff;">return</span> <span style="color: #0000ff;">true</span><span style="color: #000000;">;
                },
                delDetailRow(rows) { </span><span style="color: #008000;">//</span><span style="color: #008000;">弹出框删除明细表的行数据(只是对table操作，并没有操作后台)</span>
        <span style="color: #000000;">            console.log(rows)
                    </span><span style="color: #0000ff;">return</span> <span style="color: #0000ff;">true</span><span style="color: #000000;">;
                },
                addBefore(formData) { </span><span style="color: #008000;">//</span><span style="color: #008000;">新建保存前formData为对象，包括明细表</span>
                <div style="color: #008000;">
                //formData格式：
                // {
                //&nbsp; &nbsp; &nbsp;mainData: { 主表字段1: 'x1', 主表字段2: 'x2' },
                //&nbsp; &nbsp; &nbsp;detailData: [{ 明细表字段1: d1 }],
                //&nbsp; &nbsp; &nbsp;delKeys: null //删除明细表行数据的id
                // }
                //如果需要同时提交其他数据到后台，请设置formData.extra=xxxx
                //后台在表xxxxService.cs中重写Add方法即可从saveDataModel参数中拿到extra提交的对象
                </div>
                    <span style="color: #0000ff;">this</span>.$Notice.success({ title: <span style="color: #0000ff;">this</span>.detailOptions.cnName + '新建前：', desc: '提前的数据：' +<span style="color: #000000;"> JSON.stringify(formData) });
                    </span><span style="color: #0000ff;">return</span> <span style="color: #0000ff;">true</span><span style="color: #000000;">;
                },
                addAfter(result) {</span><span style="color: #008000;">//</span><span style="color: #008000;">新建保存后result返回的状态及表单对象</span>
                    <span style="color: #0000ff;">this</span>.$Notice.success({ title: <span style="color: #0000ff;">this</span>.detailOptions.cnName + '新建完成后：', desc: '返回的数据' +<span style="color: #000000;"> JSON.stringify(result) });
                    </span><span style="color: #0000ff;">return</span> <span style="color: #0000ff;">true</span><span style="color: #000000;">;
                },
                updateBefore(formData) { </span><span style="color: #008000;">//</span><span style="color: #008000;">编辑保存前formData为对象，包括明细表、删除行的Id</span>
                    <div style="color: #008000;">
                    //formData格式：
                    // {
                    //&nbsp; &nbsp; &nbsp;mainData: { 主表字段1: 'x1', 主表字段2: 'x2' },
                    //&nbsp; &nbsp; &nbsp;detailData: [{ 明细表字段1: d1 }],
                    //&nbsp; &nbsp; &nbsp;delKeys: null //删除明细表行数据的id
                    // }
                    //如果需要同时提交其他数据到后台，请设置formData.extra=xxxx
                    //后台在表xxxxService.cs中重写update方法即可从saveDataModel参数中拿到extra提交的对象
                    </div>
                    <span style="color: #0000ff;">this</span>.$Notice.success({ title: <span style="color: #0000ff;">this</span>.detailOptions.cnName + '编辑前：', desc: '提前的数据：' +<span style="color: #000000;"> JSON.stringify(formData) });
                    </span><span style="color: #008000;">//</span><span style="color: #008000;">获取扩展的modelFooter属性text</span>
                    console.log(<span style="color: #0000ff;">this</span><span style="color: #000000;">.$refs.modelFooter.text)
                    </span><span style="color: #0000ff;">return</span> <span style="color: #0000ff;">true</span><span style="color: #000000;">;
                },
                updateAfter(result) {</span><span style="color: #008000;">//</span><span style="color: #008000;">编辑保存后result返回的状态及表单对象</span>
                    <span style="color: #0000ff;">this</span>.$Notice.success({ title: <span style="color: #0000ff;">this</span>.detailOptions.cnName + '编辑完成后：', desc: '返回的数据' +<span style="color: #000000;"> JSON.stringify(result) });
                    </span><span style="color: #0000ff;">return</span> <span style="color: #0000ff;">true</span><span style="color: #000000;">;
                },
                auditBefore(ids, rows) {</span><span style="color: #008000;">//</span><span style="color: #008000;">审核前</span>
                    <span style="color: #0000ff;">if</span> (rows.length &gt; 2) {<span style="color: #008000;">//</span><span style="color: #008000;">每次最多只能审核2条数据</span>
                        <span style="color: #0000ff;">this</span>.$message.error('最多只能选择两条数据'<span style="color: #000000;">);
                        </span><span style="color: #0000ff;">return</span> <span style="color: #0000ff;">false</span><span style="color: #000000;">;
                    }
                    </span><span style="color: #0000ff;">return</span> <span style="color: #0000ff;">true</span><span style="color: #000000;">;
                },
                auditAfter(result, rows) {</span><span style="color: #008000;">//</span><span style="color: #008000;"> 审核后</span>
                    <span style="color: #0000ff;">if</span><span style="color: #000000;"> (result.status) {
                        result.message </span>= "审核成功。。。。。" +<span style="color: #000000;"> result.message;
                    }
                    </span><span style="color: #0000ff;">return</span> <span style="color: #0000ff;">true</span><span style="color: #000000;">;
                },
                resetAddFormBefore() { </span><span style="color: #008000;">//</span><span style="color: #008000;">重置新建表单前的内容</span>
                    <span style="color: #0000ff;">return</span> <span style="color: #0000ff;">true</span><span style="color: #000000;">;
                },
                resetAddFormAfter() { </span><span style="color: #008000;">//</span><span style="color: #008000;">重置新建表单后的内容</span>
                    <span style="color: #008000;">//</span><span style="color: #008000;">如果某些字段不需要重置，则可以重新赋值</span>
                    <span style="color: #0000ff;">this</span>.editFormFileds.Remark = '新建重置默认值66666'<span style="color: #000000;">;
                    </span><span style="color: #008000;">//</span><span style="color: #008000;">给明细表添加默认一行</span>
                    <span style="color: #0000ff;">this</span>.$refs.detail.rowData.push({ Remark: "新建666666"<span style="color: #000000;"> });
                    </span><span style="color: #0000ff;">return</span> <span style="color: #0000ff;">true</span><span style="color: #000000;">;
                },
                resetUpdateFormBefore() { </span><span style="color: #008000;">//</span><span style="color: #008000;">重置编辑表单前的内容</span>
                    <span style="color: #008000;">//</span><span style="color: #008000;">this.editFormFileds当前值</span>
                    console.log(<span style="color: #0000ff;">this</span><span style="color: #000000;">.editFormFileds)
                    </span><span style="color: #008000;">//</span><span style="color: #008000;">当前明细表的行</span>
                    console.log(<span style="color: #0000ff;">this</span><span style="color: #000000;">.$refs.detail.rowData)
                    </span><span style="color: #0000ff;">return</span> <span style="color: #0000ff;">true</span><span style="color: #000000;">;
                },
                resetUpdateFormAfter() { </span><span style="color: #008000;">//</span><span style="color: #008000;">重置编辑表单后的内容</span>
                    <span style="color: #008000;">//</span><span style="color: #008000;">如果某些字段不需要重置，则可以重新赋值</span>
                    <span style="color: #0000ff;">this</span>.editFormFileds.Remark = '编辑重置默认值66666'<span style="color: #000000;">;
                    </span><span style="color: #008000;">//</span><span style="color: #008000;">给明细表添加默认一行</span>
                    <span style="color: #0000ff;">this</span>.$refs.detail.rowData.push({ Remark: "编辑666666"<span style="color: #000000;"> });
                    </span><span style="color: #0000ff;">return</span> <span style="color: #0000ff;">true</span><span style="color: #000000;">;
                },
                importAfter(data) { </span><span style="color: #008000;">//</span><span style="color: #008000;">导入excel后刷新table表格数据</span>
                    <span style="color: #0000ff;">this</span>.search(); <span style="color: #008000;">//</span><span style="color: #008000;">刷新table</span>
        <span style="color: #000000;">        },
                modelOpenBefore(row) { </span><span style="color: #008000;">//</span><span style="color: #008000;">点击编辑/新建按钮弹出框前，可以在此处写逻辑，如，从后台获取数据</span>
        <span style="color: #000000;">
                },
                modelOpenAfter(row) {  </span><span style="color: #008000;">//</span><span style="color: #008000;">点击编辑/新建按钮弹出框后，可以在此处写逻辑，如，从后台获取数据</span>
                    <span style="color: #0000ff;">this</span>.$message.error("此处是打开弹出框后事件,当前操作：" + <span style="color: #0000ff;">this</span>.currentAction + "，你可以在此处编写逻辑，如，从后台获取数据"<span style="color: #000000;">);
                },
                rowChange(row) {  </span><span style="color: #008000;">//</span><span style="color: #008000;">查询界面table点击行事件，只有设置了single=true单选才会生效</span>
                },
                detailRowChange(row) {  </span><span style="color: #008000;">//</span><span style="color: #008000;">明细表界面table点击行事件，只有设置了single=true单选才会生效</span>
                },
                onActivated() { <span style="color: #008000;">//重新加载字典绑定的数据源(如果需要每次点击页面时刷新字典数据源，直接将整个方法添加到js的methods中即可使用)</span>
                &nbsp;&nbsp;&nbsp; <span style="color: #0000ff;">this</span>.initDicKeys();
                }

            }
        };
        export </span><span style="color: #0000ff;">default</span> extension;</pre>
        </div>
        <p>&nbsp;</p>`, param: ""
        }]
    }, uploadExcel: {
        attr: [],
        methods: []
    }, uploadImg: {
        attr: [],
        methods: []
    }, volmenu: {
        attr: [],
        methods: []
    }, volupload: {
        attr: [{ name: "组件上传参数", desc: "组件上传参数属性", type: "", default: "" },
        { name: "组件上传参数", desc: `<div class="cnblogs_code">
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
        <p>&nbsp;</p>`, type: "", default: "" }],
        methods: []
    }
}
export default param;
