<template>
  <div id="cnblogs_post_body"><div style="text-align:justify;">
	<strong><span style="display:none;"></span><span style="font-size:18px;">使用代码生成器前需要准备的工作</span><span style="display:none;"></span></strong> 
</div>
<blockquote>
	<ul style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:0px;">
		<li style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px 0px 0.5em;padding:15px 2px 5px 5px;">
			<span style="font-size:16px;color:#666666;">在数据库创建一张表，必须有主键,可以是自增Id，也可以是Guid，如果使用的MySql数据库使用Guid请将字段设置为char长度36位</span> 
		</li>
		<li style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px 0px 0.5em;padding:15px 2px 5px 5px;">
			<span style="font-size:16px;color:#666666;">表最好包括创建人、时间/修改人、时间等字段，在新增或编辑时，框架会自动给这几个字段设置值，字段格式要求参照后台项目appsettings.json中属性CreateMember、ModifyMember的说明</span> 
		</li>
		<li style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px 0px 0.5em;padding:15px 2px 5px 5px;">
			<span style="font-size:16px;color:#666666;">前端项目运行：.../VOL.Vue/run.bat&nbsp;</span><span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;font-size:16px;margin-left:10px;color:#666666;">(如果从未执行过npm install安装依赖包，在.../VOL.Vue路径下执行npm install命令,如果没有安装node，必须先安装node环境)</span> 
		</li>
		<li style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px 0px 0.5em;padding:15px 2px 5px 5px;">
			<span style="font-size:16px;color:#666666;">后台项目运行项目路径下.../VOL.WebApi/builder_run.bat,</span><span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;font-size:16px;margin-left:10px;color:#E56600;">如果不需要【生成业务类】运行:dev_run.bat即可，否则后台运行dev_run.bat生成业务类会中断代码执行</span> 
		</li>
		<li style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px 0px 0.5em;padding:15px 2px 5px 5px;">
			<span style="font-size:16px;color:#666666;">准备完成，项目运行起来后输入：http://localhost:808</span> 
		</li>
	</ul>
	<p>
		<br />
	</p>
	<p>
		<br />
	</p>
	<p>
		<span style="display:none;"></span> 
	</p>

	<ul style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:0px;">
		<li>
			<a href="http://localhost:8080/document/coder#param" style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;background:0px 0px #FFFFFF;color:red;text-decoration-line:none;outline:0px;cursor:pointer;transition:color 0.2s ease 0s;font-family:微软雅黑, PTSans, Arial, sans-serif;font-size:15px;white-space:normal;"><span style="color:#60D978;line-height:2.5;">在代码生成页面,不需要写代码,按照代码生成配置的属性即可完成：查询、删除、新增、修改、导入、导出、审核、select及多选框的数据源自动绑定等功能</span></a> 
		</li>
	</ul>
	<p>
		<p>
			<p>
				<p>
					<ul style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:0px;">
						<li>
							<a style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;background:0px 0px #FFFFFF;color:#2D8CF0;outline:0px;cursor:pointer;transition:color 0.2s ease 0s;font-family:微软雅黑, PTSans, Arial, sans-serif;font-size:15px;white-space:normal;"><span style="line-height:2.5;color:#60D978;">代码生成后，如果表结构发生了变化，点【同步表结构】再点【生成model】【生面vue页面】</span></a>
						</li>
					</ul>
					<p>
						<p>
							<p>
								<br />
							</p>
						</p>
					</p>
				</p>
				<ul style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:0px;">
					<li>
						<strong>主从表代码生成</strong>
					</li>
				</ul>
			</p>
		</p>
	</p>
</blockquote>
<p>
	<span style="font-family:微软雅黑, PTSans, Arial, sans-serif;font-size:15px;white-space:normal;background-color:#FFFFFF;"></span> 
</p>
<p>
	<span style="font-family:微软雅黑, PTSans, Arial, sans-serif;font-size:15px;white-space:normal;background-color:#FFFFFF;"></span> 
</p>
<p style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin-top:20px;margin-bottom:20px;padding:10px;background:#E6FAFA;border:1px dashed #E0E0E0;font-family:微软雅黑;font-size:13px;white-space:normal;color:red;">
	<span style="display:none;"></span><span style="color:#999999;"><span style="display:none;"></span><span style="color:#333333;">主从(明细)</span><span style="display:none;"></span><span style="color:#333333;">表生成代码注意：明细表的外键必须是主表的主键字段，可参照SellOrder的明细表SellOrderList的外建，主从表代码生成步骤都是一样，在生成主表前需要先将从表按现有步骤生成(可以不用生成从表vue页面),然后主表生成配置页面填上【明细表名】与【明细表中文名】,点击生成vue页面、model、业务类即可完成主从页面代码的生成。</span></span><span style="display:none;"></span> 
