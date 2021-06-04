
let buttons = [{
    name: "查 询",
    value: 'Search',
    icon: 'md-search',
    class: 'dropdown',
    type: 'info',
    onClick: function () {
        this.search();
    }
}, 
// {
//     name: "重 置",
//     icon: 'md-refresh',
//     class: '',
//     type: 'success',
//     onClick: function () {
//         this.resetSearch();
//     }
// }, 
// {
//     name: "刷 新",
//     icon: 'md-refresh',
//     class: '',
//     type: 'success',
//     onClick: function () {
//         this.refresh();
//     }
// },
{
    name: "新 建",
    icon: 'md-add',
    value: 'Add',
    class: '',
    type: 'success',
    onClick: function () {
        this.add();
    }
},{
    name: "编 辑",
    icon: 'md-create',
    value: 'Update',
    class: '',
    type: 'primary',
    onClick: function () {
        this.edit();
    }
},  {
    name: "删 除",
    icon: 'md-close',
    class: '',
    value: 'Delete',
    type: 'error',
    onClick: function () {
        this.del();
    }
},  {
    name: "审 核",
    icon: 'md-create',
    class: '',
    value: 'Audit',
    type: 'info',
    onClick: function () {
        this.audit();
    }
},
{
    name: "导 入",
    icon: 'md-color-fill',
    class: '',
    value: 'Import',
    onClick: function () {
        this.import();
    }
}, {
    name: "导 出",
    icon: 'md-share-alt',
    class: '',
    value: 'Export',
    onClick: function () {
        this.export();
    }
}, {
    name: "数据结构",
    icon: 'ios-cog',
    class: '',
    value: '',
    onClick: function () {
        this.openViewColumns();
    }
}]

export default buttons