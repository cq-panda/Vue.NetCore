<template>
  <vol-box
    :lazy="false"
    v-model="model"
    :title="isAdd ? '新建流程' : '编辑流程'"
    :height="height"
    :width="1200"
    :padding="0"
  >
    <div>
      <flow-panel
        ref="flow"
        :lineList="lineList"
        :nodeList="nodeList"
      ></flow-panel>
    </div>
    <template #footer>
      <div style="text-align: center;">
        <el-button type="default" size="mini" @click="model = false"
          >取消</el-button
        >
        <el-button type="primary" size="mini" @click="save">保存</el-button>
      </div></template
    >
  </vol-box>
</template>
<script>
import FlowPanel from '@/components/workflow/workflow';
import VolBox from '@/components/basic/VolBox.vue';
//这里使用的vue2语法，也可以写成vue3语法
export default {
  components: { 'vol-box': VolBox, FlowPanel },
  methods: {},
  data() {
    return {
      nodeList: [],
      lineList: [],
      model: false,
      height: 500,
      row: null,
      isAdd: false
    };
  },
  methods: {
    open(row) {
      this.row = row;
      this.model = true;
      this.isAdd = Object.keys(this.row).length == 0;

      if (row.NodeConfig) {
        this.nodeList = JSON.parse(row.NodeConfig);
      } else {
        this.nodeList = [
          {
            id: 'nodeA',
            name: '流程C-节点A',
            type: 'task',
            left: '230px',
            top: '15px',
            ico: 'el-icon-user-solid'
          },
          {
            id: 'nodeB',
            name: '流程C-节点B',
            type: 'task',
            left: '225px',
            top: '165px',
            ico: 'el-icon-goods'
          }
        ];
      }
      if (row.LineConfig) {
        this.lineList = JSON.parse(row.LineConfig);
      } else {
        this.lineList = [
          {
            from: 'nodeA',
            to: 'nodeB'
            //  connector: 'Straight',
            //   paintStyle: {strokeWidth: 1, stroke: '#827f7f'}
          }
        ];
      }

      this.$nextTick(() => {
        this.$refs.flow.dataReload({
          lineList: this.lineList,
          nodeList: this.nodeList
        });
        Object.assign(this.$refs.flow.formFields, row);
        this.$refs.flow.$refs.form.reset(
          Object.keys(row).length
            ? row
            : { WorkName: '', WorkTable: '', WorkTableName: '', Remark: '' }
        );
      });
    },
    save() {
      let mainData = JSON.parse(JSON.stringify(this.$refs.flow.formFields));
      mainData.NodeConfig = JSON.stringify(this.$refs.flow.data.nodeList);
      mainData.LineConfig = JSON.stringify(this.$refs.flow.data.lineList);

      let nodes = JSON.parse(mainData.NodeConfig);
      let lines = JSON.parse(mainData.LineConfig);
      if (!nodes.length) {
        return this.$message.error('请添加流程节点');
      }
      //获取根节点
      let root = nodes.filter((x) => {
        return !lines.some((s) => {
          return s.to == x.id;
        });
      });
      if (root.length > 1) {
        return this.$message.error('只能设置一个流程根节点');
      }
      let detailData = [];
      //   if (root.length) {
      //     root = root[0];
      //     detailData.push({
      //       WorkStepFlow_Id: root.WorkStepFlow_Id,
      //       WorkFlow_Id: root.WorkFlow_Id,
      //       Step: 1,
      //       NodeType:root.NodeType,
      //       UserId:root.UserId,
      //       RoleId:root.RoleId,
      //       Remark:root.Remark
      //     });
      //   }

      let params = {
        mainData: mainData,
        detailData: detailData,
        delKeys: []
      };
      let url = 'api/Sys_WorkFlow/' + (!this.isAdd ? 'update' : 'add');
      this.http.post(url, params, true).then((result) => {
        if (!result.status) {
          return this.$message.error(result.message);
        }
        this.$message.success('保存成功');
        this.model = false;
        this.$emit('parentCall', ($parent) => {
          $parent.search();
        });
      });
    }
  },
  created() {
    this.height = document.body.clientHeight * 0.85;
  }
};
</script>
