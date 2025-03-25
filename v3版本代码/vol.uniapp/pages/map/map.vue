<template>

	<view class="page-section page-section-gap">
		<map :enable-satellite="satellite" id="w-map" @controltap="controltap" @markertap="markertap"
			:show-compass="true" :show-scale="true" :scale="scale" :controls="controls"
			:style="{height:nintyPercentScreenHeight,width:'750rpx'}" :latitude="latitude" :longitude="longitude"
			:markers="covers">
		</map>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				scale: 15,
				id: "w-marker-map", // 使用 marker点击事件 需要填写id
				title: 'map',
				longitude:116.38,
				latitude: 39.87,
				satellite: false, //是否开启卫星图	
				covers: [
					{
						id: 100,
						longitude:116.38,
						latitude: 39.87,
						iconPath: "/static/location-2.png",
					},
					{
						id: 200,
						longitude:116.38,
						latitude: 39.8622,
						iconPath: "/static/location-1.png",
					}
				],
				phoneHeight: 1200,
				phoneWidth: 0,
				controls: [],

			}
		},
		onLoad(option) {
			this.latitude = option.latitude;
			this.longitude = option.longitude


		},
		onReady() {
			uni.getSystemInfo({
				success: (res) => {
					this.phoneHeight = res.windowHeight;
					this.phoneWidth = res.windowWidth
				}
			});
		},
		computed: { //计算
			nintyPercentScreenHeight() { //百分之九十的屏幕高
				if (this.phoneHeight !== '' && this.phoneWidth !== '') {
					return 750 / (this.phoneWidth) * (this.phoneHeight) + 'rpx'
				} else {
					return '1250rpx'
				}
			},
		},
		methods: {

			scaleMinus() {
				if (this.scale < 3) {
					return;
				}
				this.scale = this.scale - 1;
			},
			scalePlus() {
				if (this.scale > 18) {
					return;
				}
				this.scale = this.scale + 1;
			},
			toLocation() {
				//this.scale=this.scale-1;
				uni.createMapContext("w-map", this).moveToLocation({
					longitude: this.longitude,
					latitude: this.latitude
				});
			},
			openMap() {
				console.log(this.detail)
				console.log(this.detail.latitude)
				uni.openLocation({
					// 传入你要去的纬度
					latitude: this.detail.latitude,
					// 传入你要去的经度
					longitude: this.detail.longitude,
					// 传入你要去的地址信息 不填则为空
					address: this.detail.title,
					// 缩放大小
					scale: 13,
					success: function() {
						console.log('成功的回调success');
					}
				});
				return;

			},
			controltap(e) {

			}
		}
	}
</script>

<style scoped lang="less">
	.bottom {
		background: #EEEEEE;
		height: 40%;
		width: 100%;
		position: fixed;
		bottom: 0;
		z-index: 99999;
	}

	.controls {
		position: absolute;
		width: 60rpx;
		z-index: 999999;
		right: 26rpx;
		bottom: 180rpx;

		.scale {
			background: #FFFFFF;
			text-align: center;
			border-radius: 10rpx;
			margin-bottom: 30rpx;

			.minus,
			.plus {
				font-size: 48rpx;
				color: #3a3a3a;
			}
		}
	}

	.vol-action-sheet-select-title {
		padding: 15px;
		font-weight: bold;
		text-align: center;
		border-bottom: 1px solid #f5f5f5;
	}

	.map-type {
		// position: absolute;
		position: fixed;
		z-index: 9999;
		background: #FFFFFF;
		border-radius: 4px;
		padding: 5px;
		top: 10px;
		left: 10px;
		display: flex;
		flex-direction: initial;
		// #ifdef H5
		top: 60px;
		// #endif
	}

	.map-text {
		font-size: 13px;
		padding: 1px 5px;
		color: #6c6c6c;
	}

	.actived {
		color: #0698e1;
	}

	.river-list {
		display: flex;
		padding: 20rpx 32rpx;
		border-bottom: 1px solid #f3f3f3;
		color: #464646;

		.left {
			flex: 1;
		}

		.small {
			font-size: 24rpx;
			color: #acacac;
			padding-top: 10rpx;
		}

		.icon {
			// width: 100px;
		}
	}

	.h-list {
		margin-top: 12rpx;
		padding: 0 12rpx;
		// padding-bottom: 73px;
		//	display: inline-block;
		//	width: 100%;

		// padding-bottom: ;
		// width: 100%;
		.h-list-item {
			padding: 12rpx;
			padding-top: 0;
			box-sizing: border-box;
			margin-bottom: 12rpx;
			display: flex;
			// box-shadow: 2px 4px 9px #f0f0f0;
			// float: left;
			// width: 50%;
			// flex-direction: column;
			// padding-bottom: 0;
			background: #ffff;
		}

		.h-list-item-img {
			padding-top: 10rpx;
			// width: 260rpx;
		}

		.h-list-content {
			padding: 14rpx 24rpx;
			display: flex;
			flex-direction: column;
			// font-size: 28rpx;
			flex: 1;
		}

		.h-list-title {
			line-height: 1.1;
			overflow: hidden;
			text-overflow: ellipsis;
			display: -webkit-box;
			-webkit-line-clamp: 2;
			-webkit-box-orient: vertical;
		}

		.h-list-line {
			flex: 1;
			// margin: 10rpx;
			// border-bottom: 1px solid #f7f7f7;
			// padding-top: 12rpx;

		}

		.h-list-attr {
			font-size: 24rpx;
			color: #9d9d9d;
			padding: 14rpx 0;

		}

		.h-list-tag {
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
		}

		.h-list-tag-item {
			background: #e8f8ff;
			font-size: 12px;
			color: #44a1f9;
			padding: 1px 3px 2px 3px;
			margin-right: 3px;
			border-radius: 3px;

		}

		.h-list-bottom {
			font-size: 26rpx;
			display: flex;
			color: #565454;

			.price {
				text-align: right;
				flex: 1;
			}

			.num {
				color: #e10000;
				font-size: 30rpx;
				margin-right: 8rpx;
				font-weight: bolder;
			}
		}
	}
</style>
