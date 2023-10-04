<template>
	<view>
		<u-toast ref="uToast"></u-toast>
		<view :style="{padding:padding+'rpx',display:item.hidden?'none':''}"
			:class="[labelPosition=='left'?'left-form-item':'top-form-item',item.type=='group'?'f-form-group':'']"
			class="f-form-item" v-for="(item,index) in formOptions" :key="index">
			<view class="f-form-label" v-if="item.type!='group'" :style="{maxWidth:labelWidth+'px',minWidth:'80px'}">
				<text class="f-form-label-required" v-if="item.require||item.required">*</text>
				<text>{{item.title}}</text>
			</view>
			<view v-if="item.readonly||item.disabled" style="flex: 1;font-size: 15px;text-align: right;">
				<view v-if="item.type=='img'" class="readonly-imgs">
					<image style="width: 70px;height: 70px;margin-left: 20rpx;border-radius: 10rpx;"
						@click="previewImage(item,imgIndex)" v-for="(src,imgIndex) in getImgSrcs(item)" :key="imgIndex"
						:src="src.url"></image>
				</view>
				<text v-else> {{formatReadonlyValue(item)}}</text>
			</view>
			<view v-else-if="item.type=='editor'">
				<u-parse :content="inFormFields[item.field]"></u-parse>
			</view>


			<view class="f-form-content f-form-content-select" @click="showCitySheet(item)"
				v-else-if="item.type=='city'">
				<view style="flex:1;">
					<view style="color:rgb(192 196 204);font-size:15px;padding-right: 12rpx;"
						v-show="base.isEmpty(inFormFields[item.field],true)">
						{{'请选择'+item.title}}
					</view>
					<view style="font-size:15px;" v-show="!base.isEmpty(inFormFields[item.field],true)">
						{{inFormFields[item.field].replaceAll(',','')}}
					</view>
				</view>
				<u-icon color="rgb(186 186 186)" size="15" name="arrow-right"></u-icon>
			</view>

			<template v-else-if="item.type=='date'||item.type=='datetime'||item.type=='month'">
				<template v-if="item.range">
					<view style="flex: 1;" :style="{'max-width': item.type=='date'?'120rpx':'30rpx'}"></view>
					<view class="f-form-content f-form-content-select" style="text-align: left;"
						@click="showPicker(item,0)">
						<view style="color:rgb(192 196 204);font-size:15px;" v-show="!inFormFields[item.field][0]">
							开始时间
						</view>
						<view style="flex:1;">
							<view style="font-size:15px;">
								{{item.type=='date'?(inFormFields[item.field][0]||'').substr(0,10):inFormFields[item.field][0]}}
							</view>
						</view>
						<!-- <u-icon name="arrow-right"></u-icon> -->
					</view>
					<text style="margin:0 0rpx;">-</text>
					<view class="f-form-content f-form-content-select" @click="showPicker(item,1)">
						<view style="color:rgb(192 196 204);font-size:15px;text-align: right; width: 100%;"
							v-show="!inFormFields[item.field][1]">
							结束时间
						</view>
						<view style="flex:1;">
							<view style="font-size:15px;text-align: right;">
								{{item.type=='date'?(inFormFields[item.field][1]||'').substr(0,10):inFormFields[item.field][1]}}
							</view>
						</view>
						<!-- <u-icon name="arrow-right"></u-icon> -->
					</view>
				</template>
				<view v-else class="f-form-content f-form-content-select" @click="showPicker(item)">
					<view style="color:rgb(192 196 204);font-size:15px;width: 100%;padding-right: 10rpx;"
						v-show="!inFormFields[item.field]">
						{{'请选择'+item.title}}
					</view>
					<view style="flex:1;">
						<view style="font-size:15px;padding-right: 12rpx;">
							{{item.type=='date'?(inFormFields[item.field]||'').substr(0,10):
							  (item.type=='month'?(inFormFields[item.field]||'').substr(0,7):inFormFields[item.field])
							}}
						</view>
					</view>
					<u-icon color="rgb(186 186 186)" size="15" name="arrow-right"></u-icon>
				</view>
			</template>

			<template v-else-if="item.range">
				<view style="flex: 1;max-width: 120rpx;"></view>
				<view class="f-form-content f-form-content-select" style="text-align: left;">
					<view style="flex:1;">
						<view style="font-size:15px;">
							<input placeholder-style="color:rgb(192 196 204);font-size:15px;" type="number"
								v-model="inFormFields[item.field][0]" border="none" :ref="item.field"
								:placeholder="item.placeholder||('请输入'+item.title)"></input>
						</view>
					</view>
				</view>
				<text style="margin:0 0rpx;">-</text>
				<view class="f-form-content f-form-content-select">
					<input placeholder-style="color:rgb(192 196 204);font-size:15px;" type="number"
						v-model="inFormFields[item.field][1]" border="none" :ref="item.field"
						:placeholder="item.placeholder||('请输入'+item.title)"></input>
				</view>
			</template>

			<view class="f-form-content f-form-content-select" @click="showActionSheet(item)"
				v-else-if="['select','selectList','checkbox','cascader'].indexOf(item.type)!=-1">
				<view style="flex:1;">
					<view style="color:rgb(192 196 204);font-size:15px;padding-right: 12rpx;"
						v-show="base.isEmpty(inFormFields[item.field],true)">
						{{'请选择'+item.title}}
					</view>
					<view style="font-size:15px;" v-show="!base.isEmpty(inFormFields[item.field],true)">
						{{formatDicValue(item)}}
					</view>
				</view>
				<u-icon color="rgb(186 186 186)" size="15" name="arrow-right"></u-icon>
			</view>


			<view class="f-form-group-content" :style="item.style" v-else-if="item.type=='group'">
				{{item.title||''}}
			</view>

			<view class="f-form-content" v-else-if="item.type=='number'">
				<input :focus="item.focus" :ref="item.field" placeholder-style="color:rgb(192 196 204);font-size:15px;"
					type="number" v-model="formFields[item.field]" border="none"
					:placeholder="item.placeholder||('请输入'+item.title)"></input>
			</view>
			<view class="f-form-content" v-else-if="item.type=='decimal'">
				<input :focus="item.focus" :ref="item.field" placeholder-style="color:rgb(192 196 204);font-size:15px;"
					type="digit" v-model="formFields[item.field]" border="none"
					:placeholder="item.placeholder||('请输入'+item.title)"></input>
			</view>
			<view class="f-form-content f-form-content-group" v-else-if="item.type=='radio'">
				<!--  <view> -->
				<u-radio-group @change="(val)=>{radioOnChange(val,item)}"
					:placement="item.placement" v-model="formFields[item.field]">
					<u-radio v-for="(option,opIndex) in item.data"
						:customStyle="{'margin-bottom':item.placement=='column'?'30rpx':0,'margin-right':item.placement=='column'?'0':'30rpx'}"
						:label="option.value" :name="option.key">
					</u-radio>
				</u-radio-group>
				<!-- 	  </view> -->
			</view>
			<view class="f-form-content f-form-content-group" v-else-if="item.type=='switch'">
				<u-radio-group @change="(val)=>{radioOnChange(val,item)}" :placement="item.placement"
					v-model="formFields[item.field]" placement="row">
					<u-radio :customStyle="{'margin-right': '40rpx'}" label="是" :name="1">
					</u-radio>
					<u-radio label="否" :name="0">
					</u-radio>
				</u-radio-group>
			</view>
			<view class="f-form-content" v-else-if="item.type=='textarea'">
				<textarea :focus="item.focus" :ref="item.field" auto-height style="width: 100%;padding-right: 8rpx;"
					v-model="inFormFields[item.field]" border="none"
					:placeholder="item.placeholder||('请输入'+item.title)"></textarea>
			</view>
			<!-- 	 -->
			<u-upload :ref="item.field" :sizeType="['compressed']" v-else-if="item.type=='img'"
				:fileList="inFormFields[item.field]" @afterRead="(event)=>{afterRead(item,event)}"
				@delete="(event)=>{deletePic(item,event)}" name="3" :multiple="item.multiple"
				:maxCount="item.maxCount||item.maxFile||1" :previewFullImage="true"></u-upload>
			<view class="f-form-content" v-else-if="item.type=='password'">
				<input placeholder-style="color:rgb(192 196 204);font-size:15px;" type="password"
					v-model="inFormFields[item.field]" border="none" :ref="item.field"
					:placeholder="item.placeholder||('请输入'+item.title)"></input>
			</view>
			<view class="f-form-content" v-else>
				<input :focus="item.focus" placeholder-style="color:rgb(192 196 204);font-size:15px;" type="text"
					@confirm="(e)=>{inputConfirm(item.field,e)}" v-model="inFormFields[item.field]" border="none"
					:ref="item.field" :placeholder="item.placeholder||('请输入'+item.title)"></input>
			</view>
			<view v-if="item.extra" :style="item.extra.style" style="display: flex;"
				@click="extraClick(item,inFormFields)">
				<u-icon v-if="item.extra.icon" :name="item.extra.icon" :color="item.extra.color"
					:size="item.extra.size">
				</u-icon>
				<text>{{item.extra.text}}</text>
			</view>
		</view>
		<slot></slot>
		<!--日期 -->
		<u-datetime-picker class="form-popup" :minDate="pickerCurrentItem.min" :maxDate="pickerCurrentItem.max"
			:zIndex="9999999" :closeOnClickOverlay="true" :show="pickerModel" :value="pickerValue"
			:mode="pickerCurrentItem.type=='month'?'year-month':pickerCurrentItem.type" closeOnClickOverlay
			@confirm="pickerConfirm" @cancel="pickerClose" @close="pickerClose"></u-datetime-picker>
		<!--  下拉框 -->
		<u-popup @touchmove.prevent class="form-popup" :zIndex="999999" :show="actionSheetModel"
			@close="actionSheetModel=false;">
			<view class="vol-action-sheet-select-container" :style="{'height':(popupHeight+'px')}">
				<view class="vol-action-sheet-select-title">请选择{{actionSheetCurrentItem.title}}
					<text class="vol-action-sheet-select-confirm" @click="actionConfirmClick">确定</text>
				</view>
				<!-- 	超过10个下拉框选项默认开启搜索 -->
				<!-- 	 -->
				<view v-if="showFilter" class="vol-action-sheet-select-filter">
					<u-search @custom="searchText=''" placeholder="请输入关键字搜索" :showAction="true" actionText="清除"
						:animation="false" v-model="searchText">
					</u-search>
					<!-- @search="search" @custom="searchClick" -->
					<!-- 	<view style="padding-left:20rpx;flex:1;font-size: 22px;color: #909399;background: white;">
						<u--input placeholder="请输入关键字搜索" v-model="searchText">
						</u--input>
					</view>
					<view class="search-btn">
						<u-button :plain="true" :hairline="true" :customStyle="{padding:'10rpx 20rpx'}" shape="circle"
							type="primary" icon="trash" @click="searchText=''" size="small">清除</u-button>
					</view> -->
				</view>
				<view class="vol-action-sheet-select-content">
					<view :class="{'vol-action-sheet-select-actived':actionSheetModel&&isActionSelected(item)}"
						@click="actionClick(item)"
						v-show="!item.hidden&&(!searchText||item.value.indexOf(searchText)!=-1)" :key="index"
						v-for="(item,index) in actionSheetCurrentItem.data" class="vol-action-sheet-select-item">
						{{item.value}}
					</view>
				</view>
			</view>
		</u-popup>

		<!--  树形级联组件 -->
		<vol-tree ref="cascader" :data="actionSascaderCurrentItem.data" :title="'请选择'+actionSascaderCurrentItem.title"
			:checkStrictly="actionSascaderCurrentItem.checkStrictly" @cancel="actionSascaderCurrentItem.cancel"
			@confirm="cascaderConfirm">
		</vol-tree>

		<!-- 		数字键盘 -->
		<!-- 	<u-keyboard ref="uKeyboard" @change="numberChange" @backspace="numberBackspace"
			:dotDisabled="numberCurrentItem.type=='decimal'" :z-index='999999999' mode="number" :show="numberModel">
		</u-keyboard> -->
		<lotus-address v-on:choseVal="onCitySelect" :lotusAddressData="lotusAddressData"></lotus-address>
	</view>
