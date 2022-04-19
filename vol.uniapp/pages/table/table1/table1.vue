<template>
	<view style="overflow: hidden;">
		<vol-alert>
			<view>表格支持水平或列表显示、事件绑定、数据源自动转换、行格式化、自动分页，见table1.vue页面</view>
		</vol-alert>
		<vol-table :url="tableUrl" @rowClick="rowClick" :defaultLoadPage="load" @loadBefore="loadBefore"
			:height="height" :index="rowIndex" @loadAfter="loadAfter" ref="table" :direction="direction"
			@formatter="formatter" :columns.sync="columns" :textInline="textInline">
		</vol-table>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				load: true, //默认是否加载数据
				rowIndex: true, //显示行号
				tableUrl: "api/app_expert/getPageData",
				//设置table为水平显示或者list列表显示'horizontal'//list
				direction: "horizontal",
				height: 0, //表格高度，默认100%高度
				textInline: false, //表格内容超出是否换行
				columns: [{
						field: 'ExpertId',
						title: '主键ID',
						hidden: true
					},
					{
						field: 'HeadImageUrl',
						title: '头像',
						type: 'img',
						width: 50
					},
					{
						field: 'ExpertName',
						title: '名称',
						formatter: true
					},
					{
						field: 'UserName',
						title: '帐号'
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
				]
			}
		},
		onLoad() {
			let _this = this;
			uni.getSystemInfo({
				success: function(res) {
					// // #ifdef MP-WEIXIN
					// _this.height = res.windowHeight - 180;
					// return
					// // #endif
					
					_this.height = res.windowHeight - 125;
				}
			});
		},
		methods: {
			formatter(row, column, index, callback) { //格式化单元格数据
				if (column.field == 'ExpertName') {
					return callback('<a style="color:red;">' + row.ExpertName + '</a>')
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
			}
		}
	}
</script>

<style>

</style>
