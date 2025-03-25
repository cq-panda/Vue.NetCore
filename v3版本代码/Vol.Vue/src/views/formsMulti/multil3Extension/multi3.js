import comMulti from "../multil3Extension/comMulti.vue"
let extension = {
    components: {//动态扩充组件或组件路径
        gridHeader:'',
        gridBody: "",
        gridFooter:comMulti,
        modelHeader: '',
        modelBody: '',
        modelFooter: ''
    },
    text:"此处表单由代码生成，也可引入单独ViewGrid.vue手动配置数据",
    buttons: [],//扩展的按钮
    methods: {//事件扩展
        onInit() {
            this.tableMaxHeight=300;
        },
        onInited() {
         
        }
    }
};
export default extension;