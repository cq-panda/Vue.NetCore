//2024.11.16重写组件
export const getDateFormat = (item) => {
    if (item.format) {
        return item.format
    }
    if (item.type == 'month') {
        return 'YYYY-MM'
    }
    // if (item.type=='time') {
    //     return 'HH:mm:ss'
    // }
    //见https://day.js.org/docs/zh-CN/display/format
    return item.type == 'date' ? 'YYYY-MM-DD' : 'YYYY-MM-DD HH:mm:ss'
}

export const getShortcuts = ($ts) => {
    const end = new Date()
    return [
        { name: '今天', value: 0 },
        { name: '昨天', value: 1 },
        { name: '近三天', value: 2 },
        { name: '近一周', value: 6 },
        { name: '近一月', m: true, value: 1 },
        { name: '近三月', m: true, value: 3 },
        { name: '近半年', m: true, value: 6 },
        { name: '近一年', m: true, value: 12 }
    ].map((x) => {
        return {
            text: $ts(x.name),
            value: () => {
                const start = new Date()
                if (x.m) {
                    start.setMonth(start.getMonth() - x.value)
                    return [start.getTime(), end]
                }
                start.setTime(start.getTime() - 3600 * 1000 * 24 * x.value)
                return [start, end]
            }
        }
    })
}

export const getDateOptions = (date, item) => {
    //2021.07.17设置时间可选范围
    if ((!item.min && !item.max) || !date) {
        return false
    }
    if (item.min && item.min.indexOf(' ') == -1) {
        //不设置时分秒，后面会自动加上 08:00
        item.min = item.min + ' 00:00:000'
    }
    return compareDate(date, item.min) || !compareDate(date, item.max)
}

const compareDate = (date1, date2) => {
    if (!date2) {
        return true
    }
    return date1.valueOf() < (typeof date2 == 'number' ? date2 : new Date(date2).valueOf())
}

export const dateRangeChange = (val, item) => {
    // if (!val) {
    //     this.$emit('update:formFields')
    //     return
    // }
    item.onChange && item.onChange(val)
}
