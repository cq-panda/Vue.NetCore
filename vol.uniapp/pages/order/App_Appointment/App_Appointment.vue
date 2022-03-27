<template>
	<view>
		<view-grid ref="grid" :index="true" :options="options">
			<!-- 自定义slot -->
			<view @click="viewClick" slot="gridHeader" class="grid-header">
				{{gridHeaderText}}
				<vol-alert>
					<view>1、页面由代码生成器生成,自动控制前后端权限</view>
					<view>2、当前页面在后台菜单上配置的只读不能添加与修改</view>
				</vol-alert>
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
				gridHeaderText: "", //随便输入字符后可以显示出来
				options: _options
			}
		},
		onShow() {},
		methods: {
			viewClick() {
				//获取生成页面grid的对象
				console.log(this.$refs.grid.searchFormFields)
			}
		}
	}
</script>

<style>
</style>
