<template>
	<view>
		<view-grid ref="grid" :index="true" :options="options">
			<!-- 自定义slot -->
			<view @click="viewClick" slot="gridHeader" class="grid-header">
				<vol-alert>
					<view>1、移动端同样支持编辑/新建/查询数据源自动绑定。</view>
					<view>2、开发与配置方式与PC端相同,都由代码生成器完成。</view>
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
		onShow() {
		},
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
