

let extension = {
    components: {//动态扩充组件或组件路径
        //表单header、content、footer对应位置扩充的组件
        gridHeader:'',
        gridBody:'',
        gridFooter: '',
        //弹出框(修改、编辑、查看)header、content、footer对应位置扩充的组件
        modelHeader: '',
        modelBody: '',
        modelFooter: ''
    },
    buttons: [],//扩展的按钮
    methods: {//事件扩展
        onInit() {
        },
        onInited() {
        }
    }
};
export default extension;