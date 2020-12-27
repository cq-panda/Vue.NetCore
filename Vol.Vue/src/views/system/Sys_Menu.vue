<template>
  <div class="menu-container">
    <vol-box :width="940"
             :mask="true"
             :height="500"
             title="图标列表"
             :model.sync="model">
      <Icons :onSelect="onSelect"></Icons>
    </vol-box>
    <vol-box :width="600"
             :mask="true"
             :height="270"
             title="其他权限"
             :model.sync="actionModel">
      <vol-form ref="actionForm"
                :formRules="actionOptions"
                :formFileds="actionFields">
        <div slot="header">
          <Alert show-icon>
            配置的其他权限
            <br />1、添加新的权限后请在vue项目中config文件夹下buttns.js添加此权限的按钮。
            <br />2、如果权限只在某少数几个功能中使用,在vue的对应页面扩展extension文件找到对应js,添加到buttons对象中,格式同config文件夹下buttns.js一样。
          </Alert>
        </div>
      </vol-form>
      <Button slot="footer"
              type="info"
              @click="otherAction">确 认</Button>
    </vol-box>

    <div class="menu-left">
      <Alert class="module-name"
             show-icon>菜单列表</Alert>
      <div class="menu-tree"
           style="height:95%;">
        <el-scrollbar style="height:100%;">
          <VolMenu :onOpenChange="onOpenChange"
                   :options="tree"
                   :onSelect="menuSelect"></VolMenu>
        </el-scrollbar>
      </div>
    </div>
    <div class="menu-right">
      <el-scrollbar style="height:100%;">
        <div style="padding:0 60px;">
          <Divider>
            <span icon="ivu-icon ivu-icon-md-podium">{{divider}}</span>
          </Divider>
          <Alert style="box-shadow: rgb(214, 214, 214) 0px 4px 21px;  line-height: 1.8;"
                 show-icon>
            <p>1、 如果是用代码生器生成的Vue页面,菜单配置的Url则为Vue项目中src->router->viewGrid.js对应表名的path路径</p>
            <p>2、 如果只是建一级菜单或空菜单url不用填写,【视图/表名】填写.或者/</p>
          </Alert>
          <vol-form class="form-content"
                    ref="form"
                    :formRules="options"
                    :formFileds="fields">
            <div slot="footer">
              <div class="action">
                <label class="ivu-form-item-label"
                       style="width: 100px;">权限：</label>
                <div class="ck">
                  <Checkbox :indeterminate="indeterminate"
                            :value="checkAll"
                            @click.prevent.native="handleCheckAll">全选</Checkbox>
                  <CheckboxGroup v-model="actions"
                                 @on-change="checkAllGroupChange">
                    <Checkbox v-for="(item,index) in action"
                              :key="index"
                              :label="item.value">{{item.text+'('+item.value+')'}}</Checkbox>
                  </CheckboxGroup>
                  <Button @click="actionModel=true"
                          type="dashed">其他权限</Button>
                </div>
              </div>
              <div class="icon-item">
                <label class="ivu-form-item-label"
                       style="width: 100px;">图标：</label>
                <div class="on-icon">
                  <span style="position: relative;">
                    <i v-if="icon!=''"
                       @click="removeIcon"
                       class="remove ivu-icon ivu-icon-md-remove-circle"></i>
                    <i style="margin-right: 15px;font-size: 32px;"
                       :class="['ivu-icon ivu-icon-'+icon]"></i>
                  </span>
                  <Button @click="model=true"
                          type="dashed">选择图标</Button>
                </div>
              </div>
              <div class="m-btn">
                <Button type="info"
                        icon="md-checkmark-circle"
                        @click="save">保存</Button>
                <Button type="success"
                        icon="md-add"
                        @click="add">新建</Button>
                <Button type="warning"
                        icon="md-add-circle"
                        @click="addChild">添加子级</Button>
                <Button type="error"
                        icon="ios-barcode-outline"
                        @click="addBrother">添加同级</Button>
                <Button type="info"
                        icon="ios-remove"
                        @click="delMenu">删除菜单</Button>
              </div>
            </div>
          </vol-form>
        </div>
      </el-scrollbar>
    </div>
  </div>
