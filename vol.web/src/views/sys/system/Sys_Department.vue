<!--
 *Author：jxx
 *Date：{Date}
 *Contact：283591387@qq.com
 *业务请在@/extension/sys/system/Sys_Department.jsx或Sys_Department.vue文件编写
 *新版本支持vue或【表.jsx]文件编写业务,文档见:https://doc.volcore.xyz/docs/view-grid、https://doc.volcore.xyz/docs/web
 -->
<template>
    <view-grid ref="grid" :columns="columns" :detail="detail" :details="details" :editFormFields="editFormFields"
        :editFormOptions="editFormOptions" :searchFormFields="searchFormFields" :searchFormOptions="searchFormOptions"
        :table="table" :extend="extend" :onInit="onInit" :onInited="onInited" :searchBefore="searchBefore"
        :searchAfter="searchAfter" :addBefore="addBefore" :updateBefore="updateBefore" :rowClick="rowClick"
        :modelOpenBefore="modelOpenBefore" :modelOpenAfter="modelOpenAfter" :loadTreeChildren="loadTreeChildren"
        :addAfter="addAfter" :updateAfter="updateAfter" :delAfter="delAfter">
        <!-- 自定义组件数据槽扩展，更多数据槽slot见文档 -->
        <template #gridHeader>
        </template>
    </view-grid>
</template>
<script setup lang="jsx">
import extend from "@/extension/sys/system/Sys_Department.jsx";
import viewOptions from './Sys_Department/options.js'
import { ref, reactive, getCurrentInstance, watch, onMounted } from "vue";
const grid = ref(null);
const { proxy } = getCurrentInstance()
//http请求，proxy.http.post/get
const { table, editFormFields, editFormOptions, searchFormFields, searchFormOptions, columns, detail, details } = reactive(viewOptions())

let gridRef;//对应[表.jsx]文件中this.使用方式一样
//生成对象属性初始化
const onInit = async ($vm) => {
    gridRef = $vm;
    gridRef.paginationHide = true;
    gridRef.lazy = false;

    //树形结点的id字段
    gridRef.rowKey = 'DepartmentId';
    //父级id字段
    gridRef.rowParentField = "ParentId";
    //是否展开所有节点（默认会记录展开的节点）
    //gridRef.defaultExpandAll=true;

    //默认展开的节点
    // gridRef.expandRowKeys=["id"]
}
const loadTreeChildren = (tree, treeNode, resolve) => {
    //加载子节点
    let url = `api/Sys_Department/getTreeTableChildrenData?departmentId=${tree.DepartmentId}`;
    proxy.http.post(url, {}).then((result) => {
        resolve(result.rows);
    });
}

const addBtnClick = (row) => {
    //这里是动态addCurrnetRow属性记录当前点击的行数据,下面modelOpenAfter设置默认值
    addCurrnetRow = row;
    gridRef.add();
}

//生成对象属性初始化后,操作明细表配置用到
const onInited = async () => {
    let hasUpdate, hasDel, hasAdd;
    gridRef.buttons.forEach((x) => {
        if (x.value == 'Update') {
            x.hidden = true;
            hasUpdate = true;
        } else if (x.value == 'Delete') {
            hasDel = true;
            x.hidden = true; //隐藏按钮
        } else if (x.value == 'Add') {
            x.type = 'primary';
            hasAdd = true;
        }
    });
    if (!(hasUpdate || hasDel || hasAdd)) {
        return;
    }
    columns.push({
        title: '操作',
        field: '操作',
        width: 100,
        fixed: 'right',
        align: 'center',
        render: (h, { row, column, index }) => {
            return (
                <div>
                    {hasAdd ? (
                        <el-button
                            onClick={($e) => {
                                addBtnClick(row);
                            }}
                            type="primary"
                            link
                            icon="Plus"
                        ></el-button>
                    ) : (
                        ''
                    )}
                    {hasUpdate ? (
                        <el-button
                            onClick={($e) => {
                                gridRef.edit(row);
                            }}
                            type="success"
                            link
                            icon="Edit"
                        ></el-button>
                    ) : (
                        ''
                    )}
                    {hasDel ? (
                        <el-button
                            link
                            onClick={($e) => {
                                gridRef.del(row);
                            }}
                            type="danger"
                            icon="Delete"
                        ></el-button>
                    ) : (
                        ''
                    )}
                </div>
            );
        }
    });
}
const searchBefore = async (params) => {
    //判断加载根节点或子节点
    //没有查询条件，默认查询返回所有根节点数据
    if (!params.wheres.length) {
        params.value = 1;
    }
    return true;
}
const searchAfter = async (rows, result) => {
    return true;
}
const addBefore = async (formData) => {
    //新建保存前formData为对象，包括明细表，可以给给表单设置值，自己输出看formData的值
    return true;
}
const updateBefore = async (formData) => {
    //编辑保存前formData为对象，包括明细表、删除行的Id
    return true;
}
const rowClick = ({ row, column, event }) => {
    //查询界面点击行事件
    // grid.value.toggleRowSelection(row); //单击行时选中当前行;
}
const addAfter = () => {
    //添加后刷新字典
    gridRef.initDicKeys();
    return true;
}
const updateAfter = () => {
    gridRef.initDicKeys();
    return true;
}
const delAfter = (res) => {
    //查询界面的表删除后
    gridRef.initDicKeys();
    return true;
};
const modelOpenBefore = async (row, currentAction, isCopyClick) => {
    //弹出框打开前
    return true;//返回false，不会打开弹出框
}
let addCurrnetRow;
const modelOpenAfter = (row, currentAction, isCopyClick) => {
    //点击行上的添加按钮事件
    if (addCurrnetRow) {
        //获取当前组织构架的所有父级id,用于设置新建时父级id的默认值

        //获取数据数据源
        let data = [];
        editFormOptions.forEach((options) => {
            options.forEach((option) => {
                if (option.field == 'ParentId') {
                    data = option.orginData;
                }
            });
        });
        let parentIds = proxy.base
            .getTreeAllParent(addCurrnetRow.DepartmentId, data)
            .map((x) => {
                return x.id;
            });
        //设置编辑表单上级组织的默认值
        editFormFields.ParentId = parentIds;
        addCurrnetRow = null;
    }
}
//监听表单输入，做实时计算
//watch(() => editFormFields.字段,(newValue, oldValue) => {	})
//对外暴露数据
defineExpose({})
</script>
