<template>
  <div class="img-box">
    <img
      v-lazy="lazy"
      :data-src="src"
      src=""
      style="width: 500px;cursor: pointer;margin-bottom: 5px;"
      @load="loadImg"
      @error="error"
      alt=""
      @click="viewImg"
    />
    <slot v-if="slotShow"></slot>
    <slot name="err" v-if="!errFlag"></slot>
  </div>
</template>
<script>
export default {
  props: {
    src: {
      type: String,
      default: ""
    },
    // 是否懒加载
    lazy: {
      type: Boolean,
      default: false
    }
  },
  data() {
    return {
      slotShow: true,
      errFlag: true
    };
  },

  // 定义指令
  directives: {
    lazy: {
      inserted(el, { value }) {
        // 如果指令传过来得值是 false 就不做懒加载处理
        if (!value) return;
        // el.style.backgroundColor = '#f9ccd4'
        // const imgSrc = el.src;
        const imgSrc = el.dataset.src;
        // el.src = "";
        // 观察者
        const observer = new IntersectionObserver(([{ isIntersecting }]) => {
          // console.log(aaa[0].boundingClientRect.top,'这是个啥');
          // 如果元素出现在可视区域内，和离开可视区域的时候被触发
          if (isIntersecting) {
            // 出现在可视区域，再加载图片
            el.src = imgSrc;
            el.dataset.flag = true;
            // 停止观察
            observer.unobserve(el);
          }
        });
        // 开启观察（传入要观察的dom元素）
        observer.observe(el);
      }
    }
  },
  methods: {
    viewImg() {
      this.base.previewImg(
        (this.src || "").replace("?imageMogr2/thumbnail/!35p", "")
      );
    },
    loadImg() {
      this.slotShow = false;
    },
    error(e) {
      if (!e.srcElement.dataset.flag || !this.errFlag) return false;
      console.log(e.srcElement.src, "这加载错误了");
      // 这里我们就不给设置失败后的图片了，留给使用者自行设置样式
      // e.srcElement.src = this.errorImg
      this.errFlag = false;
      this.slotShow = false;
    }
  }
};
</script>
<style lang="less" scoped>
.img-box {
  display: flex;
  position: relative;
  overflow: hidden;
}
img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
</style>
