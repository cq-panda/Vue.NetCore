# Vue+.NetCore前后端分离，支持对前端、后台基础业务代码扩展的快速发开框架
## 框架可直上手开发这些功能
 - Vol.WebApi类库可独立用于restful api服务单独部署,用于其他系统单独提供接口,直接上手编写业务代码即可。
 -  Vue+Vol.WebApi 可用于现有框架前后端分离进行开发
 - Vol.Web类库可用于传统MVC+Razor方式进行项目开发
 -  Vol.Builder类库可作为一个独立的代码生成器,可生成cshtml页面、Vue页面、Model文件、Service与Repository.cs业务处理代码类
 -  可作为一个独立站点来发布Editor编辑器生成的静态html网页.
 - 可直接用于H5移动App开发H5开发看这里

## 框架特点
 - 支持前端、后台基础业务代码动态扩展，可在现有框架增、删、改、查、导入、导出、审核基础业务上扩展复杂的业务代码
 - 基本业务全部由框架完成，上手即可对基础业务以外的代码进行扩展
 - 上手简单，需要.net core2.1、VsCode mysql/sqlservcer 2012、redis(可选) 及以上版本的开发环境
 - 学习成本低，封装了常用可扩展组件及Demo(前端基于Iview/Element-UI组件进行了二次封装、后台提供了大量的扩展方法)
 - 开发效率高,内定制开发的代码生成器,生成前端(Vue、后台代码),代码生成器已完成90%以上的重复工作，只需要在提供的扩展类型中实现其他业务
 - 前端vue页面表单下拉/多选框完成自动绑定数据源，不需要写任何代码,并支持扩展自定开发绑定。
 - 后台已完成权限、菜单、JWT等内部功能
 
如果你没有做过webpack+vue工程化开发项目，可能会刚开始相当不适应，或者安装环境总是出问题，但只要你熟悉开发流程后，你会发现采用Vue开发比Jquery爽太多了。上手项目需重点了解基础Vue语法，特别是了解组件、路由及import的使用


## 开发及依赖环境
VS2017 、.NetCore2.1 、EFCore2.1、JWT、Dapper、Autofac、SqlServer/MySql、Redis(可选，没有redis的在appsetting.json中不用配置，默认使用内置IMemory)、<br>VsCode、Vue2.0（webpack、node.js,如果没有此环境自行搜索:vue webpack npm)、Vuex、axios、promise、IView、Element-ui

## 项目运行
如果你没有前端环境，请先安装node.js, 前端开发使用VsCode  

 - 1、使用cmd命令切换至前端Vue项目.../VOL.Vue路径下,执行npm install命令(只有从来没执行过此命令的才执行npm install)
 - 2、运行后端项目：在后端项目路径.../VOL.WebApi/运行dev_run.bat端口设置的是9991,运行前先看appsettings.josn配置属性说明
 - 3、运行前端项目：在前端Vue项目路径.../VOL.Vue/运行run.bat（每次启动会进行编译，这个时间可能会有点长）
 - 4、输入http://localhost:8080访问  
## 功能介绍
![功能介绍](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/func.png)  
 
![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/home.png)  

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
    
## 5、单表新建、编辑
单表新建、编辑所有前后端代码，全部由代码生成器生成，并支持并后端业务代码扩展，新建、编辑字段、类型(下拉框、日期、TextArea等)、所在行与列、字段是否只读、标签显示的长度等都由代码生成器完成，不需要写任何代码  
![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/editTbale1.png)  

## 6、主从表新建、编辑
主从表新建、编辑所有前后端代码，全部由代码生成器生成，并支持并后端业务代码扩展，新建、编辑从表配置、字段、类型(下拉框、日期、TextArea等)、所在行与列、字段是否只读、标签显示的长度等都由代码生成器完成，不需要写任何代码  
![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/editTbale2.png)  

## 7、单列、多列Form表单
单列、多列Form表单，已封装成组件，并且支持组件扩展。可配置显示的列的数量、是否只读、列的数据类型(日期、下拉框、TextArea、列宽、自动绑定数据源、图片上传等)， 这些只需要配置JSON格式即可使用  
![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/form2.png)  

## 8、可配置的Table(自动/手动加载table数据、自动绑定数据源、编辑功能)
单列、多列Form表单，已封装成组件，并且支持组件扩展。可配置显示的列的数量、是否只读、列的数据类型(日期、下拉框、TextArea、列宽、自动绑定数据源、图片上传等)， 这些只需要配置JSON格式即可使用  

从后台加载数据、自动绑定数据
![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/loadtable.png)  

可编辑的table，手动绑定数据、自动绑定数据源
![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/form3.png)  

表单与table混合使用
![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/table+form.png)  

## 9、excel导入
excel导入整个页面都由代码生成器生成，导入的字段、字段是否必填，下载模板也由代码生成器上配置(自己根据实际需要决定是否采用此方法)，导入时会验证是否为空与数据的合法性，逻辑校验自己实现扩展方法即可  
![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/importTable1.png)  

## 10、前端、后台业务代码扩展
只需要根据自己的业务实现前端、后台代码扩展方法即可。后台大部分都采用的委托扩展方法，这里只截了一张图数据加载事件的扩展方法，完整方法从Demo上获取
![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/extend.png)  

## 11、H5开发
H5只是做了一个简单的Demo,如果你有H5开发经验，请忽略，如果你没有H5开发经验，<a title="H5开发看这里" href="http://132.232.2.109/app/guide" target="_blank">可看看这里</a>
![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/h5.jpg)  

## 12、权限分配
目前只实现了对用户的角色的Action进行权限分配
![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/auth.png)  

## 13、菜单管理
 默认8种权限，可自行定义其他权限(代码生成器完后，直接在菜单上配置url(url路径为自动生成前端的router-&gt;path,从此处复制过过即可))
![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/menu.png)  

## 14、个人中心
个人中心目前只开发了页面与修改密码，其他功能自行根据需要实现
![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/user.png)  

## 15、代码生成器
代码生成器提供了20多种可配置的属性，可灵活配置显示、查询、编辑、导入、导出、主从关系等功能<a href="http://132.232.2.109/document/coder">点击看代码生成器文档</a>
![Home](https://github.com/cq-panda/Vue.NetCore/blob/master/imgs/coder.png)  


### 还有角色管理、日志管理、数据源管理、其他组件、后台代码等功能就不再介绍了,<a href="http://132.232.2.109">点这里看看就知道了</a>  

- 此框架由代码生成器完成了大部分工作能极大减少代码量,并支持前台端代码的扩展。如果你对前后端分离开发的方式或H5开发有兴趣,那么希望此框架对能你有所帮助！
- 如果你觉得框架对你有用，帮忙点个星，非常感谢!
- 如果有什么问题或建议，提issue或加QQ283591387
- [Demo地址：http://www.volcore.xyz 帐号：admin666密码：123456（本地超级管理员帐号：admin密码123456](http://www.volcore.xyz)
- [GitHub地址：](https://github.com/cq-panda/Vue.NetCore.git)https://github.com/cq-panda/Vue.NetCore.git
- [如果你需要Quartz.Net做定时任务管理，你可以试试这个：](https://github.com/cq-panda/Quartz.NetUI)https://github.com/cq-panda/Quartz.NetUI
- (站点与MySql部署在同一个1G1核1M带宽的Centos服务器上,访问可能会出现延迟现象)

 
