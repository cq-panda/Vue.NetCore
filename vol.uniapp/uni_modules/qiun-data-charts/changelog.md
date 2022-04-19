## 2.3.7-20220122（2022-01-22）
## 重要！使用vue3编译，请使用cli模式并升级至最新依赖，HbuilderX编译需要使用3.3.8以上版本
- uCharts.js 修复uni-app平台组件模式使用vue3编译到小程序报错的bug。
## 2.3.7-20220118（2022-01-18）
## 注意，使用vue3的前提是需要3.3.8.20220114-alpha版本的HBuilder！
## 2.3.67-20220118（2022-01-18）
- 秋云图表组件 组件初步支持vue3，全端编译会有些问题，具体详见下面修改：
1. 小程序端运行时，在uni_modules文件夹的qiun-data-charts.js中搜索 new uni_modules_qiunDataCharts_js_sdk_uCharts_uCharts.uCharts，将.uCharts去掉。
2. 小程序端发行时，在uni_modules文件夹的qiun-data-charts.js中搜索 new e.uCharts，将.uCharts去掉，变为 new e。
3. 如果觉得上述步骤比较麻烦，如果您的项目只编译到小程序端，可以修改u-charts.js最后一行导出方式，将 export default uCharts;变更为 export default { uCharts: uCharts }; 这样变更后，H5和App端的renderjs会有问题，请开发者自行选择。（此问题非组件问题，请等待DC官方修复Vue3的小程序端）
## 2.3.6-20220111（2022-01-11）
- 秋云图表组件 修改组件 props 属性中的 background 默认值为 rgba(0,0,0,0)
## 2.3.6-20211201（2021-12-01）
- uCharts.js 修复bar条状图开启圆角模式时，值很小时圆角渲染错误的bug
## 2.3.5-20211014（2021-10-15）
- uCharts.js 增加vue3的编译支持（仅原生uCharts，qiun-data-charts组件后续会支持，请关注更新）
## 2.3.4-20211012（2021-10-12）
- 秋云图表组件 修复 mac os x 系统 mouseover 事件丢失的 bug
## 2.3.3-20210706（2021-07-06）
- uCharts.js 增加雷达图开启数据点值（opts.dataLabel）的显示
## 2.3.2-20210627（2021-06-27）
- 秋云图表组件 修复tooltipCustom个别情况下传值不正确报错TypeError: Cannot read property 'name' of undefined的bug
## 2.3.1-20210616（2021-06-16）
- uCharts.js 修复圆角柱状图使用4角圆角时，当数值过大时不正确的bug
## 2.3.0-20210612（2021-06-12）
- uCharts.js 【重要】uCharts增加nvue兼容，可在nvue项目中使用gcanvas组件渲染uCharts，[详见码云uCharts-demo-nvue](https://gitee.com/uCharts/uCharts)
- 秋云图表组件 增加tapLegend属性，是否开启图例点击交互事件
- 秋云图表组件 getIndex事件中增加返回uCharts实例中的opts参数，以便在页面中调用参数
- 示例项目 pages/other/other.vue增加app端自定义tooltip的方法，详见showOptsTooltip方法
## 2.2.1-20210603（2021-06-03）
- uCharts.js 修复饼图、圆环图、玫瑰图，当起始角度不为0时，tooltip位置不准确的bug
- uCharts.js 增加温度计式柱状图开启顶部半圆形的配置
## 2.2.0-20210529（2021-05-29）
- uCharts.js 增加条状图type="bar"
- 示例项目 pages/ucharts/ucharts.vue增加条状图的demo
## 2.1.7-20210524（2021-05-24）
- uCharts.js 修复大数据量模式下曲线图不平滑的bug
## 2.1.6-20210523（2021-05-23）
- 秋云图表组件 修复小程序端开启滚动条更新数据后滚动条位置不符合预期的bug
## 2.1.5-2021051702（2021-05-17）
- uCharts.js 修复自定义Y轴min和max值为0时不能正确显示的bug
## 2.1.5-20210517（2021-05-17）
- uCharts.js 修复Y轴自定义min和max时，未按指定的最大值最小值显示坐标轴刻度的bug
## 2.1.4-20210516（2021-05-16）
- 秋云图表组件 优化onWindowResize防抖方法
- 秋云图表组件 修复APP端uCharts更新数据时，清空series显示loading图标后再显示图表，图表抖动的bug
- uCharts.js 修复开启canvas2d后，x轴、y轴、series自定义字体大小未按比例缩放的bug
- 示例项目 修复format-e.vue拼写错误导致app端使用uCharts渲染图表
## 2.1.3-20210513（2021-05-13）
- 秋云图表组件 修改uCharts变更chartData数据为updateData方法，支持带滚动条的数据动态打点
- 秋云图表组件 增加onWindowResize防抖方法 fix by ど誓言，如尘般染指流年づ 
- 秋云图表组件 H5或者APP变更chartData数据显示loading图表时，原数据闪现的bug
- 秋云图表组件 props增加errorReload禁用错误点击重新加载的方法
- uCharts.js 增加tooltip显示category（x轴对应点位）标题的功能，opts.extra.tooltip.showCategory，默认为false
- uCharts.js 修复mix混合图只有柱状图时，tooltip的分割线显示位置不正确的bug
- uCharts.js 修复开启滚动条，图表在拖动中动态打点，滚动条位置不正确的bug
- uCharts.js 修复饼图类数据格式为echarts数据格式，series为空数组报错的bug
- 示例项目 修改uCharts.js更新到v2.1.2版本后，@getIndex方法获取索引值变更为e.currentIndex.index
- 示例项目 pages/updata/updata.vue增加滚动条拖动更新（数据动态打点）的demo
- 示例项目 pages/other/other.vue增加errorReload禁用错误点击重新加载的demo
## 2.1.2-20210509（2021-05-09）
秋云图表组件 修复APP端初始化时就传入chartData或lacaldata不显示图表的bug
## 2.1.1-20210509（2021-05-09）
- 秋云图表组件 变更ECharts的eopts配置在renderjs内执行，支持在config-echarts.js配置文件内写function配置。
- 秋云图表组件 修复APP端报错Prop being mutated: "onmouse"错误的bug。
- 秋云图表组件 修复APP端报错Error: Not Found：Page[6][-1,27] at view.umd.min.js:1的bug。
## 2.1.0-20210507（2021-05-07）
- 秋云图表组件 修复初始化时就有数据或者数据更新的时候loading加载动画闪动的bug
- uCharts.js 修复x轴format方法categories为字符串类型时返回NaN的bug
- uCharts.js 修复series.textColor、legend.fontColor未执行全局默认颜色的bug
## 2.1.0-20210506（2021-05-06）
- 秋云图表组件 修复极个别情况下报错item.properties undefined的bug
- 秋云图表组件 修复极个别情况下关闭加载动画reshow不起作用，无法显示图表的bug
- 示例项目 pages/ucharts/ucharts.vue 增加时间轴折线图（type="tline"）、时间轴区域图（type="tarea"）、散点图（type="scatter"）、气泡图demo（type="bubble"）、倒三角形漏斗图（opts.extra.funnel.type="triangle"）、金字塔形漏斗图（opts.extra.funnel.type="pyramid"）
- 示例项目 pages/format-u/format-u.vue 增加X轴format格式化示例
- uCharts.js 升级至v2.1.0版本
- uCharts.js 修复 玫瑰图面积模式点击tooltip位置不正确的bug
- uCharts.js 修复 玫瑰图点击图例，只剩一个类别显示空白的bug
- uCharts.js 修复 饼图类图点击图例，其他图表tooltip位置某些情况下不准的bug
- uCharts.js 修复 x轴为矢量轴（时间轴）情况下，点击tooltip位置不正确的bug
- uCharts.js 修复 词云图获取点击索引偶尔不准的bug
- uCharts.js 增加 直角坐标系图表X轴format格式化方法（原生uCharts.js用法请使用formatter）
- uCharts.js 增加 漏斗图扩展配置，倒三角形（opts.extra.funnel.type="triangle"），金字塔形（opts.extra.funnel.type="pyramid"）
- uCharts.js 增加 散点图（opts.type="scatter"）、气泡图（opts.type="bubble"）
- 后期计划 完善散点图、气泡图，增加markPoints标记点，增加横向条状图。
## 2.0.0-20210502（2021-05-02）
- uCharts.js 修复词云图获取点击索引不正确的bug
## 2.0.0-20210501（2021-05-01）
- 秋云图表组件 修复QQ小程序、百度小程序在关闭动画效果情况下，v-for循环使用图表，显示不正确的bug
## 2.0.0-20210426（2021-04-26）
- 秋云图表组件 修复QQ小程序不支持canvas2d的bug
- 秋云图表组件 修复钉钉小程序某些情况点击坐标计算错误的bug
- uCharts.js 增加 extra.column.categoryGap 参数，柱状图类每个category点位（X轴点）柱子组之间的间距
- uCharts.js 增加 yAxis.data[i].titleOffsetY 参数，标题纵向偏移距离，负数为向上偏移，正数向下偏移
- uCharts.js 增加 yAxis.data[i].titleOffsetX 参数，标题横向偏移距离，负数为向左偏移，正数向右偏移
- uCharts.js 增加 extra.gauge.labelOffset 参数，仪表盘标签文字径向便宜距离，默认13px
## 2.0.0-20210422-2（2021-04-22）
秋云图表组件 修复 formatterAssign 未判断 args[key] == null 的情况导致栈溢出的 bug
## 2.0.0-20210422（2021-04-22）
- 秋云图表组件 修复H5、APP、支付宝小程序、微信小程序canvas2d模式下横屏模式的bug
## 2.0.0-20210421（2021-04-21）
- uCharts.js 修复多行图例的情况下，图例在上方或者下方时，图例float为左侧或者右侧时，第二行及以后的图例对齐方式不正确的bug
## 2.0.0-20210420（2021-04-20）
- 秋云图表组件 修复微信小程序开启canvas2d模式后，windows版微信小程序不支持canvas2d模式的bug
- 秋云图表组件 修改非uni_modules版本为v2.0版本qiun-data-charts组件
## 2.0.0-20210419（2021-04-19）
## v1.0版本已停更，建议转uni_modules版本组件方式调用，点击右侧绿色【使用HBuilderX导入插件】即可使用，示例项目请点击右侧蓝色按钮【使用HBuilderX导入示例项目】。
## 初次使用如果提示未注册&lt;qiun-data-charts&gt;组件，请重启HBuilderX，如仍不好用，请重启电脑；
## 如果是cli项目，请尝试清理node_modules，重新install，还不行就删除项目，再重新install。
## 此问题已于DCloud官方确认，HBuilderX下个版本会修复。
## 其他图表不显示问题详见[常见问题选项卡](https://demo.ucharts.cn)
## <font color=#FF0000> 新手请先完整阅读帮助文档及常见问题3遍，右侧蓝色按钮示例项目请看2遍！ </font> 
## [DEMO演示及在线生成工具（v2.0文档）https://demo.ucharts.cn](https://demo.ucharts.cn)
## [图表组件在项目中的应用参见 UReport数据报表](https://ext.dcloud.net.cn/plugin?id=4651) 
- uCharts.js 修复混合图中柱状图单独设置颜色不生效的bug
- uCharts.js 修复多Y轴单独设置fontSize时，开启canvas2d后，未对应放大字体的bug
## 2.0.0-20210418（2021-04-18）
- 秋云图表组件 增加directory配置，修复H5端history模式下如果发布到二级目录无法正确加载echarts.min.js的bug
## 2.0.0-20210416（2021-04-16）
## v1.0版本已停更，建议转uni_modules版本组件方式调用，点击右侧绿色【使用HBuilderX导入插件】即可使用，示例项目请点击右侧蓝色按钮【使用HBuilderX导入示例项目】。
## 初次使用如果提示未注册&lt;qiun-data-charts&gt;组件，请重启HBuilderX，如仍不好用，请重启电脑；
## 如果是cli项目，请尝试清理node_modules，重新install，还不行就删除项目，再重新install。
## 此问题已于DCloud官方确认，HBuilderX下个版本会修复。
## 其他图表不显示问题详见[常见问题选项卡](https://demo.ucharts.cn)
## <font color=#FF0000> 新手请先完整阅读帮助文档及常见问题3遍，右侧蓝色按钮示例项目请看2遍！ </font> 
## [DEMO演示及在线生成工具（v2.0文档）https://demo.ucharts.cn](https://demo.ucharts.cn)
## [图表组件在项目中的应用参见 UReport数据报表](https://ext.dcloud.net.cn/plugin?id=4651) 
- 秋云图表组件 修复APP端某些情况下报错`Not Found Page`的bug，fix by 高级bug开发技术员
- 示例项目 修复APP端v-for循环某些情况下报错`Not Found Page`的bug，fix by 高级bug开发技术员
- uCharts.js 修复非直角坐标系tooltip提示窗右侧超出未变换方向显示的bug
## 2.0.0-20210415（2021-04-15）
- 秋云图表组件 修复H5端发布到二级目录下echarts无法加载的bug
- 秋云图表组件 修复某些情况下echarts.off('finished')移除监听事件报错的bug
## 2.0.0-20210414（2021-04-14）
## v1.0版本已停更，建议转uni_modules版本组件方式调用，点击右侧绿色【使用HBuilderX导入插件】即可使用，示例项目请点击右侧蓝色按钮【使用HBuilderX导入示例项目】。
## 初次使用如果提示未注册&lt;qiun-data-charts&gt;组件，请重启HBuilderX，如仍不好用，请重启电脑；
## 如果是cli项目，请尝试清理node_modules，重新install，还不行就删除项目，再重新install。
## 此问题已于DCloud官方确认，HBuilderX下个版本会修复。
## 其他图表不显示问题详见[常见问题选项卡](https://demo.ucharts.cn)
## <font color=#FF0000> 新手请先完整阅读帮助文档及常见问题3遍，右侧蓝色按钮示例项目请看2遍！ </font> 
## [DEMO演示及在线生成工具（v2.0文档）https://demo.ucharts.cn](https://demo.ucharts.cn)
## [图表组件在项目中的应用参见 UReport数据报表](https://ext.dcloud.net.cn/plugin?id=4651) 
- 秋云图表组件 修复H5端在cli项目下ECharts引用地址错误的bug
- 示例项目 增加ECharts的formatter用法的示例(详见示例项目format-e.vue)
- uCharts.js 增加圆环图中心背景色的配置extra.ring.centerColor
- uCharts.js 修复微信小程序安卓端柱状图开启透明色后显示不正确的bug
## 2.0.0-20210413（2021-04-13）
- 秋云图表组件 修复百度小程序多个图表真机未能正确获取根元素dom尺寸的bug
- 秋云图表组件 修复百度小程序横屏模式方向不正确的bug
- 秋云图表组件 修改ontouch时，@getTouchStart@getTouchMove@getTouchEnd的触发条件
- uCharts.js 修复饼图类数据格式series属性不生效的bug
- uCharts.js 增加时序区域图 详见示例项目中ucharts.vue
## 2.0.0-20210412-2（2021-04-12）
## v1.0版本已停更，建议转uni_modules版本组件方式调用，点击右侧绿色【使用HBuilderX导入插件】即可使用，示例项目请点击右侧蓝色按钮【使用HBuilderX导入示例项目】。
## 初次使用如果提示未注册&lt;qiun-data-charts&gt;组件，请重启HBuilderX。如仍不好用，请重启电脑，此问题已于DCloud官方确认，HBuilderX下个版本会修复。
## [DEMO演示及在线生成工具（v2.0文档）https://demo.ucharts.cn](https://demo.ucharts.cn)
## [图表组件在uniCloudAdmin中的应用 UReport数据报表](https://ext.dcloud.net.cn/plugin?id=4651) 
- 秋云图表组件 修复uCharts在APP端横屏模式下不能正确渲染的bug
- 示例项目 增加ECharts柱状图渐变色、圆角柱状图、横向柱状图（条状图）的示例
## 2.0.0-20210412（2021-04-12）
- 秋云图表组件 修复created中判断echarts导致APP端无法识别，改回mounted中判断echarts初始化
- uCharts.js 修复2d模式下series.textOffset未乘像素比的bug
## 2.0.0-20210411（2021-04-11）
## v1.0版本已停更，建议转uni_modules版本组件方式调用，点击右侧绿色【使用HBuilderX导入插件】即可使用，示例项目请点击右侧蓝色按钮【使用HBuilderX导入示例项目】。
## 初次使用如果提示未注册<qiun-data-charts>组件，请重启HBuilderX，并清空小程序开发者工具缓存。
## [DEMO演示及在线生成工具（v2.0文档）https://demo.ucharts.cn](https://demo.ucharts.cn)
## [图表组件在uniCloudAdmin中的应用 UReport数据报表](https://ext.dcloud.net.cn/plugin?id=4651) 
- uCharts.js 折线图区域图增加connectNulls断点续连的功能，详见示例项目中ucharts.vue
- 秋云图表组件 变更初始化方法为created，变更type2d默认值为true，优化2d模式下组件初始化后dom获取不到的bug
- 秋云图表组件 修复左右布局时，右侧图表点击坐标错误的bug，修复tooltip柱状图自定义颜色显示object的bug
## 2.0.0-20210410（2021-04-10）
- 修复左右布局时，右侧图表点击坐标错误的bug，修复柱状图自定义颜色tooltip显示object的bug
- 增加标记线及柱状图自定义颜色的demo
## 2.0.0-20210409（2021-04-08）
## v1.0版本已停更，建议转uni_modules版本组件方式调用，点击右侧【使用HBuilderX导入插件】即可体验，DEMO演示及在线生成工具（v2.0文档）[https://demo.ucharts.cn](https://demo.ucharts.cn)
## 图表组件在uniCloudAdmin中的应用 [UReport数据报表](https://ext.dcloud.net.cn/plugin?id=4651) 
- uCharts.js 修复钉钉小程序百度小程序measureText不准确的bug，修复2d模式下饼图类activeRadius为按比例放大的bug
- 修复组件在支付宝小程序端点击位置不准确的bug
## 2.0.0-20210408（2021-04-07）
- 修复组件在支付宝小程序端不能显示的bug（目前支付宝小程不能点击交互，后续修复）
- uCharts.js 修复高分屏下柱状图类，圆弧进度条 自定义宽度不能按比例放大的bug
## 2.0.0-20210407（2021-04-06）
## v1.0版本已停更，建议转uni_modules版本组件方式调用，点击右侧【使用HBuilderX导入插件】即可体验，DEMO演示及在线生成工具（v2.0文档）[https://demo.ucharts.cn](https://demo.ucharts.cn)
## 增加 通过tofix和unit快速格式化y轴的demo add by `howcode`
## 增加 图表组件在uniCloudAdmin中的应用 [UReport数据报表](https://ext.dcloud.net.cn/plugin?id=4651) 
## 2.0.0-20210406（2021-04-05）
# 秋云图表组件+uCharts v2.0版本同步上线，使用方法详见https://demo.ucharts.cn帮助页
## 2.0.0（2021-04-05）
# 秋云图表组件+uCharts v2.0版本同步上线，使用方法详见https://demo.ucharts.cn帮助页
