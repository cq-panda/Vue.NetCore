<template>
    <el-calendar ref="calendar">
        <template #header="{ date }">
            <div class="title">
                <vol-title title="生产排班"></vol-title>
                <div style="flex: 1;">{{ date }}</div>
                <div>
                    <el-button-group>
                        <el-button size="small" @click="selectDate('prev-year')">
                            去一年
                        </el-button>
                        <el-button size="small" @click="selectDate('prev-month')">
                            上一月
                        </el-button>
                        <el-button size="small" @click="selectDate('today')">今天</el-button>
                        <el-button size="small" @click="selectDate('next-month')">
                            下一月
                        </el-button>
                        <el-button size="small" @click="selectDate('next-year')">
                            下一年
                        </el-button>
                    </el-button-group>
                </div>
            </div>
        </template>

        <!--data数据： {"isSelected":false,"type":"current-month","day":"2024-12-08","date":"2024-12-07T16:00:00.000Z"} 12-08 -->
        <template #date-cell="{ data }">
            <div>{{ getkDay(data.day) }}</div>
            <div v-if="getWeekDay(data.date)">
                <div style="margin-bottom: 5px;"> <el-tag type="primary">班</el-tag></div>
                <div>
                    <el-tag type="success">SMT一组</el-tag>
                </div>
            </div>
        </template>
    </el-calendar>
</template>

<script setup>
import { ref } from 'vue'

const calendar = ref()
const selectDate = (val) => {
    if (!calendar.value) return
    calendar.value.selectDate(val)
}
const getWeekDay = (dateString) => {
    var date = new Date(dateString);
    var dayOfWeek = date.getDay();
    return dayOfWeek > 0 && dayOfWeek < 6
}

const getkDay = (day) => {
    return day.split('-').pop() * 1
}
</script>
<style lang="less" scoped>
.title {
    width: 100%;
    display: flex;
    align-items: end;
}
</style>