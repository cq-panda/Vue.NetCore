
import mtable from "../multil2Extension/mtable.vue"
let extension = {
    components: {//动态扩充组件或组件路径
        gridHeader:'',
        gridBody: "",
        gridFooter:mtable,
        modelHeader: '',
        modelBody: '',
        modelFooter: ''
    },
    text:"见multi2.vue、multi2.js",
    buttons: [],//扩展的按钮
    methods: {//事件扩展
        onInit() {
            this.tableMaxHeight=200;
        },
        onInited() {
         
        }
    }
};
export default extension;