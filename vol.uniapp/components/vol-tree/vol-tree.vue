<template>
	<view>
		<view class="vol-tree-mask" :class="{'show':showTree}" @tap="maskClick"></view>
		<view class="vol-tree-container" :class="{'show':showTree}">
			<view style="display: flex;flex-direction: column;height: 100%;" v-if="inited">
				<view class="vol-tree-header">
					<view class="vol-tree-header-title">{{title}}</view>
					<view class="vol-tree-header-confirm" hover-class="hover-c" @click="confirm">
						确定</view>
				</view>
				<view style="flex: 1;height: 0;overflow-x: scroll;">
					<view class="vol-tree-item" :class="{show: item.show||item.lv===0,checked:item.checked}"
						v-for="(item,index) in treeList" :key="index">
						<view class="vol-tree-item-child" @tap.stop="treeItemClick(item,index)">
							<view :style="{'margin-left':(item.lv*30)+'rpx'}" class="vol-tree-item-child-label">
								<image class="tree-left-icon" :src="getIcon(item)">
								</image> {{item.name}}
							</view>
							<view class="vol-tree-item-child-check">
								<u-icon v-if="item.checked" name="checkbox-mark" size="16" color="#2d92ff"></u-icon>
							</view>
						</view>
					</view>
				</view>
			</view>
		</view>
	</view>
