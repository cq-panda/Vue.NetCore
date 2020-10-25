<template>
  <div class="ds-form-container"
       :class="{'small-line':smallLine,scroll:header}">
    <!-- <van-calendar v-model="showCalendar" @confirm="selectDate" /> -->
    <van-popup v-model="showCalendar"
               position="bottom"
               :style="{ height: '40%' }">
      <van-datetime-picker v-model="currentDate"
                           type="date"
                           title="选择年月日"
                           :min-date="minDate"
                           @cancel="()=>{showCalendar = false;}"
                           @confirm="selectDate"
                           :max-date="maxDate" />
    </van-popup>

    <!-- <ds-header v-if="header" :title="title"></ds-header> -->

    <!-- <van-actionsheet
      :round="false"
      v-model="currentSelector"
      :actions="currentOptions.data||[]"
      @select="actionSelect"
      :title="'请选择'+currentOptions.name"
    />-->

    <van-actionsheet :round="false"
                     v-model="currentSelector"
                     :title="'请选择'+currentOptions.name">
      <div class="selector-container content"
           :style="{height:getHeight()}"
           style="    text-align: center;">

        <van-field v-model="searchVal"
                   @clear="clearText"
                   @input="inputText"
                   placeholder="搜索"
                   class="vol-search"
                   :clearable="true" />

        <div class="item-list">
          <div :style="{color:item.color}"
               :class="[index==0?'action-top-item':'']"
               v-for="(item,index) in currentOptions.data||[]"
               :key="index"
               @click="actionSelect(item,index)"
               v-show="!item.hidden">{{ item.name }}</div>
        </div>
      </div>
    </van-actionsheet>

    <div class="ds-from-content">
      <div style="display:none;">
        <van-field label-class="form-label"
                   :label-width="120"
                   :value="test"
                   input-align="right" />
      </div>
      <van-cell-group class="ds-from-group"
                      v-for="(list,index) in options"
                      :key="index">
        <template v-for="item in list">
          <div v-show="!item.hidden"
               :key="item.name">
            <van-field v-if="item.type=='date'"
                       :key="item.field"
                       readonly
                       :required="item.required"
                       name="calendar"
                       :label-width="120"
                       :value="fields[item.field]"
                       input-align="right"
                       :label="item.name"
                       :placeholder="'请选择'+item.name"
                       @click="openDate(item)" />
            <h3 class="title-group"
                v-else-if="item.type=='title'"
                :class="item.class"
                :key="item.field">
              <van-icon name="pause" />
              {{item.name}}
            </h3>
            <van-field v-else-if="item.type=='select'||item.type=='bool'"
                       :key="item.field"
                       readonly
                       input-align="right"
                       :required="item.required"
                       :label-width="120"
                       :value="formatterSelect(item,fields[item.field])"
                       :label="item.name"
                       :placeholder="'请选择'+item.name"
                       @click="onSelect(item)"
                       right-icon="arrow" />

            <van-field class="van-img-field"
                       :key="item.field"
                       v-else-if="item.type=='img'"
                       :label="item.name">
              <template #input>
                <img :src="fields[item.field]"
                     @click="base.previewImg(fields[item.field])" />
              </template>
            </van-field>
            <!-- <van-field
              v-model="fields[item.field]"
              rows="2"
              label-class="form-label"
              autosize
              :label="item.name"
              v-else-if="item.type=='textarea'"
              type="textarea"
              maxlength="50"
              :placeholder="item.readonly?'':'请输入'+item.name"
              show-word-limit
            />-->
            <van-field label-class="form-label"
                       :label-width="120"
                       :value="item.formatter(fields[item.field])"
                       :key="item.field"
                       v-else-if="item.formatter"
                       :label="item.name"
                       input-align="right"
                       :readonly="!!item.readonly"
                       :required="item.required"
                       :placeholder="item.readonly?'':'请输入'+item.name" />
            <van-field label-class="form-label"
                       :label-width="120"
                       v-model="fields[item.field]"
                       :formatter="item.formatter"
                       :key="item.field"
                       v-else
                       :label="item.name"
                       input-align="right"
                       :readonly="!!item.readonly"
                       :required="item.required"
                       :placeholder="item.readonly?'':'请输入'+item.name" />
          </div>
        </template>
      </van-cell-group>
      <slot></slot>
      <div class="btns"
           v-if="!onlyForm">
        <van-button type="info"
                    @click="submit()"
                    block>提交</van-button>
        <van-button type="danger"
                    v-if="showReset"
                    @click="reset()"
                    block>重置</van-button>
        <slot name="btn-footer"></slot>
      </div>
      <span style="display:none;">{{s_model}}</span>
    </div>
  </div>