</template>

<script>
	import lotusAddress from "./../Winglau14-lotusAddress/Winglau14-lotusAddress.vue";
	export default {
		components: {
			lotusAddress
		},
		props: {
			formOptions: {
				type: Array,
				default: () => {
					return []
				}
			},
			formFields: {
				type: Object,
				default: () => {
					return {}
				}
			},
			padding: {
				type: Number,
				default: 30
			},
			labelWidth: {
				type: Number,
				default: 150
			},
			labelPosition: {
				type: String,
				default: 'left'
			},
			loadKey: {
				type: Boolean,
				default: true
			}
		},
		name: "vol-form",
		data() {
			return {
				lotusAddressData: {
					visible: false,
					provinceName: '',
					cityName: '',
					townName: '',
				},
				cityItem: {
					field: ""
				},
				region: '',
				showFilter: false,
				searchText: '', //搜索的内容
				inFormFields: {},
				inFormOptions: [],
				maxHeight: 400,
				popupHeight: 0,
				pickerValue: '',
				pickerModel: false, //日期组件
				pickerCurrentItem: {}, //当前选项
				pickerCurrentRangeIndex: 0,
				actionSheetModel: false,
				actionSascaderCurrentItem: {
					title: "",
					field: '',
					checkStrictly: false, //是否只能选择最后一个节点
					cancel: () => {},
					confirm: () => {},
					data: []
				},
				actionSheetCurrentItem: {
					min: 633715200000,
					max: 0
				}, //当前选项
				actionSheetSelectValues: [], //当前选中的项
				numberModel: false,
				numberType: 'number',
				numberCurrentItem: {},
				imgFields: []
			};
		},
		created() {
			//日期最小最大值转换
			this.formOptions.forEach(option => {
				if ((option.type == 'date' || option.type == 'datetime' || option.type == 'month')) {
					if (!option.min) {
						option.min = Number(new Date('1990/01/01 00:00:00')) //
					} else if (typeof option.min == 'string') {
						if (option.type == 'month' && option.min.length != 7) {
							option.min = option.min.substring(0, 7);
						}
						option.min = Number(new Date(option.min.replace(/-/g, "/")))
					}
					if (!option.max) {
						option.max = Number(new Date(new Date().getFullYear() + 10 + '/01/01 00:00:00')) //
					} else if (option.max && typeof option.max == 'string') {
						option.max = Number(new Date(option.max.replace(/-/g, "/")))
					}
					if (!this.pickerCurrentItem.max) {
						this.pickerCurrentItem.max = option.max;
					}
				}

				if (option.hasOwnProperty('focus')) {
					option.focus = false;
				}
			})
			this.inFormOptions = this.formOptions;
			this.inFormFields = this.formFields;
			this.imgFields = this.inFormOptions.filter(x => {
				return x.type == 'img'
			}).map(x => {
				return x.field
			});
			if (this.imgFields.length) {
				this.convertImgArr(this.formFields)
			} else {
				this.imgFields = null;
			}
			if (!this.loadKey) {
				return;
			}
			let dicKeys = this.formOptions.filter(x => {
				return x.key || x.dataKey
			}).map(m => {
				return m.key || m.dataKey
			});
			if (!dicKeys.length) {
				return;
			}
			this.http.post('api/Sys_Dictionary/GetVueDictionary', dicKeys, true).then(result => {
				this.initDataSource(result)
			})
		},
		mounted() {
			var _this = this;
			uni.getSystemInfo({
				success: function(res) {
					_this.maxHeight = res.screenHeight * 0.85;
				}
			});
		},
		methods: {
			inputConfirm(field, e) {
				this.$emit('input-confirm', field, e);
			},
			convertImgArr(formFields) {
				if (!this.imgFields) {
					return;
				}
				for (let i = 0; i < this.imgFields.length; i++) {
					let field = this.imgFields[i];
					if (!Array.isArray(formFields[field])) {
						if (this.base.isEmpty(formFields[field])) {
							formFields[field] = [];
						} else {
							formFields[field] = formFields[field].split(',').map(x => {
								return {
									url: this.http.ipAddress + x,
									orginUrl: x //原图
								}
							});
						}
					}
				}
			},
			initDataSource(result) {
				result.forEach(res => {
					this.inFormOptions.forEach(option => {
						if ((option.key || option.dataKey) == res.dicNo) {
							option.data = res.data;
						}
					})
				})
				this.$emit('dicInited', result);
			},
			cascaderConfirm(value, item) {
				this.inFormFields[this.actionSascaderCurrentItem.field] = value;
				this.$emit("onChange", this.actionSascaderCurrentItem.field, value, item);
			},
			showActionSheet(item) {
				if (item.type == 'cascader') {
					this.actionSascaderCurrentItem.field = item.field;
					this.actionSascaderCurrentItem.data.splice(0);
					this.actionSascaderCurrentItem.checkStrictly = item.checkStrictly || false; //是否只能选择最后一个节点
					this.actionSascaderCurrentItem.data.push(...item.data);
					this.$refs.cascader.show(this.inFormFields[item.field]);
					//this.actionSascaderCurrentItem.cancel = item.cancel;
					//this.actionSascaderCurrentItem.confirm = item.confirm;
					return;
				}
				this.searchText = '';
				this.actionSheetSelectValues = [];
				this.actionSheetCurrentItem = item;
				var value = this.inFormFields[item.field];
				if (!this.base.isEmpty(value, true)) {
					if (Array.isArray(value)) {
						this.actionSheetSelectValues.push(...value.map(x => {
							return x;
						}));
					} else if (this.isMultiSelect()) {
						this.actionSheetSelectValues = value.split(',');
					} else {
						this.actionSheetSelectValues.push(value);
					}
				}
				this.showFilter = item.data.length > 15;
				let height = (item.data.length + 1 + (this.showFilter ? 1 : 0)) * 50;
				this.popupHeight = height > this.maxHeight ? this.maxHeight : height;
				this.actionSheetModel = true;
			},
			actionClick(item) {
				//多选
				if (this.isMultiSelect()) {
					//已经选中过的再次点取消选选中
					if (this.isActionSelected(item)) {
						this.actionSheetSelectValues = this.actionSheetSelectValues.filter(x => {
							return x + '' !== item.key + ''
						});
					} else {
						this.actionSheetSelectValues.push(item.key)
					}
					return;
				}
				this.inFormFields[this.actionSheetCurrentItem.field] = item.key;
				this.actionSheetModel = false;
				this.$emit("onChange", this.actionSheetCurrentItem.field, this.inFormFields[this.actionSheetCurrentItem
					.field], item);
			},
			isMultiSelect(item) {
				var type;
				if (item) {
					type = item.type;
				} else {
					type = this.actionSheetCurrentItem.type
				}
				if (!type) {
					return false;
				}
				return ['checkbox', 'selectList'].indexOf(type) != -1;
			},
			actionConfirmClick(item) {
				//单选
				if (!this.isMultiSelect()) {
					this.actionSheetModel = false;
					//	return this.actionClick(item)
				}
				//多选
				if (Array.isArray(this.inFormFields[this.actionSheetCurrentItem.field])) {
					//深复制原来的数据
					this.inFormFields[this.actionSheetCurrentItem.field] = this.actionSheetSelectValues.map(x => {
						return x
					});
				} else {
					this.inFormFields[this.actionSheetCurrentItem.field] = this.actionSheetSelectValues.join(',');
				}
				this.actionSheetModel = false;
			},
			isActionSelected(item) {
				let isSelect = this.actionSheetSelectValues.some(x => {
					return x + '' === item.key + ''
				});
				//this.formFields[item.field]
				return isSelect;
			},
			formatDicValueList(item) { //多选
				var value = this.inFormFields[item.field];
				if (this.base.isEmpty(value)) {
					return '';
				}
				var _textArr = [];

				if (!(Array.isArray(value))) {
					value = (value + '').split(',')
				}
				value.forEach(x => {
					var obj = item.data.find(c => {
						return x + '' === c.key + '';
					});
					if (obj) {
						_textArr.push(obj.value);
					} else {
						_textArr.push(x);
					}
				})
				return _textArr.join(",");
			},
			getAllParentId(id, data) {
				if (id === null || id === '' || id === undefined) {
					return []
				}
				if (data.some((x) => {
						return typeof(x.id) == 'string'
					})) {
					id = id + '';
				} else {
					id = id * 1;
				}
				let ids = [id];

				for (let index = 0; index < ids.length; index++) {
					var node = data.find((x) => {
						return x.id === ids[index]
					});
					if (!node || (node.parentId === null && node.parentId === undefined)) {
						return ids;
					}
					if (data.some(x => {
							return x.id === node.parentId
						})) {
						ids.push(node.parentId);
					}
				}

				return ids.reverse();
			},
			getCascaderNames(value, item) {
				let ids = this.getAllParentId(value, item.data);
				let names = [];
				for (let i = 0; i < ids.length; i++) {
					let obj = item.data.find(x => {
						return x.id === ids[i]
					});
					if (obj) {
						names.push(obj.value || obj.name)
					} else {
						names.push(ids[i])
					}
				}
				return names.join('/');
			},
			formatDicValue(item) {
				let value = this.inFormFields[item.field];
				if (this.base.isEmpty(value)) {
					return '';
				}
				if (item.type == 'cascader') {
					return this.getCascaderNames(value, item);
				}
				if (this.isMultiSelect(item)) {
					return this.formatDicValueList(item);
				}
				let _kv = item.data.find(x => {
					return x.key + '' == value + ''
				});
				if (!_kv) {
					return value;
				}
				return _kv.value;
			},
			showPicker(item, index) {
				this.pickerCurrentItem = item;
				let val = this.inFormFields[this.pickerCurrentItem.field];
				if (item.range) {
					this.pickerCurrentRangeIndex = index;
					if (!Array.isArray(val)) {
						this.inFormFields[this.pickerCurrentItem.field] = ['', ''];
						val = ['', ''];
					}
					val = val[index];
				}
				if (!val) {
					if (item.type == 'date') {
						val = this.base.getDate();
					} else if (item.type == 'month') {
						val = this.base.getDate();
					} else {
						val = this.base.getDateTime().substring(0, 16)
					}
				}
				this.pickerValue = Number(new Date(val.replace(/-/g, "/")))
				this.pickerModel = true;
				this.hideKeyboard();
			},
			setPickerValue(value) {
				if (this.pickerCurrentItem.range) {
					this.inFormFields[this.pickerCurrentItem.field][this.pickerCurrentRangeIndex] = value
				} else {
					this.inFormFields[this.pickerCurrentItem.field] = value
				}
				this.$emit("onChange", this.pickerCurrentItem.field, value);
			},
			pickerConfirm(e) {
				this.pickerModel = false;
				if (this.pickerCurrentItem.range && this.pickerCurrentRangeIndex == 1) {
					//判断结束时间大于开始时间
				}
				if (typeof e.value == 'number') {
					let timeFormat = this.pickerCurrentItem.type == 'date' ? 'yyyy-mm-dd' : 'yyyy-mm-dd hh:MM';
					this.setPickerValue(uni.$u.timeFormat(e.value, timeFormat))
				} else {
					this.setPickerValue(uni.$u.timeFormat(e.value))
				}
			},
			pickerClose() {
				this.pickerModel = false;
			},
			hideKeyboard() {
				uni.hideKeyboard()
			},
			reset(source) {
				for (const key in this.inFormFields) {
					if (source && source.hasOwnProperty(key)) {
						this.inFormFields[key] = source[key];
					} else {
						if (Array.isArray(this.inFormFields[key])) {
							this.inFormFields[key].splice(0);
							if (this.inFormOptions.some(x => {
									return x.field == key && x.range
								})) {
								this.inFormFields[key].push(...['', '']);
							}
						} else {
							this.inFormFields[key] = ""
						}
					}
				}
			},
			validate() {
				let _option = this.inFormOptions.filter(c => {
					return c.require || c.required
				}).find(x => {
					let val = this.inFormFields[x.field];
					if (Array.isArray(val)) {
						return !val.length
					} else {
						return (this.base.isEmpty(val))
					}
					return;
				});
				if (_option) {
					if (['date', 'datetime', 'month', 'checkbox', 'select', 'selectList', 'radio', 'switch'].indexOf(
							_option
							.type) != -
						1) {
						this.$toast('请选择' + _option.title, )
					} else {
						this.$toast(_option.title + '不能为空')
					}
					return false;
				}
				return true;
			},
			showNumber(item) {
				this.numberCurrentItem = item;
				this.numberModel = true;
			},
			numberBackspace() {
				let value = this.inFormFields[this.numberCurrentItem.field];
				if (value) {
					value = value + '';
					this.inFormFields[this.numberCurrentItem.field] = value.substr(0, value - 1);
				}
			},
			numberChange(val) {
				let _val = this.inFormFields[this.numberCurrentItem.field];
				if (this.base.isEmpty(_val)) {
					_val = '';
				} else {
					_val = _val + '';
				}
				if (val == '.' && _val.indexOf('.') != -1) {
					return;
				}
				this.inFormFields[this.numberCurrentItem.field] = _val + val;
			},
			formatReadonlyValue(item) {
				if (item.data) {
					return this.formatDicValue(item);
				}
				if (item.type == 'date') {
					return (this.inFormFields[item.field] || '').substr(0, 10);
				}
				return this.inFormFields[item.field] || '';
			},
			getImgSrcs(item) {
				let imgs = this.inFormFields[item.field];
				if (!imgs) {
					return []
				}
				if (Array.isArray(imgs)) {
					return imgs;
				}
				let imgArr = imgs.split(',');
				return imgArr.filter(x => {
					return x
				}).map(m => {
					//return this.http.ipAddress+'m'
					return m;
				})
				//this.http.ipAddress
			},
			async afterRead(option, event) {
				if (!option.url) {
					return this.$toast('未配置好url')
				}
				// 当设置 mutiple 为 true 时, file 为数组格式，否则为对象格式
				let lists = [];
				if (option.mutiple) {
					lists = [].concat(event.file)
				} else {
					if (Array.isArray(event.file)) {
						lists.push(...event.file)
					} else {
						lists.push(event.file)
					}
				}
				let fileListLen = this.inFormFields[option.field].length
				lists.map((item) => {
					this.inFormFields[option.field].push({
						...item,
						status: 'uploading',
						message: '上传中'
					})
				})
				for (let i = 0; i < lists.length; i++) {
					const result = await this.uploadFilePromise(lists[i].url, option.url)
					let item = this.inFormFields[option.field][fileListLen];
					let fileName = lists[i].name;
					if (!fileName && lists[i].thumb) {
						let lastIndex = lists[i].thumb.lastIndexOf('/') + 1;
						// let arr = lists[i].thumb.substr(0,lastIndex);
						// let _obj = arr[0].split('/');
						fileName = lists[i].thumb.substr(lastIndex)
					}
					this.inFormFields[option.field].splice(fileListLen, 1, Object.assign(item, {
						status: 'success',
						message: '',
						url: this.http.ipAddress + result + fileName,
						orginUrl: result + fileName
					}))
					fileListLen++
				}
			},
			uploadFilePromise(url, apiUrl) {
				return new Promise((resolve, reject) => {
					let a = uni.uploadFile({
						url: this.http.ipAddress + apiUrl, // 仅为示例，非真实的接口地址
						filePath: url,
						name: 'fileInput',
						header: {
							"uapp": 1,
							"Authorization": this.$store.getters.getToken()
						},
						formData: {},
						success: (res) => {
							setTimeout(() => {
								resolve(JSON.parse(res.data).data)
							}, 500)
						},
						fail(res) {
							this.$toast('上传失败')
							//console.log(res)
						}
					});
				})
			},
			// 删除图片
			deletePic(item, event) {
				this.inFormFields[item.field].splice(event.index, 1)
			},
			extraClick(item, inFormFields) {
				this.$emit('extraClick', item, inFormFields)
			},
			showCascaderSheet(item) {
				this.$refs[item.field][0].show();
			},
			onCitySelect(res) {
				//res数据源包括已选省市区与省市区code
				console.log(res);
				this.lotusAddressData.visible = res.visible; //visible为显示与关闭组件标识true显示false隐藏
				//res.isChose = 1省市区已选 res.isChose = 0;未选
				if (res.isChose) {
					this.lotusAddressData.provinceName = res.province; //省
					this.lotusAddressData.cityName = res.city; //市
					this.lotusAddressData.townName = res.town; //区
					this.inFormFields[this.cityItem.field] = res.province + ',' + res.city + ',' + res.town
					//this.region = `${res.province}${res.city}${res.town}`; //region为已选的省市区的值
				}
			},
			showCitySheet(item) {
				this.cityItem = item;
				const arr = (this.inFormFields[item.field] || '').split(',');
				this.lotusAddressData.provinceName = arr[0] || ''; //省
				this.lotusAddressData.cityName = arr[1] || ''; //市
				this.lotusAddressData.townName = arr[2] || ''; //区
				this.lotusAddressData.visible = true;
			},
			previewImage(item, imgIndex) {
				const imgs = this.getImgSrcs(item).map(x => {
					return x.url
				})
				uni.previewImage({
					urls: imgs,
					current: imgIndex
				})
			},
			radioOnChange(value, item) {
				this.$emit("onChange", item.field, value, item, item.data);
				//@change="(val)=>{radioOnChange(val,item)}" :placement="item.placement"
			}
		},
		// #ifdef MP-WEIXIN
		// 小程序不要使用循环生成表单,否则这里会死循环,与初始化的时候设置默认值有关,后面再处理
		watch: {
			inFormFields: {
				handler(val) {
					if (!val || !Object.keys(val).length) {
						return;
					}
					console.log('inFormFields')
					this.$emit('update:form-fields', val);
					//console.log("wc")
				},
				immediate: true,
				deep: true
			},
			formFields: {
				handler(val) {
					// console.log('formFields')
					this.convertImgArr(val)
					this.inFormFields = val;
				},
				immediate: true,
				deep: true
			},
			inFormOptions: {
				handler(newValue, oldValue) {
					if (!newValue || !newValue.length) {
						return;
					}
					this.convertImgArr(newValue)
					this.$emit('update:formOptions', newValue)
				},
				immediate: true,
				deep: true
			},
			formOptions: {
				handler(newValue, oldValue) {
					console.log('formOptions')
					this.inOptions = newValue;
				},
				immediate: true,
				deep: true
			}
		},
		// #endif
	}
