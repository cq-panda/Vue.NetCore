<template>
  <vol-box
    :lazy="true"
    v-model="model"
    title="执行日志"
    :height="500"
    :width="1200"
    :padding="0"
  >
    <QuartzLog ref="log"></QuartzLog>
    <template #footer>
      <div>
        <el-button type="default" size="mini" @click="model = false"
          >关闭</el-button
        >
      </div></template
    >
  </vol-box>
  <el-alert style="margin-bottom:10px;" :show-icon="false" type="success">
    定时任务只有发布后才会运行(本地不会执行),<a
      style="color:#2d8cf0;margin-left:20px;"
      target="blank"
      href="http://v2.volcore.xyz/document/netCoreDev"
      >查看配置文档</a
    >
    <a
      style="color:#2d8cf0;margin-left:20px;"
      target="blank"
      href="http://v2.volcore.xyz/document/log"
      >查看更新方式</a
    >
  </el-alert>
</template>
<script>
import VolBox from '@/components/basic/VolBox.vue';
import QuartzLog from '@/views/system/quartz/Sys_QuartzLog';
//这里使用的vue2语法，也可以写成vue3语法
export default {
  components: { 'vol-box': VolBox, QuartzLog },
  methods: {},
  data() {
    return {
      model: false
    };
  },
  methods: {
    open() {
      this.model = true;
      this.$nextTick(() => {
        this.$refs.log.$refs.grid.search();
      });
    }
  }
};
</script>
