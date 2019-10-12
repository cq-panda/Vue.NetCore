<template>
  <div>
    <div class="vol-table">
      <div class="mask" v-show="loading"></div>
      <div class="message" v-show="loading">加载中.....</div>
      <el-table
        @row-click="beginEdit"
        @cell-mouse-leave="endEdit"
        ref="table"
        class="v-table"
        @sort-change="sortChange"
        tooltip-effect="dark"
        :height="height"
        :data="url?rowData:tableData"
        border
        :row-class-name="initIndex"
        style="width: 100%"
      >
        <!-- @row-click="rowClick" -->
        <!-- <el-table-column type="index"  :index="initIndex"></el-table-column> -->
        <el-table-column type="selection" width="55"></el-table-column>
        <el-table-column
          v-for="(column,cindex) in filterColumns()"
          :key="cindex"
          :prop="column.field"
          :label="column.title"
          :min-width="column.width"
          :formatter="formatter"
          :fixed="column.fixed"
          :sortable="cindex==0?'custom':false"
        >
          <template slot-scope="scope">
            <!-- 启用双击编辑功能，带编辑功能的不会渲染下拉框文本背景颜色 -->
            <!-- @click="beginEdit(scope.$index,cindex)" -->
            <div v-if="column.edit">
              <!-- <div @mouseover="endEdit" v-if="edit.rowIndex!=scope.$index"> -->
              <div v-if="edit.rowIndex!=scope.$index">{{formatter(scope.row,column,true)}}</div>
              <DatePicker
                v-else-if="column.edit.type=='date'||column.edit.type=='datetime'"
                :type="column.edit.type"
                :format="column.edit.type=='date'? 'yyyy-MM-dd':'yyyy-MM-dd HH:mm:ss'"
                :placeholder="column.title"
                :value="scope.row[column.field]"
                @on-change="(time)=>{scope.row[column.field]=time; return time}"
              ></DatePicker>
              <i-switch
                v-else-if="column.edit.type=='switch'"
                :true-value="1"
                :false-value="0"
                v-model="scope.row[column.field]"
              >
                <span slot="open">是</span>
                <span slot="close">否</span>
              </i-switch>
              <!--如果是1或0请加上属性 true-value="1" false-value="0" 
               如果value是字符串数字则使用 :true-value="1" :false-value="0"
              -->
              <Select
                v-else-if="column.edit.type=='select'"
                v-model="scope.row[column.field]"
                :placeholder="'请选择'+column.title"
                clearable
              >
                <Option
                  v-for="(kv,kvIndex) in getSelectedOptions(column)"
                  :key="kvIndex"
                  :value="kv.key||''"
                >{{kv.value}}</Option>
              </Select>
              <Input
                v-else
                clearable
                v-model="scope.row[column.field]"
                :placeholder="'请输入'+column.title"
              ></Input>
            </div>
            <!--没有编辑功能的直接渲染标签-->
            <div v-else>
              <a
                href="javascript:void(0)"
                @click="link(scope.row,column)"
                v-if="column.link"
                v-text="scope.row[column.field]"
              ></a>
              <img
                :onerror="defaultImg"
                @click="viewImg(scope.row,column)"
                class="table-img"
                v-else-if="column.type=='img'"
                :src="scope.row[column.field]"
              />
              <Tag v-else-if="column.type=='date'">{{formatterDate(scope.row,column)}}</Tag>
              <div
                v-else-if="column.formatter"
                @click="formatterClick(scope.row,column)"
                v-html="column.formatter(scope.row,column)"
              ></div>
              <Tag
                v-else-if="(column.bind)"
                :color="getColor(scope.row,column)"
              >{{formatter(scope.row,column,true)}}</Tag>
              <div v-else>{{formatter(scope.row,column,true)}}</div>
            </div>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <div class="block pagination" v-if="!paginationHide">
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="paginations.page"
        :page-sizes="[30, 60, 100,300,500]"
        :page-size="paginations.size"
        layout="total, sizes, prev, pager, next, jumper"
        :total="paginations.total"
      ></el-pagination>
    </div>
  </div>
