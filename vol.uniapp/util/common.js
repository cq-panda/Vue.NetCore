function _getDate(date) {
	var year = date.getFullYear(),
		month = date.getMonth() + 1,
		day = date.getDate();
	return `${year}-${fillZero(month)}-${fillZero(day)}`
}

function fillZero(val) {
	return (val < 10 ? '0' : '') + val;
}
export default {
	getDate() {
		var date = new Date();
		return _getDate(date);
	},
	getDateTime() {
		var date = new Date();
		var hour = fillZero(date.getHours()),
			minute = fillZero(date.getMinutes()),
			second = fillZero(date.getSeconds());
		return `${ _getDate(date)} ${hour}:${minute}:${second}`;
	},
	 //日期+多少天
	 //日期-10天：this.base.date('2023-04-02',-10)
	 	 //当天日期-10天：this.base.date(this.base.getDate(),-10)
	addDay(date, days) {
		if (!days) {
			return date;
		}
		date = new Date(new Date(date).setDate(new Date(date).getDate() + days));
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		if (month < 10) {
			month = "0" + month;
		}
		var day = date.getDate();
		if (day < 10) {
			day = "0" + day;
		}
		return year + "-" + month + "-" + day;
	},
	//日期+多少月，同上
	addMonth(date, m) {
		date = new Date(
			new Date(date).setMonth(
				new Date(date).getMonth() + (m === undefined ? 1 : m)
			)
		);
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		if (month < 10) {
			month = "0" + month;
		}
		var day = date.getDate();
		if (day < 10) {
			day = "0" + day;
		}
		return year + "-" + month + "-" + day;
	},
	isEmpty(value, checkArr) {
		if (checkArr) {
			if (Array.isArray(value)) {
				if (!value.length) {
					return true;
				}
			}
		}
		return value === '' || value === ' ' || value === undefined || value === null || value === 'null'
	}
}