</template>
<script>
import VolForm from "@/components/basic/VolForm.vue";
import VolBox from "@/components/basic/VolBox.vue";
import Icons from "@/components/basic/Icons.vue";
import { fail } from "assert";
export default {
  components: {
    VolForm: VolForm,
    VolBox: VolBox,
    Icons: Icons,
    VolMenu: () => import("@/../src/components/basic/VolMenu"),
  },
  methods: {
    otherAction () {
      this.$refs.actionForm.validate(() => {
        let exist = this.action.some((x) => {
          return (
            x.text == this.actionFields.name ||
            x.value == this.actionFields.value
          );
        });
        if (exist) {
          return this.$message.error("权限名称或权限值已存在");
        }
        this.actionModel = false;
        this.action.push({
          text: this.actionFields.name,
          value: this.actionFields.value,
        });
      });
    },
    handleCheckAll () {
      if (this.actions == this.action.length) {
        this.checkAll = false;
      } else {
        this.checkAll = !this.checkAll;
      }
      // this.indeterminate = false;
      if (this.checkAll) {
        this.actions = this.action.map((x) => {
          return x.value;
        });
      } else {
        this.actions = [];
      }
    },
    checkAllGroupChange (data) {
      if (data.length === this.action.length) {
        this.indeterminate = false;
        this.checkAll = true;
      } else if (data.length > 0) {
        this.indeterminate = true;
        this.checkAll = false;
      } else {
        this.indeterminate = false;
        this.checkAll = false;
      }
    },
    add (obj) {
      this.$refs.form.reset(
        Object.assign({ enable: 1 }, obj || { parentId: 0 })
      );
      this.icon = "";
      // this.actions = [];
      //2020.08.07新建菜单时，默认选中查询按钮权限
      this.actions = ["Search"];
    },
    addChild () {
      if (!this.isSelect()) return;
      this.add({ parentId: this.fields.menu_Id });
    },
    addBrother () {
      if (!this.isSelect()) return;
      this.add({ parentId: this.fields.parentId });
    },
    delMenu () {
      //2020.08.07增加菜单删除功能
      if (this.fields.menu_Id == 0) {
        return this.$Message.error("请选择菜单");
      }
      let tigger = false,
        msg = "确认要删除【" + this.fields.menuName + "】菜单吗？";
      this.$Modal.confirm({
        title: "删除警告!",
        content:
          '<p style="color: red;font-weight: bold;letter-spacing: 3px;">' +
          msg +
          "</p>",
        onOk: () => {
          if (tigger) return;
          tigger = true;
          let menuId = this.fields.menu_Id;
          this.http
            .post("/api/menu/delMenu?menuId=" + menuId, {}, "正在删除数据....")
            .then((x) => {
              if (!x.status) return this.$Message.error(x.message);
              this.$refs.form.reset();
              this.$Message.info(x.message);
              this.initTree();
            });
        },
      });
    },
    save () {
      this.$refs.form.validate(() => {
        this.fields.auth = "";
        if (this.actions) {
          this.fields.auth = this.action.filter((x) => {
            return this.actions.indexOf(x.value) != -1;
          });
        }
        if (
          this.fields.auth &&
          this.fields.auth instanceof Array &&
          this.fields.auth.length > 0
        ) {
          this.fields.auth = JSON.stringify(this.fields.auth);
        } else {
          this.fields.auth = "";
        }
        this.fields.icon = this.icon;
        this.http.post("/api/menu/save", this.fields, true).then((x) => {
          if (!x.status) {
            this.$Message.error(x.message);
            return;
          }

          this.$Message.info(x.message);
          if (this.fields.menu_Id) {
            this.tree.forEach((t) => {
              if (t.id == this.fields.menu_Id) {
                t.name = this.fields.menuName;
                t.orderNo = this.fields.orderNo;
                t.parentId = this.fields.parentId;
              }
            });
            return;
          }
          this.fields.menu_Id = x.data.menu_Id;
          this.fields.createDate = x.data.createDate;
          this.tree.push({
            id: x.data.menu_Id,
            name: this.fields.menuName,
            orderNo: this.fields.orderNo,
            parentId: this.fields.parentId,
          });
        });
      });
    },
    isSelect () {
      let id = this.fields.menu_Id;
      if (!id) {
        this.$message.error("请选择节点");
        return false;
      }
      return true;
    },
    onSelect (icon) {
      this.icon = icon;
      this.$message.info(icon);
    },
    removeIcon () {
      this.icon = "";
    },
    onOpenChange (node) {
      if (node.length == 0) return;
      this.getTreeItem(node[node.length > 1 ? node.length - 1 : 0]);
    },
    menuSelect (node) {
      this.getTreeItem(node);
    },
    getTreeItem (node) {
      this.http
        .post("/api/menu/getTreeItem?menuId=" + node, {}, true)
        .then((x) => {
          try {
            if (x.auth) {
              x.auth = JSON.parse(x.auth);
              this.action.splice(8, this.action.length);
              this.actions = x.auth.map((element) => {
                if (this.actionValues.indexOf(element.value) == -1) {
                  this.action.push(element);
                }
                return element.value;
              });
              this.icon = x.icon;
            } else {
              this.action.splice(8, this.action.length);
              x.auth = [];
              this.icon = "";
              this.actions = [];
            }
          } catch (error) {
            this.$message.error("菜单功能权限转换成JSON失败:" + x.auth);
            x.auth = [];
            this.icon = "";
            this.actions = [];
          }
          this.$refs.form.reset(x);
        });
    },
    initTree () {
      //2020.08.07修改菜单初始化
      this.http.post("/api/menu/getMenu", {}, true).then((x) => {
        this.tree = x;
      });
    },
  },
  created () {
    this.actionValues = this.action.map((x) => {
      return x.value;
    });
    //2020.08.07修改菜单初始化
    this.initTree();
  },
  data () {
    return {
      divider: "菜单配置",
      actionModel: false,
      indeterminate: false,
      checkAll: false,
      tree: [],
      action: [
        { text: "查询", value: "Search" },
        { text: "新建", value: "Add" },
        { text: "删除", value: "Delete" },
        { text: "编辑", value: "Update" },
        { text: "导入", value: "Import" },
        { text: "导出", value: "Export" },
        { text: "上传", value: "Upload" },
        { text: "审核", value: "Audit" },
      ],
      actionValues: [],
      actions: [],
      icon: "",
      model: false,
      options: [
        [
          {
            title: "菜单ID",
            field: "menu_Id",
            readonly: true,
            type: "number",
            min: 0,
            disabled: true,
          },
          {
            title: "父级ID",
            required: true,
            type: "number",
            min: 0,
            field: "parentId",
            // min: 0, max: 50
          },
        ],
        [
          {
            title: "菜单名称",
            field: "menuName",
            displayType: "text",
            required: true,
          },
          {
            title: "视图/表名",
            field: "tableName",
            dataType: "string",
            displayType: "text",
            placeholder: "与代码生成器使用的名称相同",
            required: true,
          },
        ],
        [
          {
            title: "Url",
            field: "url",
            dataType: "string",
            displayType: "text",
          },
          {
            title: "排序号",
            field: "orderNo",
            type: "number",
            min: 0,
            required: true,
          },
        ],
        [
          {
            title: "是否启用",
            field: "enable",
            dataType: "int",
            required: true,
            type: "select",
            data: [
              { key: 1, value: "启用" },
              { key: 2, value: "启用不显示" },
              { key: 0, value: "禁用" },
            ],
            extra: {
              render: h => {
                return h(
                  "Poptip",
                  {
                    props: { "word-wrap": true, trigger: "hover", width: "400", }, style: { color: "#03A9F4", cursor: "pointer" },
                    on: { click: () => { this.$Message.info("点击事件") } }
                  },
                  [
                    h(
                      "i",
                      {
                        style: {},
                      }, [
                      h("span", { class: "ivu-icon ivu-icon-ios-alert-outline" }, ["配置说明"]),
                    ]
                    ),
                    h("div", { slot: "content" },
                      [h("p", {}, "1、启用：页面上只会显示启用的菜单"),
                      h("p", {}, "2、启用不显示：页面不需要显示，但又需要分配权限,请使用此配置"),
                      h("p", {}, "3、禁止：菜单不会启用也不会参与权限分配")])
                  ]
                );
              }
            }
          },
          {
            title: "创建时间",
            field: "createDate",
            dataType: "datetime",
            displayType: "label",
            disabled: true,
          },
        ],
      ],
      fields: {
        menu_Id: 0,
        parentId: 0,
        menuName: "",
        tableName: "",
        url: "",
        auth: "",
        icon: "",
        orderNo: "",
        enable: 1,
        createDate: "",
        creator: "",
        modifyDate: "",
      },
      actionFields: {
        name: "",
        value: "",
      },
      actionOptions: [
        [
          {
            title: "权限名称",
            field: "name",
            displayType: "text",
            placeholder: "权限名称,如：新增",
            required: true,
          },
        ],
        [
          {
            title: "权限值",
            field: "value",
            dataType: "string",
            displayType: "text",
            placeholder: "权限值,如：Add",
            required: true,
          },
        ],
      ],
    };
  },
};
</script>

