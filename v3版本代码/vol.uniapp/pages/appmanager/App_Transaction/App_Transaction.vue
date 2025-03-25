<template>
	<view>
		<view-grid ref="grid" :index="true" :options="options">
			<!-- 自定义slot -->
			<view @click="viewClick" slot="gridHeader" class="grid-header">
				<vol-alert>
					<view>1、搜索、编辑或新建弹出框点击下拉框查看效果。</view>
					<view>2、设置columns的align=true内容居左显示。</view>
					<view>3、设置this.ck=true显示checkbox。</view>
					<view>4、示例见:App_TransactionExtend.js文件说明。</view>
				</vol-alert>
			</view>

			<vol-alert slot="search">
				<view>点击【状态】下拉框可监听事件</view>
			</vol-alert>
			<vol-alert slot="edit">
				<view>点击【状态】下拉框给【姓名】随机设置一个值</view>
			</vol-alert>
		</view-grid>
	</view>
</template>

<script>
	//************************************************
	//  *Author：jxx
	//  *QQ：283591387
	//  *自定义业务逻辑扩展
	//************************************************
	import extend from './App_TransactionExtend.js'
	import options from './App_TransactionOptions.js';
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
