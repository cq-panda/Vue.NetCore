<!--
 *Author：jxx
 *Date：{Date}
 *Contact：283591387@qq.com
 *业务请在@/extension/mes/mes/MES_Customer.jsx或MES_Customer.vue文件编写
 *新版本支持vue或【表.jsx]文件编写业务,文档见:https://v3.volcore.xyz/docs/view-grid、https://v3.volcore.xyz/docs/web
 -->
<template>
    <view-grid ref="grid" :columns="columns" :detail="detail" :details="details" :editFormFields="editFormFields"
        :editFormOptions="editFormOptions" :searchFormFields="searchFormFields" :searchFormOptions="searchFormOptions"
        :table="table" :editTabs="editTabs" :extend="extend" :onInit="onInit" :onInited="onInited"
        :searchBefore="searchBefore" :searchAfter="searchAfter" :addBefore="addBefore" :updateBefore="updateBefore"
        :rowClick="rowClick" :modelOpenBefore="modelOpenBefore" :modelOpenAfter="modelOpenAfter">
        <!-- 自定义组件数据槽扩展，更多数据槽slot见文档 -->
        <template #btnLeft>
            <div class="desc"> 客户基本信息维护 </div>
        </template>
        <template #gridHeader>
        </template>
    </view-grid>
</template>
<script setup lang="jsx">
import extend from "@/extension/mes/mes/MES_Customer.jsx";
import viewOptions from './MES_Customer/options.js'
import { ref, reactive, getCurrentInstance, watch, onMounted, h } from "vue";
const grid = ref(null);
const { proxy } = getCurrentInstance()
//http请求，proxy.http.post/get
let { table, editFormFields, editFormOptions, searchFormFields, searchFormOptions, columns, detail, details, editTabs } = reactive(viewOptions())