</template>
<script>
let moment = require("moment");
let data_type = ["select", "date"];
// import header from "@/components/header.vue";
import {
  Field,
  CellGroup,
  Calendar,
  DatetimePicker,
  Popup,
  Icon,
  ActionSheet,
  Image,
  install,
  Search,
} from "vant";
export default {
  props: {
    showReset: {
      type: Boolean,
      default: true,
    },
    smallLine: {
      //smallLine
      type: Boolean,
      default: false,
    },
    submitBefore: {
      type: Function,
      default () {
        return true;
      },
    },
    submitAfter: {
      type: Function,
      default () {
        return true;
      },
    },
    resetAfter: {
      type: Function,
      default () {
        return true;
      },
    },
    onlyForm: {
      type: Boolean,
      default: false,
    },
    header: {
      type: Boolean,
      default: true,
    },
    title: {
      type: String,
      default: "数据信息",
    },
    fields: {
      type: Object,
      default: () => {
        return {};
      },
    },
    options: {
      type: Array,
      default: () => {
        return [];
      },
    },
    url: "", //保存的url地址
  },
  components: {
    // "ds-header": header,
    "van-field": Field,
    "van-popup": Popup,
    "van-cell-group": CellGroup,
    "van-calendar": Calendar,
    "van-datetime-picker": DatetimePicker,
    "van-actionsheet": ActionSheet,
    "van-icon": Icon,
    "van-image": Image,
    "van-search": Search,
  },
  methods: {
    clearText () {
      this.filterText();
    },
    filterText (val) {
      if (!this.currentOptions.data) return;
      this.currentOptions.data.forEach((x) => {
        //清除搜索内容
        if (val === undefined) {
          x.hidden = false;
        } else {
          this.$set(
            x,
            "hidden",
            x.name.toLowerCase().indexOf(val.toLowerCase()) == -1
          );
          //  x.hidden = x.name.toLowerCase().indexOf(val.toLowerCase()) == -1;
        }
      });
    },
    inputText (val) {
      this.filterText(val);
    },
    getHeight () {
      var _heigth = (this.currentOptions.data || []).length * 44 + 90;
      return (_heigth > 440 ? "440" : _heigth) + "px";
    },
    openDate (item) {
      //打开日期选择框
      this.currentDateField = item.field;
      this.currentDate = this.fields[item.field]
        ? new Date(this.fields[item.field])
        : new Date();
      this.showCalendar = true;
    },
    selectDate (date) {
      //选择日期
      this.fields[this.currentDateField] = moment(date).format("YYYY-MM-DD");
      this.showCalendar = false;
    },
    onSelect (action, index) {
      this.searchVal = "";
      this.clearText();
      //触发选择事件
      this.currentSelector = true;
      if (action.data.length == 0) {
        action.data.push(...this.dicInfo[action.key]);
      }
      this.currentOptions = action;
      if (this.fields[action.field] !== "") {
        //添加当前选中的提示
        action.data.forEach((x) => {
          x.color = this.fields[action.field] == x.value ? "red" : "";
        });
      }
    },
    actionSelect (action, index) {
      this.s_model = Math.random();
      //下拉框选择
      this.currentSelector = false;
      this.fields[this.currentOptions.field] = action.id === undefined ? action.name : action.id;
      //select级联操作
      if (this.currentOptions.cascade) {
        return this.getCascade(action);
      }
      //自定义处理选择事件
      this.currentOptions.onChange &&
        this.currentOptions.onChange(action, this.dicInfo);
    },
    setCascade (list) {
      this.options.forEach((x) => {
        x.forEach((option) => {
          if (option.field == this.currentOptions.cascade.field) {
            option.data.splice(0);
            if (list.hasOwnProperty("DicValues")) {
              option.data.push(...list.DicValues);
            } else {
              option.data.push(...list);
            }
            this.fields[option.field] = "";
          }
        });
      });
    },
    getCascade (action) {
      //获取级联数据
      let obj = this.currentOptions.cascade.getUrl(action);
      if (!obj) return this.setCascade([]);
      if (typeof obj != "object") {
        obj = { url: obj };
      }

      this.http[this.currentOptions.cascade.method || "post"](
        obj.url,
        obj.data || {},
        true
      ).then((result) => {
        if (!result || result.length == 0) return;
        //这里有些是直接返回的数据源，不带字典编号
        if (!result[0].hasOwnProperty("DicValues")) {
          result.forEach((d) => {
            d.name = d.text;
          });
          this.setCascade(result);
          return;
        }

        result.forEach((item) => {
          item.DicValues.forEach((d) => {
            d.name = d.text;
            d.hidden = false;
          });
          this.setCascade(item);
        });
      });
    },
    formatterSelect (item, value) {
      if (!item.data || item.data.lenght == 0) {
        return value;
      }
      let kv = item.data.find((x) => {
        return x.id == value;
      });
      return !kv && kv != "0" ? value : kv.text;
    },
    validator () {
      //保存数据
      for (let index = 0; index < this.options.length; index++) {
        for (let i = 0; i < this.options[index].length; i++) {
          const element = this.options[index][i];
          if (element.required) {
            let value = this.fields[element.field];
            if (value === "" || value === null || value == undefined) {
              let message =
                data_type.indexOf(element.type) == -1 ? "输入" : "选择";
              this.$toast("请" + message + element.name);
              return false;
            }
          }
        }
      }
      return true;
    },
    submit () {
      if (!this.validator()) return;

      if (!this.url) return this.$toast("没有配置url");
      if (!this.submitBefore(this.fields)) {
        return;
      }
      this.http.post(this.url, this.fields, true).then((x) => {
        this.$toast(x.message);
        if (x.status) {
          this.submitAfter(this.fields);
          this.reset();
        }
      });
    },
    reset () {
      for (const key in this.fields) {
        if (this.fields[key] instanceof Array) {
          this.fields[key].splice(0);
        } else {
          if (1 == 2 && this.dateFields.indexOf(key) != -1) {
            this.$set(
              this.fields,
              key,
              moment(new Date()).format("YYYY-MM-DD")
            );
          } else {
            this.$set(this.fields, key, "");
          }
        }
        // this.fields[key] = "";
      }
      this.test = Math.random();
      this.resetAfter();
    },
    bindSource () {

      this.http.post("/api/Sys_Dictionary/GetVueDictionary", this.dicKeys, true).then((result) => {
        result.forEach((item) => {
          item.data.forEach((d) => {
            d.name = d.value;
          });
          this.dicInfo[item.dicNo].splice(0);
          this.dicInfo[item.dicNo].push(...item.data);
        });
      });
    },
    //绑定自定方法的数据源
    bindUrlSource (item) {
      for (let index = 0; index < this.dicUrlKeys.length; index++) {
        const element = this.dicUrlKeys[index];
        this.http[element.httpType || "post"](element.url).then((item) => {
          item.forEach((d) => {
            d.name = d.text;
          });
          this.dicInfo[element.key].splice(0);
          this.dicInfo[element.key].push(...item);
        });
      }
    },
  },
  data () {
    return {
      searchVal: "",
      s_model: "",
      test: "",
      minDate: new Date(2018, 0, 1),
      maxDate: new Date(2025, 10, 1),
      currentDate: new Date(),
      showCalendar: false,
      currentDateField: "", //当前选择日历的字段
      currentSelector: false, //当前选择器
      currentOptions: {}, //当前options配置项
      dicInfo: {}, //所有字典数据源配置项
      dicKeys: [], //所有字典项编号,
      dicUrlKeys: [], //所有自定义url的编号
      dateFields: [],
    };
  },
  created () {
    this.options.forEach((x) => {
      x.forEach((item) => {
        if (item.type == "select") {
          if (!item.key) {
            item.key = item.field + "_obs";
          }
          if (this.dicKeys.indexOf(item.key) == -1) {
            this.dicKeys.push(item.key);
            this.dicInfo[item.key] = [];
          }
          if (!item.data || item.data.lenght == 0)
            item.data = this.dicInfo[item.key];
        }
        if (!this.fields.hasOwnProperty(item.field)) {
          this.fields[item.field] = "";
        }
        if (item.type == "date" && item.default) {
          if (item.hasOwnProperty("default") && !item.default) {
            this.fields[item.field] = "";
          } else {
            this.dateFields.push(item.field);
            this.fields[item.field] = moment(new Date()).format("YYYY-MM-DD");
          }
        }
        if (item.type == "bool") {
          item.key = item.field + "_s_url";
          item.data = [];
          this.dicKeys.push(item.key);
          this.dicInfo[item.key] = [
            { id: "1", name: "是", text: "是" },
            { id: "0", name: "否", text: "否" },
          ];
        }
      });
    });

    if (this.dicKeys.lenght == 0) return;


    this.bindSource(this.dicKeys);

    // this.bindUrlSource();
  },
};
</script>
<style lang="less" scoped>
.ds-form-container {
  background: #f7f7f7;
  .ds-from-group {
    margin-bottom: 15px;
    padding: 0 10px;
  }
}
.form-label {
  padding-left: 10px;
}
.btns {
  margin-top: 20px;
  button {
    font-size: 16px;
    width: 94%;
    border-radius: 7px;
    margin: 3%;
  }
}
.title-group {
  color: #3ea0c5;
  font-weight: 500;
  font-size: 17px;
  border-bottom: 1px solid #eee;
  padding-bottom: 9px;
  margin-bottom: 0px;
  margin-top: 0;
  padding-top: 10px;
  i {
    position: relative;
    top: 3px;
    margin-right: -4px;
  }
}
.scroll .ds-from-content {
  height: calc(100vh - 50px);
  overflow-y: scroll;
}
.selector-container {
  overflow: scroll;

  .item-list {
    margin-top: 49px;
    > div {
      font-size: 14px;
      padding: 10px 20px;
      // font-size: 20px;
      border-bottom: 1px solid #eee;
    }
  }
}
.vol-search {
  background: white;
  position: fixed;
  margin-top: -3px;
  border-top: 1px solid #eee;
  border-bottom: 0;

  input {
    text-align: center;
  }
}
// .action-top-item {
//   margin-top: 49px;
// }
</style>
<style  scoped>
.ds-form-container:not(.small-line) >>> .van-field {
  margin-bottom: 10px;
  padding-top: 13px;
}
.van-img-field img {
  height: 50px;
  border-radius: 5px;
  width: 50px;
}
.van-img-field .an-field__value {
  padding-top: 5px;
}
.van-img-field >>> .van-field__body {
  position: relative;
  display: inline-block;
}
.vol-search >>> input {
  text-align: center;
}
</style>
