//从表方法
let detailMethods = {
  //查询从表前先做内部处理
  loadInternalDetailTableBefore(param, callBack) {
    //加载明细表数据之前,需要设定查询的主表的ID
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
  detailRowOnChange(row) {
    this.detailRowChange(row);
  },
  detailRowChange(row) {
    //checkbox选中行事件
  },
  detailRowOnClick({ row, column, event }) {
    //明细表点击行事件2020.11.07
    this.detailRowClick({ row, column, event });
  },
  detailRowClick({ row, column, event }) {},
  resetDetailTable(row) {
    //编辑和查看明细时重置从表数据
    if (!this.detailOptions.columns || this.detailOptions.columns.length == 0) {
      return;
    }
    let key = this.table.key;
    let query = { value: row ? row[key] : this.currentRow[key] };
    this.$nextTick(() => {
      if (this.$refs.detail) {
        this.$refs.detail.reset();
        this.$refs.detail.load(query);
      }
    });
  },
  //从后面加载从表数据
  refreshRow() {
    this.resetDetailTable();
  },
  addRow() {
    this.$refs.detail.addRow({});
    this.$refs.detail.edit.rowIndex=-1;
    this.updateDetailTableSummaryTotal();
  },
  delRow() {
    let rows = this.$refs.detail.getSelected();
    if (!rows || rows.length == 0) {
      return this.$message.error('请选择要删除的行!');
    }
    if (!this.delDetailRow(rows)) {
      return false;
    }

    let tigger = false;
    this.$confirm('确认要删除选择的数据吗?', '警告', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning',
      center: true
    }).then(() => {
      if (tigger) return;
      tigger = true;
      rows = this.$refs.detail.delRow();
      let key = this.detailOptions.key;
      //记录删除的行数据
      rows.forEach((x) => {
        if (x.hasOwnProperty(key) && x[key]) {
          this.detailOptions.delKeys.push(x[key]);
        }
      });
      this.updateDetailTableSummaryTotal();
    });
  },
  updateDetailTableSummaryTotal() {
    //2021.09.25增加明细表删除、修改时重新计算行数与汇总
    //2021.12.12增加明细表判断(强制刷新合计时会用到)
    if (!this.$refs.detail) {
      return;
    }
    //删除或新增行时重新设置显示的总行数
    this.$refs.detail.paginations.total = this.$refs.detail.rowData.length;
    //重新设置合计
    if (this.$refs.detail.summary) {
      this.$refs.detail.columns.forEach((column) => {
        if (column.summary) {
          this.$refs.detail.getInputSummaries(null, null, null, column);
        }
      });
    }
  }
};

export default detailMethods;
