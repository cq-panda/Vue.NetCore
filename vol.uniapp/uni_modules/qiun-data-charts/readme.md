## [uCharts官方网站](https://www.ucharts.cn)
## [DEMO演示及在线生成工具（v2.0文档）https://demo.ucharts.cn](https://demo.ucharts.cn)
## [优秀的nvue全端组件与模版库nPro](https://ext.dcloud.net.cn/plugin?id=5169)
## [图表组件在项目中的应用 UReport数据报表](https://ext.dcloud.net.cn/plugin?id=4651) 
## [如何安装、更新 uni_modules 插件点这里，必看，必看，必看](https://uniapp.dcloud.io/uni_modules?id=%e4%bd%bf%e7%94%a8-uni_modules-%e6%8f%92%e4%bb%b6)
## 点击右侧绿色【使用HBuilderX导入插件】即可使用，示例项目请点击右侧蓝色按钮【使用HBuilderX导入示例项目】。
## 初次使用不显示问题详见[常见问题选项卡](https://demo.ucharts.cn)
## <font color=#FF0000> 新手请先完整阅读【帮助文档】及【常见问题】3遍，右侧蓝色按钮【示例项目】请看2遍！ </font> 
## <font color=#FF0000> 关于NVUE兼容的说明： </font> uCharts.js从2.3.0开始支持nuve（暂时只能通过原生canvas写法调用uCharts，nuve版本组件请见码云示例项目[uCharts-demo-nvue](https://gitee.com/uCharts/uCharts)），因其渲染方式是通过nvue的gcanvas组件来渲染，理论上性能不及renderjs的qiun-data-charts组件性能。官方仍然建议NVUE使用图表的页面改为vue页面，在App端，从性能来讲，由于通讯阻塞的问题，nvue的canvas性能不可能达到使用renderjs的vue页面的canvas。在App端，仍然推荐使用qiun-data-charts组件。[详见uni-app官方说明](https://uniapp.dcloud.io/component/canvas?id=canvas)

