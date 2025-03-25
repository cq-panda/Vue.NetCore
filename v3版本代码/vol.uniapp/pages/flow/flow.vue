<template>
	<view class="flow-container" style="background: rgb(247 247 247);">
		<view style="background: #ffff;">
			<u-tabs :list="list" @click="click"></u-tabs>
		</view>
		<view v-if="isInited">
			<view v-show="currentIndex===index" v-for="(data,index) in list" :key="index">
				<vol-table titleField="WorkName" :columns="data.columns" :ref="'list'+index" @loadBefore="loadBefore"
					@rowButtonClick="rowButtonClick" @loadAfter="loadAfter" @rowButtons="getRowButtons"
					v-if="data.inited" :url="data.url">
				</vol-table>
			</view>
		</view>
	</view>
</template>

<script>
	/*
	被审批的表，需要添加移动端菜单，并且给当前角色分配审批权限
	*/
	export default {
		data() {
			return {
				isInited: false,
				currentIndex: 0,
				value: "",

				list: [{
					name: '待审批',
					url: "api/Sys_WorkFlowTable/getPageData",
					inited: true,
					badge: {
						value: 0,
					},
					columns: this.getColumns()
				}, {
					name: '已审批',
					url: "api/Sys_WorkFlowTable/getPageData",
					badge: {
						value: 0,
					},
					inited: false,
					columns: this.getColumns()
				}, {
					name: '我的提交',
					url: "api/Sys_WorkFlowTable/getPageData",
					badge: {
						value: 0,
					},
					inited: false,
					columns: this.getColumns()
				}],
				initData: []
			}
		},
		onLoad() {
			this.isInited = true;
			// this.http.post('api/Sys_Dictionary/GetVueDictionary', ['资料库分类'], false).then(result => {

			// 	let list = result[0].data.map(x => {
			// 		return {
			// 			key: x.key,
			// 			name: x.value,
			// 			url: "api/App_DataList/getList?type=" + x.key
			// 		}
			// 	})
			// 	this.list.push(...list);

			// 	this.initData = this.list.map(x => {
			// 		return false
			// 	});
			// 	this.initData[0] = true;
			// 	this.isInited = true;
			// })

		},
		methods: {
			getColumns() {
				return [{
						field: 'WorkFlowTable_Id',
						title: 'WorkFlowTable_Id',
						type: 'guid',
						width: 110,
						hidden: true,
						readonly: true,
						require: true,
						align: 'left'
					},
					//  {field:'WorkFlow_Id',title:'流程id',type:'guid',width:110,hidden:true,align:'left'},
					{
						field: 'WorkName',
						title: '流程名称',
						type: 'string',
						width: 130,
						align: 'left',
						sort: true
					},
					//  {field:'WorkTableKey',title:'表主键id',type:'string',width:180,hidden:true,align:'left'},
					// {field:'WorkTable',title:'表名',type:'string',width:100,align:'left'},
					{
						field: 'WorkTableName',
						title: '业务名称',
						type: 'string',
						width: 120,
						align: 'left'
					},
					// {field:'CurrentStepId',title:'当前审核节点ID',type:'string',width:110,align:'left'},
					{
						field: 'StepName',
						title: '当前节点',
						type: 'string',
						width: 120,
						align: 'left'
					},
					{
						field: 'AuditStatus',
						title: '审批状态',
						type: 'int',
						bind: {
							key: 'audit',
							data: []
						},
						width: 110,
						align: 'left'
					},
					{
						field: 'Creator',
						title: '提交人',
						type: 'string',
						width: 100,
						align: 'left'
					},
					{
						field: 'CreateDate',
						title: '提交时间',
						type: 'datetime',
						width: 150,
						align: 'left',
						sort: true
					}
				]
			},
			rowClick(row) {

			},
			getRowButtons(index, row, callback) {
				let buttons = []
				if (this.currentIndex === 0) {
					buttons = [{
						text: "审批",
						shape: "circle",
						type: "error",
						//	plain: true
					}]
				} else {
					buttons = [{
						text: "查看",
						shape: "circle",
						type: "primary"
					}]

				}
				callback(buttons);
			},
			rowButtonClick(btn, rowindex, row) {
				//审批
				if (this.currentIndex === 0) {

				} else {
					//查看
				}
				//{WorkTable:options.WorkTable,WorkTableKey:options.WorkTableKey}
				uni.navigateTo({
					url: "/pages/flow/audit/audit?workTable=" + row.WorkTable + '&tableKey=' + row.WorkTableKey
				})
				//this.$toast('审批')
			},
			click(item) {
				console.log(item)
				this.currentIndex = item.index;
				this.list[item.index].inited = true;
			},
			search() {
				console.log('审批后')
				//审批后
				this.$refs.list0[0].load(null, true);
				this.$refs.list1 && this.$refs.list1[0].load(null, true)
			},
			loadBefore(params, callback) {
				// if (this.currentIndex===0) {
				// 	params.
				// }
				params.value = this.currentIndex;
				//分页时加载数据时会触发
				//console.log('table加载数据：' + JSON.stringify(params))
				callback(true);
			},
			loadAfter(data, callback) {
				//if (!this.list[this.currentIndex].badge.value) {
				this.list[this.currentIndex].badge.value = data.total;
				//}
				//分页时加载数据时会触发
				data.rows.forEach(row => {
					if (row.img) {
						row.img = this.base.getUrl(this.http.ipAddress, row.img, row.size);
					}

				})
				callback(true);
			}
		}
	}
</script>


<style lang="less" scoped>
	.search-header {
		padding: 16rpx;
		display: flex;
		align-items: center;
	}

	.table-demo {
		background: #f4f4f4;
		padding: 10rpx;

	}



	.grid-item {
		margin: 8rpx 16rpx;
		padding: 16rpx;
		border-radius: 8rpx;
		display: flex;
		background: #ffff;

		.grid-content {
			display: flex;
			flex: 1;
			flex-direction: column;
			padding-right: 20rpx;

			.grid-title {

				font-size: 32rpx;
				overflow: hidden;
				display: -webkit-box;
				-webkit-line-clamp: 2;
				-webkit-box-orient: vertical;
			}

			.grid-bottom {
				flex: 1;
				align-items: flex-end;
				padding-top: 20rpx;
				display: flex;
				font-size: 24rpx;
				color: #959595;

				.grid-bottom-left {
					flex: 1;
					width: 0;
				}

				.success,
				.error {
					margin-right: 30rpx;
				}

				.success {
					color: #00aa00;
				}

				.error {
					color: #e54648;
				}
			}
		}
	}

	.grid-item:first-child {
		margin-top: 16rpx;
	}
</style>
<style scoped>
	.flow-container /deep/ .vol-table-list {
		padding: 0 !important;
	}
</style>
