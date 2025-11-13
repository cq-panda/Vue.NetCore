<template>
  <div class="node-filter-container">
    <!-- <div class="add-btn">
          <span class="name">条件设置</span>  <el-button @click="addItem" link><i>+</i>添加字段</el-button>
        </div> -->
    <!-- {{ $store.getters.data().flowTable.WorkTable }} -->
    <div class="ef-node-pmenu-item">
      <div style="flex: 1">
        <span class="name"><i class="el-icon-news"></i>{{ $ts('条件设置') }}</span>
      </div>
      <div>
        <el-button link size="small" @click="addItem" type="primary">
          + {{ $ts('添加字段') }}</el-button
        >
      </div>
    </div>

    <div>
      <table>
        <thead>
          <tr>
            <td>{{ $ts('字段') }}</td>
            <td style="width: 90px">{{ $ts('条件') }}</td>
            <td class="value">{{ $ts('值') }}</td>
            <td style="width: 40px">{{ $ts('操作') }}</td>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(item, index) in filters" :key="index">
            <td>
              <el-select
                @change="
                  (field) => {
                    fieldChange(field, index)
                  }
                "
                size="small"
                v-model="item.field"
                :placeholder="$ts('请选择')"
              >
                <el-option
                  v-for="data in fieldsOptions"
                  :key="data.field"
                  :label="data.name"
                  :value="data.field"
                />
              </el-select>
            </td>
            <td>
              <el-select size="small" v-model="item.filterType" :placeholder="$ts('请选择')">
                <el-option
                  v-for="data in filterType"
                  :key="data.value"
                  :label="data.name"
                  :value="data.value"
                />
              </el-select>
            </td>
            <td>
              <template v-if="item.data">
                <el-select
                  v-if="item.data.length >= 300"
                  multiple
                  size="small"
                  v-model="item.value"
                  :placeholder="$ts('请选择')"
                >
                  <el-option
                    v-for="data in item.data"
                    :key="data.key"
                    :label="data.value"
                    :value="data.key"
                  />
                </el-select>
                <el-select-v2
                  style="width: 100%"
                  v-else
                  multiple
                  size="small"
                  :options="item.data"
                  v-model="item.value"
                  :placeholder="$ts('请选择')"
                >
                </el-select-v2>
              </template>
              <el-input v-else v-model="item.value" size="small"></el-input>
            </td>
            <td @click="delItem(index)" class="item-del"><i class="el-icon-delete"></i></td>
          </tr>
        </tbody>
      </table>
    </div>
    <!-- <div>
            <label>自定义sql</label>
            <div><el-input type="textarea" v-model="customSql"></el-input></div>
        </div> -->
  </div>
</template>

<script>
export default {
  props: {
    tableName: {
      type: String,
      default: ''
    },
    filters: {
      type: Array,
      default: () => {
        return []
      }
    }
  },
  data() {
    return {
      filter: this.$store.getters.data().flowTable,
      customSql: '',
      value: '',
      //{ field: "名称", value: "", filterType: "=" },
      //  filters: [],
      fieldsOptions: [],
      t: [],
      filterType: [
        { name: '等于(=)', value: '=' },
        { name: '不等于(!=)', value: '!=' },
        { name: '大于(>)', value: '>' },
        { name: '大于等于(>=)', value: '>=' },
        { name: '小于(<)', value: '<' },
        { name: '小于等于(<=)', value: '<=' },
        { name: '包括(in)', value: 'in' },
        // { name: "不包括(not in)", value: "notin" },
        { name: '模糊匹配(like)', value: 'like' },
        { name: '或者(or)', value: 'or' }
      ]
    }
  },
  methods: {
    delItem(index) {
      this.$confirm('确认要删除字配置条件配置吗?', '警告', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning',
        center: true
      }).then(() => {
        this.filters.splice(index, 1)
      })
    },
    addItem() {
      this.filters.push({ field: '', value: '', filterType: '', data: null })
    },
    fieldChange(field, index) {
      let option = this.fieldsOptions.find((x) => {
        return x.field == field
      })
      this.filters[index].field = option.field
      this.filters[index].value = option.data ? [] : null
      this.filters[index].data = option.data
    },
    convertOptions(result) {},
    getOptions(tableName) {
      const url = 'api/Sys_WorkFlow/getFields?table=' + tableName
      this.http.post(url, {}, false).then((result) => {
        result.forEach((c) => {
          if (c.data && c.data.length < 300) {
            c.data = c.data.map((x) => {
              return {
                value: x.key,
                label: x.value,
                key: x.key
              }
            })
          }
        })
        this.fieldsOptions = result
      })
    }
  },
  watch: {
    'filter.WorkTable': {
      handler(newvalue, oldvalue) {
        if (newvalue) {
          this.getOptions(newvalue)
        } else {
          //  this.fieldsOptions.splice(0)
        }
      }
    }
    // deep:true,
    // filter(newVal,oldVal){
    //    alert(1)
    // }
  },
  created() {
  }
}
</script>

<style lang="less" scoped>
.node-filter-container {
  margin-top: 15px;

  table {
    width: 100%;
    padding-left: 6px;

    td {
      font-size: 13px;
      padding: 5px;
    }

    tr:first-child {
      font-size: 12px;
      font-weight: bolder;
    }

    .item-del {
      text-align: center;
      color: rgb(226, 4, 4);
      cursor: pointer;
    }

    .value {
      width: 150px;
    }
  }

  .add-btn {
    text-align: right;
    padding-right: 10px;
    border-bottom: 1px solid #e8e8e8;
    padding-bottom: 5px;
  }

  .node-filter-item {
  }
}
.ef-node-pmenu-item {
  display: flex;
  align-items: center;
  height: 40px;
  padding: 10px;
  background: #f8f8f8;
  border: 1px solid #eee;

  .name {
    cursor: pointer;
    margin-right: 15px;
  }

  .active {
    color: #0659e8;
  }
}
</style>
