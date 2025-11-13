<template>
  <vol-box
    :footer="false"
    v-model="model"
    :width="width"
    :padding="0"
    :lazy="true"
    :title="isAnti ? '反审' : '审核'"
  >
    <template #header>
      <div @click="showEditForm" class="btns" v-show="isCurrentUser && hasEditForm">
        <el-button link type="primary" @click="showEditForm"
          ><i class="el-icon-edit"></i> {{ $ts('修改表单') }}</el-button
        >
      </div>
    </template>

    <div
      class="audit-model-content"
      style="max-height: 600px"
      :style="{
        height: (isAnti && !hasFlow) || logs.length ? 'auto' : height - 30 + 'px'
      }"
    >
      <el-descriptions class="desc-top" :column="3" size="default" :border="true">
        <el-descriptions-item
          v-for="(data, key) in formData"
          :key="key"
          :span="data.formType == 'editor' ? 3 : 1"
        >
          <template #label>
            <div class="cell-item">{{ $ts(data.name) }}</div>
          </template>
          <div class="form-file" v-if="data.formType == 'file' || data.formType == 'excel'">
            <a
              @click="fileClick(file)"
              v-for="(file, findex) in getFilePath(data.value)"
              :key="findex"
              >{{ file.name }}</a
            >
          </div>
          <div class="form-img" v-else-if="data.formType == 'img'">
            <img
              @click="imgClick(file, data, findex)"
              v-for="(file, findex) in getFilePath(data.value)"
              :key="findex"
              :src="file.path + access_token"
            />
          </div>
          <div class="form-editor" v-else-if="data.formType == 'editor'" v-html="data.value"></div>
          <div v-else>
            {{ data.value }}
          </div>
        </el-descriptions-item>
      </el-descriptions>

      <div
        class="audit-detail-table"
        v-if="formDetail.name && formDetail.data && formDetail.data.length"
      >
        <div class="audit-detail-title">{{ $ts(formDetail.name) }}</div>
        <table class="step-table">
          <thead>
            <tr>
              <td v-for="(itemDetail, key) in formDetail.data[0]" :key="key">
                {{ $ts(itemDetail.name) }}
              </td>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(itemDetail, aindex) in formDetail.data" :key="aindex">
              <td v-for="(data, key) in itemDetail" :key="key">
                <!-- {{data.value}} -->
                <div class="form-file" v-if="data.formType == 'file' || data.formType == 'excel'">
                  <a
                    @click="fileClick(file)"
                    v-for="(file, findex) in getFilePath(data.value)"
                    :key="findex"
                    >{{ file.name }}</a
                  >
                </div>
                <div class="form-img" v-else-if="data.formType == 'img'">
                  <img
                    @click="imgClick(file, data, findex)"
                    v-for="(file, findex) in getFilePath(data.value)"
                    :key="findex"
                    :src="file.path + access_token"
                  />
                </div>
                <!-- <div v-else-if="data.formType == 'editor'" v-html="data.value"></div> -->
                <!-- <div v-else>
                  {{ data.value }}
                </div> -->
                <div v-else v-html="data.value"></div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <slot name="auditContent"></slot>
      <el-radio-group v-show="hasFlow" style="padding-left: 15px" v-model="activeName" class="ml-4">
        <el-radio label="audit" value="audit" size="large">{{ $ts('审核') }}</el-radio>
        <el-radio label="log" value="log" size="large">{{ $ts('审核记录') }}</el-radio>
      </el-radio-group>
      <div v-show="activeName == 'audit' || !hasFlow" class="audit-content">
        <div class="fx-left" v-if="hasFlow">
          <div class="v-steps">
            <div v-for="(item, index) in workFlowSteps" :key="index">
              <div class="step-item" v-if="item.stepAttrType == 'start'">
                <div class="left-item">
                  <div>{{ $ts('流程开始') }}</div>
                  <div class="left-date">{{ item.createDate }}</div>
                </div>
                <div class="right-item">
                  <div class="step-line"></div>
                  <i class="step-circle"></i>
                  <div class="step-title">
                    {{ item.stepName }}
                  </div>
                  <div class="step-text">{{ $ts('发起人') }}：{{ item.creator }}</div>
                </div>
              </div>
              <div class="step-item" v-else-if="item.stepAttrType == 'end'">
                <div class="left-item">
                  <div>{{ $ts('流程结束') }}</div>
                </div>
                <div class="right-item">
                  <div class="step-line"></div>
                  <i class="step-circle"></i>
                  <div class="step-title">
                    {{ item.stepName }}
                  </div>
                </div>
              </div>
              <div
                v-else
                :class="{
                  'step-current': item.isCurrent,
                  'step-item-gray': !item.auditDate
                }"
                class="step-item"
              >
                <div class="left-item">
                  <div>{{ $ts('审批时间') }}</div>
                  <div class="left-date">
                    {{ item.auditDate || $ts('待审批') }}
                  </div>
                </div>
                <div class="right-item">
                  <div class="step-line"></div>
                  <i class="step-circle"></i>
                  <div class="step-title">
                    {{ item.stepName }}
                  </div>
                  <template v-if="item.auditList && item.auditList.length">
                    <!-- <div class="step-text">{{ $ts("审批信息") }}</div> -->
                    <div class="step-text">
                      <table class="step-table">
                        <thead>
                          <tr>
                            <td class="step-table-user">{{ $ts('审批人') }}</td>
                            <td class="step-table-status">{{ $ts('状态') }}</td>
                            <td class="step-table-date">{{ $ts('审批时间') }}</td>
                          </tr>
                        </thead>
                        <tbody>
                          <tr v-for="(data, aindex) in item.auditList" :key="aindex">
                            <td>
                              {{ data.auditor }}
                            </td>
                            <td>
                              {{ data.auditStatus ? getAuditStatus(data.auditStatus) : '' }}
                            </td>
                            <td class="step-table-date">
                              {{ data.auditDate || '' }}
                            </td>
                          </tr>
                        </tbody>
                      </table>

                      <!-- {{ $ts("状态") }}： {{ getAuditStatus(item.auditStatus) }} -->
                    </div>
                    <div class="step-table-text">
                      {{ $ts('审批意见') }}： {{ item.remark || '-' }}
                    </div>
                  </template>
                  <template v-else>
                    <div class="step-text">{{ $ts('审批人') }}：{{ item.auditor }}</div>
                    <div class="step-text">
                      {{ $ts('状态') }}： {{ getAuditStatus(item.auditStatus) }}
                    </div>
                    <div class="step-text">{{ $ts('审批意见') }}： {{ item.remark || '-' }}</div>
                  </template>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div
          class="fx-right"
          :style="{ width: !hasFlow ? '100%' : '420px' }"
          v-if="isCurrentUser || isAnti || !hasFlow"
        >
          <div v-show="(!isView && !hasFlow) || hasFlow">
            <div v-show="isAnti && hasFlow" style="margin-bottom: 10px">
              <div><span class="item-require">*</span> {{ $ts('退回节点') }}</div>
              <el-select
                style="width: 100%"
                v-model="antiNodeValue"
                filterable
                :placeholder="$ts('请选择')"
              >
                <el-option
                  v-for="item in antiNodes"
                  :key="item.key"
                  :label="$ts(item.value)"
                  :value="item.key"
                >
                </el-option>
              </el-select>
            </div>
            <div v-if="!hasFlow && !isAnti">
              <el-alert
                :title="$tst('当前选中【{$ts}】条记录待审核..', rowLen)"
                type="success"
                :closable="false"
              />
            </div>
            <div v-if="!isAnti" class="rd">
              <span>{{ $ts('审批') }}：</span>
              <el-radio-group style="margin-left: 15px" v-model="auditParam.value">
                <el-radio
                  v-for="item in auditParam.data"
                  :key="item.value"
                  :label="item.value"
                  :value="item.value"
                >
                  <span>{{ item.text }}</span>
                </el-radio>
              </el-radio-group>
            </div>

            <div class="rd" v-else>{{ $ts('审批意见') }}</div>
            <el-input
              style="padding-top: 3px"
              v-model="auditParam.reason"
              type="textarea"
              :autosize="{ minRows: 4, maxRows: 10 }"
              :placeholder="$ts('审批意见') + '...'"
            ></el-input>
            <div class="btn">
              <el-button type="primary" @click="auditClick" icon="Check">{{
                $ts(isAnti ? '反审' : '审核')
              }}</el-button>
            </div>
          </div>
          <slot name="auditButton"></slot>
          <!-- v-if="!hasFlow && isAnti" -->
          <div v-if="!hasFlow">
            <div>{{ $ts('审核记录') }}</div>
            <table class="step-table anti-table">
              <thead>
                <tr>
                  <td class="step-table-user">{{ $ts('审批人') }}</td>
                  <td class="step-table-status">{{ $ts('状态') }}</td>
                  <td class="step-table-date">{{ $ts('审批时间') }}</td>
                  <td>{{ $ts('审批意见') }}</td>
                </tr>
              </thead>
              <tbody>
                <tr v-show="logs.length" v-for="(data, aindex) in logs" :key="aindex">
                  <td>
                    {{ data.auditor }}
                  </td>
                  <td>
                    {{ data.auditStatus ? getAuditStatus(data.auditStatus) : '' }}
                  </td>
                  <td class="step-table-date">
                    {{ data.createDate || '' }}
                  </td>
                  <td>
                    {{ data.remark }}
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <div v-show="activeName == 'log'">
        <vol-table
          :tableData="tableData"
          :columns="columns"
          :max-height="400"
          :pagination-hide="true"
          :load-key="false"
          :text-inline="false"
          :ck="false"
        ></vol-table>
      </div>
    </div>
  </vol-box>

  <vol-image-viewer ref="viewer"></vol-image-viewer>
