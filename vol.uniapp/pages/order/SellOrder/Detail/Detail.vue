<template>
	<view class="order-detail">
		<vol-alert>
			<view>1、订单详情页面由自己维护</view>
			<view>2、框架已封装vol-table与vol-form组件可直接使用</view>
			<view>3、可参照此页面实现一对一或者一对多</view>
		</vol-alert>
		<!--主表信息 -->
		<view class="order-main">
			<view class="title">订单信息</view>
			<vol-form class="main-form" :load-key="true" ref="form" :form-options="editFormOptions"
				:formFields.sync="editFormFields">
			</vol-form>
		</view>
		<!-- 明细列表信息 -->
	
		<view class="order-detail-list">
			<view class="detail-btns">
				<view class="detail-btn" @click="showDetailBtnClick">
					<u-button icon="plus" type="primary" shape="circle" size="small" text="添加"></u-button>
				</view>
				<view class="detail-btn" @click="save">
					<u-button icon="checkmark" type="success" shape="circle" size="small" text="保存"></u-button>
				</view>
			</view>
			<u-sticky bgColor="#fff">
				<u-tabs :list="list"></u-tabs>
			</u-sticky>
			<vol-table :height="300" @rowClick="rowClick" :tableData="rows" direction="horizontal"
				:columns.sync="columns" ref="table">
			</vol-table>
		</view>

		<u-popup @touchmove.prevent class="form-popup" :zIndex="999999" :show="detailModel" @close="detailModel=false;">
			<view class="vol-action-sheet-select-container" style="max-height:500px">
				<view class="vol-action-sheet-select-title" @click="detailModel=false;">明细操作
					<text class="vol-action-sheet-select-confirm">取消</text>
				</view>
				<vol-form :load-key="true" ref="detail" :form-options="detailFormOptions"
					:formFields.sync="detailFormFields">
				</vol-form>
				<view style="padding: 15px;">
					<view  v-show="!isAdd" style="margin-bottom: 28rpx;">
						<u-button @click="showDel=true" icon="trash" type="error"  shape="circle" text="删除"></u-button>
					</view>
					<u-button @click="addRow" icon="checkmark" type="primary" shape="circle" text="确认"></u-button>
				</view>
			</view>
		</u-popup>
		<!-- 删除提示 -->
		<u-modal :show="showDel" cancelText="取消" class="del-u-modal" :showCancelButton="true" :showConfirmButton="true"
			@cancel="showDel=false" @confirm="confirmDel" title="警告">
			<view style="color: red;">确定要删除此数据吗!</view>
		</u-modal>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				showDel: false, //删除提示框
				currentRow: {},
				currendtIndex: -1, //当前编辑或删除的是第几行
				isAdd: false, //当前是操作是新建还是编辑
				orderId: null, //编辑时传过来的订单id
				list:[{
						name: '订单明细',
					},{
						name: '订单详情',
					},{
						name: '订单统计',
					}],
				//主表配置
				editFormFields: {
					"OrderType": "",
					"TranNo": "",
					"Qty": "",
					"SellNo": ""
				},
				editFormOptions: [{
						"key": "ordertype",
						"data": [],
						"title": "订单类型",
						"required": true,
						"field": "OrderType",
						"type": "select"
					},
					{
						"title": "Id",
						"required": true,
						"field": "ttt",
						hidden: true
					},
					{
						"title": "运单号",
						"required": true,
						"field": "TranNo"
					},
					{
						"title": "销售数量",
						"required": true,
						"field": "Qty",
						"type": "number"
					},
					{
						"title": "销售订单号",
						"required": true,
						"field": "SellNo"
					}
				],
				//明细表配置，具体见表单vol-form菜单
				rows: [], //数据
				columns: [{
						field: 'OrderList_Id',
						title: '明细表主键',
						hidden: true
					},
					{
						field: 'ProductName',
						title: '商品名称',
						type: "select",
						bind: {
							key: "pn",
							data: []
						},
					},
					{
						field: 'MO',
						title: '批次',
						type: 'string',
						require: true
					},
					{
						field: 'Qty',
						title: '数量',
						type: 'int',
						require: true
					},
					{
						field: 'Creator',
						title: '创建人',
						type: 'string',
						readonly: true
					}
				],
				detailModel: false,
				detailFormFields: {
					ProductName: "",
					MO: "",
					Qty: 0
				},
				detailFormOptions: [{
						field: 'ProductName',
						title: '商品名称',
						type: "select",
						"data": [],
						key: "pn",
					},
					{
						field: 'MO',
						title: '批次',
						type: 'string',
						require: true
					},
					{
						field: 'Qty',
						title: '数量',
						type: 'int',
						require: true
					}
				],
			}
		},
		methods: {
			save() { //保存
				let url = ''
				if (this.orderId) { //编辑操作
					url = "api/SellOrder/update"
				} else {
					url = "api/SellOrder/add"
				}
				let params = {
					mainData: this.editFormFields,
					detailData: this.rows
				}
				this.http.post(url, params, true).then(result => {
					this.$toast(result.message);
					if (!result.status) {
						return;
					}
					this.getOrderData();
					this.getOrderListData();
					//保存成功后刷新页面数据
				})
			},
			confirmDel() { //删除行数据
				let url = "api/SellOrder/delDetail?orderList_Id=" + this.currentRow.OrderList_Id;
				//从后台删除数据，这里自己写下delDetail接口
				// this.http.get(url,{},true).then(result=>{
				//  if(result.status){
				this.showDel = false;
				this.detailModel=false;
				this.rows.splice(this.currnetDelIndex, 1);
				this.$toast("删除成功");
				return;
				//  }
				// })
			},
			showDetailBtnClick() { //添加行
				this.isAdd = true;
				this.showDetail(-1, {
					ProductName: '',
					MO: null,
					Qty: null
				});
			},
			rowClick(index, row) { //点击新建或者编辑弹出明细表的操作
				this.isAdd = false;
				this.showDetail(index, row);
			},
			showDetail(index, row) {
				this.currendtIndex = index;
				this.detailFormFields = JSON.parse(JSON.stringify(row));
				this.detailModel = true;
			},
			addRow() { //弹出框点击的确定
				if (!this.$refs.detail.validate()) {
					return false
				}
				//编辑操作
				if (this.currendtIndex != -1) {
					Object.assign(this.rows[this.currendtIndex], this.detailFormFields);
				} else { //添加行的数据
					this.rows.push(this.detailFormFields);
				}
				this.detailModel = false
			},
			getOrderData() { //获取主表数据(现在用的是框架的方法，可以自己写接口返回数据)
				let params = {
					page: 1,
					row: 1
				};
				//生成查询参数
				params.wheres = JSON.stringify([{
					name: "Order_Id",
					value: this.orderId
				}]);
				this.http.post("api/SellOrder/getPageData", params, true).then(result => {
					Object.assign(this.editFormFields, result.rows[0])
				})
			},
			getOrderListData() { //获取明细表数据(现在用的是框架的方法，可以自己写接口返回数据)
				//此页面没做分页，可以用uview的list来处理分页
				let params = {
					page: 1,
					rows: 30
				};
				//生成查询参数
				params.value = this.orderId;
				this.http.post("api/SellOrder/getDetailPage", params, true).then(result => {
					this.rows = result.rows;
				})
			}
		},
		onShow() {
			//获取主表主键值
			let routes = getCurrentPages(); // 获取当前打开过的页面路由数组
			let params = routes[routes.length - 1].options; //获取路由参数 
			if (params && params.orderId) {
				this.orderId = params.orderId;
				//获取主表数据
				this.getOrderData();
				//获取明细表数据
				this.getOrderListData();
			} else {
				this.orderId = null;
			}
			uni.setNavigationBarTitle({
				title: this.orderId ? '订单编辑' : '新建订单'
			})
		}
	}
</script>

<style scoped lang="less">
	.order-detail {
		margin-top: -20rpx;
		background: #fbfbfb;
		padding-top: 20rpx;
		overflow-y: scroll;
		overflow-x: hidden;
	}

	.order-main,
	.order-detail-list {
		// margin: 20rpx;
		border-radius: 10rpx;
	}

	.main-form,
	.detail-form {
		border: 1px solid #ebebeb;
		border-bottom: 0;
		border-radius: 4px;
		display: inline-block;
		width: 100%;
	}

	.title {
		text-align: left;
		margin: 9px 0 7px 0;
		font-size: 15px;
		border-left: 8px solid #00aaff;
		line-height: 16px;
		padding-left: 5px;
		display: flex;
		position: relative;

		.detail-icon {
			position: absolute;
			width: 60rpx;
			right: 0;
			height: 44rpx;
		}
	}

	.detail-form {
		margin-bottom: 30rpx;
	}

	.detail-btns {
		margin: 15rpx 8rpx;
		display: flex;

		.detail-btn {
			margin-left: 30rpx;
		}
	}
</style>
