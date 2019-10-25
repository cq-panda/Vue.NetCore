//1、此文件中的代码都是对基础业务进行扩展，也只能在此处编写代码，其他地方编写的代码会被代码生成器生成的代码覆盖
//2、此文件中的方法会与serviceFilter.js进行合并，终终执行的就是此文件中的方法
//3、components为扩展组件，可自定义页面的头部、body及尾部的额外显示的内容，分别对应的组件为:
//gridHeader、gridBody、gridFooter、modelHeader、modelBody、modelFooter共6个组件位置，如果不需要扩展组件，请忽略此处
//4、text为界面显示额外描述信息
//5、buttons->view/box/detail分别为查询界面、弹出框、弹出框明细表额外扩展的按钮
//6、methods为整个页面所有方法的业务代码扩展，如果需要在界面上的操作前、后编写业务，请覆盖此方法
//7、methods方法中可获取任意vue对象、方法、属性,可查看ViewGridConfig路径下的js文件及ViewGrid.vue的data属性
//如手动刷新表数据:this.search();
//获取表的列配置信息:this.columns  明细表表的配置信息this.detail.columns
//8、获取子组件gridHeader、gridBody、gridFooter、modelHeader、modelBody、modelFooter则使用
//this.$refs.gridHeader获取gridHeader为自己扩展的对象
//9、在子组件gridHeader、gridBody、gridFooter、modelHeader、modelBody、modelFooter的方法中调用并获得父组件
// this.$emit("parentCall", $vue => {}) //$vue为父组件对象，具体使用参考order->GridHeaderExtend.vue文件

//此处的下面的属性与方法都是对基础业务代码的扩展，如果不需要扩展则忽略对应的方法也不要写在下面
//serviceFilter.js
//所的文件都最终会合并到ViewGrid.vue文件中


