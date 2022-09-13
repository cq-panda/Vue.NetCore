export default {
  initViewColumns(isReset) {
    //初始化自定列配置
    if (isReset) {
      this.resetViewColumns();
    }
    if (!this.orginColumnFields) {
      this.orginColumnFields = this.columns.map((c) => {
        return c.field;
      });
    }
    this.viewColumns = this.columns
      .filter((c) => {
        return !c.hidden && !c.render;
      })
      .map((c) => {
        return { field: c.field, title: c.title, show: !c.hidden };
      });
    if (isReset) {
      return;
    }
    this.getCacheViewColumn();
  },
  getViewCacheKey(){
    return 'custom:column'+this.table.name;
  },
  getCacheViewColumn() {
    try {
      let columns = localStorage.getItem(this.getViewCacheKey());
      if (!columns) return;
      columns = JSON.parse(columns);
      let sortTableColumns = [];
      //弹出框的列
      let _viewColumns = [];
      columns.forEach((column) => {
        let _column = this.viewColumns.find((c) => {
          return c.field == column.field;
        });
        if (_column) {
          _column.show = column.show;
          _viewColumns.push(_column);
        }
        let tableColumn = this.columns.find((c) => {
          return c.field == column.field;
        });
        if (tableColumn) {
          tableColumn.hidden = !column.show;
          sortTableColumns.push(tableColumn);
        }
      });
      //重新排版弹出框自定义列
      let otherColumns = this.viewColumns.filter((c) => {
        return !_viewColumns.some((s) => {
          return c.field == s.field;
        });
      });
            //重新排版弹出框自定义列
      _viewColumns.push(...otherColumns);
      this.viewColumns.splice(0);
      this.viewColumns.push(..._viewColumns);

      this.sortViewColumns(sortTableColumns);
    } catch (error) {
      console.log('设置默认自定义列异常:' + error.message);
    }
  },
  sortViewColumns(sortColumns) {
    if (sortColumns.length) {
      let hiddenColumns = this.columns.filter((c) => {
        return !sortColumns.some((s) => {
          return c.field == s.field;
        });
      });
      sortColumns.push(...hiddenColumns);
      this.columns.splice(0);
      this.columns.push(...sortColumns);
    }
  },
  resetViewColumns() {
    if (!this.orginColumnFields) {
      return;
    }
    let _columns = [];
    this.orginColumnFields.forEach((x) => {
      _columns.push(
        this.columns.find((c) => {
          return c.field == x;
        })
      );
    });
    let otherColumns = this.columns.filter((c) => {
      return !this.orginColumnFields.some((s) => {
        return c.field == s;
      });
    });
    _columns.push(...otherColumns);
    this.columns.splice(0);
    this.columns.push(..._columns);
  },
  showCustomModel() {
    if (!this.viewColumns.length) {
      this.initViewColumns();
    }
    this.viewColumnsClone = JSON.parse(JSON.stringify(this.viewColumns));
    this.viewModel = true;
  },
  closeCustomModel() {
    this.viewModel=false;
    if (this.checkColumnChanged()) {
      this.viewColumns = JSON.parse(JSON.stringify(this.viewColumnsClone));
    }
  },
  checkColumnChanged() {
    return (
      JSON.stringify(this.viewColumns) != JSON.stringify(this.viewColumnsClone)
    );
  },
  saveColumnConfig() {
    let hasShowColumn = this.viewColumns.some((x) => {
      return x.show;
    });
    if (!hasShowColumn) {
      return this.$message.error('至少选择一列显示');
    }
    this.viewModel = false;
    if (this.checkColumnChanged()) {
      let sortColumns = [];
      this.viewColumns.forEach((column) => {
        let _column = this.columns.find((c) => {
          return c.field == column.field;
        });
        if (_column) {
          _column.hidden = !column.show;
          sortColumns.push(_column);
        }
      });
      this.sortViewColumns(sortColumns);
    }
    try {
      localStorage.setItem(this.getViewCacheKey(), JSON.stringify(this.viewColumns));
    } catch (error) {
      console.log('获取自定义列异常:' + error.message);
    }
  }
};
