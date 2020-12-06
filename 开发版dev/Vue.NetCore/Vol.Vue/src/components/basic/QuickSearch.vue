<template>
  <div>
    <Select clearable
            v-if="singleSearch.type=='drop'||singleSearch.type=='dropList'||
              singleSearch.type=='select'||singleSearch.type=='selectList'"
            v-model="searchFormFields[singleSearch.field]"
            :placeholder="'请选择'+singleSearch.title">
      <Option v-for="(kv,kvIndex) in singleSearch.data"
              :key="kvIndex"
              :value="kv.key||''">{{kv.value}}</Option>
    </Select>

    <DatePicker clearable
                :type="singleSearch.dateType"
                v-else-if="singleSearch.type=='date'||singleSearch.type=='datetime'"
                :format="singleSearch.type=='date'? 'yyyy-MM-dd':'yyyy-MM-dd HH:mm:ss'"
                :placeholder="singleSearch.title"
                @on-change="
                      (time) => {
                        this.searchFormFields[this.singleSearch.field] = time;}"
                v-model="searchFormFields[singleSearch.field]"></DatePicker>

    <Input clearable
           v-else
           v-model="searchFormFields[singleSearch.field]"
           :placeholder="singleSearch.title"
           @on-keypress="tiggerPress" />
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
      default: () => { },
    },
  },
  created () {
    //2020.11.14增加查询时日期单选操作
    //  onInited () {
    //  this.singleSearch.range = false;
    // this.searchFormOptions[0][0].range = false;
    //   }

    this.singleSearch.dateType = this.singleSearch.type + "range";
    if (this.singleSearch.type == 'date' || this.singleSearch.type == 'datetime') {
      var _dateVal = this.searchFormFields[this.singleSearch.field];
      if (typeof (this.singleSearch.range) == "boolean" && !this.singleSearch.range) {
        this.searchFormFields[this.singleSearch.field] = "";
        this.singleSearch.dateType = this.singleSearch.type;
        return this.singleSearch.dateType;
      } else if (!(_dateVal instanceof Array)) {
        this.searchFormFields[this.singleSearch.field] = ["", ""];
      }
      else if (_dateVal.length != 2) {
        _dateVal.splice(0);
        _dateVal.push(...["", ""])
      }
    }
  },
};
</script>