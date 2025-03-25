import store from '@/store/index'
const setItem = (key, obj) => {
	store.getters.data()[key] = obj
}
const getItem = (key) => {
	const obj = store.getters.data()[key];
	return obj;
}