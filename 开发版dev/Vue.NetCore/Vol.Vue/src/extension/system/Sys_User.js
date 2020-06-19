

let extension = {
    components: {//动态扩充组件或组件路径
        //表单header、content、footer对应位置扩充的组件
        gridHeader: () => import("./Sys_User/Sys_UserGridHeader.vue"),
        gridBody: '',
        gridFooter: '',
        //弹出框(修改、编辑、查看)header、content、footer对应位置扩充的组件
        modelHeader: '',
        modelBody: '',
        modelFooter: ''
    },
    text: "只能看到当前角色下的所有帐号",
    buttons: [],//扩展的按钮
    methods: {//事件扩展
        onInit() {
            this.boxOptions.height = 530;
        },
        onInited() {
        },
        addAfter(result) {//用户新建后，显示随机生成的密码
            if (!result.status) {
                return true;
            }
            //显示新建用户的密码
            this.$refs.gridHeader.open(result.message);
            this.boxModel = false;
            return true;
        },
        modelOpenAfter() {
            //点击弹出框后，如果是编辑状态，禁止编辑用户名，如果新建状态，将用户名字段设置为可编辑
            let isEDIT = this.currentAction == this.const.EDIT;
            this.editFormOptions.forEach(item => {
                item.forEach(x => {
                    if (x.field == "UserName") {
                        this.$set(x, "disabled", isEDIT)
                    }
                })
                //不是新建，性别默认值设置为男
                if (!isEDIT) {
                    this.editFormFileds.Gender = "0";
                }
            })
        }

    }
};
export default extension;