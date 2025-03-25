<template>
  <div class="notification" @click="showMsg">
    <el-badge :is-dot="msgCount > 0" :max="99" :show-zero="false" class="item" :offset="[3, -3]">
      <el-icon size="15">
        <Bell />
      </el-icon>
    </el-badge>
  </div>
  <vol-box v-model="model" :width="400" :padding="5">
    <div style="height:445px">

      <el-tabs v-model="activeName" class="msg-tabs" @tab-click="handleClick">
        <el-tab-pane name="msg">
          <template #label>
            <span class="custom-tabs-label">
              <el-badge :value="msgCount" :show-zero="false" :offset="[-2, 4]"
                badge-style="background-color: #ff1b0b;width: 18px; ">
                消息通知<el-icon size="15"> </el-icon>
              </el-badge>
            </span>
          </template>
          <el-scrollbar :height="400">
            <div class="msg-item" v-for="(item, index) in msg" :key="index">
              <div class="title">
                {{ item.title }}
              </div>
              <div class="desc">{{ item.desc }}</div>
              <div class="bottom">
                <div class="tag">
                  <el-tag :type="item.tag" size="small">{{ item.type }}</el-tag>
                </div>
                <div class="tag">生产部</div>
                <div class="date">{{ item.date }}</div>
              </div>
            </div>
          </el-scrollbar>
        </el-tab-pane>
        <el-tab-pane label="系统消息" name="sys"> <vol-empty></vol-empty></el-tab-pane>
        <el-tab-pane label="已读消息" name="read"> <vol-empty></vol-empty></el-tab-pane>
      </el-tabs>
    </div>

  </vol-box>
  <!-- <el-dropdown trigger="hover">
    <div class="notification">
      <el-badge
       :is-dot="msgCount>0"
        :max="99"
        :show-zero="false"
        class="item"
        :offset="[3, -3]"
      >
        <el-icon size="15">
          <Bell />
        </el-icon>
      </el-badge>
    </div>
    <template #dropdown>
      <el-tabs v-model="activeName" class="msg-tabs" @tab-click="handleClick">
        <el-tab-pane name="msg">
          <template #label>
            <span class="custom-tabs-label">
              <el-badge
                :value="msgCount"
                :show-zero="false"
                :offset="[-2, 4]"
                badge-style="background-color: #ff1b0b;width: 18px; "
              >
                消息通知<el-icon size="15"> </el-icon>
              </el-badge>
            </span>
          </template>
          <el-scrollbar :max-height="400">
            <div class="msg-item" v-for="(item, index) in msg" :key="index">
              <div class="title">
                {{ item.title }}
              </div>
              <div class="desc">{{ item.desc }}</div>
              <div class="bottom">
                <div class="tag">
                  <el-tag :type="item.tag" size="small">{{ item.type }}</el-tag>
                </div>
                <div class="tag">生产部</div>
                <div class="date">{{ item.date }}</div>
              </div>
            </div>
          </el-scrollbar>
        </el-tab-pane>
        <el-tab-pane label="系统消息" name="sys"> <vol-empty></vol-empty></el-tab-pane>
        <el-tab-pane label="已读消息" name="read"> <vol-empty></vol-empty></el-tab-pane>
      </el-tabs>
    </template>
  </el-dropdown> -->
</template>

<script setup>
import VolEmpty from "@/components/basic/VolEmpty.vue";
import { reactive, ref, getCurrentInstance } from "vue";
const props = defineProps({
  list: {
    type: Array,
    default: () => {
      return [];
    },
  },
});
const model = ref(false)
const activeName = ref("msg");
const handleClick = (e) => { };
const msgCount = ref(3);

const msg = reactive([
  {
    title: "生产部发起材料申请新工单",
    desc: "消息描述消息描述消息描述消息描述消息描述消息描述消息描述",
    date: "2025-03-01 23:10",
    type: "任务工单",
    tag: "primary",
  },
  {
    title: "生产部发起材料申请新工单",
    desc: "消息描述消息描述消息描述消息描述消息描述消息描述消息描述",
    date: "2025-03-01 23:10",
    type: "审批流程",
    tag: "success",
  },
  {
    title: "生产部发起材料申请新工单",
    desc: "消息描述消息描述消息描述消息描述消息描述消息描述消息描述",
    date: "2025-03-01 23:10",
    type: "审批流程",
    tag: "success",
  },
]);

const showMsg = () => {
  model.value = true;
}
</script>
<style scoped lang="less">
.notification {
  outline: none;
  color: #000;
}

// .msg-tabs {
//   width: 260px;
// }
.msg-item {
  border-bottom: 1px solid #eee;
  padding: 10px;

  .title {
    font-weight: bolder;
    font-size: 13px;
    color: #000;
  }

  .desc {
    margin-top: 5px;
    line-height: 1.3;
    font-size: 12px;
    color: #676565;
  }

  .bottom {
    display: flex;
    margin-top: 5px;
    font-size: 12px;
    color: #676565;
  }

  .tag {
    flex: 1;
  }
}

.msg-item:hover {
  cursor: pointer;
  background: #f9f9f9;
}

::v-deep(.el-tabs__header) {
  margin: 0;
}

::v-deep(.el-tabs__content) {
  min-height: 200px;
}

::v-deep(.el-tabs__nav) {
  width: 100%;
  padding: 0 10px;
}

::v-deep(.el-tabs__item) {
  padding: 0 6px;
  flex: 1;
}
</style>
