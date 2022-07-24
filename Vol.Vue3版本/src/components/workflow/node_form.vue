<template>
  <div>
    <div class="ef-node-form">
      <div class="ef-node-form-header">
        流程信息
      </div>
      <div style="padding-top:20px;">
        <VolForm
          v-show="type !== 'line'"
          style="padding-right:20px;"
          ref="myform"
          :label-width="100"
          :loadKey="false"
          :formFields="node"
          :formRules="formRules"
        >
          <div style="text-align:center;padding-left:25px;display:flex;">
            <el-button size="small" icon="el-icon-delete" type="danger" @click="delNode"
              >删除节点</el-button
            >
            <el-button size="small" icon="el-icon-check" type="primary" @click="save"
              >修改节点</el-button
            >
          </div>
        </VolForm>

        <div class="ef-node-form-body">
          <el-form
            :model="node"
            ref="dataForm"
            label-width="80px"
            v-show="type === 'node'"
          >
            <!-- <el-form-item label="类型">
            <el-input v-model="node.type" :disabled="true"></el-input>
          </el-form-item> -->
            <!-- <el-form-item label="流程名称">
            <el-input v-model="node.name"></el-input>
          </el-form-item>
          <el-form-item label="坐标x">
            <el-input v-model="node.left" :disabled="true"></el-input>
          </el-form-item>
          <el-form-item label="坐标y">
            <el-input v-model="node.top" :disabled="true"></el-input>
          </el-form-item>
          <el-form-item label="ico图标">
            <el-input v-model="node.ico"></el-input>
          </el-form-item> -->
            <!-- <el-form-item label="状态">
            <el-select v-model="node.state" placeholder="请选择">
              <el-option
                v-for="item in stateList"
                :key="item.state"
                :label="item.label"
                :value="item.state"
              >
              </el-option>
            </el-select>
          </el-form-item> -->
            <!-- <el-form-item>
            <el-button icon="el-icon-close" type="danger" @click="delNode"
              >删除</el-button
            >

          </el-form-item> -->
          </el-form>

          <div
            v-show="type === 'line'"
            style="text-align:center;padding-left:25px;"
          >
            <el-button
            size="small"
              style=" width: 100%;"
              icon="el-icon-delete"
              type="danger"
              @click="deleteElement"
              >删除连接线</el-button
            >
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { cloneDeep } from 'lodash';
import VolForm from '@/components/basic/VolForm.vue';

export default {
  components: {
    VolForm
  },
  created() {
    this.http.get('api/Sys_WorkFlow/getNodeDic').then((result) => {
      this.formRules.forEach((options) => {
        options.forEach((option) => {
          if (option.field == 'userId') {
            option.data = result.users || [];
          } else if (option.field == 'roleId') {
            option.data = result.roles || [];
          }
        });
      });
    });
  },
  data() {
    return {
      node: { name: '', nodeType: '1', userId: null, roleId: null },
      formRules: [
        [
          {
            title: '节点名称',
            field: 'name',
            required: true
          }
        ],
        // [
        //   {
        //     dataKey: '',
        //     title: '审批类型',
        //     required: true,
        //     field: 'nodeType',
        //     data: [
        //       { key: '1', value: '按用户审批' },
        //       { key: '2', value: '按角色审批' }
        //     ],
        //     type: 'select'
        //   }
        // ],
        [
          {
            dataKey: '',
            hidden: false,
            title: '审批用户',
            required: true,
            field: 'userId',
            data: [],
            type: 'select'
          }
        ]
        // [
        //   {
        //     dataKey: '',
        //     hidden: false,
        //     title: '角色信息',
        //     required: true,
        //     field: 'roleId',
        //     data: [],
        //     type: 'select'
        //   }
        // ]
      ],

      visible: true,
      // node 或 line
      type: 'node',
      node: {},
      line: {},
      data: {},
      stateList: [
        {
          state: 'success',
          label: '成功'
        },
        {
          state: 'warning',
          label: '警告'
        },
        {
          state: 'error',
          label: '错误'
        },
        {
          state: 'running',
          label: '运行中'
        }
      ]
    };
  },
  methods: {
    /**
     * 表单修改，这里可以根据传入的ID进行业务信息获取
     * @param data
     * @param id
     */
    nodeInit(data, id) {
      this.type = 'node';
      this.data = data;
      data.nodeList.filter((node) => {
        if (node.id === id) {
          let _node = cloneDeep(node);
          // for (const key in this.node) {
          //   this.node[key] = _node[key];
          // }
          // this.node = cloneDeep(node);
          Object.assign(this.node, _node);
        }
      });
    },
    lineInit(line) {
      this.type = 'line';
      this.line = line;
    },
    // 修改连线
    saveLine() {
      this.$emit('setLineLabel', this.line.from, this.line.to, this.line.label);
    },
    save() {
      this.data.nodeList.filter((node) => {
        if (node.id === this.node.id) {
          node.name = this.node.name;
          node.left = this.node.left;
          node.top = this.node.top;
          node.ico = this.node.ico;
          node.state = this.node.state;
          this.$emit('repaintEverything', this.node);
        }
      });
    },
    deleteElement() {
      this.$emit('deleteElement');
    },
    delNode() {
      this.$emit('delNode', this.node.id);
    }
  }
};
</script>

<style>
.el-node-form-tag {
  position: absolute;
  top: 50%;
  margin-left: -15px;
  height: 40px;
  width: 15px;
  background-color: #fbfbfb;
  border: 1px solid rgb(220, 227, 232);
  border-right: none;
  z-index: 0;
}
</style>