[![uCharts/uCharts](https://gitee.com/uCharts/uCharts/widgets/widget_card.svg?colors=393222,ebdfc1,fffae5,d8ca9f,393222,a28b40)](https://gitee.com/uCharts/uCharts)

## 秋云图表组件使用帮助

全新图表组件，全端全平台支持，开箱即用，可选择uCharts引擎全端渲染，也可指定PC端或APP端`单独使用ECharts`引擎渲染图表。支持极简单的调用方式，只需指定图表类型及传入符合标准的图表数据即可，使开发者只需专注业务及数据。同时也支持datacom组件读取uniClinetDB，无需关心如何拼接数据等不必要的重复工作，大大缩短开发时间。

## 为何使用官方封装的组件？

封装组件并不难，谁都会，但组件调试却是一件令人掉头发的事，尤其是canvas封装成组件会带来一系列问题：例如封装后不显示，图表多次初始化导致抖动问题，单页面多个图表点击事件错乱，组件放在scroll-view中无法点击，在图表上滑动时页面无法滚动等等一系列问题。为解决开发者使用可视化组件的困扰，uCharts官方特推出可视化通用组件，本组件具备以下特点：

- 极简单的调用方式，默认配置下只需要传入`图表类型`及`图表数据`即可全端显示。
- 提供强大的`在线配置生成工具`，可视化中的可视化，鼠标点一点就可以生成图表，可视化从此不再难配。
- 兼容ECharts，可选择`PC端或APP端单独使用ECharts`引擎渲染图表。
- H5及App采用`renderjs`渲染图表，动画流畅、性能翻倍。
- 根据父容器尺寸`弹性显示图表`，再也不必为宽高匹配及多端适配问题发愁。
- 支持`加载状态loading及error展示`，避免数据读取显示空白的尴尬。
- chartData`配置与数据解耦`，即便使用ECharts引擎也不必担心拼接option的困扰。
- localdata`后端数据直接渲染`，无需自行拼接chartData的categories及series，从后端拿回的数据简单处理即可生成图表。
- 小程序端不必担心包体积过大问题，ECharts引擎将不会编译到各小程序端，u-charts.js编译后`仅为93kb`。
- 未来将支持通过HbuilderX的[schema2code自动生成全端全平台图表](https://ext.dcloud.net.cn/plugin?id=4684)，敬请期待！！！
- uCharts官方拥有4个2000人的QQ群支持，庞大的用户量证明我们一直在努力，本组件将持续更新，请各位放心使用，您的宝贵建议是我们努力的动力！！


## 致开发者

感谢各位开发者`三年`来对秋云及uCharts的支持，uCharts的进步离不开各位开发者的鼓励与贡献，为更好的帮助各位开发者在uni-app生态系统更好的应用图表，uCharts始终坚持开源，并提供社群帮助开发者解决问题。 为确保您能更好的应用图表组件，建议您先`仔细阅读本页文档`以及uCharts官方文档，而不是下载下来`直接使用`。 如遇到问题请先阅读文档，如仍然不能解决，请加入QQ群咨询，如群友均不能解决或者您有特殊需求，请在群内私聊我，因工作原因，回复不一定很及时，您可直接说问题，有时间一定会回复您。

uCharts的开源图表组件的开发，付出了大量的个人时间与精力，经过两年来的考验，不会有比较明显的bug，请各位放心使用。不求您5星评价，也不求您赞赏，`只求您对开源贡献的支持态度`，所以，当您想给`1星评价`的时候，秋云真的会`含泪希望您绕路而行……`。如果您有更好的想法，可以在`码云提交Pull Requests`以帮助更多开发者完成需求，再次感谢各位对uCharts的鼓励与支持！

## 快速体验

一套代码编到7个平台，依次扫描二维码，亲自体验uCharts图表跨平台效果！IOS因demo比较简单无法上架，请自行编译。
![](https://box.kancloud.cn/58092090f2bccc6871ca54dbec268811_654x479.png)

## 快速上手
### <font color=#FF0000> 注意前提条件【版本要求：HBuilderX 3.1.0+】 </font> 
- 1、插件市场点击右侧绿色按钮【使用HBuilderX导入插件】，或者【使用HBuilderX导入示例项目】查看完整示例工程
- 2、依赖uniapp的vue-cli项目：请将uni-modules目录复制到src目录，即src/uni_modules。（请升级uniapp依赖为最新版本）
- 3、页面中直接按下面用法直接调用即可，无需在页面中注册组件qiun-data-charts
- 4、注意父元素class='charts-box'这个样式需要有宽高

## 基本用法

- template代码：（[建议使用在线工具生成](https://demo.ucharts.cn)）

```
<view class="charts-box">
	<qiun-data-charts type="column" :chartData="chartData" />
</view>
```

- 标准数据格式1：（折线图、柱状图、区域图等需要categories的直角坐标系图表类型）

```
chartData:{
  categories: ["2016", "2017", "2018", "2019", "2020", "2021"],
  series: [{
    name: "目标值",
    data: [35, 36, 31, 33, 13, 34]
  }, {
    name: "完成量",
    data: [18, 27, 21, 24, 6, 28]
  }]
}
```

- 标准数据格式2：（饼图、圆环图、漏斗图等不需要categories的图表类型）

```
chartData:{
  series: [{
    data: [
      {
        name: "一班",
        value: 50
      }, {
        name: "二班",
        value: 30
      }, {
        name: "三班",
        value: 20
      }, {
        name: "四班",
        value: 18
      }, {
        name: "五班",
        value: 8
      }
    ]
  }]
}
```

注：其他特殊图表类型，请参考mockdata文件夹下的数据格式，v2.0版本的uCharts已兼容ECharts的数据格式，v2.0版本仍然支持v1.0版本的数据格式。

## localdata数据渲染用法

- 使用localdata数据格式渲染图表的优势：数据结构简单，无需自行拼接chartData的categories及series，从后端拿回的数据简单处理即可生成图表。
- localdata数据的缺点：并不是所有的图表类型均可通过localdata渲染图表，例如混合图，组件并不能识别哪个series分组需要渲染成折线还是柱状图，涉及到复杂的图表，仍需要由chartData传入。

- template代码：（[建议使用在线工具生成](https://demo.ucharts.cn)）

```
<view class="charts-box">
	<qiun-data-charts type="column" :localdata="localdata" />
</view>
```


- 标准数据格式1：（折线图、柱状图、区域图等需要categories的直角坐标系图表类型）

其中value代表数据的数值，text代表X轴的categories数据点，group代表series分组的类型名称即series[i].name。

```
localdata:[
  {value:35, text:"2016", group:"目标值"},
  {value:18, text:"2016", group:"完成量"},
  {value:36, text:"2017", group:"目标值"},
  {value:27, text:"2017", group:"完成量"},
  {value:31, text:"2018", group:"目标值"},
  {value:21, text:"2018", group:"完成量"},
  {value:33, text:"2019", group:"目标值"},
  {value:24, text:"2019", group:"完成量"},
  {value:13, text:"2020", group:"目标值"},
  {value:6, text:"2020", group:"完成量"},
  {value:34, text:"2021", group:"目标值"},
  {value:28, text:"2021", group:"完成量"}
]
```

- 标准数据格式2：（饼图、圆环图、漏斗图等不需要categories的图表类型）

其中value代表数据的数值，text代表value数值对应的描述。

```
localdata:[
  {value:50, text:"一班"},
  {value:30, text:"二班"},
  {value:20, text:"三班"},
  {value:18, text:"四班"},
  {value:8, text:"五班"},
]
```

- 注意，localdata的数据格式必需要符合datacom组件规范[【详见datacom组件】](https://uniapp.dcloud.io/component/datacom?id=mixindatacom)。

## 进阶用法读取uniCloud数据库并渲染图表

- 组件基于uniCloud的[clientDB](https://uniapp.dcloud.net.cn/uniCloud/clientdb)技术，无需云函数，在前端对数据库通过where查询条件及group和count统计即可渲染图表。
- 具体可参考/pages/unicloud/unicloud.vue中的demo例子，使用前，请先关联云服务空间，然后在uniCloud/database/db_init.json文件上点右键，初始化云数据库，当控制台显示“初始化云数据库完成”即完成示例数据的导入，之后方可运行uniCloud的demo。

- template代码：

```
<qiun-data-charts
  type="line"
  :chartData="demoData"
  collection="uni-id-users"
  field="register_date,status"
  :where="'publish_date >= ' + new Date(startDate).getTime() + ' && publish_date <= ' + new Date(endDate).getTime()"
  groupby="dateToString(add(new Date(0),register_date),'%Y-%m-%d','+0800') as text,status as group"
  group-field="count(*) as value"
/>
```

- 注意，从uniCloud读取出的数据，需要符合localdata的标准结果数据格式（参考上部分localdata），并需要把输出的字段as成规定的别名（value、text、group）。


## 示例文件地址：

### <font color=#FF0000> 强烈建议先看本页帮助，再看下面示例文件源码！</font>

```
/pages/ucharts/ucharts.vue（展示用uCharts全端运行的例子）

/pages/echarts/echarts.vue（展示H5和App用ECharts，小程序端用uCharts的例子）

/pages/unicloud/unicloud.vue（展示读取uniCloud数据库后直接渲染图表的例子）

/pages/updata/updata.vue（展示动态更新图表数据的例子）

/pages/other/other.vue（展示图表交互的例子：动态更新图表数据，渲染完成事件，获取点击索引，自定义tooltip，图表保存为图片，强制展示错误信息等）

/pages/format-u/format-u.vue（展示uCharts的formatter用法的例子）

/pages/format-e/format-e.vue（展示ECharts的formatter用法的例子）

/pages/tab/tab.vue（展示再tab选项卡中用法的例子，即父容器采用v-show或v-if时需要注意的问题）

/pages/layout/layout.vue（展示特殊布局用法的例子：swiper、scroll-view、绝对定位等布局）

/pages/canvas/canvas.vue（展示uCharts v2.0版本原生js用法的例子）

```


## 组件基本API参数

|属性名|类型|默认值|必填|说明|
| -- | -- | -- | -- | -- |
|type|String|null|`是`|图表类型，如全端用uCharts，可选值为pie、ring、rose、word、funnel、map、arcbar、line、column、bar、area、radar、gauge、candle、mix、tline、tarea、scatter、bubble <font color=#FF0000>（您也可以根据需求自定义新图表类型，需要在config-ucharts.js或config-echarts.js内添加，可参考config-ucharts.js内的"demotype"类型）</font>|
|chartData|Object|见说明|`是`|图表数据，常用的标准数据格式为{categories: [],series: []}，请按不同图表类型传入对应的标准数据。|
|localdata|Array|[]|`是`|图表数据，如果您觉得拼接上面chartData比较繁琐，可以通过使用localdata渲染，组件会根据传入的type类型，自动拼接categories或series数据（使用localdata就不必再传入chartData，详见 /pages/other/other.vue 中使用localdata渲染图表的例子）。【localdata和collection（uniCloud数据库）同时存在，优先使用localdata；如果localdata和chartData同时存在，优先使用chartData。<font color=#FF0000> 即chartData>localdata>collection的优先级</font>渲染图表】。|
|opts|Object|{}|否|uCharts图表配置参数(option)，请参考[【在线生成工具】](https://demo.ucharts.cn)<font color=#FF0000>注：传入的opts会覆盖默认config-ucharts.js中的配置，只需传入与config-ucharts.js中属性不一致的opts即可实现【同类型的图表显示不同的样式】。</font>|
|eopts|Object|{}|否|ECharts图表配置参数(option)，请参考[【ECharts配置手册】](https://echarts.apache.org/zh/option.html)传入eopts。<font color=#FF0000>注：1、传入的eopts会覆盖默认config-echarts.js中的配置，以实现同类型的图表显示不同的样式。2、eopts不能传递function，如果option配置参数需要function，请将option写在config-echarts.js中即可实现。</font>|
|loadingType|Number|2|否|加载动画样式，0为不显示加载动画，1-5为不同的样式，见下面示例。|
|errorShow|Boolean|true|否|是否在页面上显示错误提示，true为显示错误提示图片，false时会显示空白区域|
|errorReload|Boolean|true|否|是否启用点击错误提示图表重新加载，true为允许点击重新加载，false为禁用点击重新加载事件|
|errorMessage|String|null|否|自定义错误信息，强制显示错误图片及错误信息，当上面errorShow为true时可用。（组件会监听该属性的变化，只要有变化，就会强制显示错误信息！）。说明：1、一般用于页面网络不好或其他情况导致图表loading动画一直显示，可以传任意(不为null或者"null"或者空"")字符串强制显示错误图片及说明。2、如果组件使用了data-come属性读取uniCloud数据，组件会自动判断错误状态并展示错误图标，不必使用此功能。3、当状态从非null改变为null或者空时，会强制调用reload重新加载并渲染图表数据。|
|echartsH5|Boolean|false|否|是否在H5端使用ECharts引擎渲染图表|
|directory|String|'/'|否|二级目录名称，如果开启上面echartsH5即H5端用ECharts引擎渲染图表，并且项目未发布在website根目录，需要填写此项配置。例如二级目录是h5，则需要填写`/h5/`，左右两侧需要带`/`，发布到三级或更多层目录示例`/web/v2/h5/`|
|echartsApp|Boolean|false|否|是否在APP端使用ECharts引擎渲染图表|
|canvasId|String|见说明|否|默认生成32位随机字符串。如果指定canvasId，可方便后面调用指定图表实例，否则需要通过渲染完成事件获取自动生成随机的canvasId|
|canvas2d|Boolean|false|否|是否开启canvas2d模式，用于解决微信小程序层级过高问题，仅微信小程序端可用，其他端会强制关闭canvas2d模式。<font color=#FF0000>注：开启canvas2d模式，必须要传入上面的canvasId（随机字符串，不能是动态绑定的值，不能是数字），否则微信小程序可能会获取不到dom导致无法渲染图表！**开启后，开发者工具显示不正常，预览正常（不能“真机调试”,不能“真机调试”,不能“真机调试”）**</font>|
|background|String|none|否|背景颜色，默认透明none，可选css的16进制color值，如#FFFFFF|
|animation|Boolean|true|否|是否开启图表动画效果|
|inScrollView|Boolean|false|否|图表组件是否在scroll-view中，如果在请传true，否则会出现点击事件坐标不准确的现象|
|pageScrollTop|Number|0|否|如果图表组件是在scroll-view中，并且整个页面还存在滚动条，这个值应为绑定为页面滚动条滚动的距离，否则会出现点击事件坐标不准确的现象|
|reshow|Boolean|false|否|强制重新渲染属性，如果图表组件父级用v-show包裹，初始化的时候会获取不到元素的宽高值，导致渲染失败，此时需要把父元素的v-show方法复制到reshow中，组件检测到reshow值变化并且为true的时候会强制重新渲染|
|reload|Boolean|false|否|强制重新加载属性，与上面的reshow区别在于：1、reload会重新显示loading动画；2、如果组件绑定了uniCloud数据查询，通过reload会重新执行SQL语句查询，重新请求网络。而reshow则不会显示loading动画，只是应用现有的chartData数据进行重新渲染|
|disableScroll|Boolean|false|否|当在canvas中移动时，且有绑定手势事件时，禁止屏幕滚动以及下拉刷新（赋值为true时，在图表区域内无法拖动页面滚动）|
|tooltipShow|Boolean|true|否|点击或者鼠标经过图表时，是否显示tooltip提示窗，默认显示|
|tooltipFormat|String|undefined|否|自定义格式化Tooltip显示内容，详见下面【tooltipFormat格式化】|
|tooltipCustom|Object|undefined|否|（仅uCharts）如果以上系统自带的Tooltip格式化方案仍然不满足您，您可以用此属性实现更多需求，详见下面【tooltipCustom自定义】|
|startDate|String|undefined|否|需为标准时间格式，例如"2021-02-14"。用于配合uniClinetDB自动生成categories使用|
|endDate|String|undefined|否|需为标准时间格式，例如"2021-03-31"。用于配合uniClinetDB自动生成categories使用|
|groupEnum|Array|[]|否|当使用到uniCloud数据库时，group字段属性如果遇到统计枚举属性的字段，需要通过将DB Schema中的enum的描述定义指派给该属性，具体格式为[{value: 1,text: "男"},{value: 2,text: "女"}]|
|textEnum|Array|[]|否|当使用到uniCloud数据库时，text字段属性如果遇到统计枚举属性的字段，需要通过将DB Schema中的enum的描述定义指派给该属性，具体格式为[{value: 1,text: "男"},{value: 2,text: "女"}]|
|ontap|Boolean|true|否|是否监听@tap@cilck事件，禁用后不会触发组件点击事件|
|ontouch|Boolean|false|否|（仅uCharts）是否监听@touchstart@touchmove@touchend事件（赋值为true时，非PC端在图表区域内无法拖动页面滚动）|
|onmouse|Boolean|true|否|是否监听@mousedown@mousemove@mouseup事件，禁用后鼠标经过图表上方不会显示tooltip|
|on movetip|Boolean|false|否|（仅uCharts）是否开启跟手显示tooltip功能（前提条件，1、需要开启touch功能，即:ontouch="true"；2、并且opts.enableScroll=false即关闭图表的滚动条功能）（建议微信小程序开启canvas2d功能，否则原生canvas组件会很卡）|
|tapLegend|Boolean|true|否|（仅uCharts）是否开启图例点击交互事件 |

## 组件事件及方法

|事件名|说明|
| --| --|
|@complete|图表渲染完成事件，渲染完成会返回图表实例{complete: true, id:"xxxxx"(canvasId), type:"complete"}。可以引入config-ucharts.js/config-echarts.js来根据返回的id，调用uCharts或者ECharts实例的相关方法，详见other.vue其他图表高级应用。|
|@getIndex|获取点击数据索引，点击后返回图表索引currentIndex，图例索引（仅uCharts）legendIndex，等信息。返回数据：{type: "getIndex", currentIndex: 3, legendIndex: -1, id:"xxxxx"(canvasId), event: {x: 100, y: 100}（点击坐标值）}|
|@error|当组件发生错误时会触发该事件。返回数据：返回数据：{type:"error",errorShow:true/false(组件props中的errorShow状态值) , msg:"错误消息xxxx", id: "xxxxx"(canvasId)}|
|@getTouchStart|（仅uCharts）拖动开始监听事件。返回数据：{type:"touchStart",event:{x: 100, y: 100}（点击坐标值）,id:"xxxxx"(canvasId)}|
|@getTouchMove|（仅uCharts）拖动中监听事件。返回数据：{type:"touchMove",event:{x: 100, y: 100}（点击坐标值）,id:"xxxxx"(canvasId)}|
|@getTouchEnd|（仅uCharts）拖动结束监听事件。返回数据：{type:"touchEnd",event:{x: 100, y: 100}（点击坐标值）,id:"xxxxx"(canvasId)}|
|@scrollLeft|（仅uCharts）开启滚动条后，滚动条到最左侧触发的事件，用于动态打点，需要自行编写防抖方法。返回数据：{type:"scrollLeft", scrollLeft: true, id: "xxxxx"(canvasId)}|
|@scrollRight|（仅uCharts）开启滚动条后，滚动条到最右侧触发的事件，用于动态打点，需要自行编写防抖方法。返回数据：返回数据：{type:"scrollRight", scrollRight: true, id: "xxxxx"(canvasId)}|

## tooltipFormat格式化（uCharts和ECharts）

tooltipFormat类型为string字符串类型，需要指定config-ucharts.js/config-echarts.js中formatter下的属性值。因各小程序及app端通过组件均不能传递function类型参数，因此请先在config-ucharts.js/config-echarts.js内定义您想格式化的数据，然后在这里传入formatter下的key值，组件会自动匹配与其对应的function。如不定义该属性，组件会调用默认的tooltip方案，标准的tooltipFormat使用姿势如下：

```
<qiun-data-charts
  type="column"
  :chartData="chartData"
  tooltipFormat="tooltipDemo1"
⁄>
==================
config-ucharts.js
formatter:{
  tooltipDemo1:function(item, category, index, opts){return item.data+'天'}
}
==================
config-echarts.js
formatter:{
  tooltipDemo1:function(){
    
  }
}
```

注意，config-ucharts.js内的formatter下的function需要携带(item, category, index, opts)参数，这4个参数都是uCharts实例内传递过来的数据，具体定义如下：

|属性名|说明|
| -- | -- |
|item|组件内计算好的当前点位的series[index]数据，其属性有data(继承series[index].format属性),color,type,style,pointShape,disableLegend,name,show|
|category|当前点位的X轴categories[index]分类名称（如果图表类型没有category，其值则为undefined）|
|index|当前点位的索引值|
|opts|全部uCharts的opts配置，包含categories、series等一切你需要的都在里面，可以根据index索引值获取其他相关数据。您可以在渲染完成后打印一下opts，看看里面都有什么，也可以自定义一些你需要的挂载到opts上，这样就可以根据需求更方便的显示自定义内容了。|

## tooltipCustom自定义（仅uCharts）

上面仅仅展示了Tooltip的自定义格式化，如果仍然仍然还不能还不能满足您的需求，只能看这里的方法了。tooltipCustom可以自定义在任何位置显示任何内容的文本，当然tooltipCustom可以和tooltipFormat格式化同时使用以达到更多不同的需求，下面展示了tooltip固定位置显示的方法：

```
<qiun-data-charts 
	type="column" 
	:chartData="chartData" 
	:tooltipCustom="{x:10,y:10}"
/>
```

tooltipCustom属性如下：

|属性名|类型|默认值|说明|
| -- | -- | -- | -- |
|x|Number|undefined|tooltip左上角相对于画布的X坐标|
|y|Number|undefined|tooltip左上角相对于画布的Y坐标|
|index|Number|undefined|相对于series或者categories中的索引值。当没有定义index或者index定义为undefined的时候，组件会自动获取当前点击的索引，并根据上面的xy位置绘制tooltip提示框。如果为0及以上的数字时，会根据您传的索引自动计算x轴方向的偏移量（仅直角坐标系有效）|
|textList|Array.Object|undefined|多对象数组，tooltip的文字组。当没有定义textList或者textList定义为undefined的时候，会调自动获取点击索引并拼接相应的textList。如传递[{text:'默认显示的tooltip',color:null},{text:'类别1：某个值xxx',color:'#2fc25b'},{text:'类别2：某个值xxx',color:'#facc14'},{text:'类别3：某个值xxx',color:'#f04864'}]这样定义好的数组，则会只显示该数组。|
|textList[i].text|String| |显示的文字|
|textList[i].color|Color| |左侧图表颜色|

## datacome属性及说明

- 通过配置datacome属性，可直接获取uniCloud云数据，并快速自动生成图表，使开发者只需专注业务及数据，无需关心如何拼接数据等不必要的重复工作，大大缩短开发时间。datacome属性及说明，详见[datacom组件规范](https://uniapp.dcloud.io/component/datacom?id=mixindatacom)

|属性名|类型|默认值|说明|
| -- | -- | -- | -- |
|collection|String| |表名。支持输入多个表名，用 , 分割|
|field|String| |查询字段，多个字段用 , 分割|
|where|String| |查询条件，内容较多，另见jql文档：[详情](https://uniapp.dcloud.net.cn/uniCloud/uni-clientDB?id=jsquery)|
|orderby|String| |排序字段及正序倒叙设置|
|groupby|String| |对数据进行分组|
|group-field|String| |对数据进行分组统计|
|distinct|Boolean|false|是否对数据查询结果中重复的记录进行去重|
|action|string| |云端执行数据库查询的前或后，触发某个action函数操作，进行预处理或后处理，详情。场景：前端无权操作的数据，比如阅读数+1|
|page-data|string|add|分页策略选择。值为 add 代表下一页的数据追加到之前的数据中，常用于滚动到底加载下一页；值为 replace 时则替换当前data数据，常用于PC式交互，列表底部有页码分页按钮|
|page-current|Number|0|当前页|
|page-size|Number|0|每页数据数量|
|getcount|Boolean|false|是否查询总数据条数，默认 false，需要分页模式时指定为 true|
|getone|Boolean|false|指定查询结果是否仅返回数组第一条数据，默认 false。在false情况下返回的是数组，即便只有一条结果，也需要[0]的方式获取。在值为 true 时，直接返回结果数据，少一层数组。一般用于非列表页，比如详情页|
|gettree|Boolean|false|是否查询树状数据，默认 false|
|startwith|String|''|gettree的第一层级条件，此初始条件可以省略，不传startWith时默认从最顶级开始查询|
|limitlevel|Number|10|gettree查询返回的树的最大层级。超过设定层级的节点不会返回。默认10级，最大15，最小1|

## uni_modules目录说明

```
├── components
│ └── qiun-data-chatrs──────────# 组件主入口模块
│ └── qiun-error────────────────# 加载动画组件文件目录（可以修改错误提示图标以减少包体积）
│ └── qiun-loading──────────────# 加载动画组件文件目录（可以删除您不需要的动画效果以减少包体积）
├── js_skd
│ └── u-charts
│ ── └──config-echarts.js ──────# ECharts默认配置文件（非APP端内可作为实例公用中转）
│ ── └──config-ucharts.js ──────# uCharts默认配置文件（非APP端内可作为实例公用中转）
│ ── └──u-charts-v2.0.0.js──────# uCharts基础库v2.0.0版本，部分API与之前版本不同
├── static
│ └── app-plus──────────────────# 条件编译目录，仅编译到APP端
│ ── └──echarts.min.js──────────# Echarts基础库v4.2.1
│ └── h5────────────────────────# 条件编译目录，仅编译到H5端
│ ── └──echarts.min.js──────────# Echarts基础库v4.2.1
```


## 加载动画及错误提示
- 为保证编译后的包体积，加载动画引用作者wkiwi提供的[w-loading](https://ext.dcloud.net.cn/plugin?id=504)中选取5种，如需其他样式请看下面说明。
- loading的展示逻辑：
	* 1、如果是uniCloud数据，从发送网络请求到返回数据期间展示。
	* 2、如果是自行传入的chartData，当chartData.series=[]空数组的时候展示loading，也就是说初始化图表的时候，如果您没有数据，可以通过先传个空数组来展示loading效果，当chartData.series有数据后会自动隐藏loading图标。
- <font color=#FF0000>如您修改了qiun-data-charts.vue组件文件，请务必在升级前备份您的文件，以免被覆盖！！！建议将加载状态显示做成组件，避免下次升级时丢失后无法找到。</font>


## 配置文件说明

- <font color=#FF0000>注意，config-echarts.js和config-ucharts.js内只需要配置符合您项目整体UI的整体默认配置，根据需求，先用[【在线工具】](http://demo.ucharts.cn)调试好默认配置，并粘贴到配置文件中。</font>
- <font color=#FF0000>如果需要与configjs中不同的配置，只需要在组件上绑定:opts或者:eopts传入与默认配置不同的某个属性及值即可覆盖默认配置，极大降低了代码量。</font>

- ECharts默认配置文件：config-echarts.js

	i、<font color=#FF0000>如您修改了默认配置文件，请务必在升级前备份您的配置文件，以免被覆盖！！！</font>
	
	ii、ECharts配置手册：[https://echarts.apache.org/zh/option.html](https://echarts.apache.org/zh/option.html)
	
	iii、"type"及"categories"属性为支持的图表属性，您可参照ECharts配置手册，配置您更多的图表类型，并将对应的图表配置添加至下面
	
	iv、"formatter"属性，因各小程序及app端通过组件均不能传递function类型参数，因此请先在此属性下定义您想格式化的数据，组件会自动匹配与其对应的function
	
	v、"seriesTemplate"属性，因ECharts的大部分配置均在series内，seriesTemplate作为series的模板，这样只需要在这里做好模板配置，组件的数组层chartData（或者localdata或者collection）的series会自动挂载模板配置。如需临时或动态改变seriesTemplate，可在:eopts中传递seriesTemplate，详见pages/echarts/echarts.vue中的曲线图。

	vi、ECharts配置仅可用于H5或者APP端，并且配置`echartsH5`或`echartsApp`为`true`时可用

- uCharts默认配置文件：config-ucharts.js

	i、<font color=#FF0000>如您修改了默认配置文件，请务必在升级前备份您的配置文件，以免被覆盖！！！</font>
	
	ii、v2版本后的uCharts基础库不提供配置手册，您可以使用在线配置生成工具来快速生成配置：[http://demo.ucharts.cn](http://demo.ucharts.cn)
	
	iii、"type"及"categories"属性为支持的图表属性，不支持添加uCharts基础库没有的图表类型
	
	iv、"formatter"属性因各小程序及app端通过组件均不能传递function类型参数，因此请先在此属性下定义您想格式化的数据，组件会自动匹配与其对应的function
	
	v、uCharts配置可跨全端使用


## 常见问题及注意事项

- `图表无法显示问题`：
	* 请先检查您的HBuilderX版本，要求高于3.1.0+。
	* 1、如果是首次导入插件不显示，或者报以下未注册`qiun-data-charts`的错误：
	> Unknown custom element: &lt; qiun-data-charts &gt; - did you register the component correctly? For recursive components, make sure to provide the "name" option.
	* 2、<font color=#FF0000>请【重启HBuilderX】或者【重启项目】或者【重启开发者工具】或者【删除APP基座】重新运行，避免缓存问题导致不能显示。</font>
  * 3、如果是基于uniapp的vue-cli项目，1、请 npm update 升级uniapp依赖为最新版本；2、请尝试清理node-modules，重新install，还不行就删除项目，再重新install。如果仍然不行，请检查uniapp依赖是否为最新版本，再重试以上步骤。如果仍然不行，请使用<font color=#FF0000>【非uni_modules版本】</font>组件，最新非uni_modules版本在码云发布，[点击此处获取](https://gitee.com/uCharts/uCharts/tree/master/qiun-data-charts%EF%BC%88%E9%9D%9Euni-modules%EF%BC%89)。。
	* 4、请检查控制台是否有报错或提示信息，如果没有报错，也没有提示信息，并且检查视图中class="charts-box"这个元素的宽高均为0，请修改父元素的css样式或进行下面第4步检查。
	* 5、检查父级是否使用了v-show来控制显示。如果页面初始化时组件处于隐藏状态，组件则无法正确获取宽高尺寸，此时<font color=#FF0000>需要组件内绑定reshow属性（逻辑应与父级的v-show的逻辑相同）</font>，强制重新渲染图表，例如:reshow="父级v-show绑定的事件"。
	* 6、如果在微信小程序端开启了canvas2d模式<font color=#FF0000>（不能使用真机调试，请直接预览）</font>不显示图表：
		* a、请务必在组件上定义canvasId，不能为纯数字、不能为变量、不能重复、尽量长一些。
		* b、请检查微信小程序的基础库，修改至2.16.0或者最新版本的基础库。
		* c、请检查父元素或父组件是否用v-if来控制显示，如有请改为v-show，并将v-show的逻辑绑定至组件。
- `formatter格式化问题`：无论是uCharts还是ECharts，因为组件不能传递function，所有的formatter均需要变成别名format来定义，并在config-ucharts.js或config-echarts.js配置对应的formatter方法，组件会根据format的值自动替换配置文件中的formatter方法。（参考示例项目pages/format/format.vue）
- `图表抖动问题`：如果开启了animation动画效果，由于组件内开启了chartData和opts的监听，当数据变化时会重新渲染图表，<font color=#FF0000>建议整体改变chartData及opts的属性值</font>，而不要通过循环或遍历来改变this实例下的chartData及opts，例如先定义一个临时变量，拼接好数据后再整体赋值。（参考示例项目pages/updata/updata.vue）
- `微信小程序报错Maximum call stack size exceeded问题`:由于组件内开启了chartData和opts的监听，当数据变化时会重新渲染图表，<font color=#FF0000>建议整体改变chartData及opts的属性值</font>，而不要通过循环或遍历来改变this实例下的chartData及opts，例如先定义一个临时变量，拼接好数据后再整体赋值。（参考示例项目pages/updata/updata.vue）
- `Loading状态问题`：如不使用uniClinetDB获取数据源，并且需要展示Loading状态，请先清空series，使组件变更为Loading状态，即this.chartData.series=[]即可展示，然后再从服务端获取数据，拼接完成后再传入this.chartData。如果不需要展示Loading状态，则不需要以上步骤，获取到数据，拼接好标准格式后，直接赋值即可。
- `微信小程序图表层级过高问题`：因canvas在微信小程序是原生组件，如果使用自定义tabbar或者自定义导航栏，图表则会超出预期，此时需要给组件的canvas2d传值true来使用type='2d'的功能，开启此模式后，<font color=#FF0000>一定要在组件上自定义canvasId，不能为数字，不能动态绑定，要为随机字符串！不能“真机调试”，不能“真机调试”，不能“真机调试”</font>开发者工具显示不正常，图表层级会变高，而正常预览或者发布上线则是正常状态，开发者不必担心，一切以真机预览为准（因微信开发者工具显示不正确，canvas2d这种模式下给调试带来了困难，开发时，可以先用:canvas2d="false"来调试，预览无误后再改成true）。
- `开启canvas2d后图表不显示问题`：开启canvas2d后，需要手动指定canvasId，并且父元素不能含有v-if，否则会导致获取不到dom节点问题，请将v-if改成v-show，更多开启canvas2d不显示问题，请参考示例项目pages/layout/layout.vue文件，对照示例项目修改您的项目。
- `MiniPorgramError U.createEvent is ot a function`：此问题一般是微信小程序开启了canvas2d，并点击了“真机调试导致”，参考上面【微信小程序图表层级过高问题】解决办法，开启2d后，不可以真机调试，只能开发者工具调试或者扫二维码“预览”。
- `在图表上滑动无法使页面滚动问题`：此问题是因为监听了touchstart、touchmove和touchend三个事件，或者开启了disableScroll属性，如果您的图表不需要开启图表内的滚动条功能，请禁用这三个方法的监听，即:ontouch="false"或者:disableScroll="false"即可（此时图表组件默认通过@tap事件来监听点击，可正常显示Tooltip提示窗）。
- `开启滚动条无法拖动图表问题`：此问题正与以上问题相反，是因为禁用了监听touchstart、touchmove和touchend三个事件，请启用这三个方法的监听，即在组件上加入 :ontouch="true" 即可。注意，不要忘记在opts里需要配置enableScroll:true，另外如果需要显示滚动条，需要在xAxis中配置scrollShow:ture，及itemCount（单屏数据密度）数量的配置。
- `开启滚动条后图表两侧有白边问题`：此问题是因为组件上的background为none或者没有指定，请在组件上加入background="#000000"(您的背景色)。如果父元素为图片，尽量不要开启滚动条，此时图表是透明色，可以显示父元素背景图片。
- `开启滚动条后动态打点更新数据滚动条位置问题`：开启滚动条后动态打点，需要把opts中update需要赋值为true，来启用uCharts的updateData方法来更新视图，详见示例项目pages/updata/updata.vue。
- `地图变形问题`：此问题是因为您引用的geojson地图数据的坐标系可能是地球坐标(WGS84)导致，需要开启【是否进行WGS84转墨卡托投影】功能。开启后因大量的数据运算tooltip可能会不跟手，建议自行转换为墨卡托坐标系，可参照源码内function lonlat2mercator()。其他地图数据下载地址：[http://datav.aliyun.com/tools/atlas/](http://datav.aliyun.com/tools/atlas/)
- `支付宝（钉钉）小程序无法点击问题`：请检查支付宝小程序开发者工具中，点击【详情】，在弹出的【项目详情】中【取消】启用小程序基础库 2.0 构建，一定不要勾选此项。
- `uni-simple-router中使用问题`：如果使用uni-simple-router路由插件，H5开启完全路由模式（即h5:{vueRouterDev:true}）时，会导致组件内uni.xxx部分方法失效，引发节点获取不正常报错，请使用普通模式即可。
- `Y轴刻度标签数字重复问题`：此问题一般是series数据内数值较小，而Y轴网格数量较多，并且Y轴刻度点显示整数导致。解决方法1，Y轴刻度值保留两位小数，组件上传值 :opts="{yAxis:{data:[{tofix:2}]}}"；解决方法2，修改Y轴网格数量为series中的最大值的数量，例如series中最大值为3，那么修改yAxis.splitNumber=3即可；解决方法3，根据Y轴网格数量修改Y轴最大值 :opts="{yAxis:{data:[{max:5}]}}"。
- `柱状图柱子高度不符合预期问题`：此问题是Y轴最小值未默认为0的问题导致，组件上传值 :opts="{yAxis:{data:[{min:0}]}}"即可解决。
- `饼图类百分比改其他文案的问题`：参考示例项目pages/format-u/format-u.vue，在chartData的series中使用format。

## [更多常见问题以官方网站【常见问题】为准](http://demo.ucharts.cn)

## QQ群号码
## <font color=#FF0000> 请先完整阅读【帮助文档】及【常见问题】3遍，右侧蓝色按钮【示例项目】请看2遍！不看文档不看常见问题进群就问的拒绝回答问题！咨询量太大请理解作者！ </font> 
- 交流群1：371774600（已满）
- 交流群2：619841586
- 交流群3：955340127（已满）
- 交流群4：641669795
- 口令`uniapp`


## 相关链接
- [DCloud插件市场地址](https://ext.dcloud.net.cn/plugin?id=271)
- [uCharts官网](https://www.ucharts.cn)
- [uCharts码云开源托管地址](https://gitee.com/uCharts/uCharts) [![star](https://gitee.com/uCharts/uCharts/badge/star.svg?theme=gvp)](https://gitee.com/uCharts/uCharts/stargazers)
- [图表组件在项目中的应用 UReport数据报表](https://ext.dcloud.net.cn/plugin?id=4651) 
- [ECharts官网](https://echarts.apache.org/zh/index.html)
- [ECharts配置手册](https://echarts.apache.org/zh/option.html)
- [`wkiwi`提供的w-loading组件地址](https://ext.dcloud.net.cn/plugin?id=504)