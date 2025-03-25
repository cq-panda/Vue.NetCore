<template>
	<view>
		<view-grid ref="grid" @delTest="delTest" :index="true" :options="options">
			<view slot="gridHeader" class="grid-header">
				{{gridHeaderText}}
				<vol-alert>
					<view>1.设置direction属性改变数据显示方向</view>
					<view>2.此示例包括:列隐藏,自定义超链接,自定义列点击事件</view>
					<view>3.见App_Appointment1.vue/.js文件</view>
				</vol-alert>
			</view>
		</view-grid>

		<u-modal title="提示" @cancel="show=false" width="500rpx" @confirm="confirm" showCancelButton showConfirmButton
			confirmColor="red" :show="show">
			<view style="text-align: center;">确定删除数据吗?</view>
		</u-modal>
	</view>
</template>

<script>
	//************************************************
	//  *Author：jxx
	//  *QQ：283591387
	//  *自定义业务逻辑扩展
	//************************************************
	import extend from './App_AppointmentExtend1.js'
	import options from './App_AppointmentOptions1.js';

	export default {
		data() {
			let _options = options();
			_options.extend = extend;
			return {
				gridHeaderText: "", //随便输入字符后可以显示出来
				options: _options,
				show: false,
				row: {}
			}
		},
		onShow() {},
		methods: {
			delTest(row) {
				this.row = row;
				this.show = true;
			},
			confirm() {
				//这里只是举例。后台的接口都可以自己写
				//删除方法，框架自带，点击行数据弹中会有删除按钮（菜单上需要配置删除按钮），可以看其他页面
				const url = 'api/App_Appointment/del';
				this.http.post(url, [this.row.Id], true).then(result => {
					this.$toast(result.message)
					if (!result.status) {
						return
					}
					//关闭弹框
					this.show=false;
					//删除成功后,调用生成页面的刷新方法
					this.$refs.grid.search();
				})
			}
		}
	}
</script>

<style>
</style>
