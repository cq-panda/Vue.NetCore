//************************************************
//  *Author：jxx
//  *QQ：283591387
//  *自定义业务逻辑扩展
//************************************************
export default function() {
	return {
		methods: {
			onInited() { //页面参数初始化

				this.ck = true; //设置显示checkbox，只有水平(table)显示类型时才生效

				this.height = this.height - 40;
				//设置table为水平显示或者list列表显示
				this.direction = 'horizontal' //list
				this.textInline = false;
				//this.rowIndex=true;
				this.columns.forEach(column => {
					//设置居左显示
					column.align = 'left';
					//指定单元格宽度
					if (column.field == 'Quantity' || column.field == 'TransactionType') {
						column.width = 40
					}
					if (column.field == 'Name') {
						column.width = 50
					}
				})

				this.fabButtons.push({
					name: "获取选中行",
					icon: "scan",
					onClick: () => {
                      let rows=this.$refs.table.getSelectRows();
					  this.$toast('共选中'+rows.length+'行');
					  console.log(rows);
					}
				})
			},
			searchFormOnChange(field, value) { //查询弹出框下拉框或日期选中事件
				if (field == "TransactionType") {
					this.$toast(`点击了【状态】字段,选中值${value}`)
				}
			},
			editFormOnChange(field, value) { //新建编辑弹出框下拉框或日期选中事件
				if (field == "TransactionType") {
					//点击【状态】给名字随机设置一个值
					this.editFormFields.Name = ~~(Math.random() * 100000);
					this.$toast(`点击了【状态】字段,选中值${value}`)
				}
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
