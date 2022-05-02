<template>
	<view>
		<vol-alert>
			<view>当前页面为手动绑定的列表数据,另两个页面是从后台api绑定的数据</view>
		</vol-alert>
		<vol-table :tableData="rows" @rowClick="rowClick" :height="tableHeight" :titleField="titleField" ref="table"
			:direction="direction" @formatter="formatter" :columns.sync="columns" :textInline="textInline">
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
				tableUrl: "",
				//设置table为水平显示或者list列表显示'horizontal'//list
				direction: "list",
				tableHeight: 0, //表格高度，默认100%高度
				textInline: false, //表格内容超出是否换行
				rows: [{
					"ExpertName": "测试数据1",
					"HeadImageUrl": "Upload/Tables/App_Expert/202103061753415708/060222.jpg",
					"UserName": "这是手动绑定的table数据",
					AuditStatus:null,
					"Creator": "admin",
					"CreateDate": "2018-09-04 15:49:44"
				},{
					"ExpertName": "测试数据2",
					"HeadImageUrl": "Upload/Tables/App_Expert/202103061753415708/060222.jpg",
					"UserName": "table数据",
					AuditStatus:1,
					"Creator": "admin",
					"CreateDate": "2018-09-02 15:49:44"
				},{
					"ExpertName": "测试数据3",
					"HeadImageUrl": "Upload/Tables/App_Expert/202103061753415708/060222.jpg",
					"UserName": "table数据",
					AuditStatus:1,
					"Creator": "admin",
					"CreateDate": "2018-09-08 15:49:44"
				},{
					"ExpertName": "测试数据4",
					"HeadImageUrl": "Upload/Tables/App_Expert/202103061753415708/060222.jpg",
					"UserName": "table数据",
					AuditStatus:1,
					"Creator": "admin",
					"CreateDate": "2018-09-04 15:49:44"
				}],
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
						type: 'date'
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
					return callback('<a style="color:#008dd4;">' + row.UserName + '</a>')
				}
				return callback(row[column.field])
			}
		}
	}
</script>

<style>

</style>
