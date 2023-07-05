<template>
	<view class="view-grid">
		<view class="fx-height"></view>
		<view class="fx-header">
			<view class="fx-header-total">
				<text>共</text><text class="fx-header-row-total">{{rowTotal}}</text><text>条数据</text>
			</view>
			<view @click="griFabBtnClick(btn)" v-if="btn.hidden===false||btn.hidden===undefined" class="btn-item"
				v-for="(btn,index) in fabButtons" :key="index">
				<u-icon :name="btn.icon" :size="btn.size||18"></u-icon>
				<view>{{btn.name}}</view>
			</view>
		</view>
		<slot name="gridHeader"></slot>
		<!-- 	表格数据 -->
		<view class="view-grid-list">
			<vol-table v-if="isCreated" :class="[className]" :url="tableUrl" @cellClick="gridCellClick"
				@rowButtons="getRowButtons" @rowButtonClick="gridRowButtonClick" @rowClick="gridRowClick"
				:defaultLoadPage="load" @loadBefore="loadGridTableBefore" :index="rowIndex" :ck="ck"
				@loadAfter="loadGridTableAfter" ref="table" :direction="direction" :titleField="titleField"
				:height="height" @formatter="cellFormatter" :columns.sync="columns" :textInline="textInline">
				<!-- 			<view style="height: 50rpx;"></view> -->
				<!-- 		<view class="vol-table-title-buttons" slot="title">
				<view @click.native.stop="gridRowClick()"  class="vol-table-title-buttons-del">
					<u-icon size="20" color="#e64340" name="trash"></u-icon>
				</view>
				<view class="vol-table-title-buttons-edit">
					<u-icon size="20" name="edit-pen"></u-icon>
				</view>
			</view> -->
			</vol-table>
			<slot name="gridFooter"></slot>
		</view>
		<!-- 		搜索 -->
		<u-popup @touchmove.prevent :zIndex="999999" :show="searchModel" @close="searchModel=false">
			<view style="background: #f7f7f7;" class="vol-action-sheet-select-container"
				:style="{'max-height':(maxHeight+'px')}">
				<view style="background: #FFFFFF" class="vol-action-sheet-select-title">
					搜索
					<view class="f-icon" @click="searchModel=false">取消</view>
				</view>
				<slot name="searchHeader"></slot>
				<view class="vol-action-sheet-select-content">
					<view class="search-item" @click="sortSelectModel=true">
						<view class="f-form-label">排序字段</view>
						<view style="flex:1;">
							<view style="color:rgb(192 196 204);font-size:15px;" v-show="base.isEmpty(sortField)">
								请选择排序字段
							</view>
							<view style="font-size:15px;" v-show="!base.isEmpty(sortField)">
								{{sortName}}
							</view>
						</view>
						<u-icon name="arrow-right"></u-icon>
					</view>
					<view class="search-item" style="margin-bottom: 20rpx;">
						<view class="f-form-label">排序方式</view>
						<view style="flex:1;">
							<view style="font-size:15px;">
								<u-radio-group v-model="orderType" placement="row">
									<u-radio :customStyle="{'margin-right': '20px'}" label="降序" name="desc">
									</u-radio>
									<u-radio :customStyle="{'margin-right': '20px'}" label="升序" name="asc">
									</u-radio>
								</u-radio-group>
							</view>
						</view>
					</view>
					<vol-form :load-key="false" ref="search" @onChange="searchGridFormOnChange"
						:form-options.sync="searchFormOptions" :formFields.sync="searchFormFields">
					</vol-form>
					<view class="search-btns">
						<view class="btn">
							<u-button @click="resetSearchForm()" :customStyle="{'border-radius': '6px'}" type="success"
								icon="reload" text="重置"></u-button>
						</view>
						<view class="btn">
							<u-button @click="searchClick" :customStyle="{'border-radius': '6px'}" type="primary"
								icon="search" text="搜索"></u-button>
						</view>
					</view>
				</view>
			</view>
		</u-popup>

		<!-- 搜索请选择排序字段 -->
		<view class="sort-form-popup">
			<u-popup @touchmove.prevent :zIndex="9999999" :show="sortSelectModel" @close="sortSelectModel=false;">
				<view class="vol-action-sheet-select-container" style="max-height:400px">
					<view class="vol-action-sheet-select-title">请选择排序
					</view>
					<view class="search-action-sheet-select-content">
						<view v-show="item.type!='group'" @click="sortSelectClick(item)" :key="index"
							v-for="(item,index) in searchFormOptions" class="serch-action-sheet-select-item">
							{{item.title}}
						</view>
					</view>
				</view>
			</u-popup>
		</view>

		<!-- 		新建编辑操作 -->
		<u-popup @touchmove.prevent :zIndex="999999" :show="model" @close="model=false">
			<view class="vol-action-sheet-select-container" :style="{'max-height':(maxHeight+'px')}">
				<view class="vol-action-sheet-select-title">
					{{buttons.length?(currentAction=='Add'?'新增':'编辑'):'基本信息'}}
					<view class="f-icon" @click="model=false">取消</view>
				</view>
				<slot name="modelHeader"></slot>
				<view class="vol-action-sheet-select-content">
					<vol-form @input-confirm="inputConfirm" :labelWidth="labelWidth" :load-key="false"
						@onChange="editGirdFormOnChange" ref="form" @extraClick="gridExtraClick"
						:form-options.sync="editFormOptions" :formFields.sync="editFormFields">
					</vol-form>
				</view>
				<slot name="modelBody"></slot>
				<view class="btns" :class="{'l-btn':buttons.length>4}">
					<view v-show="!btn.hidden" class="btn" v-for="(btn,index) in buttons" :key="index">
						<u-button @click="btnClick(btn)" :customStyle="{'border-radius': '6px'}" :type="btn.type"
							:icon="btn.icon" :text="btn.name"></u-button>
					</view>
					<view style="padding: 0 20rpx;width: 100%;" v-if="!buttons.length">
						<u-button @click="model=false" :customStyle="{'border-radius': '6px'}" type="primary"
							text="关 闭"></u-button>
					</view>
				</view>
				<slot name="modelFooter"></slot>
			</view>
		</u-popup>
		<!-- 	↑↓ 表格排序，查询最后面增加一个排序字段选择-->
		<!-- 	<view class="fab-buttons">
			<view class="icon-item" v-show="showFabButons" v-for="(btn,index) in fabButtons" :key="index"
				style="background-color: #ffff;">
			
				<u-icon :color="btn.color" @click="griFabBtnClick(btn)" :name="btn.icon" size="20"></u-icon>
			</view>
		
			<view class="switch-btn" v-show="showButtons" @click="showFabButons=!showFabButons">
				<u-icon color="#1890FF" name="list-dot" size="20"></u-icon>
			</view>
		</view> -->
		<view class="grid-u-model">
			<u-modal :show="showDel" cancelText="取消" :showCancelButton="true" :showConfirmButton="true"
				@cancel="cancelDel" @confirm="confirmDel" title="警告">
				<view style="color: red;">确定要删除此数据吗!</view>
			</u-modal>
		</view>
	</view>
