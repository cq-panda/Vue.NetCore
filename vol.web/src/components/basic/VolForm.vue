<template>
  <div style="padding: 0 10px">
    <el-tabs @tab-click="tabClick" v-if="currentGroup" v-model="currentGroup" class="form-tabs">
      <el-tab-pane v-for="(group, index) in tabsGroup" :key="index" :name="group">
        <template #label>
          <span class="custom-tabs-label">
            <i class="el-icon-date" style="margin-right: 5px"></i>
            <span>{{ $ts(group) }}</span>
          </span>
        </template>
      </el-tab-pane>
    </el-tabs>
  </div>

  <el-form
    style="width: 100%; position: relative"
    :inline="true"
    ref="volform"
    @submit.prevent
    :model="formFields"
    :label-width="labelWidth"
    :label-position="labelPosition || $global.labelPosition"
    :rules="rules"
    :class="[
      (labelPosition == 'left' || $global.labelPosition == 'left') && labelPosition != 'top'
        ? 'form-normal'
        : 'form-lang'
    ]"
  >
    <template v-for="(row, findex) in formRules" :key="findex">
      <div class="vol-form-item" style="width: 100%">
        <el-form-item
          v-show="!item.hidden"
          v-for="(item, index) in row"
          :prop="item.field"
          :key="index"
          :class="{ 'vol-form-hiden-field': !item.field || !item.title }"
          :style="getColWidth(formRules, item)"
          style="float: left; margin-right: 0; padding: 0 10px; margin-bottom: 14px"
        >
          <template #label>
            <form-expand v-if="item.labelRender" :render="item.labelRender" :par="12"></form-expand>
            <span v-else :style="item.labelStyle">
              {{
                $ts(item.title) +
                ((labelPosition == 'left' || $global.labelPosition == 'left') && item.title
                  ? ':'
                  : '')
              }}
            </span>
          </template>
          <!-- render -->
          <form-expand
            v-if="item.render && typeof item.render == 'function'"
            :render="item.render"
            :par="12"
          ></form-expand>
          <!-- 2021.10.17增加表单实时方法计算 -->
          <div v-else-if="item.readonly && typeof formFields[item.field] == 'function'">
            {{ formFields[item.field]() }}
            <span v-if="item.extra" :style="item.extra.style"
              ><i :class="item.extra.icon"></i> {{ item.extra.text }}</span
            >
          </div>
          <!-- 只读图片或文件  -->
          <div v-else-if="isReadonlyImgFile(item, formFields)">
            <div v-if="item.type == 'img'" class="form-imgs">
              <div
                class="img-item"
                v-for="(img, imgIndex) in formFields[item.field]"
                :key="imgIndex"
              >
                <img
                  :style="item.style"
                  :src="getSrc(img.path, http, access_token)"
                  @error="handleImageError"
                  @click="previewImg(img.path, access_token, http)"
                />
              </div>
            </div>
            <div
              v-else
              class="form-file-list"
              v-for="(file, fileIndex) in formFields[item.field]"
              :key="fileIndex"
            >
              <a
                @click="dowloadFile(formFields[item.field][fileIndex], access_token, $store, http)"
                >{{ file.name }}</a
              >
            </div>
          </div>

          <div v-else :class="{ 'form-item-extra': item.extra }">
            <!-- 只读属性 -->
            <label
              :style="item.inputStyle"
              v-if="item.type == 'label' || item.label"
              class="readonly-input"
              >{{ getText(formFields, item, $ts) }}</label
            >
            <!-- 20223.05.13集成el-tree-select -->
            <!-- :filter-method="(value)=>{filterMethod(value,item.data)}" -->
            <!-- :filterable="true" -->
            <el-tree-select
              style="width: 100%"
              v-else-if="item.type == 'treeSelect'"
              v-model="formFields[item.field]"
              :disabled="item.readonly || item.disabled"
              :data="item.data"
              :multiple="item.multiple"
              :render-after-expand="false"
              :show-checkbox="true"
              :check-strictly="item.checkCtrictly === undefined ? true : item.checkCtrictly"
              check-on-click-node
              node-key="key"
              :props="{ label: 'label' }"
              @change="
                (val) => {
                  item.onChange && item.onChange(val, item.data)
                }
              "
            >
              <template #default="{ data, node }"> {{ $ts(data.label) }}</template>
            </el-tree-select>
            <template v-else-if="['select', 'selectList'].indexOf(item.type) != -1">
              <el-select-v2
                :disabled="item.readonly || item.disabled"
                v-show="!item.hidden"
                style="width: 100%"
                :size="size"
                v-if="item.data.length > select2Count"
                v-model="formFields[item.field]"
                filterable
                :multiple="item.type == 'select' ? false : true"
                :placeholder="$ts(item.placeholder || '请选择')"
                :allow-create="item.autocomplete"
                :options="item.data"
                @change="
                  (val) => {
                    item.onChange && item.onChange(val, item.data)
                  }
                "
                clearable
              >
                <template #default="{ item }">
                  {{ $ts(item.label) }}
                </template>
              </el-select-v2>
              <el-select
                :disabled="item.readonly || item.disabled"
                v-show="!item.hidden"
                style="width: 100%"
                :size="size"
                v-else-if="item.remote || item.url"
                v-model="formFields[item.field]"
                filterable
                :ref="item.field"
                remote
                :multiple="item.type == 'select' ? false : true"
                :placeholder="$ts(item.placeholder || '请选择')"
                clearable
                :remote-method="
                  (val) => {
                    remoteSearch(item, formFields, val)
                  }
                "
              >
                <el-option
                  v-for="item in item.data"
                  :key="item.key"
                  :label="$ts(item.value)"
                  :value="item.key"
                >
                </el-option>
              </el-select>
              <el-select
                :disabled="item.readonly || item.disabled"
                v-show="!item.hidden"
                style="width: 100%"
                :size="size"
                v-else
                :ref="item.field"
                v-model="formFields[item.field]"
                filterable
                :multiple="item.type == 'select' ? false : true"
                :placeholder="$ts(item.placeholder || '请选择')"
                :allow-create="item.autocomplete"
                :filter-method="item.filterMethod"
                @change="
                  (val) => {
                    itemChange(item, val, false)
                  }
                "
                clearable
                @clear="
                  () => {
                    itemChange(item, null, true)
                  }
                "
              >
                <el-option
                  v-show="!item.hidden"
                  :disabled="item.disabled"
                  v-for="item in item.data"
                  :key="item.key"
                  :label="$ts(item.value)"
                  :value="item.key"
                >
                </el-option>
              </el-select>
            </template>
            <el-switch
              v-show="!item.hidden"
              v-else-if="item.type == 'switch'"
              v-model="formFields[item.field]"
              :disabled="item.readonly || item.disabled"
              active-color="#0f84ff"
              @change="item.onChange"
              :active-text="$ts(item.activeText || '是')"
              :inactive-text="$ts(item.inactiveText || '否')"
              inactive-color="rgb(194 194 194)"
              :width="40"
              :active-value="
                typeof formFields[item.field] == 'boolean'
                  ? true
                  : typeof formFields[item.field] == 'string'
                  ? '1'
                  : 1
              "
              :inactive-value="
                typeof formFields[item.field] == 'boolean'
                  ? false
                  : typeof formFields[item.field] == 'string'
                  ? '0'
                  : 0
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
              <el-radio
                v-for="kv in item.data"
                :disabled="item.readonly || kv.readonly || kv.disabled"
                :key="kv.key"
                :label="kv.value"
                :value="kv.key"
                >{{ $ts(kv.value) }}</el-radio
              >
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
                :disabled="item.readonly || kv.readonly || kv.disabled"
                :label="kv.value"
                :value="kv.key"
                >{{ $ts(kv.value) }}</el-checkbox
              >
            </el-checkbox-group>
            <div
              class="v-date-range"
              style="display: flex"
              v-else-if="
                ['date', 'datetime', 'month', 'year'].indexOf(item.type) != -1 && item.range
              "
            >
              <el-date-picker
                :size="size"
                :ref="item.field"
                :disabled="item.readonly || item.disabled"
                style="flex: 1; width: auto"
                v-model="formFields[item.field]"
                :type="item.type + 'range'"
                :disabledDate="(val) => getDateOptions(val, item)"
                :start-placeholder="$ts('开始时间')"
                :unlink-panels="true"
                :end-placeholder="$ts('结束时间')"
                @change="
                  (val) => {
                    dateRangeChange(val, item)
                  }
                "
                :value-format="getDateFormat(item)"
                :shortcuts="getShortcuts($ts)"
                range-separator="-"
              >
              </el-date-picker>
              <!-- <span style="margin: 0px 5px; font-size: 13px; color: #6f6b6b"> - </span>
              <el-date-picker
                :size="size"
                :disabled="item.readonly || item.disabled"
                style="flex: 1; width: auto"
                v-model="formFields[item.field][1]"
                :placeholder="$ts('结束时间')"
                :type="item.type == 'date' ? 'date' : 'datetime'"
                :disabledDate="(val) => getDateOptions(val, item)"
                @change="
                  (val) => {
                    dateRangeChange(val, item);
                  }
                "
                :value-format="getDateFormat(item)"
                :shortcuts="getShortcuts()"
              >
              </el-date-picker> -->
            </div>
            <!-- v-show不添加根节点就会报错没有根点节 -->
            <div
              v-show="!item.hidden"
              style="width: 100%"
              v-else-if="['date', 'datetime', 'month', 'year'].indexOf(item.type) != -1"
            >
              <el-date-picker
                :size="size"
                clearable
                :ref="item.field"
                :disabled="item.readonly || item.disabled"
                style="width: 100%"
                v-model="formFields[item.field]"
                @change="item.onChange"
                :type="item.type"
                :placeholder="$ts(item.placeholder || item.title)"
                :disabledDate="(val) => getDateOptions(val, item)"
                :value-format="getDateFormat(item)"
              >
              </el-date-picker>
            </div>

            <el-time-picker
              :ref="item.field"
              :size="size"
              v-else-if="item.type == 'time'"
              v-model="formFields[item.field]"
              :disabled="item.readonly || item.disabled"
              :placeholder="$ts('时间')"
              :value-format="item.format || 'HH:mm:ss'"
              :format="item.format"
              @change="item.onChange"
              style="width: 100%"
            >
            </el-time-picker>

            <el-scrollbar
              style="border: 1px solid #c7d8db; border-radius: 5px"
              :height="item.height || 150"
              v-else-if="item.type == 'editor' && (item.readonly || item.disabled)"
            >
              <div ref="editor" v-html="formFields[item.field]"></div>
            </el-scrollbar>

            <vol-wang-editor
              ref="editor"
              v-else-if="item.type == 'editor'"
              :url="item.url || editor.uploadImgUrl"
              :upload="item.upload || editor.upload"
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
              :imgOption="item.imgOption"
              :on-change="
                (files) => {
                  return fileOnChange(files, item)
                }
              "
              :file-click="item.fileClick"
              :remove-before="item.removeBefore"
              :downLoad="item.downLoad ? true : false"
            ></vol-upload>
            <el-cascader
              :size="size"
              :ref="item.field"
              clearable
              style="width: 100%; margin-top: -3px"
              v-model="formFields[item.field]"
              :disabled="item.readonly || item.disabled"
              v-else-if="item.type == 'cascader'"
              :options="item.data"
              :props="{
                checkStrictly: item.changeOnSelect || item.checkStrictly
              }"
              @change="item.onChange"
            >
            </el-cascader>
            <el-rate
              v-else-if="item.type == 'rate'"
              @change="
                (val) => {
                  item.onChange && item.onChange(val)
                }
              "
              :max="item.max"
              v-model="formFields[item.field]"
            />
            <div style="display: flex" v-else-if="item.type == 'range' || item.range">
              <el-input
                :size="size"
                :disabled="item.readonly || item.disabled"
                style="flex: 1"
                v-model="formFields[item.field][0]"
                clearable
              />
              <span style="margin: 0 5px">-</span>
              <el-input
                :size="size"
                :disabled="item.readonly || item.disabled"
                style="flex: 1"
                v-model="formFields[item.field][1]"
                clearable
              />
            </div>
            <template v-else-if="item.type == 'color'">
              {{ formFields[item.field] }}
              <el-color-picker
                show-alpha
                :predefine="[
                  '#ff4500',
                  '#ff8c00',
                  '#ffd700',
                  '#90ee90',
                  '#00ced1',
                  '#1e90ff',
                  '#c71585'
                ]"
                v-model="formFields[item.field]"
              />
            </template>
            <el-input
              :size="size"
              clearable
              :ref="item.field"
              :input-style="item.inputStyle"
              :disabled="item.readonly || item.disabled"
              v-else-if="item.type == 'textarea'"
              v-model="formFields[item.field]"
              type="textarea"
              :autosize="{
                minRows: item.minRows || 2,
                maxRows: item.maxRows || 10
              }"
              :placeholder="$ts(item.placeholder || item.title)"
              @keypress="
                ($event) => {
                  onKeyPress($event, item)
                }
              "
              @change="item.onKeyPress"
              @blur="item.blur"
              @focus="item.focus"
            />
            <el-input-number
              :size="size"
              style="width: 100%"
              :ref="item.field"
              :input-style="item.inputStyle"
              v-else-if="item.type == 'number' || item.type == 'decimal'"
              v-model="formFields[item.field]"
              :precision="item.precision"
              :min="item.min"
              :disabled="item.readonly || item.disabled"
              :max="item.max"
              controls-position="right"
              @keypress="
                ($event) => {
                  onKeyPress($event, item)
                }
              "
              @change="item.onKeyPress"
              @keyup.delete="
                ($event) => {
                  item.onKeyPress && item.onKeyPress($event, item)
                }
              "
              @blur="item.blur"
              @focus="item.focus"
            />
            <el-input
              :size="size"
              clearable
              :input-style="item.inputStyle"
              v-else-if="item.type == 'password'"
              type="password"
              v-model="formFields[item.field]"
              :disabled="item.readonly || item.disabled"
              v-show="!item.hidden"
              :placeholder="$ts(item.placeholder || item.title)"
            />
            <!-- 2021.11.18修复el-input没有默认enter事件时回车异常 -->
            <el-input
              :size="size"
              clearable
              :ref="item.field"
              :input-style="item.inputStyle"
              v-else-if="item.onKeyPress"
              :placeholder="$ts(item.placeholder || item.title)"
              :disabled="item.readonly || item.disabled"
              v-show="!item.hidden"
              v-model="formFields[item.field]"
              @keypress="
                ($event) => {
                  onKeyPress($event, item)
                }
              "
              @keyup.delete="item.onKeyPress"
              @change="item.onKeyPress"
              @keyup.enter="item.onKeyPress"
              @blur="item.blur"
              @focus="item.focus"
            ></el-input>
            <el-input
              :size="size"
              clearable
              v-else
              :ref="item.field"
              :input-style="item.inputStyle"
              :placeholder="$ts(item.placeholder || item.title)"
              :disabled="item.readonly || item.disabled"
              v-show="!item.hidden"
              v-model="formFields[item.field]"
              @blur="item.blur"
              @focus="item.focus"
            ></el-input>

            <div class="form-extra" v-if="item.extra">
              <form-expand v-if="item.extra.render" :render="item.extra.render"></form-expand>
              <a
                v-else-if="item.extra.click"
                :style="item.extra.style"
                @click="item.extra.click(item, formFields[item.field])"
              >
                <i v-if="item.extra.icon" :class="item.extra.icon" />
                {{ $ts(item.extra.text) }}
              </a>
              <a v-else :style="item.extra.style">
                <i v-if="item.extra.icon" :class="item.extra.icon" />
                {{ $ts(item.extra.text) }}
              </a>
            </div>
          </div>
        </el-form-item>
      </div>
    </template>
    <slot></slot>
    <div style="width: 100%">
      <slot name="footer"></slot>
    </div>
  </el-form>