<style lang="less" scoped>
.on-icon {
  line-height: 20px;
  position: relative;
  .remove {
    display: none;
    color: red;
    right: 7px;
    position: absolute;
    top: -14px;
    font-size: 13px;
  }
}
.on-icon:hover {
  cursor: pointer;
  .remove {
    display: block;
  }
}
.action {
  width: 100%;
  display: flex;

  margin-bottom: 15px;
  .ivu-checkbox-wrapper {
    margin-right: 20px;
  }
  .ck {
    line-height: 33px;
    display: inline-block;
    display: flex;
    label:first-child {
      min-width: 58px;
      float: left;
      margin-top: 1px;
    }
    > div {
      float: left;
    }
  }
}

.menu-container {
  display: flex;
  position: absolute;
  width: 100%;
  height: 100%;
  border-radius: 5px;
  .menu-left {
    width: 201px;
    border: 1px solid #eee;
    .module-name {
      border-radius: 0px;
      /* height: 5%; */
      line-height: 21px;
      margin-bottom: 0;
    }
  }
  .menu-right {
    flex: 1;
    // padding: 0 100px;
    .form-content {
      border: 1px solid #eee;
      margin-top: 5px;
      width: 100%;
      padding: 25px;
      box-shadow: rgb(214, 214, 214) 0px 4px 21px;
    }
  }
}
.m-btn {
  text-align: right;
  button {
    margin-left: 10px;
  }
}
</style>


<style  scoped>
.menu-left >>> .ivu-menu {
  width: 200px !important;
}
</style>

