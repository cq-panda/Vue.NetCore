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

				//设置自定义格式显示
				//this.columns.forEach(column=>{
				// 	if(column.field=='字段'){
				//      //自定义格式化显示,在下面的formatter实现具体逻辑
				// 		//column.formatter=true;

				//      //指定字段为date类型不显示时分秒
				//      //column.type="date";

				//      //设置列宽度
				//      //column.width = 70;
				// 	}
				// })

				//页面打开时禁用加载数据
				//this.load=false;
				//页面打开时默认弹出查询框
				//this.searchModel = true;
			},

			//审核操作：
			//1、实现rowButtons方法返回审批按钮（注意表必须有AuditStatus字段int类型）
			rowButtons(rowindex, row) {
				//没有审核权限按钮的不显示
				// let hasAudit = this.permission.some(x => {
				// 	return x.tableName == 'SellOrder' && x.permission.indexOf('Audit') != -1
				// });
				// if (!hasAudit) {
				// 	return [];
				// }
				//AuditStatus === 0审核中的数据
				if (row.AuditStatus === 0) {
					return [{
						text: "审核",
						type: "error",
						shape: "circle"
					}]
				}
				//返回查看审批按钮
				return [{
					text: "查看审核",
					type: "primary",
					shape: "circle"
				}]
			},
			//2、实现rowButtons按钮点击方法，并跳转到审批页面(创建一个审批页面SellOrderAduit.vue并在pages.json中添加页面配置)
			//3、具体实现见SellOrderAduit.vue页面
			rowButtonClick(btn, rowindex, row) {
				uni.navigateTo({
					url: "/pages/order/SellOrder/SellOrderAduit?orderId=" + row.Order_Id
				})
			},
			formatter(row, column) { //自定义格式化
				// if(column.field=='xx'){
				//  return '<a style="color:red;">' + row[column.field] + '</a>';
				// }
				//return row[column.field]
			},
			rowClick(index, row, column) { //行点击事件(默认触发编辑)
				//跳转到详情页面
				let url = "/pages/order/SellOrder/Detail/Detail?orderId=" + row.Order_Id;
				uni.navigateTo({
					url: url
				})
				return false;
			},
			gridAdd() { //点击添加跳转到详情页面
				let url = "/pages/order/SellOrder/Detail/Detail";
				uni.navigateTo({
					url: url
				})
			}
		}
	}
}
