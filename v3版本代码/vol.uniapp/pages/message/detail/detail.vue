<template>
	<view style="padding: 20rpx;">
		<u-skeleton rows="15" :loading="loading" :title="false">
			<view class="title">{{data.title}}</view>
			<view class="sm-text"><text class="user">{{data.creator}}</text>{{data.createDate}}</view>
			<u-parse :content="data.content"></u-parse>

			<view style="height: 20rpx;"></view>
		</u-skeleton>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				loading: true,
				data: {}
			}
		},
		methods: {

		},
		onLoad(option) {
			uni.setNavigationBarTitle({
				title: option.title
			})
			this.http.get("api/app_news/getDetail?id=" + option.id, {}, false).then(result => {
				this.data = result;
				this.loading = false;
			})
		}
	}
</script>

<style scoped>
	.title {
		font-weight: bolder;
	}

	.sm-text {
		padding: 20rpx 0 5rpx 0;
		font-size: 26rpx;
		color: #8f8f8f;
	}

	.user {
		margin-right: 40rpx;
	}
</style>