let extension = {
    components: {//动态扩充组件或组件路径
        //表单header、content、footer对应位置扩充的组件
        gridHeader: () => import("./SellOrderComponents/GridHeaderExtend.vue"),//{ template: "<div>扩展组xx件</div>" },
        gridBody: () => import("./SellOrderComponents/GridBodyExtend.vue"),
        gridFooter: () => import("./SellOrderComponents/GridFooterExtend.vue"),
        //弹出框(修改、编辑、查看)header、content、footer对应位置扩充的组件
        modelHeader: "",
        modelBody: { template: '<Alert type="error">你可以在此处添加业务相关内容</Alert>' },
        modelFooter: () => import("./SellOrderComponents/ModelFooter.vue"),
    },
    text: "示例覆盖全部可扩展方法,前台扩展文件SellOrder.js，后台Partial->SellOrdeService.cs",
    buttons: { //扩展按钮
        view: [//ViewGrid查询界面按钮
            {
                name: "点我",
                icon: 'md-create',
                value: 'Edit',
                class: '',
                type: 'error',
                index: 1,//显示的位置
                onClick: function () { //扩展按钮执行事件
                    //this可以获取所有属性，包括this.$refs.gridHeader/gridBody等获取扩展组件对象
                    // this.$message("测试扩展按钮");
                    this.$refs.gridHeader.model = true;
                }
            }, {
                name: "调用后台",
                icon: 'md-create',
                value: 'Edit',
                class: '',
                type: 'error',
                index: 1,//显示的位置
                onClick: function () { //扩展按钮执行事件
                    this.getServiceDate();
                }
            }],
        box: //新建、编辑弹出框按钮
            [//ViewGrid查询界面按钮
                {
                    name: "点我1",
                    icon: 'md-create',
                    value: 'Edit',
                    class: '',
                    type: 'success',
                    index: 1,//显示的位置
                    onClick: function () {
                        this.$message.error("扩展的明细Box按钮,可设置index值指定显示位置,可使用this.$refs拿到包括自定义扩展的所有组件");
                    }
                }],
        detail: //新建、编辑弹出框明细表table表按钮
            [//ViewGrid查询界面按钮
                {
                    name: "点我2",
                    icon: 'md-create',
                    value: 'Edit',
                    class: '',
                    type: 'success',
                    index: 1,//显示的位置
                    onClick: function () {
                        this.$message.error("扩展的明细table按钮,可设置index值指定显示位置");
                    }
                }]
    },//扩展的按钮
    methods: {//方法扩展
        getServiceDate() {
            this.http.post("/api/SellOrder/getServiceDate", {}, '正在调用后台数据').then(date => {
                this.$message.error("从后台获取的服务器时间是：" + date);
            })
        },
        mounted() {
            this.$Notice.success({ title: '执行mounted方法' });
        },
        onInit() {
            this.$Notice.success({ title: 'create方法执行时,你可以此处编写业务逻辑' });
        },
        onInited() {
            //添加扩展属性gridHeader/body/footer后，可以自定再设置表格高度
            this.height = this.height - 140;
            this.$Notice.success({ title: 'create方法执行后', desc: '你可以SellOrder.js中编写业务逻辑,其他方法同样适用' });
        },
        searchBefore(param) { //查询ViewGird表数据前,param查询参数
            //你可以指定param查询的参数，处如果返回false，则不会执行查询
            this.$Notice.success({ title: this.table.cnName + ',查询前' });
            // console.log("扩展的"this.detailOptions.cnName + '触发loadDetailTableBefore');
            return true;
        },
        searchAfter(result) { //查询ViewGird表数据后param查询参数,result回返查询的结果
            this.$Notice.success({ title: this.table.cnName + ',查询结果', desc: '返回的对象：' + JSON.stringify(result) });
            return true;
        },
        searchDetailBefore(param) {//查询从表表数据前,param查询参数
            this.$Notice.success({ title: this.detailOptions.cnName + '查询前' });
            return true;
        },
        searchDetailAfter(data) {//查询从表后param查询参数,result回返查询的结果
            this.$Notice.success({ title: this.detailOptions.cnName + ',查询结果', desc: '返回的对象：' + JSON.stringify(data) });
            return true;
        },
        delBefore(ids, rows) { //查询界面的表删除前 ids为删除的id数组,rows删除的行
            let auditStatus = rows.some(x => { return x.AuditStatus > 0 });
            if (auditStatus) {
                this.$message.error('只能删除未审核的数据')
                return false;
            }
            this.$Notice.success({ title: '删除前，选择的Id:' + ids.join(',') });
            return true;
        },
        delAfter(result) {//查询界面的表删除后
            return true;
        },
        delDetailRow(rows) { //弹出框删除明细表的行数据(只是对table操作，并没有操作后台)
            console.log(rows)
            return true;
        },
        addBefore(formData) { //新建保存前formData为对象，包括明细表

            this.$Notice.success({ title: this.detailOptions.cnName + '新建前：', desc: '提前的数据：' + JSON.stringify(formData) });
            return true;
        },
        addAfter(result) {//新建保存后result返回的状态及表单对象
            this.$Notice.success({ title: this.detailOptions.cnName + '新建完成后：', desc: '返回的数据' + JSON.stringify(result) });
            return true;
        },
        updateBefore(formData) { //编辑保存前formData为对象，包括明细表、删除行的Id
            this.$Notice.success({ title: this.detailOptions.cnName + '编辑前：', desc: '提前的数据：' + JSON.stringify(formData) });
            //获取扩展的modelFooter属性text
            console.log(this.$refs.modelFooter.text)
            return true;
        },
        updateAfter(result) {//编辑保存后result返回的状态及表单对象
            this.$Notice.success({ title: this.detailOptions.cnName + '编辑完成后：', desc: '返回的数据' + JSON.stringify(result) });
            return true;
        },
        auditBefore(ids, rows) {//审核前
            if (rows.length > 2) {//每次最多只能审核2条数据
                this.$message.error('最多只能选择两条数据');
                return false;
            }
            return true;
        },
        auditAfter(result, rows) {// 审核后
            if (result.status) {
                result.message = "审核成功。。。。。" + result.message;
            }
            return true;
        },
        resetAddFormBefore() { //重置新建表单前的内容
            return true;
        },
        resetAddFormAfter() { //重置新建表单后的内容
            //如果某些字段不需要重置，则可以重新赋值
            this.editFormFileds.Remark = '新建重置默认值66666';
            //给明细表添加默认一行
            this.$refs.detail.rowData.push({ Remark: "新建666666" });
            return true;
        },
        resetUpdateFormBefore() { //重置编辑表单前的内容
            //this.editFormFileds当前值
            console.log(this.editFormFileds)
            //当前明细表的行
            console.log(this.$refs.detail.rowData)
            return true;
        },
        resetUpdateFormAfter() { //重置编辑表单后的内容
            //如果某些字段不需要重置，则可以重新赋值
            this.editFormFileds.Remark = '编辑重置默认值66666';
            //给明细表添加默认一行
            this.$refs.detail.rowData.push({ Remark: "编辑666666" });
            return true;
        },
        importAfter(data) { //导入excel后刷新table表格数据
            this.search(); //刷新table
        },
        modelOpenBefore(row){ //点击编辑/新建按钮弹出框前，可以在此处写逻辑，如，从后台获取数据

        },
        modelOpenAfter(row) {  //点击编辑/新建按钮弹出框后，可以在此处写逻辑，如，从后台获取数据
            this.$message.error("此处是打开弹出框后事件,当前操作：" + this.currentAction + "，你可以在此处编写逻辑，如，从后台获取数据");
        },
    }
};
export default extension;