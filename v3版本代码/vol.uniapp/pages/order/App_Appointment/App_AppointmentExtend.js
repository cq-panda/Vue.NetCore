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
				this.height = this.height - 65;

				this.fabButtons.push({
					name: "测试按钮",
					icon: "search",
					onClick: () => {
						this.$emit('testBtnClick', {
							value: "测试"
						})
					}
				})

				//编辑弹出框姓名字段增加一个扫一扫操作
				this.editFormOptions.forEach(item => {
					if (item.field == 'Name') {
						item.extra = {
							style: "color: #0762c4;margin-left:30rpx;",
							text: "扫一扫",
							icon: "scan",
							color: "#0762c4",
							size: 20
						}
					}
				})
			},
			extraClick(option, fields) { //上面的扫一扫点击事件触发
				if (option.field == 'Name') {
					this.$toast('点击了扫一扫');
					uni.scanCode({
						success: (res) => {
							this.editFormFields.Name = res.result;
						}
					})
				}

			},
			formatter(row, column) { //自定义格式化
				// if(column.field=='xx'){
				//  return '<a style="color:red;">' + row[column.field] + '</a>';
				// }
				//return row[column.field]
			},
			rowClick(index, row, column) { //行点击事件
				return true;
			},
			updateBefore(formData) { //更新保存前操作
				return true;
			},
			addBefore(formData) { //新建保存前操作
				return true;
			},
			searchInputClick(searchText) {
				//这里设置的是动态属性，searchText名字可以自己随便写
				this.searchText = searchText;
				this.search();
			},
			searchBefore(params) { //查询前
				//界面上的扫描或者搜索框操作,与上面的searchInputClick配合使用
				if (this.searchText) {
					params.wheres.push({
						name: "PhoneNo",
						value: this.searchText,
						displayType: "like"
					})
				}
				return true;
			}
		}
	}
}
