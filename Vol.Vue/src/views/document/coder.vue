<template>
  <div class="coder-container">
    <div class="left">
      <ul v-for="(item,index) in nav"
          :key="index">
        <li @click="to(index)"
            :class="{actived:activedIndex==index,step:index>3&&index<10}">{{item}}</li>
      </ul>
    </div>
    <div class="right">
            <h1 class="big-text">如果生成代码出现问题或不能跑起来，请把此文档重新仔细看一遍!!!</h1>
      <div id="doc-0"
           class="coder-doc">
        <div class="title">
          <h2>使用代码生成器可实现的功能</h2>
        </div>
        <ul class="coder-group">
          <li class="coder-list">代码生成器可自动完成基本功能的实现,不需要写代码,包括：</li>
          <li class="coder-list">单表/主从表：查询、删除、新增、修改、导入、导出、审核、表单/table数据源自动绑定</li>
          <li class="coder-list">单表/主从表自动生成前端及后台代码,不需要写任何代码,并支持前后端扩展实现复杂的功能</li>
          <li class="coder-list">一对多暂未实现,需要自己写扩展</li>
        </ul>
      </div>
      <div id="doc-1"
           class="coder-doc">
        <div class="title">
          <h2>使用代码生成器前需要准备的工作</h2>
        </div>
        <ul class="coder-group">
          <li class="coder-list"
              v-for="(item,index) in codeRequire"
              :key="index">{{item.text}}</li>
        </ul>
      </div>
      <div id="doc-2"
           class="coder-doc">
        <div class="title">
          <h2>主从(明细)表生成代码需要注意</h2>
        </div>
        <ul class="coder-group">
          <li class="coder-list">明细表的外键必须是主表的主键字段,可参照SellOrder的明细表SellOrderList的外建</li>
          <li class="coder-list">主从表代码生成步骤都是一样，在生成主表前需要先将从表按现有步骤生成</li>
          <li class="coder-list">在主表生成配置页面填上【明细表名】与【明细表中文名】,点击生成vue页面、model、业务类即可完成主从页面代码的生成</li>
          <li class="coder-list">代码生成器中可以不用生成从表vue页面</li>
        </ul>
      </div>
      <br />
      <br />

      <h2 style="color:red;font-weight: 500; margin-bottom: 20px;">1、创建mysql表，只有字段类型是guid时设置成char(36),其他字段的长度都不要设置成长度36，否则会替换成guid类型</h2>
      <h2 style="color:red;font-weight: 500; margin-bottom: 20px;">2、数据库字段不要设置类型bit(bool)，请用int或byte替代</h2>
      <p>
        <Alert style=" line-height: 2.5;   width: 900px;">
          生成代码时项目启动（必看）
          <template slot="desc">
            <p>1、按项目启动文档启动项目即可</p>
            <p style="color:red;">2、后台请运行 ../VOL.WebApi/builder_run.bat命令，如果不需要生成业务类运行dev_run.bat即可(第一次生成某张表代码时候才需要运行builder_run.bat)</p>
          </template>
        </Alert>

      </p>

      <h2 style="color:red;font-weight: 500; margin-bottom: 15px;">生成代码后，查询框或弹出编辑框是空的，请看代码生成第3步说明</h2>
      <h2 style="color:red;font-weight: 500; margin-bottom: 15px;">生成代码后，打开页面异常，请看代码生成第6步说明</h2>
      <div id="doc-3"
           class="coder-doc">
        <h1 style="    margin-bottom: 20px;">生成代码</h1>
        <div class="title">
          <h2>1、选择菜单：在线代生成器->Vue+后台代码生成</h2>
        </div>
        <ul class="coder-group">
          <li class="coder-list">点击新建,弹出选择框，如果只是做修改跳过此步，直接修改页面配置后点保存，再点各种生成操作</li>
          <li class="coder-img"
              @click="preview('https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/doc/step1.png')">
            <img src="https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/doc/step1.png" />
          </li>
        </ul>
      </div>

      <div id="doc-4"
           class="coder-doc">
        <div class="title">
          <h2>2、填写需要生成表或视图的信息</h2>
        </div>
        <ul class="coder-group">
          <li class="coder-list">点击确认，自动从后台加载表结构信息(如果只是生成空菜单,里面就随便填)</li>
          <li class="coder-list">项目命名空间：代码生成时所放在类库(现框架采用一个模块为一个类库，可自行决定是否需要增加类库)</li>
          <li class="coder-list">项目文件夹：生成的文件放在文件夹,此文件夹由代码生成器创建,不需要手动创建</li>
          <li class="coder-list">表名:可以是视图或表,名字必须和数据库一样</li>
          <li class="coder-list">如果只想创建一个空菜单，上面表名随便填写</li>
          <li class="coder-img"
              @click="preview('https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/doc/step2.png')">
            <img src="https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/doc/step2.png" />
          </li>
        </ul>
      </div>
      <div id="doc-5"
           class="coder-doc">
        <div class="title">
          <h2>3、配置表结构信息</h2>
        </div>
        <ul class="coder-group">
          <li class="coder-list"
              style="color:red;">根据需要配置下面表格中的查询与新建、编辑信息 (不设置编辑、新建行，编辑或查询时，弹出框是空白的)</li>
          <li class="coder-list">表别名：别名将替代原表名生成的Model与业务类。一个表只能有一个别名，默认表名与别名相同。若用别名,必须将已经生成文件删除</li>
          <li class="coder-list">点击保存、生成Vue页面、生成Model、生成业务类即可(每次修改信息后都需要点击保存)。</li>
          <li class="coder-list"
              style="color:#0b906d;">Vue视图绝对路径：生成Vue页面必须指定此路径，路径为当前Vue项目的views文件夹，如E:/VOL.Vue/src/views</li>
          <li class="coder-img"
              @click="preview('https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/doc/sep3.png')">
            <img src="https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/doc/sep3.png" />
          </li>
        </ul>
      </div>
      <div id="doc-6"
           class="coder-doc">
        <div class="title">
          <h2>4、查看生成完的代码</h2>
        </div>
        <ul class="coder-group">
          <li class="coder-list">生成完成后在vs中搜索当前表就能看到生成的代码了</li>
          <li class="coder-list">vue代码也同时生成了,可在vscode中搜索当前文件(文件名都是以当前表名开头)</li>
          <li class="coder-img">
            <img style=" width: 300px;"
                 src="https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/doc/sep4.png" />
            <img style=" width: 300px;"
                 src="https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/doc/sep4x.png" />
          </li>
        </ul>
      </div>

      <div id="doc-7"
           class="coder-doc">
        <div class="title">
          <h2>5、菜单配置</h2>
        </div>
        <ul class="coder-group">
          <li class="coder-list">Url:通过VsCode打开vue项目,找到router文件夹下viewGird.js找当前生成表的path属性/SellOrder就是配置菜单需要配置的url,直接复制过来即可</li>
          <li class="coder-list">表名:在生成代码时填写的表名或视图名，必须一致，否则权限验证通不过</li>
          <li class="coder-img"
              @click="preview('https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/doc/sep5.png')">
            <img src="https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/doc/sep5.png" />
          </li>
        </ul>
      </div>

      <div id="doc-8"
           class="coder-doc">
        <div class="title">
          <h2>6、查看生成的页面</h2>
        </div>
        <ul class="coder-group">
          <li class="coder-list"
              style="color:red;">确认后台项目运行的是路径 …/VOL.WebApi/dev_run.bat 文件,</li>
          <li class="coder-list">输入http://localhost:8080/sellOrder</li>
          <li class="coder-img"
              @click="preview('https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/doc/sep6.png')">
            <img src="https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/doc/sep6.png" />
          </li>
        </ul>
      </div>
      <div id="doc-9">
        <h1 style="padding: 15px 0;
    font-weight: 500;">代码生成器参数配置</h1>
      </div>
      <table>
        <tbody>
          <tr>
            <td>字段</td>
            <td>描述</td>
          </tr>
          <tr>
            <td>Id</td>
            <td>表Id</td>
          </tr>
          <tr>
            <td>父级Id</td>
            <td>表所放在位置</td>
          </tr>
          <tr>
            <td>项目命名空间</td>
            <td>将当前表生成的文件放在所选命名空间的类库中</td>
          </tr>
          <tr>
            <td>表中文名</td>
            <td>需要生成代码的表具体名</td>
          </tr>
          <tr>
            <td>表别名</td>
            <td>表别名：如果不想暴露真实表名，可以自行设置任何表别名，表别名将替代原表名生成的Model与业务类。一个表只能有一个别名，默认表名与别名相同，如果想使用别名，必须将已经生成过的文件删除</td>
          </tr>
          <tr>
            <td>实际表名</td>
            <td>用实际表名替换表名,&nbsp;具体功能未开发</td>
          </tr>
          <tr>
            <td>项目文件夹</td>
            <td>将当前表生成的文件放在所选命名空间类库下的文件夹(&nbsp;不需要人为创建)</td>
          </tr>
          <tr>
            <td>明细表中文名</td>
            <td>明细从表的中文名</td>
          </tr>
          <tr>
            <td>明细表名</td>
            <td>明细从表,&nbsp;用于生成主从表关系及UI,&nbsp;生成代码前,&nbsp;必须先生成明细表代码</td>
          </tr>
          <tr>
            <td>快捷编辑字段</td>
            <td>
              设置[快捷编辑字段]后，前台界面表格点击此链接可快速查看详细信息&nbsp;
              <img height="110"
                   src="https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/doc/link.png"
                   style="box-sizing:border-box;-webkit-tap-highlight-color:transparent;border-style:none;width:350px !important;margin-bottom:30px;margin-top:10px;" />
            </td>
          </tr>
          <tr>
            <td>排序字段</td>
            <td>前台表格的排序字段，如果不是自增的主键，必须设置此值</td>
          </tr>
          <tr>
            <td>Vue&nbsp;视图绝对路径</td>
            <td>生成Vue&nbsp;页面存放的位置，如：E:/project/views/ Vue&nbsp;页面生成后会放在此路径下</td>
          </tr>
        </tbody>
      </table>
      <div id="doc-10">
        <h1 style="padding: 15px 0;
    font-weight: 500;">代码生成器表结构配置</h1>
      </div>
      <table>
        <tbody>
          <tr>
            <td>字段</td>
            <td>描述</td>
          </tr>
          <tr>
            <td>列中文名</td>
            <td>表显示的中文名</td>
          </tr>
          <tr>
            <td>列名</td>
            <td>表列名</td>
          </tr>
          <tr>
            <td>列最大长度</td>
            <td>数据库设置的列长度&nbsp;如果使用的mysql数据库并且主键使用的是Guid，数据库字段类型应该设置为char 长度为36，否则生成实体Model时会与数据库类型对应不上</td>
          </tr>
          <tr>
            <td>数据类型</td>
            <td>C#&nbsp;属性的数据类型(&nbsp;除非数据库字段类型发生变,&nbsp;其他不需要修改)</td>
          </tr>
          <tr>
            <td>table列显示类型</td>
            <td>如果table的列存的是图片、excel或其他文件的路径，就选择此列的配置,如:列存的是为图片就选择img，如果是Excel文件的路径就选择excel，这一列在table上点击文件名时会自动下载文件</td>
          </tr>
          <tr>
            <td>可为空</td>
            <td>表字段是否可为null,&nbsp;此处会涉及前、后端验证规则，默认加载的是表结构</td>
          </tr>
          <tr>
            <td>排序号</td>
            <td>前端页面表格显示的顺序</td>
          </tr>
          <tr>
            <td>数据源</td>
            <td>如果字段对应的是下拉框或多选框，此处选择对应的数据源的字典编号,&nbsp;在菜单：下拉框绑定设置中配置数据源，具体可参照现有配置</td>
          </tr>
          <tr>
            <td>是否只读</td>
            <td>编辑或新建时，如果此字段为只读，则不可修改</td>
          </tr>
          <tr>
            <td>编辑行、编辑列</td>
            <td>新建/编辑时，此字段所在的行与列，如行=1&nbsp;，列=2&nbsp;，则界面所在位置为第1&nbsp;行第2&nbsp;列(此配置直接决定表的编辑或新建字段,不在此配置中的字段，编辑或新建时都会被过滤移除)&nbsp;编辑行修改后需要点击【生成model】,如果只想编辑，界面不想显示，编辑行设置为0</td>
          </tr>
          <tr>
            <td>编辑类型</td>
            <td>新建/&nbsp;编辑时标签的类型，如日期标签，下拉框，text&nbsp;等</td>
          </tr>
          <tr>
            <td>colSize</td>
            <td>编辑、新建、查看时此字段显示的长度，如果设置的是12&nbsp;则，此字段独占一行，可选值1-12</td>
          </tr>
          <tr>
            <td>查询行、查询列</td>
            <td>查询时，此字段所在的行与列，如行=1&nbsp;，列=2&nbsp;，则界面所在位置为第1&nbsp;行第2&nbsp;列</td>
          </tr>
          <tr>
            <td>查询类型</td>
            <td>查询时标签的类型，如日期标签，下拉框，text&nbsp;等</td>
          </tr>
          <tr>
            <td>导入列、Api&nbsp;输入列，是否可为空、api&nbsp;输出列</td>
            <td>具体业务未实现</td>
          </tr>
          <tr>
            <td>主键</td>
            <td>
              设置是否为主键，必须一个主键
              <br />
            </td>
          </tr>
        </tbody>
      </table>

      <br />
      <br />
    </div>

    <Drawer :width="800"
            class="q-drawer"
            title="代码生成器使用常见问题"
            :closable="false"
            v-model="q_moel">
      <Alert type="success"
             show-icon>
        关于生成model
        <template slot="desc">
          <p>如果修改了编辑行或者编辑列，必须点生成model；如果只允许编辑，但不想显示出来，编辑行设置为0，再点生成model</p>
          <p>框架不支持多主键，如果有多个主键，在生成页面，主键列只勾选一个即可</p>
        </template>
      </Alert>
      <el-collapse v-model="activeName"
                   accordion>
        <el-collapse-item v-for="(item,index) in q_items"
                          :key="index"
                          :title="item.title"
                          :name="index+1">
          <div>{{item.desc}}</div>
        </el-collapse-item>
      </el-collapse>
    </Drawer>
  </div>
