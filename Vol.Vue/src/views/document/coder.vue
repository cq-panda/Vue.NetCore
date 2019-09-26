<template>
  <div id="cnblogs_post_body">
    <h2>使用代码生成器前需要准备的工作</h2>
    <blockquote style="    background: #fbfbfb;">
      <ul>
        <li>在数据库创建一张表，必须有主键,可以是自增Id，也可以是Guid，如果使用的MySql数据库使用Guid请将字段设置为char长度36位</li>
        <li>表最好包括创建人、时间/修改人、时间等字段，在新增或编辑时，框架会自动给这几个字段设置值，字段格式要求参照后台项目appsettings.json中属性CreateMember、ModifyMember的说明</li>
        <li>
          前端项目运行：.../VOL.Vue/run.bat
          <span>(如果从执行过npm install安装依赖包，在.../VOL.Vue路径下执行npm install命令,如果没有安装node，必须先安装了node环境)</span>
        </li>
        <li>后台项目运行项目路径下.../VOL.WebApi/builder_run.bat,或如果不需要生成业务类运行:dev_run.bat即可</li>
        <li>准备完成，项目运行起来后输入：http://localhost:8080</li>
      </ul>
    </blockquote>
    <p></p>
    <h2>代生成步骤(只需要4步)</h2>
    <blockquote style="    background: #fbfbfb;">
      <ul>
        <li>选择菜单：在线代生成器-&gt;Vue+后台代码生成</li>
        <li>
          点击新建
          <span>(如果只是做修改,跳过此步)</span>
          <br />-&gt;填写信息
          <span>(项目命名空间：代码生成时所放在类库，项目文件夹：生成的文件放在文件夹,此文件夹可以不存在，表名:可以是视图或表,名字必须和数据库一样)</span>
          <br />-&gt;确认
          <span>(此时会从数据库载出表结构信息,如果只想创建一个空菜单，上面表名随便填写)</span>
          <br />-&gt;根据实际需要填写加载出来的表单及table表的的信息
          <br />
          <span>(需要注意Vue绝对路径的设置:生成Vue页面必须指定此路径，路径为当前Vue项目的views文件夹，如E:/VOL.Vue/src/views)</span>
          <br />-&gt;保存
          <span>(任何修改后都先点击保存再做其他操作)</span>-&gt;生成Model-&gt;生成业务类-&gt;生成Vue页面
          <br />
        </li>
        <li>
          系统-&gt;菜单设置：配置菜单
          <span>(配置方式见下面操作)</span>，运行后台项目路径下.../VOL.WebApi/dev_run.bat
          <span>如果当前运行的是此bat请忽略</span>
        </li>
        <li>刷新页面就可以看到刚刚生成的页面了</li>
      </ul>
    </blockquote>
    <p></p>

    <h2>1、选择菜单：在线代生成器-&gt;Vue+后台代码生成</h2>
    <div>
      <p class="desc">点击新建,弹出选择框(如果只是做修改，直接修改后点保存，再点各种生成操作)</p>
      <img src="https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/doc/step1.png" />
    </div>
    <h2>2、填写需要生成表或视图的信息</h2>
    <div>
      <p class="desc">
        点击确认，自动从后台加载表结构信息(如果只是生成空菜单,里面就随便填)
        <br />项目命名空间：代码生成时所放在类库(现框架采用一个模块为一个类库，可自行决定是否需要增加类库)
        <br />项目文件夹：生成的文件放在文件夹,此文件夹由代码生成器创建,不需要手动创建
        <br />表名:可以是视图或表,名字必须和数据库一样
      </p>
      <img src="https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/doc/step2.png" />
    </div>
    <h2>3、填写信息</h2>
    <div>
      <p class="desc">
        加载完成后，根据自身情况配置下面表格中的查询与新建、编辑信息
        <a href="#param">查看参数说明</a>
        <br />点击保存、生成Vue页面、生成Model、生成业务类即可(每次修改信息后都需要点击保存)。
        <br />如果使用的mysql数据库并且主键使用的是Guid，数据库字段类型应该设置为char 长度为36，否则生成实体Model时会与数据库类型对应不上
      </p>
      <img src="https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/doc/sep3.png" />
    </div>
    <h2>4、查看生成完的代码</h2>
    <div>
      <p class="desc">生成完成后在vs中搜索当前表就能看到生成的代码了，vue代码也同时生成了,可在vscode中搜索当前文件(文件名都是以当前表名开头)</p>
      <img class="img3" src="https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/doc/sep4.png" />
      <img class="img3" src="https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/doc/sep4x.png" />
    </div>
    <h2>5、菜单配置</h2>
    <div>
      <p class="desc">
        参数设置:
        <br />Url:通过VsCode打开vue项目,找到router文件夹下viewGird.js找当前生成表的path属性/SellOrder就是配置菜单需要配置的url,直接复制过来即可
        <br />表名:在生成代码时填写的表名或视图名，必须一致，否则权限验证通不过
      </p>
      <img src="https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/doc/sep5.png" />
      <img src="https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/doc/sep5x.png" />
    </div>,
    <h2>6、查看生成的页面</h2>
    <div>
      <p class="desc">先确认后台项目运行的是路径…/VOL.WebApi/dev_run.bat文件,输入http://localhost:8080/sellOrder</p>
      <img src="https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/doc/sep6.png" />
    </div>

    <h2 id="param">代码生成器字段参数</h2>
    <p class="desc">字段参照步骤3的界面</p>
    <h5>表单字段</h5>
    <table style="width: 100%;">
      <tbody>
        <tr>
          <td>
            <span>字段</span>
          </td>
          <td>
            <span>描述</span>
          </td>
        </tr>
        <tr>
          <td>Id</td>
          <td>
            <span>表</span>Id
          </td>
        </tr>
        <tr>
          <td>
            <span>父级</span>Id
          </td>
          <td>
            <span>表所放在位置</span>
          </td>
        </tr>
        <tr>
          <td>
            <span>项目命名空间</span>
          </td>
          <td>
            <span>将当前表生成的文件放在所选命名空间的类库中</span>
          </td>
        </tr>
        <tr>
          <td>
            <span>表中文名</span>
          </td>
          <td>
            <span>需要生成代码的表具体名</span>
          </td>
        </tr>
        <tr>
          <td>
            <span>表名</span>
          </td>
          <td>
            <span>需要生成代码的表或视图</span>
          </td>
        </tr>
        <tr>
          <td>
            <span>实际表名</span>
          </td>
          <td>
            <span>用实际表名替换表名</span>,
            <span>具体功能未开发</span>
          </td>
        </tr>
        <tr>
          <td>
            <span>项目文件夹</span>
          </td>
          <td>
            <span>将当前表生成的文件放在所选命名空间类库下的文件夹</span>(
            <span>不需要人为创建</span>)
          </td>
        </tr>
        <tr>
          <td>
            <span>明细表中文名</span>
          </td>
          <td>
            <span>明细从表的中文名</span>
          </td>
        </tr>
        <tr>
          <td>
            <span>明细表名</span>
          </td>
          <td>
            <span>明细从表</span>,
            <span>用于生成主从表关系及</span>UI,
            <span>生成代码前</span>,
            <span>必须先生成明细表代码</span>
          </td>
        </tr>
        <tr>
          <td>
            <span>连接字段</span>
          </td>
          <td>
            <span>设置连接字段后，前台界面表格点击此链接可快速查看详细信息</span>
            <img
              width="129"
              height="110"
              src="https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/doc/link.png"
            />
          </td>
        </tr>
        <tr>
          <td>
            <span>排序字段</span>
          </td>
          <td>
            <span>前台表格的排序字段，如果不是自增的主键，必须设置此值</span>
          </td>
        </tr>
        <tr>
          <td>
            Vue
            <span>视图绝对路径</span>
          </td>
          <td>
            <span>生成</span>Vue
            <span>页面存放的位置，如：</span>E:/project/views/
            Vue
            <span>页面生成后会放在此路径下</span>
          </td>
        </tr>
      </tbody>
    </table>
    <h5>Table表字段</h5>
    <table>
      <tbody>
        <tr>
          <td>
            <span>字段</span>
          </td>
          <td>
            <span>描述</span>
          </td>
        </tr>
        <tr>
          <td>
            <span>列中文名</span>
          </td>
          <td>
            <span>表显示的中文名</span>
          </td>
        </tr>
        <tr>
          <td>
            <span>列名</span>
          </td>
          <td>
            <span>表列名</span>
          </td>
        </tr>
        <tr>
          <td>
            <span>列最大长度</span>
          </td>
          <td>
            <span>数据库设置的列长度</span>
            <span
              style="color: red;"
            >如果使用的mysql数据库并且主键使用的是Guid，数据库字段类型应该设置为char 长度为36，否则生成实体Model时会与数据库类型对应不上</span>
          </td>
        </tr>
        <tr>
          <td>
            <span>数据类型</span>
          </td>
          <td>
            C#
            <span>属性的数据类型</span>(
            <span>除非数据库字段类型发生变</span>,
            <span>其他不需要修改</span>)
          </td>
        </tr>
        <tr>
          <td>
            <span>可为空</span>
          </td>
          <td>
            <span>表字段是否可为</span>null,
            <span>此处会涉及前、后端验证规则，默认加载的是表结构</span>
          </td>
        </tr>
        <tr>
          <td>
            <span>排序号</span>
          </td>
          <td>
            <span>前端页面表格显示的顺序</span>
          </td>
        </tr>
        <tr>
          <td>
            <span>数据源</span>
          </td>
          <td>
            <span>如果字段对应的是下拉框或多选框，此处选择对应的数据源的字典编号</span>,
            <span>在菜单：下拉框绑定设置中配置数据源，具体可参照现有配置</span>
          </td>
        </tr>
        <tr>
          <td>
            <span>是否只读</span>
          </td>
          <td>
            <span>编辑或新建时，如果此字段为只读，则不可修改</span>
          </td>
        </tr>
        <tr>
          <td>
            <span>编辑行、编辑列</span>
          </td>
          <td>
            <span>新建</span>/
            <span>编辑时，此字段所在的行与列，如行</span>=1
            <span>，列</span>=2
            <span>，则界面所在位置为第</span>1
            <span>行第</span>2
            <span>列(此配置直接决定表的编辑或新建字段,不在此配置中的字段，编辑或新建时都会被过滤移除)</span>
          </td>
        </tr>
        <tr>
          <td>
            <span>编辑类型</span>
          </td>
          <td>
            <span>新建</span>/
            <span>编辑时标签的类型，如日期标签，下拉框，</span>text
            <span>等</span>
          </td>
        </tr>
        <tr>
          <td>colSize</td>
          <td>
            <span>编辑、新建、查看时此字段显示的长度，如果设置的是</span>12
            <span>则，此字段独占一行，可选值</span>1-12
          </td>
        </tr>
        <tr>
          <td>
            <span>查询行、查询列</span>
          </td>
          <td>
            <span>查询时，此字段所在的行与列，如行</span>=1
            <span>，列</span>=2
            <span>，则界面所在位置为第</span>1
            <span>行第</span>2
            <span>列</span>
          </td>
        </tr>
        <tr>
          <td>
            <span>查询类型</span>
          </td>
          <td>
            <span>查询时标签的类型，如日期标签，下拉框，</span>text
            <span>等</span>
          </td>
        </tr>
        <tr>
          <td>
            <span>导入列、</span>Api
            <span>输入列，是否可为空、</span>api
            <span>输出列</span>
          </td>
          <td>
            <span>具体业务未实现</span>
          </td>
        </tr>
        <tr>
          <td>
            <span>主键</span>
          </td>
          <td>
            <span>设置是否为主键，必须一个主键</span>
          </td>
        </tr>
        <tr>
          <td>
            <span>启用图片地址</span>
          </td>
          <td>
            <span>如果字段是图片，请选择是</span>
          </td>
        </tr>
      </tbody>
    </table>

    <br />
    <br />
  </div>
