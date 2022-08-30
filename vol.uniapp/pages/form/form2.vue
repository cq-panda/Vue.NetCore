<template>
	<view class="form-test">
		<vol-alert>
			<view>vol-form封装了事件绑定、下拉框自动绑定数据源、多选、单选、日期、日期范围选择等常用组件操作</view>
		</vol-alert>
		<vol-form @onChange="onChange" :load-key="true" ref="form" :form-options.sync="editFormOptions"
			:formFields.sync="editFormFields">
		</vol-form>

		<view class="btns">
			<view class="btn">
				<u-button type="primary" @click="reset" shape="circle" text="重置表单"></u-button>
			</view>
			<view class="btn">
				<u-button type="success" @click="vailForm" shape="circle" text="校验表单"></u-button>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				editFormFields: {
					inputText: "这是必填输入框",
					textarea: "这里的文字有点长这里的文字有点长这里的文字有点长。。",
					pwd: "12345",
					readonlyText: "只读输入框",
					selectVal: "",
					selectListVal: [], //多选这里的值是数组 
					dateValue: "2022-03-27",
					datetimeValue: "2022-03-27 20:15",
					dateRange: ["2022-03-10", "2022-06-20"], //数组 
					switchValue: 1,
					selectClickValue: "",
					dateClickValue: null,
					imgs: [{
						url: "http://api.volcore.xyz/Upload/Tables/Sys_User/202006191408112343/1111s.jpg"
					}, {
						url: "http://api.volcore.xyz/Upload/Tables/App_News/202204201140571762/20-05.png"
					}]
				},
				editFormOptions: [{
						"title": "输入框",
						"required": true,
						"field": "inputText"
					}, {
						"title": "多文本",
						"field": "textarea",
						type: "textarea"
					}, {
						"title": "密码框",
						"field": "pwd",
						"type": "password"
					},
					{
						"title": "只读框",
						"field": "readonlyText",
						"type": "text",
						readonly: true
					},
					{
						type: "group" //表单分组
					},
					{
						"title": "下拉框",
						"field": "selectVal",
						type: "select",
						"required": true,
						data: [],
						key: "pn"
					},
					{
						"title": "多选框",
						"field": "selectListVal",
						type: "selectList",
						"required": true,
						data: [],
						key: "pn"
					},
					{
						type: "group" //表单分组
					},
					{
						"title": "日期",
						"required": true,
						"type": "date",
						"field": "dateValue"
					},
					{
						"title": "日期时分秒",
						"type": "datetime",
						"field": "datetimeValue"
					},
					{
						"title": "日期范围",
						"type": "date",
						range: true,
						"field": "dateRange"
					}, {
						type: "group" //表单分组
					},
					{
						"title": "单选",
						"type": "switch",
						"field": "switchValue"
					},
					{
						type: "group", //表单分组
						title: "注册选择事件,见onChange方法说明"
					},
					{
						"title": "下拉框事件",
						"type": "select",
						"field": "selectClickValue",
						data: [],
						key: "pn"
					},
					{
						"title": "日期事件",
						"type": "date",
						"field": "dateClickValue"
					}, {
						type: "group" //表单分组
					},
					{
						"title": "图片上传",
						"type": "img",
						"url":"api/sys_user/upload",//后台框架自带的上传方法，如果涉及权限问题，请参照后台开发文档上重写权限来重写upload方法的权限
						"multiple": true, //从图上传
						"maxCount": 3, //最多只能上传3张图片
						"field": "imgs"
					},
				],
			}
		},
		methods: {
			onChange(field, value) { //日期与下拉框选择事件
				if (field == "selectClickValue" || field == "dateClickValue") {
					this.$toast(`选择字段${field}值${value}`)
				}
			},
			vailForm() {
				if (this.$refs.form.validate()) {
					this.$toast("表单校验成功")
				}
			},
			reset() {
				this.$refs.form.reset();
				this.$toast("表单已重置")
			}
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
	}

	.btns {
		display: flex;
		padding: 0rpx 20rpx;

		.btn {
			flex: 1;
			padding: 20rpx;
		}
	}
</style>
