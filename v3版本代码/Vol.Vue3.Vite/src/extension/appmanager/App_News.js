import gridHeader from './App_News/App_NewGirdHeader'

import { h, resolveComponent } from 'vue';
let extension = {
    components: {//动态扩充组件或组件路径
        gridHeader: gridHeader,
        gridBody: {
            render() {
                return [
                    h(resolveComponent('el-alert'), {
                        style: { 'margin-bottom': '12px' },
                        'show-icon': true, type: 'warning',
                        closable: false, title: '发布静态页面、页面预览见:App_News.js'
                    }, ''),
                ]
            }
        },
        gridFooter: '',
        modelHeader: '',
        modelFooter: ''
    },
    text: "静态文件没有提交到github，本地重新生成下静态页面与设置封面即可预览",
    buttons: {
        view: [//ViewGrid查询界面扩展的按钮
        ]
    },
    methods: {
        initButton() {
            //当前用户是否有编辑或新建权限
            if (this.currentReadonly) { return; }

            this.buttons.splice(2, 0, {
                name: "设置封面", icon: 'el-icon-picture', value: 'Edit', type: 'primary',
                onClick: function () { this.setCover(); }
            })
            //添加弹出框生成静态页面的按钮
            this.boxButtons.splice(0, 0, ...[{
                name: "生成静态页面", icon: 'el-icon-tickets', type: 'primary',
                onClick: function () { this.publish(); }
            },
            {
                name: "预览页面", icon: 'el-icon-view', type: 'primary',
                onClick: function () {
                    if (!this.currentRow
                        || !this.currentRow.Content
                        || !this.currentRow.DetailUrl) {
                        return this.$Message.error("请先【保存】,再点击【生成静态页面】")
                    }
                    this.preview(this.currentRow);
                }
            }])
        },
        onInit() { //初始化预览与弹出框大小
            //设置表格内容超出换行
            this.textInline=false;
            //根据用户权限初始化按钮
            this.initButton();
            //设置保存成功后，不关闭弹出框
            this.boxOptions.saveClose = false;
            //设置查询表格只能单选
            this.single = true;

            //设置table表格DetailUrl字段点击预览静态页面
            this.editFormOptions.forEach(x => {
                x.forEach(item => {
                    this.columns.forEach(item => {
                        //设置url点击事件
                        if (item.field == 'DetailUrl') {
                            item.title = "页面预览";
                            item.formatter = (row) => { return '<a>预览</a>' }
                            item.click = (row, column, event) => {
                                this.preview(row);
                            }
                        }
                    })
                })
            })
        },
        onInited(){
            this.height = this.height - 50;
        },
        addBefore(formData) {//新建前验证
            return this.validContent(formData);
        },
        updateBefore(formData) { //修改前验证
            return this.validContent(formData);
        },
        validContent(formData) {
            if (!this.editFormFields.Content) {
                this.$Message.error("请编辑要发布的内容");
                return false;
            }
            return true;
        },
        preview(row) { //预览html页面
            if (!row.DetailUrl || row.DetailUrl.indexOf('.html') == -1 || !this.base.isUrl(this.http.ipAddress + row.DetailUrl)) {
                return this.$Message.error("请先发布静态页面")
            }
            window.open(this.http.ipAddress + row.DetailUrl + '?r=' + Math.random());
        },
        publish() { //生成静态页面
            if (!this.currentRow || !this.currentRow[this.table.key]) {
                return this.$Message.error("请先保存数据")
            }
            if (!this.currentRow.Content) {
                return this.$Message.error("请编辑要发布的内容")
            }
            this.http.post("api/news/createPage", this.currentRow).then(x => {
                if (x.status) {
                    // this.editFormFields.DetailUrl = x.data.url;
                    this.currentRow.DetailUrl = x.data.url;
                }
                this.refresh();
                return this.$Message.info(x.message)
            })
        },
        setCover() {  //设置封面图片
            let rows = this.getSelectRows();
            if (rows.length == 0) {
                return this.$Message.error("请选中要设置封面的行")
            }
            //设置封面图片，先获取当前已经图片fileInfo格式见volupdate组件参数说明
            let fileInfo = this.getFilePath(rows[0].ImageUrl) || [];
            this.$refs.gridHeader.open(fileInfo)
        },
        getFilePath(pathSring) {//拆分url并初始化图片到上传组件中
            //获取表的图片与文件显示
            if (!pathSring) return "";
            let fileInfo = [], filePath = pathSring.replace(/\\/g, "/").split(",");
            for (let index = 0; index < filePath.length; index++) {
                let file = filePath[index];
                if (file.indexOf(".") == -1) { continue; }
                let splitFile = file.split("/");
                if (splitFile.length == 0) { continue; }
                fileInfo.push({
                    name: splitFile[splitFile.length - 1],
                    path: this.base.isUrl(file) ? file : this.http.ipAddress + file
                });
            }
            return fileInfo;
        }
    }
};
export default extension;