</template>
<script>
export default {};
</script>
<style lang="less" scoped>
#cnblogs_post_body
{
color: black;      
font: 0.875em/1.5em "微软雅黑" , "PTSans" , "Arial" ,sans-serif;
font-size: 15px;
}
#各个等级标题的颜色样式
#cnblogs_post_body h1    {
background: #2B6695;
border-radius: 6px 6px 6px 6px;
box-shadow: 0 0 0 1px #5F5A4B, 1px 1px 6px 1px rgba(10, 10, 0, 0.5);
color: #FFFFFF;
font-family: "微软雅黑" , "宋体" , "黑体" ,Arial;
font-size: 23px;
font-weight: bold;
height: 25px;
line-height: 25px;
margin: 18px 0 !important;
padding: 8px 0 5px 5px;
text-shadow: 2px 2px 3px #222222;
}
#cnblogs_post_body h2    {
background:#4CAF50;
border-radius: 6px 6px 6px 6px;
box-shadow: 0 0 0 1px #a3a3a3, 1px 1px 6px 1px rgba(10, 10, 0, 0.5);
color: #FFFFFF;
font-family: "微软雅黑" , "宋体" , "黑体" ,Arial;
font-size: 20px;
font-weight: bold;
/* height: 25px; */
line-height: 37px;
margin: 18px 0 !important;
/* padding: 8px 0 5px 5px; */
padding: 2px 20px;
text-shadow: 2px 2px 3px #635555;
}


