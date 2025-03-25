import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)
let app_user_token = "app_user_token";

function getUserInfo(state) {
	if (state.userInfo) return state.userInfo;
	let userInfo = uni.getStorageSync(app_user_token);
	if (userInfo) {
		state.userInfo = JSON.parse(userInfo);
	}
	return state.userInfo;
}
const store = new Vuex.Store({
	state: {
		test: '',
		permission: [],
		userInfo: null
	},
	mutations: {
		setCountInc(state, value) {
			state.test = value;
		},
		setPermission(state, data) { //调用方式 this.$store.commit('setPermission', data)
			if (!data || typeof data != 'object') return;
			if (data instanceof Array) {
				state.permission.push(...data);
			} else {
				state.permission = data;
			}
		},
		setUserInfo(state, data) {
			state.userInfo = data;
			uni.setStorageSync(app_user_token, JSON.stringify(data));
		},
		clearUserInfo(state) {
			state.permission = [];
			state.userInfo = null;
			uni.clearStorage(app_user_token);
		},
	},
	actions: {
		setPermission(context, data) {
			context.commit('setPermission', data); //调用方式 store.dispatch('push')
		},
	},
	getters: {
		test(state, getters) {
			return state.test
		},
		getPermission: (state) => (path) => { //调用方式 store.getters.getPermission('sys_User')
			if (!path) return state.permission;
			return state.permission.find(x => x.path == path);
		},
		getMenu: (state) => () => {
			return state.permission || [];
		},
		getUserInfo: (state) => () => {
			getUserInfo(state);
			return state.userInfo;
		},
		getUserName: (state) => () => {
			getUserInfo(state);
			if (state.userInfo) {
				return state.userInfo.userName;
			}
			return '未获取到登陆信息';
		},
		getToken: (state) => () => {
			getUserInfo(state);
			if (state.userInfo) {
				return 'Bearer ' + state.userInfo.token;
			}
			return '';
		},
		isLogin: (state) => () => {
			if (getUserInfo(state)) {
				return true;
			}
			return false;
		}
	}
})
export default store
