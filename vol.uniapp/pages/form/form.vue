<template>
	<view class="v-form-container">
		<view class="v-form-item">
			<!-- 		<view class="v-form-title">分类</view> -->
			<u-grid :border="false" :col="4">
				<u-grid-item v-for="(item,index) in list" :key="index">
					<image style="width: 50px;height: 50px;margin-top: 16rpx;" :src="item.url"></image>
					<view class="grid-text">{{item.name}}</view>
				</u-grid-item>
			</u-grid>
		</view>

		<view style="padding:0rpx 20rpx 0 20rpx">
			<vol-alert type="primary">
				<view>秋云：https://demo.ucharts.cn</view>
			</vol-alert>
		</view>
	<!-- 	<view class="charts-box v-form-item">
			<qiun-data-charts type="column" style="height: 400rpx;" :chartData="columnData" :echartsH5="true"
				:echartsApp="true" :inScrollView="true" :disableScroll="true" :canvas2d="true" :errorReload="false"
				background="none" />
		</view> -->
		<view class="charts-box v-form-item">
			<qiun-data-charts style="height: 400rpx;" type="ring" :chartData="chartData" />
		</view>

		<vol-tabbar :index="2"></vol-tabbar>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				list: [{
						name: "女装",
						url: '/static/imgs/img01.png'
					},
					{
						name: "男装",
						url: '/static/imgs/img02.png'
					},
					{
						name: "奶瓶",
						url: '/static/imgs/img03.png'
					},
					{
						name: "内衣",
						url: '/static/imgs/img04.png'
					},
					{
						name: "蛋糕",
						url: '/static/imgs/img05.png'
					},
					{
						name: "灯具",
						url: '/static/imgs/img06.png'
					}, {
						name: "男装",
						url: '/static/imgs/img02.png'
					},
					{
						name: "其他",
						url: '/static/imgs/img03.png'
					}
				],
				chartData: {
					"series": [{
						"name": "一班",
						"data": 50
					}, {
						"name": "二班",
						"data": 30
					}, {
						"name": "三班",
						"data": 20
					}, {
						"name": "四班",
						"data": 18
					}, {
						"name": "五班",
						"data": 8
					}]
				},
				columnData: {
					"categories": [
						"2020",
						"2021",
						"2023"
					],
					"yAxis": {
						"disabled": false,
						"disableGrid": true
					},
					xAxis: {
						"disableGrid": true
					},
					"series": [{
							"name": "目标值",
							"data": [
								35,
								36,
								34
							]
						},
						{
							"name": "完成量",
							"data": [
								18,
								27,
								28
							]
						}
					]
				}

			}
		},
		onShow() {
			uni.hideTabBar({
				animation: false
			})
		},
		methods: {
			rightClick() {}
		}
	}
</script>

<style lang="less" scoped>
	.v-form-container {
		padding-bottom: 90rpx;
		background: #f9f9f9;
	}

	.v-form-title {
		font-size: 28rpx;
		color: #8f9ca2;
		padding: 4rpx 0 0rpx 20rpx;
	}

	.v-form-item {
		// box-shadow: 1px 1px 9px #efefef;
		margin: 20rpx;
		border: 1px solid #f1f1f1;
		border-radius: 10rpx;
		padding: 20rpx 4rpx;
		background: #FFFFFF;

		.grid-text {
			font-size: 24rpx;
			color: #4f4747;
			margin-top: 8rpx;
			margin-bottom: 20rpx;
		}
	}
</style>
