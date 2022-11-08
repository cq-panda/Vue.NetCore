<template>
	<view style="background: #fbfbfb;">
		<view class="user-info">
			<image class="u-img" @error="onHeaderError()" :src="userInfo.img"></image>
			<view class="u-text">
				<view>{{userInfo.userName}}</view>
				<view class="small-text">
					缘起缘灭，花开花谢。
				</view>
			</view>
			<view class="u-icon-setting" @click="toUserInfo">
				<u-icon name="arrow-right" color="rgb(227 227 227)" size="18"></u-icon>
			</view>
		</view>
		<view class="u-menu-list">
			<view class="u-menu-item" @click="itemClick(item)" v-for="(item,index) in menu" :key="index">
				<view class="u-menu-icon">
					<u-icon :name="item.icon" color="#303133" size="15"></u-icon>
				</view>
				<view class="u-menu-text">{{item.name}}</view>
				<view class="u-menu-icon-rigth">
					<u-icon name="arrow-right" color="rgb(231 231 231)" size="15"></u-icon>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				height: 50,
				userInfo: {
					img: "/static/imgs/head.png",
					userName: "请登陆"
				},
				menu: [{
						name: "关于vol",
						path: '/pages/user/about/about',
						icon: 'error-circle',
						color: ''
					},
					// {
					// 	name: "意见反馈",
					// 	path: '',
					// 	icon: 'question-circle',
					// 	color: ''
					// },
					{
						name: "修改密码",
						path: '',
						icon: 'lock-open',
						color: '',
						path: "/pages/user/modifyPwd/modifyPwd"
					},
					// {
					// 	name: "系统设置",
					// 	path: '',
					// 	icon: 'setting',
					// 	color: ''
					// },
					{
						name: "退出登陆",
						path: '/pages/login/login',
						icon: 'account',
						color: ''
					},
				]
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
			this.getUserInfo();
		},
		methods: {
			getUserInfo() {
				this.http.post("api/user/getCurrentUserInfo", {}).then(x => {
					//x.data.gender = x.data.gender;
					//  this.$refs.form.reset(x.data);
					this.userInfo.img = this.http.ipAddress+x.data.headImageUrl
					//this.userInfo.createDate = x.data.createDate;
					this.userInfo.userName = x.data.userTrueName;
					//this.userInfo.phoneNo = x.data.phoneNo;
					//this.userInfo.email = x.data.email;
				});
			},
			onHeaderError() {
				this.userInfo.img = "/static/imgs/head.png";
			},
			test() {
				this.http.get("api/menu/getTreeMenu", {}, false).then(result => {
					console.log(result)
				})
			},
			toUserInfo(){
				uni.navigateTo({
					url: '/pages/user/modifyPwd/modifyPwd'
				})
			},
			itemClick(item) {
				if (!item.path) {
					return;
				}
				if (item.path == "/pages/login/login") {
					this.$store.commit("clearUserInfo");
					uni.reLaunch({
						url: item.path
					})
					return;
				}
				uni.navigateTo({
					url: item.path
				})

			}
		}
	}
</script>

<style lang="less" scoped>
	.user-info {
		height: 220rpx;
		display: flex;
		padding: 150rpx 40rpx 10rpx 60rpx;
		background-image: linear-gradient(135deg, #26bcff 10%, #078ef9);
		position: relative;

		.u-img {
			width: 150rpx;
			height: 150rpx;
			border-radius: 50%;
			border: 2rpx solid #FFFFFF;
		}

		.u-text {
			flex: 1;
			color: #FFFFFF;
			padding: 26rpx 30rpx;
		}

		.small-text {
			font-size: 24rpx;
			padding-top: 10rpx;
		}

		.u-icon-setting {
			width: 30rpx;
			color: #FFFFFF;
			padding-top: 50rpx;
		}
	}

	.u-menu-list {
		background: #FFFFFF;
		margin: 20rpx;
		border-radius: 5rpx;
		border: 1px solid #f7f7f7;

		.u-menu-item {
			display: flex;
			padding: 24rpx 20rpx;
			border-bottom: 1px solid #f7f7f7;

			.u-menu-icon {
				padding-top: 8rpx;
				padding-right: 20rpx;
			}

			.u-menu-text {
				flex: 1;
				color: #5e5e5e;
			}

			.u-menu-icon-rigth {
				width: 30rpx;
			}
		}
	}
</style>
