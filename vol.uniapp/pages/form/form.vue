<template>
	<view class="v-form-container">
		<u-notice-bar color="#54a6ff" bgColor="#e9f3ff" text="这里是一些常用功能,后续会不断更新........."></u-notice-bar>

		<view class="grid-list" v-for="(item,index) in grid">
			<view class="grid-title">
				<view class="grid-title-text">
					<view class="grid-title-border"></view>
					<view> {{item.name}}</view>
				</view>
			</view>
			<view class="grid-item" @click="gridClick(data.path)" v-for="(data,dindex) in item.data" :key="dindex">
				<view class="grid-icon" :class="data.bg">
					<u-icon color="#ffff" size="26" :name="data.icon"></u-icon>
				</view>
				<view class="grid-text">
					{{data.name}}
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				grid: [{
						name: "volt-able表格",
						data: [{
							name: "水平显示",
							icon: "file-text",
							bg: "color1",
							path: "/pages/table/table1/table1"
						}, {
							name: "列表显示",
							icon: "list-dot",
							bg: "color2",
							path: "/pages/table/table2/table2"
						}]
					},
					{
						name: "volt-able表格自定义内容",
						data: [{
							name: "自定内容表一",
							icon: "order",
							bg: "color4",
							path: "/pages/table/table4/table4"
						}, {
							name: "自定内容表二",
							icon: "more-circle",
							bg: "color5",
							path: "/pages/table/table5/table5"
						}]
					},
					{
						name: "表单",
						data: [{
							name: "表单(级联)",
							icon: "file-text",
							bg: "color5",
							path: "/pages/form/form2"
						}, {
							name: "只读表单",
							icon: "calendar",
							bg: "color3",
							path: "/pages/form/form1"
						}, {
							name: "事件绑定",
							icon: "pause-circle",
							bg: "color2",
							path: "/pages/form/form2"
						}, {
							name: "自定义",
							icon: "edit-pen",
							bg: "color4",
							path: ""
						}]
					},
					{
						name: "地图",
						data: [{
							name: "地图地位",
							icon: "map",
							bg: "color4",
							path: "/pages/map/map"
						}, {
							name: "地图轨迹",
							icon: "play-circle",
							bg: "color3",
							path: ""
						}, {
							name: "地图标记",
							icon: "thumb-up",
							bg: "color1",
							path: ""
						}]
					}, {
						name: "图表",
						data: [{
							name: "图表1",
							icon: "share",
							bg: "color3",
							path: "/pages/form/charts/chart1"
						}, {
							name: "图表2",
							icon: "photo",
							bg: "color2",
							path: ""
						}]
					}
				]
			}
		},
		onShow() {},
		methods: {
			gridClick(path) {
				if (!path) {
					this.$toast('开发中')
					return;
				}
				uni.navigateTo({
					url: path
				})
			}
		}
	}
</script>

<style lang="less" scoped>
	.v-form-container {
		background: #fbfbfb;
		height: calc(100vh - 110rpx);
		overflow: scroll;
		padding-bottom: 90rpx;
	}

	.grid-list {
		border-top: 1px solid #f9f9f9;
		border-bottom: 1px solid #f9f9f9;
		margin-bottom: 24rpx;
		width: 100%;
		display: inline-block;
		background: #ffff;

		.grid-item {
			width: 20%;
			text-align: center;
			float: left;
			padding: 20rpx 0;
		}

		.grid-title {
			border-bottom: 1px solid #f7f7f7;
			padding: 20rpx;

			// margin: 10px;
			// font-weight: bold;
			.grid-title-border {
				display: inline-block;
				background: #00aaff;
				padding: 18rpx 8rpx;
				border-radius: 10rpx;
				margin-right: 14rpx;
			}

			.grid-title-text {
				display: flex;
				// border-left: 16rpx solid #00aaff;
				line-height: 1.1;
				padding-left: 10rpx;

			}
		}

		.grid-icon {
			width: 80rpx;
			height: 80rpx;
			background: #eee;
			border-radius: 34rpx;
			// position: relative;
			left: 0;
			right: 0;
			margin: auto;
			justify-content: center;
			align-items: center;
			display: flex;
		}

		.color1 {
			background-image: linear-gradient(#e8b752, #e8b752);
		}

		//

		.color2 {
			background-image: linear-gradient(#e55764, #e55764);
		}

		.color3 {
			background-image: linear-gradient(#78c4df, #78c4df);
		}

		.color4 {
			background-image: linear-gradient(#69a0f1, #69a0f1);
		}

		.color5 {
			background-image: linear-gradient(#736be2, #736be2);
		}

		.grid-text {
			font-size: 24rpx;
			color: #7e7e7e;
			margin-top: 10rpx;
		}
	}
</style>
<style scoped>
	.grid-list /deep/ .u-icon {
		flex-direction: column !important;
	}
</style>
