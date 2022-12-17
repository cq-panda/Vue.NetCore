<template>
	<view class="vol-table" :class="className">
		<!-- 		水平显示 -->
		<view v-if="direction=='horizontal'">
			<view class="vol-table-head">
				<view class="cell-index" v-if="index">
					#
				</view>
				<view @click="headerClick(column)" class="vol-table-head-cell"
					:style="{width:column.width+'px',flex:column.width?'unset':1}" v-if="!column.hidden" :key="index"
					v-for="(column,index) in inColumns">
					{{column.title}}
					<text v-if="column.sort" class="cell-order"
						:class="{'acitved-sort':sort==column.field,'acitved-order':order=='asc'}">↑</text>
					<text v-if="column.sort" class="cell-order"
						:class="{'acitved-sort':sort==column.field,'acitved-order':order=='desc'}">↓</text>
				</view>
			</view>
			<view class="vol-table-body">
				<u-empty mode="list" v-if="!rowsData.length" text="无数据"
					icon="http://cdn.uviewui.com/uview/empty/list.png"></u-empty>
				<u-list :upperThreshold="-999" v-if="tableHeight" :height="tableHeight" @scrolltolower="scrolltolower">
					<view @click="tableRowClick(rowindex,columns)" :key="rowindex" class="vol-table-body-rows"
						v-for="(row,rowindex) in rowsData">
						<view class="cell-index" v-if="index">
							{{rowindex+1}}
						</view>
						<view :style="{width:column.width+'px',flex:column.width?'unset':1}"
							:class="{'text-inline':textInline}" :key="cindex" class="vol-table-body-cell"
							v-if="!column.hidden" v-for="(column,cindex) in columns">
							<view class="vol-cell" @click.stop="cellClick(rowindex,row,column)" v-if="column.click">
								<view :style="column.style" v-if="column.formatter">
									<rich-text :nodes="rowFormatter(row,column,rowindex)+''"></rich-text>
								</view>
								<view :style="column.style" v-else>{{row[column.field]}}</view>
							</view>
							<view class="vol-cell" v-else-if="column.formatter">
								<rich-text :nodes="rowFormatter(row,column,rowindex)+''"></rich-text>
							</view>
							<view @click.stop="previewImage(row[column.field])" class="vol-cell"
								v-else-if="column.type=='img'">
								<u--image style="float:left;margin-left:5px;" width="40px" height="40px" radius="4px"
									:src="src" v-for="(src,index) in getImgSrc(row[column.field])" :key="index">
								</u--image>
							</view>
							<view class="vol-cell" v-else-if="column.bind">
								{{rowFormatterValue(row,column)}}
							</view>
							<view v-else-if="column.type=='editor'">
								<u-parse :content="row[column.field]"></u-parse>
							</view>
							<view class="vol-cell" v-else-if="column.type=='date'">
								{{(row[column.field]||'').substr(0,10)}}
							</view>
							<view class="vol-cell" v-else> {{row[column.field]}}</view>
						</view>
					</view>
					<slot></slot>
				</u-list>
				<!-- 	显示合计 -->
				<view v-if="hasSummary" :key="rowindex" class="vol-table-body-rows vol-table-summary"
					v-for="(row,rowindex) in summary">

					<view class="cell-index" v-if="index">合计</view>
					<view :style="{width:column.width+'px',flex:column.width?'unset':1}"
						:class="{'text-inline':textInline}" :key="cindex" class="vol-table-body-cell"
						v-if="!column.hidden" v-for="(column,cindex) in columns">

						<view class="vol-cell"> {{base.isEmpty(row[column.field])?'':row[column.field]}}</view>
					</view>


				</view>
			</view>
		</view>
		<!-- 		列表显示 -->
		<view v-else class="vol-table-list">
			<!-- 		{{JSON.stringify(columns)}} -->
			<u-list :upperThreshold="-999" v-if="tableHeight" :height="tableHeight" @scrolltolower="scrolltolower">
				<u-empty mode="list" v-if="!rowsData.length" text="无数据"
					icon="http://cdn.uviewui.com/uview/empty/list.png">
				</u-empty>
				<view :key="rowindex" v-for="(row,rowindex) in rowsData">
					<view v-if="titleField" class="vol-table-list-item-title">
						<text class="vol-table-list-item-title-border"></text>
						<view class="vol-table-list-item-title-left">
							<rich-text :nodes="getListTitleValue(row,index)+''"></rich-text>
						</view>
						<!-- 	<slot :data="row" name="title"></slot> -->
					</view>
					<view @click="tableRowClick(rowindex,columns)" class="vol-table-list-item">
						<view :key="cindex" class="vol-table-list-item-cell"
							v-if="!column.hidden&&column.field!=titleField" v-for="(column,cindex) in columns">
							<view class="cell-left"> {{column.title}}</view>
							<view class="cell-right">
								<view @click.stop="cellClick(rowindex,row,column)" v-if="column.click">
									<view :style="column.style" v-if="column.formatter">
										<rich-text :nodes="rowFormatter(row,column,rowindex)+''"></rich-text>
									</view>
									<view :style="column.style" v-else>{{row[column.field]}}</view>
								</view>
								<view v-else-if="column.formatter">
									<rich-text :nodes="rowFormatter(row,column)+''"></rich-text>
								</view>
								<view v-else-if="column.type=='editor'">
									<u-parse :content="row[column.field]"></u-parse>
								</view>
								<view v-else-if="column.bind">
									{{rowFormatterValue(row,column)}}
								</view>
								<view @click.stop="previewImage(row[column.field])" v-else-if="column.type=='img'">
									<view style="float: right;margin-left:10px;" width="50px" height="50px"
										v-for="(src,index) in getImgSrc(row[column.field])">
										<u--image width="50px" height="50px" radius="4px" :src="src" :key="index">
										</u--image>
									</view>
								</view>
								<view v-else-if="column.type=='date'">
									{{(row[column.field]||'').substr(0,10)}}
								</view>
								<view v-else> {{row[column.field]==null?'':row[column.field]}}</view>
							</view>
						</view>
					</view>
					<view class="extent-button-item" @click.stop>
						<view :key="btnIndex" class="extent-button" v-for="(btn,btnIndex) in rowButtons(rowindex,row)">
							<u-button :icon="btn.icon" :hairline="true" :shape="btn.shape" :disabled="btn.disabled"
								:plain="btn.plain" :type="btn.type" style="height:60rpx;" size="small"
								@click="rowBtnClick(btn,rowindex,row)" :text="btn.text">
							</u-button>
						</view>
					</view>
				</view>
				<slot></slot>
			</u-list>

		</view>
	</view>
