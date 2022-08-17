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
      <flow-panel ref="flow"></flow-panel>
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
            id: '1659276275052',
            name: '流程C-节点A',
            type: 'task',
            left: '230px',
            top: '15px',
            ico: 'el-icon-user-solid'
          },
          {
            id: '1659276282115',
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
            from: '1659276275052',
            to: '1659276282115'
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
      let nodeList = this.$refs.flow.data.nodeList;
      mainData.NodeConfig = JSON.stringify(nodeList);
      let lineList = this.$refs.flow.data.lineList;
      mainData.LineConfig = JSON.stringify(lineList);

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
      let ids = nodeList.map((x) => {
        return x.id;
      });

      let rootId = root[0].id;

      detailData.push(
        nodeList.find((x) => {
          return x.id == rootId;
        })
      );

      //查找当前节点的下一个节点(后面增加会签等分支的时候,find改为filter批量查找)
      for (let index = 0; index < detailData.length; index++) {
        let id = detailData[index].id;
        let item = lineList.find((x) => {
          return x.from == id;
        });
        if (item) {
          //查找下一个节点
          item = nodeList.find((x) => {
            return x.id == item.to;
          });
          detailData.push(item);
        }
      }

      detailData = detailData.map((x, index) => {
        return {
          StepId: x.id,
          StepName: x.name,
          StepType: x.nodeType,
          StepValue:
            x.nodeType == 1 ? x.userId : x.nodeType == 2 ? x.roleId : x.deptId,
          OrderId: index + 1
        };
      });

      for (let index = 0; index < detailData.length; index++) {
        const step = detailData[index];
        if (!step.StepName) {
          return this.$message.error(`请输入第【${index + 1}】个节点的名称`);
        }
        // if (!step.StepType) {
        //    return this.$message.error(`请输入第【${index + 1}】个节点的名称`);
        // }
        //区分用户、角色，这里待完
        //节点删除后保存有问题，待处理
        if (!step.StepType) {
          step.StepType = '1';
        }
        if (step.StepType == '1' && !step.StepValue) {
          return this.$message.error(
            `请选择第【${index + 1}】个节点的审批用户`
          );
        }
      }

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