</template>

<script>
	export default {
		name: "view-grid",
		props: {
			options: {
				type: Object,
				default: () => {
					return {
						columns: [],
						detail: [],
						editFormFields: {},
						editFormOptions: [],
						searchFormFields: {},
						searchFormOptions: [],
						table: {},
						extend: () => {
							return {
								methods: {

								}
							}
						}
					}
				}
			}
		},
		data() {
			return {
				rowTotal: 0,
				isWx: false,
				className: 'vol-table-888888',
				rowIndex: false, //是否显示table的行号
				load: true, //是否默认加载table表格数据
				height: 0, //当前table/列表高度
				direction: "list", //页面显示方向"horizontal"//list
				titleField: "", //如果table表格属性direction是以list显示，可以指定第一个标题
				fabButtons: [], //浮动按钮、查询、刷新、添加
				currentAction: 'Add', //当前操作状态
				currentRow: {}, //当前编辑的行
				maxHeight: 0,
				model: false, //新建编辑弹出框
				showFabButons: true,
				showButtons: true, //是否显示浮动按钮
				textInline: true, //超出是否换行显示
				columns: this.options.columns,
				editFormFields: JSON.parse(JSON.stringify(this.options.editFormFields)),
				searchFormOptions: this.options.searchFormOptions,
				searchFormFields: JSON.parse(JSON.stringify(this.options.searchFormFields)),
				editFormOptions: this.options.editFormOptions,
				permission: [],
				buttons: [], //新建编辑弹出框中的按钮
				hasEditpermission: false, //是否有编辑、新建权限
				searchModel: false, //搜索弹出框
				sortField: '',
				sortName: '',
				orderType: 'desc',
				sortSelectModel: false, //排序弹出框
				tableUrl: "", //table加载的url地址
				tableAction: "", //指定表名的权限
				showDel: false,
				isCreated: false,
				labelWidth: 80, //编辑弹出框表单标签的宽度
				ck:false //设置显示checkbox，只有水平(table)显示类型时才生效
			}
		},
		methods: {
			onInited() {
				console.log("viewgridinit")
			},
			onTableCreated() {
				this.onInited();
			},
			cellFormatter(row, column, index, callback) {
				if (this.formatter) {
					return callback(this.formatter(row, column, index));
				}
				return callback(row[column.field]);
			},
			gridRowClick(index, row, columns) {
				this.currentRow = row;
				this.currentAction = 'Update';
				this.hiddenDelButton(false)
				//this.editFormFields.Name=Math.random();
				if (this.$refs.form) {
					this.$refs.form.reset(row);
				} else {
					this.resetEditForm(row)
				}

				// Object.assign(this.editFormFields, row);
				if (this.rowClick && !this.rowClick(index, row, columns)) {
					return;
				};
				if (this.modelOpenBefore(row) && this.modelOpenAfter(row)) {
					this.model = true;
				}
			},
			gridCellClick(index, row, column) {
				if (this.cellClick && !this.cellClick(index, row, column)) {
					return;
				};
			},
			hiddenDelButton(hidden) {
				let delButton = this.buttons.find(x => {
					return x.value == 'del'
				});
				if (delButton) {
					delButton.hidden = hidden;
				}
			},
			gridAdd() {
				this.currentAction = 'Add';
				this.hiddenDelButton(true);
				this.resetEditForm();
				if (this.modelOpenBefore(null) && this.modelOpenAfter(null)) {
					this.model = true;
				}
			},
			resetEditForm(source) {
				if (this.$refs.form) {
					this.$refs.form.reset(source);
					return;
				}
				//如果是编辑要保留主键值
				this.resetGridForm(this.editFormFields, source, this.options.editFormOptions);

			},
			btnClick(btn) {
				//console.log(btn.onClick)
				btn.onClick.call(this)
			},
			modelOpenBefore(row) {
				return true
			},
			modelOpenAfter(row) {
				return true
			},
			showSearch() {
				this.searchModel = true;
			},
			resetGridForm(formFields, source, formOptions) {
				for (const key in formFields) {
					if (source && source.hasOwnProperty(key)) {
						formFields[key] = source[key];
					} else {
						if (Array.isArray(formFields[key])) {
							formFields[key].splice(0);
							if (formOptions.some(x => {
									return x.field == key && x.range
								})) {
								formFields[key].push(...['', '']);
							}
						} else {
							formFields[key] = ""
						}
					}
				}
			},
			resetSearchForm() {
				this.sortField = '';
				this.sortName = '';
				this.resetGridForm(this.searchFormFields, null, this.options.searchFormOptions);
			},
			searchClick() {
				this.searchModel = false;
				//this.$refs.table.load(null,true);
				this.refresh();
			},
			search() {
				this.refresh();
			},
			refresh() { //刷新
				this.$refs.table.load(null, true);
			},
			sortSelectClick(item) {
				this.sortField = item.field;
				this.sortName = item.title;
				this.sortSelectModel = false;
				//	this.order
			},
			editGirdFormOnChange(field, value,item) { //编辑新建表单的select、日期组件选择事件
				this.editFormOnChange && this.editFormOnChange(field, value,item)
			},
			searchGridFormOnChange(field, value,item) { //查询表单的select、日期组件选择事件
				this.searchFormOnChange && this.searchFormOnChange(field, value,item)
			},
			getSearchItem(field) { //获取查询的参数
				let data = this.searchFormOptions.find(x => {
					return x.field == field
				});
				return (data || {}).type
			},
			getSearchParameters() { //获取查询参数
				let query = {
					wheres: []
				};
				for (const key in this.searchFormFields) {
					let value = this.searchFormFields[key];
					if (this.base.isEmpty(value)) continue;
					if (typeof value == "number") {
						value = value + "";
					}
					let displayType = this.getSearchItem(key);
					//联级只保留选中节点的最后一个值
					if (displayType == "cascader" && Array.isArray(value)) {
						//查询下面所有的子节点，如：选中的是父节点，应该查询下面所有的节点数据--待完
						value = value.length ? (value[value.length - 1] + "") : "";
					}
					//区间查询,待完
					if (
						typeof value == "string" || ["date", "datetime", "range"].indexOf(displayType) == -1
					) {

						query.wheres.push({
							name: key,
							value: typeof value == "string" ? (value + '').trim() : value.join(","),
							displayType: displayType
						});
						continue;
					}
					for (let index = 0; index < value.length; index++) {
						if (!this.base.isEmpty(value[index])) {
							query.wheres.push({
								name: key,
								value: (value[index] + '').trim(),
								displayType: (() => {
									if (["date", "datetime", "range"].indexOf(displayType) != -1) {
										return index ? "lessorequal" : "thanorequal";
									}
									return displayType;
								})()
							});
						}
					}
				}
				return query;
			},
			loadGridTableBefore(param, callback) { //查询前
				param.wheres = this.getSearchParameters().wheres;
				if (this.orderType) {
					param.order = this.orderType;
				}
				if (this.sortField) {
					param.sort = this.sortField;
				}

				if (this.searchBefore && !this.searchBefore(param)) {
					return callback(false);
				}
				callback(true)
			},
			loadGridTableAfter(data, callback) { //查询后
				this.rowTotal = data.total;
				if (this.searchAfter && !this.searchAfter(data.rows, data)) {
					return callback(false);
				}
				callback(true)
			},
			gridDel() {
				this.showDel = true;
			},
			cancelDel() {
				this.showDel = false;
			},
			confirmDel() {
				let url = 'api' + this.options.table.url + 'del';
				let key = this.currentRow[this.options.table.key];
				if (this.delBefore && !this.delBefore(key, this.currentRow)) {
					return;
				}
				this.http.post(url, [key], true).then(result => {
					this.$toast(result.message);
					this.showDel = false;
					if (!result.status) {
						return;
					}
					this.model = false;
					//刷新页面，如果是编辑不刷新页面，直接更新表格数据(但小程序上有问题)
					this.refresh();
					this.delAfter && !this.delAfter(key, this.currentRow);
				})
			},
			gridSave() {
				if (!this.$refs.form.validate()) {
					return;
				}
				let editFormFields = {};
				editFormFields[this.options.table.key] = this.currentRow[this.options.table.key]
				//将数组转换成string
				for (const key in this.editFormFields) {
					let _val = this.editFormFields[key];
					if (Array.isArray(_val)) {
						//上传的图片
						if (this.editFormOptions.some(x => {
								return x.field == key && x.type == 'img'
							})) {
							let imgs = _val.filter(c => {
								return c.orginUrl
							});
							imgs = imgs.map(m => {
								return m.orginUrl
							}).join(',');
							editFormFields[key] = imgs;
						} else {
							editFormFields[key] = _val.join(',');
						}
					} else {
						editFormFields[key] = _val
					}
					//文件上传待完
				}
				let formData = {
					mainData: editFormFields,
					detailData: null,
					delKeys: null
				};
				if (this.currentAction == 'Add') {
					if (this.addBefore && !this.addBefore(formData)) {
						return;
					}
				} else {
					if (this.updateBefore && !this.updateBefore(formData)) {
						return;
					}
				}
				let url = 'api' + this.options.table.url + (this.currentAction);
				this.http.post(url, formData, true).then(result => {
					this.$toast(result.message);
					if (!result.status) {
						return;
					}
					this.refresh();
					if (this.currentAction == 'Add') {
						if (this.addAfter && !this.addAfter(this.editFormFields)) {
							return;
						}
					} else if (this.updateAfter && !this.updateAfter(this.editFormFields)) {
						return;
					}
					this.model = false;
				})
			},
			initPermissionButtons() { //初始化按钮权限
				let _permission = (this.permission.find(x => {
					return (this.tableAction || this.options.table.name).toUpperCase() == x.tableName
						.toUpperCase()
				}) || {}).permission;
				if (!_permission) {
					return;
				}
				if (_permission.indexOf("Delete") != -1) {
					this.buttons.push({
						name: "删除",
						icon: 'close',
						value: 'del',
						hidden: true,
						type: 'error',
						onClick: () => {
							this.gridDel();
						}
					})
				}
				//新建、编辑弹出框按钮
				if (_permission.indexOf("Update") != -1 || _permission.indexOf("Add") != -1) {
					this.buttons.push(...[{
						name: "重置",
						icon: 'reload',
						value: 'reset',
						hidden: false,
						type: 'success',
						onClick: () => {
							this.resetEditForm();
						}
					}, {
						name: "提交",
						icon: 'checkbox-mark',
						value: 'add',
						hidden: false,
						type: 'primary',
						onClick: () => {
							this.gridSave();
						}
					}])
					this.hasEditpermission = true;
				} else {
					//没有编辑权限，将编辑表单的全部设置为只读
					this.editFormOptions.forEach(x => {
						x.readonly = true;
						x.required = false;
					})
				}
				//table界面浮动按钮
				let fabButtons = [{
					icon: "reload", //刷新
					value: "search",
					name: "刷新",
					size: '18',
					hidden: false,
					color: '#009688',
					onClick: () => {
						this.refresh();
					}
				}, {
					icon: "search",
					value: "search",
					name: "查询",
					hidden: false,
					size: '20',
					color: 'rgb(7 185 14)',
					onClick: () => {
						this.showSearch();
					}
				}]
				if (_permission.indexOf("Add") != -1) {
					fabButtons.unshift({
						icon: "plus", //添加
						hidden: false,
						name: "添加",
						size: '17',
						color: 'rgb(2, 171, 255)',
						onClick: () => {
							this.gridAdd();
						}
					})
				}
				this.fabButtons.push(...fabButtons);
			},
			async initPermission() {
				let permission = this.$store.getters.getMenu();
				if (permission.length) {
					this.permission = permission;
					this.initPermissionButtons();
					return;
				}
				await this.http.get("api/menu/getTreeMenu", {}, false).then(result => {
					this.permission = result.menu?result.menu:result;
					this.$store.commit("setPermission", result);
					this.initPermissionButtons();
				})
			},
			initSource() {
				let keys = [];
				keys.push(...this.columns.filter(x => {
					return x.bind && x.bind.key && !x.bind.data.length;
				}).map(x => {
					return x.bind.key
				}))
				keys.push(...this.searchFormOptions.filter(x => {
					return x.key || x.dataKey && !x.data.length
				}).map(x => {
					return x.key || x.dataKey
				}))
				keys.push(...this.editFormOptions.filter(x => {
					if (x.type == 'img' || x.type == "file" || x.type == 'excel') {
						x.url = "api/" + this.options.table.name + '/upload'
					}
					return x.key || x.dataKey && !x.data.length
				}).map(x => {
					return x.key || x.dataKey
				}))
				if (!keys.length) {
					return;
				}
				keys = [...new Set(keys)];
				this.http.post("api/Sys_Dictionary/GetVueDictionary", keys, false).then(result => {
					result.forEach(item => {
						this.columns.forEach(x => {
							if (x.bind && x.bind.key == item.dicNo) {
								x.bind.data = item.data;
							}
						})
						this.searchFormOptions.forEach(x => {
							if ((x.key || x.dataKey) == item.dicNo) {
								x.data = item.data;
							}
						})
						this.editFormOptions.forEach(x => {
							if ((x.key || x.dataKey) == item.dicNo) {
								x.data = item.data;
							}
						})
					})
				})
			},
			initSearchFormDateRange() {
				this.searchFormOptions.forEach(option => {
					if (option.type == 'date' || option.type == 'datetime' && !option.hasOwnProperty("range")) {
						if (!Array.isArray(this.searchFormFields[option.field])) {
							this.searchFormFields[option.field] = ['', ''];
						}
						option.range = true;
					}
				})
			},
			initFormAttr() {
				this.editFormOptions.forEach(x => {
					if (!x.hasOwnProperty('readonly')) {
						x.readonly = false;
					}
					if (!x.hasOwnProperty('required')) {
						x.required = false;
					}
				})
			},
			griFabBtnClick(btn) { //浮动按钮点击事件
				btn.onClick();
			},
			getRowButtons(index, row, callback) {
				if (this.rowButtons) {
					callback(this.rowButtons(index, row))
					return;
				}
				return [];
			},
			gridRowButtonClick(btn, index, row) {
				this.rowButtonClick && this.rowButtonClick(btn, index, row);
			},
			gridExtraClick(option, fields) {
				this.extraClick && this.extraClick(option, fields);
			},
			inputConfirm(field, e) { //input回车事件
				console.log(field)
			}
		},
		async created() {
			this.initSearchFormDateRange();
			await this.initPermission();
			this.isCreated = true;
			let _$this = this;
			// uni.getSystemInfo({
			// 	success: function(res) {
			// 		_$this.height = res.windowHeight - 10;
			// 	}
			// });
			this.titleField = (this.columns.find(x => {
				return x.link
			}) || {}).field;
			this.tableUrl = 'api' + this.options.table.url + 'getPageData';



			let extend;
			// #ifdef MP-WEIXIN
			this.isWx = true;
			if (_$this.$parent.options.extend && typeof _$this.$parent.options.extend == 'function') {
				extend = _$this.$parent.options.extend();
				if (extend.methods) {
					Object.assign(_$this, extend.methods)
				}
			}
			// #endif
			if (_$this.options.extend && typeof _$this.options.extend == 'function') {
				extend = _$this.options.extend();
				if (extend.methods) {
					Object.assign(_$this, extend.methods)
				}
			}

			if (!this.isWx) {
				this.onInited();
				this.initSource();
			}
		},
		mounted() {
			if (this.isWx) {
				this.onInited();
				this.initSource();
			}
			if (!this.height || this.height < 0) {
				uni.getSystemInfo({
					success: (resu) => {
						var view = uni.createSelectorQuery().in(this).select(".view-grid-list");
						view.boundingClientRect().exec(res => {
							let h = 0;
							if (this.columns.some(x => {
									return x.summary
								})) {
								h = 49
							}
							this.height = resu.windowHeight - res[0].top - h;
							// - (this.direction ==
							// 	'list' ?
							// 	0 : 52)
							console.log(this.height)
						})
					}
				})
			}
			uni.getSystemInfo({
				success: (res) => {
					this.maxHeight = res.screenHeight * 0.82;
				}
			});
		},
		watch: {
			// #ifdef MP-WEIXIN
			columns: {
				handler(newValue, oldValue) {
					console.log('change2222');
				},
				immediate: true,
				deep: true
			},
			// #endif
		}
	}