</template>
<script>
var $vue;
export default {
  components: {},
  props: {
    tableData: {
      type: Array,
      default: () => {
        return [];
      }
    },
    columns: {
      type: Array,
      default: []
      //[ {
      //   field: "columnType",
      //   title: "数据类型",
      //   width: 120,
      //   hidden:false,
      //   align: "left",
      //   edit: { type: "text", status: false, data: [], key: "" }
      // }] //列的的数据格式edit格式： type类型(text,date,datetime,select,switch),status是否默认为编辑状态
      //data如果是select这里data应该有数据源，如果没有数据请设置key字典编号
    },
    height: {
      type: Number,
      default: 300
    },
    linkView: {
      type: Function,
      default: function() {
        return 1;
      }
    },
    pagination: {
      type: Object,
      default: function() {
        return { total: 0, size: 0, sortName: "" };
      }
    },
    url: {
      type: String,
      default: ""
    },
    paginationHide: {
      type: Boolean,
      default: false
    },
    color: {
      type: Boolean,
      default: true
    },
    index: {
      //是否创建索引号,如果需要表格编辑功能，这里需要设置为true
      type: Boolean,
      default: false
    },
    allowEmpty: {
      //表格数据为空时是否默认为--
      type: Boolean,
      default: true
    },
    defaultLoadPage: {
      //传入了url，是否默认加载表格数据
      type: Boolean,
      default: true
    }
  },
  data() {
    return {
      key: "",
      enableEdit: false, //是否启表格用编辑功能
      empty: this.allowEmpty ? "" : "--",
      defaultImg: 'this.src="' + require("@/assets/imgs/error.png") + '"',
      loading: false,
      footer: {},
      total: 0,
      formatConfig: {},
      defaultColor: "default",
      colors: [
        "success",
        "primary",
        "error",
        "warning",
        "magenta",
        "red",
        "volcano",
        "orange",
        "gold",
        "green",
        "cyan",
        "blue",
        "geekblue",
        "#FFA2D3",
        "default"
      ],
      columnNames: [],
      rowData: [],
      paginations: {
        sort: "",
        order: "desc",
        Foots: "",
        total: 0,
        size: 0,
        Wheres: [],
        page: 1,
        rows: 30
      },
      edit: { columnIndex: -1, rowIndex: -1 }, //当前双击编辑的行与列坐标
      editStatus: {}
    };
  },
  created() {
    this.paginations.sort = this.pagination.sortName;
    this.enableEdit = this.columns.some(x => {
      return x.hasOwnProperty("edit");
    });
    let keyColumn = this.columns.find(x => {
      return x.isKey;
    });
    if (keyColumn) {
      this.key = keyColumn.field;
    }
    //如果下拉框，判断bind或edit.data是否有数据源，妱果没有则获取数据源bind
    $vue = this;
    // this.$emit
    this.defaultLoadPage && this.load();
  },
  methods: {
    getSelectedOptions(column) {
      if (column.bind && column.bind.data && column.bind.data.length > 0) {
        return column.bind.data;
      }
      return [];
    },
    formatterClick(row, column) {
      column.click && column.click.call(this, row, column);
    },
    initIndex(obj) {
      if (this.index) {
        obj.row.elementIdex = obj.rowIndex;
      }
      return "";
    },
    toggleEdit(event) {},
    setEditStatus(status) {
      this.columns.forEach(x => {
        if (x.hasOwnProperty("edit")) {
          this.$set(x.edit, "status", status);
        }
      });
    },
    beginEdit(row, column, event) {
      if (!this.enableEdit) return;
      if (row.hasOwnProperty("elementIdex")) {
        if (this.edit.rowIndex == row.elementIdex) {
          return;
        }
        this.edit.rowIndex = row.elementIdex;
      }
    },
    // beginEdit(scopeIndex, cindex) {
    // //  this.edit.rowIndex = scopeIndex;
    //   //this.edit.columnIndex=cindex;
    // },
    endEdit() {
      if (!this.enableEdit) return;
      this.edit.rowIndex = -1;
      //this.edit.columnIndex=-1;
    },
    delRow() {
      let rows = this.getSelected();
      if (rows.length == 0) return this.$message.error("请选择要删除的行!");

      let data = this.url ? this.rowData : this.tableData;
      let indexArr = this.getSelectedIndex();
      if (indexArr.length == 0) {
        return this.$message.error("删除操作必须设置VolTable的属性index='true'")
      }
      // if (indexArr.length == 0 || !this.key) {
      //   return this.$message.error(
      //     "请设置index=true属性或指columns的字段为key"
      //   );
      // }
      if (indexArr.length == 0) {
        // let keyValues=[]
        // rows.forEach(x=>{
        //   if (x[this.key]) {
        //   }
        //   keyValues.push(x[this.key])
        // })
        // data.find(x=>)
      } else {
        for (let i = data.length - 1; i >= 0; i--) {
          if (indexArr.indexOf(i) != -1) {
            data.splice(i, 1);
          }
        }
      }

      return rows;
    },
    addRow(row) {
      this.rowData.push(row);
    },
    viewImg(row, column) {
      window.open(row[column.field]);
    },
    link(row, column) {
      this.$props.linkView(row, column);
    },
    getSelected() {
      return this.$refs.table.selection;
    },
    getSelectedIndex() {
      if (!this.index) {
        //只有设置了属性index才有索引行
        return [];
      }
      let indexArr = this.$refs.table.selection.map(x => {
        return x.elementIdex;
      });
      return indexArr ? indexArr : [];
    },
    load(query,isResetPage) {//isResetPage重置分页数据
      if (!this.url) return;
      if (isResetPage) {
        this.resetPage();
      }
      let param = {
        page: this.paginations.page,
        rows: this.paginations.rows,
        sort: this.paginations.sort,
        order: this.paginations.order
      };
      let status = true;
      if (query) {
        param = Object.assign(param, query);
      }
      //查询前处理
      this.$emit("loadBefore", param, result => {
        status = result;
      });
      if (!status) return;

      if (param.wheres && typeof param.wheres == "object") {
        param.wheres = JSON.stringify(param.wheres);
      }
      this.loading = true;
      this.http.post(this.url, param).then(
        data => {
          this.loading = false;
          //查询返回结果后处理
          this.$emit("loadAfter", data.rows || [], result => {
            status = result;
          });
          if (!status) return;
          this.rowData = data.rows || [];
          this.paginations.total = data.total;
        },
        error => {
          this.loading = false;
          // this.$Message.error(error || "网络异常");
        }
      );
    },
    filterColumns() {
      return this.columns.filter(x => {
        return !x.hidden;
      });
    },
    handleSizeChange(val) {
      this.paginations.rows = val;
      this.load();
    },
    handleCurrentChange(val) {
      this.paginations.page = val;
      this.load();
    },
    sortChange(sort) {
      this.paginations.sort = sort.prop;
      this.paginations.order = sort.order == "ascending" ? "asc" : "desc";
      this.load();
    },
    resetPage(){  //重置查询分页
      this.paginations.rows=30;
      this.paginations.page=1;
    },
    handleSelectionChange(row) {
      this.$refs.table.toggleRowSelection(row);
    },
    getColor(row, column) {
      let val = row[column.field];

      // if (val == "" || val == null || val == undefined) {
      //  return "none";
      // }

      if (!val && val != "0") {
        return this.defaultColor;
      }
      if (!this.formatConfig[column.field]) {
        this.formatConfig[column.field] = [val];
        return this.colors[0];
      }
      let index = this.formatConfig[column.field].indexOf(val);
      if (index != -1) {
        return this.colors[index];
      }
      if (this.formatConfig[column.field].length > 15) {
        return this.defaultColor;
      }

      if (index == -1) {
        this.formatConfig[column.field].push(val);
        index = this.formatConfig[column.field].length - 1;
      }
      return this.colors[index];
    },
    formatterDate(row, column) {
      return (row[column.field] || "").substr(0, 10);
    },
    formatter(row, column, template) {
      if (!template) return row[column.property];
      let val = row[column.field];
      //是否值
      if (column.edit && column.edit.type == "switch") {
        return val ? "是" : "否";
      }
      if (!column.bind || !column.bind.data) {
        return row[column.field];
      }
      if (!val && val != 0) return val;
      let source = column.bind.data.filter(x => {
        return x.key != "" && x.key == val;
      });
      if (source && source.length > 0) val = source[0].value;
      return val;
    }
  }
};
</script>
<style lang="less" scoped>
.vol-table {
  position: relative;
  .mask {
    opacity: 0.2;
    position: absolute;
    width: 100%;
    height: 100%;
    background: #d0d0d0;
    z-index: 100;
  }
  .message {
    text-align: center;
    color: #635c5c;
    font-size: 15px;
    font-weight: 600;
    background: #eee;
    transform: translateY(-50%);
    top: 50%;
    position: absolute;
    z-index: 200;
    left: 0;
    right: 0;
    width: 150px;
    margin: 0 auto;
    line-height: 40px;
    border-radius: 4px;
    border: 1px solid #a09e9e;
  }
}
</style>


