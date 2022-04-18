<template>
	<view :style="{height:height+50+'px'}">
		<u-swiper height="360rpx" :list="swiperList" :radius="0"></u-swiper>
		<view style="padding:20rpx 20rpx 0 20rpx">
			<vol-alert type="primary">
				<view>1、VOL移动端基于uniapp、uview开发。</view>
				<view>2、移动端与PC端同样自动控制权限。</view>
				<view>3、移动端代码完全由代码生成器生成。</view>
				<view>4、移动端与PC端同一套后台接口,开发方式不变。</view>
				<view>5、移动端同样viewgrid、volform、voltable组件</view>

			</vol-alert>
		</view>
		<view class="card-container">
			<view class="fn-title">基础功能</view>
			<u-grid :border="false" @click="gridClick" col="4">
				<u-grid-item v-for="(item,index) in fn" :key="index">
					<image style="width:90rpx;height: 90rpx;" :src="item.icon"></image>
					<!-- <u-icon :customStyle="getStyle(item)" :name="item.icon" :size="22"></u-icon> -->
					<view class="grid-text">{{item.name}}</view>
				</u-grid-item>
			</u-grid>
		</view>
		<vol-tabbar :index="0"></vol-tabbar>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				height: 0,
				swiperList: [
					'/static/swiper1.png',
					'/static/swiper2.png',
					'/static/swiper3.png'
				],
				fn: [{
						name: "菜单",
						icon: '/static/imgs/menu.png',
						path: "/pages/menu/menu"
					},
					{
						name: "表单",
						icon: '/static/imgs/stat.png',
						path: "/pages/form/form"
					},
					{
						name: "消息",
						icon: '/static/imgs/message.png',
						path: "/pages/message/message"
					},
					{
						name: "我的",
						icon: '/static/imgs/user.png',
						path: "/pages/user/user",
					}
				],
			}
		},
		onLoad() {
			var _this = this;
			// 获取手机状态栏高度
			uni.getSystemInfo({
				success: function(data) {
					// 将其赋值给this
					_this.height = data.statusBarHeight;
				}
			})
		},
		onShow() {
			uni.hideTabBar({
				animation: false
			})
		},
		methods: {
			getStyle(item) {
				return {
					paddingTop: 20 + 'rpx',
					background: item.color,
					padding: '50%',
					color: "#ffff",
					'border-radius': '50%',
					left: '-24rpx'
				}
			},
			gridClick(index) {
				uni.switchTab({
					url:this.fn[index].path
				})
			},
			swiperClick(index) {

			}
		}
	}
</script>
<style lang="less" scoped>
	.card-container {
		box-shadow: 1px 1px 9px #efefef;
		margin: 20rpx;
		border: 1px solid #f1f1f1;
		border-radius: 10rpx;
		padding: 20rpx 4rpx;

		.fn-title {
			font-size: 28rpx;
			color: #8f9ca2;
			padding: 4rpx 0 30rpx 20rpx;
		}

		.grid-text {
			padding-top: 8rpx;
			font-size: 26rpx;
		}

	}
</style>
