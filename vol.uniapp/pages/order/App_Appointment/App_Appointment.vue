<template>
	<view>
		<view-grid ref="grid" @testBtnClick="testBtnClick" :index="true" :options="options">
			<!-- 自定义slot -->
			<view slot="gridHeader" class="grid-header">
				<vol-alert>
					<view>1、页面由代码生成器生成,自动控制前后端权限</view>
					<view>2、当前页面在后台菜单上配置的只读不能添加与修改</view>
					<view>3、点击搜索框扫描图标可以扫描搜索</view>
					<view>4、示例代码见App_Appointment.vue文件</view>
					<view>5、点击列表数据,弹出框中也有扫一扫示例</view>
				</vol-alert>
				<view style="padding: 20rpx;border-bottom: 1px solid #f5f3f3;">
					<u-search @search="searchInputClick" @custom="searchInputClick" placeholder="请输入电话搜索"
						:showAction="true" actionText="搜索" searchIcon="scan" @clickIcon="scanClick" :animation="false"
						v-model="searchText">
					</u-search>
				</view>
			</view>
		</view-grid>
	</view>
</template>

<script>
	//************************************************
	//  *Author：jxx
	//  *QQ：283591387
	//  *自定义业务逻辑扩展
	//************************************************
	import extend from './App_AppointmentExtend.js'
	import options from './App_AppointmentOptions.js';
	let _options = options();
	_options.extend = extend;
	export default {
		data() {
			return {
				searchText: "",
				options: _options,
				show: false,
				row: {}
			}
		},
		onShow() {},
		methods: {
			scanClick() {
				//扫一扫点击事件
				uni.scanCode({
					success: (res) => {
						this.searchText = res.result;
						this.searchInputClick();
					}
				})
			},
			testBtnClick(){
				 this.$toast('测试按钮');
			},
			searchInputClick() { //点击搜索
				//生成页面的搜索功能，见App_AppointmentExtend.js中searchInputClick操作
				this.$refs.grid.searchInputClick(this.searchText);
			},
		}
	}
</script>

<style>
</style>
