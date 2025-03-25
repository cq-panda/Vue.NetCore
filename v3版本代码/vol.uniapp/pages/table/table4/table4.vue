<template>
	<view class="table-demo">
		<view style="padding:20rpx 20rpx 10rpx 20rpx;">
			<vol-alert>
				<view>1、完全自定义vol-table列表内容及样式,见:table4.vue</view>
				<view>2、内部已处理高度自适应、自动分页、数据源自动加载</view>
				<view>3、此示例为通过url接口自动绑定数据</view>
			</vol-alert>
		</view>

		<vol-table @loadBefore="loadBefore" @loadAfter="loadAfter" custom ref="table" :url="dataUrl"
			:columns.sync="columns">
			<!-- 	自定义内容 -->
			<template v-slot:data="{rows}">
				<view @click="rowClick(row,index)" v-for="(row,index) in rows" class="grid-item">
					<view class="grid-img">
						<u--image width="85px" height="85px" radius="5px" :src="row.HeadImageUrl">
						</u--image>
					</view>
					<view class="grid-content">
						<view class="grid-title">{{row.Resume}}</view>
						<view class="grid-bottom">
							<view class="grid-bottom-left">{{row.ExpertName}}</view>
							<!-- 小程序不支持标签里面调用方法。manifest.json并且要配置	"scopedSlotsCompiler":"legacy",属性 -->
							<view class="error" v-if="row.AuditStatus=='1'">审核通过</view>
							<view class="success" v-else>审核中</view>
							<view class="grid-bottom-right">{{row.CreateDate}}</view>
						</view>
					</view>
				</view>
			</template>
		</vol-table>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				dataUrl: "api/app_expert/getPageData", //从接口返回数据，返回的数据格式看浏览器请求
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
						title: '名称'
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
						title: '简介'
					},
					{
						field: 'CreateDate',
						title: '创建时间'
					},
				]
			}
		},
		onLoad() {},
		methods: {
			rowClick(row, index) {
				console.log('点击了第' + index + '行')
				return this.$toast('点击了第' + index + '行');
			},
			loadBefore(params, callback) {
				//分页时加载数据时会触发
				console.log('table加载数据：' + JSON.stringify(params))
				callback(true);
			},
			loadAfter(data, callback) {
				//分页时加载数据时会触发
				data.rows.forEach(row => {
					row.HeadImageUrl = this.http.ipAddress + row.HeadImageUrl;
				})
				callback(true);
			}
		}
	}
</script>

<style lang="less" scoped>
	.table-demo {
		background: #f4f4f4;	
	}

	.grid-item {
		margin: 10rpx 20rpx;
		padding:16rpx;
		border-radius: 8rpx;
		display: flex;
		background: #ffff;

		.grid-content {
			display: flex;
			flex: 1;
			flex-direction: column;
			padding-left: 20rpx;

			.grid-title {

				font-size: 30rpx;
				overflow: hidden;
				display: -webkit-box;
				-webkit-line-clamp: 2;
				-webkit-box-orient: vertical;
			}

			.grid-bottom {
				flex: 1;
				align-items: flex-end;
				padding-top: 10rpx;
				display: flex;
				font-size: 24rpx;
				color: #959595;

				.grid-bottom-left {
					flex: 1;
					width: 0;
				}

				.success,
				.error {
					margin-right: 30rpx;
				}

				.success {
					color: #00aa00;
				}

				.error {
					color: #e54648;
				}
			}
		}
	}
</style>
