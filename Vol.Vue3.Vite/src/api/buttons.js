let buttons = [
  {
    name: '查询',
    value: 'Search',
    icon: 'el-icon-search',
    class: '',
    type: 'primary',
    onClick: function() {
      this.search();
    }
  },
  {
    name: '新建',
    icon: 'el-icon-plus',
    value: 'Add',
    class: '',
     plain:true,
   // type: 'success',
    color:"#67C23A",
    // plain:true,
    onClick: function() {
      this.add();
    }
  },
  {
    name: '编辑',
    icon: 'el-icon-edit',
    value: 'Update',
     plain:true,
    class: '',
    color:"#79bbff",
    type: 'primary',
    onClick: function() {
      this.edit();
    }
  },
  {
    name: '删除',
    icon: 'el-icon-delete',
    class: '',
    plain:true,
    value: 'Delete',
    type: 'danger',
    color:"#F56C6C",
    onClick: function() {
      this.del();
    }
  },
  {
    name: '审核',
    icon: 'el-icon-check',
    class: '',
    value: 'Audit',
    plain: true,
    type: 'primary',
    onClick: function() {
      this.audit();
    }
  },
  {
    name: '反审',
    icon: 'el-icon-finished',
    class: '',
    value: 'AntiAudit',
    // plain: true,
    // type: 'danger',
    // color:"rgb(254, 240, 240)",
    plain:true,
    // type: 'success',
     color:"#67C23A",
    onClick: function() {
      this.antiAudit();
    }
  },
  {
    name: '导入',
    icon: 'el-icon-top',
    class: '',
    type: 'success',
    plain: true,
    value: 'Import',
    onClick: function() {
      this.import();
    }
  },
  {
    name: '导出',
    icon: 'el-icon-bottom',
    type: 'primary',
    plain: true,
    value: 'Export',
    onClick: function() {
      this.export();
    }
  },
  {
    name: '打印',
    icon: 'el-icon-printer',
    type: 'primary',
    plain: true,
    color:"#529b2e",
    value: 'Print',
    onClick: function() {
      this.printClick();
    }
  }
];

export default buttons;
