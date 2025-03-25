<template>
	<view>
		<view @click="toDetail(item)" class="message-list-item" v-for="(item,index) in data" :key="index">
			<view class="message-list-item-left">
				<u--image width="80px" height="80px" radius="5px" :src="item.imageUrl"></u--image>
			</view>
			<view class="message-list-item-right">
				<view class="message-list-item-right-title">
					{{item.title}}
				</view>
				<view class="message-list-item-right-small-text">
					<view style="font-weight: bold; flex: 1;">{{item.creator}}</view>
					<view class="flag" v-if="index<=3">最新</view>
					<view class="text">{{item.createDate.substring(0,16)}}</view>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		props: {
			list: {
				type: Array,
				default: () => {
					return []
				}
			}
		},
		methods: {
			toDetail(item) {
				uni.navigateTo({
					url: '/pages/message/detail/detail?id=' + item.id + '&title=' + item.title
				})
			}
		},
		data() {
			return {
				data: []
			}
		},
		created() {
			this.data = this.list;
		},
		// #ifdef MP-WEIXIN
		watch: {
			list: {
				handler(val) {
					this.data = val;
				},
				immediate: true,
				deep: true
			}
		},
		// #endif
	}
</script>
<style lang="less" scoped>
	.message-list-item {
		min-height: 100rpx;
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
</style>