#cnblogs_post_body h3    {
background: #399ab2;
border-radius: 6px 6px 6px 6px;
box-shadow: 0 0 0 1px #5F5A4B, 1px 1px 6px 1px rgba(10, 10, 0, 0.5);
color: #FFFFFF;
font-family: "微软雅黑" , "宋体" , "黑体" ,Arial;
font-size: 18px;
font-weight: bold;
height: 25px;
line-height: 25px;
margin: 18px 0 !important;
padding: 8px 0 5px 5px;
text-shadow: 2px 2px 3px #222222;
}
#cnblogs_post_body h4{
background: #2B6600;
border-radius: 6px 6px 6px 6px;
box-shadow: 0 0 0 1px #5F5A4B, 1px 1px 6px 1px rgba(10, 10, 0, 0.5);
color: #FFFFFF;
font-family: "微软雅黑" , "宋体" , "黑体" ,Arial;
font-size: 16px;
font-weight: bold;
height: 24px;
line-height: 23px;
margin: 12px 0 !important;
padding: 5px 0 5px 10px;
text-shadow: 2px 2px 3px #222222;
}

#cnblogs_post_body table {

border-collapse: collapse;
}
#cnblogs_post_body table  td{
color: rgba(111, 93, 93, 0.87);
font-size: 13px;
border-collapse: collapse;
padding: 7px;
min-width: 60px;
border: 1px solid #607d8b;
text-align: left;
}
#cnblogs_post_body img{
width: 100%;
margin-bottom: 30px;
margin-top: 10px;
}

