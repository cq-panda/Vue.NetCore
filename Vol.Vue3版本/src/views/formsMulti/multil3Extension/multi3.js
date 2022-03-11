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
    text:"见multi3.js、multi3.vue",
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