</script>

<style lang="less" scoped>
	.view-grid {
		height: 100%;
		overflow: hidden;
		background: #f9f9f9;

		.fx-height {
			height: 70rpx;

		}



		// background: #fbfbfb;
		.fx-header {
			padding: 0 20rpx;
			box-sizing: border-box;
			top: 0;
			position: absolute;
			display: flex;
			width: 100%;
			height: 70rpx;
			z-index: 99;
			background: #f7f7f7;
			align-items: center;

			.btn-item {
				height: 100%;
				align-items: center;
				display: flex;
				font-size: 28rpx;
				margin-left: 18rpx;
			}
		}

		.fx-header-total {
			flex: 1;
			font-size: 28rpx;
			color: #555;
			box-sizing: border-box;

			.fx-header-row-total {
				font-weight: bolder;
				font-size: 30rpx;
				margin: 0 6rpx;
			}
		}
	}

	.vol-action-sheet-select-container {
		min-height: 600rpx;
		display: flex;
		flex-direction: column;

		.vol-action-sheet-select-title {
			padding: 24rpx;
			text-align: center;
			position: relative;
			border-bottom: 1px solid rgb(233 233 233);

			// .vol-action-sheet-select-confirm {
			// 	position: absolute;
			// 	right: 30rpx;
			// 	color: #007AFF;
			// 	font-weight: 500;
			// }

			.f-icon {
				position: absolute;
				right: 0rpx;
				top: 0;
				font-size: 28rpx;
				color: #2979FF;
				line-height: 49px;
				height: 47px;
				width: 80px;
				padding-right: 30rpx;
				text-align: right;
			}
		}

		.vol-action-sheet-select-content {
			flex: 1;
			height: 0;
			background: #f7f7f7;
			overflow: scroll;
		}

		.btns {
			display: flex;
			padding: 30rpx 20rpx 40rpx 0;
			background: #f7f7f7;

			.btn {
				flex: 1;
				margin-left: 20rpx;
			}
		}

		.l-btn {
			display: inline-block;
			width: 100%;

			.btn {
				float: left;
				width: 31.5%;
				margin-left: 1.5%;
				margin-top: 20rpx;
			}
		}
	}

	.search-btns {
		display: flex;
		padding: 30rpx 20rpx 40rpx 0;
		background: #f7f7f7;

		.btn {
			flex: 1;
			margin-left: 20rpx;
		}
	}

	.fab-buttons {
		position: absolute;
		z-index: 999;
		bottom: 240rpx;
		right: 20rpx;

		.icon-item {
			margin-bottom: 22rpx;
			padding: 16rpx;
			background: #eee;
			border-radius: 50%;
			border: 1px solid #f9f9f9;
			box-shadow: 1px 6rpx 20rpx rgb(225 225 225);
		}
	}

	.switch-btn {
		// position: absolute;
		z-index: 999;
		bottom: 160rpx;
		right: 2px;
		padding: 5px;
		background: #ecf5ff;
		border: 1px solid #eee;
		border-top-left-radius: 5px;
		border-bottom-left-radius: 5px;
	}

	.search-item {
		display: flex;
		background: #FFFFFF;
		padding: 30rpx 18rpx;
		border-bottom: 1px solid #eee;


		.f-form-label {
			width: 80px;
			position: relative;
			padding-left: 10px;
			color: #4c4c4c;
			font-size: 30rpx;
		}
	}

	.serch-action-sheet-select-item {
		border-bottom: 1px solid rgb(243 243 243);
		padding: 26rpx;
		text-align: center;
	}

	.vol-table-title-buttons {
		display: flex;
		padding-right: 26rpx;

		.vol-table-title-buttons-edit,
		.vol-table-title-buttons-del {
			padding: 0 10rpx;
		}
	}
</style>
<!-- <style scoped>
	.fab-buttons /deep/ {

		 .u-icon{
			    background: #eee;
			    border-radius: 50%;
		}
	}
</style> -->