</script>

<style lang="less" scoped>
	.vol-action-sheet-select-container {
		// min-height: 200rpx;
		// display: flex;
		// flex-direction: column;

		// .vol-action-sheet-select-title {
		// 	padding: 24rpx;
		// 	text-align: center;
		// 	position: relative;
		// 	border-bottom: 1px solid rgb(233 233 233);

		// 	.vol-action-sheet-select-confirm {
		// 		position: absolute;
		// 		right: 30rpx;
		// 		color: #007AFF;
		// 		font-weight: 500;
		// 	}
		// }
		.vol-action-sheet-select-filter {
			display: flex;
			background: #ffff;
			padding: 10rpx;
			border-bottom: 1px solid #eeee;

			.search-btn {
				position: relative;
				top: 3px;
				// margin-left: 20rpx;
				// padding-right: 20rpx;
				// width: 100rpx;
			}
		}

		.vol-action-sheet-select-content {

			// flex: 1;
			// height: 0;
			// overflow: scroll;
			.vol-action-sheet-select-item {
				border-bottom: 1px solid rgb(247 247 247);
				padding: 26rpx;
				text-align: center;
				position: relative;
				color: #5a5a5a;

				.vol-action-sheet-select-icon {
					position: absolute;
					// display: none;
					width: 70rpx;
					z-index: 999;
					right: 20rpx;
					padding: 0 10rpx;
					background: #FFFFFF;
				}
			}

			.vol-action-sheet-select-actived {
				color: red;
			}

			.vol-action-sheet-select-item:last-child {
				border-bottom: none;
			}
		}
	}

	.f-form-item {

		padding: 28rpx 0 24rpx 0;
		border-bottom: 1px solid #f5f5f5;

		.f-form-label {
			position: relative;
			color: #4c4c4c;
			font-size: 30rpx;
			margin-right: 20rpx;
		}

		.f-form-content-select {
			text-align: right;
			display: flex;
		}

		.f-form-label-required {
			color: red;
			font-size: 24rpx;
		}
	}

	.left-form-item {
		display: flex;
		background: #FFFFFF;

		.f-form-content {
			flex: 1;
			width: 0;
			text-align: right;
		}

		.f-form-label-required {
			margin-left: -12rpx;
			position: relative;
		}

		.f-form-label {
			position: relative;
			// padding-left: 10rpx;
			color: #4c4c4c;
			font-size: 30rpx;
		}
	}

	.top-form-item {
		background: #FFFFFF;

		.f-form-label {
			width: 100% !important;
			padding-bottom: 16rpx;
		}
	}

	.f-form-group {
		padding: 8rpx 20rpx !important;
		background: none;
		font-size: 28rpx;
		font-weight: bold;

		.f-form-group-content {}
	}

	/deep/ .u-icon {
		display: inline-flex;
	}
</style>
