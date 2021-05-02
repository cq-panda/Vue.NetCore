<template>
  <div class="container">
    <Alert type="success" style=" margin: 20px 20px 0 20px;" show-icon>
      treetable
      <div slot="desc">
      需要2021.05.02更新后才能使用,(<a target="_blank" href="http://www.volcore.xyz/document/log">升级方式见</a>)
      </div>
    </Alert>
    <!-- 查询配置 -->
    <div style="padding: 0px 20px">
      <VolHeader
        icon="md-apps"
        text="TreeTable"
        style="margin-bottom: 10px; border: 0px; margin-top: 15px"
      >
        <div slot="content"></div>
        <slot>
          <div style="text-align: right">
            <Button type="primary"  @click="search" 
              >查询</Button
            >
            <Button type="success" style="margin-left: 10px"  @click="getRows">获取选中的行</Button>
          </div>
        </slot>
      </VolHeader>
      <vol-table
        ref="table"
        :loadKey="true"
        row-key="Role_Id"
        :columns="columns"
        :pagination-hide="false"
        :max-height="450"
        url="/api/Sys_Role/getPageData"
        :index="true"
        :loadTreeChildren="loadTreeChildren"
        @loadBefore="loadTableBefore"
      ></vol-table>
    </div>
  </div>
</template>
<script>
import VolTable from "@/components/basic/VolTable.vue";
import VolHeader from "@/components/basic/VolHeader.vue";
export default {
  components: { VolTable, VolHeader },
  created() {},
  data() {
    return {
      columns: [
        {
          field: "Role_Id",
          title: "角色ID",
          type: "int",
          width: 70,
          readonly: true,
          require: true,
          align: "left",
          sortable: true,
        },
        {
          field: "RoleName",
          title: "角色名称",
          type: "string",
          link: true,
          width: 90,
          require: true,
          align: "left",
        },
        {
          field: "Dept_Id",
          title: "部门ID",
          type: "int",
          width: 90,
          hidden: true,
          align: "left",
        },
        {
          field: "DeptName",
          title: "部门名称",
          type: "string",
          width: 90,
          align: "left",
        },
        {
          field: "Enable",
          title: "是否启用",
          type: "byte",
          bind: { key: "enable", data: [] },
          width: 90,
          align: "left",
        },
        {
          field: "OrderNo",
          title: "排序",
          type: "int",
          width: 90,
          hidden: true,
          align: "left",
        },
        {
          field: "Creator",
          title: "创建人",
          type: "string",
          width: 130,
          readonly: true,
          align: "left",
        },
        {
          field: "CreateDate",
          title: "创建时间",
          type: "datetime",
          width: 90,
          readonly: true,
          align: "left",
          sortable: true,
        },
      ],
    };
  },
  methods: {
    loadTableBefore(params) {
      //Sys_RoleController中始终只加载根节点数据
      params.value = 1;
      return true;
    },
    loadTreeChildren(tree, treeNode, resolve) {
      //加载子节点数据
      let url = `api/role/getTreeTableChildrenData?roleId=${tree.Role_Id}`;
      this.http.post(url, {}).then((result) => {
        resolve(result.rows);
      });
    },
    search() {
      this.$refs.table.load();
    },
    getRows() {
      let rows = this.$refs.table.getSelected();
      if (rows.length == 0) {
        return this.$message.error("请先选中行1");
      }
      let text = "当前选中的行数据：" + JSON.stringify(rows);
      this.$Message.info(text);
    },
  },
};
</script>