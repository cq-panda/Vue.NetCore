<template>
  <div class="vol-form-container"
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

    <van-actionsheet class="form-actionsheet"
                     :round="false"
                     v-model="currentSelector"
                     :title="'请选择'+currentOptions.name">
      <div class="selector-container content"
           :style="{height:getHeight()}"
           style="text-align: center;">

        <div class="vol-search">
          <van-field v-model="searchVal"
                     @clear="clearText"
                     @input="inputText"
                     placeholder="搜索"
                     :clearable="true" />
          <van-button round
                      v-show="currentOptions.type=='selectList'"
                      size="small"
                      type="info"
                      @click.stop="actionSelect({},-1,true)">确 认</van-button>

        </div>

        <div class="item-list">
          <div style="    position: relative;"
               :style="{color:item.color}"
               :class="[index==0?'action-top-item':'']"
               v-for="(item,index) in currentOptions.data||[]"
               :key="index"
               @click="actionSelect(item,index)"
               v-show="!item.hidden">{{ item.name }}
            <van-icon style="position: absolute;right: 1.5rem;    margin-top: 4px;"
                      v-if="item.color"
                      name="success" />
          </div>
        </div>

      </div>
    </van-actionsheet>

    <div class="vol-from-content">
      <div style="display:none;">
        <van-field label-class="form-label"
                   :label-width="120"
                   :value="test"
                   :input-align="align">
        </van-field>
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
                       :input-align="align"
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
            <van-cell v-else-if="item.type=='switch'"
                      center
                      :title="item.name">
              <template #right-icon>
                <van-switch :value="fields[item.field]+''==='1'"
                            active-color="#1989fa"
                            inactive-color="rgb(181 181 181)"
                            @input="(checked)=>{onInput(checked,item)}"
                            size="24" />
              </template>
            </van-cell>
            <!-- <van-switch 
                        :value="formatterSwitch(item,fields[item.field])" /> -->
            <template v-else-if="item.type=='select'||item.type=='selectList'||item.type=='bool'">
              <van-field v-if="!item.readonly"
                         :key="item.field"
                         :input-align="align"
                         :required="item.required"
                         :label-width="120"
                         :value="formatterSelect(item,fields[item.field])"
                         :label="item.name"
                         :placeholder="'请选择'+item.name"
                         @click="onSelect(item)"
                         right-icon="arrow" />
              <van-field label-class="form-label"
                         :label-width="120"
                         :value="formatterSelect(item,fields[item.field])"
                         v-else
                         :label="item.name"
                         :input-align="align"
                         :type="item.type"
                         :readonly="true"
                         :required="item.required" />
            </template>

            <van-field class="van-img-field"
                       :key="item.field"
                       v-else-if="item.type=='img'"
                       :label="item.name">
              <template #input>
                <vol-van-uploader :file-list="fields[item.field]"
                                  :multiple="item.multiple"
                                  :maxCount="item.maxCount"
                                  :url="item.url"></vol-van-uploader>
              </template>
            </van-field>

            <van-field label-class="form-label"
                       :label-width="120"
                       :value="item.formatter(fields[item.field])"
                       :key="item.field"
                       v-else-if="item.formatter"
                       :label="item.name"
                       :input-align="align"
                       :type="item.type"
                       :readonly="!!item.readonly"
                       :required="item.required"
                       :placeholder="item.readonly?'':'请输入'+item.name" />
            <van-field label-class="form-label"
                       :label-width="120"
                       v-model="fields[item.field]"
                       :formatter="item.formatter"
                       :key="item.field"
                       :type="item.type"
                       v-else
                       :label="item.name"
                       :input-align="align"
                       :readonly="!!item.readonly"
                       :required="item.required"
                       :placeholder="item.readonly?'':'请输入'+item.name" />
          </div>
        </template>
      </van-cell-group>
      <slot></slot>
      <div class="btns">
        <slot name="btn-footer"></slot>
      </div>
      <!-- <span style="display:none;">{{s_model}}</span> -->
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
  RadioGroup,
  Radio,
  Button,
  Switch,
  Cell
} from "vant";
export default {
  props: {
    align: {//文字显示位置left /right
      type: String,
      default: "left",
    },
    smallLine: {
      //smallLine
      type: Boolean,
      default: false,
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
  },
  components: {
    "vol-van-uploader": () => import("./VolVanUploader"),
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
    "van-radio-group": RadioGroup,
    "van-radio": Radio,
    "van-button": Button,
    "van-switch": Switch,
    "van-cell": Cell
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
    }, isEmpty (val) {
      return val === "" || val === undefined || val === null;
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
      // if (this.fields[action.field] !== "") {
      var _isArray = this.fields[action.field] instanceof Array;
      var _arr = [];
      if (action.type == "selectList" && !_isArray) {
        _arr = (this.fields[action.field] || '').split(',');
      } else {
        _arr = this.fields[action.field];
      }
      //添加当前选中的提示
      action.data.forEach((x) => {
        if (this.isEmpty(this.fields[action.field])) {
          x.color = "";
        }
        else {
          x.color = _arr.indexOf(x.key + "") != -1 ? "red" : "";
        }
      });
      // }
    },
    actionSelect (action, index, isBtnClick) {
      if (isBtnClick) {
        //自定义处理选择事件
        this.currentOptions.onChange &&
          this.currentOptions.onChange(this.fields[this.currentOptions.field], action, this.dicInfo);
        this.currentSelector = false;
        return;
      }
      var _selectVal = (action.key === undefined ? action.name : action.key) + "";
      //多选如果不是点击的按钮，直接返回
      if (this.currentOptions.type == "selectList") {

        var _fieldVal = this.fields[this.currentOptions.field];
        if (!(_fieldVal instanceof Array)) {
          this.fields[this.currentOptions.field] = [...(_fieldVal || '').split(',')];
          _fieldVal = this.fields[this.currentOptions.field]
        }
        // var _index = _fieldVal.indexOf(_selectVal);
        var _index = -1;
        for (let index = 0; index < _fieldVal.length; index++) {
          const _arr_val = _fieldVal[index];
          if (_arr_val + "" === _selectVal) {
            _index = index;
          }
        }
        if (_index == -1) {
          action.color = "red";
          _fieldVal.push(_selectVal)
        } else {
          action.color = "";
          _fieldVal.splice(_index, 1);
        }

        return;
      }

      //下拉框选择
      this.currentSelector = false;
      this.fields[this.currentOptions.field] = _selectVal;
      //select级联操作
      if (this.currentOptions.cascade) {
        return this.getCascade(action);
      }
      //自定义处理选择事件
      this.currentOptions.onChange &&
        this.currentOptions.onChange(this.fields[this.currentOptions.field], action, this.dicInfo);
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
    onInput (checked, item) {
      this.fields[item.field] = checked ? "1" : "0"
    },
    formatterSwitch (item, value) {
      return true//
    },
    formatterSelect (item, value) {
      if (item.type == "bool") {
        return value === "1" || value === 1 ? '是' : "否";
      }
      if (!item.data || item.data.lenght == 0) {
        return value;
      }
      if (item.type == "selectList") {
        return this.formatterSelectList(item, value)
      }
      return this.getItemName(item, value);
    },
    getItemName (item, key) {
      let kv = item.data.find((x) => {
        return x.key + "" == key;
      });
      return !kv && kv != "0" ? key : kv.name;
    },
    formatterSelectList (item, value) {
      if (!value) {
        return value;
      }
      if (!(value instanceof Array)) {
        value = (value + "").split(',');
      }
      if (!value.length) {
        return "";
      }
      var _text = []; //this.getItemName(item, value[0]);
      for (let index = 0; index < value.length; index++) {
        if (value[index] || value[index] == '0') {
          _text.push(this.getItemName(item, value[index]));
        }
      }
      return _text.join(',');
      // return value.map(x => {
      //   return this.getItemName(item, x);
      // }).join(',');
    },
    validator () {
      //保存数据
      for (let index = 0; index < this.options.length; index++) {
        for (let i = 0; i < this.options[index].length; i++) {
          const element = this.options[index][i];
          if (this.boolKeyFields.indexOf(element.field) != -1) {
            if (this.fields[element.field] + "" !== "1") {
              this.fields[element.field] = "0"
            }
          }
          else if (element.required) {
            let value = this.fields[element.field];
            if ((value instanceof Array && value.length == 0) || this.isEmpty(value)) {
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
    bindSource () {
      this.http.post("/api/Sys_Dictionary/GetVueDictionary", this.dicKeys, true).then((result) => {
        result.forEach((item) => {
          item.data.forEach((d) => {
            d.name = d.value;
            d.key = d.key + "";
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
    reset () {
      for (const key in this.fields) {
        if (this.fields[key] instanceof Array) {
          this.fields[key].splice(0);
        } else {
          this.fields[key] = this.boolKeyFields.indexOf(key) == -1 ? '' : "0";
        }
      }
    },
  },
  data () {
    return {
      radio: [],
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
      boolKeyFields: [],
    };
  },
  created () {
    this.options.forEach((x) => {
      x.forEach((item) => {
        if (item.type == "bool" || item.type == "switch") {
          this.boolKeyFields.push(item.field)
        }
        if (item.type == "select" || item.type == "selectList") {
          if (!item.key) {
            item.key = item.field + "_obs";
          }
          if (this.dicKeys.indexOf(item.key) == -1 && item.key !== "") {
            this.dicKeys.push(item.key);
            this.dicInfo[item.key] = item.data;
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
            { id: 1, name: "是", key: 1 },
            { id: 0, name: "否", key: 0 },
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
.vol-form-container {
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
.scroll .vol-from-content {
  //  height: calc(100vh - 50px);
  // overflow-y: scroll;
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
  border-bottom: 1px solid #eee;
  z-index: 9;
  display: flex;
  > div:first-child {
    flex: 1;
  }
  button {
    top: 10px;
    right: 1rem;
    margin-left: 15px;
  }
  width: 100%;
  .van-field {
    border: none;
  }
  input {
    text-align: center;
  }
  .van-cell:after {
    border: 0 !important;
  }
}
// .action-top-item {
//   margin-top: 49px;
// }
</style>
<style  scoped>
.vol-form-container:not(.small-line) >>> .van-field {
  /* margin-bottom: 10px; */
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
.vol-form-container >>> .van-overlay {
  z-index: 99998 !important;
  top: -15% !important;
}
.vol-form-container >>> .van-popup {
  z-index: 99999 !important;
}
</style>
