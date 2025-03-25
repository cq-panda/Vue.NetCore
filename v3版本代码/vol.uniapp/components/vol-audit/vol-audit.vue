<template>
	<view class="audit-model-content">
		<view style="background: #ffff;">
			<u-tabs :list="list" @click="tabsClick"></u-tabs>
		</view>

		<view v-show="currentIndex == 0 || !hasFlow" class="audit-content">
			<view class="fx-right" v-if="isCurrentUser || !hasFlow">

				<view v-if="!hasFlow">
					<u-alert :title="'当前选中【' + rowLen + '】条记录待审核..'" type="success" :closable="false" />
				</view>
				<view class="rd" style="display: flex;margin-bottom: 20rpx;">
					<span>审批：</span>
					<u-radio-group style="margin-left:15px" v-model="auditParam.value">
						<view style="margin-right: 30rpx;" v-for="item in auditParam.data" :key="item.value">
							<u-radio :name="item.value" :label="item.text">
							</u-radio>
						</view>
					</u-radio-group>
				</view>
				<view style="border: 1px solid #d0d0d0;border-radius: 6rpx;">
					<u--textarea border="none" :height="100" v-model="auditParam.reason" placeholder="请输入审批内容">
					</u--textarea>

				</view>

				<view class="btn">
					<u-button type="primary" shape="square" @click="auditClick">审批</u-button>
				</view>
			</view>
			<view class="fx-left" v-if="hasFlow">
				<!-- <u-divider text="流程信息" :hairline="true"></u-divider>
 -->
				<view class="v-steps" style="padding-left: 30rpx;">
					<view v-for="(item, index) in workFlowSteps" :key="index">
						<view class="step-item" :class="{'step-item-ad':item.auditId||item.stepAttrType=='start'}"
							v-if="item.stepAttrType == 'start'">
							<!-- 	<view class="left-item">
								<view>流程开始</view>
								<view class="left-date">{{ item.createDate }}</view>
							</view> -->
							<view class="right-item">
								<view class="step-line"></view>
								<i class="step-circle"></i>
								<view class="step-title">
									{{ item.stepName }}
								</view>
								<view class="step-text">发起人：{{ item.creator }}</view>
							</view>
						</view>
						<view class="step-item" v-else-if="item.stepAttrType == 'end'">
							<!-- 	<view class="left-item">
								<view>流程结束</view>
							</view> -->
							<view class="right-item">
								<view class="step-line"></view>
								<i class="step-circle"></i>
								<view class="step-title">
									{{ item.stepName }}
								</view>
							</view>
						</view>
						<view v-else :class="{ 'step-current': item.isCurrent }" class="step-item">

							<view class="right-item">
								<view class="step-line"></view>
								<i class="step-circle"></i>
								<view class="step-title">
									{{ item.stepName }}
								</view>
								<view class="step-text">审批人：{{ item.auditor }}</view>
								<view class="step-text">
									状 态： {{ getAuditStatus(item.auditStatus) }}
								</view>
								<view class="step-text">
									审批时间： {{ item.auditDate || '待审批' }}
								</view>
								<view class="step-text">备 注： {{ item.remark || '-' }}</view>
							</view>
						</view>
					</view>
				</view>
			</view>

		</view>

		<view v-show="currentIndex===1">
			<view class="f-item" v-for="(item,index) in formData" :key="index">
				<view class="f-name">{{item.name}}</view>
				<view class="f-value">{{item.value}}</view>
			</view>
		</view>
		<view v-show="currentIndex ===2">
			<vol-table titleField="auditDate" :tableData="tableData" :columns="columns" :pagination-hide="true"
				:load-key="false" :text-inline="false" :ck="false"></vol-table>
		</view>
	</view>

