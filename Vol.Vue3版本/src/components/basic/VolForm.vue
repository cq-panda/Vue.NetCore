<template>
  <el-form
    style="display: inline-block; width: 100%"
    :inline="true"
    ref="volform"
    @submit.prevent
    :model="formFields"
    :label-width="labelWidth"
    :rules="rules"
  >
    <template v-for="(row, findex) in formRules" :key="findex">
      <div style="width: 100%">
        <el-form-item
          :label="item.title ? item.title + '：' : ''"
          v-show="!item.hidden"
          v-for="(item, index) in row"
          :prop="item.field"
          :key="item.field + index"
          :style="{ width: getColWidth(item) + '%' }"
        >
          <!-- render -->
          <form-expand
            v-if="item.render && typeof item.render == 'function'"
            :render="item.render"
            :par="12"
          ></form-expand>
          <!-- 只读图片或文件  -->
          <div v-else-if="isReadonlyImgFile(item, formFields)">
            <div v-if="item.type == 'img'" class="form-imgs">
              <div
                class="img-item"
                v-for="(img, imgIndex) in formFields[item.field]"
                :key="imgIndex"
              >
                <img
                  :src="getSrc(img.path)"
                  :onerror="errorImg"
                  @click="previewImg(img.path)"
                />
              </div>
            </div>
            <div
              v-else
              class="form-file-list"
              v-for="(file, fileIndex) in formFields[item.field]"
              :key="fileIndex"
            >
              <a @click="dowloadFile(formFields[item.field][fileIndex])">{{
                file.name
              }}</a>
            </div>
          </div>

          <div v-else :class="{ 'form-item-extra': item.extra }">
            <!-- 只读属性 -->
            <label v-if="item.type == 'label'" class="readonly-input">{{
              getText(formFields, item)
            }}</label>
            <el-select
              :disabled="item.readonly || item.disabled"
              v-show="!item.hidden"
              size="medium"
              style="width: 100%"
              v-else-if="['select', 'selectList'].indexOf(item.type) != -1"
              v-model="formFields[item.field]"
              filterable
              :multiple="item.type == 'select' ? false : true"
              :placeholder="
                item.placeholder ? item.placeholder : '请选择' + item.title
              "
              :allow-create="item.autocomplete"
              @change="item.onChange"
              :remote="item.remote || item.url"
              clearable
              :remote-method="
                (val) => {
                  remoteSearch(item, formFields, val);
                }
              "
            >
              <el-option
                v-for="item in item.data"
                :key="item.key"
                :label="item.value"
                :value="item.key"
              >
              </el-option>
            </el-select>
            <el-switch
              v-show="!item.hidden"
              v-else-if="item.type == 'switch'"
              v-model="formFields[item.field]"
              :disabled="item.readonly || item.disabled"
              active-color="#0f84ff"
              @change="item.onChange"
              inactive-color="rgb(194 194 194)"
              :active-value="
                typeof formFields[item.field] == 'boolean' ? true : 1
              "
              :inactive-value="
                typeof formFields[item.field] == 'boolean' ? false : 0
              "
            >
            </el-switch>

            <el-radio-group
              :disabled="item.readonly || item.disabled"
              v-show="!item.hidden"
              v-model="formFields[item.field]"
              v-else-if="item.type == 'radio'"
              @change="item.onChange"
            >
              <el-radio v-for="kv in item.data" :key="kv.key" :label="kv.key">{{
                kv.value
              }}</el-radio>
            </el-radio-group>

            <el-checkbox-group
              :disabled="item.readonly || item.disabled"
              v-show="!item.hidden"
              v-model="formFields[item.field]"
              v-else-if="item.type == 'checkbox'"
              @change="item.onChange"
            >
              <el-checkbox
                v-for="kv in item.data"
                :key="kv.key"
                :label="kv.key"
                >{{ kv.value }}</el-checkbox
              >
            </el-checkbox-group>
            <div
              class="v-date-range"
              style="display: flex"
              v-else-if="
                ['date', 'datetime'].indexOf(item.type) != -1 && item.range
              "
            >
              <el-date-picker
                size="medium"
                :disabled="item.readonly || item.disabled"
                style="flex: 1; width: auto"
                v-model="formFields[item.field][0]"
                :type="item.type == 'date' ? 'date' : 'datetime'"
                :disabledDate="(val) => getDateOptions(val, item)"
                placeholder="开始时间"
                prefix-icon=" "
                @change="
                  (val) => {
                    dateRangeChange(val, item);
                  }
                "
                :value-format="getDateFormat(item)"
              >
              </el-date-picker>
              <span style="margin: 0px 5px; font-size: 13px; color: #6f6b6b"
                >至</span
              >
              <el-date-picker
                size="medium"
                :disabled="item.readonly || item.disabled"
                style="flex: 1; width: auto"
                v-model="formFields[item.field][1]"
                placeholder="结束时间"
                :type="item.type == 'date' ? 'date' : 'datetime'"
                :disabledDate="(val) => getDateOptions(val, item)"
                @change="
                  (val) => {
                    dateRangeChange(val, item);
                  }
                "
                :value-format="getDateFormat(item)"
              >
              </el-date-picker>
            </div>
            <!-- v-show不添加根节点就会报错没有根点节 -->
            <div
              v-show="!item.hidden"
              style="width: 100%"
              v-else-if="['date', 'datetime'].indexOf(item.type) != -1"
            >
              <el-date-picker
                clearable
                :disabled="item.readonly || item.disabled"
                style="width: 100%"
                size="medium"
                v-model="formFields[item.field]"
                @change="item.onChange"
                :type="item.type"
                :placeholder="
                  item.placeholder ? item.placeholder : '请选择' + item.title
                "
                :disabledDate="(val) => getDateOptions(val, item)"
                :value-format="getDateFormat(item)"
              >
              </el-date-picker>
            </div>

            <div v-else-if="item.type == 'time'">time组件待完善</div>

            <vol-wang-editor
              ref="editor"
              v-else-if="item.type == 'editor'"
              :url="editor.uploadImgUrl"
              :upload="editor.upload"
              v-model="formFields[item.field]"
              :height="item.height || 350"
            ></vol-wang-editor>

            <vol-upload
              v-show="!item.hidden"
              v-else-if="isFile(item, formFields)"
              :desc="item.desc"
              :multiple="item.multiple"
              :max-file="item.maxFile"
              :max-size="item.maxSize"
              :autoUpload="item.autoUpload"
              :fileInfo="formFields[item.field]"
              :url="item.url"
              :img="item.type == 'img' || item.columnType == 'img'"
              :excel="item.type == 'excel'"
              :fileTypes="item.fileTypes ? item.fileTypes : []"
              :upload-before="item.uploadBefore"
              :upload-after="item.uploadAfter"
              :append="item.multiple"
              :on-change="
                (files) => {
                  return fileOnChange(files, item);
                }
              "
              :file-click="item.fileClick"
              :remove-before="item.removeBefore"
              :downLoad="item.downLoad ? true : false"
            ></vol-upload>
            <el-cascader
              clearable
              size="medium"
              style="width: 100%"
              v-model="formFields[item.field]"
              :disabled="item.readonly || item.disabled"
              v-else-if="item.type == 'cascader'"
              :options="item.data"
              :props="{
                checkStrictly: item.changeOnSelect || item.checkStrictly,
              }"
              @change="item.onChange"
            >
            </el-cascader>
            <div
              style="display: flex"
              v-else-if="item.type == 'range' || item.range"
            >
              <el-input
                :disabled="item.readonly || item.disabled"
                style="flex: 1"
                size="medium"
                v-model="formFields[item.field][0]"
                clearable
              />
              <span style="margin: 0 5px">-</span>
              <el-input
                size="medium"
                :disabled="item.readonly || item.disabled"
                style="flex: 1"
                v-model="formFields[item.field][1]"
                clearable
              />
            </div>
            <el-input
              clearable
              :disabled="item.readonly || item.disabled"
              v-else-if="item.type == 'textarea'"
              v-model="formFields[item.field]"
              type="textarea"
              :autosize="{
                minRows: item.minRows || 2,
                maxRows: item.maxRows || 10,
              }"
              :placeholder="
                item.placeholder ? item.placeholder : '请输入' + item.title
              "
              :ref="item.field"
            />

            <el-input
              clearable
              v-else-if="item.type == 'password'"
              type="password"
              v-model.number="formFields[item.field]"
              size="medium"
              :disabled="item.readonly || item.disabled"
              v-show="!item.hidden"
              :placeholder="
                item.placeholder ? item.placeholder : '请输入' + item.title
              "
            />

            <el-input
              clearable
              v-else
              size="medium"
              :placeholder="
                item.placeholder ? item.placeholder : '请输入' + item.title
              "
              :disabled="item.readonly || item.disabled"
              v-show="!item.hidden"
              v-model="formFields[item.field]"
              @keypress="item.onKeyPress"
              @change="item.onKeyPress"
              @keyup.enter="item.onKeyPress"
            ></el-input>

            <div class="form-extra" v-if="item.extra">
              <form-expand
                v-if="item.extra.render"
                :render="item.extra.render"
              ></form-expand>
              <a
                v-else-if="item.extra.click"
                :style="item.extra.style"
                @click="item.extra.click(item, formFields[item.field])"
              >
                <i v-if="item.extra.icon" :class="item.extra.icon" />
                {{ item.extra.text }}
              </a>
              <a v-else :style="item.extra.style">
                <i v-if="item.extra.icon" :class="item.extra.icon" />
                {{ item.extra.text }}
              </a>
            </div>
          </div>
        </el-form-item>
      </div>
    </template>
    <slot></slot>
    <div style="width: 100%"><slot name="footer"></slot></div>
  </el-form>
