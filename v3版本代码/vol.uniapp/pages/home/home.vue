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
						<view :class="['grid-item-bg','grid-item-bg-'+(index+1)]">
							<image style="width:50rpx;height: 50rpx;" :src="item.icon"></image>
						</view>

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
						name: "审批流程",
						icon: '/static/flow.png',
						path: "/pages/flow/flow",
						subPage: false //二级页面
					}, {
						name: "表单示例",
						icon: '/static/form.png',
						path: "/pages/form/form",
						subPage: true //二级页面
					},
					{
						name: "Table组件",
						icon: '/static/fc.png',
						path: "/pages/form/form",
						subPage: true //二级页面
					},
					{
						name: "菜单列表",
						icon: '/static/table.png',
						path: "/pages/menu/menu",
						subPage: false //二级页面
					},

					{
						name: "地图导航",
						icon: '/static/fc.png',
						path: "/pages/map/map",
						subPage: true //二级页面
					},
					//待开发功能
					{
						name: "敬请期待",
						icon: '/static/fc.png',
						path: "",
					},
					{
						name: "敬请期待",
						icon: '/static/fc.png',
						path: "",
					},
					{
						name: "敬请期待",
						icon: '/static/fc.png',
						path: "",
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
				const item = this.fn[index];
				if (!item.path) {
					return;
				}
				//注意下面的跳转方式，一级页面指pages.json中tabBar配置path
				//具体见uni页面跳转文档
				if (item.subPage) {
					//二级页面用navigateTo跳转
					uni.navigateTo({
						url: this.fn[index].path
					})
					return;
				}
				//一级页面
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
		padding: 26rpx 10rpx 14rpx 10rpx;
		background: #ffff;


		.fn-title {
			font-family: 黑体;
			font-size: 30rpx;
			font-weight: bold;
			//color: #8f9ca2;
			padding: 4rpx 20rpx 30rpx 20rpx;
		}

		.grid-text {
			padding-top: 8rpx;
			font-size: 26rpx;
			color: #626262;
			padding-bottom: 20rpx;
		}

	}

	.grid-item-bg {
		border-radius: 50%;
		width: 86rpx;
		height: 86rpx;
		display: flex;
		align-items: center;
		justify-content: center;
		box-shadow: 5px 3px 6px #e0ddddb0;
	}

	.grid-item-bg-1 {
		background-image: linear-gradient(to bottom right, #97caff, #47a1fe);
	}

	.grid-item-bg-2 {
		background-image: linear-gradient(to bottom right, #f8bcbc, #f07e7e);

	}

	.grid-item-bg-3 {
		background-image: linear-gradient(to bottom right, #afb5e6, #808cf0);
	}

	.grid-item-bg-4 {

		background-image: linear-gradient(to bottom right, #98e4e2, #56c3bf);
	}

	.grid-item-bg-5 {
		background-image: linear-gradient(to bottom right, #d1d1d1, #c878e7);
	}

	.grid-item-bg-6 {
		background-image: linear-gradient(to bottom right, #97caff, #47a1fe);
	}

	.grid-item-bg-7 {
		background-image: linear-gradient(to bottom right, #98e4e2, #56c3bf);

	}

	.grid-item-bg-8 {
		background-image: linear-gradient(to bottom right, #afb5e6, #808cf0);

	}
</style>
