<template>
	<view>
		<view-grid ref="grid" :index="true" :options="options">
			<!-- 自定义slot -->
			<view @click="viewClick" slot="gridHeader" class="grid-header">
				<vol-alert>
					<view>1、移动端同样支持编辑/新建/查询数据源自动绑定。</view>
					<view>2、开发与配置方式与PC端相同,都由代码生成器完成。</view>
					<view>3、[城市]字段省市区县选择</view>
					<view>4、2023.03.20更新components文件夹后才能使用</view>
					<view>5、省市区县见App_TransactionAvgPriceExtend.js</view>
				</vol-alert>
			</view>

			<view slot="searchHeader">
				<vol-alert>
					<view>页面已增加省市区县选择</view>
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
	import extend from './App_TransactionAvgPriceExtend.js'
	import options from './App_TransactionAvgPriceOptions.js';
	let _options = options();
	_options.extend = extend;
	export default {
		data() {
			return {
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
