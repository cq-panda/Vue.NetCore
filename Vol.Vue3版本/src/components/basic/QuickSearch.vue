<template>
  <div>
    <el-select
      size="small"
      v-if="['select', 'selectList'].indexOf(singleSearch.type) != -1"
      v-model="searchFormFields[singleSearch.field]"
      :filterable="singleSearch.filter || singleSearch.data.length > 10 ? true : false"
      :placeholder="'请选择' + singleSearch.title"
      clearable
    >
      <el-option
        v-for="item in singleSearch.data"
        :key="item.key"
        :label="item.value"
        :value="item.key"
      >
      </el-option>
    </el-select>
    <el-date-picker
      clearable
      style="width: 100%"
      size="small"
      v-else-if="['date', 'datetime'].indexOf(singleSearch.type) != -1"
      v-model="formFields[singleSearch.field]"
      :type="item.type"
      :placeholder="singleSearch.title"
      :disabledDate="(val) => getDateOptions(val, singleSearch.item)"
      :value-format="getDateFormat(singleSearch.item)"
    >
    </el-date-picker>

    <el-input
      clearable
      v-else
          size="small"
      v-model="searchFormFields[singleSearch.field]"
      :placeholder="singleSearch.title"
      @keypress="tiggerPress"
    />
  </div>
</template>
<script>
export default {
  props: {
    singleSearch: {
      type: Object,
      default: {},
    },
    searchFormFields: {
      type: Object,
      default: () => {
        return {};
      },
    },
    tiggerPress: {
      type: Function,
      default: () => {},
    },
  },
  methods: {
    compareDate(date1, date2) {
      if (!date2) {
        return true;
      }
      return (
        date1.valueOf() <
        (typeof date2 == "number" ? date2 : new Date(date2).valueOf())
      );
    },
    getDateOptions(date, item) {
      if ((!item.min && !item.max) || !date) {
        return false;
      }
      if (item.min && item.min.indexOf(" ") == -1) {
        //不设置时分秒，后面会自动加上 08:00
        item.min = item.min + " 00:00:000";
      }
      return (
        this.compareDate(date, item.min) || !this.compareDate(date, item.max)
      );
    },
  },
  created() {
    this.singleSearch.dateType = this.singleSearch.type + "range";
    if (
      this.singleSearch.type == "date" ||
      this.singleSearch.type == "datetime"
    ) {
      var _dateVal = this.searchFormFields[this.singleSearch.field];
      if (
        typeof this.singleSearch.range == "boolean" &&
        !this.singleSearch.range
      ) {
        this.searchFormFields[this.singleSearch.field] = "";
        this.singleSearch.dateType = this.singleSearch.type;
        return this.singleSearch.dateType;
      } else if (!(_dateVal instanceof Array)) {
        this.searchFormFields[this.singleSearch.field] = ["", ""];
      } else if (_dateVal.length != 2) {
        _dateVal.splice(0);
        _dateVal.push(...["", ""]);
      }
    }
  },
};
</script>