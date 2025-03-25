<template>
  <vol-box :footer="false" v-model="model" :height="height" :width="width" :padding="0" :lazy="true" title="审核">

    <div class="audit-model-content" :style="{ height: height - 100 + 'px' }">
      <el-descriptions class="desc-top" :column="3" size="default" :border="true">
        <el-descriptions-item v-for="(item, index) in formData" :key="index">
          <template #label>
            <div class="cell-item">
              {{ item.name }}
            </div>
          </template>
          {{ item.value }}
        </el-descriptions-item>
      </el-descriptions>
      <el-radio-group v-show="hasFlow" style="padding-left: 15px;" v-model="activeName" class="ml-4">
        <el-radio label="audit" size="large">审核</el-radio>
        <el-radio label="log" size="large">审核记录</el-radio>
      </el-radio-group>
      <div v-show="activeName == 'audit' || !hasFlow" class="audit-content">
        <div class="fx-left" v-if="hasFlow">
          <div class="v-steps">
            <div v-for="(item, index) in workFlowSteps" :key="index">
              <div class="step-item" :class="{'step-item-ad':item.auditId||item.stepAttrType=='start'}" v-if="item.stepAttrType == 'start'">
                <div class="left-item">
                  <div>流程开始</div>
                  <div class="left-date">{{ item.createDate }}</div>
                </div>
                <div class="right-item">
                  <div class="step-line"></div>
                  <i class="step-circle"></i>
                  <div class="step-title">
                    {{ item.stepName }}
                  </div>
                  <div class="step-text">发起人：{{ item.creator }}</div>
                </div>
              </div>
              <div class="step-item" v-else-if="item.stepAttrType == 'end'">
                <div class="left-item">
                  <div>流程结束</div>
                </div>
                <div class="right-item">
                  <div class="step-line"></div>
                  <i class="step-circle"></i>
                  <div class="step-title">
                    {{ item.stepName }}
                  </div>
                </div>
              </div>
              <div v-else :class="{ 'step-current': item.isCurrent }" class="step-item">
                <div class="left-item">
                  <div>审批时间</div>
                  <div class="left-date">{{ item.auditDate || '待审批' }}</div>
                </div>
                <div class="right-item">
                  <div class="step-line"></div>
                  <i class="step-circle"></i>
                  <div class="step-title">
                    {{ item.stepName }}
                  </div>
                  <div class="step-text">审批人：{{ item.auditor }}</div>
                  <div class="step-text">
                    状 态： {{ getAuditStatus(item.auditStatus) }}
                  </div>
                  <div class="step-text">备 注： {{ item.remark || '-' }}</div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="fx-right" :style="{ width: !hasFlow ? '100%' : '400px' }" v-if="isCurrentUser || !hasFlow">

          <div v-if="!hasFlow">
            <el-alert :title="'当前选中【' + rowLen + '】条记录待审核..'" type="success" :closable="false" />
          </div>
          <div class="rd">
            <span>审批：</span>
            <el-radio-group style="margin-left:15px" v-model="auditParam.value">
              <el-radio v-for="item in auditParam.data" :key="item.value" :label="item.value">
                <span>{{ item.text }}</span>
              </el-radio>
            </el-radio-group>
          </div>
          <el-input style="padding-top: 10px;" v-model="auditParam.reason" type="textarea"
            :autosize="{ minRows: 4, maxRows: 10 }" placeholder="请输入备注..."></el-input>
          <div class="btn">
            <el-button type="primary" @click="auditClick" icon="Check">审批</el-button>
          </div>
        </div>
      </div>
      <div v-show="activeName == 'log'">
        <vol-table :tableData="tableData" :columns="columns" :height="height - 250" :pagination-hide="true"
          :load-key="false" :text-inline="false" :ck="false"></vol-table>
      </div>
    </div>
  </vol-box>
