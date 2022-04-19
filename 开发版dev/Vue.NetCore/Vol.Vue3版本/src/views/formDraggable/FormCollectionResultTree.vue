<template>
  <div class="form-container">
    <el-scrollbar class="left-title" style="height: 100%">
      <h4>数据列表</h4>
      <ul>
        <li
          @click="loadById(item)"
          v-for="(item, index) in leftTitles"
          :key="index"
          :class="{ active: item.formId == formId }"
        >
          {{ item.title }}
        </li>
      </ul>
    </el-scrollbar>

    <div class="f-table">
      <FormCollectionObject ref="table"></FormCollectionObject>
    </div>
  </div>
</template>

<script>
import FormCollectionObject from "../system/form/FormCollectionObject";
export default {
  components: {
    FormCollectionObject,
  },
  data() {
    return {
      formId: "",
      leftTitles: [],
    };
  },
  methods: {
    loadById(item) {
      this.formId = item.formId;
      this.$refs.table.$refs.grid.loadById(item);
    },
  },
  created() {
    this.http
      .get("api/formDesignOptions/getList", {}, true)
      .then((x) => {
        this.leftTitles = x;
        if (x.length) {
          this.$nextTick(() => {
            this.loadById(x[0]);
          });
        }
      });
  },
};
</script>

<style lang="less" scoped>
.form-container {
  padding: 8px;
    background: #eee;
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  display: flex;
  .left-title {
    background: #ffff;
    width: 220px;
    border-right: 9px solid #eeee;
    h4 {
      padding: 9px 10px;
      border-bottom: 1px solid #eee;
    }
    ul{
      padding: 0;
    margin: 0;
    }
    li {
      font-size: 14px;
      cursor: pointer;
      list-style: none;
      padding: 10px 12px;
      border-bottom: 1px solid #f3f3f3;
    }
    li:hover,
    .active {
      background: #ecf5ff;
    }
  }
  > .f-table {
    width: 0;
    flex: 1;
  }
}
</style>