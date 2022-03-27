/**
 * 使用bindingx方案实现slider
 * 只能使用于nvue下
 */
// 引入bindingx，此库类似于微信小程序wxs，目的是让js运行在视图层，减少视图层和逻辑层的通信折损
const BindingX = uni.requireNativePlugin('bindingx')
// nvue操作dom的库，用于获取dom的尺寸信息
const dom = uni.requireNativePlugin('dom')
// nvue中用于操作元素动画的库，类似于uni.animation，只不过uni.animation不能用于nvue
const animation = uni.requireNativePlugin('animation')

export default {
	data() {
		return {
			// bindingx的回调值，用于取消绑定
			panEvent: null,
			// 标记是否移动状态
			moving: false,
			// 位移的偏移量
			x: 0,
			// 是否正在触摸过程中，用于标记动画类是否添加或移除
			touching: false,
			changeFromInside: false
		}
	},
	watch: {
		// 监听vlaue的变化，此变化可能是由于内部修改v-model的值，或者外部
		// 从服务端获取一个值后，赋值给slider的v-model而导致的
		value(n) {
			if (!this.changeFromInside) {
				this.initX()
			} else {
				this.changeFromInside = false
			}
		}
	},
	mounted() {
		this.init()
	},
	methods: {
		init() {
			this.getSliderRect()
		},
		// 获取节点信息
		// 获取slider尺寸
		getSliderRect() {
			// 获取滑块条的尺寸信息
			// 通过nvue的dom模块，查询节点信息
			setTimeout(() => {
				dom.getComponentRect(this.$refs['slider'], res => {
					this.sliderRect = res.size
					this.initX()
				})
			}, 10)
		},
		// 初始化按钮位置
		initButtonStyle({
			barStyle,
			buttonWrapperStyle
		}) {
			this.barStyle = barStyle
			this.buttonWrapperStyle = buttonWrapperStyle
		},
		emitEvent(event, value) {
			this.$emit(event, value ? value : this.value)
		},
		formatStep(value) {
			// 移动点占总长度的百分比
			return Math.round(Math.max(this.min, Math.min(value, this.max)) / this.step) * this.step
		},
		// 滑动开始
		onTouchStart(e) {
			// 阻止页面滚动，可以保证在滑动过程中，不让页面可以上下滚动，造成不好的体验
			e.stopPropagation && e.stopPropagation()
			e.preventDefault && e.preventDefault()
			if (this.moving || this.disabled) {
				// 释放上一次的资源
				if (this.panEvent?.token != 0) {
					BindingX.unbind({
						token: this.panEvent.token,
						// pan为手势事件
						eventType: 'pan'
					})
					this.gesToken = 0
				}
				return
			}

			this.moving = true
			this.touching = true

			// 获取元素ref
			const button = this.$refs['nvue-button'].ref
			const gap = this.$refs['nvue-gap'].ref

			const {
				min,
				max,
				step
			} = this
			const {
				left,
				width
			} = this.sliderRect

			// 初始值为本次偏移量x，加上次停止滑动时的结束值
			let exporession = `(${this.x} + x)`
			// 将偏移的x值，转为总位移的百分比值，为了和min和max进行判断
			exporession = `(${exporession} / ${width}) * 100`
			if (step > 1) {
				// 如果step步进大于1，需要跳步，所以需要使用Math.round进行取整
				exporession = `round(max(${min}, min(${exporession}, ${max})) / ${step}) * ${step}`
			} else {
				// 当step=1时，无需跳步，充分利用bindingx性能，滑块实时跟随手势，达到丝滑的效果
				exporession = `max(${min}, min(${exporession}, ${max}))`
			}
			// 将百分比最后转化为对应的px值
			exporession = `${exporession} / 100 * ${width}`
			// 最大值不允许超过轨迹的宽度
			const {
				sliderWidth
			} = this.sliderRect
			exporession = `min(${sliderWidth}, ${exporession})`
			// 滑块点总是需要一个左偏移的值，为自身宽度的一半
			const buttonExpression = `${exporession} - ${this.blockHeight / 2}`
			// 阿里为了KPI而开源的BindingX
			this.panEvent = BindingX.bind({
				anchor: button,
				eventType: 'pan',
				props: [{
					element: gap,
					// 绑定width属性，设置其宽度值
					property: 'width',
					expression
				}, {
					element: button,
					// 绑定width属性，设置其宽度值
					property: 'transform.translateX',
					expression: buttonExpression
				}]
			}, (e) => {
				if (e.state === 'end' || e.state === 'exit') {
					// 
					this.x = uni.$u.range(0, left + width, e.deltaX + this.x)
					// 根据偏移值，得出移动的百分比，进而修改双向绑定的v-model的值
					const value = (this.x / width) * 100
					const percent = this.formatStep(value)
					// 修改value值
					this.$emit('input', percent)
					// 标记下一次触发value的watch时，这个值的变化，是由内部改变的
					this.changeFromInside = true
					this.moving = false
					this.touching = false
				}
			})
		},
		// 从value的变化，倒推得出x的值该为多少
		initX() {
			const {
				left,
				width
			} = this.sliderRect
			// 得出x的初始偏移值，之所以需要这么做，是因为在bindingX中，触摸滑动时，只能的值本次移动的偏移值
			// 而无法的值准确的前后移动的两个点的坐标值，weex纯粹为阿里巴巴的KPI(部门业绩考核)产物，也就这样了
			this.x = this.value / 100 * width
			// 设置移动的值
			const barStyle = {
				width: this.x + 'px'
			}
			// 按钮的初始值
			const buttonWrapperStyle = {
				transform: `translateX(${this.x - this.blockHeight / 2}px)`
			}
			this.initButtonStyle({
				barStyle,
				buttonWrapperStyle
			})
		}
	}
}
