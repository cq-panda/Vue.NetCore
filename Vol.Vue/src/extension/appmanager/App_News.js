//只处只是对当前代码生成后的App_News.vue页面进行扩展文本编辑器
//动态扩展设置【设置封面】【生成静态页面】【预览页面】按钮
//因为使用的文本编辑器，需要将弹出框的大小，否则弹出框太小不易操作
//Content字段为App_News表的文本内容存储字段，在代码生成器中将Content这段的编辑行设置为0可以编辑
//实现保存或新建前的方法，将文本编辑内容Content提交到后台
/////////////////////////////////////////////////////
//所有扩展与属性文档参照:api组件->代码生成后页面viewGrid
import AsyncLoading from "@/components/basic/AsyncLoading.vue";
let extension = {
    components: {//动态扩充组件或组件路径
        //表单header、content、footer对应位置扩充的组件
        gridHeader: () => import("./App_News/App_NewGirdHeader.vue"),
        gridBody: {
            template: `<div>
            <Alert type="success" show-icon>
            页面打开异常
            <template
                slot="desc"
            >如果本地打开此页面提示异常,请在代码生成器找到：静态页面发布->新闻列表，点击:同步表结构->生成model->保存->生成vue页面</template>
            </Alert>
          </div>`},
        gridFooter: '',
        //弹出框(修改、编辑、查看)header、content、footer对应位置扩充的组件
        modelHeader: '',
        modelBody: () => ({ component: import("./App_News/App_NewsModelBody.vue"), loading: AsyncLoading }),
        modelFooter: ''
    },
    text: "静态文件没有提交到github，本地重新生成下静态页面与设置封面即可预览",
    //如果不需要权限判断直接将扩展按钮加到此处
    //需要权限判断的可按下面initButton方法进行扩展按钮
    buttons: {
        view: [//ViewGrid查询界面扩展的按钮
            // {
            //     name: "设置封面",
            //     icon: 'md-create',
            //     value: 'Edit',
            //     class: '',
            //     type: 'info',
            //     index: 2,//显示的位置
            //     onClick: function () {
            //         this.setCover();
            //     }
            // }],
            // box: [ //弹出框扩展的按钮
            //     {
            //         name: "生成静态页面",
            //         icon: 'ios-cart',
            //         type: 'error',
            //         index: 0,//显示的位置
            //         onClick: function () { //扩展按钮执行事件
            //             this.publish();
            //         }
            //     }, {
            //         name: "预览页面",
            //         icon: 'ios-globe',
            //         type: 'info',
            //         index: 1,//显示的位置
            //         onClick: function () { //扩展按钮执行事件
            //             if (!this.currentRow
            //                 || !this.currentRow.Content
            //                 || !this.currentRow.DetailUrl) {
            //                 return this.$Message.error("请先【保存】,再点击【生成静态页面】")
            //             }
            //             this.preview(this.currentRow);
            //         }
            //     }
        ]
    },
    methods: {
        initButton() {
            //当前用户是否有编辑或新建权限
            //或者读取当前用户的按钮权限:
            //1、 this.permission.getButtons('App_News')//App_News为菜单配置的url表名
            //或者2、 this.$store.state.system.permission获取用户的所有权限信息
            if (this.currentReadonly) { return; }
            this.buttons.splice(2, 0, {
                name: "设置封面", icon: 'md-create', value: 'Edit', type: 'info',
                onClick: function () { this.setCover(); }
            })
            //添加弹出框生成静态页面的按钮
            this.boxButtons.splice(0, 0, ...[{
                name: "生成静态页面", icon: 'ios-cart', type: 'info',
                onClick: function () { this.publish(); }
            },
            {
                name: "预览页面", icon: 'ios-globe', type: 'info',
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
            //根据用户权限初始化按钮
            this.initButton();
            //将当前vue对象写入vuex来操作kindeditor
            //或者使用 this.$emit("parentCall", $vue => {})在子组件中操作父组件
            this.$store.getters.data().editor = this;
            //设置保存成功后，不关闭弹出框
            this.boxOptions.saveClose = false;
            //设置查询表格只能单选
            this.single = true;
            //手动设置弹出框高与宽度
            this.boxOptions.height = document.documentElement.clientHeight * 0.8
            this.boxOptions.width = document.documentElement.clientWidth * 0.8;
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
        modelOpenAfter(row) { }, //点击编辑/新建按钮弹出框后，可以在此处写逻辑，如，从后台获取数据
        addBefore(formData) {//新建前验证
            return this.validContent(formData);
        },
        updateBefore(formData) { //修改前验证
            return this.validContent(formData);
        },
        validContent(formData) {
            if (!this.currentRow.Content) {
                this.$Message.error("请编辑要发布的内容");
                return false;
            }
            formData.mainData.Content = this.currentRow.Content;
            return true;
        },
        preview(row) { //预览html页面
            if (!row.DetailUrl || row.DetailUrl.indexOf('.html') == -1 || !this.base.isUrl(this.http.ipAddress + row.DetailUrl)) {
                return this.$Message.error("请先发布静态页面")
            }
            window.open(this.http.ipAddress + row.DetailUrl);
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
                    // this.editFormFileds.DetailUrl = x.data.url;
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
            this.$refs.gridHeader.fileInfo = this.getFilePath(rows[0].ImageUrl) || [];
            this.$refs.gridHeader.model = true;
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