</template>
<script>
import "./doc.less";
export default {
  data () {
    return {
      activedIndex: 0,
      q_moel: false,
      activeName: "1",
      q_items: [
        {
          title: "编辑或查询弹出框空白",
          desc:
            "请配置编辑行或查询行,同时点击[生成vue页面],如果配置是编辑行，同时需要点击[生成model]"
        },
        {
          title: "编辑或新建,保存后数据没有变化",
          desc: "1、确认是否设置了编辑行；2、修改编辑行后需要点击【生成model】与生成vue页面，如果主从表，在主表上点击生成vue页面"
        },
        {
          title: "点击[生成业务类]异常",
          desc:
            "请双击运行后台项目.../VOL.WebApi/builder_run.bat命令,只有生成业务类时才需要运行此命令，其他操作运行dev_run.bat即可"
        },
        {
          title: "代码生成后,打开页面报错",
          desc:
            "代码生成后，如果页面报错，请确认后台运行的是.../VOL.WebApi/dev_run.bat命令"
        },
        {
          title: "select/selectList编辑时不能绑定默认值",
          desc:
            "原因在于如果自定义sql的key是数字与数据库字段的类型不一致时就可能导致绑定失败；解决办法：将自定义sql里key字段转换成字符串。"
        }
      ],
      nav: [
        "可实现功能",
        "常见问题",
        "准备工作",
        "主从(明细)生成代码",
        "1.开始生成代码",
        "2.填写表或视图信息",
        "3.配置表结构信息",
        "4.查看生成完的代码",
        "5.菜单配置",
        "6.查看生成的页面",
        "代码生成器参数配置",
        "代码生成器表结构配置"
      ],
      codeRequire: [
        {
          text:
            "先在数据库创建表，必须有主键,只能是自增Id或Guid，MySql数据库使用Guid请将字段设置为char长度36位"
        },
        {
          text:
            "表最好包括创建(修改)人、时间等字段，在新增或编辑时，框架会自动给这几个字段设置值"
        },
        {
          text:
            "字段格式要求参照后台项目appsettings.json中属性CreateMember、ModifyMember的说明"
        },
        { text: "参照项目启动,把项目跑起来" }
      ]
    };
  },
  methods: {
    preview (img) {
      window.open(img);
    },
    to (index) {
      this.activedIndex = index;
      if (index == 1) {
        this.q_moel = true;

        return;
      }

      let top = document.getElementById("doc-" + index).offsetTop - 100;
      if (index == 0) {
        top = 0;
      }
      window.scrollTo(0, top);
    }
  },
  created () {
  }
};
</script>
<style lang="less" scoped>
.coder-container {
  display: flex;
  .left {
    position: fixed;
    width: 170px;
    border-right: 1px solid #ececec;
    margin-right: 20px;
    li {
      cursor: pointer;
      list-style: none;
      font-size: 15px;
      padding: 13px 5px;
    }
    li.actived {
      color: #2196f3;
    }
  }
  .right {
    flex: 1;
    margin-left: 190px;
  }
}
.coder-doc {
  .title h2 {
    color: #1f1f1f;
    font-weight: 500 !important;
  }
  .title h2:before {
    content: "";
    display: inline-block;
    width: 4px;
    height: 4px;
    border-radius: 50%;
    vertical-align: middle;
    background-color: #5e6d82;
    margin-right: 5px;
  }
  .coder-group {
    // background: #e0fffb;
    border-radius: 5px;
    width: 900px;
    display: inline-block;
    padding: 15px 25px;
    box-shadow: 2px 0px 16px #e6e6e6;
    margin: 15px 40px;
  }
  .coder-list,
  .coder-img {
    font-size: 15px;
    margin-bottom: 10px;
    color: #5e6d82;
    list-style: none;
  }
  .coder-img img {
    cursor: pointer;
    width: 100%;
  }
  .coder-list:before {
    content: "";
    display: inline-block;
    width: 4px;
    height: 4px;
    border-radius: 50%;
    vertical-align: middle;
    background-color: #5e6d82;
    margin-right: 5px;
  }
}

.step {
  // padding-left: 20px !important;
  color: #797878;
  font-size: 12px !important;
}
//   .step:first {
//     margin-top: 15px;
//   }
//   .step:last-child {
//     margin-bottom: 15px;
//   }
@-webkit-keyframes shake {
    0% {
        opacity: 0.8;
    }
    50% {
        opacity: 0.4;
    }
    100% {
        opacity: 0.8;
    }
}

@keyframes shake {
    0% {
        opacity: 0.8;
    }
    50% {
        opacity: 0.4;
    }
    100% {
        opacity: 0.8;
    }
}
.big-text{
      background: #ffff29;
 width: 940px;
    text-align: center;
    padding: 20px;
    border-radius: 10px;
    border: 1px solid;
    margin-bottom: 19px;
    font-size: 28px;
    margin-top: 18px;
  color: red;
    -webkit-animation: shake 0.5s infinite;
    animation: shake 0.5s infinite;
}

</style>
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
</style>