</template>
<script>
	export default {
		props: {
			data: {
				type: Array,
				default: () => {
					return []
				}
			},
			checkStrictly: { //是否只能选择最后一个节点
				type: Boolean,
				default: false
			},
			title: {
				type: String,
				default: "标题"
			},
			closeIcon: {
				type: String,
				default: 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIAAAACACAYAAADDPmHLAAAAAXNSR0IArs4c6QAACc1JREFUeF7tnX+oHFcVx8/ZTV8xaoKY+IvGFAv+SNqKFlrUVAURIdDWtr6kghZ/1FRN9s2ZDQlVI2mgRRvJ3nPz2miX/gCDoImtlaaIVFFUsLW1sU3bGKjGpioGIzTV98J7YffI1Q28P97O3J2dnb27cwYCgT33nO/9ns+bHzs7dxB0K7UDWOrZ6+RBASg5BAqAAlByB0o+fd0DKAAld6Dk09c9gAJQcgdKPn3dAygAJXeg5NPXPYACkJ8D9Xp9VavVugYA3oaIKxDx9SKyNL8K/plEZLZSqRyrVCr37Nmz53n/keWKzGUPQEQ3AcAGAPhogPY9V61WNygEi3emLwCI6DoAqAHAhwNs/EJJTzHzZYFrHIq8zAAQ0R0AsH0oqjMURcSvGGO+mWHoWA/JBAARPQkAo/YX9U9mfsNYdzPD5HoGgIheAoALMtQKYciunERIDnnOAMApETlVqVSOG2OO5JCz5xQ9ARDH8QERmey5ig7wceAvIvJzRHyAmX/iMyCPGG8AiOhLALAvj6KaI9WB74nItLX28dTIPgO8AKjVasuq1epjAPAuj3qvAIAj+AUROYKIJz3G5BkyDQAX55lwiLliZuZB1vcCgIi+BgC3eQj5qYhE1tpjHrEDCZmamlpfqVQeGUjy4STdxcy3Dqq0LwCuoW9PETFQob0YEEXRDxHx+l7GhBxbqVSuajQahwahMRUAInJf8vwipfgzzPzuQQjMknPbtm0XnT179oUsY0Mdg4hXGGN+l7e+VADiOLYiMpVQ2F3OrGfmX+Ytrp98ROQOWe7QNRabiBw+c+bMumazOZvnhFIBICJ3Jnp5t6Iicq+11t0LCGqr1WrnV6vV4wDw5iRhiPg5EXFxhW6IuKbdbl+CiO8HgEs9i9/KzHl9l/G/kj4A/Mnd3esmEBFvMsbc6zmBQsOI6NMA8N2UojPM/JpChS0oFsfxq0TkfgDY6KHB3eFc12g0DnvEeoWkAhDH8csisrxbtmq1ujbkO21E5M5f0m5W7WDm270cG1BQvV7/SLvd/plH+tuZeYdHnFdIKgBElPi1JzOn5vBSMqAgz5NYmJiYWLZ79+5/D0iGV1oiIgAwKcHPMvMlXgk9glKbN+oAOA+I6DsAcHOSHyKyz1q72cOzgYZEUfQIIq5PKuLOHfbu3ftsHkJKAUDnsvAoAJxXlLFZmxNF0ecR8Z6k8Yh4tTHm4aw1Fo4rBQBuwnEc3yIi30gx9pAx5qo8jO0nBxH9PenqxV25GGPciWPfW2kA6FwWut8xjPx9AkTcboz5Vt/d97wMHOmTwIUmRVH0KUTcn4dxQ84xBwBfZeZGvzpKswc4ZxQR/RgAru7XuEDG/xkA7mDmZlY9ZQTA595GVj+HNe73rVZr4/T0tPvSrqetdAA4d6IougsRv9yTU+EHPy4i11hre/r9RSkB6FwW/hYAVobf154UPjo/P3/dvn37/uM7qpQAdPYCk4h4wNeoUYkTkR9Za93zGl5baQFYAME2AHgrALzRy7HRCNrCzHf5SC01AD4GDTtm8+bNq5csWXIlIl4JADcAwLI0TYj4/Nzc3BU+hwIFIM3NgD7funXrmlar5a79P5YmS0Rusda6p7cSNwUgzaEAP/f84euJ+fl5txf4R9IUFIAAG+wjKY7jpoh8ISlWRG6w1v5AAfBxdMRiiOhCAHgCAFZ0k46IXzfGJP6cX/cAI9b4hXKjKLoPET+bMIX9zHyj7gFGuMlJ0uM4/qKIfLtbjIg8Zq19nwIwpgDUarWLqtVq0vMP/2LmrocIZ4seAkYcjn5/sqcAKADJDvRL2Ij7G7z8fvuje4DgWzzYP1AFQAEYLGEj7m/w8vUQEHyLBitQARisv8FnVwCCb9FgBSoAg/U3+OwKQPAtGqxAIvobALylS5WTzPwmvRcw2B4MNXscxw+5n4MvJgIRDxpj3CruXTf9HmCo7cuneLfDgM/aDQpAPj0YepbOMr4fBIAWIj5hjPm4jygFwMelMY5RAMa4uT5TUwB8XBrjGAVgjJvrMzUFwMelMY5RAMa4uT5TUwB8XBrjGAVgjJvrMzUFwMelwGOIyC1wuWnBotPPAEDT5xFxBSDw5qbJIyL34s69XeKmmNm9QkfvBaQZOaqfx3H8nIisWUy/WyfAGLNWARjV7qbo3rRp03lLly6dTwqbnZ2daDabZ7vF6CFghOHYuXPnxOnTp92ikV235cuXn79r166ukCgAIwyAkx5F0VFEfOdi0xCRP1prE1/1pwCMPgAxIi66ZKyI1K21ie8fUABGHAAn371oQkRuPrcncH/5iHi3z0snFYAxAODcFCYnJyfc/w8ePJh4YrhwygrAGAGQZSoKQBbXxmiMAjBGzcwyFQUgi2tjNEYBGKNmZpmKApDFtTEaowCMUTOzTEUByOJagGP0wZAAm1KUJH00rCinA6yjD4cG2JQiJenj4UW6HWAtXSAiwKYUKUkBKNLtAGspAAE2pUhJCkCRbgdYSwEIsClFSlIAinQ7wFoKQIBNKVKSAlCk2wHWUgACbEqRkooAYAYAlnabVKvVWjU9Pf3XIiettf7vQOfdgccT/Jhl5lcn+eVzO/jFztu1F80jIhustQe1KcU7QESfAYD7EyqfYObVfQEQRdFTiPiebklExFhr68VPXysS0Z0A4NYG6PbHedha+96+ACCi7wPAxoQkbjGCDzHzy9qSYh0goicB4LIEAB6w1n6iLwCmpqaurVQqD6ZM7UFmvr7Y6Ze7GhG5FUHuTnHhRmbe3xcA27dvf+3c3NyLiPi6lGLXMvND5W5LcbNPO/tHxNMzMzOrm83m6b4AcIPjOJ4WkS1p00PEujEm8WnUtBz6ebIDRMTuqfA0nxDxTmOMWz4mcUu9CnCj6/X6qna7/Zukq4EFVR4FgIcR8Vi73X7aWnsyTYR+3t2BWq22slqtrkXENSLySQBY5+HXiUqlsq7RaLyUFusFgEsSRdEWRExccCitmH5ejAMiUrPWuiuE1M0bgM6h4ICITKZm1YBhOtBg5q2+AnoCwCUlIrdbucC3gMYV6sARZr60l4o9A9CBwH39eGEvhTR24A6cYuaVvVbJBIAeDnq1eeDxv2Zm97qYnrfMAHT2BLcBgLvUWNZzZR2QhwOvAMA0M+/ImqwvADoQuGXIHATu1WXd3l+XVZ+OW9wBdx52qNP8o/2Y1DcAC4vHcXw5AHxARC4GgHd0/q3oR6COhVMAcMz9E5GnEfFXzPyHvHzJFYC8RGme4hxQAIrzOshKCkCQbSlOlAJQnNdBVlIAgmxLcaIUgOK8DrKSAhBkW4oTpQAU53WQlRSAINtSnCgFoDivg6ykAATZluJEKQDFeR1kpf8CaNgdvSyRgj4AAAAASUVORK5CYII='
			},
			openIcon: { // 折叠时候的ic
				type: String,
				default: 'data:image/png;base64,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'
			},
			defaultIcon: { // 没有子集的ic
				type: String,
				default: 'data:image/png;base64,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'
			}
		},
		data() {
			return {
				inited: false,
				treeList: [],
				showTree: false,
				parentIds: [],
				value:null
			}
		},
		methods: {
			confirm() {
				this.showTree = false;
				let obj = this.treeList.find(x => {
					return x.checked
				}) || {};
				this.$emit('confirm', obj.id, obj);
			},
			getIcon(item) {
				if (item.hasChildren) {
					return item.open ? this.openIcon : this.closeIcon;
				}
				return this.defaultIcon;
			},
			dataKeyIsString() {
				return this.data.some((x) => {
					return typeof(x.id) == 'string'
				});
			},
			getAllParentId(id, data) {
				if (id === null || id === '' || id === undefined) {
					return []
				}
				if (this.dataKeyIsString()) {
					id = id + '';
				} else {
					id = id * 1;
				}
				var ids = [id]; // [parentNode.parentId];
				for (let index = 0; index < ids.length; index++) {
					var node = this.data.find((x) => {
						return x.id === ids[index]
					});
					if (!node || (node.parentId === null && node.parentId === undefined)) {
						return ids;
					}
					if (this.data.some(x => {
							return x.id === node.parentId
						})) {
						ids.push(node.parentId);
					}
				}
				return ids;
			},
			show(value) {
           this.value=value;
				// let parentIds = this.getAllParentId(value).reverse();

				// this.treeList.forEach(x => {
				// 	if (x.lv > 0) {
				// 		x.show = false;
				// 	}
				// 	x.open = false; // parentIds.indexOf(x.id) == -1 ? false : true;
				// 	x.checked = false;
				// })
				// if (!this.data.length) {
				// 	return;
				// }
				// if (!this.inited) {
				// 	this.initRootTreeData(this.data);
				// }

				// for (let i = 0; i < parentIds.length; i++) {
				// 	let parentId = parentIds[i];

				// 	this.treeList.forEach((item, index) => {
				// 		if (item.id === parentId) {
				// 			item.open = false;
				// 			this.treeItemClick(item, index)
				// 		}
				// 	})
				// }
				this.inited = true;
				this.showTree = true;
			},
			maskClick() {
				this.showTree = false;
			},
			treeItemClick(item, index) {

				this.treeList.forEach(x => {
					if (item.id !== x.id) {
						x.checked = false;
					}
					//x.checked =  item.id === x.id;
				})
				if (!item.hasChildren) {
					//最后一级可以任意取消
					item.checked = !item.checked;
				} else if (!this.checkStrictly || (this.checkStrictly && !item.hasChildren)) {
					//限制只能选择最后一个节点,不包括子节点时才可以选择
					item.checked = true;
				} else {
					item.checked = false;
				}
				if (!item.hasChildren) {
					return;
				}

				if (item.clicked) {
					this.toggleVisible(item);
					// /item.show = !item.show;
					return;
				}

				item.clicked = true;
				//获取子节点
				let itemChildren = this.data.filter(x => {
					return x.parentId == item.id
				})
				itemChildren = this.getList(itemChildren, this.data, item.lv + 1)
				this.treeList.splice(index + 1, 0, ...itemChildren);
				//	setTimeout(() => {
				this.toggleVisible(item, true)
				//}, 50)
				console.log(JSON.stringify(this.treeList))
			},
			toggleVisible(item) {
				const children = this.getTreeAllChildren(item.id, this.treeList);
				children.forEach(x => {
					x.show = !item.open; // show; // !item.show;
					if (x.clicked) {
						x.open = x.show;
					}
				})
				item.open = !item.open;
			},
			getTreeAllChildren(id, data) {
				//递归获取某个节点的所有子节点信息
				var _children = data.filter((x) => {
					return x.parentId === id;
				});
				const nodes = [..._children];
				const _parentIds = _children.map(x => {
					return x.id
				});
				for (let index = 0; index < _parentIds.length; index++) {
					data.forEach((_node) => {
						if (_node.parentId === _parentIds[index]) {
							_parentIds.push(_node.id);
							nodes.unshift(_node);
						}
					});
				}
				return nodes;
			},
			getList(list, data, lv) {
				return list.map(x => {
					let hasChildren = data.some(c => {
						return c.parentId === x.id && c.parentId != undefined
					})
					return {
						id: x.id,
						key: x.key,
						name:x.name|| x.value,
						parentId: x.parentId,
						checked: false,
						lv: lv,
						open: false,
						clicked: false,
						show: false, // lv > 0 ? true : false,
						hasChildren: hasChildren
					}
				})
			},
			initRootTreeData(list) { //获取一级节点
				if (!list.length) {
					return;
				}
				let _list = list.filter(x => {
					return !x.parentId || x.parentId === x.id || !list.some(c => {
						return x.parentId === c.id
					})
				})
				this.treeList = this.getList(_list, list, 0);
				this.initNode(this.value);
			},
			initNode(value){
				let parentIds = this.getAllParentId(value).reverse();
				
				this.treeList.forEach(x => {
					if (x.lv > 0) {
						x.show = false;
					}
					x.open = false; // parentIds.indexOf(x.id) == -1 ? false : true;
					x.checked = false;
				})
				if (!this.data.length) {
					return;
				}
				if (!this.inited) {
					this.initRootTreeData(this.data);
				}
				
				for (let i = 0; i < parentIds.length; i++) {
					let parentId = parentIds[i];
				
					this.treeList.forEach((item, index) => {
						if (item.id === parentId) {
							item.open = false;
							this.treeItemClick(item, index)
						}
					})
				}
			}
		},
		watch: {
			data(list) {
			/* 	console.log(list);
				console.log('data') */
				//if (this.inited) {
				  this.initRootTreeData(list);
				//}
			}
		},
		mounted() {
			//this.initRootTreeData(this.data)
		}
	}
