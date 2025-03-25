<template>
  <div class="home-content" data-v-7f6868a7="">
    <el-scrollbar style="height: 100%;">
      <div style="margin:10px 0 -5px 12px;font-size: 14px;font-weight: bold;">
        <i class="el-icon-warning-outline"></i> 发起流程
        <a class="contact" target="_blank">
          发起流程功能正在开发中。目前已实现从表单数据中处理流程</a>
      </div>
      <div class="home-list">
        <div class="list-item" @click="itemClick(item,index)" v-for="(item, index) in list" :key="index">
          <div class="content">
            <div class="content-right">
              <div class="name">
                <i class="el-icon-warning-outline"></i>{{ item.name }}
              </div>
              <div class="data" data-v-7f2e9c68="">
                {{ item.desc }}
              </div>
            </div>
            <div class="mouse-enter-class"></div>
          </div>
          <div :class="[item.type == '审批' ? 'item-strengthen' : (item.type == '新增' ? 'item-new' : 'item-other')]">{{ item.type }}</div>
        </div>
      </div>
    </el-scrollbar>
  </div>
</template>
<script>
import {
  defineComponent,
  ref,
  reactive,
  toRefs,
  getCurrentInstance,
  onMounted,
  onUnmounted
} from 'vue';
import { useRouter, useRoute } from 'vue-router';
import http from '@/../src/api/http.js';
export default {
  components: {},
  setup(props) {
    const list = reactive([
      {
        name: '订单审批',
        desc: '这里是一些不可描述的信息...',
        type: "审批"
      },
      {
        name: '请假管理',
        desc: '这里是一些不可描述的信息...',
        type: "审批"
      },
      { name: '物资申请',  desc: '这里是一些不可描述的信息...', type: "审批" },
      { name: '采购申请',  desc: '这里是一些不可描述的信息...',type: "审批" },
      {
        name: '合同申请',
        desc: '这里是一些不可描述的信息...',
        type: "审批"
      },
      {
        name: '订单审批',
        desc: '这里是一些不可描述的信息...',
        type: "审批"
      },
      {
        name: '请假管理',
        desc: '这里是一些不可描述的信息...',
        type: "审批"
      },
      { name: '物资申请',  desc: '这里是一些不可描述的信息...', type: "审批" },
      { name: '采购申请',  desc: '这里是一些不可描述的信息...',type: "审批" },
      {
        name: '合同申请',
        desc: '这里是一些不可描述的信息...',
        type: "审批"
      },
      {
        name: '订单审批',
        desc: '这里是一些不可描述的信息...',
        type: "审批"
      },
      {
        name: '请假管理',
        desc: '这里是一些不可描述的信息...',
        type: "审批"
      },
      { name: '物资申请',  desc: '这里是一些不可描述的信息...', type: "审批" },
      { name: '采购申请',  desc: '这里是一些不可描述的信息...',type: "审批" },
      {
        name: '合同申请',
        desc: '这里是一些不可描述的信息...',
        type: "审批"
      },    {
        name: '订单审批',
        desc: '这里是一些不可描述的信息...',
        type: "审批"
      },
      {
        name: '请假管理',
        desc: '这里是一些不可描述的信息...',
        type: "审批"
      },
      { name: '物资申请',  desc: '这里是一些不可描述的信息...', type: "审批" },
      { name: '采购申请',  desc: '这里是一些不可描述的信息...',type: "审批" },
      {
        name: '合同申请',
        desc: '这里是一些不可描述的信息...',
        type: "审批"
      }
    ]);
    onMounted(() => {
   
    });
    const {proxy}=getCurrentInstance();
    const itemClick=(item)=>{
           proxy.$message.success('开发中..')
    }
    return {
      list,
      itemClick
    };
  }
};
</script>
<style lang="less" scoped>
// @import './home/index.less';

.home-content {
  position: absolute;
  height: 100%;
  width: 100%;
  background: #f3f7fb;

  .home-list {
    margin: 12px;
    display: grid;
    -moz-column-gap: 12px;
    column-gap: 12px;
    grid-template-columns: repeat(5, auto);
  }

  .list-item {
    position: relative;
    cursor: pointer;
    margin-bottom: 12px;
    transition: transform 0.8s;
    .content {
      position: relative;
      height: 110px;
      // padding-left: 40px;
      background: #ffffff;
      display: flex;
      align-items: center;
      transition: all 1.5s;
      border-radius: 5px;
      overflow: hidden;

      .content-right {
        color: #1d252f;
        padding: 0 20px;

        .el-icon-warning-outline {
          margin-right: 5px;
        }
      }

      .name {
        transition: transform .5s;
        color: #060606;
        font-size: 16px;
        font-weight: 400;
        padding-bottom: 5px;
      }

      .data {
        font-size: 12px;
        font-family: Source Han Sans CN, sans-serif;
        color: #6f6f6f;
      }
    }

    .mouse-enter-class {
      position: absolute;
      left: 0;
      bottom: 0;
      width: 0;
      height: 40px;
      border-bottom: 3px #0763ee solid;
      transition: 1s;
    }

 
  }
}

.list-item:hover {

  transform: scale(1.04);
  .content {
    background: #ecf5f9;

    .mouse-enter-class {
      width: 100%;
    }

  }
}


.home-list-content {
  margin: -12px 12px;
  background: #ffff;
  padding: 20px;
  display: flex;
  margin-bottom: 12px;
}

.contact {
  cursor: pointer;
  font-size: 12px;
  font-weight: 500;
  margin-left: 24px;
  color: #8e8888;

  img {
    height: 15px;
    margin-bottom: -3px;
    margin-right: 5px;
  }
}

.item-strengthen,
.item-new,
.item-other {
  position: absolute;
  top: 0;
  right: 0;
  font-size: 12px;
  padding: 2px 10px;
  background: #daf3ff;
  border-bottom-left-radius: 6px;
  color: #339aed;
  border-top-right-radius: 5px;
}

.item-new {
  background: #ffebe9;
  color: #f94638;
}

.item-other {
  background: #e1fae2;
  color: #2ad431;
}</style>
