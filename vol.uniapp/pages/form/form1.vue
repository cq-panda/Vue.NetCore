<template>
	<view class="form-test">
		<vol-alert>
			<view>vol-form设置readonly属性只读</view>
		</vol-alert>
		<vol-form  @onChange="onChange" :load-key="true" ref="form" :form-options.sync="editFormOptions"
			:formFields.sync="editFormFields">
		</vol-form>
		
		<vol-alert style="margin-top: 40rpx;">
			<view>标签显示在上方</view>
		</vol-alert>
		<vol-form  labelPosition="top" :load-key="true" ref="form2" :form-options.sync="editFormOptions"
			:formFields.sync="editFormFields">
		</vol-form>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				editFormFields: {
					inputText: "这是必填输入框",
					pwd: "12345",
					selectVal: "--",
					selectListVal: [], //多选这里的值是数组 
					dateValue: "2022-03-27",
					datetimeValue: "2022-03-27 20:15"
				},
				editFormOptions: [{
						"title": "输入框",
						"required": true,
						"field": "inputText",
						readonly: true
					}, {
						"title": "密码框",
						"field": "pwd",
						"type": "password",
						readonly: true
					}, {
						type: "group" //表单分组
					},
					{
						"title": "下拉框",
						"field": "selectVal",
						type: "select",
						"required": true,
						data: [],
						readonly: true,
						key: "pn"
					},
					{
						"title": "多选框",
						"field": "selectListVal",
						type: "selectList",
						"required": true,
						data: [],
						key: "pn",
						readonly: true
					},
					{
						type: "group" //表单分组
					},
					{
						"title": "日期",
						"required": true,
						"type": "date",
						"field": "dateValue",
						readonly: true
					},
					{
						"title": "日期时分秒",
						"type": "datetime",
						"field": "datetimeValue",
						readonly: true
					}
				]
			}
		},
		methods: {

		},
		onShow() {

		}
	}
</script>

<style lang="less" scoped>
	.form-test {
		margin-top: -20rpx;
		background: #fbfbfb;
		padding-top: 20rpx;
	    overflow: scroll;
	}
</style>