<template>
  <Form
    ref="formValidate"
    :style="{width:width>0?(width+'px'):'100%'}"
    :model="formFileds"
    :rules="ruleValidate"
    :label-width="100"
  >
    <slot name="header"></slot>
    <Row class="line-row" v-for="(row,findex) in formRules" :key="findex">
      <Col :span="(item.colSize?item.colSize*2:24/span)" v-for="(item,index) in row" :key="index">
        <FormItem :label="item.title+'：'" :prop="item.field">
          <!-- <Input
            v-if="item.disabled"
            class="readonly-input"
            :value="formFileds[item.field]=='null'?'--':formFileds[item.field]"
            :placeholder="formFileds[item.field]||'--'"
          ></Input>-->
          <img v-if="item.disabled&&item.columnType=='img'" :src="formFileds[item.field]" />
          <label
            v-else-if="item.disabled"
            class="readonly-input"
          >{{formFileds[item.field]=='null'||formFileds[item.field]==''?'--':formFileds[item.field]}}</label>

          <!--下拉框绑定时如果key为数字，请将key+''转换为字符串-->
          <Select
            v-else-if="item.type=='select'||item.type=='selectList'||item.type=='drop'||item.type=='dropList'"
            v-model="formFileds[item.field]"
            :multiple="(item.type=='select'||item.type=='drop')?false:true"
            :filterable="getData(item)>10?true:false"
            :placeholder="item.placeholder?item.placeholder:( '请选择'+item.title)"
            @on-change="onChange(item,formFileds[item.field])"
            clearable
          >
            <!-- :max-tag-count="2" -->
            <Option
              v-for="(kv,kvIndex) in getData(item)"
              :key="kvIndex"
              :value="kv.key||''"
            >{{kv.value}}</Option>
          </Select>
          <i-switch
            v-else-if="item.type=='switch'"
            :true-value="1"
            :false-value="0"
            v-model="formFileds[item.field]"
          >
            <span slot="open">是</span>
            <span slot="close">否</span>
          </i-switch>
          <!-- moment(that.newForm.useTime).format('YYYY-MM-DD');
          @on-change="(time)=>{formFileds[item.field]=time; return time}"-->
          <Row v-else-if="item.type=='date'||item.type=='datetime'||item.columnType=='datetime'">
            <Col span="24">
              <FormItem :prop="item.field">
                <DatePicker
                  :type="item.range?(item.type+'range'):item.type"
                  :format="item.type=='date'? 'yyyy-MM-dd':'yyyy-MM-dd HH:mm:ss'"
                  :placeholder="item.placeholder||item.title"
                  :value="formFileds[item.field]"
                  @on-change="(time)=>{formFileds[item.field]=time; return time}"
                ></DatePicker>
              </FormItem>
            </Col>
          </Row>
          <!-- :v-model="getObject(formFileds[item.field])" -->
          <!-- <RadioGroup v-else-if="item.type=='radio'" v-model="formFileds[item.field]">
            <Radio v-for="(kv,kvIndex) in item.data.data||item.data" :key="kvIndex" :label="kv.key">{{kv.value}}</Radio>
          </RadioGroup>-->
          <CheckboxGroup v-else-if="item.type=='checkbox'" v-model="formFileds[item.field]">
            <Checkbox
              v-for="(kv,kvIndex) in getData(item)"
              :key="kvIndex"
              :label="kv.key"
            >{{kv.value}}</Checkbox>
          </CheckboxGroup>

          <UploadImg v-else-if="item.columnType=='img'" :src="formFileds[item.field]"></UploadImg>
          <!-- <img v-else-if="item.columnType=='img'" :src="formFileds[item.field]" /> -->
          <!-- <FormItem v-else-if="item.columnType=='img'" :prop="item.field">
            <img :src="formFileds[item.field]" />
          </FormItem>-->
          <Input
            v-else-if="item.type=='textarea'"
            v-model="formFileds[item.field]"
            type="textarea"
            clearable
            :autosize="{minRows:2,maxRows:item.maxRows||2}"
            :placeholder="item.placeholder?item.placeholder:( '请输入'+item.title)"
          ></Input>
          <Input
            clearable
            v-else-if="item.type=='password'"
            type="password"
            v-model.number="formFileds[item.field]"
            :placeholder="item.placeholder?item.placeholder:( '请输入'+item.title)"
          ></Input>
          <Input
            clearable
            v-else-if="types[item.columnType]=='number'"
            v-model.number="formFileds[item.field]"
            :placeholder="item.placeholder?item.placeholder:( '请输入'+item.title)"
          ></Input>
          <Input
            clearable
            v-else
            v-model="formFileds[item.field]"
            :placeholder="item.placeholder?item.placeholder:( '请输入'+item.title)"
          ></Input>
        </FormItem>
      </Col>
    </Row>
    <slot name="footer"></slot>
    <FormItem>
      <!-- <Button type="primary" @click="handleSubmit('formValidate')">Submit</Button>
      <Button @click="handleReset('formValidate')" style="margin-left: 8px">Reset</Button>-->
    </FormItem>
  </Form>
