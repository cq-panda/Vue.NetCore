<template>
	<view style="overflow: hidden;">
		<vol-alert>
			<view>
				<view>1、表格支持水平或列表显示、事件绑定、数据源自动转换、行格式化、自动分页，见table1.vue页面</view>
				<view>2、点击下面输入框左侧的扫描图标可以扫描搜索</view>
			</view>
		</vol-alert>
		<view style="padding: 20rpx;">
			<u-search @search="searchClick" @custom="searchClick" placeholder="请输入名称搜索" :showAction="true"
				actionText="搜索" searchIcon="scan" @clickIcon="scanClick" :animation="false" v-model="searchText">
			</u-search>
			<view @click="getRows" style="text-align: right;padding-top: 30rpx;">
				<u--text type="info" text="获取选中行"></u--text>
			</view>

		</view>
		<!--  -->
		<vol-table :ck="true" :url="tableUrl" @rowClick="rowClick" :defaultLoadPage="load" @loadBefore="loadBefore"
			:height="height" :index="rowIndex" @loadAfter="loadAfter" ref="table" :direction="direction"
			@formatter="formatter" :columns.sync="columns" :textInline="textInline">
		</vol-table>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				searchText: "",
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
						align: "left",
						type: 'img',
						width: 50
					},
					{
						field: 'ExpertName',
						title: '名称',
						align: "left",
						formatter: true
					},
					{
						field: 'UserName',
						align: "left",
						title: '帐号'
					},
					{
						field: 'AuditStatus',
						title: '状态',
						type: "select",
						align: "left",
						bind: {
							key: 'audit',
							data: []
						}
					},
					// {
					// 	field: 'Resume',
					// 	title: '简介',
					// 	width: 80
					// },
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
			getRows(){
				let rows= this.$refs.table.getSelectRows();
				this.$toast('共选中'+rows.length+'行');
				console.log(rows)
			},
			scanClick() {
				//扫一扫点击事件
				uni.scanCode({
					success: (res) => {
						this.searchText = res.result;
						this.searchClick();
					}
				})
			},
			searchClick() { //点击搜索
				this.$refs.table.load(null, true);
			},
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
				//如果有搜索条件,按搜索值模糊查询 
				if (this.searchText) {
					params.wheres.push({
						name: "ExpertName",
						value: this.searchText,
						displayType: "like"
					})
				}

				callback(true);
			}
		}
	}
</script>

<style>

</style>
