<template>
  <div class="router-loading" style="background: #eeeeee5c;">
    <div class="spanner">
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      <span></span>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {};
  }
};
</script>
<style scoped>
.router-loading {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  font-size: 100px;
  text-align: center;
  padding-top: 200px;
  color: #808080;
  z-index: 9999;
}
.spanner {
  width: 80px;
  height: 80px;
  position: relative;
  margin: 0 auto;
}
.router-loading span {
  display: inline-block;
  width: 12px;
  height: 12px;
  border-radius: 50%;
  background: #04d2e7;
  position: absolute;
  animation: r_load 1.04s ease infinite;
}
@keyframes r_load {
  0% {
    transform: scale(1.2);
    opacity: 1;
  }
  100% {
    transform: scale(0.3);
    opacity: 0.5;
  }
}
.router-loading span:nth-child(1) {
  left: 0;
  top: 50%;
  margin-top: -10px;
  animation-delay: 0.13s;
}
.router-loading span:nth-child(2) {
  left: 14px;
  top: 14px;
  animation-delay: 0.26s;
}
.router-loading span:nth-child(3) {
  left: 50%;
  top: 0;
  margin-left: -10px;
  animation-delay: 0.39s;
}
.router-loading span:nth-child(4) {
  top: 14px;
  right: 14px;
  animation-delay: 0.52s;
}
.router-loading span:nth-child(5) {
  right: 0;
  top: 50%;
  margin-top: -10px;
  animation-delay: 0.65s;
}
.router-loading span:nth-child(6) {
  right: 14px;
  bottom: 14px;
  animation-delay: 0.78s;
}
.router-loading span:nth-child(7) {
  bottom: 0;
  left: 50%;
  margin-left: -10px;
  animation-delay: 0.91s;
}
.router-loading span:nth-child(8) {
  bottom: 14px;
  left: 14px;
  animation-delay: 1.04s;
}
</style>
