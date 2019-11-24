//从表方法
let detailMethods = {
    //查询从表前先做内部处理
    loadInternalDetailTableBefore(param, callBack) {//加载明细表数据之前,需要设定查询的主表的ID
        //每次只要加载明细表格数据就重置删除明细的值
        if (this.detailOptions.delKeys.length > 0) {
            this.detailOptions.delKeys = [];
        }
        let key = this.table.key;
        if (this.currentRow && this.currentRow.hasOwnProperty(key)) {
            param.value = this.currentRow[key];
        }
        return this.loadDetailTableBefore(param, callBack);
    },
    resetDetailTable(row) {//编辑和查看明细时重置从表数据
        if (!this.detailOptions.columns || this.detailOptions.columns.length == 0) {
            return;
        }
        let key = this.table.key;
        let query = { value: row ? row[key] : this.currentRow[key] }
        if (this.$refs.detail) {
            this.$refs.detail.reset();
            this.$refs.detail.load(query);
        }
    },
    //从后面加载从表数据
    refreshRow() {
        this.resetDetailTable();
    },
    addRow() {
        this.$refs.detail.addRow({});
        //  this.detailOptions.columns.push({});
    },
    delRow() {
        let rows = this.$refs.detail.getSelected();
        if (!rows || rows.length == 0) {
            return this.$message.error("请选择要删除的行!");
        }
        if (!this.delDetailRow(rows)) {
            return false;
        }
        this.$Modal.confirm({
            title: "删除警告!",
            content:
                '<p style="color: red;font-weight: bold;letter-spacing: 3px;">确认要删除选择的数据吗?</p>',
            onOk: () => {
                rows = this.$refs.detail.delRow();
                let key = this.detailOptions.key;
                //记录删除的行数据
                rows.forEach(x => {
                    if (x.hasOwnProperty(key) && x[key]) {
                        this.detailOptions.delKeys.push(x[key]);
                    }
                })

            }
        });
    }
}

export default detailMethods;