</p>
<h2>
	<br />
</h2>
<h2>
	<span style="line-height:2;">1、选择菜单：在线代生成器-&gt;Vue+后台代码生成</span> 
</h2>
<div>
	<ul>
		<li>
			点击新建,弹出选择框，如果只是做修改跳过此步，直接<span style="background-color:;"><span style="color:#666666;"></span></span>修改页面配置后点保存，再点各种生成操作
		</li>
	</ul>
	<p>
		<br />
	</p>
<img src="https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/doc/step1.png" style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;border-style:none;width:1180px;margin-bottom:30px;margin-top:10px;" /> 
</div>
<h2>
	<span style="line-height:2;">2、填写需要生成表或视图的信息</span> 
</h2>
<p>
	<br />
</p>
<ul>
	<li>
		<span style="line-height:2;color:#666666;font-size:14px;">点击确认，自动从后台加载表结构信息(如果只是生成空菜单,里面就随便填)&nbsp;</span> 
	</li>
	<li>
		<span style="line-height:2;color:#666666;font-size:14px;"> 项目命名空间：代码生成时所放在类库(现框架采用一个模块为一个类库，可自行决定是否需要增加类库)&nbsp;</span> 
	</li>
	<li>
		<span style="line-height:2;color:#666666;font-size:14px;"> 项目文件夹：生成的文件放在文件夹,此文件夹由代码生成器创建,不需要手动创建&nbsp;</span> 
	</li>
	<li>
		<span style="line-height:2;color:#666666;font-size:14px;"> 表名:可以是视图或表,名字必须和数据库一样&nbsp;</span> 
	</li>
	<li>
		<span style="font-size:14px;color:#666666;">(如果只想创建一个空菜单，上面表名随便填写)</span> 
	</li>
</ul>
<p>
	<br />
</p>
<img src="https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/doc/step2.png" style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;border-style:none;width:1180px;margin-bottom:30px;margin-top:10px;" /> 
<p>
	<br />
</p>
<h2>
	3、填写信息
</h2>
<div>
	<ul>
		<li>
			<span style="line-height:2;font-size:14px;color:#666666;">&nbsp; &nbsp;加载完成后，根据需要配置下面表格中的查询与新建、编辑信息<span style="display:none;"></span></span><span style="line-height:2;font-size:14px;color:#666666;"><span style="color:#E56600;">&nbsp;(不设置编辑、新建行，编辑或查询时，弹出框是空白的</span><span style="color:#E56600;">)</span></span><span style="display:none;"></span> 
		</li>
		<li>
			<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;font-size:14px;margin-left:10px;color:#666666;line-height:2;">表别名：不想暴露真实表名，可以填写表别名，表别名将替代原表名生成的Model与业务类。一个表只能有一个别名，默认表名与别名相同。<span style="color:#E56600;">如果使用别名，必须将已经生成的文件删除</span></span><span style="line-height:2;font-size:14px;color:#E56600;">&nbsp;</span> 
		</li>
		<li>
			<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;font-size:14px;margin-left:10px;color:#E56600;line-height:2;">点击保存、生成Vue页面、生成Model、生成业务类即可(每次修改信息后都需要点击保存)。</span><span style="line-height:2;font-size:14px;color:#E56600;">&nbsp;</span> 
		</li>
		<li>
			<span style="line-height:2;font-size:14px;color:#666666;">&nbsp; &nbsp;如果使用的mysql数据库并且主键使用的是Guid，数据库字段类型应该设置为char 长度为36，否则生成实体Model时会与数据库类型对应不上&nbsp;</span> 
		</li>
		<li>
			<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;font-size:14px;margin-left:10px;color:#666666;line-height:2;">(需要注意Vue绝对路径的设置:生成Vue页面必须指定此路径，路径为当前Vue项目的views文件夹，如E:/VOL.Vue/src/views)</span> 
		</li>
	</ul>
	<p>
		<br />
	</p>
<img src="https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/doc/sep3.png" style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;border-style:none;width:1180px;margin-bottom:30px;margin-top:10px;" /> 
</div>
<h2>
	4、查看生成完的代码
</h2>
<div>
	<ul>
		<li>
			<span style="font-size:14px;color:#666666;">生成完成后在vs中搜索当前表就能看到生成的代码了，vue代码也同时生成了,可在vscode中搜索当前文件(文件名都是以当前表名开头)</span> 
		</li>
	</ul>
	<p>
		<br />
	</p>
