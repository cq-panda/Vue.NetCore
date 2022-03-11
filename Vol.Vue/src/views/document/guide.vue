<template>
  <div class="doc-content">
    <div class="g-left">
      <ul>
        <li
          class="n-item"
          :class="{ actived: activedIndex == index }"
          v-for="(item, index) in list"
          :key="index"
        >
          <a @click="to(index)">{{ item.name }}</a>
        </li>
      </ul>
    </div>

    <a class="avd1" href="https://curl.qcloud.com/6OoRDPjn" target="_blank">
      <img
        src="https://txspread-1256993465.cos.ap-beijing.myqcloud.com/server345_200%20.jpg"
    /></a>
    <a class="avd2" href="https://curl.qcloud.com/qndt9pnm" target="_blank">
      <img
        src="https://txspread-1256993465.cos.ap-beijing.myqcloud.com/560x300.jpg"
    /></a>
    <div class="g-right" style="margin-left: 190px">
      <div class="h-box">
        <a target="_blank" href="http://donate.volcore.xyz">
          <Icon type="ios-color-filter" /><br />
          项目赞助</a
        >
        <a>QQ1群:45221949 <br />QQ2群:913189178</a>
        <a target="_blank" href="https://github.com/cq-panda/Vue.NetCore">
          <Icon type="logo-github" /><br />GitHub</a
        >
        <a target="_blank" href="https://gitee.com/x_discoverer/Vue.NetCore">
          <Icon type="logo-github" /><br />Gitee</a
        >
        <a
          target="_blank"
          @click="
            () => {
              this.$router.push({ path: '/document/coder' });
            }
          "
        >
          <Icon type="ios-ionic" /><br />代码生成</a
        >

        <a
          target="_blank"
          @click="
            () => {
              this.$router.push({ path: '/document/netCoreDev' });
            }
          "
        >
          <Icon type="md-people" /><br />多租户</a
        >
        <a
          target="_blank"
          @click="
            () => {
              this.$router.push({ path: '/document/netCoreDev' });
            }
          "
        >
          <Icon type="ios-people" /><br />多角色</a
        >
        <a
          target="_blank"
          @click="
            () => {
              this.$router.push({ path: '/document/netCoreDev' });
            }
          "
        >
          <Icon type="ios-paper-outline" /><br />分库多数据库</a
        >
        <a target="_blank" href="http://v2.volcore.xyz/">
          <Icon type="md-apps" /><br />框架Vue2.x版本</a
        >
        <a target="_blank" href="http://www.volcore.xyz/">
          <Icon type="md-apps" /><br />框架Vue3.x版本</a
        >
        <a
          target="_blank"
          @click="
            () => {
              this.$router.push({ path: '/document/netCoreDev' });
            }
          "
        >
          <Icon type="ios-globe-outline" /><br />国际化</a
        >
        <a
          target="_blank"
          @click="
            () => {
              this.$router.push({ path: '/document/issue' });
            }
          "
        >
          <Icon type="ios-help-circle-outline" /><br />常见问题</a
        >
      </div>
      <!-- <div style="margin-bottom:20px;">     <a target="_blank"
           style="    border-bottom: 1px solid;
    font-size: 20px;
    padding: 20p;
    margin: 25px"
           @click="()=>{ this.$router.push({ path: '/document/netCoreDev' });}">多租户、多角色、分库多数据库、Oracle数据库、国际化</a></div>
      <div class="g-p">  <a target="_blank"
         style="    border-bottom: 1px solid;
    margin: 0px 26px;
    font-size: 26px;"
         href="http://donate.volcore.xyz">项目赞助</a>
      <a style="    border-bottom: 1px solid;
    margin: 0px 26px;
    font-size: 26px;">QQ群:45221949</a></div> -->
      <div
        style="
          font-size: 15px;
          background: #eee;
          border-radius: 5px;
          padding: 14px;
          line-height: 1.8;
        "
      >
        <p>
          1、框架现在分vue2.x与vue3.x版本，vue3.x版本使用的是element plus组件
        </p>
        <p>2、vue2.x与vue3.x版本都会独立维护，暂不支持框架vue2.x版本升级</p>
        <p>
          3、vue2.x与vue3.x使用同一套文档(因涉及文档问题，vue3.x版本示例大部份还是使用的vue2语法,通用组件一半以上是用的vue3语法，你也可以用vue3语法)
        </p>
      </div>
      <h2
        style='box-sizing:border-box;-webkit-tap-highlight-color:transparent;padding:2px 20px;border-radius:6px;color:#EBEBEB;font-family:"background:#00BCD4;font-size:20px;line-height:37px;white-space:normal;margin:18px 0px !important;'
      >
        <span style="display: none"></span>
        <span style="color: #666666">开发及依赖环境</span>
      </h2>
      <p>
        <span style="color: #666666">
          <span style="display: none"></span>
          <span style="display: none"></span>
          <strong>
            <span style="color: #000000">
              &nbsp; &nbsp; &nbsp;
              <span style="color: #e56600"
                >&nbsp;如果需要后台开发，请将VS2019更新至最新版本</span
              >
            </span>
          </strong>
          <span style="display: none"></span>
          <span style="display: none"></span>
        </span>
      </p>
      <p>
        <span style="color: #666666"></span>
      </p>
      <ul
        style="
          font-family: 微软雅黑;
          font-size: 13px;
          white-space: normal;
          padding-left: 30px;
        "
      >
        <li>
          <span style="line-height: 3; font-size: 16px"
            >后台：VS2019、.NetCore3.1
            、EFCore3.1、JWT、Dapper、Autofac、SqlServer/MySql/PGSql/Oracle、Redis(可选)</span
          >
        </li>
        <li>
          <span style="line-height: 3; font-size: 16px"
            >前端：VSCode、Vue2.0（webpack、node.js,没有环境的搜:vue webpack
            npm)、Vuex、axios、promise、IView、Element-ui</span
          >
        </li>
      </ul>
      <p>
        <br />
      </p>
      <h2
        id="#1-1"
        style='box-sizing:border-box;-webkit-tap-highlight-color:transparent;padding:2px 20px;border-radius:6px;color:#EBEBEB;font-family:"background:#00BCD4;font-size:20px;line-height:37px;white-space:normal;margin:18px 0px !important;'
      >
        <span style="color: #666666">启动项目</span>
      </h2>
      <ul
        style="
          font-family: 微软雅黑;
          font-size: 13px;
          white-space: normal;
          box-sizing: border-box;
          -webkit-tap-highlight-color: transparent;
          margin: 0px;
          padding: 5px 30px;
        "
      >
        <li style="padding-left: 26px; list-style: none">
          <span style="color: #e56600"
            >运行前先看后台appsettings.json配置属性说明；(注意修改DbType属性，修改为自己使用的数据库,数据库脚本在DB文件夹下)</span
          >
        </li>
        <li
          style="
            box-sizing: border-box;
            -webkit-tap-highlight-color: transparent;
            margin: 0px;
            padding: 0px;
          "
        >
          <span style="line-height: 3; font-size: 16px"
            >1、启动后台项目：后端项目路径&nbsp;
            ../VOL.WebApi，找到dev_run.bat命令点击启动。后台启动</span
          >
          <span
            style="
              box-sizing: border-box;
              -webkit-tap-highlight-color: transparent;
              line-height: 3;
              font-size: 14px;
            "
          >
            <span style="font-size: 16px">默认端口是9991。</span>
          </span>
        </li>
        <li style="padding-left: 26px; list-style: none">
          <span style="color: #03a9f4"
            >(dev_run.bat如果闪退，请使用cmd切换至 ../VOL.WebApi目录下执行dotnet
            run看异常信息)</span
          >
        </li>

        <li style="padding-left: 26px; list-style: none">
          <span style="color: #e56600"
            >如从没执行过npm
            install命令，使用cmd命令切换至前端Vue项目../VOL.Vue路径下,执行npm
            install命令</span
          >
        </li>
        <li
          style="
            box-sizing: border-box;
            -webkit-tap-highlight-color: transparent;
            margin: 0px;
            padding: 0px;
          "
        >
          <span style="line-height: 3; font-size: 16px">
            2、启动前端项目：前端Vue项目路径 ../VOL.Vue ，&nbsp;
            <span
              style="
                font-family: 微软雅黑;
                font-size: 16px;
                white-space: normal;
              "
              >找到</span
            >
            <span
              style="
                font-family: 微软雅黑;
                font-size: 16px;
                white-space: normal;
              "
            >
              <span
                style="
                  font-family: 微软雅黑;
                  font-size: 16px;
                  white-space: normal;
                "
                >run.bat</span
              >命令点击启动 </span
            >。
          </span>
        </li>
        <li style="padding-left: 26px; list-style: none">
          <span style="color: #03a9f4"
            >(run.bat如果闪退,说明环境没配置好，请使用cmd切换至
            ../VOL.Vue目录下执行npm run dev看异常信息)</span
          >
        </li>
        <li
          style="
            box-sizing: border-box;
            -webkit-tap-highlight-color: transparent;
            margin: 0px;
            padding: 0px;
          "
        >
          <span style="line-height: 3; font-size: 14px">
            <span style="font-size: 16px"
              >3、输入http://localhost:8080访问（本地超级管理员帐号：admin
              密码:123456）</span
            >
          </span>
        </li>
        <li
          id="#2"
          style="
            box-sizing: border-box;
            -webkit-tap-highlight-color: transparent;
            margin: 0px;
            padding: 0px;
          "
        >
          <span style="line-height: 3; font-size: 14px; color: red">
            <span style="font-size: 20px; font-weight: bolder；"
              >项目启动报错/登陆页面报错</span
            >
          </span>
        </li>
        <li
          style="
            box-sizing: border-box;
            -webkit-tap-highlight-color: transparent;
            margin: 0px;
            padding: 0px;
          "
        >
          <span style="line-height: 3; font-size: 14px; color: red">
            <span style="font-size: 16px"
              >1、登陆页面一直登陆中不跳转：数据库连接没配置好,在appsettings.json中重新配置，或者可以调试查看具体错误，后台调试方法见文档：【后台开发】->【调试】</span
            >
          </span>
        </li>
        <li
          style="
            box-sizing: border-box;
            -webkit-tap-highlight-color: transparent;
            margin: 0px;
            padding: 0px;
          "
        >
          <span style="line-height: 3; font-size: 14px; color: red">
            <span style="font-size: 16px"
              >2、登陆页面【网络出了点问题】：检查浏览器控制台是否有异常输出跨域问题；数据库连接没配置，见上面第一步</span
            >
          </span>
        </li>
        <li
          style="
            box-sizing: border-box;
            -webkit-tap-highlight-color: transparent;
            margin: 0px;
            padding: 0px;
          "
        >
          <span style="line-height: 3; font-size: 14px; color: red">
            <span style="font-size: 16px"
              >3、项目启动报错：.netcore.xxx表不存在(手动将数据库表改成大写开头,与代码的Model大小写一致即可)</span
            >
          </span>
        </li>
        <li
          id="#2-1"
          style="
            box-sizing: border-box;
            -webkit-tap-highlight-color: transparent;
            margin: 0px;
            padding: 0px;
          "
        >
          <span style="line-height: 3; font-size: 14px; color: red">
            <span style="font-size: 16px"
              >4、项目启动报错：点击登陆提示网络出错(如果是mysql数据库，请确认appsettings.json配置中DBType是否改为了MySql)</span
            >
          </span>
        </li>
        <li
          style="
            box-sizing: border-box;
            -webkit-tap-highlight-color: transparent;
            margin: 0px;
            padding: 0px;
          "
        >
          <span style="line-height: 3; font-size: 14px; color: red">
            <span style="font-size: 16px"
              >5、项目启动报错：后台控制台提示不支持allowPublicKeyRetrieval(见上面appsettings.json配置中DBType是否改为了MySql，数据库字符串配置去掉此属性)</span
            >
          </span>
        </li>
        <li
          style="
            box-sizing: border-box;
            -webkit-tap-highlight-color: transparent;
            margin: 0px;
            padding: 0px;
          "
        >
          <span style="line-height: 3; font-size: 14px; color: red">
            <span style="font-size: 16px"
              >6、EntityFramework Core3.1不再支持
              Sqlserver2008，请使用2008以上的数据库或使用mysql</span
            >
          </span>

                <div style="line-height:1.2;  color: red">
            <span style="font-size: 20px"
              >7、如果能看到验证码但点击登陆提示服务器异常，原因就是数据库没连上，请检查配置文件的链接，或者将后台错误信息返回(ExceptionHandlerMiddleWare.cs文件中将new { message = "~服务器没有正确处理请求,请稍等再试!", status = false }改为new { message = message, status = false })</span
            >
          </div>
        </li>
      </ul>
      <br />

      <h2
        id="#3"
        style='padding-left: 24px;white-space:normal;box-sizing:border-box;-webkit-tap-highlight-color:transparent;padding:2px 20px;border-radius:6px;font-family:"background:#00BCD4;font-size:20px;line-height:37px;margin:18px 0px !important;'
      >
        <span>
          <span style="color: #666666">快速上手</span>
          <span style="display: none"></span>
        </span>
      </h2>

      <p></p>
      <ul style="padding-left: 24px">
        <li>
          <span style="font-size: 16px; line-height: 3">
            <span style="display: none"></span
            >前端需要了解模块化开发、vue基础语法：router、component及子父组件传参、slot、ref、props
          </span>
        </li>
        <li>
          <span style="font-size: 16px; line-height: 3">
            <span style="display: none"></span
            >文档【代码生成】:先用代码生成器生成完整代码
          </span>
        </li>
        <li>
          <span style="font-size: 16px; line-height: 3"
            >编写扩展业务代码:文档->[前端开发]->[后台开发]->[组件api(ViewGrid组件)]</span
          >
        </li>
        <li>
          <span style="font-size: 16px; line-height: 3"
            >编写扩展业务代码涉及组件:ViewGird.vue、VolForm.vue、VolTable.vue、VolBox.vue、VolUpload,根据需要找这几个组件参数即可</span
          >
        </li>
      </ul>
      <p>
        <br />
      </p>

      <h2
        id="#4"
        style='box-sizing:border-box;-webkit-tap-highlight-color:transparent;padding:2px 20px;border-radius:6px;color:#EBEBEB;font-family:"background:#00BCD4;font-size:20px;line-height:37px;white-space:normal;margin:18px 0px !important;'
      >
        <span style="color: rgb(232, 27, 12)">端口配置变更注意事项</span>
      </h2>
      <ul
        style="
          font-family: 微软雅黑;
          font-size: 13px;
          white-space: normal;
          box-sizing: border-box;
          -webkit-tap-highlight-color: transparent;
          margin: 0px;
          padding: 5px 30px;
        "
      >
        <li
          style="
            box-sizing: border-box;
            -webkit-tap-highlight-color: transparent;
            margin: 0px;
            padding: 0px;
          "
        >
          <span style="line-height: 3; font-size: 14px">
            <span style="font-size: 16px"
              >如果修改了前端启动端口(默认8080)，同时需要修改后台appsettings.json配置属性CorsUrls跨域</span
            >
          </span>
        </li>
        <li
          style="
            box-sizing: border-box;
            -webkit-tap-highlight-color: transparent;
            margin: 0px;
            padding: 0px;
          "
        >
          <span style="line-height: 3; font-size: 14px">
            <span style="font-size: 16px"
              >如果修改了后台端口(默认9991,在后台Program.cs中配置)，同时需要修改前端http.js配置development对应url</span
            >
          </span>
        </li>
        <li
          style="
            box-sizing: border-box;
            -webkit-tap-highlight-color: transparent;
            margin: 0px;
            padding: 0px;
          "
        >
          <span style="line-height: 3; font-size: 14px; color: red">
            <span style="font-size: 16px"
              >不要在vs里直接启动动项目(vs启动项目不能实时编译,前端调用后台的url也访问不了)，按照【启动项目】来操作</span
            >
          </span>
        </li>
        <li
          style="
            box-sizing: border-box;
            -webkit-tap-highlight-color: transparent;
            margin: 0px;
            padding: 0px;
          "
        >
          <span style="line-height: 3; font-size: 14px">
            <span style="font-size: 16px"
              >点击登陆没有反应，请参照是否有上面操作的修改</span
            >
          </span>
        </li>
      </ul>
      <p>
        <span>
          <span style="font-size: 16px">
            <span style="display: none"></span>
            <br />
          </span>
        </span>
      </p>

      <h2
        id="#5"
        style='padding-left: 24px;white-space:normal;box-sizing:border-box;-webkit-tap-highlight-color:transparent;padding:2px 20px;border-radius:6px;font-family:"background:#00BCD4;font-size:20px;line-height:37px;margin:18px 0px !important;'
      >
        <span>
          <span style="color: #666666">项目发布</span>
          <span style="display: none"></span>
        </span>
      </h2>
      <ul style="padding-left: 24px">
        <li>
          <p style="font-size: 16px; line-height: 3; color: red">发布后台</p>
          <p style="font-size: 16px; line-height: 3">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            1、直接右击发布(发布方法，选文件系统即可)，发布完成后，将upload文件夹复制到发布后的路径
          </p>
          <p style="font-size: 16px; line-height: 3">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2、配置跨域,发布后的文件夹下，配置appsettings.json属性CorsUrls,将部署好的前端vue站点url添加到CorsUrls中
          </p>
          <p style="font-size: 16px; line-height: 3">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3、部署后台项目站点
          </p>
          <p style="font-size: 16px; line-height: 3; color: red">
            部署IIS上需要安装Runtime(linux上也需要),否则站点打不开<a
              href="https://dotnet.microsoft.com/download/dotnet/thank-you/runtime-aspnetcore-3.1.8-windows-hosting-bundle-installer"
              target="_blank"
            >
              点击下载3.1.8 hosting </a
            >,下载安装完成后重启IIS，或者使用cmd输入iisreset重启
          </p>
        </li>
        <li>
          <span style="font-size: 16px; line-height: 3; color: red"
            >发布前端</span
          >
          <p style="font-size: 16px; line-height: 3">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            1、修改src\api\http.js文件，修改process.env.NODE_ENV
            配置：axios.defaults.baseURL
            ='部署的后台地址'，如：http://132.232.2.109:9991
          </p>
          <p style="font-size: 16px; line-height: 3">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            2、执行前端发布：../vol.vue/目录下双击build.bat运行，发布完成后的项目在dist文件夹里
          </p>
        </li>
        <li>
          <p style="font-size: 16px; line-height: 3; color: red">访问报错</p>
          <p style="font-size: 16px; line-height: 3">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            1、确认后台部署的站点能不能打开
          </p>
          <p style="font-size: 16px; line-height: 3">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            2、确认后台appsettings.json中是否配置跨域。(修改配置后，重启下后台项目)
          </p>
          <p style="font-size: 16px; line-height: 3">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            3、在部署的后台项目文件夹下，修改web.config属性stdoutLogEnabled="true"，当前目录下新建一个空文件夹logs,再直接访问后台接口，查看logs日志
          </p>
          <p style="font-size: 16px; line-height: 3">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            4、如果logs文件夹下没有日志，查数据库sys_log表或Logger\Queue\路径下日志
          </p>
        </li>
        <li>
          <span style="font-size: 16px; line-height: 3; color: red"
            >前端刷新页面404报错</span
          >
          <p style="font-size: 16px; line-height: 3">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            1、修改前端route文件夹下index.js文件，将 mode: 'history'改为
            history: true
          </p>
        </li>
      </ul>
      <h2
        id="#5-1"
        style='padding-left: 24px;white-space:normal;box-sizing:border-box;-webkit-tap-highlight-color:transparent;padding:2px 20px;border-radius:6px;font-family:"background:#00BCD4;font-size:20px;line-height:37px;margin:18px 0px !important;'
      >
        <span>
          <span style="color: #666666">前后台发布在一起</span>
          <span style="display: none"></span>
        </span>
      </h2>
      <div style="font-size: 16px; line-height: 2; padding-left: 20px">
        <div>2021.12.12更新Startup.cs文件后才能使用</div>
        将前端发布后的dist文件里面的内容(只要复制dist里面的内容)直接放到wwwroot文件下即可(前端http.js里面的ipaddress值改为/)
      </div>
      <div style="color: red">
        注意：如果是vue3版本请将Startup.cs中的app.UseDefaultFiles();注释掉
      </div>
      <h2
        id="#6"
        style='box-sizing:border-box;-webkit-tap-highlight-color:transparent;padding:2px 20px;border-radius:6px;color:#EBEBEB;font-family:"background:#00BCD4;font-size:20px;line-height:37px;white-space:normal;margin:18px 0px !important;'
      >
        <span style="color: rgb(232, 27, 12)">项目更新</span>
      </h2>
      <ul
        style="
          font-family: 微软雅黑;
          font-size: 13px;
          white-space: normal;
          box-sizing: border-box;
          -webkit-tap-highlight-color: transparent;
          margin: 0px;
          padding: 5px 30px;
        "
      >
        <li
          style="
            box-sizing: border-box;
            -webkit-tap-highlight-color: transparent;
            margin: 0px;
            padding: 0px;
          "
        >
          <span style="line-height: 3; font-size: 14px">
            <span style="font-size: 16px"
              >直接覆盖文件：后台VOL.Core类库、VOL.Builder类库，前端：components->basic、builder文件夹，common.js</span
            >
          </span>
        </li>
        <li
          style="
            box-sizing: border-box;
            -webkit-tap-highlight-color: transparent;
            margin: 0px;
            padding: 0px;
          "
        >
          <span style="line-height: 3; font-size: 14px; color: red"
            >注意：在没有修改过上面的文件才能直接覆盖，如果有修改请对比文件差异</span
          >
        </li>
        <li
          style="
            box-sizing: border-box;
            -webkit-tap-highlight-color: transparent;
            margin: 0px;
            padding: 0px;
          "
        >
          <span style="line-height: 3; font-size: 14px">
            <span style="font-size: 16px"
              >其他文件更新：后台：VOL.System类库,Template文件夹；前端：main.js、views->index.vue、login.vue、router文件夹，根据需要更新，不更新也没影响</span
            >
          </span>
        </li>
      </ul>
      <p>
        <span>
          <span style="font-size: 16px">
            <span style="display: none"></span>
            <br />
          </span>
        </span>
      </p>
      <h2
        id="#7"
        style='box-sizing:border-box;-webkit-tap-highlight-color:transparent;padding:2px 20px;border-radius:6px;color:#EBEBEB;font-family:"background:#00BCD4;font-size:20px;line-height:37px;white-space:normal;margin:18px 0px !important;'
      >
        <span style="color: #666666">
          功能介绍
          <span style="display: none"></span>
        </span>
      </h2>
      <p></p>
      <table border="0" cellspacing="0" cellpadding="0" class="ke-zeroborder">
        <tbody>
          <tr>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 170px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="display: none"></span>
              <span style="display: none"></span>
              <span style="display: none"></span>
              <span style="color: #666666; font-size: 16px">
                <strong>功能</strong>
              </span>
              <span style="display: none"></span>
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 16px">
                <strong>描述</strong>
              </span>
              <span style="display: none"></span>
              <span style="display: none"></span>
              <span style="display: none"></span>
              <span style="display: none"></span>
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 90px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 16px">
                <strong>状态</strong>
              </span>
              <span style="display: none"></span>
            </td>
          </tr>
          <tr>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px">用户管理</span>
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px"
                >登陆、密码修改</span
              >
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px">√</span>
            </td>
          </tr>
          <tr>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px">角色管理</span>
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px">角色管理</span>
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px">√</span>
            </td>
          </tr>
          <tr>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px">权限分配</span>
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px"
                >用户基础权限分配，后台支持多种权限控制方式,也可自行定义</span
              >
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px">√</span>
            </td>
          </tr>
          <tr>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px"
                >用户权限/菜单静态化处理</span
              >
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px"
                >对用户权限/菜单在本地服务器作静态化处理,只有在用户权限/菜单变化时才刷新redis缓存</span
              >
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px">√</span>
            </td>
          </tr>
          <tr>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px">JWT认证</span>
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px"
                >采用前台端分离JWT认证，并且支持JWT过期动态刷新</span
              >
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px">√</span>
            </td>
          </tr>
          <tr>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px"
                >异步队列批量写日志</span
              >
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px"
                >框架封装了一个异步队列批量写入日志</span
              >
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px">√</span>
            </td>
          </tr>
          <tr>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px">Repository</span>
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px"
                >Repository作为数据提供，提供了常用EF方法封装</span
              >
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px">√</span>
            </td>
          </tr>
          <tr>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px"
                >前端常用组件封装</span
              >
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px"
                >此框架主要围绕表单组件进行开发，并且封装的组件都支持扩展</span
              >
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px">√</span>
            </td>
          </tr>
          <tr>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px">基础业务实现</span>
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px"
                >已实现(表/主从表)的增、删、改、查、导入、导出、审核基础功能(前提建一张带主键的mysql/sqlserver表),这些基础业务不要写任何代码，直接用代码生成器生成即可，并且生成的代码支持其他业务代码扩展</span
              >
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px">√</span>
            </td>
          </tr>
          <tr>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px">代码生成器</span>
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px"
                >代码生成器为可视化配置，提供了可配置属性的20多种，所有基础功能只需要勾选确认，生成的代码包括Vue/Vue扩展文件/路由,后台表相关的类(控制器/扩展控制器,业务接口/扩展业务接口,接口实现/扩展接口实现类)，支持单表表单、主从表单的代码生成</span
              >
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px">√</span>
            </td>
          </tr>
          <tr>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px"
                >数据源预先配置</span
              >
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px"
                >数据源作为前端下拉框/多选框的字典项源，支持key/value配置及sql从数据源加载配置</span
              >
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px">√</span>
            </td>
          </tr>
          <tr>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px">
                表单数据源自动绑定
                <span style="display: none"></span>
              </span>
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px"
                >如果一个表单带有多个下拉框，这里只需要配置数据源编号即可自动绑定</span
              >
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px">√</span>
            </td>
          </tr>
          <tr>
            <td>
              <span style="font-size: 14px">
                可配置的后台参数验证
                <span style="display: none"></span>
              </span>
            </td>
            <td>
              直接配置后台模型、参数验证，支持指定参数名验证、指定model字段验证，省去在代码中写if
              else判断
            </td>
            <td>
              <span style="color: #666666; font-size: 14px">√</span>
            </td>
          </tr>
          <tr>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px"
                >Redis/Memory缓存</span
              >
              <span style="display: none"></span>
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px"
                >已对Redis/Memory封装直接使用即可</span
              >
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px">√</span>
            </td>
          </tr>
          <tr>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px">Dapper</span>
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px"
                >已对Dapper封装直接使用即可</span
              >
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px">√</span>
            </td>
          </tr>
          <tr>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px">扩展方法</span>
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px"
                >框架封装了大量的扩展方法,如：通用实体校验(框架所有实现校验全部依赖于此扩展)扩展、string扩展、object扩展、表达式生成/解析扩展、文件操作扩展等</span
              >
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px">√</span>
            </td>
          </tr>
          <tr>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px">H5开发</span>
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px"
                >可支持直接开发并部署H5页面&nbsp;</span
              >
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px">√</span>
            </td>
          </tr>
          <tr>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px">分库、多数据</span>
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px"
                >分库、多数据操作</span
              >
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px">√</span>
            </td>
          </tr>
          <tr>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px">静态页面发布</span>
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px"
                >后台发布并生成可浏览的静态页面</span
              >
              <span style="display: none"></span>
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px; white-space: normal"
                >√</span
              >
              <br />
            </td>
          </tr>
          <tr>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px">多租户</span>
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            ></td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px">√</span>
              <span style="display: none"></span>
            </td>
          </tr>
          <tr>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px">消息推送</span>
            </td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            ></td>
            <td
              style="
                box-sizing: border-box;
                -webkit-tap-highlight-color: transparent;
                margin: 0px;
                padding: 7px;
                color: rgba(111, 93, 93, 0.87);
                font-size: 13px;
                border-collapse: collapse;
                min-width: 60px;
                border: 1px solid #d4d1d1;
              "
            >
              <span style="color: #666666; font-size: 14px">x</span>
              <span style="display: none"></span>
            </td>
          </tr>
        </tbody>
      </table>
      <span style="background-color: #ffffff">
        <span style="display: none"></span>
        <br />
      </span>

      <span style="display: none"></span>
    </div>
  </div>