</template>

<script>
	export default {
		name: "vol-table",
		props: {
			loadKey: {
				type: Boolean,
				default: true
			},
			direction: {
				type: String,
				default: "list" //"horizontal"//list
			},
			titleField: { //如果direction是以list显示，可以指定第一个标题
				type: String,
				default: ""
			},
			height: {
				type: Number,
				default: 0
			},
			autoHeight: {
				type: Boolean,
				default: true
			},
			textInline: { //超出是否显示省略号
				type: Boolean,
				default: false
			},
			index: { //是否显示行号
				type: Boolean,
				default: false
			},
			columns: {
				type: Array,
				default: () => {
					return []
				}
			},
			url: {
				type: String,
				default: ""
			},
			defaultLoadPage: {
				// 传入了url，是否默认加载表格数据
				type: Boolean,
				default: true,
			},
			tableData: {
				type: Array,
				default: () => {
					return []
				}
			},
			rowClick: null
		},
		data() {
			return {
				className: 'vol-table-' + (~~(Math.random() * 1000000)),
				rowsData: [],
				sort: '',
				order: "",
				tableHeight: 0,
				inColumns: [],
				page: 1,
				loaded: false,
				hasSummary: false,
				lastHeight: 0,
				summary: []
			};
		},
		methods: {
			scrolltolower() {
				if (this.loaded) {
					return;
				}
				this.page = this.page + 1;
				this.load()
			},
			load(params, reset) {
				if (!this.url) {
					return
				}
				let status = true;
				if (reset) {
					this.rowsData.splice(0);
					this.page = 1;
					this.loaded = false;
				}
				let param = {
					page: this.page,
					rows: 30,
					sort: this.sort,
					order: this.order || "desc",
					wheres: [], // 查询条件，格式为[{ name: "字段", value: "xx" }]
				};
				this.$emit("loadBefore", param, (result) => {
					status = result;
				});

				if (!status) return;
				param.wheres = JSON.stringify(param.wheres);
				this.http.post(this.url, param, true).then(data => {
					this.$emit("loadAfter", data, (result) => {
						status = result;
					});
					if (!status) return;
					if (!data.rows.length || data.rows.length < param.rows) {
						this.loaded = true;
					}
					// for (var i = 0; i < 4; i++) {
					// 	data.rows.push(...JSON.parse(JSON.stringify(data.rows)))
					// }
					//显示合计
					if (data.summary) {
						if (!this.summary.length) {
							let summary = []
							for (let key in data.summary) {
								let obj = {};
								obj[key] = data.summary[key];
								summary.push(obj);
							}
							this.summary = summary;
						} else {
							this.summary.forEach(x => {
								for (let key in data.summary) {
									x[key] = data.summary[key];
								}
							})
						}
					}
					console.log(this.summary)
					this.rowsData.push(...data.rows);
				})
			},
			tableRowClick(index, columns) {
				if (this.rowClick) {
					this.rowClick(index, this.rowsData[index], columns);
					return;
				}
				this.$emit('rowClick', index, this.rowsData[index], columns);
			},
			rowFormatter(row, column, index) {
				let _val;
				this.$emit('formatter', row, column, index, (val) => {
					_val = val;
				})
				return _val;
			},
			rowFormatterValueList(val, column) {

				let valArr = val.split(",").filter((x) => {
					return x !== "" && x !== undefined;
				});
				for (let index = 0; index < valArr.length; index++) {
					column.bind.data.forEach((x) => {
						if (x.key + "" == valArr[index] + "") {
							valArr[index] = x.value;
						}
					});
				}
				return valArr.join(",");
			},
			rowFormatterValue(row, column) {
				if (this.base.isEmpty(row[column.field])) {
					return '';
				}
				let _val = row[column.field] + '';

				if (!column.bind.data.length) {
					return _val;
				}
				if (column.type == "selectList" || column.type == 'checkbox') {
					return this.rowFormatterValueList(_val, column)
				}
				let _obj = column.bind.data.find(x => {
					return x.key + '' == _val
				});
				if (_obj) {
					return _obj.value;
				}
				return _val;
			},
			getListTitleValue(row, index) {

				let column = this.inColumns.find(x => {
					return x.field == this.titleField
				});
				if (column.formatter) {
					return this.rowFormatter(row, column, index)
				}

				if (column.bind) {
					return this.rowFormatterValue(row, column)
				}
				if (column.type == 'date') {
					return (row[this.titleField] || '--').substr(0, 10);
				}
				return row[this.titleField] || '--'
			},
			headerClick(column) {
				if (this.sort == column.field) {
					this.order = this.order == 'desc' ? 'asc' : 'desc'
				} else {
					this.sort = column.field;
					this.order = 'desc'
				}

			},
			getData() {
				if (!this.url) {
					this.rowsData.push(...this.tableData)
					return
				}
				if (!this.defaultLoadPage) {
					return
				};
				this.load();
			},
			getImgSrc(imgs) {
				if (this.base.isEmpty(imgs)) {
					return []
				}
				if (imgs.indexOf('base64,') != -1) {
					return [imgs];
				}
				let _imgs = imgs.split(',').map(x => {
					if (x.startsWith('http')) {
						return x;
					}
					return this.http.ipAddress + x
				});
				return _imgs;
			},
			loadSource() {
				let dicKeys = this.inColumns.filter(x => {
					return x.bind && x.bind.key && !x.bind.data.length
				}).map(m => {
					return m.bind.key
				});
				if (!dicKeys.length) {
					return
				}
				this.http.post('api/Sys_Dictionary/GetVueDictionary', dicKeys, true).then(result => {
					result.forEach(item => {
						this.inColumns.forEach(x => {
							if (x.bind && x.bind.key && !x.bind.data.length && x.bind.key == item
								.dicNo) {
								x.bind.data = item.data;
							}
						})
					})

				})
			},
			cellClick(rowIndex, row, column) {
				this.$emit('cellClick', rowIndex, row, column)
			},
			rowButtons(index, row) {
				let _buttons = [];
				this.$emit('rowButtons', index, row, (buttons) => {
					_buttons = buttons;
				})
				console.log(_buttons)
				return (_buttons || []) //.reverse();
			},
			rowBtnClick(btn, rowindex, row) {
				this.$emit('rowButtonClick', btn, rowindex, row);
			},
			previewImage(urls) {
				uni.previewImage({
					urls: this.getImgSrc(urls),
					longPressActions: {}
				});
			},
			initSummary() {
				if (this.summary.length) {
					this.hasSummary = true;
					return;
				}
				this.summary = this.columns.filter(x => {
					return x.summary
				}).map(x => {
					let obj = {};
					obj[x.field] = 0;
					return obj;
				})
				this.hasSummary = this.summary.length > 0
			},
			caclHeaderHeight() {
				if (this.direction == 'list') {
					return;
				}
				console.log('555')
				var view = uni.createSelectorQuery().in(this).select(".vol-table-head");
				view.boundingClientRect().exec(res => {
					if (this.lastHeight > 0 && this.lastHeight == this.tableHeight) {
						return;
					}
					this.tableHeight = this.tableHeight - (res[0] || {
						height: 0
					}).height;
					this.lastHeight = this.tableHeight;
				})
			}
		},
		created() {
			this.initSummary();
			this.getData();
			this.inColumns = this.columns;
			if (this.loadKey) {
				this.loadSource();
			}
			this.tableHeight = this.height;

		},
		mounted() {
			if (this.autoHeight && this.height <= 0) {
				uni.getSystemInfo({
					success: (resu) => {
						var view = uni.createSelectorQuery().in(this).select(".vol-table");
						view.boundingClientRect().exec(res => {
							this.tableHeight = resu.windowHeight - res[0].top;
							if (this.hasSummary) {
								this.tableHeight = this.tableHeight - 49;
							}
							this.caclHeaderHeight()
						})
					}
				})
			} else {
				this.caclHeaderHeight()
			}
		},
		watch: {
			height(newVal) {
				console.log(newVal)
				if (newVal <= 0) {
					return;
				}
				this.tableHeight = newVal;
				this.caclHeaderHeight();
			},
			// #ifdef MP-WEIXIN
			inColumns: {
				handler(newValue, oldValue) {
					if (newValue && newValue.length) {
						this.$emit('update:columns', newValue)
						this.initSummary();
					}
				},
				immediate: true,
				deep: true
			},
			columns: {
				handler(newValue, oldValue) {
					this.inColumns = newValue;
				},
				immediate: true,
				deep: true
			},
			// #endif
			tableData: {
				handler(newValue, oldValue) {
					this.rowsData = newValue;
				},
				immediate: true,
				deep: true
			}
		},

	}