<img src="https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/doc/sep4.png" style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;border-style:none;margin-right:10px;width:354px;margin-bottom:30px;margin-top:10px;" />&nbsp;<img src="https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/doc/sep4x.png" style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;border-style:none;margin-right:10px;width:354px;margin-bottom:30px;margin-top:10px;" /> 
</div>
<h2>
	5、菜单配置
</h2>
<div>
	<p>
		<span style="font-size:14px;color:#666666;">参数设置:&nbsp;</span> 
	</p>
	<ul>
		<li>
			<span style="line-height:2;font-size:14px;color:#666666;">Url:通过VsCode打开vue项目,找到router文件夹下viewGird.js找当前生成表的path属性/SellOrder就是配置菜单需要配置的url,直接复制过来即可&nbsp;</span> 
		</li>
		<li>
			<span style="line-height:2;font-size:14px;color:#666666;"> 表名:在生成代码时填写的表名或视图名，必须一致，否则权限验证通不过</span> 
		</li>
	</ul>
	<p>
		<span style="background-color:;"></span> 
	</p>
<img src="https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/doc/sep5.png" style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;border-style:none;width:1180px;margin-bottom:30px;margin-top:10px;" /><img src="https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/doc/sep5x.png" style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;border-style:none;width:1180px;margin-bottom:30px;margin-top:10px;" /> 
</div>
<h2>
	<span style="display:none;"></span>6、查看生成的页面
</h2>
<p>
	<br />
</p>
<ul>
	<li>
		<span style="font-size:14px;color:#666666;line-height:2;">确认后台项目运行的是路径 …/VOL.WebApi/dev_run.bat 文件,</span> 
	</li>
	<li>
		<span style="font-size:14px;color:#666666;line-height:2;">输入http://localhost:8080/sellOrder</span> 
	</li>
</ul>
<p>
	<br />
</p>
<img src="https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/doc/sep6.png" style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;border-style:none;width:1180px;margin-bottom:30px;margin-top:10px;" /> 
<p>
	<br />
</p>
<h1 style="text-align:left;">
	代码生成器参数配置
</h1>
<h2 style="text-align:left;">
	<span style="color:#666666;">表单字段</span> 
</h2>
<table style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;color:#000000;font-family:微软雅黑, PTSans, Arial, sans-serif;font-size:15px;background-color:#FFFFFF;width:1180px;">
	<tbody>
		<tr>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">字段</span> 
			</td>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">描述</span> 
			</td>
		</tr>
		<tr>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				Id
			</td>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">表</span>Id
			</td>
		</tr>
		<tr>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">父级</span>Id
			</td>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">表所放在位置</span> 
			</td>
		</tr>
		<tr>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">项目命名空间</span> 
			</td>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">将当前表生成的文件放在所选命名空间的类库中</span> 
			</td>
		</tr>
		<tr>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">表中文名</span> 
			</td>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">需要生成代码的表具体名</span> 
			</td>
		</tr>
		<tr>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">表别名</span> 
			</td>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;color:red;font-size:14px;">表别名：如果不想暴露真实表名，可以自行设置任何表别名，表别名将替代原表名生成的Model与业务类。一个表只能有一个别名，默认表名与别名相同，如果想使用别名，必须将已经生成过的文件删除</span> 
			</td>
		</tr>
		<tr>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">实际表名</span> 
			</td>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">用实际表名替换表名</span>,&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">具体功能未开发</span> 
			</td>
		</tr>
		<tr>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">项目文件夹</span> 
			</td>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">将当前表生成的文件放在所选命名空间类库下的文件夹</span>(&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">不需要人为创建</span>)
			</td>
		</tr>
		<tr>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">明细表中文名</span> 
			</td>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">明细从表的中文名</span> 
			</td>
		</tr>
		<tr>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">明细表名</span> 
			</td>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">明细从表</span>,&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">用于生成主从表关系及</span>UI,&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">生成代码前</span>,&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">必须先生成明细表代码</span> 
			</td>
		</tr>
		<tr>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">连接字段</span> 
			</td>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">设置连接字段后，前台界面表格点击此链接可快速查看详细信息</span>&nbsp;<img height="110" src="https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/doc/link.png" style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;border-style:none;width:350px !important;margin-bottom:30px;margin-top:10px;" /> 
			</td>
		</tr>
		<tr>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">排序字段</span> 
			</td>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">前台表格的排序字段，如果不是自增的主键，必须设置此值</span> 
			</td>
		</tr>
		<tr>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				Vue&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">视图绝对路径</span> 
			</td>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">生成</span>Vue&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">页面存放的位置，如：</span>E:/project/views/ Vue&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">页面生成后会放在此路径下</span> 
			</td>
		</tr>
	</tbody>