</template>
<script>
	let currentOption = {}
	export default {
		props: {
			data: {
				type: Object,
				default: () => {
					return {
						table: "",
						tableKey: ""
					}
				}
			}
		},
		data() {
			return {
				currentIndex: 0,
				list: [{
					name: '审批'
				}, {
					name: '详细信息',
				}, {
					name: '审批记录'
				}],
				height: 550,
				width: 1000,
				workFlowSteps: [],
				hasFlow: false,
				formData: [],
				isFlow: false,

				auditParam: {
					//审核对象
					rows: 0, //当前选中审核的行数
					model: false, //审核弹出框
					value: -1, //审核结果
					reason: '', //审核原因
					status: [0, 2], //审核中的数据
					data: [{
							text: '通过',
							value: 1
						},
						{
							text: '拒绝',
							value: 3
						},
						{
							text: '驳回',
							value: 4
						}
					],
				},
				tableData: [],
				columns: [{
						title: '节点',
						field: 'stepName',
						width: 100
					},
					{
						title: '审批人',
						field: 'auditor',
						width: 80
					},
					{
						title: '审批结果',
						field: 'auditStatus',
						width: 70,
						bind: {
							data: []
						}
					},
					{
						title: '审批时间',
						field: 'auditDate',
						width: 145
					},
					{
						title: '备注',
						field: 'remark',
						width: 120
					}
				],
				isCurrentUser: null,
				activeName: "audit",
				auditDic: [],
				rowLen: 0,
				currentRows: []
			}
		},
		methods: {
			tabsClick(item) {
				console.log(item)
				this.currentIndex = item.index;
				this.list[item.index].inited = true;
			},
			getAuditStatus(key) {
				return (this.auditDic.find(x => {
					return x.key === key + ''
				}) || {
					value: key
				}).value || '待审批';
			},


			auditClick() {
				if (this.auditParam.value == -1) {
					this.$toast('请选择审批项');
					return;
				}


				//我的流程中点击审批
				//保存审核
				let keys = this.currentRows.map(x => {
					return x[currentOption.key]
				});
				let url =
					`api/${currentOption.table}/audit?auditReason=${this.auditParam.reason}&auditStatus=${this.auditParam.value}`
			
			// this.$emit('onAudit', '');
			// return;
				this.http.post(url, keys, '审核中....').then((x) => {
					this.$toast(x.message||'审批成功');
					if (!x.status) {
						return;
					}
					this.isCurrentUser = false;
					this.$emit('onAudit', x);
				});
			},
			getAuditInfo(option) {
				const table = option.table;
				const url = `api/Sys_WorkFlow/getSteps?tableName=${table}`
				let ids = this.currentRows.map(x => {
					return x[option.key]
				});
				this.http.post(url, ids, true).then(result => {
					if (!result.status) {
						this.$toast(result.message);
						return;
					}

					this.hasFlow = !!(result.list || []).length;
					if (!this.hasFlow) {

						let auditStatus = Object.keys(this.currentRows[0]).find(x => {
							return x.toLowerCase() === 'auditstatus'
						});

						let checkStatus = this.currentRows.every((x) => {
							return this.auditParam.status.some(c => {
								return c === x[auditStatus] || !x[auditStatus]
							})
						});
						if (!checkStatus) {
							this.$toast('只能选择待审批或审核中的数据');
							return;
						}
						this.rowLen = this.currentRows.length;

						this.isCurrentUser = true;
						//没有审批流程的数据只显示
						return;
					}


					if (!this.auditDic.length) {
						this.auditDic.push(...(result.auditDic || []))
						this.columns.forEach(item => {
							if (item.field == 'auditStatus') {
								item.bind.data = this.auditDic;
							}
						})
					}
					this.isCurrentUser = result.list.some(x => {
						return x.isCurrentUser
					})
					this.workFlowSteps.length = 0;
					this.workFlowSteps.push(...result.list);
					this.tableData.length = 0;
					result.log.forEach(x => {
						if (x.stepAttrType = 'start') {
							x.stepName = '进入流程';
							x.auditDate = x.createDate;
						}
					})
					this.tableData.push(...result.log)
					this.formData.length = 0;
					this.formData.push(...(result.form || []))
				})
			},
			initFlow(rows, flow) {
				this.isFlow = !!flow;
				this.currentRows = rows;
				this.activeName = 'audit'
				this.auditParam.reason = '';
				this.auditParam.value = -1;

				if (flow) {
					currentOption = {
						table: rows[0].WorkTable,
						key: "WorkTableKey" // rows[0].WorkTableKey
					}
				}
				this.getAuditInfo(currentOption);
				// else {
				// 	currentOption = {
				// 		table: props.option.url.replaceAll('/', ''),
				// 		key: props.option.key
				// 	}
				// }
			}
		},
		created() {
			let rows = [{
				WorkTable: this.data.workTable,
				WorkTableKey: this.data.tableKey
			}]
			this.initFlow(rows, true);
		}
	};
</script>

<style lang="less" scoped>
	// .audit-model-content {
	// 	padding: 10px;
	// }

	.step-item {
		background: #fff;
		display: flex;
	}

	.left-item {
		min-width: 180px;
		text-align: right;
		padding-right: 25px;
		padding-top: 8px;

		.left-date {
			font-size: 13px;
			padding-top: 7px;
			color: #6c6c6c;
		}
	}

	.right-item {
		cursor: pointer;
		position: relative;
		border-bottom: 1px solid #f3f3f3;
		padding: 5px 0 5px 5px;
	}

	.left-item,
	.right-item {
		padding-bottom: 10px;
	}

	.right-item:last-child {
		border-bottom: 0;
	}

	.step-line {
		top: 16px;
		left: -10px;
		width: 1px;
		height: 100%;
		position: absolute;
		background-color: #ebedf0;
	}

	.step-circle {
		position: absolute;
		top: 17px;
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
		font-size: 14px;
		color: #828282;
		line-height: 1.5;
	}

	.step-title {
		font-weight: bold;
		padding-top: 3px;
	}

	.step-text {
		font-size: 13px;
		color: #999999;
		padding-top: 6px;
	}

	.step-current {
		* {
			color: #2f95ff !important;
		}

		.step-circle {
			background: #2f95ff !important;
		}

		// border-radius: 5px;
		// border: 1px solid #d6eaff;
		font-size: 13px;
		padding-top: 6px;
		// background-color: #eff7ffd9;
		color: black;
	}

	.audit-content {
		// background: #f9f9f9;
		padding: 10px;
		border-radius: 4px;
		// display: flex;

		.fx-left {
			margin-top: 20rpx;
			flex: 1;


			.rd {
				display: flex;
				align-items: baseline;
			}
		}

		.fx-right {
			// width: 400px;

			.btn {
				margin-top: 10px;
				text-align: center;
			}
		}

	}

	.cell-item {
		font-weight: 500;
	}

	.desc-top {
		padding: 5px 10px 0 10px;
	}

	.step-item-ad {
		* {
			color: #9f9898 !important;
		}
	}

	.f-item {
		padding: 20rpx;
		display: flex;
		color: rgb(48, 49, 51);
		font-size: 26rpx;
		border-bottom: 1px solid #f5f5f5;

		.f-name {
			width: 200rpx;
		}

		.f-value {
			flex: 1;
			text-align: right;
		}
	}
</style>