</template>
<script>
import VolTable from '@/components/basic/VolTable.vue';
import VolBox from '@/components/basic/VolBox.vue';
import http from '@/../src/api/http.js';
import { defineComponent, ref, reactive, getCurrentInstance } from 'vue';
export default defineComponent({
  components: {
    VolTable,
    VolBox
  },
  props: {
    option: { //生成vue文件的table参数
      type: Object,
      default: {
        key: '',
        cnName: '',
        name: '',
        url: ""
      }
    }
  },
  setup(props, { emit }) {
    const height = ref(500);
    const width = ref(820);
    const model = ref(false)
    const workFlowSteps = reactive([]);

    const hasFlow = ref(false)
    const formData = reactive([]);

    const auditParam = reactive({
      //审核对象
      rows: 0, //当前选中审核的行数
      model: false, //审核弹出框
      value: -1, //审核结果
      reason: '', //审核原因
      //审核选项(main.js里面可以添加其他选项)
      data: []
    })
    const { proxy } = getCurrentInstance();
    auditParam.data = proxy.$global.audit.data;
    const tableData = reactive([]);
    const columns = reactive([
      { title: '节点', field: 'stepName', width: 100 },
      { title: '审批人', field: 'auditor', width: 80 },
      { title: '审批结果', field: 'auditStatus', width: 70, bind: { data: [] } },
      { title: '审批时间', field: 'auditDate', width: 145 },
      { title: '备注', field: 'remark', width: 120 }
    ]);

    const isCurrentUser = ref(null);
    const activeName = ref('audit')

    const auditDic = reactive([]);
    const getAuditStatus = (key) => {
      return (auditDic.find(x => { return x.key === key + '' }) || { value: key }).value;
    }
    const rowLen = ref(0)
    let currentRows = []
    const getAuditInfo = (option) => {
      const table = option.table; //props.option.url.replaceAll('/', '');
      const url = `api/Sys_WorkFlow/getSteps?tableName=${table}`
      //  let ids = currentRows.map(x => { return x[props.option.key] });
      let ids = currentRows.map(x => { return x[option.key] });
      // ['498043c1-fbd0-4a35-a870-523823912a9b']
      http.post(url, ids, true).then(result => {
        if (!result.status) {
          proxy.$message.error(result.message);
          return;
        }

        hasFlow.value = !!(result.list || []).length;
        if (!hasFlow.value) {

          let auditStatus = Object.keys(currentRows[0]).find(x => { return x.toLowerCase() === 'auditstatus' });

          let checkStatus = currentRows.every((x) => {
            return proxy.$global.audit.status.some(c => { return c === x[auditStatus] || !x[auditStatus] })
          });
          if (!checkStatus) {
            proxy.$message.error('只能选择待审批或审核中的数据');
            return;
          }
          rowLen.value = currentRows.length;
          model.value = true;
          width.value = 430;
          height.value = 350;
          isCurrentUser.value = true;
          //没有审批流程的数据只显示
          return;
        }
        model.value = true;
        height.value = document.body.clientHeight * 0.95;
        width.value = 820;
        if (!auditDic.length) {
          auditDic.push(...(result.auditDic || []))
          columns.forEach(item => {
            if (item.field == 'auditStatus') {
              item.bind.data = auditDic;
            }
          })
        }
        isCurrentUser.value = result.list.some(x => { return x.isCurrentUser })
        workFlowSteps.length = 0;
        workFlowSteps.push(...result.list);
        tableData.length = 0;
        tableData.push(...result.log)
        formData.length = 0;
        formData.push(...(result.form || []))
      })
    }
    //

    const auditClick = () => {
      if (auditParam.value == -1) {
        proxy.$message.error('请选择审批项');
        return;
      }

      if (!isFlow.value) {
        emit("auditClick", auditParam, currentRows, (result) => {
          if (result.status) {
            model.value = false;
            tableData.length = 0;
          }
        });
        return;
      }
      //我的流程中点击审批
      //保存审核
      let keys = currentRows.map(x => { return x[currentOption.key] });
      let url = `api/${currentOption.table}/audit?auditReason=${auditParam.reason}&auditStatus=${auditParam.value}`
      http.post(url, keys, '审核中....').then((x) => {
        if (!x.status) {
          proxy.$message.error(x.message);
          return;
        }
        model.value = false;
        proxy.$parent.search()
        proxy.$message.success(x.message)
      });
    }
    const isFlow = ref(false);
    let currentOption = {};
    const open = (rows, flow) => {
      isFlow.value = !!flow;
      currentRows = rows;
      activeName.value = 'audit'
      auditParam.reason = '';
      auditParam.value = -1;

      if (flow) {
        currentOption = {
          table: rows[0].WorkTable,
          key: "WorkTableKey"// rows[0].WorkTableKey
        }
      } else {
        currentOption = {
          table: props.option.url.replaceAll('/', ''),
          key: props.option.key
        }
      }
      getAuditInfo(currentOption);

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
      isFlow
    }
  }
});
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
  min-width: 180px;
  text-align: right;
  padding-right: 25px;
  padding-top: 8px;

  .left-date {
    font-size: 13px;
    padding-top: 7px;
    color: #6c6c6c;
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
  padding: 10px;
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
.step-item-ad{
  *{
    color: #9f9898 !important;
  }
}
</style>