let gridRef;//对应[表.jsx]文件中this.使用方式一样
//生成对象属性初始化
const onInit = async ($vm) => {
    gridRef = $vm;
    gridRef.queryFields = ['CustomerName', 'ContactPerson']

    // 配置 editTabsConfig - 使用 JSX 语法
    table.editTabsConfig = {
        type: 'border-card', // 标签页类型: card, border-card, ''
        tabPosition: 'top', // 标签页位置: top, right, bottom, left
        stretch: false, // 标签是否拉伸填充容器
        beforeLeave: (activeName, oldActiveName) => {
            console.log(`准备从 ${oldActiveName} 切换到 ${activeName}`);
            return true;
        }
    };

    // 在原有 editTabs 基础上添加新的标签页案例 - 使用 JSX 语法
    // 注意：保留 options.js 中原有的标签页配置，只是新增案例标签页

    // 新增案例标签页：高级配置
    editTabs.push({
        name: "高级配置",
        key: "advanced",
        fields: {
            Priority: 1,
            IsActive: true,
            Tags: [],
            Description: "",
            Rating: 0,
            CreatedDate: ""
        },
        options: [
            [
                {
                    title: "优先级",
                    field: "Priority",
                    type: "number",
                    colSize: 8,
                    min: 1,
                    max: 10
                },
                {
                    title: "是否启用",
                    field: "IsActive",
                    type: "switch",
                    colSize: 8
                },
                {
                    title: "评分",
                    field: "Rating",
                    type: "rate",
                    colSize: 8,
                    max: 5,
                    allowHalf: true
                }
            ],
            [
                {
                    title: "标签",
                    field: "Tags",
                    type: "selectList",
                    colSize: 12,
                    data: [
                        { key: "vip", value: "VIP客户" },
                        { key: "new", value: "新客户" },
                        { key: "important", value: "重要客户" },
                        { key: "regular", value: "普通客户" }
                    ]
                },
                {
                    title: "创建日期",
                    field: "CreatedDate",
                    type: "date",
                    colSize: 12
                }
            ],
            [
                {
                    title: "详细描述",
                    field: "Description",
                    type: "textarea",
                    colSize: 24,
                    rows: 4,
                    placeholder: "请输入客户的详细描述信息..."
                }
            ]
        ],
        // JSX 语法渲染 - 带动画效果的标签页头部
        render: (h, { tab, name }) => (
            <div style={{ display: 'flex', alignItems: 'center', animation: 'pulse 2s infinite' }}>
                <span style={{ color: '#722ED1', fontWeight: 'bold', marginRight: '8px' }}>
                    <i class="el-icon-setting" style={{ marginRight: '4px' }}></i>
                    {name}
                </span>
                <el-tag size="mini" type="success">新功能</el-tag>
            </div>
        ),
        disabled: false,
        lazy: true
    });

    // 新增案例标签页：文件管理
    editTabs.push({
        name: "文件管理",
        key: "files",
        fields: {
            Avatar: "",
            Documents: [],
            Attachments: ""
        },
        options: [
            [
                {
                    title: "客户头像",
                    field: "Avatar",
                    type: "img",
                    colSize: 12,
                    accept: "image/*",
                    listType: "picture-card"
                },
                {
                    title: "相关文档",
                    field: "Documents",
                    type: "file",
                    colSize: 12,
                    multiple: true,
                    accept: ".pdf,.doc,.docx,.xls,.xlsx"
                }
            ],
            [
                {
                    title: "附件说明",
                    field: "Attachments",
                    type: "textarea",
                    colSize: 24,
                    rows: 3,
                    placeholder: "请说明附件用途和注意事项..."
                }
            ]
        ],
        // JSX 语法渲染 - 带图标和进度条的复杂标签页头部
        render: (h, { tab, name }) => (
            <div style={{ display: 'flex', alignItems: 'center', position: 'relative' }}>
                <span style={{ color: '#13C2C2', fontWeight: 'bold' }}>
                    <i class="el-icon-folder-opened" style={{ marginRight: '5px' }}></i>
                    {name}
                </span>
                <div style={{
                    position: 'absolute',
                    bottom: '-2px',
                    left: '0',
                    width: '100%',
                    height: '2px',
                    background: 'linear-gradient(90deg, #13C2C2, #52C41A)',
                    borderRadius: '1px'
                }}></div>
            </div>
        )
    });

    // 设置表单字段监听
    gridRef.watchFormField = (field, callback) => {
        watch(() => editFormFields[field], callback);
    };

    // 监听客户类型变化
    gridRef.watchFormField('CustomerType', (newValue, oldValue) => {
        console.log('客户类型变化：', { newValue, oldValue });
        if (newValue === '3') { // 政府客户
            editFormFields.BusinessScope = '政府采购业务';
        }
    });

    // 监听信用评级变化
    gridRef.watchFormField('CreditRating', (newValue, oldValue) => {
        console.log('信用评级变化：', { newValue, oldValue });
    });

    // 监听新增字段变化 - 高级配置相关
    gridRef.watchFormField('Priority', (newValue, oldValue) => {
        console.log('优先级变化：', { newValue, oldValue });
        // 根据优先级自动设置标签
        if (newValue >= 8) {
            editFormFields.Tags = ['vip', 'important'];
        } else if (newValue >= 5) {
            editFormFields.Tags = ['important'];
        }
    });

    // 监听是否启用状态变化
    gridRef.watchFormField('IsActive', (newValue, oldValue) => {
        console.log('启用状态变化：', { newValue, oldValue });
        if (!newValue) {
            // 如果禁用，清空一些相关字段
            editFormFields.Priority = 1;
            editFormFields.Rating = 0;
        }
    });

    // 监听标签变化
    gridRef.watchFormField('Tags', (newValue, oldValue) => {
        console.log('标签变化：', { newValue, oldValue });
        // 根据标签自动调整优先级
        if (newValue && newValue.includes('vip')) {
            editFormFields.Priority = Math.max(editFormFields.Priority, 8);
        }
    });

    // ===== EditTabs 标签页事件处理示例 =====

    // 标签页点击事件 - 直接设置在 gridRef 上
    gridRef.editTabClick = (tab, event) => {
        console.log('标签页被点击：', {
            tabName: tab.name,
            tabKey: tab.key,
            disabled: tab.disabled
        });

        // 可以根据不同标签页执行不同逻辑
        if (tab.key === 'advanced') {
            console.log('点击了高级配置标签页');
        } else if (tab.key === 'files') {
            console.log('点击了文件管理标签页');
        }
    };

    // 标签页切换前事件 - 可以阻止切换
    gridRef.editTabBeforeLeave = (activeName, oldActiveName) => {
        console.log('标签页切换前检查：', { from: oldActiveName, to: activeName });

        // 示例：如果当前在高级配置页面，且创建日期为空，阻止切换
        if (oldActiveName === 'advanced' && !editFormFields.CreatedDate) {
            console.warn('创建日期未填写，阻止切换标签页');
            return false; // 阻止切换
        }

        // 示例：如果要切换到文件管理页面，检查客户名称是否已填写
        if (activeName === 'files' && !editFormFields.CustomerName) {
            console.warn('客户名称未填写，阻止切换到文件管理页面');
            return false; // 阻止切换
        }

        return true; // 允许切换
    };

    // 演示如何使用标签页相关的方法
    setTimeout(() => {
        // 获取当前活动的标签页
        console.log('当前活动标签页：', gridRef.getCurrentActiveTab());
        console.log('当前活动标签页 key：', gridRef.getActiveTabKey());

        // 演示如何动态禁用/启用标签页（禁用属性直接在 editTab 配置上）
        // gridRef.setTabDisabled('files', true);  // 禁用文件管理标签页
        // gridRef.setActiveTab('advanced'); // 切换到高级配置标签页
    }, 1000);

    // 自定义标签页切换事件（保持向后兼容）
    gridRef.handleTabClick = (tab) => {
        console.log('标签页切换（兼容模式）：', tab);
        switch (tab.name) {
            case 'tab1':
            case 'tab2':
            case 'tab3':
                console.log('切换到原有标签页：', tab.name);
                break;
            case 'advanced':
                console.log('切换到高级配置页');
                // 可以在这里设置高级配置的默认值
                if (!editFormFields.CreatedDate) {
                    editFormFields.CreatedDate = new Date().toISOString().split('T')[0];
                }
                break;
            case 'files':
                console.log('切换到文件管理页');
                // 可以在这里初始化文件相关的配置
                break;
        }
    };

    //与jsx中的this.xx使用一样，只需将this.xx改为gridRef.xx
    //更多属性见：https://v3.volcore.xyz/docs/view-grid
}
//生成对象属性初始化后,操作明细表配置用到
const onInited = async () => {
    console.log('组件初始化完成，当前 editTabs 配置：', editTabs);
    console.log('editTabsConfig 配置：', table.editTabsConfig);
}
const searchBefore = async (param) => {
    //界面查询前,可以给param.wheres添加查询参数
    //返回false，则不会执行查询
    return true;
}
const searchAfter = async (rows, result) => {
    return true;
}
const addBefore = async (formData) => {
    //新建保存前formData为对象，包括明细表，可以给给表单设置值，自己输出看formData的值
    console.log('新建保存前的表单数据：', formData);
    return true;
}
const updateBefore = async (formData) => {
    //编辑保存前formData为对象，包括明细表、删除行的Id
    console.log('编辑保存前的表单数据：', formData);
    return true;
}
const rowClick = ({ row, column, event }) => {
    //查询界面点击行事件
    // grid.value.toggleRowSelection(row); //单击行时选中当前行;
}
const modelOpenBefore = async (row) => {//弹出框打开后方法
    return true;//返回false，不会打开弹出框
}
const modelOpenAfter = (row) => {
    //弹出框打开后方法,设置表单默认值,按钮操作等
    console.log('弹出框打开后，当前行数据：', row);

    // 如果是新增，可以设置默认值
    if (!row || !row.CustomerID) {
        // 为不同标签页设置默认值的示例
        if (gridRef && gridRef.getFormRef) {
            const formRef = gridRef.getFormRef();
            if (formRef) {
                // 设置基本信息默认值
                setTimeout(() => {
                    formRef.setFieldValue('CustomerType', '1'); // 默认企业客户
                    formRef.setFieldValue('CreditRating', 3); // 默认3星评级
                }, 100);
            }
        }
    }
}

