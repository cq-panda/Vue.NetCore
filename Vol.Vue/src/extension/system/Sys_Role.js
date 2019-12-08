

let extension = {
    components: {//动态扩充组件或组件路径
        //表单header、content、footer对应位置扩充的组件
        gridHeader: '',
        gridBody: '',
        gridFooter: '',
        //弹出框(修改、编辑、查看)header、content、footer对应位置扩充的组件
        modelHeader: '',
        modelBody: '',
        modelFooter: ''
    },
    buttons: [],//扩展的按钮
    methods: {//事件扩展
        onInit() {
            this.columns.forEach(x => {
                if (x.field == 'ParentId') {
                    x.title = "上级角色";
                    x.bind = { key: "roles" }
                }
            });
            this.editFormOptions.forEach(x => {
                x.forEach(item => {
                    if (item.field == 'ParentId') {
                        item.min = 0;
                    }
                    if (item.field == 'ParentId') {
                        item.title = "上级角色";
                        item.type = 'select';
                        item.dataKey = "roles";
                        //item.data = [{ key:1,value:'超级管理员' }]
                    }
                })
            })
        },
        onInited() {
        }
    }
};
export default extension;