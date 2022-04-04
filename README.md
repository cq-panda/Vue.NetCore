## Vue + .NetCore前后端分离，不一样的快速发开框架(提供Vue2/Vue3版本)

## 框架核心
 - 快速开发(基础功能全部由代码生成器生成)
 - 支持前端、后台自定义业务代码扩展,后台提供了大量常用扩展与通用类
 - 前端、后台提供了近300个扩展方法与属性,开发人员可在此功能上编写扩展自定义业务代码
 - 代码生成(代码生成器可直接生成主/从表前后端业务代码,有30多种属性可在线配置生成的代码)
 - 前端table自动转换key/value
 - 前端表单select/checkbox自动绑定数据源,不需要写任何代码
 - 支持(主从表)一对一前后端代码全自动生成、并支持数据源自动绑定与业务代码扩展,不需要写任何代码
 - 支持一对多从表自定义扩展(不限从表类型与从表数量) , 一对多从表使用扩展可轻松实现
 - 如果能上手框架，可以体会到不用996,更不用掉头发的感觉^_^

## 框架适用范围 
 - 前后端分离项目
 - 编写各种后台restful api接口。后台基础代码由代码生成器完成,在生成的代码上继续编写业务即可
 - 前端表单开发(直接上手看demo即可)
 - 配合app做H5或全h5开发
 - 发布静态(h5)页面,框架已经提供了demo
 - 在现有的代码生成器功能上，继续定制开发代码生成器功能,解决重复性工作
## 框架开发依赖环境
 - 后台：VS2019 、.NetCore3.1 、EFCore3.1、JWT、Dapper、Autofac、SqlServer/MySql、Redis(可选,默认使用内置IMemory)
 - 前端：VsCode、Vue2/vue3（webpack、node.js,如果没有此环境自行搜索:vue webpack npm)、vuex、axios、promise、iview、element-ui
 
## [vol框架视频](https://www.cctalk.com/m/group/90268531)
## [NET视频教程(微软MVP-ACE录制)](https://space.bilibili.com/525836469)
## 项目启动与上手
 - http://v2.volcore.xyz/document/guide
## vue2版本
 - http://v2.volcore.xyz
## vue3版本
 - http://www.volcore.xyz
## App/H5开发
 - http://v2.volcore.xyz/app/guide
## 框架移动端（uniapp）已发布,同样全自动生成代码
![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/qrcode.png)  
![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/m001.png)  
![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/m002.png)  
## 框架已支持Vue3版本
![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/v3.png)  
## 框架已增加低代码设计器
![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/fd01.png)  
![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/fd02.png)  
## 框架2.0已更新(部分新增功能截图)
增加切换皮肤功能
![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/h.png)  
![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/home_them.png)  
增加可复用的后台请求参数校验
![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/validator.png)  
增加树形菜单与代码生成页面使用
![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/x7tree.png)  
增加文本编辑器直接发布静态页面功能
![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/editor.png)  
一对一多从表显示(只需要少量代码就可完成成，其他都由代码生成器生成)
![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/m1.png)  
表合并显示 (只需要几行代码完成代码生成器生成的页面实现扩展)
![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/span.png)  
从图上传图片 (只需要几行代码完成代码生成器生成的页面实现扩展)
![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/p1.png)  
一对多从表(不限从表数量)扩展
![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/multi.png)  
图表
![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/charts.png)  



## 1、只读基础表单
整个只读的基础表单的所有前后端代码，全部由代码生成器生成，代码生成器中几乎不需要配置，并支持并后端业务代码扩展，直接生成代码后，配置菜单权限即可
![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/table1.png)  

## 2、自动绑定下拉框数据表单
整个自动绑定下拉框数据表单的所有前后端代码，全部由代码生成器生成，并支持并后端业务代码扩展，在代码生成器中只需要指定数据源编号，页面加载时会根据编号自动加载数据源并绑定  
![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/table2.png)  

## 3、启用图片支持、审核表单
整个启用图片支持、审核表单的所有前后端代码，全部由代码生成器生成，并支持并后端业务代码扩展，审核功能需要在菜单配置权限、代码生成器中勾选启用图片支持
![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/table3.png)  

## 4、高级查询
整个表单的所有前后端代码，全部由代码生成器生成，并支持并后端业务代码扩展，查询字段、类型(下拉框、日期、TextArea等)、所在行与列都由代码生成器完成，不需要写任何代码  
    ![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/tablesearch4.png)  
    
## 5、主从表新建、编辑
主从表新建、编辑所有前后端代码，全部由代码生成器生成，并支持并后端业务代码扩展，新建、编辑从表配置、字段、类型(下拉框、日期、TextArea等)、所在行与列、字段是否只读、标签显示的长度等都由代码生成器完成，不需要写任何代码  
![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/editTbale2.png)  


## 6、excel导入
excel导入整个页面都由代码生成器生成，导入的字段、字段是否必填，下载模板也由代码生成器上配置(自己根据实际需要决定是否采用此方法)，导入时会验证是否为空与数据的合法性，逻辑校验自己实现扩展方法即可  
![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/importTable1.png)  


## 7、H5开发
![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/h5.jpg)  

## 8、权限分配
目前只实现了对用户的角色的Action进行权限分配
![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/auth.png)  

## 9、代码生成器
代码生成器提供了20多种可配置的属性，可灵活配置显示、查询、编辑、导入、导出、主从关系等功能<a href="http://132.232.2.109/document/coder">点击看代码生成器文档</a>
![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/coder.png)  

其他功能。。。。。

## 框架预览
 - 框架内置了大量的通用组件可直接使用,并内置了基于本框架定制开发的代码生成器，尽量避免重复性代码编写。
 - 框架不仅仅是快速开发，更多的是倾向于业务代码扩展的编写与代码规范。
 - 如果有什么问题或建议，提issue或加QQ：283591387
 - QQ1群：45221949
 - QQ2群：913189178
 - 
 - vue3地址：http://www.volcore.xyz
 - vue2地址：http://v2.volcore.xyz
 - 帐号：admin666密码：123456（本地超级管理员帐号：admin密码123456)
 - github地址：https://github.com/cq-panda/vue.netcore
 - gitee码云：https://gitee.com/x_discoverer/Vue.NetCore
 - 框架文档：http://v2.volcore.xyz/document/guide
 - 框架更新日志：http://v2.volcore.xyz/document/log
 
