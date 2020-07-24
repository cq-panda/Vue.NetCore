<template>
  <Form
    ref="formValidate"
    :style="{width:width>0?(width+'px'):'100%'}"
    :model="formFileds"
    :label-width="labelWidth"
  >
    <!-- :rules="ruleValidate" -->
    <slot name="header"></slot>
    <Row class="line-row" v-for="(row,findex) in formRules" :key="findex">
      <Col :span="(item.colSize?item.colSize*2:24/span)" v-for="(item,index) in row" :key="index">
        <!-- 2020.06.18增加render渲染自定义内容 -->
        <form-expand v-if="item.render&&typeof item.render=='function'" :render="item.render"></form-expand>
        <FormItem
          v-else
          :rules="getRule(item,formFileds)"
          :label="item.title?(item.title+'：'):''"
          :prop="item.field"
        >
          <template v-if="isReadonlyImgFile(item,formFileds)">
            <div v-if="item.type=='img'||item.columnType=='img'" class="form-imgs">
              <div
                class="img-item"
                v-for="(img,imgIndex) in formFileds[item.field]"
                :key="imgIndex"
              >
                <img :src="getSrc(img.path)" :onerror="errorImg" @click="previewImg(img.path)" />
              </div>
            </div>
            <template v-else>
              <div
                class="form-file-list"
                v-for="(file,fileIndex) in formFileds[item.field]"
                :key="fileIndex"
              >
                <a @click="dowloadFile(formFileds[item.field][fileIndex])">{{file.name}}</a>
              </div>
            </template>
          </template>
          <label
            v-else-if="item.disabled||item.readonly"
            class="readonly-input"
          >{{getText(formFileds,item)}}</label>
          <div v-else :class="{'form-item-extra':item.extra}">
            <div>
              <!--下拉框绑定时如果key为数字，请将key+''转换为字符串-->
              <div
                v-if="item.type=='select'||item.type=='selectList'||item.type=='drop'||item.type=='dropList'"
              >
                <!--select绑定默认值时，如果设置了默认值，数据源也有数据，但没绑定上，问题在于key与默认值类型不一致，如:默认值是字符串，数据源的key是数字，类型不至会导致绑定失败-->
                <template>
                  <!-- {{ item.remote||item.url?"1":"0"}} -->
                  <!-- 远程搜索 -->
                  <!-- 从后台字典搜索remote  -->
                  <Select
                    v-if="item.remote||item.url"
                    :transfer="true"
                    v-model="formFileds[item.field]"
                    filterable
                    remote
                    @on-clear="()=>{onClear(item,formFileds)}"
                    :remote-method="(val)=>{remoteSearch(item,formFileds,val)}"
                    :loading="item.loading"
                    :placeholder="item.placeholder?item.placeholder:( '请选择'+item.title)"
                    @on-change="onRemoteChange(item,formFileds[item.field])"
                    clearable
                  >
                    <Option
                      v-for="(kv,kvIndex) in getData(item)"
                      :key="kvIndex"
                      :value="kv.key"
                    >{{kv.value}}</Option>
                  </Select>
                  <Select
                    v-else
                    :transfer="true"
                    v-model="formFileds[item.field]"
                    :multiple="(item.type=='select'||item.type=='drop')?false:true"
                    :filterable="(item.filter||item.data.length>10)?true:false"
                    :placeholder="item.placeholder?item.placeholder:( '请选择'+item.title)"
                    @on-change="onChange(item,formFileds[item.field])"
                    clearable
                  >
                    <Option
                      v-for="(kv,kvIndex) in item.data"
                      :key="kvIndex"
                      :value="kv.key"
                    >{{kv.value}}</Option>
                  </Select>
                </template>
              </div>
              <i-switch
                v-else-if="item.type=='switch'"
                :true-value="typeof formFileds[item.field]=='boolean' ? true:1"
                :false-value="typeof formFileds[item.field]=='boolean' ? false:0"
                v-model="formFileds[item.field]"
              >
                <span slot="open">是</span>
                <span slot="close">否</span>
              </i-switch>
              <Row
                v-else-if="item.type=='date'||item.type=='datetime'||item.columnType=='datetime'"
              >
                <Col span="24">
                  <FormItem :prop="item.field">
                    <DatePicker
                      :transfer="true"
                      :type="item.range?(item.type+'range'):item.type"
                      :format="item.type=='date'? 'yyyy-MM-dd':'yyyy-MM-dd HH:mm:ss'"
                      :placeholder="item.placeholder||item.title"
                      :value="formFileds[item.field]"
                      @on-change="(time)=>{formFileds[item.field]=time; validateField(item); return time}"
                    ></DatePicker>
                  </FormItem>
                </Col>
              </Row>
              <CheckboxGroup
                @on-change="(arr)=>{item.onChange&&item.onChange(arr)}"
                v-else-if="item.type=='checkbox'"
                v-model="formFileds[item.field]"
              >
                <Checkbox
                  v-for="(kv,kvIndex) in item.data"
                  :key="kvIndex"
                  :label="kv.key"
                >{{kv.value}}</Checkbox>
              </CheckboxGroup>
              <vol-upload
                v-else-if="isFile(item,formFileds)"
                :desc="item.desc"
                :multiple="item.multiple"
                :max-file="item.maxFile"
                :max-size="item.maxSize"
                :autoUpload="item.autoUpload"
                :fileInfo="formFileds[item.field]"
                :url="item.url"
                :img="item.type=='img'||item.columnType=='img'"
                :excel="item.type=='excel'"
                :fileTypes="item.fileTypes?item.fileTypes:[]"
                :upload-before="item.uploadBefore"
                :upload-after="item.uploadAfter"
                :append="item.append?true:false"
                :on-change="item.onChange"
                :file-click="item.fileClick"
                :remove-before="item.removeBefore"
                :down-load="item.downLoad?true:false"
              ></vol-upload>
              <!-- 2020.05.31增加iview组件Cascader -->
              <Cascader
                v-else-if="item.type=='cascader'"
                :load-data="item.loadData"
                :data="item.data"
                filterable
                :render-format="item.formatter"
                v-model="formFileds[item.field]"
              ></Cascader>

              <Input
                v-else-if="item.type=='textarea'"
                v-model="formFileds[item.field]"
                type="textarea"
                @on-keypress="($event)=>{item.onKeyPress&&item.onKeyPress($event)}"
                clearable
                :autosize="{minRows:2,maxRows:item.maxRows||10}"
                :placeholder="item.placeholder?item.placeholder:( '请输入'+item.title)"
                :ref="item.field"
              ></Input>
              <Input
                clearable
                v-else-if="item.type=='password'"
                type="password"
                autocomplete="off"
                v-model.number="formFileds[item.field]"
                @on-keypress="($event)=>{item.onKeyPress&&item.onKeyPress($event)}"
                :placeholder="item.placeholder?item.placeholder:( '请输入'+item.title)"
                :ref="item.field"
              ></Input>
              <Input
                clearable
                v-else
                @on-keypress="($event)=>{item.onKeyPress&&item.onKeyPress($event)}"
                v-model="formFileds[item.field]"
                :placeholder="item.placeholder?item.placeholder:( '请输入'+item.title)"
                :ref="item.field"
              ></Input>
            </div>

            <div class="form-extra" v-if="item.extra">
              <a
                :style="item.extra.style"
                @click="()=>{item.extra.click&&item.extra.click(item,formFileds[item.field])}"
              >
                <Icon v-if="item.extra.icon" :type="item.extra.icon" />
                {{item.extra.text}}
              </a>
            </div>
          </div>
        </FormItem>
      </Col>
    </Row>
    <slot name="footer"></slot>
  </Form>