//对外暴露数据
defineExpose({})
</script>
<style lang="less" scope>
.desc {
    font-size: 13px;
    color: #007cff;
    margin-left: 10px;
}

/* 自定义标签页样式 */
::v-deep(.edit-tabs-container) {
    .edit-tabs {
        .el-tabs__header {
            margin-bottom: 10px;
        }

        .el-tabs__item {
            font-weight: 500;

            &.is-active {
                color: #409EFF;
                font-weight: bold;
            }
        }

        .el-tabs__content {
            .el-tab-pane {
                padding: 10px;
                background: #fafafa;
                border-radius: 4px;
                margin-bottom: 10px;
            }
        }
    }
}

/* 表单字段样式优化 */
::v-deep(.vol-form-item) {
    margin-bottom: 15px;

    .el-form-item__label {
        font-weight: 500;
        color: #333;
    }

    .el-textarea__inner,
    .el-input__inner {
        border-radius: 4px;
    }
}

/* 评分组件样式 */
::v-deep(.el-rate) {
    .el-rate__text {
        margin-left: 10px;
        font-weight: 500;
        color: #666;
    }
}

/* 动画效果 */
@keyframes pulse {
    0% {
        opacity: 1;
    }

    50% {
        opacity: 0.7;
    }

    100% {
        opacity: 1;
    }
}

/* 新功能标签样式 */
::v-deep(.el-tag) {
    &.el-tag--mini {
        font-size: 10px;
        padding: 0 4px;
        height: 16px;
        line-height: 14px;
    }
}

/* 文件上传组件样式 */
::v-deep(.el-upload) {
    .el-upload-dragger {
        width: 100%;
        height: 120px;
        border: 2px dashed #d9d9d9;
        border-radius: 6px;
        text-align: center;

        &:hover {
            border-color: #409EFF;
        }
    }
}

/* 开关组件样式 */
::v-deep(.el-switch) {
    .el-switch__label {
        color: #606266;
        font-weight: 500;

        &.is-active {
            color: #409EFF;
        }
    }
}
</style>