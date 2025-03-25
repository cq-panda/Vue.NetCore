//************************************************ 
//  *Author：jxx
//  *QQ：283591387
//  *自定义业务逻辑扩展
//************************************************ 
export default function() {
	return {
		methods: {
			onInited() {
				this.textInline = true;
				this.columns[1].width = 70;
				this.columns[1].formatter = true;
				//this.direction = 'horizontal'
				this.listTileFiled="PhoneNo";
				// let _this = this;
				// uni.getSystemInfo({
				// 	success: function(res) {
				// 		_this.height = res.windowHeight - 0;
				// 	}
				// });
			},
			formatter(row, column) {
				let val = row[column.field];
				return '<a style="color:red;">' + val + '</a>';
			},
			rowClick(index, row, column) {
				return true;
			},
			updateBefore(formData) {
				this.$toast(JSON.stringify(formData))
			},
			addBefore(formData) {
				this.$toast(JSON.stringify(formData))
			}
		}
	}
}
