<template>
	<view class="audit-container">
		<!-- 	这里同样直接复制不用修改 -->
		<view class="audit-form">
			<view style="font-weight: bolder;padding: 20rpx;">订单信息</view>
			<vol-form ref="form" :form-options.sync="formOptions" :formFields.sync="formFields">
			</vol-form>
		</view>
		<view class="audit-action">
			<!-- 6、显示审批操作（直接复制）,2022.09.26之前的代码需要更新components文件架3 -->
			<vol-audit ref="audit"></vol-audit>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				//4、配置当前表要显示的字段
				formFields: {
					"AuditStatus": "",
					"AuditDate": "",
					"OrderType": "",
					"TranNo": "",
					"Qty": "",
					"SellNo": ""
				},
				//5、配置当前显示表单参数，可以直接从生成的SellOrderOptions.js页面将editFormFields与editFormOptions复制过来
				formOptions: [{
						"key": "ordertype",
						"data": [],
						readonly: true,
						"title": "订单类型",
						"field": "OrderType",
						"type": "select"
					},
					{
						"title": "运单号",
						readonly: true,
						"field": "TranNo"
					},
					{
						"title": "销售数量",
						"field": "Qty",
						readonly: true
					},
					{
						"title": "销售订单号",
						"field": "SellNo",
						readonly: true
					},
					{
						"key": "audit",
						"data": [],
						"title": "审核状态",
						"field": "AuditStatus",
						readonly: true
					},
					{
						"title": "审核时间",
						"field": "AuditDate",
						readonly: true
					},
				]
			}
		},
		methods: {},
		onLoad(options) {
			//7、配置查询条件Order_Id改为实际表的主键字段
			let wheres = [{
				name: "Order_Id",
				value: options.orderId
			}]
			let params = {
				page: 1,
				rows: 30,
				wheres: JSON.stringify(wheres)
			};
			//7、调用后台接口返回数据，将SellOrder改为当前表名
			this.http.post('api/SellOrder/getPageData', params, true).then(result => {
				if (!result.rows.length) {
					this.$toast('未查到数据')
					return;
				}
				Object.assign(this.formFields, result.rows[0]);
				//获取审批信息
				this.$nextTick(() => {
					//第一个参数为当前表的主键字段的值(SellOrderOptions.js执行跳转的时候已经传进来了)
					//第二个参数当前操作的表名
					this.$refs.audit.load(options.orderId, 'SellOrder');
				})
			})
		}
	}
</script>

<style lang="less" scoped>
	.audit-container {
		position: absolute;
		height: 100%;
		width: 100%;
		overflow-y: scroll;
		background: #f9f9f9;
		padding: 20rpx;
		box-sizing: border-box;

		.audit-form,
		.audit-action {
			border-radius: 5px;
			background: #ffff;
		}
	}
</style>
