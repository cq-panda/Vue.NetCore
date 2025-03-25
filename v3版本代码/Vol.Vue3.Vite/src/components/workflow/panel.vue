<!-- 审核流程插件基于https://gitee.com/xiaoka2017/easy-flow修改-->
<!--感谢萌级小菜鸟 / easy-flow -->
<template>
    <div v-if="easyFlowVisible" class="flow-panel">

        <div style="display: flex;height: 100%;position: relative;">
            <el-scrollbar style="height: 100%;border-right: 1px solid rgb(220, 227, 232);">
                <div style="width: 220px;">
                    <div class="ef-node-pmenu-item"><i class="el-icon-warning-outline"></i>基础信息</div>
                    <VolForm ref="form" style="padding: 10px;" :label-width="180" :loadKey="true" :formFields="formFields"
                        :disabled="disabled" :formRules="formRules"></VolForm>
                    <node-menu @addNode="addNode" ref="nodeMenu" v-if="!disabled"></node-menu>
                </div>
            </el-scrollbar>
            <div class="tools">
                <el-button circle @click="zoomAdd"><i class="el-icon-zoom-in"></i></el-button>
                <el-button circle @click="zoomSub"><i class="el-icon-zoom-out"></i></el-button>
            </div>
            <div style="flex: 1;" id="efContainer" ref="efContainer" class="container efContainer" v-flowDrag>
                <template :key="node.id" v-for="node in data.nodeList">
                    <flow-node :id="node.id" @delNode="deleteNode(node.id)" :node="node" :activeElement="activeElement"
                        :disabled="disabled" @changeNodeSite="changeNodeSite" @nodeRightMenu="nodeRightMenu"
                        @clickNode="clickNode">
                    </flow-node>
                </template>
                <!-- 给画布一个默认的宽度和高度 -->
                <div style="position:absolute;top: 3000px;left: 4000px;">&nbsp;</div>
            </div>
            <!-- 右侧表单 -->
            <div style="width: 400px;border-left: 1px solid #dce3e8;background-color: #FBFBFB">
                <el-scrollbar style="height: 100%;padding-bottom: 10px;">
                    <flow-node-form @delNode="deleteNode" ref="nodeForm" @setLineLabel="setLineLabel" :disabled="disabled"
                        @repaintEverything="repaintEverything"></flow-node-form>
                </el-scrollbar>
            </div>
        </div>
    </div>
</template>

