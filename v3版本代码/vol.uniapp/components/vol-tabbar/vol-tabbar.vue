<template>

	<u-tabbar @change="onChange" activeColor="rgb(0 161 252)" :zIndex="99999" :value="index" :placeholder="false"
		:fixed="true">
		<u-tabbar-item text="首页" icon="home" :name="0"></u-tabbar-item>
		<u-tabbar-item text="菜单" icon="grid" :name="1"></u-tabbar-item>
		<u-tabbar-item text="统计" icon="file-text" :name="2"></u-tabbar-item>
		<u-tabbar-item text="消息" icon="bell" :name="3"></u-tabbar-item>
		<u-tabbar-item text="我的" icon="account" :name="4"></u-tabbar-item>
	</u-tabbar>
</template>

<script>
	export default {
		props: {
			index: {
				type: Number,
				default: 0
			},
		},
		name: "vol-tabbar",
		data() {
			return {
				list: [
					"/pages/home/home",
					"/pages/menu/menu",
					"/pages/form/form",
					"/pages/message/message",
					"/pages/user/user"
				]
			};
		},
		methods: {
			onChange(nameIndex) {
				uni.switchTab({
					url: this.list[nameIndex]
				})
			}
		}
	}
</script>

<style>

</style>