</template>
<script>
import moment from "moment";

export default {
  components: {
    UploadImg: () => import("@/components/basic/UploadImg.vue")
  },
  props: {
    loadKey: {
      //是否加载formRules字段配置的数据源
      type: Boolean,
      default: false
    },
    width: {
      type: Number,
      default: 0
    },
    formRules: {
      //表单配置规则，如字段类型，是否必填
      type: Array,
      default: []
    },
    formFileds: {
      //表单字段
      type: Object,
      default: {}
    }
  },
  created() {
    if (this.loadKey) {
      this.initSource();
    }
    this.formRules.forEach(row => {
      if (row.length > this.span) {
        this.span = row.length;
      }
      row.forEach(item => {
        if (item.dataKey) {
          //下拉框都强制设置为字符串类型
          item.columnType = "string";
          if (item.data && item.data instanceof Array) {
            item.data.forEach(x => {
              x.key = x.key + "";
            });
          } else {
            if (!item.data) {
              item.data = { data: [] };
            } else if (!item.data.data) {
              item.data.data = [];
            }
            //数据源的key为数字时，可能存在配置不统一，有的是数据有的是字符，此处统一转换成字符
            item.data.data.forEach(x => {
              x.key = x.key + "";
            });
          }
        }

        if (item.required) {
          if (!item.hasOwnProperty("type")) {
            item.type = "text";
          }
          switch (item.type) {
            case "text":
            case "string":
            case "email":
            case "textarea":
            case undefined:
              let message =
                item.title +
                (this.types[item.columnType] == "number"
                  ? "请输入一个有效的数字"
                  : "不能为空");
              this.ruleValidate[item.field] = [
                {
                  required: true,
                  message: message,
                  trigger: "blur",
                  type: this.types[item.columnType]
                } // ,
                // {
                //   type: "number",
                //   min: 0,
                //   max: 100,
                //   message: "",
                //   trigger: "blur",
                //进行格式化处理
                //   transform: value =>{this.formFileds[item.field]=123;}
                // }
              ];
              if (item.min) {
                this.ruleValidate[item.field][0].min = item.min;
                this.ruleValidate[item.field][0].message =
                  item.title + "至少" + item.min + "个字符!";
              }
              if (item.max) {
                this.ruleValidate[item.field].push({
                  max: item.max,
                  required: true,
                  message: item.title + "最多" + item.max + "个字符!",
                  trigger: "blur"
                });
              }
              break;
            case "drop":
            case "radio":
              this.ruleValidate[item.field] = [
                {
                  required: true,
                  message: "请选择" + item.title,
                  trigger: "change",
                  type: "string" //this.types[item.columnType]
                }
              ];
              break;
            case "date":
            case "datetime":
              this.ruleValidate[item.field] = [
                {
                  required: true,
                  type: "string",
                  message: "请选择" + item.title,
                  trigger: "change",
                  type: this.types[item.columnType]
                }
              ];
              break;
            case "checkbox":
            case "select":
              this.ruleValidate[item.field] = [
                {
                  required: true,
                  message: "请选择" + item.title,
                  min: item.min || 1,
                  type: "array",
                  trigger: "change",
                  type: this.types[item.columnType]
                }
              ];
              item.max &&
                this.ruleValidate[item.field].push({
                  message: "最多只能选择" + item.max + "项" + item.title,
                  max: item.max,
                  type: "array",
                  trigger: "change"
                });
              break;
          }
        }
      });
    });
  },
  data() {
    return {
      types: {
        int: "number",
        byte: "number",
        decimal: "number", //"float",
        string: "string",
        bool: "boolean",
        date: "datetime",
        date: "date"
      },
      span: 0,
      ruleValidate: {}
    };
  },
  methods: {
    onChange(item,value){
      if (item.onChange&&typeof item.onChange=="function") {
        item.onChange(value,item);
      }
    },
    getData(item) {
      if (item.data && item.data.data) {
        return item.data.data;
      }
      return item.data;
    },
    initSource() {
      let keys = [],
        binds = [];
      //初始化字典数据源
      this.formRules.forEach(item => {
        item.forEach(x => {
          if (x.dataKey) {
            if (!x.data) x.data = [];
            binds.push({ key: x.dataKey, data: x.data });
            if (keys.indexOf(x.dataKey) == -1) {
              keys.push(x.dataKey);
            }
          }
        });
      });

      if (keys.length == 0) return;

      this.http.post("/api/Sys_Dictionary/GetVueDictionary", keys).then(dic => {
        this.bindOptions(dic, binds);
      });
    },
    bindOptions(dic, binds) {

      dic.forEach(d => {
        binds.forEach(x => {
          if (x.key != d.dicNo) return true;
          //如果有数据的则不查询
          if (x.data.length > 0) return true;
          if (d.data.length > 0 && !d.data[0].hasOwnProperty("key")) {
            let source = d.data,
              newSource = new Array(source.length);
            for (let index = 0; index < source.length; index++) {
              newSource[index] = {
                key: source["key"] + "",
                value: source["value"]
              };
            }
            x.data.push(...newSource);
          } else {
            x.data.push(...d.data);
          }
        });
      });

      // binds.forEach(x => {
      //   x.data.push(...[]);
      // });
     
    },
    getObject(date) {
      if (typeof date == "object") {
        return date;
      }
      return new Date(date);
    },
    validateNumber() {},
    formatTime(time) {
      return moment(time).format("YYYY-MM-DD");
    },
    changeTime(time) {
      console.log(time);
      return time + "";
    },
    reset(sourceObj) {
      this.$refs["formValidate"].resetFields();
      if (!sourceObj) return;
      for (const key in this.formFileds) {
        if (sourceObj.hasOwnProperty(key)) {
          this.formFileds[key] = sourceObj[key];
        }
      }
    },
    validate() {
      let result = false;
      this.$refs["formValidate"].validate(valid => {
        if (!valid) {
          this.$Message.error("数据验证未通过!");
        } else {
          result = true;
        }
      });
      return result;
    },
    getReuired(rule, item) {}
  }
};
</script>
<style>
.ivu-date-picker {
  width: 100%;
}
/* .ivu-form-item {
  margin-bottom: 20px !important;
} */
</style>
<style scoped>
.readonly-input >>> input {
  box-shadow: none;
  border: 0px;
}
.line-row >>> .ivu-select .ivu-select-dropdown {
  width: 100% !important;
  z-index: 99999;
}

.line-row >>> .ivu-form-item img {
  max-height: 100px;
}
.line-row >>> .ivu-form-item-label {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
</style>


