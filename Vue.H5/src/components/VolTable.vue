<template>
  <div
    class="vol-table"
    :class="[cellOverflowHidden ? 'vol-cell-overflow-hidden' : '']"
  >
    <div class="col-header">
      <div
        class="col-cell"
        :style="getStyle(column)"
        v-for="(column, index) in filterColumns()"
        :key="index"
      >
        {{ column.title }}
      </div>
    </div>
    <PullRefreshList
      :immediate-check="false"
      :default-load="true"
      :getUrl="getUrl"
      :height="bodyHeight"
      httpType="post"
      :loadDataAfter="loadDataAfter"
      ref="PRL"
      :index="'1'"
      :lazy-load="lazyLoad"
    >
      <template slot-scope="scope">
        <div class="col-body">
          <div
            class="col-rows"
            v-for="(row, index) in scope.list"
            :key="index"
            @click="rowClick(row, index)"
          >
            <div
              class="col-cell"
              :style="getStyle(column)"
              v-for="column in fields"
              :key="column.field"
            >
              <div v-if="column.type == 'img'">
                <img
                  class="tb-cell-img"
                  v-for="(imgItem, imgIndex) in getImgs(row[column.field])"
                  :src="imgItem"
                  :key="imgIndex"
                />
              </div>
              <div
                v-else-if="column.formatter"
                v-html="column.formatter(row[column.field], row, column)"
              ></div>
              <template v-else-if="column.bind">
                {{ converDicValue(row[column.field], column) }}</template
              >
              <template v-else> {{ row[column.field] }}</template>
            </div>
          </div>
        </div>
      </template>
    </PullRefreshList>
  </div>
</template>
<script>
import PullRefreshList from "@/components/PullRefreshList.vue";
export default {
  components: {
    PullRefreshList,
  },
  props: {
    lazyLoad: {//延迟加载 
      type: Boolean,
      default: false,
    },
    cellOverflowHidden: {
      //单元格超出是否隐藏
      type: Boolean,
      defalut: false,
    },
    height: {
      type: Number,
      default: 0,
    },
    queryParams: {
      //查询的参数
      type: Function,
      default: () => {
        return [];
      },
    },
    url: {
      type: String,
      default: "",
    },
    rowClick: {
      type: Function,
      default: () => {
        return "";
      },
    },
    columns: {
      type: Array,
      default: () => {
        return [];
      },
    },
  },
  data() {
    return {
      bodyHeigth: 0,
      fields: [],
      keySource: {},
      imgFields: [], //图片字段
      list: [],
    };
  },
  methods: {
    getCellStyle(column) {
      if (column.type == "img") {
        return { "line-height": "40px" };
      }
      return "";
    },
    getImgs(imgs) {
      if (!imgs) return [];
      var _imgs = imgs.split(",");
      return _imgs
        .filter((x) => {
          return x;
        })
        .map((m) => {
          if (m.substr(0, 4) == "http") {
            return m;
          }
          return this.http.ipAddress + m;
        });
    },
    reload() {
      this.$refs.PRL.refresh();
    },
    filterColumns() {
      return this.columns.filter((x) => {
        return !x.hidden;
      });
    },
    getStyle(column) {
      if (column.width) {
        return "width:" + column.width + "px";
      }
      return "flex: 1";
    },
    isEmpty(val) {
      return val === "" || val === null || val === undefined;
    },
    converDicValue(val, column) {
      if (this.isEmpty(val)) return "";
      if (column.bind.type == "selectList") {
        var _values = [];
        var _array = (val + "").split(",");
        for (let index = 0; index < _array.length; index++) {
          if (!this.isEmpty(_array[index])) {
            _values.push(this.getDicValue(_array[index], column));
          }
        }
        return _values.join(",");
      }
      return this.getDicValue(val, column);
    },
    getDicValue(val, column) {
      var kv = column.bind.data.find((x) => {
        return x.key + "" === val + "";
      });
      return kv ? kv.value : val;
    },
    getUrl() {
      var params = {};
      params.wheres = this.queryParams();
      return {
        url: this.url,
        params: { wheres: JSON.stringify(params.wheres) },
      };
    },
    loadDataAfter(rows) {
      this.$emit("loadTableAfter", rows);
    },
  },
  created() {
    if (!this.height) {
      this.bodyHeight = document.body.clientHeight - 92;
    } else {
      this.bodyHeight = this.height;
    }
    var keys = [];
    this.columns.forEach((x) => {
      if (!x.hidden) {
        this.fields.push(x);
        if (x.bind && x.bind.key) {
          if (!x.bind.data) {
            x.bind.data = [];
          }
          if (!x.bind.data.length) {
            keys.push(x.bind.key);
          }
          this.keySource[x.bind.key] = x.bind.data;
        }
      }
    });
    if (keys.length) {
      this.http
        .post("/api/Sys_Dictionary/GetVueDictionary", keys)
        .then((dic) => {
          dic.forEach((x) => {
            x.data.forEach((x) => {
              x.key = x.key + "";
            });
            this.keySource[x.dicNo].push(...x.data);
          });
        });
    }

    // this.http.post("/api/Sys_Log/getPageData", {}, true).then((x) => {
    //   this.loadDataAfter(x.rows);
    //   this.list = x.rows;
    // });
  },
};
</script>
<style lang="less" scoped>
.col-header {
  display: flex;
  .col-cell {
    padding: 15px 5px;
    font-size: 12px;
    background: #f3f2f2;
    font-weight: bold;
    text-align: center;
  }
}
.col-body {
  .col-rows {
    display: flex;
    border-bottom: 1px solid #f1eded;
  }
  .col-cell {
    text-align: center;
    width: 200px;
    padding: 15px 5px;
    font-size: 13px;
    background: white;
  }
}
.vol-cell-overflow-hidden .col-cell {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
.tb-cell-img {
  margin-right: 0.5rem;
  height: 3rem;
  width: 3rem;
  border-radius: 5px;
  object-fit: cover;
}
</style>