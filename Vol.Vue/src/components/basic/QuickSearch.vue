<template>
  <div>
    <Select
      clearable
      v-if="singleSearch.type=='drop'||singleSearch.type=='dropList'||
              singleSearch.type=='select'||singleSearch.type=='selectList'"
      v-model="searchFormFileds[singleSearch.field]"
      :placeholder="'请选择'+singleSearch.title"
    >
      <Option
        v-for="(kv,kvIndex) in singleSearch.data.data"
        :key="kvIndex"
        :value="kv.key||''"
      >{{kv.value}}</Option>
    </Select>

    <DatePicker
      clearable
      v-else-if="singleSearch.type=='date'||singleSearch.type=='datetime'"
      :type="singleSearch.type+'range'"
      :format="singleSearch.type=='date'? 'yyyy-MM-dd':'yyyy-MM-dd HH:mm:ss'"
      :placeholder="singleSearch.title"
      v-model="searchFormFileds[singleSearch.field]"
    ></DatePicker>

    <Input
      clearable
      v-else
      v-model="searchFormFileds[singleSearch.field]"
      :placeholder="singleSearch.title"
      @on-keypress="tiggerPress"
    />
  </div>
</template>
<script>
export default {
  props: {
    singleSearch: {
      type: Object,
      default: {}
    },
    searchFormFileds: {
      type: Object,
      default: {}
    },
    tiggerPress: {
      type: Function,
      default: () => {}
    }
  }
};
</script>