</template>
<script lang="jsx" setup>
//2024.11.16重写组件
import {
  ref,
  reactive,
  getCurrentInstance,
  toRaw,
  toRefs,
  defineAsyncComponent,
  computed,
} from "vue";

import FormExpand from "./VolForm/VolFormRender";
import VolUpload from "@/components/basic/VolUpload.vue";
const VolWangEditor = defineAsyncComponent(() =>
  import("@/components/editor/VolWangEditor.vue")
);

import formProps from "./VolForm/VolFormProps.js";
import getItemRule from "./VolForm/VolFormItemRule.js";
import {
  getDateFormat,
  getShortcuts,
  getDateOptions,
  dateRangeChange,
} from "./VolForm/VolFormDate.js";
import {
  initDefaultParams,
  getColWidth,
  initDataSource,
  isReadonlyImgFile,
  isFile,
  getText,
  previewImg,
  dowloadFile,
  getSrc,
} from "./VolForm/VolFormProvider.js";

const emit = defineEmits(["dicInited", "tabClick"]);

const props = defineProps(formProps());
const { proxy } = getCurrentInstance();

const volform = ref(null);

// const remoteCall = ref(true)
// const span = ref(1)
const rangeFields = reactive([]);
const numberFields = reactive([]);
const tabsGroup = reactive([]);
const currentGroup = ref();