</template>
<script>
const rule = {
  change: [
    "checkbox",
    "select",
    "date",
    "datetime",
    "drop",
    "radio",
    "cascader",
  ], // 2020.05.31增加级联类型
  phone: /^[1][3,4,5,6,7,8,9][0-9]{9}$/,
  decimal: /(^[\-0-9][0-9]*(.[0-9]+)?)$/,
  number: /(^[\-0-9][0-9]*([0-9]+)?)$/,
};
const inputTypeArr = ["text", "string", "mail", "textarea", "password"];
const types = {
  int: "number",
  byte: "number",
  decimal: "number", // "float",
  string: "string",
  bool: "boolean",
  date: "datetime",
  date: "date",
  mail: "email",
};
//表单验证注意：每次验证都必须执行callback,否则验证不执行回调方法
const colPow = Math.pow(10, 3);
import FormExpand from "./VolForm/VolFormRender";
import {
  defineAsyncComponent,
  defineComponent,
  ref,
  getCurrentInstance,
  onMounted,
} from "vue";
export default defineComponent({
  components: {
    FormExpand,
    "vol-upload": defineAsyncComponent(() =>
      import("@/components/basic/VolUpload.vue")
    ),
    "vol-wang-editor": defineAsyncComponent(() =>
      import("@/components/editor/VolWangEditor.vue")
    ),
  },
  props: {
    loadKey: {
      // 是否加载formRules字段配置的数据源
      type: Boolean,
      default: true,
    },
    width: {
      // 表单宽度
      type: Number,
      default: 0,
    },
    labelWidth: {
      // 表单左边label文字标签的宽度
      type: Number,
      default: 100,
    },
    formRules: {
      // 表单配置规则，如字段类型，是否必填
      type: Array,
      default: [],
    },
    formFields: {
      type: Object,
      default: () => {
        return {};
      },
    },
    editor: {
      // 2021.01.16编辑器信息 {uploadImgUrl:"",upload:null//上传方法}
      type: Object,
      default: () => {
        return {};
      },
    },
  },
  computed: {
    rules() {
      let ruleResult = {};
      this.formRules.forEach((option, xIndex) => {
        option.forEach((item) => {
          ruleResult[item.field] = [this.getRule(item, this.formFields)];
        });
      });
      return ruleResult;
    },
  },
  setup(props, context) {
    const { appContext } = getCurrentInstance();
    const remoteCall = ref(true);
    const span = ref(1);
    const rangeFields = ref([]);
    const volform = ref(null);
    onMounted(() => {});
    const initFormRules = (init) => {
      if (props.loadKey) {
        initSource();
      }
      props.formRules.forEach((row, xIndex) => {
        if (row.length > span.value) span.value = row.length;
        let _count = 0,
          _size = 0;
        row.forEach((x) => {
          if (x.colSize > 0) {
            _size = _size + x.colSize;
            _count++;
          }
        });
        if (_count > 0 && row.length - _count > 0) {
          let _cellSize = (12 - _size) / (row.length - _count);
          row.forEach((x) => {
            if (!x.colSize) {
              x.colSize = _cellSize;
            }
          });
        }
        row.forEach((item, yIndex) => {
          // 目前只支持select单选远程搜索，remote远程从后台字典数据源进行搜索，url从指定的url搜索
          if (item.remote || item.url) {
            // item.remoteData = [];
            item.loading = false;
            item.point = { x: xIndex, y: yIndex };
          }
          // 初始化上传文件信息
          initUpload(item, init);
          // 初始化数据源空对象
          if (item.dataKey) {
            // 下拉框都强制设置为字符串类型
            item.columnType = "string";
            if (!item.data) {
              item.data = [];
            }
          }

          if (item.range || item.type == "range") {
            if (
              !(props.formFields[item.field] instanceof Array) ||
              props.formFields[item.field].length != 2
            ) {
              props.formFields[item.field] = ["", ""];
            }
            rangeFields.value.push(item.field);
          }
        });
      });
    };

    const initSource = () => {
      let keys = [],
        binds = [];
      // 初始化字典数据源
      props.formRules.forEach((item) => {
        item.forEach((x) => {
          if (x.dataKey && (!x.data || x.data.length == 0) && !x.remote) {
            x.data = [];
            binds.push({ key: x.dataKey, data: x.data });
            if (keys.indexOf(x.dataKey) == -1) {
              keys.push(x.dataKey);
            }
          }
        });
      });

      if (keys.length == 0) return;
      appContext.config.globalProperties.http
        .post("/api/Sys_Dictionary/GetVueDictionary", keys)
        .then((dic) => {
          bindOptions(dic, binds);
        });
    };
    const bindOptions = (dic, binds) => {
      dic.forEach((d) => {
        binds.forEach((x) => {
          if (x.key != d.dicNo) return true;
          // 如果有数据的则不查询
          if (x.data.length > 0) return true;
          if (d.data.length > 0 && !d.data[0].hasOwnProperty("key")) {
            let source = d.data,
              newSource = new Array(source.length);
            for (let index = 0; index < source.length; index++) {
              newSource[index] = {
                key: source["key"] + "",
                value: source["value"],
              };
            }
            x.data.push(...newSource);
          } else {
            x.data.push(...d.data);
          }
        });
      });
    };

    const initUpload = (item, init) => {
      if (!init) return;
      if (
        ["img", "excel", "file"].indexOf(item.type != -1) ||
        item.columnType == "img"
      ) {
        // 只是没设置是否自动上传的，默认都是选择文件后自动上传
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
          item.onChange = (files) => {
            return true;
          };
        }
        if (!item.uploadAfter) {
          item.uploadAfter = (result, files) => {
            return true;
          };
        }
        if (!item.uploadBefore) {
          item.uploadBefore = (files) => {
            return true;
          };
        }
      }
    };
    const validate = (callback) => {
      let result = true;
      volform.value.validate((valid) => {
        if (!valid) {
          appContext.config.globalProperties.$message.error("数据验证未通过!");
          result = false;
        } else if (typeof callback === "function") {
          callback(valid);
        }
      });
      return result;
    };

    initFormRules(true);
    return {
      remoteCall,
      span,
      rangeFields,
      validate,
      volform,
      //  initFormRules,
      // initSource
    };
  },
  created() {
    //this.initFormRules(true);
  },
  data() {
    return {
      // remoteCall: true,
      errorImg: 'this.src="' + require("@/assets/imgs/error-img.png") + '"',
      // span: 1,
      // rangeFields: [],
    };
  },
  methods: {
    getColWidth(item) {
      let rete =
        Math.round(((item.colSize || 12 / this.span) / 0.12) * colPow, 10.0) /
        colPow;
      if (item.colSize) return rete.toFixed(3);
      return rete.toFixed(3);
      // return (100 - rete).toFixed(3);
    },
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
    // 是否为图片文件等格式并对字段的转换成数组：[{name:'1.jpg',path:'127.0.0.1/ff/1.jpg'}]
    isFile(item, formFields) {
      if (
        item.type == "img" ||
        item.columnType == "img" ||
        item.type == "excel" ||
        item.type == "file"
      ) {
        this.convertFileToArray(item, formFields);
        return true;
      }
      return false;
    },
    isReadonlyImgFile(item, formFields) {
      if ((item.disabled || item.readonly) && this.isFile(item, formFields)) {
        return true;
      }
      return false;
    },
    convertFileToArray(item, formFields) {
      if (!item.maxFile) {
        item.maxFile = 1; // 默认只能上传一个文件，可以在onInit中设置
      }

      let fileInfo = formFields[item.field];
      if (fileInfo instanceof Array) {
        return;
      }
      if (fileInfo === null || fileInfo === undefined) {
        formFields[item.field] = [];
        return;
      }
      // 将以逗号隔开的文件分割成数组127.0.0.1/aa/1.jpg,将127.0.0.1/aa/2.jpg
      if (typeof fileInfo === "string") {
        if (fileInfo.trim() === "") {
          formFields[item.field] = [];
          return;
        }
        // 如果文件路径是字符串，则使用，拆分
        fileInfo = fileInfo.replace(/\\/g, "/");
        let files = fileInfo.split(",");
        formFields[item.field] = [];
        for (let index = 0; index < files.length; index++) {
          let file = files[index];
          let splitFile = file.split("/");
          formFields[item.field].push({
            name: splitFile.length > 0 ? splitFile[splitFile.length - 1] : file,
            path: file, // this.base.isUrl(file) ? file : this.http.ipAddress + file,
          });
        }
      }
    },
    dowloadFile(file) {
      this.base.dowloadFile(
        file.path,
        file.name,
        {
          Authorization: this.$store.getters.getToken(),
        },
        this.http.ipAddress
      );
    },
    validatorPhone(ruleOption, value, callback) {
      if (!ruleOption.required && !value && value != "0") {
        return callback();
      }
      if (!rule.phone.test((value || "").trim())) {
        return callback(new Error("请输入正确的手机号"));
      }
      callback();
    },
    validatorPwd(ruleOption, value, callback) {
      if (!ruleOption.required && !value && value != "0") {
        return callback();
      }
      if ((value + "").trim().length < 6) {
        return callback(new Error("密码长度不能小于6位"));
      }
      callback();
    },
    convertArrayValue(data, val) {
      // 2020.12.13增加表单多选只转换字典
      // 编辑多选table显示
      let valArr = val instanceof Array ? val : val.split(",");
      for (let index = 0; index < valArr.length; index++) {
        var _item = data.find((x) => {
          return x.key && x.key != "0" && x.key + "" == valArr[index] + "";
        });
        if (_item) {
          valArr[index] = _item.value;
        }
      }
      return valArr.join(",");
    },
    getText(formFields, item) {
      // 2019.10.24修复表单select组件为只读的属性时没有绑定数据源
      let text = formFields[item.field];
      if (typeof text === "function") return text(formFields);
      if (text === "null" || text === "" || text === null || text === undefined)
        return "--";
      //2021.03.02增加只读时日期处理
      if (item.type == "date") {
        return text.replace("T", " ").split(" ")[0];
      }
      //2021.03.31修复表单switch只读时没有转换值的问题
      if (item.type == "switch") {
        return text ? "是" : "否";
      }
      if (!item.data) return text;
      if (item.type == "selectList" || item.type == "checkbox") {
        return this.convertArrayValue(item.data, text);
      }
      var _item = item.data.find((x) => {
        return x.key == text;
      });
      return _item ? _item.value : text;
    },
    onClear(item, formFields) {
      // 远程select标签清空选项
      item.data.splice(0);
      // console.log(2);
    },
    onChange(item, value) {
      if (item.onChange && typeof item.onChange === "function") {
        item.onChange(value, item);
      }
    },
    onRemoteChange(item, value) {
      // 第二次打开时，默认值成了undefined，待查viewgrid中重置代码
      if (value == undefined && item.data.length > 0) {
        this.formFields[item.field] = item.data[0].key;
        //  console.log('undefined');
      }
      this.remoteCall = false;
      if (item.onChange && typeof item.onChange === "function") {
        item.onChange(value, item);
      }
    },
    getData(item) {
      return item.data;
    },

    // 远程搜索(打开弹出框时应该禁止搜索)
    remoteSearch(item, formFields, val) {
      if (
        val == "" ||
        (item.data.length == 1 &&
          (val == item.data[0].key || val == item.data[0].value))
      ) {
        return;
      }
      // 弹出框或初始化表单时给data设置数组默认值2
      // 2020.09.26修复远程搜索自定义url不起作用的问题
      let url;
      if (typeof item.url === "function") {
        url = item.url(val, item.dataKey, item);
      } else {
        url =
          (item.url || "/api/Sys_Dictionary/GetSearchDictionary") +
          "?dicNo=" +
          item.dataKey +
          "&value=" +
          val;
      }
      this.http.post(url).then((dicData) => {
        this.$set(item, "loading", false);
        item.data = dicData;
        this.formRules[item.point.x].splice(item.point.y, 1, item);
      });
    },
    getObject(date) {
      if (typeof date === "object") {
        return date;
      }
      return new Date(date);
    },
    reset(sourceObj) {
      // 重置表单时，禁用远程查询
      this.$refs["volform"].resetFields();
      if (this.rangeFields.length) {
        this.rangeFields.forEach((key) => {
          this.formFields[key].splice(0);
          this.formFields[key] = [null, null];
        });
      }
      if (!sourceObj) return;
      for (const key in this.formFields) {
        if (sourceObj.hasOwnProperty(key)) {
          this.formFields[key] = sourceObj[key];
        }
      }
      //  this.remoteCall = true;
    },

    fileOnChange(files, item) {
      this.$refs.volform.clearValidate(item.field);
      if (item.onChange) {
        return item.onChange(files);
      }
      return true;
    },
    isReadonly(item) {
      return item.readonly || item.disabled;
    },
    getRule(item, formFields) {
      //2021.07.17增加只读表单不验证
      //range与swtich暂时不做校验
      if (
        // item.readonly ||
        // item.disabled ||
        item.type == "switch" ||
        item.type == "range"
      )
        return { required: false };
      // 用户设置的自定义方法
      if (item.validator && typeof item.validator === "function") {
        return {
          validator: (rule, val, callback) => {
            // 用户自定义的方法，如果返回了值，直接显示返回的值，验证不通过
            let message = item.validator(rule, val);
            if (message) return callback(new Error(message + ""));
            return callback();
          },
          required: item.required,
          trigger: rule.change.indexOf(item.type) != -1 ? "change" : "blur",
        };
      }
      if (["img", "excel", "file"].indexOf(item.type) != -1) {
        return {
          validator: (rule, val, callback) => {
            if (!this.isReadonly(item) && (!val || !val.length)) {
              return callback(
                new Error(item.type == "img" ? "请上传照片" : "请上传文件")
              );
            }
            return callback();
          },
          required: true,
          trigger: "change",
        };
      }
      // 设置数字的最大值民最小值
      if (
        item.type == "number" ||
        item.columnType == "number" ||
        item.columnType == "int" ||
        item.type == "decimal"
      ) {
        // 如果是必填项的数字，设置一个默认最大与最值小
        if (item.required && typeof item.min !== "number") {
          item.min =0 //item.type == "decimal" ? 0.1 : 1;
        }

        return {
          required: item.required,
          message: item.title,
          title: item.title,
          trigger: "blur",
          min: item.min,
          max: item.max,
          type: item.columnType || item.type,
          validator: (ruleObj, value, callback) => {
            if (!ruleObj.min && !ruleObj.max) {
              if (ruleObj.required) {
                if (value == "") {
                  formFields[rule.field] = 0;
                  return callback();
                }
              }
              if (value === "" || value === undefined) return callback();
            }
            if (this.isReadonly(item)) return callback();
            if (ruleObj.type == "number") {
              if (!rule.number.test(value)) {
                ruleObj.message = ruleObj.title + "只能是整数";
                return callback(new Error(ruleObj.message));
              }
            } else {
              if (!rule.decimal.test(value)) {
                ruleObj.message = ruleObj.title + "只能是数字";
                return callback(new Error(ruleObj.message));
              }
            }
            if (
              ruleObj.min !== undefined &&
              typeof ruleObj.min === "number" &&
              value < ruleObj.min
            ) {
              ruleObj.message = ruleObj.title + "不能小于" + ruleObj.min;
              return callback(new Error(ruleObj.message));
            }
            if (
              ruleObj.max !== undefined &&
              typeof ruleObj.max === "number" &&
              value > ruleObj.max
            ) {
              ruleObj.message = ruleObj.title + "不能大于" + ruleObj.max;
              return callback(new Error(ruleObj.message));
            }
            return callback();
          },
        };
      }

      // 手机、密码验证
      if (item.type == "password" || item.type == "phone") {
        return {
          validator:
            item.type == "phone" ? this.validatorPhone : this.validatorPwd,
          required: item.required,
          trigger: "blur",
        };
      }

      if (!item.required && item.type != "mail") return { required: false };

      if (!item.hasOwnProperty("type")) item.type = "text";

      if (inputTypeArr.indexOf(item.type) != -1) {
        let message =
          item.title +
          (item.type == "mail" ? "必须是一个邮箱地址" : "不能为空");
        let type = item.type == "mail" ? "email" : types[item.columnType];
        let _rule = {
          required: true,
          message: message,
          trigger: "blur",
          type: type,
          validator: (ruleObj, value, callback) => {
            if (
              !this.isReadonly(item) &&
              (value === "" || value === undefined || value === null)
            ) {
              return callback(new Error(ruleObj.message));
            }
            return callback();
          },
        };
        if (item.type == "mail") {
          _rule.required = item.required;
          return [
            _rule,
            {
              type: type,
              message: message,
              trigger: "blur",
            },
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
              trigger: "blur",
            },
          ];
        }
        return _rule;
      }

      if (item.type == "radio") {
        return {
          required: item.required,
          message: "请选择" + item.title,
          trigger: "change",
          type: "string",
        };
      }
      if (item.type == "date" || item.type == "datetime") {
        return {
          required: true,
          message: "请选择" + item.title,
          trigger: "change",
          type: item.range ? "array" : "string",
          validator: (rule, val, callback) => {
            if (this.isReadonly(item)) return callback();
            // 用户自定义的方法，如果返回了值，直接显示返回的值，验证不通过
            if (!val || (item.range && !val.length)) {
              return callback(new Error("请选择日期"));
            }
            return callback();
          },
        };
      }

      if (item.type == "cascader") {
        return {
          type: "array",
          required: true,
          min: item.min || 1,
          // message: "请选择" + item.title,
          trigger: "change",
          validator: (rule, val, callback) => {
            if (this.isReadonly(item)) return callback();
            // 用户自定义的方法，如果返回了值，直接显示返回的值，验证不通过
            let _arr = this.formFields[item.field];
            if (!_arr || !_arr.length) {
              return callback(new Error("请选择" + item.title));
            }
            return callback();
          },
        };
      }

      if (
        ["select", "selectList", "checkbox", "cascader"].indexOf(item.type) !=
        -1
      ) {
        let _rule = {
          type: item.type == "select" ? "string" : "array",
          required: true,
          min: item.min || 1,
          message: "请选择" + item.title,
          trigger: "change",
          validator: (rule, value, callback) => {
            if (this.isReadonly(item)) return callback();
            if (value == undefined || value === "") {
              return callback(new Error(rule.message));
            }
            return callback();
          },
        };

        if (_rule.max) {
          _rule.nax = item.max;
          _rule.message = "最多只能选择" + item.max + "项";
        }
        return _rule;
      }
      return {};
    },
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
      //2021.07.17设置时间可选范围
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
    getDateFormat(item) {
      //见https://day.js.org/docs/zh-CN/display/format
      return item.type == "date" ? "YYYY-MM-DD" : "YYYY-MM-DD HH:mm:ss";
    },
    dateRangeChange(val, item) {
      if (!val) {
        this.$emit("update:formFields");
        return;
      }
      item.onChange && item.onChange(val);
    },
  },
});
</script>
<style lang="less" scoped>
.el-form-item {
  margin-right: 0;
}
.el-form-item {
  .form-imgs {
    img {
      float: left;
      cursor: pointer;
      object-fit: cover;
      margin: 0 10px 10px 0;
      width: 65px;
      height: 65px;
      border: 1px solid #c7c7c7;
      overflow: hidden;
      border-radius: 5px;
      box-sizing: content-box;
    }
  }
}
.el-form-item ::v-deep(.el-form-item__label) {
  padding: 0 0px 0 4px;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
.el-form-item ::v-deep(.el-range-separator) {
  text-align: center;
  width: 13px;
  padding: 0px 1px;
  font-size: 12px;
}
.el-form-item ::v-deep(.el-range__close-icon) {
  margin-right: -10px;
}
.form-item-extra {
  > *:first-child {
    flex: 1;
  }
  display: flex;
  .form-extra {
    padding-left: 7px;
    line-height: 36px;
  }
}
.v-date-range ::v-deep(.el-input__prefix) {
  display: none;
}
.el-form-item ::v-deep(.el-checkbox) {
  margin-right: 8px;
}
.el-form-item ::v-deep(.el-checkbox .el-checkbox__label) {
  padding-left: 5px;
}
</style>
