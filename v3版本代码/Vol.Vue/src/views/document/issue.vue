<template>
  <div>
    <div></div>
    <div class="i-container">
      <div class="nav">
        <el-scrollbar style="height:100%;">
          <ul>
            <li class="n-item" v-for="(item,index) in data" :key="index">
              <a
                :class="{active:active==index}"
                @click="scrollIntoView(index)"
              >{{item.secondTitle||item.title}}</a>
            </li>
          </ul>
        </el-scrollbar>
      </div>
      <div class="list">
        <Alert type="success" show-icon>
          提示
          <span slot="desc">
            在使用中过程中遇到问题或有好的建议可以在
            <a href="https://github.com/cq-panda/Vue.NetCore">GitHub</a>上提issue，此处也会不断更新常见问题..
          </span>
        </Alert>
        <div :id="'i-'+index" class="i-item" v-for="(item,index) in data" :key="index">
          <h3 :class="{active:active==index}">{{index+1}}.{{item.title}}</h3>
          <div class="desc">
            <ul>
              <li v-for="(d,_index) in item.desc" :key="_index">{{d.text}}</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import "./doc.less";
export default {
  methods: {
    scrollIntoView(index) {
      let top = document.getElementById("i-" + index).offsetTop - 100;
      if (index == 0) {
        top = 0;
      }
      window.scrollTo(0, top);
      this.active = index;
    }
  },
  data() {
    return {
      active: 0,
      data: [
        {
          title: "如何上手",
          desc: [
            {
              text:
                "先看下【代码生成】的步骤，参照前端SellOrder.js(可扩展完整示例页面),后台Sell->Partial->SellOrderService.cs编写自己的扩展业务"
            }
          ]
        },
        {
          title: "如何写扩展业务及组件",
          desc: [
            {
              text:
                "前端、后台扩展业务，只能在指定的位置编写，如：SellOrder表，后台业务在Sell->Partial->SellOrderService.cs编写，前端在SellOrder.js中编写"
            },
            {
              text:
                "1、后台扩展业务，参照Sell->Partial->SellOrderService.cs编写"
            },
            {
              text:
                "2、前端扩展业务，找到代码生成表的扩展js，如:SellOrder.js，在属性gridHeader、gridBody、gridFooter、modelHeader、modelBody、modelFooter中引入自己编写的组件路径，可参照SellOrder.js(可扩展完整示例页面)使用扩展业务的方式"
            }
          ]
        },
        {
          title: "如何获取自定义扩展的组件",
          desc: [
            {
              text:
                "1、代码生成后的表单页面，可以通过this.$refs.gridHeader、gridBody、gridFooter、modelHeader、modelBody、modelFooter拿到自己定义开发的组件，可参照SellOrder.js(可扩展完整示例页面)使用扩展业务的方式"
            },
            {
              text:
                "2、代码生成后的表单页面，可以通过自定扩展组件进行任何复杂操作,可参照SellOrder.js(可扩展完整示例页面)扩展"
            }
          ]
        },
        {
          title: "自定义扩展组件中获取父组件",
          desc: [
            {
              text:
                "获取父组件(ViewGird.vue也是代码生成后的页面上能看到的组件)， this.$emit('parentCall', $vue => { }) //$vue为父组件对象，具体使用参考order->GridHeaderExtend.vue文件"
            }
          ]
        },
        {
          title: "在页面添加自定义按钮",
          desc: [
            {
              text: "可参照SellOrder.js"
            }
          ]
        },
        {
          title: "使用EF、Daper、事务、缓存",
          desc: [
            {
              text: "Sell->Partial->SellOrderService.cs中有详细介绍"
            }
          ]
        },
        {
          title: "实体校验、常用扩展、日志",
          desc: [
            {
              text: "Sell->Partial->SellOrderService.cs中有详细介绍"
            }
          ]
        },
        {
          title: "后台获取用户信息",
          desc: [
            {
              text:
                "UserContext.Current在Sell->Partial->SellOrderService.cs中有详细介绍"
            }
          ]
        },
        {
          title: "前端获取用户信息/权限等",
          desc: [
            {
              text: "菜单->其他组件"
            }
          ]
        },
        {
          title: "如何使用一对多",
          desc: [
            {
              text:
                "目前代码生成只有主从一对一，一对多需要自己扩展，可参照【表单一对多】页面"
            },
            {
              text:
                "1、提交自定义的一对多页面的数据，能过【如何获取自定义扩展的组件】介绍拿到自己定义的组件，在提交保存前将数据写入请参数中(SellOrder.js中有列出所有操作事件的方法)"
            },
            {
              text:
                "2、后台通过HttpContext.Request<T>(),拿到请求的数据进行业务处理(如：写入数据库中)，参照Sell->Partial->SellOrderService.cs中有介绍所有方法操作"
            },
            {
              text:
                "使用一对多加载自定义表数据,如点击编辑弹出框时加载表数据：可以使用this.modelOpenAtfter，可参照SellOrder.js中有列出所有操作事件的方法，实际使用方式与上面介绍的一样,"
            }
          ]
        },
        {
          title: "数据库表字段发生变化怎么处理",
          desc: [
            {
              text:
                "数据库字段发生变化后，在代码生成器页面点击->【同步表结构->【生成model】->【生成vue页面】"
            }
          ]
        },
        {
          title: "如何删除菜单配置",
          desc: [
            {
              text:
                "目前不支持删除菜单，如果想删除菜单，将父级ID设置为其他不用节点的id即可"
            }
          ]
        },
        {
          title: "页面提示没有权限",
          desc: [
            {
              text: "1、确认是否给角色分配好了权限"
            },
            {
              text:
                "2、菜单设置页面,当前菜单的【视图/表名】字段在Sys_Menu表中是否有重复(【视图/表名】字段在Sys_Menu表中不能有重复)"
            },
            {
              text:
                "2、如果是代码生成器生成的页面也分配权限后还是提示权限，请检查代码生成器配置中的【真实表名】与菜单设置中的【视图/表名】是否一样"
            }
          ]
        },
        {
          title: "多表关联页面",
          desc: [
            {
              text:
                "如果只是多表关联显示在页面，建一个视图，把视图生成前后端代码"
            }
          ]
        },
        {
          title: "代码生成后表结构发生变化",
          desc: [
            {
              text:
                "代码生成后，如果表结构发生了变化，点【同步表结构】再点【生成model】【生面vue页面】"
            }
          ]
        },
        {
          title: "设置接口token永不过期",
          desc: [
            {
              text:
                "如果想要某些接口使用固定的token永不过期，控制器的方法加上[FixedToken]属性，只要数据库与缓存的token一致，token就永远不会过期"
            }
          ]
        },
        {
          title: "select组件不能手动设置值",
          desc: [
            {
              text:
                "1、select的数据源如果是从字典项中加载的，设置select的值必须是字符串类型"
            },
            {
              text:
                "2、请检查select绑定的数据源中key的类型，设置的值必须也key的类型一致"
            }
          ]
        },
        {
          title: "新建类库提示版本问题",
          desc: [
            {
              text:
                "1、当前项目使用的是.netcore2.1，新建的类库从新在nuget上引用此版本"
            },
            {
              text: "2、新建的类库需要引用Vol.Core,Vol.Entity项目"
            },
            {
              text: "3、VOL.WebApi需要引用新建的类库"
            }
          ]
        },
        {
          title: "表主键支持类型",
          desc: [
            {
              text:
                "主键目前只支持自增或Guid类型，如果是mysql数据库使用guid，主键设置为char长度36"
            }
          ]
        },
        {
          title: "代码生成器生成业务类异常",
          desc: [
            {
              text:
                "后台必须运行builder_run.bat命令才可以生成业务类，生成其他运行dev_run.bat或builder_run.bat"
            }
          ]
        },
        {
          title: "代码生成器生成业务类找不到文件",
          desc: [
            {
              text: "同上"
            }
          ]
        },
        {
          title: "代码生成新建时没有加载表结构数据",
          secondTitle: "没有加载表结构数据",
          desc: [
            {
              text:
                "确认表是否存在,如果存在先把代码生成页面的对应的菜单删除，再重新操作新建流程"
            }
          ]
        },
        {
          title: "生成model没有反应或异常",
          desc: [
            {
              text:
                "点击生成model响应或异常，原因是数据表结构与代码生成页面的结构不一样，点击同步表结构再点生成model,如果还是无法解决(mysql,sqlserver有些很少用的字段没有考虑，也没有经过测试)，请提issue"
            }
          ]
        },
        {
          title: "代码生成页面弹出新建页面空白",
          secondTitle: "代码生成页面新建页面空白",
          desc: [
            {
              text:
                "代码生成页面需要自己配置编辑行，可参照现有其他页面的配置(配置完成后，点击保存与生成model)"
            }
          ]
        },
        {
          title: "代码生成页面没有查询字段",
          desc: [
            {
              text:
                "代码生成页面需要自己配置查询行，可参照现有其他页面的配置(配置完成后，点击保存)"
            }
          ]
        },
        {
          title: "代码生成主从表,保存异常或加载不了从表数据",
          secondTitle: "代码生成主从表保存异常",
          desc: [
            {
              text:
                "从表外键必须是主表的主键字段,如：主表Sell_Order主键Order_Id,从表SellOrderList的外键必须为Order_Id"
            }
          ]
        },
        {
          title: "页面加载时提示未配置好url",
          secondTitle: "页面加载时提示未配置好url",
          desc: [
            { text: "(代码生成后)请确认后台项目是否运行的dev_run.bat命令" }
          ]
        },
        {
          title: "编辑/新建保存时提示没有配置好编辑的数据，请检查model",
          secondTitle: "保存提示没有配置好编辑的数据",
          desc: [
            { text: "(代码生成后)请确认后台项目是否运行的dev_run.bat命令" }
          ]
        },
        {
          title: "权限分配后看不到菜单",
          desc: [
            { text: "权限分配页面，请确认是否勾选了一级菜单的【查询】权限" }
          ]
        },
        {
          title: "MySql批量保存出错",
          desc: [
            {
              text:
                "MySql批量保存出错，异常提示：Don't use MySQL xxxx或The used command is not allowed with this MySQL version"
            },
            {
              text:
                "解决办法：在mysql数据库中执行:set global local_infile = 'ON';"
            }
          ]
        }
      ]
    };
  }
};
</script>
<style lang="less" scoped>
.i-container {
  display: flex;
  > .nav {
    // overflow-y: scroll;
    border-right: 1px solid #ccc3c3;
    margin-right: 50px;
    width: 250px;
    position: fixed;
    /* height: 100%; */
    bottom: 20px;
    top: 81px;
    .n-item {
      text-align: left;
      padding-right: 29px;
      list-style: none;
      a {
        font-size: 14px;
        color: #737070;
        line-height: 30px;
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
  > .list {
    flex: 1;
    margin-left: 270px;
  }
}
.active {
  color: #409eff !important;
}
.i-item {
  padding-bottom: 10px;
  border-bottom: 1px solid #eee;
  margin-bottom: 15px;
  h3 {
    font-size: 22px;
    font-weight: 400;
    margin: 0 0 10px;
    color: #1f2d3d;
  }
}
.i-item:hover {
  cursor: pointer;
}
.desc {
  //   padding-left: 50px;
}
.desc li {
  font-size: 14px;
  margin-bottom: 10px;
  color: #5e6d82;
  list-style: none;
}
.desc li:before {
  content: "";
  display: inline-block;
  width: 4px;
  height: 4px;
  border-radius: 50%;
  vertical-align: middle;
  background-color: #5e6d82;
  margin-right: 5px;
}
</style>