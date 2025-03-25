<!--
*Author：jxx
 *Contact：283591387@qq.com
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *业务请在@/extension/system/Sys_Role.js此处编写
 -->
<template>
  <div>
    <view-grid :columns="columns"
               :detail="detail"
               :editFormFields="editFormFields"
               :editFormFileds="editFormFields"
               :editFormOptions="editFormOptions"
               :searchFormFields="searchFormFields"
               :searchFormFileds="searchFormFields"
               :searchFormOptions="searchFormOptions"
               :table="table"
               :extend="extend">
    </view-grid>
  </div>
</template>

<script>
import extend from "@/extension/system/Sys_Role1.js";
import ViewGrid from "@/components/basic/ViewGrid.vue";
var vueParam = {
  components: {
    ViewGrid
  },
  data () {
    return {
      table: {
        key: 'Role_Id',
        footer: "Foots",
        cnName: '角色管理',
        name: 'Sys_Role',
        url: "/Sys_Role/",
        sortName: "Role_Id"
      },
      extend: extend,
      editFormFields: { "ParentId": [], "RoleName": "", "DeptName": "", "Enable": "", "Creator": "", "CreateDate": "", "Modifier": "", "ModifyDate": "" },
      editFormOptions: [[{ "dataKey": "tree_roles", "data": [], "title": "父级ID", "required": true, "field": "ParentId", "type": "cascader" },
      { "title": "角色名称", "required": true, "field": "RoleName" }],
      [{ "title": "部门名称", "field": "DeptName" },
      { "dataKey": "enable", "data": [], "title": "是否启用", "field": "Enable", "type": "switch" }],
      [{ "title": "创建人", "field": "Creator", "disabled": true },
      { "title": "创建时间", "field": "CreateDate", "disabled": true, "type": "datetime" }],
      [{ "title": "修改人", "field": "Modifier", "disabled": true },
      { "title": "修改时间", "field": "ModifyDate", "disabled": true }]],
      searchFormFields: { "ParentId": [], "RoleName": "", "DeptName": "", "Enable": "", "CreateDate": "", "ModifyDate": "" },
      searchFormOptions: [[{ "title": "角色名称", "field": "RoleName", "type": "text" }, { "title": "部门名称", "field": "DeptName", "type": "text" }, { "dataKey": "enable", "data": [], "title": "是否启用", "field": "Enable", "type": "select" }], [{ "dataKey": "tree_roles", "data": [], "title": "父级ID", "field": "ParentId", "type": "cascader" }, { "title": "创建时间", "field": "CreateDate", "type": "datetime" }, { "title": "修改时间", "field": "ModifyDate", "type": "datetime" }]],
      columns: [{ field: 'Role_Id', title: '角色ID', type: 'int', width: 70, readonly: true, require: true, align: 'left', sortable: true },
      //{ field: 'ParentId', title: '父级ID', type: 'int', bind: { key: 'tree_roles', data: [] }, width: 70, require: true, align: 'left' },
      { field: 'RoleName', title: '角色名称', type: 'string', link: true, width: 90, require: true, align: 'left' },
      { field: 'Dept_Id', title: '部门ID', type: 'int', width: 90, hidden: true, align: 'left' },
      { field: 'DeptName', title: '部门名称', type: 'string', width: 90, align: 'left' },
      { field: 'Enable', title: '是否启用', type: 'byte', bind: { key: 'enable', data: [] }, width: 90, align: 'left' },
      { field: 'OrderNo', title: '排序', type: 'int', width: 90, hidden: true, align: 'left' },
      { field: 'Creator', title: '创建人', type: 'string', width: 130, readonly: true, align: 'left' },
      { field: 'CreateDate', title: '创建时间', type: 'datetime', width: 90, readonly: true, align: 'left', sortable: true },
      { field: 'Modifier', title: '修改人', type: 'string', width: 130, readonly: true, align: 'left' },
      { field: 'ModifyDate', title: '修改时间', type: 'datetime', width: 90, readonly: true, align: 'left', sortable: true }],
      detail: {
        cnName: "#detailCnName",
        columns: [],
        sortName: "",
        key: ""
      }
    };
  }
};
export default vueParam;
</script>
