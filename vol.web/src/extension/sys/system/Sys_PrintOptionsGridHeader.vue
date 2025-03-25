<template>
  <vol-box :full="false" :lazy="true" v-model="model" :title="row.CustomName" :width="width" :padding="0"
    >
    <div :style="{ height: height + 'px' }">
      <VolPrint ref="print" :is-box="true"></VolPrint>
    </div>
    <template #footer>
      <div class="btns">
        <el-button plain="" type="primary" size="small" @click="model = false">{{ $ts('关闭') }}</el-button>
        <el-button type="primary" size="small" @click="saveClick">{{ $ts('保存') }}</el-button>
      </div>
    </template>
  </vol-box>
</template>
<script setup>
import { onMounted, ref, getCurrentInstance, reactive,  nextTick } from "vue";
import VolBox from '@/components/basic/VolBox.vue';
import VolPrint from '@/components/VolPrint/VolPrint.vue'

const model = ref(false);
const row = ref({})
const print = ref(null);
const open = (_row) => {
  model.value = true;
  row.value = _row;
  nextTick(async () => {
    await print.value.initPanel(_row,_row.TableName);
    print.value.buildDesigner(_row.Options)
  })
}
const { proxy } = getCurrentInstance();
const saveClick = () => {
  const ops = print.value.exportJson();
  row.value.Options = JSON.stringify(ops);
  proxy.http.post("api/Sys_PrintOptions/update", { mainData: row.value }).then(result => {
       if (result.status) {
        proxy.$message.success(result.message)
          return;
       }

       proxy.$message.error(result.message)
  })
  //model.value = false;
}
//onMounted
const height = ref(document.body.clientHeight - 150)// 150)
const width = ref(document.body.clientWidth * 0.95);
if (width.value > 1500) {
  width.value = 1500;
}
defineExpose({
  open
})

</script>
<script>
// import VolBox from '@/components/basic/VolBox.vue';
// import VolPrint from  '@/components/VolPrint/VolPrint.vue'
// //这里使用的vue2语法，也可以写成vue3语法
// export default {
//   components: { 'vol-box': VolBox },
//   methods: {},
//   data() {
//     return {
//       model: false
//     };
//   },
//   methods: {
//     open() {
//       this.model = true;
//     }
//   }
// };
</script>
<style lang="less" scoped>
.btns {
  text-align: center;
}
</style>
  
  
  