</template>
<script>
import VolImageViewer from '@/components/basic/VolImageViewer.vue'
import { defineComponent, ref, reactive, getCurrentInstance, computed } from 'vue'
export default defineComponent({
  components: {
    'vol-image-viewer': VolImageViewer,
  },
  emits: ['auditClick', 'signAfter', 'parentCall', 'flowLoadAfter'],
  props: {
    option: {
      //生成vue文件的table参数
      type: Object,
      default: {
        key: '',
        cnName: '',
        name: '',
        url: ''
      }
    }
  },
  setup(props, { emit }) {
    const height = ref(500)
    const width = ref(920)
    const model = ref(false)
    const workFlowSteps = reactive([])

    const antiNodeValue = ref(null)
    const hasFlow = ref(false)
    const formData = ref({})

    const formDetail = ref({ name: '', data: [] })

    const auditParam = reactive({
      //审核对象
      rows: 0, //当前选中审核的行数
      model: false, //审核弹出框
      value: -1, //审核结果
      reason: '', //审核原因
      //审核选项(main.js里面可以添加其他选项)
      data: []
    })
    const { proxy } = getCurrentInstance()
    auditParam.data = proxy.$global.audit.data
    const tableData = reactive([])
    const columns = reactive([
      { title: '节点', field: 'stepName', width: 100 },
      { title: '审批人', field: 'auditor', width: 70 },
      { title: '审批结果', field: 'auditStatus', width: 70, bind: { data: [] } },
      { title: '审批时间', field: 'auditDate', width: 140 },
      { title: '审批意见', field: 'remark', width: 150 }
    ])

    const hasEditForm = ref(false)
    const isCurrentUser = ref(false)
    const activeName = ref('audit')

    const auditDic = reactive([])
    const getAuditStatus = (key) => {
      return (
        auditDic.find((x) => {
          return x.key === key + ''
        }) || { value: key }
      ).value
    }
    const rowLen = ref(0)
    const logs = ref([])
    let currentRows = []

    let _option
    let tableKey
    let currentTable
    const getAuditInfo = (option, view) => {
      _option = option
      const table = option.table //props.option.url.replaceAll('/', '');
      currentTable = table
      //console.log('currentTable',currentTable)
      const url = `api/Sys_WorkFlow/getSteps?tableName=${table}&isAnti=${isAnti.value}`
      //  let ids = currentRows.map(x => { return x[props.option.key] });
      let ids = currentRows.map((x) => {
        return x[option.key]
      })
      // ['498043c1-fbd0-4a35-a870-523823912a9b']
      proxy.http.post(url, ids, true).then((result) => {
        if (!result.status) {
          proxy.$message.error(result.message)
          return
        }
        if (!auditDic.length && result.auditDic) {
          auditDic.push(...(result.auditDic || []))
          columns.forEach((item) => {
            if (item.field == 'auditStatus') {
              item.bind.data = auditDic
            }
          })
        }
        hasFlow.value = !!(result.list || []).length

        if (!hasFlow.value) {
          let auditStatus = Object.keys(currentRows[0]).find((x) => {
            return x.toLowerCase() === 'auditstatus'
          })

          let checkStatus = currentRows.every((x) => {
            return proxy.$global.audit.status.some((c) => {
              return c === x[auditStatus] || !x[auditStatus]
            })
          })
          if (!isView.value && !checkStatus && !isAnti.value) {
            proxy.$message.error('只能选择待审批或审核中的数据')
            return
          }
          formDetail.value = { name: '', data: [] }
          formData.value = {}
          rowLen.value = currentRows.length
          model.value = true
          width.value = isAnti ? 550 : 450
          height.value = 350
          // isCurrentUser.value = true;
          logs.value = result.logs || []
          //没有审批流程的数据只显示
          return
        }
        model.value = true
        height.value = document.body.clientHeight * 0.95
        width.value = 920
      //  tableKey = result.form.key
        isCurrentUser.value = result.list.some((x) => {
          return x.isCurrentUser
        })
        workFlowSteps.length = 0
        workFlowSteps.push(...result.list)
        tableData.length = 0
        tableData.push(...result.logs||result.log||[])
    


        formData.value = result.form.data||result.form

        emit('flowLoadAfter', result.form, result)

        formDetail.value = result.form.detail || { name: '', data: [] }
        try {
          hasEditForm.value = Object.keys(result.form).some((k) => {
            return result.form[k].isEdit
          })
        } catch (error) {
          console.log(error)
        }
        // formData.push(...(result.form.data || []));
      })
    }
    //

    const auditClick = () => {
      if (!isAnti.value && auditParam.value == -1) {
        proxy.$message.error('请选择审批项')
        return
      }
      if (hasFlow.value && isAnti.value && !antiNodeValue.value) {
        proxy.$message.error('请选择退回节点')
        return
      }

      if (!isFlow.value && !isAnti.value) {
        emit('auditClick', auditParam, currentRows, (result) => {
          if (result.status) {
            model.value = false
            tableData.length = 0
          }
        })
        return
      }
      //我的流程中点击审批
      //保存审核
      let keys = currentRows.map((x) => {
        return x[currentOption.key]
      })
      const mh = isAnti.value ? 'antiAudit' : 'audit'

      let url
      let params
      //反审
      if (isAnti.value) {
        url = `api/${currentOption.table}/antiAudit`
        params = {
          key: hasFlow.value ? keys[0] : keys.join(','),
          isFlow: hasFlow.value,
          auditReason: auditParam.reason,
          stepId: antiNodeValue.value
        }
      } else {
        url = `api/${currentOption.table}/${mh}?auditReason=${auditParam.reason}&auditStatus=${
          auditParam.value < 0 ? 0 : auditParam.value
        }`
        params = keys
      }

      proxy.http.post(url, params, '审核中....').then((x) => {
        if (!x.status) {
          proxy.$message.error(x.message)
          return
        }
        model.value = false
        proxy.$parent.search ? proxy.$parent.search() : proxy.$parent.$parent.search()
        proxy.$message.success(x.message)
      })
    }
    const isFlow = ref(false)
    let currentOption = {}
    const isAnti = ref(false)
    //2023.11.10增加获取指定审批流程的表名
    //isAnti反审
    const isView = ref(false)
    const open = (rows, flow, table, anti, view) => {
      antiNodeValue.value = null
      isView.value = !!view
      isCurrentUser.value = false
      logs.value.length = 0
      isAnti.value = typeof anti == 'boolean' && anti
      isFlow.value = !!flow
      currentRows = rows
      activeName.value = 'audit'
      auditParam.reason = ''
      auditParam.value = -1

      if (flow) {
        currentOption = {
          table: table || rows[0].WorkTable,
          key: 'WorkTableKey' // rows[0].WorkTableKey
        }
      } else {
        currentOption = {
          table: table || props.option.url.replaceAll('/', ''),
          key: props.option.key
        }
      }
      getAuditInfo(currentOption)
    }

    const getFilePath = (pathSring) => {
      if (!pathSring) return []
      let filePath = pathSring.replace(/\\/g, '/').split(',')
      let fileInfo = []
      for (let index = 0; index < filePath.length; index++) {
        let path = filePath[index]
        if (path.indexOf('.') != -1) {
          let splitFile = path.split('/')
          if (splitFile.length > 0) {
            fileInfo.push({
              name: splitFile[splitFile.length - 1],
              path: proxy.base.isUrl(path) ? path : proxy.http.ipAddress + path
            })
          }
        }
      }
      return fileInfo
    }

    const access_token = ref('')
    const tk = (proxy.$store.getters.getUserInfo() || { accessToken: '' }).accessToken
    if (tk) {
      access_token.value = '?access_token=' + tk
    }
    const viewer = ref(null)

    const fileClick = (file) => {
      proxy.base.dowloadFile(
        file.path,
        file.name + access_token.value,
        {
          Authorization: proxy.$store.getters.getToken()
        },
        proxy.http.ipAddress
      )
    }

    const imgClick = (file, data, index) => {
      let fileInfo = getFilePath(data.value)
      const imgs = fileInfo.map((x) => {
        return x.path + proxy.access_token
      })
      viewer.value.show(imgs, index)
    }

    const editForm = ref(null)
    const showEditForm = () => {
      // let keys = currentRows.map((x) => {
      //   return x[currentOption.key];
      // });
      editForm.value.show(formData.value, currentRows[0][currentOption.key])
    }

    const saveEditForm = (formFields, callback) => {
      let keys = currentRows.map((x) => {
        return x[currentOption.key]
      })

      let url = `api/${currentOption.table}/update`
      formFields[tableKey] = keys[0]

      Object.keys(formFields).forEach((x) => {
        if (Array.isArray(formFields[x])) {
          formFields[x] = formFields[x]
            .map((c) => {
              return c.path || c
            })
            .join(',')
        }
      })
      proxy.http.post(url, { mainData: formFields, isFlow: true }, '审核中....').then((x) => {
        if (!x.status) {
          proxy.$message.error(x.message)
          return
        }
        proxy.$message.success(x.message)

        callback()
        getAuditInfo(_option)
      })
    }

    const antiNodes = computed(() => {
      return workFlowSteps
        .filter((c) => {
          return c.auditStatus
        })
        .map((c) => {
          return {
            key: c.stepId,
            value: c.stepName
          }
        })
    })

    const signRef = ref(null)
    const signClick = () => {
      signRef.value.open(workFlowSteps, currentRows[0])
    }

    //加签后
    const signAfter = () => {
      //emit("signAfter");
      proxy.$parent.search ? proxy.$parent.search() : proxy.$parent.$parent.search()
      model.value = false
    }
    const getTable = () => {
      return currentTable || props.option.url.replaceAll('/', '')
    }
    return {
      columns,
      height,
      width,
      model,
      workFlowSteps,
      getAuditInfo,
      getAuditStatus,
      activeName,
      reactive,
      tableData,
      auditParam,
      auditClick,
      open,
      isCurrentUser,
      hasFlow,
      rowLen,
      formData,
      formDetail,
      isFlow,
      isAnti,
      logs,
      getFilePath,
      viewer,
      fileClick,
      imgClick,
      access_token,
      editForm,
      showEditForm,
      saveEditForm,
      hasEditForm,
      isView,
      antiNodeValue,
      antiNodes,
      signClick,
      signRef,
      signAfter,
      getTable
    }
  }
})
</script>