</template>
<script>
import moment from "moment";
import FormExpand from "./VolForm/VolFormRender";
export default {
  components: {
    FormExpand,
    VolUpload: () => import("@/components/basic/VolUpload.vue")
  },
  props: {
    loadKey: {
      //是否加载formRules字段配置的数据源
      type: Boolean,
      default: false
    },
    width: {
      //表单宽度
      type: Number,
      default: 0
    },
    labelWidth: {
      //表单左边label文字标签的宽度
      type: Number,
      default: 100
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
  watch: {},
  created() {
    this.initFormRules(true);
  },
  data() {
    return {
      remoteCall: true,
      errorImg: 'this.src="' + require("@/assets/imgs/error-img.png") + '"',
      rule: {
        change: [
          "checkbox",
          "select",
          "date",
          "datetime",
          "drop",
          "radio",
          "cascader"
        ], //2020.05.31增加级联类型
        phone: /^[1][3,4,5,6,7,8,9][0-9]{9}$/,
        decimal: /(^[\-0-9][0-9]*(.[0-9]+)?)$/,
        number: /(^[\-0-9][0-9]*([0-9]+)?)$/
      },
      inputTypeArr: ["text", "string", "mail", "textarea", "password"],
      types: {
        int: "number",
        byte: "number",
        decimal: "number", //"float",
        string: "string",
        bool: "boolean",
        date: "datetime",
        date: "date",
        mail: "email"
      },
      span: 0,
      ruleValidate: {}
    };
  },
  methods: {
    previewImg(url) {
      this.base.previewImg(url, this.http.ipAddress);
    },
    getSrc(path) {
      if (!path) return;
      if (!this.base.isUrl(path) && path.indexOf(".") != -1) {
        return this.http.ipAddress + path;
      }
      return path;
    },
    //是否为图片文件等格式并对字段的转换成数组：[{name:'1.jpg',path:'127.0.0.1/ff/1.jpg'}]
    isFile(item, formFileds) {
      if (
        item.type == "img" ||
        item.columnType == "img" ||
        item.type == "excel" ||
        item.type == "file"
      ) {
        this.convertFileToArray(item, formFileds);
        return true;
      }
      return false;
    },
    isReadonlyImgFile(item, formFileds) {
      if ((item.disabled || item.readonly) && this.isFile(item, formFileds)) {
        return true;
      }
      return false;
    },
    convertFileToArray(item, formFileds) {
      if (!item.maxFile) {
        item.maxFile = 1; //默认只能上传一个文件，可以在onInit中设置
      }

      let fileInfo = formFileds[item.field];
      if (fileInfo instanceof Array) {
        fileInfo.forEach(x => {
          if (x.hasOwnProperty("path")) {
            if (x.path && !this.base.isUrl(x.path)) {
              //这里修改后死循环?
              // x.path = this.http.ipAddress + x.path;
            }
          }
        });
        return;
      }
      if (fileInfo === null || fileInfo === undefined) {
        formFileds[item.field] = [];
        return;
      }
      //将以逗号隔开的文件分割成数组127.0.0.1/aa/1.jpg,将127.0.0.1/aa/2.jpg
      if (typeof fileInfo == "string") {
        if (fileInfo.trim() === "") {
          formFileds[item.field] = [];
          return;
        }
        //如果文件路径是字符串，则使用，拆分
        fileInfo = fileInfo.replace(/\\/g, "/");
        let files = fileInfo.split(",");
        formFileds[item.field] = [];
        for (let index = 0; index < files.length; index++) {
          let file = files[index];
          let splitFile = file.split("/");
          formFileds[item.field].push({
            name: splitFile.length > 0 ? splitFile[splitFile.length - 1] : file,
            path: file //this.base.isUrl(file) ? file : this.http.ipAddress + file,
          });
        }
      }
    },
    dowloadFile(file) {
      this.base.dowloadFile(
        file.path,
        file.name,
        {
          Authorization: this.$store.getters.getToken()
        },
        this.http.ipAddress
      );
    },
    validatorPhone(rule, value, callback) {
      if (!rule.required && !value && value != "0") {
        return callback();
      }
      if (!this.rule.phone.test((value || "").trim())) {
        return callback(new Error("请输入正确的手机号"));
      }
      callback();
    },
    validatorPwd(rule, value, callback) {
      if (!rule.required && !value && value != "0") {
        return callback();
      }
      if ((value + "").trim().length < 6) {
        return callback(new Error("密码长度不能小于6位"));
      }
      callback();
    },
    getText(formFileds, item) {
      //2019.10.24修复表单select组件为只读的属性时没有绑定数据源
      let text = formFileds[item.field];

      if (typeof text == "function") {
        return text(formFileds);
      }
      if (
        text === "null" ||
        text === "" ||
        text === null ||
        text === undefined
      ) {
        return "--";
      }

      if (!item.data) return text;
      let data = item.data;
      // if (item.data.data) {
      //   data = item.data.data;
      // } else {
      //   data = item.data;
      // }
      data.forEach(x => {
        if (x.key == text) {
          text = x.value;
        }
      });
      return text;
    },
    onClear(item, formFileds) {
      //远程select标签清空选项
      item.data.splice(0);
      // console.log(2);
    },
    onChange(item, value) {
      if (item.onChange && typeof item.onChange == "function") {
        item.onChange(value, item);
      }
    },
    onRemoteChange(item, value) {
      //第二次打开时，默认值成了undefined，待查viewgrid中重置代码
      if (value == undefined && item.data.length > 0) {
        this.formFileds[item.field] = item.data[0].key;
        //  console.log('undefined');
      }
      this.remoteCall = false;
      if (item.onChange && typeof item.onChange == "function") {
        item.onChange(value, item);
      }
    },
    getData(item) {
      return item.data;
    },
    initSource() {
      let keys = [],
        binds = [];
      //初始化字典数据源
      this.formRules.forEach(item => {
        item.forEach(x => {
          if (x.dataKey && (!x.data || x.data.length == 0) && !x.remote) {
            // if (!x.data)
            x.data = [];
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
    //远程搜索(打开弹出框时应该禁止搜索)
    remoteSearch(item, formFileds, val) {
      if (
        val == "" ||
        (item.data.length == 1 &&
          (val == item.data[0].key || val == item.data[0].value))
      )
        return;
      //弹出框或初始化表单时给data设置数组默认值
      let url = item.remote
        ? "/api/Sys_Dictionary/GetSearchDictionary"
        : item.url;
      this.http
        .post(url + "?dicNo=" + item.dataKey + "&value=" + val)
        .then(dicData => {
          this.$set(item, "loading", false);
          item.data = dicData;
          this.formRules[item.point.x].splice(item.point.y, 1, item);
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
      //重置表单时，禁用远程查询
      //  this.remoteCall = false;
      this.$refs["formValidate"].resetFields();
      if (!sourceObj) return;
      for (const key in this.formFileds) {
        if (sourceObj.hasOwnProperty(key)) {
          this.formFileds[key] = sourceObj[key];
        }
      }
      //  this.remoteCall = true;
    },
    validate(callback) {
      let result = true;
      this.$refs["formValidate"]
        .validate(valid => {
          if (!valid) {
            this.$Message.error("数据验证未通过!");
            result = false;
          } else if (typeof callback == "function") {
            callback(valid);
          }
        })
      return result;
    },
    getReuired(rule, item) {},
    initUpload(item, init) {
      if (!init) return;
      if (
        item.type == "img" ||
        item.columnType == "img" ||
        item.type == "excel" ||
        item.type == "file"
      ) {
        //只是没设置是否自动上传的，默认都是选择文件后自动上传
        if (!item.hasOwnProperty("autoUpload")) {
          item.autoUpload = true;
        }
        if (!item.hasOwnProperty("fileList")) {
          item.fileList = true;
        }
        if (!item.hasOwnProperty("downLoad")) {
          item.downLoad = true;
        }
        if (!item.removeBefore) {
          item.removeBefore = (index, file, files) => {
            return true;
          };
        }
        if (!item.fileClick) {
          item.fileClick = (index, file, files) => {
            return true;
          };
        }
        if (!item.onChange) {
          item.onChange = files => {
            return true;
          };
        }
        if (!item.uploadAfter) {
          item.uploadAfter = (result, files) => {
            return true;
          };
        }
        if (!item.uploadBefore) {
          //  console.log("111");
          item.uploadBefore = files => {
            return true;
          };
        }
      }
    },
    initFormRules(init) {
      if (this.loadKey) {
        this.initSource();
      }
      //  this.ruleValidate={};
      this.formRules.forEach((row, xIndex) => {
        if (row.length > this.span) this.span = row.length;

        row.forEach((item, yIndex) => {
          //目前只支持select单选远程搜索，remote远程从后台字典数据源进行搜索，url从指定的url搜索
          if (item.remote || item.url) {
            // item.remoteData = [];
            item.loading = false;
            item.point = { x: xIndex, y: yIndex };
          }
          //初始化上传文件信息
          this.initUpload(item, init);
          //初始化数据源空对象
          if (item.dataKey) {
            //下拉框都强制设置为字符串类型
            item.columnType = "string";
            if (!item.data) {
              item.data = [];
            }
          }
        });
      });
    },
    getRule(item, formFileds) {
      //用户设置的自定义方法
      if (item.validator && typeof item.validator == "function") {
        return {
          validator: (rule, val, callback) => {
            //用户自定义的方法，如果返回了值，直接显示返回的值，验证不通过
            let message = item.validator(rule, val);
            if (message) return callback(new Error(message + ""));
            return callback();
          },
          required: item.required,
          trigger: this.rule.change.indexOf(item.type) != -1 ? "change" : "blur"
        };
      }

      //设置数字的最大值民最小值
      if (
        item.type == "number" ||
        item.columnType == "number" ||
        item.columnType == "int" ||
        item.type == "decimal"
      ) {
        //如果是必填项的数字，设置一个默认最大与最值小
        if (item.required && typeof item.min != "number") {
          if (item.type == "decimal") {
            item.min = 0.1;
          } else {
            item.min = 1;
          }
        }

        return {
          required: item.required,
          message: item.title,
          title: item.title,
          trigger: "blur",
          min: item.min,
          max: item.max,
          type: item.columnType || item.type,
          validator: (rule, value, callback) => {
            if (!rule.min && !rule.max) {
              if (rule.required) {
                if (value == "") {
                  formFileds[rule.field] = 0;
                  return callback();
                }
              }
              if (value == "" || value == undefined) return callback();
            }
            if (rule.type == "number") {
              if (!this.rule.number.test(value)) {
                rule.message = rule.title + "只能是整数";
                return callback(new Error(rule.message));
              }
            } else {
              if (!this.rule.decimal.test(value)) {
                rule.message = rule.title + "只能是数字";
                return callback(new Error(rule.message));
              }
            }
            if (
              rule.min != undefined &&
              typeof rule.min == "number" &&
              value < rule.min
            ) {
              rule.message = rule.title + "不能小于" + rule.min;
              return callback(new Error(rule.message));
            }
            if (
              rule.max != undefined &&
              typeof rule.max == "number" &&
              value > rule.max
            ) {
              rule.message = rule.title + "不能大于" + rule.max;
              return callback(new Error(rule.message));
            }
            return callback();
          }
        };
      }

      //手机验证
      if (item.type == "phone") {
        return {
          validator: this.validatorPhone,
          required: item.required,
          trigger: "blur"
        };
      }

      if (item.type == "password") {
        return {
          validator: this.validatorPwd,
          required: item.required,
          trigger: "blur"
        };
      }

      if (!item.required && item.type != "mail") {
        return {
          required: false
        };
      }

      if (!item.hasOwnProperty("type")) {
        item.type = "text";
      }

      //inputTypeArr:['text','string','mail','textarea'],
      if (this.inputTypeArr.indexOf(item.type) != -1) {
        let message =
          item.title +
          (this.types[item.columnType] == "number"
            ? "请输入一个有效的数字"
            : item.type == "mail"
            ? "必须是一个邮箱地址"
            : "不能为空");
        let type = item.type == "mail" ? "email" : this.types[item.columnType];
        let _rule = {
          required: true,
          message: message,
          trigger: "blur",
          type: type
        };
        if (item.type == "mail") {
          _rule.required = item.required;
          return [
            _rule,
            {
              type: type,
              message: message,
              trigger: "blur"
            }
          ];
        }
        if (item.min) {
          _rule.min = item.min;
          _rule.message = item.title + "至少" + item.min + "个字符!";
        }
        if (item.max) {
          return [
            _rule,
            {
              max: item.max,
              required: true,
              message: item.title + "最多" + item.max + "个字符!",
              trigger: "blur"
            }
          ];
        }
        return _rule;
      }

      if (item.type == "radio") {
        return {
          required: item.required,
          message: "请选择" + item.title,
          trigger: "change",
          type: "string"
        };
      }
      if (item.type == "date" || item.type == "datetime") {
        return {
          // required: true, type:  this.types[item.columnType], message:"请选择" + item.title, trigger: 'change'
          required: true,
          message: "请选择" + item.title,
          trigger: "change",
          type: item.range ? "array" : "string",
          //  type: this.types[item.columnType],
          validator: (rule, val, callback) => {
            //用户自定义的方法，如果返回了值，直接显示返回的值，验证不通过
            if (!val || (item.range && val.length == 0)) {
              return callback(new Error("请选择日期"));
            }
            console.log(val);
            // if (message) return callback(new Error(message + ""));
            return callback();
          }
        };
      }

      //if (item.type == "checkbox" || item.type == "select") {
      if (
        item.type == "select" ||
        item.type == "selectList" ||
        item.type == "checkbox" ||
        item.type == "drop" ||
        item.type == "cascader" //2020.05.31增加级联类型
      ) {
        let _rule = {
          required: true,
          message: "请选择" + item.title,
          min: item.min || 1,
          type: "array",
          trigger: "change",
          type: this.types[item.columnType],
          validator: (rule, value, callback) => {
            if (value == undefined || value === "") {
              return callback(new Error(rule.message));
            }
            return callback();
          }
        };

        //    validator: this.validatorPhone,
        if (!item.max) return _rule;
        return [
          _rule,
          {
            message: "最多只能选择" + item.max + "项" + item.title,
            max: item.max,
            type: "array",
            trigger: "change"
          }
        ];
      }
      return {
        required: false
      };
    },
    getCheckBoxModel(arr) {
      return arr;
      console.log(arr);
      return arr || [];
    },
    validateField(item, callback) {
      //2020.07.17增加对日期onchange时校验
      let fields = this.$refs.formValidate.fields;
      fields.forEach(field => {
        if (field.prop == item.field) {
          field.validate("", error => {
            console.log(error);
          });
        }
      });
       //2020.07.24增加日期onChange事件
      item.onChange&&item.onChange(this.formFileds[item.field])
    }
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
/* .ivu-form-item{

} */
.line-row >>> .ivu-form-item-label {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
</style>
<style lang="less" scoped>
.form-imgs {
  display: inline-block;
  .img-item {
    position: relative;
    cursor: pointer;
    margin: 0 10px 10px 0;
    float: left;
    height: 100px;
    border: 1px solid #9e9e9e;
    overflow: hidden;
    border-radius: 5px;
    width: 100px;
  }
  img {
    margin: 0;
    padding: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
  }
}
.form-item-extra {
  display: flex;
  > div:first-child {
    flex: 1;
  }
  .form-extra {
    margin-left: 10px;
  }
}
</style>


