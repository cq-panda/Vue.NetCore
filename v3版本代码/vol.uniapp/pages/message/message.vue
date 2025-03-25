<template>
	<view class="message-container">
		<u-sticky bgColor="#fff">
			<u-tabs :list="list1"></u-tabs>
		</u-sticky>

		<view class="message-list">
			<u-skeleton rows="3" :loading="loading" avatar :title="false">
				<u-list @scrolltolower="scrolltolower" :height="height" :lowerThreshold='50'>
					<message-list :list="list"></message-list>
					<view style="height: 50px;"></view>
				</u-list>
				<!-- <u-list @scrolltolower="scrolltolower" :height="height" :lowerThreshold='50'>
					<view @click="toDetail(item)" class="message-list-item" v-for="(item,index) in list" :key="index">
						<view class="message-list-item-left">
							<u--image width="80px" height="80px" radius="5px" :src="item.imageUrl"></u--image>
						</view>
						<view class="message-list-item-right">
							<view class="message-list-item-right-title">
								{{item.title}}
							</view>
							<view class="message-list-item-right-small-text">
								<view class="text">{{item.creator}}</view>
								<view class="flag" v-if="index<=3">最新</view>
								<view class="text">{{item.createDate.substring(0,16)}}</view>
							</view>
						</view>
					</view>
					<view style="height: 50px;"></view>
				</u-list> -->
			</u-skeleton>
		</view>
	</view>
</template>

<script>
	import messagelist from './message-list.vue'
	export default {
		components:{
			'message-list':messagelist
		},
		methods: {
			scrolltolower() {
				this.getList();
			},
			async getNav() {
				await this.http.get('api/app_news/getNav', {}, true).then(result => {
					this.list1 = result
				})
			},
			getList() {
				if (this.page < 0) {
					return;
				}
				this.page++;
				let url = 'api/app_news/getList?newsType=' + this.id + "&page=" + this.page;
				this.http.get(url, {}, false).then(result => {
					result.forEach(item => {
						item.imageUrl = this.http.ipAddress + item.imageUrl;
					})
					if (!result.length) {
						this.page = -1;
					}
					this.list.push(...result);
					this.loading = false;
				})
			}
		},
		async onLoad() {
			let _this = this;
			uni.getSystemInfo({
				success: function(res) {
					_this.height = res.windowHeight - 50;
				}
			});
			await this.getNav();
			if (!this.list1.length) {
				this.loading = false;
				return;
			}
			this.id = this.list1[0].id;
			this.getList();

		},
		data() {
			return {
				id: 0,
				page: 0,
				loading: true,
				height: 0,
				list1: [{
					name: '',
				}, {
					name: '',
				}],
				list: []
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
	}
</style>