<style lang="less" scoped>
.audit-model-content {
  padding: 10px;
}

.step-item {
  background: #fff;
  display: flex;
}

.left-item {
  min-width: 152px;
  text-align: right;
  padding-right: 25px;
  padding-top: 8px;

  .left-date {
    font-size: 13px;
    padding-top: 7px;
    color: #484747;
  }
}

.right-item {
  cursor: pointer;
  position: relative;
  border-bottom: 1px solid #f3f3f3;
  padding: 5px 0 5px 5px;
}

.left-item,
.right-item {
  padding-bottom: 10px;
}

.right-item:last-child {
  border-bottom: 0;
}

.step-line {
  top: 16px;
  left: -10px;
  width: 1px;
  height: 100%;
  position: absolute;
  background-color: #ebedf0;
}

.step-circle {
  position: absolute;
  top: 17px;
  left: -9px;
  z-index: 2;
  font-size: 12px;
  line-height: 1;
  transform: translate(-50%, -50%);
  width: 7px;
  height: 7px;
  background-color: #a1a1a1;
  border-radius: 50%;
}

.right-item::before {
  content: '';
}

.step-content {
  padding-top: 2px;
  font-size: 14px;
  color: #828282;
  line-height: 1.5;
}

.step-title {
  font-weight: bold;
  padding-top: 3px;
}

