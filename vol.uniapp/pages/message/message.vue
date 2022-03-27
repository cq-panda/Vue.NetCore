<template>
	<view class="message-container">
		<u-sticky bgColor="#fff">
			<u-tabs :list="list1"></u-tabs>
		</u-sticky>

		<view class="message-list">
			<u-list @scrolltolower="scrolltolower" :height="height" :lowerThreshold='50'>
				<view class="message-list-item" v-for="(item,index) in list" :key="index">
					<view class="message-list-item-left">
						<u--image width="80px" height="80px" radius="5px" :src="item.imgs[0]"></u--image>
					</view>
					<view class="message-list-item-right">
						<view class="message-list-item-right-title">
							{{item.title}}
						</view>
						<view class="message-list-item-right-small-text">
							<view class="text">{{item.author}}</view>
							<view class="flag" v-if="item.flag">{{item.flag}}</view>
							<view class="text">{{item.date}}</view>
						</view>
					</view>
				</view>
			</u-list>
		</view>
		<vol-tabbar :index="3"></vol-tabbar>
	</view>
</template>

<script>
	export default {
		methods: {
			scrolltolower() {
				this.list.push({
					title: "做程序员关键技术要点是什么??程序员发展前景如何?",
					header: "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/head1.jpg",
					author: "路边社北京分社",
					date: "1天前",
					imgs: [
						"https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/tj01.jpg"
					]
				})
			}
		},
		onLoad() {
			uni.hideTabBar({
				animation: false
			})
			let _this = this;
			uni.getSystemInfo({
				success: function(res) {
					_this.height = res.windowHeight - 50;
				}
			});
		},
		data() {
			return {
				height: 0,
				list1: [{
					name: '关注',
				}, {
					name: '推荐',
				}, {
					name: '电影'
				}, {
					name: '科技'
				}, {
					name: '音乐'
				}, {
					name: '美食'
				}],
				list: [{
						title: "刚刚老板向我借计算器，我说你算什么东西，然后老板让我发个红包给他道...",
						header: "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/head3.jpg",
						author: "路边社消息",
						date: "刚刚",
						flag: "置顶",
						link: "",
						imgs: [
							"https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/tj04.jpg"
						]
					}, {
						title: "当往事已成回忆，我从千万家产到非洲当雇佣兵的日子",
						header: "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/head3.jpg",
						author: "路边社非洲分社",
						date: "1分钟前",
						flag: "探险",
						imgs: [
							"https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/tj01.jpg"
						]
					},
					{
						title: "零點糗事的糗事：谁能拥有这样的逗比女朋友，一定是休了八百辈子的福了",
						header: "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/head3.jpg",
						author: "路边社消息",
						date: "5分钟前",
						flag: "八卦",
						link: "",
						imgs: [
							"https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/tj04.jpg",
							"https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/tj04.jpg"
						]
					},
					{
						title: "当往事已成回忆，我从千万家产到非洲当雇佣兵的日子",
						header: "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/head3.jpg",
						author: "路边社非洲分社",
						date: "1分钟前",
						flag: "探险",
						imgs: [
							"https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/tj01.jpg"
						]
					},
					{
						title: "现在找对象一定要看仔细一些，因为现在不男不女的人太多了！",
						header: "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/head3.jpg",
						author: "路边社消息",
						date: "1分钟前",
						imgs: [
							"https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/tj04.jpg"
						]
					},
					{
						title: "做程序员关键技术要点是什么??程序员发展前景如何?",
						header: "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/head1.jpg",
						author: "路边社北京分社",
						date: "1天前",
						imgs: [
							"https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/tj05.jpg"
						]
					},
					{
						title: "刚刚老板向我借计算器，我说你算什么东西，然后老板让我发个红包给他道...",
						header: "https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/head3.jpg",
						author: "路边社消息",
						date: "1分钟前",
						link: "",
						imgs: [
							"https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/tj05.jpg",
						]
					},
				],
			}
		}
	}
</script>
<style lang="less" scoped>
	.message-container {
		background-color: #f9f9f9;
	}

	.message-list {
		.message-list-item {
			display: flex;
			margin: 14rpx 14rpx 0 14rpx;
			background: white;
			padding: 16rpx;
			border-radius: 10rpx;
			border: 1px solid #f5f5f5;
		}

		.message-list-item-left {
			margin-right: 16rpx;
		}

		.message-list-item-right {
			display: flex;
			flex-direction: column;

			.message-list-item-right-title {
				flex: 1;
				font-size: 30rpx;
			}

			.message-list-item-right-small-text {
				display: flex;
				font-size: 24rpx;
				color: #a7a7a7;

				.text {
					flex: 1;
				}

				.text:last-child {
					text-align: right;
				}

				.flag {
					padding: 1px 5px;
					border-radius: 3px;
					font-size: 20rpx;
					background: #f44336;
					color: #ffff;
					position: relative;
					top: -2px;
				}
			}
		}
	}
</style>