#cnblogs_post_body h2:a{
color: rgb(235, 235, 235);
}
#cnblogs_post_body h2 a:hover{
color: rgb(255, 102, 0);
}

#cnblogs_post_body h1{
color: rgb(235, 235, 235);
}
#cnblogs_post_body h1:hover{
color: rgb(255, 102, 0);
}
#cnblogs_post_body h2{
color: rgb(235, 235, 235);
}
#cnblogs_post_body h2:hover{
color: rgb(255, 102, 0);
}
#cnblogs_post_body h3{
color: rgb(235, 235, 235);
}
#cnblogs_post_body h3:hover{
color: rgb(255, 102, 0);
}
#cnblogs_post_body h4{
color: rgb(235, 235, 235);
}
#cnblogs_post_body h4:hover{
color: rgb(255, 102, 0);
}
#cnblogs_post_body blockquote {
margin: 20px 0;
padding: 15px 20px 15px 60px;
font-size: 15px;
background: #f7ed91;
font-family: 'Microsoft Yahei';
box-shadow: 0 0 8px #AAA;
clear: both;
line-height: 1.6em;
color: #333;
}
#cnblogs_post_body blockquote li{
padding: 15px 2px 5px 5px;
/* line-height: 1.5; */
/* color: #000; */
border-bottom: 1px solid #ccc;
/* list-style-type: disc; */
margin-bottom: 0.5em;
}

#cnblogs_post_body .desc{
background: rgb(230, 250, 250);
padding: 10px 10px 10px 10px;
border: 1px dashed rgb(224, 224, 224);
font-family: 微软雅黑;
font-size: 13px;
}

#cnblogs_post_body	.desc-to{
background: #4CAF50;
color: white;
}
#cnblogs_post_body	.desc-to > div{
padding: 10px 16px;
}
#cnblogs_post_body	.desc-to a{
color: yellow;
font-weight: bold;
margin-right: 25px;
}
ul  span{
font-size: 12px;
margin-left: 10px;
color: #2196F3;
			}
.img3{
    width: 30% !important;
    margin-right: 10px;
}
</style>