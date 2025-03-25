<template>
    <div class="audit-content">
        <label>{{ $ts('审批状态') }}：</label> <el-radio-group name="0" label="待审核" v-model="model" @change="onChange">
            <el-radio-button v-for="(item, index) in list" :key="index" :value="item.key" >
                {{ $ts(item.value) }}
            </el-radio-button>
        </el-radio-group>
    </div>
</template>
<script >
export default {
    emits:['parentCall'],
    data() {
        return {
            model: "0",
            list: [
                {
                    "key": "0",
                    "value": "待审核"
                },
                // {
                //     "key": "90",
                //     "value": "草稿"
                // },
                // {
                //     "key": "100",
                //     "value": "待提交"
                // },
                {
                    "key": "1",
                    "value": "审核通过"
                },
       
                {
                    "key": "3",
                    "value": "审核未通过"
                },
                {
                    "key": "4",
                    "value": "驳回"
                },
                {
                    "key": "40",
                    "value": "我的审核"
                },
                {
                    "key": "50",
                    "value": "我的提交"
                },
                {
                    "key": "-1",
                    "value": "全部"
                }
            ]

        }
    },
    methods: {
        onChange(val) {
            this.$emit("parentCall", $parent => {
                $parent.AuditStatus = val;
                $parent.search();
            })
        }
    }
}
</script>
<style scoped>
.audit-content {
    padding: 8px 0px 6px 15px;
    margin-bottom: -6px;
    position: relative;
    z-index: 999;
    border-bottom: 1px solid rgb(238, 238, 238);
    display: flex;
    align-items: center;
    font-size: 13px;
}
</style>