</script>

<style lang="less" scoped>
	.vol-table-head {
		padding: 0 8rpx;
		display: flex;
		background: #f3f3f3;

		text-align: center;
		font-weight: bold;

		.vol-table-head-cell {
			padding: 30rpx 6rpx;
			flex: 1;
			width: 0;
			font-size: 26rpx;

			.cell-order {
				color: #abadb1;
			}

			.acitved-sort.acitved-order {
				color: #4097f8;
			}
		}
	}



	.vol-table-body-rows {
		display: flex;
		padding: 0 8rpx;

		.vol-table-body-cell {
			word-break: break-all;
			padding: 0 6rpx;
			text-align: center;
			flex: 1;
			width: 0;
			font-size: 24rpx;
			color: #484848;

			.vol-cell {
				padding: 30rpx 0rpx;
			}
		}

		.text-inline {
			.vol-cell {
				overflow: hidden;
				text-overflow: ellipsis;
				white-space: nowrap;
			}
		}
	}

	.vol-table-summary {
		bottom: 0;
		width: 100%;
		background: #f3f3f3 !important;
		z-index: 999;
		position: absolute;
		font-weight: bold;
	}

	.vol-table-body-rows:nth-child(even) {
		background: #f9f9f9;
		border-top: 1px solid #f3f3f3;
		border-bottom: 1px solid #f3f3f3;
	}

	.cell-index {
		width: 30px;
		padding: 28rpx 6rpx;
		font-size: 26rpx;
		text-align: center;
		color: #6a6a6a;
	}