.step-text {
  font-size: 13px;
  color: #999999;
  padding-top: 6px;
}

.step-current {
  * {
    color: #2f95ff !important;
  }

  .step-circle {
    background: #2f95ff !important;
  }

  // border-radius: 5px;
  // border: 1px solid #d6eaff;
  font-size: 13px;
  padding-top: 6px;
  // background-color: #eff7ffd9;
  color: black;
}

.audit-content {
  // background: #f9f9f9;
  padding: 0 10px 10px 10px;
  border-radius: 4px;
  display: flex;

  .fx-left {
    flex: 1;
    width: 0;

    .rd {
      display: flex;
      align-items: baseline;
    }
  }

  .fx-right {
    // width: 400px;

    .btn {
      margin-top: 10px;
      text-align: center;
    }
  }
}

.cell-item {
  font-weight: 500;
}

.desc-top {
  padding: 5px 10px 0 10px;
}

.step-item-ad {
  * {
    color: #9f9898 !important;
  }
}

.step-table {
  border-collapse: collapse;
  border-spacing: 0;

  tr:first-child {
    background: #f5f7fa;
  }

  tr:last-child {
    border-bottom: none;
  }

  td {
    padding: 5px 8px;
    color: #444242;
    font-size: 12px;
    border-style: solid;
    border-width: 1px;
    border-color: #ebeef5;
  }

  .step-table-user {
    width: 80px;
  }

  .step-table-status {
    width: 80px;
  }

  .step-table-date {
    width: 130px;
  }
}

