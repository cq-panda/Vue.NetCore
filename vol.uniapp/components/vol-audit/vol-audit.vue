<template>
	<view v-if="isLoad">
		<view v-show="hasList" class="audit-title">审批</view>
		<view style="margin-bottom:10px;">
			<vol-form v-show="showBtn" :load-key="false" ref="form" :form-options.sync="formOptions"
				:formFields.sync="formFields">
			</vol-form>
		</view>
		<view v-show="showBtn" class="btn">
			<u-button :disabled="disabled" @click="save" type="primary" shape="circle" icon="edit-pen">审核</u-button>
		</view>
		<view class="v-steps">
			<view :class="{ 'step-current': item.isCurrent }" class="step-item" v-for="(item, index) in workFlowSteps"
				:key="index">
				<view class="left-item">
					<view>审批时间</view>
					<view class="left-date">{{ item.auditDate || '待审批' }}</view>
				</view>
				<view class="right-item">
					<view class="step-line"></view>
					<text class="step-circle"></text>
					<view class="step-title">
						{{ item.stepName }}
					</view>
					<view class="step-text">审批人：{{ item.auditor }}</view>
					<view class="step-text">
						状 态： {{ getAuditStatus(item.auditStatus) }}
					</view>
					<view class="step-text">备 注： {{ item.remark || '-' }}</view>
				</view>
			</view>
		</view>

	</view>
</template>

<script>
	export default {
		data() {
			const auditData = [{
					value: '通过',
					key: 1
				},
				{
					value: '拒绝',
					key: 2
				},
				{
					value: '驳回',
					key: 3
				}
			];
			return {
				hasList: true,
				showBtn: true,
				disabled: false,
				id: undefined,
				tableName: "",
				isLoad: false,
				auditData: auditData,
				formFields: {
					auditStatus: undefined,
					auditReason: "",
				},
				formOptions: [{
					"key": "审批状态",
					"data": auditData,
					require: true,
					"title": "审批状态",
					"field": "auditStatus",
					"type": "select"
				}, {
					"title": "备注",
					"field": "auditReason"
				}],
				workFlowSteps: []
			}
		},
		methods: {
			getAuditStatus(status) {
				let data = this.auditData.find((x) => {
					return x.key == status;
				});
				if (!data) {
					return '-';
				}
				return data.text;
			},
			save() {
				if (!this.formFields.auditStatus) {
					this.$toast('请选择审批状态')
					return;
				}
				if (!this.id) {
					this.$toast('未传入主键id值')
					return;
				}
				if (!this.tableName) {
					this.$toast('未传入表名')
					return;
				}
				this.disabled = true;
				//保存审核
				let keys = [this.id];

				let url =
					`api/${this.tableName}/audit?auditReason=${this.formFields.auditReason}&auditStatus=${this.formFields.auditStatus}`
				this.http.post(url, keys, '审核中....').then((x) => {
					this.$toast(x.message)
					if (!x.status) {
						this.disabled = false;
						return;
					}
					this.showBtn = false;
					this.load(this.id, this.tableName)
				});
			},
			load(id, tableName) {
				this.id = id;
				this.tableName = tableName;
				let url = 'api/Sys_WorkFlow/getSteps?tableName=' + tableName + '&id=' + id;
				this.http.get(url).then(result => {
					this.isLoad = true;
					this.disabled = result.auditStatus != 0;
					result.list = result.list || [];
					this.hasList = result.length;
					this.showBtn = result.list.some(c => {
						return c.isCurrentUser
					})
					result.list.forEach(item => {
						if (item.stepValue == result.step && result.auditStatus === 0) {
							item.isCurrent = true;
						}
					})
					this.workFlowSteps = result.list;
				})
			}
		},
		created() {

		}
	}
</script>

<style lang="less" scoped>
	.audit-title {
		padding: 20rpx;
		margin-top: 20rpx;
		font-weight: bold;
	}

	.btn {
		padding: 36rpx;
	}

	.step-item {
		background: #fff;
		display: flex;
	}

	.left-item {
		min-width: 300rpx;
		text-align: right;
		padding-right: 40rpx;
		padding-top: 16rpx;
	}

	.left-date {
		font-size: 13px;
		padding-top: 7px;
		color: #6c6c6c;
	}

	.right-item {
		cursor: pointer;
		position: relative;
		border-bottom: 1px solid #f3f3f3;
		padding: 5px 0 5px 5px;
	}

	.left-item,
	.right-item {
		padding-bottom: 20rpx;
	}

	.right-item:last-child {
		border-bottom: 0;
	}

	.step-line {
		top: 30rpx;
		left: -20rpx;
		width: 1px;
		height: 100%;
		position: absolute;
		background-color: #ebedf0;
	}

	.step-circle {
		position: absolute;
		top: 30rpx;
		left: -9px;
		z-index: 2;
		font-size: 12px;
		line-height: 1;
		transform: translate(-50%, -50%);
		width: 7px;
		height: 7px;
		background-color: #a1a1a1;
		border-radius: 50%;
	}

	.right-item::before {
		content: '';
	}

	.step-content {
		padding-top: 2px;
		font-size: 26rpx;
		color: #828282;
		line-height: 1.5;
	}

	.step-title {
		font-weight: bold;
		padding-top: 3px;
	}

	.step-text {
		font-size: 26rpx;
		color: #999999;
		padding-top: 6px;
	}

	.step-current {
		color: #2f95ff !important;

		.left-date,
		.step-text {
			color: #2f95ff !important;
		}

		.step-circle {
			background: #2f95ff !important;
		}

	}

	.left-date {
		font-size: 26rpx;
	}

	.audit-content {
		background: #f9f9f9;
		padding: 10px;
		border-radius: 4px;
		margin-top: 22px;
		border: 1px solid #eee;
	}
</style>
