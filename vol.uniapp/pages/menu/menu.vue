<template>
	<view>
		<u-empty v-if="!menu.length" text=" " mode="search" icon="http://cdn.uviewui.com/uview/empty/search.png">
		</u-empty>
		<view  v-if="menu.length" class="menu-container">
			<view class="menu-left">
				<view @click="itemClick(item,index)" class="menu-item" :class="{'menu-item-select':selectIndex===index}"
					:key="index" v-for="(item,index) in getMenu()">{{item.name}}</view>
					<view style="height:52px;"></view>
			</view>
			<view class="menu-right">
				<view @click="menuClick(item,index)" class="menu-right-item" v-for="(item,index) in rightData"
					:key="index">
					<view class="text">
						{{item.name}}
					</view>
					<view class="r-icon">
						<u-icon name="arrow-right" color="rgb(221 221 208)" size="16"></u-icon>
					</view>
				</view>
			</view>

		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				selectIndex: 0,
				menu: [],
				rightData: []
			}
		},
		onLoad() {
			let menu = this.$store.getters.getMenu();
			if (menu.length) {
				return this.menu = menu;
			}
			this.http.get("api/menu/getTreeMenu", {}, false).then(result => {
				this.menu = result;
				if (this.menu.length) {
					this.itemClick(this.getMenu()[0], 0);
				}
				this.$store.commit("setPermission", result);
			})
		},
		onShow() {
		},
		methods: {
			getMenu() {
				return this.menu.filter(c => {
					return !c.parentId
				})
			},
			itemClick(item, index) {
				this.selectIndex = index;
				this.rightData = this.menu.filter(x => {
					return x.parentId == item.id
				});
			},
			menuClick(item, index) {
				let path=item.path||item.url;
				if (path) {
					if(path[0]!='/'){
						path='/'+path;
					}
					uni.navigateTo({
						url: path
					})
				}
			}
		}
	}
</script>

<style lang="less" scoped>
	.menu-container {
		display: flex;
		height: 100%;
		overflow: hidden;

		.menu-left {
			overflow: scroll;
			width: 200rpx;
			background-color: #f7f8fa;
			border-right: 1px solid #f7f8fa;
			height: 100%;

			.menu-item {
				position: relative;
				display: block;
				box-sizing: border-box;
				padding: 34rpx 16rpx;
				overflow: hidden;
				color: #323233;
				font-size: 28rpx;
				line-height: 36rpx;
				background-color: #f7f8fa;
				user-select: none;
				overflow: hidden;
				text-overflow: ellipsis;
				white-space: nowrap;
			}

			.menu-item-select {
				background: white;

			}

			.menu-item-select:before {
				position: absolute;
				top: 50%;
				left: 0;
				width: 8rpx;
				height: 34rpx;
				background-color: #007ef3;
				-webkit-transform: translateY(-50%);
				transform: translateY(-50%);
				content: '';
			}
		}

		.menu-right {
			overflow: scroll;
			flex: 1;
			width: 0;
			margin-bottom: 53px;

			// display: flex;
			.menu-right-item {
				padding: 30rpx 30rpx 30rpx 50rpx;
				color: #727272;
				font-size: 28rpx;
				border-bottom: 1px solid #f3f3f3;
				display: flex;

				.text {
					flex: 1;
				}

				.r-icon {
					width: 30rpx;
				}
			}
		}
	}
</style>
