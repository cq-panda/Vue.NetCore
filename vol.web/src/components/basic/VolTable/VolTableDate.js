export const compareDate = (date1, date2) => {
  if (!date2) {
    return true
  }
  return date1.valueOf() < (typeof date2 == 'number' ? date2 : new Date(date2).valueOf())
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

export const  getDateFormat=(column)=> {
    if (column.format) {
      return column.format;
    }
    if (column.edit.type == "month") {
      return "YYYY-MM";
    }
    //见https://day.js.org/docs/zh-CN/display/format
    return column.edit.type == "date" ? "YYYY-MM-DD" : "YYYY-MM-DD HH:mm:ss";
  }