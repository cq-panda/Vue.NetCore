// 扩充组件通过this.emit('header',($vueView)>{})回调方法来操作父组件
//父组件通过this.$refs.header调用子组件，如：添加了扩展按钮，需要弹出一个新的model
let extension = {
    componentPath: {//动态扩充组件路径 
  
    },
    buttons: { //扩展按钮
        view: [//ViewGrid查询界面按钮
            {
                name: "测 试",
                icon: 'md-create',
                value: 'Edit',
                class: '',
                type: 'success',
                index: 1,//显示的位置
                onClick: function () {//扩展按钮执行事件
                    //this可以获取所有属性，包括this.$refs获取扩展对象
                    this.$message("测试扩展按钮");
                }
            }],
        box:[], //新建、编辑弹出框按钮],
        detail:[] //新建、编辑弹出框明细table表按钮]
    },
    methods: {//事件扩展

    }
};
export default extension;