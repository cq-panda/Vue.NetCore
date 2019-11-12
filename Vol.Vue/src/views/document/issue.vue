<template>
  <div>
    <div></div>
    <div class="i-container">
      <div class="nav">
        <ul>
          <li class="n-item" v-for="(item,index) in data" :key="index">
            <a
              :class="{active:active==index}"
              @click="scrollIntoView(index)"
            >{{item.secondTitle||item.title}}</a>
          </li>
        </ul>
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
export default {
  methods: {
    scrollIntoView(index) {
      this.active = index;
      document.getElementById("i-" + index).scrollIntoView(false);
    }
  },
  data() {
    return {
      active: 0,
      data: [
        {
          title: "菜单提示没有权限",
          desc: [
            {
              text: "1、确认是否给角色分配好了权限"
            },
            {
              text:
                "2、菜单设置页面,当前菜单的【视图/表名】字段在Sys_Menu表中是否有重复(【视图/表名】字段在Sys_Menu表中不能有重复)"
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
          title: "数据库表字段修改",
          desc: [
            {
              text:
                "如果数据库表新加、删除、修改表字段或类型，需要在代码生成页面手动修改，再点保存与生成model"
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
                "点击生成model响应或异常，原因是数据表结构与代码生成页面的结构不一样，如果数据表结构有修改，代码生成页面也要修改配置"
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
    border-right: 1px solid #ccc3c3;
    margin-right: 50px;
    width: 250px;
    position: fixed;
    .n-item {
      text-align: right;
      padding-right: 29px;
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