</template>
<script>
import "./doc.less";
export default {
  data() {
    return {
      activedIndex: 0,
      list: [
        {
          id: "#1-1",
          name: "Vue3版本",
        },
        {
          id: "#1-1",
          name: "启动项目",
        },
        {
          id: "#2",
          name: "启动报错",
        },
        {
          id: "#3",
          name: "快速上手",
        },
        {
          id: "#4",
          name: "端口变更",
        },
        {
          id: "#5",
          name: "项目发布",
        },
        {
          id: "#5-1",
          name: "前后台发布在一起",
        },
        {
          id: "#6",
          name: "项目更新",
        },
        {
          id: "#7",
          name: "功能介绍",
        },
      ],
    };
  },
  methods: {
    to(index) {
      this.activedIndex = index;

      let top = document.getElementById(this.list[index].id).offsetTop - 100;
      if (index == 0) {
        top = 0;
      }
      window.scrollTo(0, top);
    },
  },
};
</script>
<style lang="less" scoped>
table {
  border-collapse: collapse;
  tr {
  }
  tr:first-child {
    background: #f5f5f5;
  }
  td {
    padding: 12px 13px !important;
    border: 1px solid #dfe2e5 !important;
    border-collapse: collapse;
  }
}
.g-left {
  border-right: 1px solid #e8e8e8;
  margin-right: 10px;
  width: 180px;
  position: fixed;
  padding-left: 20px;
  .n-item {
    text-align: left;
    padding-right: 15px;
    list-style: none;
    a {
      font-size: 15px;
      color: #737070;
      line-height: 40px;
      height: 40px;
      margin: 0;
      padding: 0;
      text-decoration: none;
      display: block;
      position: relative;
      -webkit-transition: 0.15s ease-out;
      transition: 0.15s ease-out;
    }
  }
}
.actived a {
  color: #2196f3 !important;
}
.avd1,
.avd2 {
  position: fixed;
  right: 10px;
  img {
    width: 270px;
  }
}
.avd2 {
  top: 250px;
}
.h-box {
  line-height: 50px;
  text-align: center;
  font-size: 20px;
  border-radius: 5px;
  margin-bottom: 20px;
  width: 900px;
  a {
    cursor: pointer;
    display: inline-block;
    padding: 25px 10px;
    height: 150px;
    width: 24%;
    border: 1px solid #eee;
    font-size: 16px;
    margin: 0px;
    color: #676767;
    margin-right: -6px;
    margin-bottom: -1px;
  }
  i {
    transition: transform 0.8s;
    font-size: 40px;
  }
  a:hover {
    background: #e8e8e8;
    i {
      transform: scale(1.2);
      font-size: 50px !important;
    }
  }
}
</style>
