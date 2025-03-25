//************************************************
//  *Author：jxx
//  *QQ：283591387
//  *自定义业务逻辑扩展
//************************************************
export default function() {
	return {
		methods: {
			onInited() { //页面参数初始化
				//设置table超出换行显示
				//this.textInline = false;

				//设置列宽度
				//this.columns[1].width = 70;

				//设置table为水平显示或者list列表显示
				this.direction = 'horizontal' //list


				this.columns.forEach(column => {
					//动态隐藏字段
					if (["Creator", "Modifier", "ModifyDate", "PhoneNo"].indexOf(column.field) != -1) {
						column.hidden = true;
					}
					if (column.field == 'CreateDate') {
						column.type = "date";
						column.width = 80;
					}
					if (column.field == 'Describe') {
						column.width = 140;
						//设置描述字段超链接与点击事件
						column.formatter = true;
						column.click = true;
					}
				})
				
                //动态添加一个操作列
				//具体实现见下面formatter、cellClick方法及App_Appointment.vue中的删除弹出框操作
				this.columns.push({
					field: "操作",
					title: "操作",
					formatter: true,
					click: true
				})

				//显示行号
				this.rowIndex = true;
			},
			formatter(row, column) { //自定义格式化
				if (column.field == 'Describe') {
					return '<a style="color:#2485e9;">' + row[column.field] + '</a>';
				} else if (column.field == '操作') {
					return '<a style="color:#2485e9;font-size:26rpx">删除</a>';
				}
				return row[column.field]
			},
			cellClick(index, row, column) {
				if (column.field == 'Describe') {
					this.$toast('点击了:' + row.Describe)
				} else if (column.field == '操作') {
					//删除操作(这里只是举例，框架内置了删除方法，点击行弹出框中(菜单分配了删除按钮才能看到))
					//调用删除提示：见App_Appointment.vue中
					
					this.$emit('delTest',row)
				}
			},
			rowClick(index, row, column) { //行点击事件
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
