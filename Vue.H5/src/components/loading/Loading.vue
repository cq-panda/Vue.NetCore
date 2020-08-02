<template>
  <div v-if="show" class="loading-spinner" style=" position: fixed">
    <div class="loading-spinner-box">
      <div class="ani-box1"></div>
      <div class="ani-box2"></div>
    </div>
    <div class="loading-spinner-mask"></div>
  </div>
</template>
  <script>
export default {
  name: "Loading",
  props: {
    show: Boolean
  },
  data() {
    return {};
  }
};
</script>
  <style scoped>
.loading-spinner {
  width: 100%;
  height: 100%;
  z-index: 9999;
  top: 0;
  background: #dedede29;
}
.loading-spinner .loading-spinner-box {
  transform: translateY(-50%);
  top: 45%;
  position: absolute;
  margin: 0 auto;
  left: 0;
  width: 35px;
  right: 0;
}

.loading-spinner .loading-spinner-box > div {
  height: 8px;
  width: 8px;
  border-radius: 50%;
  background: #03a9f4;
  float: left;
  margin: 4px;
}

.loading-spinner .loading-spinner-mask {
  position: fixed;
  width: 100%;
  height: 100%;
  background: white;
  opacity: 0;
}

.ani-box1 {
  animation: slider1 0.5s infinite alternate;
}

.ani-box2 {
  animation: slider2 0.5s 0.2s infinite alternate;
}

@keyframes slider1 {
  0% {
    /* top:0; */
  }

  50% {
    /* background: chocolate; */
  }

  100% {
    background: #2196f3;
    transform: translate(0%, 5px);
  }
}

@keyframes slider2 {
  0% {
    /* top:0; */
  }

  50% {
    /* background: chocolate; */
  }

  100% {
    background: #2196f3;
    transform: translate(0%, 5px);
  }
}
</style>

