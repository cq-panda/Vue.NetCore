<template>
	<view>
		<vol-alert>
			<view>表格支持水平或列表显示、事件绑定、数据源自动转换、行格式化、自动分页，见table2.vue页面</view>
		</vol-alert>
		<vol-table :url="tableUrl" @rowButtons="rowButtons" @rowButtonClick="rowButtonClick" @rowClick="rowClick"
			:defaultLoadPage="load" @loadBefore="loadBefore" :height="tableHeight" :titleField="titleField"
			:index="rowIndex" @loadAfter="loadAfter" ref="table" :direction="direction" @formatter="formatter"
			:columns.sync="columns" :textInline="textInline">
		</vol-table>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				load: true, //默认是否加载数据
				rowIndex: true, //显示行号
				titleField: 'ExpertName', //列表的标题字段
				tableUrl: "api/app_expert/getPageData",
				//设置table为水平显示或者list列表显示'horizontal'//list
				direction: "list",
				tableHeight: 0, //表格高度，默认100%高度
				textInline: false, //表格内容超出是否换行
				columns: [{
						field: 'ExpertId',
						title: '主键ID',
						hidden: true
					},
					{
						field: 'ExpertName',
						title: '名称'
					},
					{
						field: 'UserName',
						title: '帐号',
						formatter: true
					},
					{
						field: 'AuditStatus',
						title: '状态',
						type: "select",
						bind: {
							key: 'audit',
							data: []
						}
					},
					{
						field: 'Resume',
						title: '简介',
						width: 80
					},
					{
						field: 'HeadImageUrl',
						title: '头像',
						type: 'img',
						width: 50
					},
					{
						field: 'Creator',
						title: '创建人'
					},
					{
						field: 'CreateDate',
						title: '申请时间',
						type: 'datetime'
					}
				]
			}
		},
		onLoad() {
			let _this = this;
			uni.getSystemInfo({
				success: function(res) {
					_this.tableHeight = res.windowHeight - 70;
				}
			});
		},
		methods: {
			formatter(row, column, index, callback) { //格式化单元格数据
				if (column.field == 'UserName') {
					return callback('<a style="color:red;">' + row.UserName + '</a>')
				}
				return callback(row[column.field])
			},
			rowClick(index, row) {
				this.$toast(`点击了第${index}行`)
			},
			loadAfter() {

			},
			loadBefore(params, callback) {
				callback(true);
			},
			rowButtons(index, row, callback) { //列表显示的按钮
				//if(row.xx=='')
				//自定义按钮,仅onInited中设置：this.direction = "list"后生效
				let buttons = [{
					text: "测试",
					icon: "plus",
					type: "primary",
					shape: "circle",
					//disabled: true
				}, {
					text: "删除",
					icon: "trash",
					type: "error",
					plain: true,
					shape: "circle",
					//shape:"",//square、circle
					//disabled: false
				}];
				callback(buttons);
			},
			rowButtonClick(btn, index, row) { //列表显示的按钮点击事件
				if (btn.text == '删除') {
					this.$toast('删除按钮')
				} else  {
					this.$toast('测试按钮')
				}
			},
		}
	}
</script>

<style>

</style>
