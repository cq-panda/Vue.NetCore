

let extension = {
    components: {//动态扩充组件或组件路径
        //表单header、content、footer对应位置扩充的组件
        gridHeader:'',
        gridBody: { template: '<Alert type="success">静态页面发布目前主要用于的是移动端,以前版本采用的是jquery发布静态页面,vue版本静态页面正在重新整理中。点击表格预览可查看发布后的页面。</Alert>' },
        gridFooter: '',
        //弹出框(修改、编辑、查看)header、content、footer对应位置扩充的组件
        modelHeader: '',
        modelBody: '',
        modelFooter: ''
    },
    buttons: [],//扩展的按钮
    methods: {//事件扩展
        onInit() {
            let column = this.columns.find(x => {
                return x.field == "DetailUrl";
            });
            if (!column) return;
            column.title = "链接地址";
            column.formatter = (row, column) => {
                let url = row.DetailUrl;
                console.log(url);
                return '<a href="javascript:void();" >预览</a>';
            }
            column.click = function (row, column) {
                window.open(row.DetailUrl);
            }
        },
        onInited() {
      
        }
    }
};
export default extension;