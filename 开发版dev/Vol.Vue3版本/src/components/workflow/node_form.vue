<template>
    <div>
        <div class="ef-node-form">
            <div class="ef-node-pmenu-item">
                <div style="flex:1;">
                    <span class="name"><i class="el-icon-news"></i>节点属性</span>
                    <!-- <span @click="nameClick(1)" :class="{ active: index === 1 }" class="name">审批条件</span> -->
                </div>
                <!-- <div><el-button link size="small" type="primary" @click="save"><i class="el-icon-check"></i>
                        保存配置</el-button></div> -->
            </div>
            <div class="ef-node-form-body">
                <div class="form-info">
                    <VolForm ref="form" :select2Count="2000" style="padding:0 10px;" :label-width="130" :loadKey="false" :formFields="node"
                        :formRules="formRules" :disabled="disabled">
                    </VolForm>
                </div>
                <div>
                    <node-filter :filters="node.filters" :disabled="disabled" :tableName="tableName" ref="filter">
                    </node-filter>
                </div>
            </div>
            <!--            <div class="el-node-form-tag"></div>-->
        </div>
    </div>
</template>

<script>
// import { cloneDeep } from 'lodash'
import VolForm from '@/components/basic/VolForm.vue';
import nodeFilter from './node_filter.vue';
export default {
    components: {
        VolForm,
        'node-filter': nodeFilter
    },
    props: {
        disabled:{
            typeof:Boolean,
            default:false
        }
        // node: {
        //     type: Object,
        //     default: () => {
        //         return {
        //             name: '',
        //             auditType: 1,//审核类型
        //             userId: null,
        //             roleId: null,
        //             deptId: null,
        //             auditRefuse: null,//审核未通过
        //             auditBack: null, //驳回
        //             auditMethod: 0,//审批方式(会签)
        //             stepValue: null,
        //             sendMail: 0,
        //             filters: [] //字段过滤条件
        //         }
        //     }
        // }
    },
    created() {
        this.http.get('api/Sys_WorkFlow/getNodeDic').then((result) => {
            this.formRules.forEach((options) => {
                options.forEach((option) => {
                    if (option.dataKey && !option.data.length) {
                        option.data = result[option.dataKey] || [];
                    }
                });
            });
        });
    },
    data() {
        return {
            tableName: "",
            index: 1,
            visible: true,
            // node 或 line
            type: 'node',
            node: {},
            line: {},
            data: {},

            node: {
                name: '',
                auditType: 1,//审核类型
                userId: null,
                roleId: null,
                deptId: null,
                auditRefuse: null,//审核未通过
                auditBack: null, //驳回
                auditMethod: 0,//审批方式(会签)
                //  nodeValue: null,
                sendMail: 0,
                filters: []
            },
            formRules: [
                [
                    {
                        title: '节点名称',
                        field: 'name',
                        required: true,
                        colSize: 12
                    }],
                [
                    {
                        dataKey: '',
                        title: '审批类型',
                        required: true,
                        hidden: false,
                        field: 'auditType',
                        data: [
                            { key: 1, value: '按用户审批' },
                            { key: 2, value: '按角色审批' },
                            { key: 3, value: '按部门审批' }
                        ],
                        type: 'select',
                        onChange: this.nodeTypeChange,
                        colSize: 12
                    }
                ],
                [
                    {
                        dataKey: 'users',
                        hidden: false,
                        title: '审批用户',
                        required: true,
                        field: 'userId',
                        data: [],
                        type: 'selectList',
                        colSize: 12
                    }
                    ,
                    {
                        dataKey: 'roles',
                        hidden: true,
                        title: '角色信息',
                        required: true,
                        field: 'roleId',

                        data: [],
                        type: 'select',
                        colSize: 12
                    }
                    ,
                    {
                        dataKey: 'dept',
                        hidden: true,
                        title: '部门信息',
                        required: true,
                        field: 'deptId',
                        data: [],
                        type: 'select',
                        colSize: 12
                    }
                ], [
                    {
                        dataKey: '',
                        title: '审批未通过',
                        required: false,
                        field: 'auditRefuse',
                        hidden: false,
                        data: [
                            { key: 1, value: '返回上一节点' },
                            { key: 2, value: '流程重新开始' },
                            { key: 0, value: '流程结束' },
                        ],
                        type: 'select',
                        colSize: 6
                    }
                    ,
                    {
                        dataKey: '',
                        title: '审批驳回',
                        required: false,
                        hidden: false,
                        field: 'auditBack',
                        data: [
                            { key: 1, value: '返回上一节点' },
                            { key: 2, value: '流程重新开始' },
                            { key: 0, value: '流程结束' },
                        ],
                        type: 'select',
                        colSize: 6

                    }
                ],
                [
                    {
                        dataKey: '',
                        title: '审核后发送邮件通知',
                        required: false,
                        hidden: false,
                        field: 'sendMail',
                        data: [
                            { key: 1, value: '是' },
                            { key: 0, value: '否' },
                        ],
                        type: 'switch'
                    },
                    {
                        dataKey: '',
                        title: '启用会签',
                        required: false,
                        hidden: false,
                        field: 'auditMethod',//审批方式
                        data: [
                            { key: 1, value: '是' },
                            { key: 0, value: '否' }
                        ],
                        type: 'switch'
                    }
                ],
            ],
        }
    },
    methods: {
        nameClick(index) {
            this.index = index;
        },
        /**
         * 表单修改，这里可以根据传入的ID进行业务信息获取
         * @param data
         * @param id
         */
        nodeInit(data, id, tableName) {
            this.tableName = tableName;
            this.type = 'node'
            this.data = data;
            // this.tableName=data.
            data.nodeList.filter((node) => {
                if (node.id === id) {
                    this.formRules.forEach(options => {
                        options.forEach(c => {
                            if (c.field != 'name') {
                                c.hidden = node.type == 'start' || node.type == 'end';
                            }
                        })
                    })
                    if (!node.filters) {
                        node.filters = [];
                    }
                    this.node = node;// cloneDeep(node)
                    if (node.type != 'start' && node.type != 'end') {
                        this.nodeTypeChange(node.auditType);
                    }
                }
            })
            // data.nodeList.filter((node) => {
            //     if (node.id === id) {
            //         let _node = cloneDeep(node);
            //         _node.roleId = _node.roleId || null;
            //         _node.userId = _node.userId || null;
            //         _node.nodeType = (_node.nodeType || 1) * 1;
            //         if (!node.filters) {
            //             node.filters = [];
            //         }
            //         _node.filters = node.filters;
            //         this.nodeTypeChange(_node.nodeType);
            //         Object.assign(this.node, _node);
            //     }
            // });
        },
        nodeTypeChange(value) {
            // { key: 1, value: '按用户审批' },
            //   { key: 2, value: '按角色审批' },
            //   { key: 3, value: '按部门审批' }
            this.formRules.forEach((options) => {
                options.forEach((option) => {
                    if (option.field == 'userId') {
                        option.hidden = value != 1;
                    } else if (option.field == 'roleId') {
                        option.hidden = value != 2;
                    } else if (option.field == 'deptId') {
                        option.hidden = value != 3;
                    }
                });
            });
        },
        lineInit(line) {
            this.type = 'line'
            this.line = line
        },
        // 修改连线
        saveLine() {
            this.$emit('setLineLabel', this.line.from, this.line.to, this.line.label)
        },
        save() {
            this.data.nodeList.filter((node) => {
                if (node.id === this.node.id) {
                    node.name = this.node.name;
                    node.left = this.node.left;
                    node.top = this.node.top;
                    node.ico = this.node.ico;
                    node.state = this.node.state;
                    node.stepValue = this.node.stepValue;
                    this.$emit('repaintEverything', this.node);
                }

            });
            this.$message.success('保存成功')
        }
    }
}
</script>

<style lang="less" scoped>
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

.btns {
    text-align: center;
    padding: 10px;

    buttton {
        flex: 1;
    }
}

.ef-node-pmenu-item {
    display: flex;

    .name {
        cursor: pointer;
        margin-right: 15px;
    }

    .active {
        color: #0659e8;
    }
}

.form-info ::v-deep(.vol-form-item) {
    display: flex;

    .el-form-item:nth-child(2),
    .el-form-item:nth-child(3),
    .el-form-item:nth-child(4) {
        margin-left: 12px;
    }
}
</style>