.step-table-text {
  font-size: 13px;
  padding-top: 6px;
  color: #585858 !important;
}

.step-item-gray {
  color: #9f9f9f;

  div,
  .left-date {
    color: #b0b0b0;
  }
}

.audit-detail-table {
  padding: 5px 10px 0 10px;

  table {
    width: 100%;
  }

  .audit-detail-title {
    font-weight: bold;
    margin-top: 7px;
    padding-bottom: 5px;
  }

  table td {
    padding: 10px 8px;
    font-size: 14px;
  }
}

.anti-table {
  width: 100%;
  margin-top: 10px;
  td {
    padding: 9px 7px;
    font-size: 14px;
  }

  .step-table-date {
    width: 150px;
  }

  .step-table-user {
    width: 100px;
  }
}
thead td {
  color: #000 !important;
  font-weight: bold;
  font-size: 13px !important;
}
.form-img img,
.form-file a {
  color: #0101ee;
  cursor: pointer;
  margin-right: 10px;
}

.form-img img:last-child,
.form-file a:last-child {
  margin-right: 0px;
}

.form-img img {
  width: 45px;
  height: 45px;
  border-radius: 4px;
  object-fit: cover;
}

.form-editor {
  word-wrap: break-word;
  word-break: break-all;
}

.btns {
  position: absolute;
  top: 0;
  right: 89px;

  button {
    font-size: 13px !important;
  }
}

.item-require {
  color: #b70404;
}
</style>