<style scoped>
/*表头错行 .el-table th.gutter{
    display: table-cell!important;
} */
.pagination {
  text-align: right;
  /* margin-top: 8px; */
  padding: 2px 28px;
  border: 1px solid #eee;
  border-top: 0px;
}
.v-table >>> .el-table__header th {
  padding: 1.5px !important;

  background-color: #f8f8f9 !important;
  font-size: 13px;
}
.v-table >>> .el-table__body .cell {
  word-break: inherit !important;
  white-space: nowrap !important;
}
.v-table >>> .el-table__body td {
  padding: 7px 0 !important;
}
.vol-table >>> .el-table th > .cell {
  white-space: inherit !important;
}
.vol-table >>> .el-table__body-wrapper::-webkit-scrollbar {
  width: 10px;
  height: 10px;
}
.vol-table >>> .el-table__body-wrapper::-webkit-scrollbar-thumb {
  border-radius: 5px;
  background: #ddd;
}
.vol-table .table-img {
  height: 70px;
}
.vol-table .table-img:hover {
  cursor: pointer;
}
.v-table >>> .ivu-tag-default {
  border: none !important;
  background: none !important;
}
/* .spin-icon-load{
        animation: ani-demo-spin 1s linear infinite;
    }
    @keyframes ani-demo-spin {
        from { transform: rotate(0deg);}
        50%  { transform: rotate(180deg);}
        to   { transform: rotate(360deg);}
    }
    .message{
        height: 50px;
        position: relative;
        border: 1px solid #eee;
    } */
</style>