let defaultImg = new URL("@/assets/imgs/error-img.png", import.meta.url).href;
let access_token = "";
//生成文件访问token
const tk = (proxy.$store.getters.getUserInfo() || { accessToken: "" }).accessToken;
if (tk) {
  access_token = "?access_token=" + tk;
}

//默认配置
initDefaultParams(
  props.formRules,
  props.formFields,
  tabsGroup,
  numberFields,
  rangeFields,
  true
);

const changeGroup = () => {
  props.formRules.forEach((x) => {
    x.forEach((ops) => {
      if (ops.group) {
        ops.hidden = ops.group != currentGroup.value;
      }
    });
  });

  emit("tabClick", currentGroup.value);
};
const tabClick = (params) => {
  currentGroup.value = tabsGroup[params.index * 1];
  changeGroup();
};
const setTab = (name) => {
  currentGroup.value = name;
  changeGroup();
};

if (tabsGroup.length) {
  currentGroup.value = tabsGroup[0];
  changeGroup();
}

//初始化字典
const initSource = (resetData = true) => {
  if (!props.loadKey && !resetData) {
    return;
  }
  initDataSource(
    props.formRules,
    proxy.http,
    proxy.$ts,
    props.select2Count,
    resetData,
    (dicData) => {
      emit("dicInited", dicData);
    }
  );
};
initSource(false);

