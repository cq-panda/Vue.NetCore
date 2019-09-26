<template>
  <div class="demo-page">
    <h2>Vue-nice-loading Demo</h2>
    <div class="loading-wrap">
      <div class="loading-item">
        <button @click="showDefault">显示默认loading</button>
      </div>
      <div class="loading-item">
        <button @click="showDelay">1s后显示</button>
      </div>
      <div class="loading-item">
        <button @click="showText">显示文字</button>
      </div>
    </div>
    <div class="loading-wrap">
      <div class="login-item"></div>
      <div :class="['loading-item', item.type]" v-for="(item, index) in types" :key="index">
        <button @click="showLoading(item)">显示type: {{ item.type }}</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'app',
  data () {
    return {
      types: [
        { type: 'audio', background: '#1ABC9C'},
        { type: 'rings', background: '#34495E'},
        { type: 'grid', background: '#F39C12'},
        { type: 'hearts', background: '#9B59B6'},
        { type: 'oval', background: '#3498DB'},
        { type: 'three-dots', background: '#E74C3C'},
        { type: 'spinning-circles', background: '#2ECC71'},
        { type: 'puff', background: '#2C3E50'},
        { type: 'circles', background: '#F1C40F'},
        { type: 'tail-spin', background: '#8E44AD'},
        { type: 'bars', background: '#2980B9'},
        { type: 'ball-triangle', background: '#E74C3C'}
      ]
    }
  },
  methods: {
    showDefault () {
      let loading = this.$loading();
      setTimeout(() => {
        loading.close();
      }, 2000)
    },
    showDelay () {
      let loading = this.$loading({
        delay: 1000
      });
      setTimeout(() => {
        loading.close();
      }, 3000)
    },
    showText () {
      let loading = this.$loading({
        text: 'Loading...'
      });
      setTimeout(() => {
        loading.close();
      }, 2000)
    },
    showLoading (data) {
      this.$loading({
        target: `.${data.type}`,
        type: data.type,
        background: data.background
      });
    }
  }
}
</script>