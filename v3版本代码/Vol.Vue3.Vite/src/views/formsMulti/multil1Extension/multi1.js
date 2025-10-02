
import table1 from "../multil1Extension/table1.vue"
let extension = {
    components: {//动态扩充组件或组件路径
        gridHeader:'',
        gridBody: "",
        gridFooter:table1,
        modelHeader: '',
        modelBody: '',
        modelFooter: ''
    },
    text:"此处表单由代码生成，也可引入单独ViewGrid.vue手动配置数据",
    tableAction:'App_TransactionAvgPrice',//指定表权限
    buttons: [],//扩展的按钮
    methods: {//事件扩展
        onInit() {
            this.tableMaxHeight=400;
        },
        onInited() {
         
        }
    }
};
export default extension;