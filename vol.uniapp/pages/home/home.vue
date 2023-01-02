<template>
	<view>
		<image style="width: 100%;" mode="widthFix" src="/static/swiper1.png"></image>
		<!-- 	<u-swiper height="360rpx" :list="swiperList" :radius="0"></u-swiper> -->
		<view class="home-content">
			<view class="app-name">vol框架移动端</view>
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
			<view style="padding:30rpx;padding-top:0;">
				<vol-alert type="primary">
					<view>1、VOL移动端基于uniapp、uview开发。</view>
					<view>2、移动端与PC端同样自动控制权限。</view>
					<view>3、移动端代码完全由代码生成器生成。</view>
					<view>4、移动端与PC端同一套后台接口,开发方式不变。</view>
					<view>5、移动端同样viewgrid、volform、voltable组件</view>

				</vol-alert>
			</view>

		</view>


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
		onShow() {},
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
					url: this.fn[index].path
				})
			},
			swiperClick(index) {

			}
		}
	}
</script>
<style lang="less" scoped>
	.home-content {
		z-index: 999;
		position: relative;
		margin-top: -220rpx;
	}

	.app-name {
		text-align: center;
		color: #ffff;
		font-weight: bolder;
		font-size: 60rpx;
		top: -40rpx;
		position: relative;
	}

	.card-container {
	    box-shadow: 1px 1px 9px #b9b6b629;
		margin: 30rpx 30rpx 30rpx 30rpx;
		border: 1px solid #f1f1f1;
		border-radius: 10rpx;
		padding: 40rpx 10rpx;
		background: #ffff;


		.fn-title {
			font-size: 30rpx;
			font-weight: bold;
			//color: #8f9ca2;
			padding: 4rpx 20rpx 30rpx 20rpx;
		}

		.grid-text {
			padding-top: 8rpx;
			font-size: 26rpx;
		}

	}
</style>