</style>

<style scoped lang="less">
	.vol-table-list {
		padding: 14rpx 0;
		background: #f9f9f9;
	}

	.vol-table-list-item-title {
		text-align: left;
		margin: 18rpx 0 14rpx 22rpx;
		font-size: 28rpx;
		line-height: 30rpx;
		padding-left: 10rpx;
		display: flex;
		justify-content: center;
		align-items: center;

		.vol-table-list-item-title-left {
			flex: 1;
			font-size: 28rpx;
			// font-weight: bold;
		}

		.vol-table-list-item-title-border {
			display: inline-block;
			background: #00aaff;
			padding: 18rpx 8rpx;
			border-radius: 10rpx;
			margin-right: 14rpx;
		}

	}

	.vol-table-list-item {
		margin: 8rpx 16rpx;
		background: #FFFFFF;
		box-shadow: 1px 1px 14px rgb(245 245 245 / 32%);
		border: 1px solid #f3f3f3;
		border-radius: 10rpx;

		.vol-table-list-item-cell {
			display: flex;
			padding: 20rpx 28rpx;
			border-bottom: 1px solid #f9f9f9ee;
			font-size: 26rpx;

			.cell-left {
				border-radius: 5px;
				width: 180rpx;
				color: #5c5c5c;
			}

			.cell-right {
				flex: 1;
				width: 0;
				text-align: right;
			}
		}
	}

	.extent-button-item {
		display: flex;
		justify-content: flex-end;
		margin: 0rpx 16rpx;
		padding: 10rpx;
		top: -10rpx;
		position: relative;
		background: #ffff;
	}

	.extent-button {
		padding: 10rpx 10rpx;
		// display: inline-block;
		// float: right;
		// min-width: 20%;
		// margin-right: 20rpx;
		// margin-bottom: 20rpx;
	}
</style>
