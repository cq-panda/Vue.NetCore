import App from './App'

// #ifndef VUE3
import Vue from 'vue'
import uView from '@/uni_modules/uview-ui'
import common from './util/common.js'
import http from './util/http.js'
import store from './store'
Vue.prototype.$toast = function(message,duration) {
	uni.showToast({
		icon: "none",
		title: message,
		duration:duration||2000
	})
}

Vue.prototype.http=http;
Vue.prototype.$store = store;
Vue.use(uView)
Vue.config.productionTip = false;
Vue.prototype.base=common;
App.mpType = 'app'
const app = new Vue({
	...App
})
app.$mount()
// #endif

// #ifdef VUE3
import {
	createSSRApp
} from 'vue'
export function createApp() {
	const app = createSSRApp(App)
	return {
		app
	}
}
// #endif
