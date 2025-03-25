import form7 from "@/views/forms/form7.vue";
import mtable from "../multil2Extension/mtable.vue"
import comMulti4 from "../multil4Extension/comMulti4.vue"
let extension = {
    components: {//动态扩充组件或组件路径
        gridHeader: form7,
        gridBody: "",
        gridFooter: "",
        modelHeader:'',
        modelBody:  comMulti4,
        modelFooter: mtable
    },
    text: "点击编辑，可查看扩展的明细一对多",
    buttons: [],//扩展的按钮
    methods: {//事件扩展
        onInit() {
            //动态设置查询界面table的高度
            this.tableHeight = 170;
           //动态设置弹出框table的高度
            this.detailOptions.height=110;
        },
        onInited() {
        }
    }
};
export default extension;
