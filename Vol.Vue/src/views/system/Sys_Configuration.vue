<template>
  <div class="context">
    <div>
      <Tabs>
        <TabPane
          class="pane"
          v-for="item in configList"
          :key="item.code"
          :label="item.name"
          icon="ios-apps"
        >
          <div v-if="item.code == 'SystemInfo'">
            <SystemInfo :configId="item.id"></SystemInfo>
          </div>
          <div v-else-if="item.code == 'TableExport'">
            <TableExport :configId="item.id"></TableExport>
          </div>
          <div v-else>
            <Divider>页面暂未实现</Divider>
          </div>
        </TabPane>
        <!-- <TableExport :configId="2"></TableExport> -->
      </Tabs>
    </div>
  </div>
</template>
<script>
import VolForm from "@/components/basic/VolForm.vue";
import VolBox from "@/components/basic/VolBox.vue";
import Icons from "@/components/basic/Icons.vue";
import SystemInfo from "@/extension/system/Sys_Configuration/SystemInfo.vue";
import TableExport from "@/extension/system/Sys_Configuration/TableExport.vue";
let $vue;
export default {
  components: {
    VolForm: VolForm,
    VolBox: VolBox,
    Icons: Icons,
    SystemInfo,
    TableExport,
    VolMenu: () => import("@/../src/components/basic/VolMenu"),
  },
  created() {
    this.http
      .post("/api/Sys_Configuration/getConfigList", {}, true)
      .then((x) => {
        if (!x.status) {
          this.$Message.error(x.message);
          return;
        }
        this.configList = x.data;
      });
  },
  methods: {},

  data() {
    return {
      configList: [],
      model: false,
    };
  },
};
</script>