<template>
	<view class="form-test">
		<vol-alert>
			<view>vol-form封装了事件绑定、下拉框自动绑定数据源、级联组件、多选、单选、日期、日期范围选择等常用组件操作,见form2.vue文件</view>
		</vol-alert>
		<vol-form @input-confirm="inputConfirm" @extraClick="extraClick" @onChange="onChange" :load-key="true"
			ref="form" :form-options.sync="editFormOptions" :formFields.sync="editFormFields">
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
				test: {
					a: 1,
					b: 2
				},
				editFormFields: {
					inputText: "",
					inputText2: "",
					customInput: "",
					textarea: "这里的文字有点长文字有点长。。",
					pwd: "12345",
					readonlyText: "只读输入框",
					cascader1: null,
					cascader2: null,
					cascader3: '004',
					selectVal: "",
					selectListVal: [], //多选这里的值是数组 
					dateValue: this.base.getDate(), //设置默认日期为当天
					datetimeValue: "2022-03-27 20:15",
					dateRange: ["2022-03-10", "2022-06-20"], //数组 
					inputRange: [100000000, 900000000], //区间是数组


					province: "北京市,北京市,海淀区", //省市区县值必须以逗号隔开

					inputDecimal: null, //小数
					inputNumber: null, //数字
					switchValue: 1,
					radioVal: null, //单选
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
					},

					{
						"title": "自定义按钮",
						"field": "customInput",
						extra: {
							style: "background: #00aaff;margin-left:16rpx;border-radius: 30rpx;font-size: 24rpx;padding: 4rpx 16rpx;color: #ffff;",
							text: "按钮",
							icon: "map",
							color: "#ffff",
							size: 12
						}
					},
					{
						type: "group", //表单分组
						style: "margin-top: 10px;font-weight: 500;font-size: 26rpx;color: #848383;",
						title: "选中输入框,键盘点击搜索或者扫描枪扫描触发回车事件"
					},
					{
						"title": "回车事件",
						"required": false,
						"field": "inputText2"
					},
					{
						"title": "表单字段定义按钮及点击事件,示例见form2.vue",
						style: "padding-left:16rpx;font-weight: 500;color: #9e9e9e;font-size: 26rpx;",
						type: "group"
					},
					{
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
						type: "group", //表单分组
						style: "margin-top: 10px;font-weight: 500;font-size: 26rpx;color: #848383;",
						title: "省市区县type设置city(2023.03.20更新components文件夹)"
					},
					{
						"title": "省市区县",
						"field": "province",
						type: "city" //type必须为city
					},
					{
						type: "group", //表单分组
						style: "margin-top: 10px;font-weight: 500;font-size: 26rpx;color: #848383;",
						title: "设置checkStrictly=true,只能选择最后一级节点"
					},
					{
						"title": "树形级联",
						"field": "cascader1",
						type: "cascader",
						"required": true,
						checkStrictly: true, //是否只能选择最后一个节点,默认可以选择任意节点
						data: [],
						key: "tree_roles"
					},

					{
						type: "group", //表单分组
						style: "margin-top: 10px;font-weight: 500;font-size: 26rpx;color: #848383;",
						title: "设置checkStrictly=false,可以选择任意节点"
					},
					{
						"title": "树形级联2",
						"field": "cascader2",
						type: "cascader",
						"required": true,
						checkStrictly: false, //是否只能选择最后一个节点,默认可以选择任意节点
						data: [],
						key: "tree_roles"
					},

					{
						type: "group", //表单分组
						style: "margin-top: 10px;font-weight: 500;font-size: 26rpx;color: #848383;",
						title: "自定义级联data数据源，格式见：form2.vue文件"
					},
					{
						"title": "自定义级联",
						"field": "cascader3",
						type: "cascader",
						"required": true,
						checkStrictly: false, //是否只能选择最后一个节点,默认可以选择任意节点
						data: [{
							id: "001",
							parentId: null,
							name: "一级节点"
						}, {
							id: "002",
							parentId: "001",
							name: "二级节点"
						}, {
							id: "003",
							parentId: null,
							name: "三级节点"
						}, {
							id: "004",
							parentId: "003",
							name: "四级节点"
						}]
					},
					{
						type: "group", //表单分组
						style: "margin-top: 10px;font-weight: 500;font-size: 26rpx;color: #848383;",
						title: "下拉框绑定"
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
						type: "group", //表单分组
						style: "margin-top: 10px;font-weight: 500;font-size: 26rpx;color: #848383;",
						title: "日期设置min与max属性限制选择范围"
					},
					{
						"title": "日期",
						"required": true,
						"type": "date",
						"field": "dateValue",
						//设置时间选择范围，如果日期是datetim类型，时间后面加上时分秒
						//2023.04.02更新util->common.js才能使用获取日期的方法
						// min:'2023-04-01',
						// max:'2023-07-02'

						//设置只能选择半个月内的数据
						min: this.base.addDay(this.base.getDate(), -15),
						max: this.base.getDate()
					},
					{
						"title": "日期时分秒",
						"type": "datetime",
						"field": "datetimeValue"
					},
					{
						"title": "日期范围",
						"type": "date",
						range: true, //区间输入
						"field": "dateRange"
					},
					{
						"title": "区间输入",
						"type": "decimal", //number数字，text文本输入
						range: true, //区间输入
						"field": "inputRange"
					},
					{
						type: "group", //表单分组
						style: "margin-top: 10px;font-weight: 500;font-size: 26rpx;color: #848383;",
						title: "只能输入小数与整数(在手机上查看)"
					},
					{
						"title": "小数",
						"type": "decimal",
						field: "inputDecimal" //只能输入小数

					},
					{
						"title": "整数",
						"type": "number",
						field: "inputNumber" //只能输入数字 
					},
					{
						type: "group" //表单分组
					},
					//placement
					{
						type: "group", //表单分组
						style: "margin-top: 10px;font-weight: 500;font-size: 26rpx;color: #848383;",
						title: "单选添加事件,并隐藏【单选】字段"
					},
					{
						"title": "是否值",
						"type": "switch",
						"field": "switchValue"
					},

					{
						"title": "单选",
						"type": "radio",
						data: [],
						key: "pn",
						placement:'row',//布局方式，row横向，column纵向	,具体见uvivew文档
						//placement:"column",	
						"field": "radioVal"
					},
					//placement
					{
						type: "group", //表单分组
						style: "margin-top: 10px;font-weight: 500;font-size: 26rpx;color: #848383;",
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
						//readonly:true,//设置图片只读
						"url": "api/sys_user/upload", //后台框架自带的上传方法，如果涉及权限问题，请参照后台开发文档上重写权限来重写upload方法的权限
						"multiple": true, //从图上传
						"maxCount": 3, //最多只能上传3张图片
						"field": "imgs"
					},
				],
			}
		},
		methods: {
			extraClick(item) {
				//点击后给表字段设置值
				this.editFormFields.customInput = ~~(Math.random() * 10000000)
				this.$toast('表单按钮点击:' + item.title)
			},
			onChange(field, value, item, data) { //日期与下拉框选择事件
				if (field == "selectClickValue" || field == "dateClickValue") {
					this.$toast(`选择字段${field}值${value}`)
					return;
				}
				if (field == 'switchValue') {
                    //获取单选字段配置
					let op = this.editFormOptions.find(c => {
						return c.field == 'radioVal'
					});
					//选择是时，隐藏【单选】字段
					this.$set(op, 'hidden', value + '' === "1")
					return;
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
			},
			inputConfirm(field, e) {
				this.$toast(`字段${field}回车事件`)
				console.log(field)
			}
		},
		onShow() {

		},
		onReady() {
			//设置表单默认值请写在onReady中
			this.editFormFields.inputText = 'vol框架';
		},
		onLoad() {

		}
	}
</script>

<style lang="less" scoped>
	.form-test {
		height: auto;
		margin-top: -20rpx;
		background: #f6f6f6;
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