let isFirstCheck = true;
const rules = computed(() => {
  let ruleResult = {};
  props.formRules.forEach((option, xIndex) => {
    option.forEach((item) => {
      ruleResult[item.field] = [getItemRule(item, props.formFields, proxy.$ts)];
    });
  });
  if (!isFirstCheck && volform.value) {
    setTimeout(() => {
      volform.value.clearValidate();
    }, 50);
  } else {
    isFirstCheck = false;
  }
  return ruleResult;
});

const handleImageError = ($e) => {
  $e.target.src = defaultImg;
};
const fileOnChange = (files, item) => {
  volform.value.clearValidate(item.field);
  if (item.onChange) {
    return item.onChange(files);
  }
  return true;
};

const onKeyPress = ($event, item) => {
  if ($event.keyCode == 13) {
    return;
  }
  item.onKeypress && item.onKeypress($event);
  item.onKeyPress && item.onKeyPress($event);
};

const itemChange = (item, value, isClear) => {
  if (isClear) {
    props.formFields[item.field] = item.type == "select" ? null : [];
  }
  item.onChange && item.onChange(value, item.data, isClear);
};

const validate = async (callback) => {
  let result = true;
  await volform.value.validate((valid) => {
    if (!valid) {
      proxy.$message.error(proxy.$ts("数据验证未通过!"));
      result = false;
      return;
    }
    if (typeof callback === "function") {
      try {
        callback(valid);
      } catch (error) {
        let msg = `表单验证回调方法异常：${error.message}`;
        proxy.$message.error(msg);
        console.log(msg);
      }
    }
  });
  return result;
};
//重置表单
const reset = (sourceObj) => {
  // 重置表单时，禁用远程查询
  volform.value.resetFields();
  if (rangeFields.length) {
    rangeFields.forEach((key) => {
      props.formFields[key].splice(0);
      props.formFields[key] = [null, null];
    });
  }
  if (!sourceObj) return;
  for (const key in props.formFields) {
    if (!sourceObj.hasOwnProperty(key)) {
      continue;
    }
    props.formFields[key] = sourceObj[key];
    if (numberFields.indexOf(key) != -1) {
      let newVal = sourceObj[key];
      if ((newVal && newVal !== "0") || newVal + "" === "0") {
        newVal = newVal * 1.0 || 0;
      } else {
        newVal = null;
      }
      props.formFields[key] = newVal;
    }
  }
};

defineExpose({
  initSource,
  validate,
  reset,
  currentGroup,
  setTab,
});
</script>
<style lang="less" scoped>
@import './VolForm/VolForm.less';
</style>
