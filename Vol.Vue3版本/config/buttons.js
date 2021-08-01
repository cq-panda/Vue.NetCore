
let buttons = [{
    name: "查 询",
    value: 'Search',
    icon: 'el-icon-search',
    class: '',
    type: 'primary',
    onClick: function () {
        this.search();
    }
}, 
{
    name: "新 建",
    icon: 'el-icon-plus',
    value: 'Add',
    class: '',
  //  plain:true,
    type: 'success',
    // plain:true,
    onClick: function () {
        this.add();
    }
},{
    name: "编 辑",
    icon: 'el-icon-edit',
    value: 'Update',
   // plain:true,
    class: '',
    type: 'primary',
    onClick: function () {
        this.edit();
    }
},  {
    name: "删 除",
    icon: 'el-icon-delete',
    class: '',
    value: 'Delete',
    type: 'danger',
    onClick: function () {
        this.del();
    }
},  {
    name: "审 核",
    icon: 'el-icon-check',
    class: '',
    value: 'Audit',
    plain:true,
    type: 'primary',
    onClick: function () {
        this.audit();
    }
},
{
    name: "导 入",
    icon: 'el-icon-top',
    class: '',
    type:'success',
    plain:true,
    value: 'Import',
    onClick: function () {
        this.import();
    }
}, {
    name: "导 出",
    icon: 'el-icon-bottom',
    type:'success',
    plain:true,
    value: 'Export',
    onClick: function () {
        this.export();
    }
}
// , {
//     name: "数据结构",
//     icon: 'ios-cog',
//     class: '',
//     value: '',
//     onClick: function () {
//         this.openViewColumns();
//     }
// }
]

export default buttons