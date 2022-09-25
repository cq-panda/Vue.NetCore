//************************************************
//  *Author：jxx
//  *QQ：283591387
//  *自定义业务逻辑扩展
//************************************************
export default function() {
	return {
		methods: {
			onInited() { //页面参数初始化
				this.height = this.height - 40;
				//设置table超出换行显示
				//this.textInline = false;

				//设置列宽度
				//this.columns[1].width = 70;

				//设置table为水平显示或者list列表显示
				//this.direction = 'horizontal'//list
				//如果为list列表显示，指定list的标题列
				//this.titleField="字段";

				//设置自定义样式
				this.columns.forEach(column => {
					if (column.field == 'Quantity' || column.field == 'TransactionType') {
						//自定义格式化显示,在下面的formatter实现具体逻辑
						column.formatter = true;
						column.title="888888";

					}
				})
				console.log("11")
				//页面打开时禁用加载数据
				//this.load=false;
				//页面打开时默认弹出查询框
				//this.searchModel = true;
			},
			formatter(row, column) { //自定义格式化
				if (column.field == 'TransactionType') {
					if (row.TransactionType == 1) {
						return `<span style="color: #ffff;background: #00aaff;padding: 2px 10px;
						         border-radius: 3px;font-size: 10px;"> 是</span>`;
					}
					return `<span style="color: #ffff;background: #3eb703;padding: 2px 10px;
					         border-radius: 3px;font-size: 10px;"> 否</span>`;
				}
				if (column.field == 'Quantity' && row[column.field] >= 100) {
					return '<a style="color:red;">' + row[column.field] + '</a>';
				}
				return row[column.field]
			},
			rowClick(index, row, column) { //行点击事件(默认触发编辑)
				return true;
			},
			searchBefore(params) { //查询前
				return true;
			},
			updateBefore(formData) { //更新保存前操作
				return true;
			},
			addBefore(formData) { //新建保存前操作
				return true;
			}
		}
	}
}
