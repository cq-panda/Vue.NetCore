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