</table>
<span><span style="font-size:20px;background-color:#FFFFFF;"><br />
</span></span> 
<p>
	<span style="font-family:微软雅黑, PTSans, Arial, sans-serif;font-size:20px;"><strong>Table配置表字段</strong></span> 
</p>
<table style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;color:#000000;font-family:微软雅黑, PTSans, Arial, sans-serif;font-size:15px;background-color:#FFFFFF;">
	<tbody>
		<tr>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">字段</span> 
			</td>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">描述</span> 
			</td>
		</tr>
		<tr>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">列中文名</span> 
			</td>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">表显示的中文名</span> 
			</td>
		</tr>
		<tr>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">列名</span> 
			</td>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">表列名</span> 
			</td>
		</tr>
		<tr>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">列最大长度</span> 
			</td>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">数据库设置的列长度</span>&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;color:red;">如果使用的mysql数据库并且主键使用的是Guid，数据库字段类型应该设置为char 长度为36，否则生成实体Model时会与数据库类型对应不上</span> 
			</td>
		</tr>
		<tr>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">数据类型</span> 
			</td>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				C#&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">属性的数据类型</span>(&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">除非数据库字段类型发生变</span>,&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">其他不需要修改</span>)
			</td>
		</tr>
		<tr>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">table列显示类型</span> 
			</td>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:red;font-size:14px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				如果table的列存的是图片、excel或其他文件的路径，就选择此列的配置,如:列存的是为图片就选择img，如果是Excel文件的路径就选择excel，这一列在table上点击文件名时会自动下载文件
			</td>
		</tr>
		<tr>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">可为空</span> 
			</td>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">表字段是否可为</span>null,&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">此处会涉及前、后端验证规则，默认加载的是表结构</span> 
			</td>
		</tr>
		<tr>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">排序号</span> 
			</td>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">前端页面表格显示的顺序</span> 
			</td>
		</tr>
		<tr>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">数据源</span> 
			</td>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">如果字段对应的是下拉框或多选框，此处选择对应的数据源的字典编号</span>,&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">在菜单：下拉框绑定设置中配置数据源，具体可参照现有配置</span> 
			</td>
		</tr>
		<tr>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">是否只读</span> 
			</td>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">编辑或新建时，如果此字段为只读，则不可修改</span> 
			</td>
		</tr>
		<tr>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">编辑行、编辑列</span> 
			</td>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">新建</span>/&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">编辑时，此字段所在的行与列，如行</span>=1&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">，列</span>=2&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">，则界面所在位置为第</span>1&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">行第</span>2&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">列(此配置直接决定表的编辑或新建字段,不在此配置中的字段，编辑或新建时都会被过滤移除)</span>&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;color:red;">编辑行修改后需要点击【生成model】,如果只想编辑，界面不想显示，编辑行设置为0</span> 
			</td>
		</tr>
		<tr>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">编辑类型</span> 
			</td>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">新建</span>/&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">编辑时标签的类型，如日期标签，下拉框，</span>text&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">等</span> 
			</td>
		</tr>
		<tr>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				colSize
			</td>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">编辑、新建、查看时此字段显示的长度，如果设置的是</span>12&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">则，此字段独占一行，可选值</span>1-12
			</td>
		</tr>
		<tr>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">查询行、查询列</span> 
			</td>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">查询时，此字段所在的行与列，如行</span>=1&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">，列</span>=2&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">，则界面所在位置为第</span>1&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">行第</span>2&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">列</span> 
			</td>
		</tr>
		<tr>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">查询类型</span> 
			</td>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">查询时标签的类型，如日期标签，下拉框，</span>text&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">等</span> 
			</td>
		</tr>
		<tr>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">导入列、</span>Api&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">输入列，是否可为空、</span>api&nbsp;<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">输出列</span> 
			</td>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">具体业务未实现</span> 
			</td>
		</tr>
		<tr>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">主键</span> 
			</td>
			<td style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0px;padding:7px;color:rgba(33, 33, 33, 0.87);font-size:13px;border-collapse:collapse;min-width:60px;border:1px solid #D2D2D2;">
				<span style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;">设置是否为主键，必须一个主键<br />
</span> 
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
table{
      border-collapse: collapse;
   tr{

   }
   tr:first-child{
         background: #f5f5f5;
   }
   td{
         padding: 12px 13px !important;
    border: 1px solid #dfe2e5 !important;
border-collapse:collapse;
   }
}
</style>