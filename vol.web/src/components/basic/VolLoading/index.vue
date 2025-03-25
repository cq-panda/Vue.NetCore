<template>
  <div :class="{ 'vol-spinner-center': center }">
    <div class="vol-spinner">
      <div class="rect1"></div>
      <div class="rect2"></div>
      <div class="rect3"></div>
      <div class="rect4"></div>
      <div class="rect5"></div>
    </div>
  </div>
</template>
<script setup lang="jsx">
const props = defineProps({
  center: {
    type: Boolean,
    default: false
  }
})
</script>
<style scoped lang="less">
.vol-spinner {
  /* width: 40px; */
  height: 35px;
  text-align: center;
  font-size: 12px;
}

.vol-spinner > div {
  background: #aed6f5;
  height: 100%;
  width: 6px;
  display: inline-block;
  margin: 0 3px;
  border-radius: 14px;
  -webkit-animation: sk-stretchdelay 1.2s infinite ease-in-out;
  animation: sk-stretchdelay 1.2s infinite ease-in-out;
}

.vol-spinner-center {
  background: #f7f7f7;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
  .vol-spinner > div {
    background: #189bff;
    width: 8px;
  }
}

.vol-spinner .rect2 {
  -webkit-animation-delay: -1.1s;
  animation-delay: -1.1s;
}

.vol-spinner .rect3 {
  -webkit-animation-delay: -1s;
  animation-delay: -1s;
}

.vol-spinner .rect4 {
  -webkit-animation-delay: -0.9s;
  animation-delay: -0.9s;
}

.vol-spinner .rect5 {
  -webkit-animation-delay: -0.8s;
  animation-delay: -0.8s;
}

@-webkit-keyframes sk-stretchdelay {
  0%,
  40%,
  100% {
    -webkit-transform: scaleY(0.4);
  }
  20% {
    -webkit-transform: scaleY(1);
  }
}

@keyframes sk-stretchdelay {
  0%,
  40%,
  100% {
    transform: scaleY(0.4);
    -webkit-transform: scaleY(0.4);
  }
  20% {
    transform: scaleY(1);
    -webkit-transform: scaleY(1);
  }
}
</style>
