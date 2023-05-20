<template>
	<view class="table-demo">
		<view style="padding:20rpx 20rpx 10rpx 20rpx;">
			<vol-alert>
				<view>1、完全自定义vol-table列表内容及样式,见:table4.vue</view>
				<view>2、内部已处理高度自适应、自动分页、数据源自动加载</view>
				<view>3、此示例通过tableData属性手动绑定数据</view>
			</vol-alert>
		</view>

		<vol-table @scrolltolower="scrolltolower" :tableData="tableData" custom ref="table" :columns.sync="columns">
			<!-- 	自定义内容 -->
			<template v-slot:data="{rows}">
				<view @click="rowClick(row,index)" v-for="(row,index) in rows" class="grid-item">
					<view class="grid-content">
						<view class="grid-title">{{index+1}}、{{row.title}}</view>
						<view class="grid-bottom">
							<view class="grid-bottom-item">
								<view>发布人</view>
								<view>{{row.creator}}</view>
							</view>
							<view class="grid-bottom-item">
								<view>发布时间</view>
								<view>{{row.createDate}}</view>
							</view>
							<view class="grid-bottom-item">
								<view>修改人</view>
								<view>{{row.creator}}</view>
							</view>
							<view class="grid-bottom-item">
								<view>修改时间</view>
								<view>{{row.createDate}}</view>
							</view>
							<!-- 小程序不支持标签里面调用方法。manifest.json并且要配置	"scopedSlotsCompiler":"legacy",属性 -->
						</view>
						<view class="btns">
							<view class="btn-item">
								<u-button @click="rowClick(row,index)" shape="circle" type="primary" size="mini">
									<u-icon name="file-text" size="12" color="#ffff"></u-icon>查看
								</u-button>
							</view>
							<view class="btn-item">
								<u-button @click="delClick(row,index)" shape="circle" type="error" size="mini">
									<u-icon name="trash" size="12" color="#ffff"></u-icon>删除
								</u-button>
							</view>
						</view>
					</view>
				</view>
			</template>
		</vol-table>

		<u-modal showCancelButton @confirm="confirm" @cancel="show=false" :show="show" title="警告" content='确定要删除数据吗'>
		</u-modal>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				show: false,
				page: 0,
				tableData: [],
				columns: [{
						field: 'id',
						title: '主键ID'
					},
					{
						field: 'title',
						title: '标题'
					},
					{
						field: 'creator',
						title: '发布人',
					},
					{
						field: 'createDate',
						title: '发布时间',
						type: 'datetime',
					},
					{
						field: 'modifier',
						title: '修改人',
						type: 'string',
						width: 130,
						hidden: true,
						align: 'left'
					},
					{
						field: 'modifyDate',
						title: '修改时间',
						type: 'datetime'
					}
				],
			}
		},
		onLoad() {
			this.getData()
		},
		methods: {
			//分页事件
			scrolltolower() {
				this.getData();
			},
			getData() {
				if (this.page < 0) {
					return;
				}
				this.page++;
				let url = 'api/app_news/getList?newsType=1&&page=' + this.page;
				this.http.get(url, {}, false).then(result => {
					result.forEach(item => {
						item.imageUrl = this.http.ipAddress + item.imageUrl;
						item.createDate = (item.createDate || '').substr(0, 10);
						item.modifyDate = (item.modifyDate || '').substr(0, 10);
					})
					if (!result.length) {
						this.page = -1;
					}
					this.tableData.push(...result);
				})
			},
			rowClick(row, index) {
				console.log('点击了第' + index + '行')
				return this.$toast('点击了第' + index + '行');
			},
			delClick(row, index) {
				this.row = row;
				this.index = index;
				this.show = true;
			},
			confirm() {
				this.tableData.splice(this.index, 1);
				this.show = false;
				this.$toast('删除成功')
			}
		}
	}
</script>

<style lang="less" scoped>
	.table-demo {
		background: #f4f4f4;
	}

	.grid-item {
		margin: 10rpx 20rpx;
		padding: 16rpx;
		border-radius: 8rpx;
		display: flex;
		background: #ffff;

		.grid-content {
			display: flex;
			flex: 1;
			flex-direction: column;
			padding-left: 20rpx;

			.grid-title {

				font-size: 28rpx;
				overflow: hidden;
				display: -webkit-box;
				-webkit-line-clamp: 2;
				-webkit-box-orient: vertical;
			}

			.grid-bottom {
				flex: 1;
				align-items: flex-end;
				padding-top: 10rpx;
				display: flex;
				font-size: 24rpx;
				color: #959595;

				.grid-bottom-item {
					flex: 1;
					padding-right: 20rpx;
				}

				.grid-bottom-item>view:first-child {
					color: #353535;
					font-size: 22rpx;
				}
			}
		}
	}

	.btns {
		padding: 20rpx 20rpx 0 0;
		display: flex;
		justify-content: flex-end;

		.btn-item {
			margin-left: 20rpx;
		}
	}
</style>