<script>
import { VueDraggableNext as draggable } from "vue-draggable-next";
// import { jsPlumb } from 'jsplumb'
// 使用修改后的jsplumb
import './jsplumb'
import { easyFlowMixin } from './mixins'
import flowNode from './node'
import nodeMenu from './node_menu'
import FlowNodeForm from './node_form'
import lodash from 'lodash'
// import { getDataA } from './data_A'
import VolForm from '@/components/basic/VolForm.vue';
export default {
    props: {
        disabled: {
            typeof: Boolean,
            default: false
        }
    },
    data() {
        return {
            formFields: {
                WorkName: '',
                WorkTable: '',
                WorkTableName: '',
                Weight: 1,
                AuditingEdit: 0,
                Remark: ''
            },
            formRules: [
                [
                    {
                        dataKey: '流程名称',
                        title: '流程名称',
                        field: 'WorkName',
                        required: true
                    }],
                [{
                    dataKey: '',
                    title: '流程实例',
                    required: true,
                    field: 'WorkTable',
                    data: [],
                    readonly: false,
                    type: 'select',
                    onChange: (value, item) => {
                        this.formRules.forEach((options) => {
                            options.forEach((option) => {
                                if (option.field == 'WorkTable') {
                                    this.formFields.WorkTableName = option.data.find((x) => {
                                        return x.key == value;
                                    }).value;
                                }
                            });
                        });
                    }
                }],
                [{
                    title: '权重(相同条件权重大优先)',
                    field: 'Weight',
                    type: "number",
                }
                ],
                
                [{
                    title: '审核中数据是否可以编辑',
                    field: 'AuditingEdit',
                    type: "switch",
                    data: [{ key: 0, value: "否" }, { key: 1, value: "是" }]
                }
                ],
                [{
                    title: '备注',
                    field: 'Remark'
                }
                ]
            ],
            // jsPlumb 实例
            jsPlumb: null,
            // 控制画布销毁
            easyFlowVisible: true,
            // 是否加载完毕标志位
            loadEasyFlowFinish: false,
            // 数据
            data: {},
            // 激活的元素、可能是节点、可能是连线
            activeElement: {
                // 可选值 node 、line
                type: undefined,
                // 节点ID
                nodeId: undefined,
                // 连线ID
                sourceId: undefined,
                targetId: undefined
            },
            zoom: 1
        }
    },
    // 一些基础配置移动该文件中
    mixins: [easyFlowMixin],
    components: {
        draggable, flowNode, nodeMenu, FlowNodeForm, VolForm
    },
    directives: {
        'flowDrag': {
            mounted(el, binding, vnode, oldNode) {
                if (!binding) {
                    return
                }
                el.onmousedown = (e) => {
                    if (e.button == 2) {
                        // 右键不管
                        return
                    }
                    //  鼠标按下，计算当前原始距离可视区的高度
                    let disX = e.clientX
                    let disY = e.clientY
                    el.style.cursor = 'move'

                    document.onmousemove = function (e) {
                        // 移动时禁止默认事件
                        e.preventDefault()
                        const left = e.clientX - disX
                        disX = e.clientX
                        el.scrollLeft += -left

                        const top = e.clientY - disY
                        disY = e.clientY
                        el.scrollTop += -top
                    }

                    document.onmouseup = function (e) {
                        el.style.cursor = 'auto'
                        document.onmousemove = null
                        document.onmouseup = null
                    }
                }
            }
        }
    },
    mounted() {
        this.jsPlumb = jsPlumb.getInstance()
        // this.$nextTick(() => {
        //     // 默认加载流程A的数据、在这里可以根据具体的业务返回符合流程数据格式的数据即可
        //     this.dataReload(getDataA())
        // })
    },
    created() {
        this.http.get('api/Sys_WorkFlow/getTableInfo').then((result) => {
            this.formRules.forEach((options) => {
                options.forEach((option) => {
                    if (option.field == 'WorkTable') {
                        option.data = result;
                    }
                });
            });
        });
        this.$store.getters.data().flowTable = this.formFields;
    },
    methods: {
        // 返回唯一标识
        getUUID() {
            return Math.random().toString(36).substr(3, 10)
        },
        jsPlumbInit() {
            this.jsPlumb.ready(() => {
                // 导入默认配置
                this.jsPlumb.importDefaults(this.jsplumbSetting)
                // 会使整个jsPlumb立即重绘。
                this.jsPlumb.setSuspendDrawing(false, true);
                // 初始化节点
                this.loadEasyFlow()
                // 单点击了连接线, https://www.cnblogs.com/ysx215/p/7615677.html
                this.jsPlumb.bind('click', (conn, originalEvent) => {
                    this.activeElement.type = 'line'
                    this.activeElement.sourceId = conn.sourceId
                    this.activeElement.targetId = conn.targetId
                    this.$refs.nodeForm.lineInit({
                        from: conn.sourceId,
                        to: conn.targetId,
                        label: conn.getLabel()
                    })
                    this.deleteElement();
                })
                // 连线
                this.jsPlumb.bind("connection", (evt) => {
                    let from = evt.source.id
                    let to = evt.target.id
                    if (this.loadEasyFlowFinish) {
                        this.data.lineList.push({ from: from, to: to })
                    }
                })

                // 删除连线回调
                this.jsPlumb.bind("connectionDetached", (evt) => {
                    this.deleteLine(evt.sourceId, evt.targetId)
                })

                // 改变线的连接节点
                this.jsPlumb.bind("connectionMoved", (evt) => {
                    this.changeLine(evt.originalSourceId, evt.originalTargetId)
                })

                // 连线右击
                this.jsPlumb.bind("contextmenu", (evt) => {
                    console.log('contextmenu', evt)
                })

                // 连线
                this.jsPlumb.bind("beforeDrop", (evt) => {
                    let from = evt.sourceId
                    let to = evt.targetId
                    if (from === to) {
                        this.$message.error('节点不支持连接自己')
                        return false
                    }
                    if (this.hasLine(from, to)) {
                        this.$message.error('该关系已存在,不允许重复创建')
                        return false
                    }
                    if (this.hashOppositeLine(from, to)) {
                        this.$message.error('不支持两个节点之间连线回环');
                        return false
                    }
                    this.$message.success('连接成功')
                    setTimeout(() => { this.setLineLabel(from, to, 'x') }, 50)
                    return true
                })

                // beforeDetach
                this.jsPlumb.bind("beforeDetach", (evt) => {
                    console.log('beforeDetach', evt)
                })
                this.jsPlumb.setContainer(this.$refs.efContainer)
            })
        },
        // 加载流程图
        loadEasyFlow() {
            // 初始化节点
            for (var i = 0; i < this.data.nodeList.length; i++) {
                let node = this.data.nodeList[i]
                if (node.userId && node.userId != '') {
                    // userId为数值类型
                    if (typeof node.userId == 'number'){
                        node.userId = [node.userId]
                    } else {
                        node.userId = node.userId.split(',').map(Number);
                    }
                } else {
                    node.userId = []
                }
                // 设置源点，可以拖出线连接其他节点
                this.jsPlumb.makeSource(node.id, lodash.merge(this.jsplumbSourceOptions, {}))
                // // 设置目标点，其他源点拖出的线可以连接该节点
                this.jsPlumb.makeTarget(node.id, this.jsplumbTargetOptions)
                if (!node.viewOnly && !this.disabled) {
                    this.jsPlumb.draggable(node.id, {
                        containment: 'parent',
                        stop: function (el) {
                            // 拖拽节点结束后的对调
                            console.log('拖拽结束: ', el)
                        }
                    })
                }
            }
            // 初始化连线
            for (var i = 0; i < this.data.lineList.length; i++) {
                let line = this.data.lineList[i]
                var connParam = {
                    source: line.from,
                    target: line.to,
                    label: this.disabled ? null : (line.label ? line.label : 'x'),
                    connector: line.connector ? line.connector : '',
                    anchors: line.anchors ? line.anchors : undefined,

                    paintStyle: line.paintStyle ? line.paintStyle : undefined,
                }
                this.jsPlumb.connect(connParam, this.jsplumbConnectOptions)
            }
            this.$nextTick(function () {
                this.loadEasyFlowFinish = true
            })
        },
        // 设置连线条件
        setLineLabel(from, to, label) {
            var conn = this.jsPlumb.getConnections({
                source: from,
                target: to
            })[0]
            if (!label || label === '') {
                conn.removeClass('flowLabel ')
                conn.addClass('emptyFlowLabel')
            } else {
                conn.addClass('flowLabel')
            }
            conn.setLabel({
                label: 'x' //label,
            })
            this.data.lineList.forEach(function (line) {
                if (line.from == from && line.to == to) {
                    line.label = 'x'// label
                }
            })

        },
        // 删除激活的元素
        deleteElement() {
            if (this.disabled)
                return
            if (this.activeElement.type === 'node') {
                this.deleteNode(this.activeElement.nodeId)
            } else if (this.activeElement.type === 'line') {
                this.$confirm('确定删除所点击的线吗?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    var conn = this.jsPlumb.getConnections({
                        source: this.activeElement.sourceId,
                        target: this.activeElement.targetId
                    })[0]
                    this.jsPlumb.deleteConnection(conn)
                }).catch(() => {
                })
            }
        },
        // 删除线
        deleteLine(from, to) {
            this.data.lineList = this.data.lineList.filter(function (line) {
                if (line.from == from && line.to == to) {
                    return false
                }
                return true
            })
        },
        // 改变连线
        changeLine(oldFrom, oldTo) {
            this.deleteLine(oldFrom, oldTo)
        },
        // 改变节点的位置
        changeNodeSite(data) {
            for (var i = 0; i < this.data.nodeList.length; i++) {
                let node = this.data.nodeList[i]
                if (node.id === data.nodeId) {
                    node.left = data.left
                    node.top = data.top
                }
            }
        },
        /**
         * 拖拽结束后添加新的节点
         * @param evt
         * @param nodeMenu 被添加的节点对象
         * @param mousePosition 鼠标拖拽结束的坐标
         */
        addNode(evt, nodeMenu, mousePosition) {
            if (nodeMenu.type == 'start' && this.data.nodeList.some(x => { return x.type == 'start' })) {
                this.$message.error('【流程结束】节点已存在,只有选择一个流程开始节点');
                return
            }
            if (nodeMenu.type == 'end' && this.data.nodeList.some(x => { return x.type == 'end' })) {
                this.$message.error('【流程结束】节点已存在,只有选择一个流程开始节点');
                return
            }
            var screenX = evt.originalEvent.clientX, screenY = evt.originalEvent.clientY
            let efContainer = this.$refs.efContainer
            var containerRect = efContainer.getBoundingClientRect()
            var left = screenX, top = screenY
            // 计算是否拖入到容器中
            if (left < containerRect.x || left > containerRect.width + containerRect.x || top < containerRect.y || containerRect.y > containerRect.y + containerRect.height) {
                this.$message.error("请把节点拖入到画布中")
                return
            }
            left = left - containerRect.x + efContainer.scrollLeft
            top = top - containerRect.y + efContainer.scrollTop
            // 居中
            left -= 85
            top -= 16
            var nodeId = this.getUUID()
            // 动态生成名字
            var origName = nodeMenu.name
            var nodeName = origName
            var index = 1
            while (index < 10000) {
                var repeat = false
                for (var i = 0; i < this.data.nodeList.length; i++) {
                    let node = this.data.nodeList[i]
                    if (node.name === nodeName) {
                        nodeName = origName + index
                        repeat = true
                    }
                }
                if (repeat) {
                    index++
                    continue
                }
                break
            }
            var node = {
                id: nodeId,
                name: nodeName,
                type: nodeMenu.type,
                left: left + 'px',
                top: top + 'px',
                ico: nodeMenu.ico,
                state: 'success'
            }
            /**
             * 这里可以进行业务判断、是否能够添加该节点
             */
            this.data.nodeList.push(node)
            this.$nextTick(function () {
                this.jsPlumb.makeSource(nodeId, this.jsplumbSourceOptions)
                this.jsPlumb.makeTarget(nodeId, this.jsplumbTargetOptions)
                this.jsPlumb.draggable(nodeId, {
                    containment: 'parent',
                    stop: function (el) {
                        // 拖拽节点结束后的对调
                        console.log('拖拽结束: ', el)
                    }
                })
            })
        },
        /**
         * 删除节点
         * @param nodeId 被删除节点的ID
         */
        deleteNode(nodeId) {
            this.$confirm('确定要删除节点' + nodeId + '?', '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning',
                closeOnClickModal: false
            }).then(() => {
                /**
                 * 这里需要进行业务判断，是否可以删除
                 */
                this.data.nodeList = this.data.nodeList.filter(function (node) {
                    if (node.id === nodeId) {
                        // 伪删除，将节点隐藏，否则会导致位置错位
                        // node.show = false
                        return false
                    }
                    return true
                })
                this.$nextTick(function () {
                    this.jsPlumb.removeAllEndpoints(nodeId);
                })
            }).catch(() => {
            })
            return true
        },
        clickNode(nodeId) {
            this.activeElement.type = 'node'
            this.activeElement.nodeId = nodeId
            this.$refs.nodeForm.nodeInit(this.data, nodeId, this.formFields.WorkTable)
        },
        // 是否具有该线
        hasLine(from, to) {
            for (var i = 0; i < this.data.lineList.length; i++) {
                var line = this.data.lineList[i]
                if (line.from === from && line.to === to) {
                    return true
                }
            }
            return false
        },
        // 是否含有相反的线
        hashOppositeLine(from, to) {
            return this.hasLine(to, from)
        },
        nodeRightMenu(nodeId, evt) {
            this.menu.show = true
            this.menu.curNodeId = nodeId
            this.menu.left = evt.x + 'px'
            this.menu.top = evt.y + 'px'
        },
        repaintEverything(node) {
            let _node = this.data.nodeList.find((x) => {
                return x.id == node.id;
            });
            Object.assign(_node, node);
            console.log(_node);
            this.jsPlumb.repaint();
        },
        // 加载流程图
        dataReload(data, isAdd) {
            this.easyFlowVisible = false
            this.data.nodeList = []
            this.data.lineList = []
            this.$nextTick(() => {
                data = lodash.cloneDeep(data)
                this.easyFlowVisible = true
                this.data = data
                this.$nextTick(() => {
                    this.jsPlumb = jsPlumb.getInstance()
                    this.$nextTick(() => {
                        this.jsPlumbInit()
                    })
                })
            })
            this.formRules.forEach(options => {
                options.forEach(option => {
                    if (option.field == "WorkTable") {
                        option.readonly = !isAdd;
                    }
                })
            })
        },
        zoomAdd() {
            if (this.zoom >= 1) {
                return
            }
            this.zoom = this.zoom + 0.1
            this.$refs.efContainer.style.zoom = this.zoom;
            // this.jsPlumb.setZoom(this.zoom)
        },
        zoomSub() {
            if (this.zoom <= 0) {
                return
            }
            this.zoom = this.zoom - 0.1;
            if (this.zoom < 0.3) {
                this.zoom = 0.3;
            }
            this.$refs.efContainer.style.zoom = this.zoom;
            // this.jsPlumb.setZoom(this.zoom)
        }
    }
}
</script>
<style scoped lang="less">
@import './index.css';

.flow-panel {
    position: absolute;
    height: 100%;
    width: 100%;
}

.flow-panel ::v-deep(.el-form-item__label) {
    margin-bottom: -2px !important;
    text-align: left;
    padding: 0 !important;
    justify-content: flex-start;
}

.flow-panel ::v-deep(.el-form-item) {
    display: flex;
    flex-direction: column;
    margin-bottom: 7px !important;

}

.ef-node-menu-form {
    padding: 0px;
}

::-webkit-scrollbar {
    width: 0px;
    height: 0px;
}

::-webkit-scrollbar-thumb {
    border-radius: 0px;
    background: #e0e3e7;
    height: 20px;
}

::-webkit-scrollbar-track {
    background-color: transparent;
}
</style>