</script>
<style lang="less" scoped>
	.vol-tree-container {
		position: fixed;
		/* 	top: 0rpx; */
		right: 0rpx;
		bottom: 0rpx;
		left: 0rpx;
		z-index: 9999;
		top: 360rpx;
		/* min-height: 500rpx; */
		transition: all 0.3s ease;
		transform: translateY(100%);
		background: #ffff;


		.vol-tree-item {

			font-size: 28rpx;
			color: #585858;
			height: 0;
			opacity: 0;
			//transition: 0.2s;
			position: relative;
			overflow: hidden;
			padding-left: 20rpx !important;
		}

		.vol-tree-item.checked {
			background: #f4f9ff;
		}

		.vol-tree-item.show {
			padding: 16rpx;
			//padding: 16rpx;
			height: 40rpx;
			opacity: 1;
		}

		.vol-tree-item-child {
			display: flex;

			.vol-tree-item-child-label {
				flex: 1;
			}
		}

		.tree-left-icon {
			width: 26rpx;
			height: 26rpx;
			margin-right: 8rpx;
		}

		.vol-tree-item-child-check {
			padding-left: 0 20rpx;
		}
	}

	.vol-tree-container.show {
		transform: translateY(0);
	}

	.vol-tree-mask {
		position: fixed;
		top: 0rpx;
		right: 0rpx;
		bottom: 0rpx;
		left: 0rpx;
		z-index: 9998;
		background-color: rgba(0, 0, 0, 0.6);
		opacity: 0;
		transition: all 0.3s ease;
		visibility: hidden;
	}

	.vol-tree-mask.show {
		visibility: visible;
		opacity: 1;
	}

	.vol-tree-header {
		// display: flex;
		// text-align: center;
		// position: relative;
		// padding: 0 26rpx;
		// border-bottom: 1px solid #f1f1f1;
		// padding: 24rpx;
		text-align: center;
		position: relative;
		border-bottom: 1px solid rgb(233 233 233);

		.vol-tree-header-title {
			// font-weight: bolder;
			// flex: 1;
			// padding: 30rpx 0;
			padding: 24rpx;
		}

		.vol-tree-header-confirm {
			position: absolute;
			right: 30rpx;
			height: 100%;
			top: 8rpx;
			color: #3495ff;
			padding-top: 20rpx;
			bottom: 0;
			font-size: 28rpx;
		}
	}
</style>
